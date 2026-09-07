---
name: junnic-video-cape
description: "Analyze a local MP4 shot by shot and write a copy-ready Chinese Seedance 2.5 image-to-video prompt with reference-image binding, chronological 30-second blocks, dialogue ownership, camera grammar, continuity, and visible emotional micro-actions. Apply when a user uploads or names a local video and asks for the same Junnic video cape analysis."
---

# Junnic Video Cape

Use this skill for local MP4/MOV reconstruction into a directly pasteable Seedance 2.5 prompt. The deliverable is a new Markdown artifact plus a concise source-analysis summary. Keep source observations separate from creative wording, and state the inspection scope when frame-by-frame generation has not been performed.

## Probe The Source

1. Resolve the exact local path and verify existence.
2. Run `ffprobe` for duration, dimensions, frame rate, codecs, and audio presence.
3. Use the installed local-video analysis workflow to prepare the video, extract numbered keyframes/contact sheets, inspect hard-cut candidates and boundary frames, and transcribe Mandarin dialogue. CPU transcription is an acceptable fallback when the GPU runtime lacks a required library.
4. Build a chronological beat map. Record scene, time of day, lighting, fixed furniture, props, camera size, camera movement, speaker, exact or lightly normalized dialogue, and the visible reaction after each line.
5. Before drafting prose, create two sheets: a locked source-fact sheet with weather, time of day, number of supplied references, role mapping, relationship names, exact numeric facts, and every hard-cut destination; and a user-creative-change sheet for intentional rewrites. A source fact remains provisional until a frame or clearly audible line supports it. A user-authored change stays labeled as a creative override and is not reported as an observed source fact.

## Build The Prompt

- Create a new artifact; preserve earlier round files and logs.
- Use the source's original playback order. Treat blank lines as independent generation submissions.
- Fill each block toward the Seedance 2.5 generation capacity of about 30 seconds. Use the minimum block count required by the source duration. Move a boundary earlier only to finish a complete line, gesture-response pair, hard cut, location change, or dramatic beat. A final remainder block may be shorter.
- Keep visible timestamps, percentages, block labels, shot numbers, and timing tables out of the copy-ready prompt.
- Repeat the complete reference-image binding and active scene continuity at the start of every independent block. Use exactly the number of supplied reference images that the source and user setup require; never add a third reference merely because a background or supporting role appears. Use the user's labels such as A/B/C/D for reference images; keep source dialogue names and relationships as observed, and do not invent names from prior rounds.
- State that referenced characters are original fictional adults and keep identity, clothing, hairstyle, body position, phone/props, lighting, and eyelines continuous across cuts. Background extras use no additional character references unless the user supplies them.
- Put one continuous `【画面内容】` paragraph in each block. Order each unit as shot and composition, visible action or microexpression, eyeline/posture/breath, delivery tone, exact dialogue, and the reaction or transition that motivates the next cut.
- Prioritize renderable emotional evidence: brow and eyelid changes, gaze direction, blinking, mouth corners, jaw tension, breath interruptions, hand pressure, shoulder release, interrupted movement, physical distance, delayed reactions, and held silence. Attach every detail to the shot where it is visible.
- Preserve hard cuts, shot-reverse-shot ownership, inserts, screen point of view, and prop handoffs. Assign dialogue from mouth movement and adjacent reaction frames, not subtitle placement alone. Keep music lyrics separate from spoken dialogue.
- Match source time of day, weather, color temperature, and spatial layout exactly unless the user explicitly requests a creative override. When an override exists, carry it through all affected blocks and label it in the analysis as user-authored. Exclude subtitles, text overlays, platform UI, watermarks, and brand marks from the generated frame.
- Preserve Mandarin lip sync, clean frame, natural pauses, reaction silence, and ordinary live-action short-drama texture.

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

## Quality Check

Before delivery, confirm:

- The source duration and block count are recorded in the analysis, while the prompt itself has only blank-line boundaries.
- Each block can start independently with its own reference binding, location, light, characters, props, and opening camera state.
- No block divides a sentence, a gesture-response pair, or a reveal that fits within the same capacity window.
- Every important emotional turn has a visible action or expression, rather than a psychological explanation alone.
- Dialogue speaker, source names, relationships, scene order, day/night state, and prop continuity agree with the inspected media.
- Weather layer (source or creative override), numeric facts, reference count, internal-versus-spoken delivery, deceptive behavior, and reveal camera direction have each received an explicit verification pass.
- The final artifact is linked with its absolute filesystem path and the verification scope is stated.
