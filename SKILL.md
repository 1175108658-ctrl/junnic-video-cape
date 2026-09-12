---
name: junnic-video-cape
description: "Analyze a local MP4 shot by shot and write a copy-ready Chinese Seedance 2.5 image-to-video prompt with reference-image binding, chronological 30-second blocks, dialogue ownership, camera grammar, continuity, and visible emotional micro-actions. Apply when a user uploads or names a local video and asks for the same Junnic video cape analysis."
---

# Junnic Video Cape

Use this skill for local MP4/MOV reconstruction into a directly pasteable Seedance 2.5 prompt. The deliverable is a new Markdown artifact containing only the pasteable prompt blocks. Give the concise source-analysis summary in chat and store calibration evidence in the iteration log, never inside the pasteable artifact. Keep source observations separate from creative wording, and state the inspection scope when frame-by-frame generation has not been performed.

## Probe The Source

1. Resolve the exact local path and verify existence.
2. Run `ffprobe` for duration, dimensions, frame rate, codecs, and audio presence.
3. Use the installed local-video analysis workflow to prepare the video, extract numbered keyframes/contact sheets, inspect hard-cut candidates and boundary frames, and transcribe Mandarin dialogue. CPU transcription is an acceptable fallback when the GPU runtime lacks a required library.
4. Build a chronological beat map. Record scene, time of day, lighting, fixed furniture, props, camera size, camera movement, speaker, exact or lightly normalized dialogue, and the visible reaction after each line.
5. Before drafting prose, create two sheets: a locked source-fact sheet with weather, time of day, number of supplied references, role mapping, relationship names, exact numeric facts, and every hard-cut destination; and a user-creative-change sheet for intentional rewrites. A source fact remains provisional until a frame or clearly audible line supports it. A user-authored change stays labeled as a creative override and is not reported as an observed source fact.

## Build The Prompt

- Create a new artifact; preserve earlier round files and logs.
- Use the source's original playback order. Treat blank lines as independent generation submissions.
- Enforce the approved output contract on every block. Start with `对应这个视频使用X张人物参考图，角色均为原创虚构的成年人物...`, list each active reference mapping inline, continue directly with the complete scene description and continuity, add the clean-frame wording, then write exactly one continuous `【画面内容】` paragraph. The whole block is self-contained.
- The pasteable artifact contains no title, source-analysis section, usage notes, settings, global preamble, block heading, calibration record, or prose outside the independent prompt blocks. Put those materials in chat or the iteration log.
- Do not place a global reference declaration in its own paragraph. Repeat the full declaration inside every independent block, including later blocks, because each blank-line-separated block is submitted by itself.
- Fill each block toward the Seedance 2.5 generation capacity of about 30 seconds. Use the minimum block count required by the source duration. Treat a container duration up to about one second beyond a 30-second multiple as boundary tolerance when the complete closing beat still belongs in the same submission; for example, an accepted 30.386-second dialogue remains one block rather than creating a nearly empty second block. Move a boundary earlier only to finish a complete line, gesture-response pair, hard cut, location change, or dramatic beat. A final remainder block may be shorter.
- Keep visible timestamps, percentages, block labels, shot numbers, and timing tables out of the copy-ready prompt.
- Repeat the complete reference-image binding and active scene continuity at the start of every independent block. Use exactly the number of supplied reference images that the source and user setup require; never add a third reference merely because a background or supporting role appears. Use the user's labels such as A/B/C/D for reference images; when the user has supplied or requested A/B labels, write the literal labels `参考图A` and `参考图B` in every independent block and never silently convert them to `参考图一/二`, `女方/男方`, or other positional labels. Keep source dialogue names and relationships as observed, and do not invent names from prior rounds.
- State that referenced characters are original fictional adults and keep identity, clothing, hairstyle, body position, phone/props, lighting, and eyelines continuous across cuts. Background extras use no additional character references unless the user supplies them.
- Put one continuous `【画面内容】` paragraph in each block. Order each unit as shot and composition, visible action or microexpression, eyeline/posture/breath, delivery tone, exact dialogue, and the reaction or transition that motivates the next cut.
- Prioritize renderable emotional evidence: brow and eyelid changes, gaze direction, blinking, mouth corners, jaw tension, breath interruptions, hand pressure, shoulder release, interrupted movement, physical distance, delayed reactions, and held silence. Attach every detail to the shot where it is visible.
- Preserve hard cuts, shot-reverse-shot ownership, inserts, screen point of view, and prop handoffs. Assign dialogue from mouth movement and adjacent reaction frames, not subtitle placement alone. Keep music lyrics separate from spoken dialogue.
- Match source time of day, weather, color temperature, and spatial layout exactly unless the user explicitly requests a creative override. When an override exists, carry it through all affected blocks and label it in the analysis as user-authored. Exclude subtitles, text overlays, platform UI, watermarks, and brand marks from the generated frame.
- Preserve Mandarin lip sync, clean frame, natural pauses, reaction silence, and the source media grammar. Match the observed live-action, anime, 3D/CG, phone-video, or polished short-drama texture instead of converting every source to live action.

