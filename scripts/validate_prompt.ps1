param(
    [Parameter(Mandatory = $true)]
    [string]$PromptPath,

    [Parameter(Mandatory = $true)]
    [ValidateRange(1, 100)]
    [int]$ExpectedBlocks,

    [Parameter(Mandatory = $true)]
    [ValidateRange(1, 26)]
    [int]$ExpectedReferences,

    [string]$DialogueChecklistPath
)

$ErrorActionPreference = 'Stop'
$errors = [System.Collections.Generic.List[string]]::new()

if (-not (Test-Path -LiteralPath $PromptPath -PathType Leaf)) {
    throw "Prompt file not found: $PromptPath"
}

$prompt = Get-Content -LiteralPath $PromptPath -Raw -Encoding UTF8
$blocks = @($prompt -split '(?:\r?\n){2,}' | Where-Object { $_.Trim().Length -gt 0 })

if ($blocks.Count -ne $ExpectedBlocks) {
    $errors.Add("Expected $ExpectedBlocks independent block(s), found $($blocks.Count).")
}

$forbiddenPatterns = [ordered]@{
    heading = '(?m)^\s*#{1,6}\s+'
    timestamp = '(?<!\d)\d{1,2}:\d{2}(?!\d)'
    percentage = '(?<!\d)\d+(?:\.\d+)?\s*%'
    shot_number = '(?:\u955c\u5934|\u573a\u666f)\s*[\u4e00-\u9fa5]+\s*(?:\u003a|\uff1a)'
}

$declarationPattern = '^\u5bf9\u5e94\u8fd9\u4e2a\u89c6\u9891\u4f7f\u7528[\u4e00-\u9fa5\d]+\u5f20\u4eba\u7269\u53c2\u8003\u56fe'
$adultPattern = '\u89d2\u8272\u5747\u4e3a\u539f\u521b\u865a\u6784\u7684\u6210\u5e74\u4eba\u7269'
$identityPattern = @(
    '\u4e0d\u5bf9\u5e94\u4efb\u4f55\u73b0\u5b9e\u4eba\u7269',
    '\u4e0d\u53c2\u8003\u4efb\u4f55\u771f\u4eba\u8096\u50cf',
    '\u4e0d\u590d\u5236\u4efb\u4f55\u540d\u4eba\u7684\u8138\u90e8\u7279\u5f81'
)
$contentTagPattern = '\u3010\u753b\u9762\u5185\u5bb9\u3011'
$cleanFramePatterns = @('\u6392\u9664\u5b57\u5e55', '\u6c34\u5370', '\u5e73\u53f0\u754c\u9762')
$referenceLabels = @(
    [char]0x4e00, [char]0x4e8c, [char]0x4e09, [char]0x56db, [char]0x4e94,
    [char]0x516d, [char]0x4e03, [char]0x516b, [char]0x4e5d, [char]0x5341
)
$referenceRolePatterns = @(
    ([char]0x7537 + [char]0x4e3b + 'A'),
    ([char]0x5973 + [char]0x4e3b + 'B'),
    ([char]0x89d2 + [char]0x8272 + 'C'),
    ([char]0x89d2 + [char]0x8272 + 'D'),
    ([char]0x89d2 + [char]0x8272 + 'E'),
    ([char]0x89d2 + [char]0x8272 + 'F'),
    ([char]0x89d2 + [char]0x8272 + 'G'),
    ([char]0x89d2 + [char]0x8272 + 'H'),
    ([char]0x89d2 + [char]0x8272 + 'I'),
    ([char]0x89d2 + [char]0x8272 + 'J')
)

for ($index = 0; $index -lt $blocks.Count; $index++) {
    $blockNumber = $index + 1
    $block = $blocks[$index].Trim()

    if ($block -notmatch $declarationPattern) {
        $errors.Add("Block $blockNumber does not start with the full reference declaration.")
    }
    if ($block -notmatch $adultPattern) {
        $errors.Add("Block $blockNumber is missing the fictional-adult declaration.")
    }
    foreach ($pattern in $identityPattern) {
        if ($block -notmatch $pattern) {
            $errors.Add("Block $blockNumber is missing an identity exclusion.")
        }
    }
    if (([regex]::Matches($block, $contentTagPattern)).Count -ne 1) {
        $errors.Add("Block $blockNumber must contain exactly one content tag.")
    }
    foreach ($pattern in $cleanFramePatterns) {
        if ($block -notmatch $pattern) {
            $errors.Add("Block $blockNumber is missing a clean-frame exclusion.")
        }
    }

    for ($referenceIndex = 1; $referenceIndex -le $ExpectedReferences; $referenceIndex++) {
        if ($referenceIndex -le $referenceLabels.Count) {
            $referenceLabel = [string]$referenceLabels[$referenceIndex - 1]
        } else {
            $referenceLabel = [string]$referenceIndex
        }
        $referencePattern = '\u53c2\u8003\u56fe' + [regex]::Escape($referenceLabel)
        if ($block -notmatch $referencePattern) {
            $errors.Add("Block $blockNumber is missing reference mapping $referenceIndex.")
        }
        if ($referenceIndex -le $referenceRolePatterns.Count) {
            $rolePattern = [string]$referenceRolePatterns[$referenceIndex - 1]
            if ($block -notmatch $rolePattern) {
                $errors.Add("Block $blockNumber is missing role mapping $referenceIndex ($rolePattern).")
            }
        }
    }

    foreach ($entry in $forbiddenPatterns.GetEnumerator()) {
        if ($block -match $entry.Value) {
            $errors.Add("Block $blockNumber contains forbidden $($entry.Key) syntax.")
        }
    }
}

$dialogueCount = 0
if ($DialogueChecklistPath) {
    if (-not (Test-Path -LiteralPath $DialogueChecklistPath -PathType Leaf)) {
        throw "Dialogue checklist not found: $DialogueChecklistPath"
    }

    $dialogueLines = @(Get-Content -LiteralPath $DialogueChecklistPath -Encoding UTF8 | ForEach-Object { $_.Trim() } | Where-Object { $_.Length -gt 0 })
    $dialogueCount = $dialogueLines.Count
    foreach ($line in $dialogueLines) {
        if (-not $prompt.Contains($line)) {
            $errors.Add("Missing required dialogue: $line")
        }
    }
}

$result = [ordered]@{
    prompt = (Resolve-Path -LiteralPath $PromptPath).Path
    blocks = $blocks.Count
    expected_blocks = $ExpectedBlocks
    expected_references = $ExpectedReferences
    dialogue_lines_checked = $dialogueCount
    valid = ($errors.Count -eq 0)
    errors = @($errors)
}

$result | ConvertTo-Json -Depth 4
if ($errors.Count -gt 0) {
    exit 1
}