## Accuracy Corrections From User-Reviewed Rounds

- Treat weather as a continuity lock within whichever layer owns it. If rain is observed in the source, preserve it; if the user adds rain as a creative override, carry wet road, overcast light, rain behavior, and damp clothing through every affected exterior and graveyard block.
- Numeric dialogue details are high-priority source facts. Recheck years, amounts, names, titles, and relationship labels against the inspected mouth-synced line before writing them.
- Separate character identity from scene function. A supporting man may be the same reference-bound person across a cemetery and office, while the young man from the car may not appear in later blocks. Bind references to the user's actual set, not to an automatically inferred cast list.
- Mark internal monologue as internal monologue. Use camera POV, eyeline, and voice treatment such as `心中喃喃自语` only when the source presents the line that way; do not convert it into an on-camera spoken exchange.
- Record deceptive or performative behavior explicitly when visible. A fake concern, fake farewell, delayed eye-line, annoyed scratch, or restrained reaction is an action beat, not a generic neutral reply.
- Preserve the exact camera grammar around reveals: subject POV, over-shoulder direction, simultaneous exit-and-exterior cut, reaction inserts from surrounding mourners, object insertion or throw, and the final line spoken during physical removal.
- When a user supplies a corrected prompt, classify each changed item first: source correction, user-authored creative override, format preference, or dialogue cleanup. Add that classification to the appropriate sheet and revise the workflow only for the matching category; do not treat every wording change as evidence about the source video.

## Story-Bearing Atmosphere

- Add story feeling after the concrete spatial setup, never instead of it. First state room, light, furniture, character positions, props, and camera; then add one concise visual sentence describing the social energy or narrative attitude of the moment.
- Keep story feeling visually actionable. Prefer posture, eyeline, distance, prop handling, and a concrete social role over an unsupported abstract label such as a generic claim that a character simply has story feeling.
- Make the atmosphere arise from posture, distance, gaze, prop handling, silence, and the contrast between public role and private emotion. A mediator can remain professionally calm while watching an absurd argument; a character can present a self-serving account with total conviction; a couple can sit close while narratively occupying two incompatible versions of the same event.
- Use one or two story-bearing sentences per scene beat. Do not let atmosphere overwrite exact dialogue, microexpressions, hand actions, reaction shots, or camera ownership.
- Mark atmosphere as creative prompt language, not as a claim about hidden author intent. Keep observed source facts and user-requested dramatic flavor in separate notes.

## Round 6 Calibration

- Story-bearing language should be brief and attached to the scene's social situation: formal mediation, confident self-justification, defensive sincerity, or a mediator's restrained deadpan. Use it to give the space narrative pressure, then return immediately to visible posture, gaze, gesture, and dialogue.
- The user may designate a supporting role as system-generated rather than reference-bound. In that case, state the actual uploaded reference count clearly, bind only the supplied images, and describe the generated role's continuity through clothing, position, and behavior.
- Use the user's revised dialogue and numeric details as the active generation version when they are intentional prompt edits. Keep a separate note that they are adaptations instead of silently presenting them as raw source transcription.
- Camera ownership is written explicitly before each line: name the viewing character or over-shoulder direction, then the visible speaker, then the reaction. A room-wide establishing frame can reset the spatial grammar before the next close-up.
- Props can carry the joke or reveal. Documents, microphones, pen marks, and a character's hand position should be placed in the frame before the line that gives them narrative meaning.

## Round 8 Calibration

- A user may supply a scene reference image alongside character references. Bind it explicitly as a scene/layout reference, and keep the character-reference count separate from the scene-reference count.
- A strong opening may begin on a character close-up or prop action instead of a wide establishing frame. Establish the room through the visible desk, bed, window, lamp, files, or other fixed elements inside that first shot.
- Preserve off-screen dialogue and voice-over when the source or user prompt places the speaker outside the current frame. State the visible listener's reaction and the audio source separately.
- Combine an action with the line it motivates when they occur as one beat, such as a doctor touching an abdomen while asking the follow-up question. Avoid splitting one physical action into unrelated prose units.
- Do not append a new reaction or punchline after the user's selected endpoint. End on the exact visible state the user chose, even when an earlier draft contained an additional closing beat.
- When the user revises dialogue, amount, height, time, role, or prop behavior for generation, use that revised version in the active copy-ready prompt and retain the source/adaptation classification in the analysis record.

## Round 9 Calibration: Montage And Capacity

- Classify the editorial form before writing the beat map: single-scene dialogue, intercut dialogue, day-in-the-life montage, insert-heavy product or pet sequence, or recorded-screen material. A fast lifestyle diary may contain many hard cuts while still being one chronological story arc.
- Treat automatic scene candidates as evidence of visual changes only. They are not generation boundaries. First group adjacent cuts into narrative units such as morning routine, car banter, prank, gift exchange, pet care, and dinner; then fit the minimum number of independent submissions required by the source duration.
- Calculate the provisional 30-second block count from source duration, then apply the one-second boundary tolerance for container tails and complete closing beats. For a source close to an exact multiple, keep each rolling block near capacity and let a boundary cross a short insert when that preserves the complete joke, line, reaction, or daily-routine unit. A hard cut or location change by itself is not a reason to start a new block.
- In a montage block, write a compact chain of executable beats in playback order: framing and camera position, visible action, prop continuity, expression or body reaction, then spoken line only when mouth movement or reliable audio supports it. Preserve the rapid rhythm instead of forcing every cut into shot-reverse-shot dialogue.
- Audit the first seconds independently before drafting the first block. Record the initial empty or occluded frame, the exact reveal mechanism, the first subject's entry direction, and the first interaction. Never replace a curtain reveal, door opening, object uncovering, or side-entry choreography with a generic two-person opening.
- When a character enters from off-screen, specify screen side, travel direction, body rotation or turn, where the character stops, and the final relation to the already visible subject. Entry choreography is a story beat and must survive into the prompt.
- Inspect the first three seconds of every independent block at 4 to 8 frames per second, not only the beginning of the source. Lock the exact first-frame state, every hidden-to-visible transition, simultaneous entry, and the first stable staging relation before drafting that block.
- Build a cut ledger before prose. Give every hard cut and story-bearing insert a row containing source timestamp, first-frame state, location, active characters, per-shot wardrobe, entry or exit side, camera size, prop owner and prop state, visible action, verified dialogue owner, reaction, and next transition. A dense contact sheet supplements this ledger; it does not replace it.
- Preserve pre-action and setup frames. If a shot begins on closed curtains and then reveals a person, write closed curtains first. If a character is initially absent and rotates in from the left, do not begin with both people already standing together. Apply the same rule to door openings, sitting down, standing up, picking up a prop, costume changes, and travel inserts.
- Track wardrobe by cut instead of assigning one outfit to an entire montage block. A rapid montage may place the same reference-bound person in sleepwear, sportswear, a headband, leg covers, or an apron within one submission. State each change at its hard cut and preserve continuity only inside the corresponding shot sequence.
- Track prop ownership as a directed handoff. Record who introduces, holds, gives, receives, wears, or removes the prop. Recheck gifts, phones, bags, cups, tools, pets, and wearable devices against adjacent frames so the prompt does not reverse the giver and receiver or turn a wearable item into an impact prop.
- After drafting, run a source-to-prompt coverage audit. Map every cut-ledger row to one explicit sentence or action unit in the prompt. Any unmatched reveal, entrance, exit, wardrobe change, travel insert, setup action, prop transfer, reaction, or endpoint must be added or deliberately classified as a non-story graphic exclusion.
- Apply a dialogue omission guard after every action trigger. For each slap, touch, reveal, prop handoff, sudden turn, or visible reaction, inspect the following 1.5-2 seconds at dense spacing and record the first speaker, exact line, mouth movement, facial response, and the next reply. Reconcile ASR with source captions, audio, and visible mouth movement; an ASR segment that starts on a later sentence is an incomplete evidence record, not proof that the earlier response is absent.
- Maintain a dialogue coverage matrix alongside the cut ledger: one row for every spoken beat, including short first replies, interjections, repeated lines, and off-screen speech. Map each row to an explicit prompt action and speaker before delivery; any unmatched row blocks completion.
- Reinspect the last three seconds of every independent block at dense spacing. The written endpoint must match the source state at that boundary, and the next block must restate a playable opening state rather than assuming the generator remembers the previous submission.
- Separate three layers whenever on-screen text appears: source graphic or time card, audible speech, and visible action. Exclude the graphic from the generated frame, retain its semantic time-of-day change only when it affects continuity, and never assign a subtitle or title to a character without mouth or audio evidence.
- For noisy or weak transcription, privilege visible action and clearly intelligible phrases. Use a short natural paraphrase only when the exact wording is uncertain, and mark the line as adapted in the analysis sheet rather than presenting it as a verified quote.
- Lock the supplied human references separately from generated supporting subjects. A pet, background extra, product package, or furniture prop is generated from the written continuity description unless the user supplied a reference image for it. Keep the same species, color, size, placement, and behavior across every block where it recurs.
- Preserve the source media grammar. For vertical live-action social-video material, keep 9:16 framing, handheld or fixed-phone height, ordinary home lighting, quick inserts, and direct-to-camera energy. Do not turn a casual montage into a polished cinematic scene unless the user asks for that creative override.
- Add story-bearing atmosphere once per narrative unit after the concrete layout. Describe the social energy through an observable contrast such as a couple treating household chores as a playful power contest, a performative gift reveal, or a husband using pet care to compete for attention. Return immediately to renderable action, expression, eyeline, and dialogue.
- Maintain a calibration loop until the user says the iteration is finished. Keep the source-fact sheet, creative-override sheet, and user-feedback classification for every new round; update the skill only from repeated or clearly demonstrated failures, and preserve earlier round artifacts.

## Accepted Baseline From Round 11

- A short source may contain a major location change and still remain one independent block. Keep a night-car argument and its bright-living-room resolution together when the source is approximately one generation capacity and the second scene completes the same dramatic beat.
- For a dialogue-led source, write every short reply, interjection, split clause, and final question into the dialogue coverage matrix before prose. The accepted 30.386-second baseline retained 19 spoken beats and ended on the source's unanswered question rather than inventing a response.
- Carry appearance and wardrobe state across a location cut only when the frames support continuity. Avoid wording that implies a costume change when the characters simply move to a new location.
- Describe relationship energy through observable staging: a driver looking forward while a passenger turns suspicious, crossed arms after an argument, a glasses adjustment before answering, shoulders releasing on acceptance, or a pointing finger that turns reconciliation into another challenge.
- Match animation or CG sources as animation or CG. The clean-frame rule removes source subtitles and platform overlays without erasing the source's visual medium.

## Deterministic Validation

After drafting the pasteable artifact, run `scripts/validate_prompt.ps1`. Supply the expected block count, reference count, and a UTF-8 dialogue checklist containing one required spoken beat per line when the source has dialogue:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/validate_prompt.ps1 -PromptPath PATH -ExpectedBlocks 1 -ExpectedReferences 2 -DialogueChecklistPath DIALOGUE_FILE
```

Treat any reported error as a completion blocker. This script validates the pasteable contract and exact dialogue presence; visual coverage still requires the cut-ledger and dense-frame review.

## Quality Check

Before delivery, confirm:

- The source duration and block count are recorded in the analysis, while the prompt itself has only blank-line boundaries.
- Each block can start independently with its own reference binding, location, light, characters, props, and opening camera state.
- No block divides a sentence, a gesture-response pair, or a reveal that fits within the same capacity window.
- Every important emotional turn has a visible action or expression, rather than a psychological explanation alone.
- Dialogue speaker, source names, relationships, scene order, day/night state, and prop continuity agree with the inspected media.
- Weather layer (source or creative override), numeric facts, reference count, internal-versus-spoken delivery, deceptive behavior, and reveal camera direction have each received an explicit verification pass.
- The final artifact is linked with its absolute filesystem path and the verification scope is stated.
- The editorial form is named in the analysis, automatic hard cuts are not mistaken for submission boundaries, and the minimum block count follows the source duration plus the documented one-second boundary tolerance.
- For montage material, every block contains a complete chain of visible beats, while graphic text, spoken dialogue, and inferred story meaning remain separate.
- Every cut-ledger row has a matching prompt action, every block's first and last three seconds were densely inspected, and wardrobe changes plus prop handoffs agree with the source frames.
- Every action-triggered reply has been checked in the 1.5-2-second post-action window against at least two of ASR, source caption, audio, and visible mouth movement; the dialogue coverage matrix has no unmatched spoken beat.
