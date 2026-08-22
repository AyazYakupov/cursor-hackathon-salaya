# Product brief

Locked as the starting point from the 22 August 2026 team recording.

A caretaker prepares photos, pills, and errands. A patient uses a simple tablet. The same reminder engine drives daily check-ins, medication, and family tasks.

## One sentence

A tablet for someone who needs care, and a control panel for the people who love them, so a photo, a pill, or an errand can turn into a check-in that the family can see.

## Users

| Role | Who | What they need |
| --- | --- | --- |
| Patient | The person with the tablet (e.g. Betty) | Large targets, few choices, something pleasant to look at, a clear prompt when it is time to respond |
| Caretaker | The person loading content and watching status | Fast logging, a queue they can preload, a way to make *today* relevant, a record that the check-in happened |
| Family member | Extra caretaker (e.g. Bob on pickup) | Only when they are the responsible party for an errand |

Primary user for the demo: the caretaker and the patient, in that order. The story is “family stays in the day,” not “admin configures a clinic.”

**Tenancy for this build:** one household, one patient. More than one caretaker is allowed if it stays cheap, because errands need a responsible person. Multiple families, multiple patients, and a public signup flow are out of scope.

**No login.** Both sides boot already in the demo household: one patient tablet, one caretaker panel. No signup, no password, no role switcher on stage.

## Two surfaces

### Patient tablet

Portrait, always on, built for a table across the room.

- **Default:** a quiet cycling slideshow of earlier photos. It should feel like a frame, not like an app.
- **Interrupt:** a check-in, pill, or errand takes over the slideshow.
- **Interaction:** huge tap targets. No dense chrome. Show who it is from (avatar + name), the photo, then a spoken or on-screen prompt.
- **After a response:** return to the slideshow. The completed item leaves the *active send queue* but is not deleted.

### Caretaker panel

A normal desktop or phone UI for the people running the household.

- Preload photos, captions, pills, and errands.
- See queue, priority, and whether today already has a relevant item.
- See status: sent, waiting, retrying, missed, escalated.
- Receive a notification when the patient finishes something, and when they do not.

## Shared reminder engine

Check-ins, pills, and errands are the same machine with different payloads.

1. Something is queued or scheduled.
2. At the right time it interrupts the tablet.
3. The patient has a response window (default 15–30 minutes, configurable). For the live demo, shorten this so a miss can be shown without waiting.
4. A single alarm is enough for the demo. A gradual alarm is nicer later.
5. If they complete it, log it and notify the caretaker.
6. If they do not, follow the escalation order below.

## Escalation order

This is the miss path. It is part of the product, not a footnote.

1. **Interrupt the patient.** Check-in, pill, or errand takes over the tablet.
2. **Retry the patient** if they do not respond. Same item, another alarm / spoken nudge: *“This is your reminder. Please check your tablet.”*
3. Repeat until a configured miss count is reached (default 2 retries after the first interrupt; make it 1 retry on stage).
4. **Then call the caretaker.** Do not stop at a status badge. Someone who can help must feel it on their phone.

The caretaker ping for the demonstration is a **Trello notification**. Create or move a card when the miss count is hit so the presenter’s phone buzzes in the room. That is the proof, not a slide about “we could notify you.”

Do not wait the full window on stage. Use a demo control to fire the next retry or to skip straight to caretaker escalation.

## Phone ping (Trello)

Trello is the integration we actually wire for the demo, because it already pings a phone.

| Event | What Trello does |
| --- | --- |
| Patient completes a check-in or pill | Optional card comment / “done” move. Nice, not required. |
| Patient misses N times | **Required.** New or moved card the caretaker’s Trello app will notify on. |
| Errand assigned to Bob | Card for the responsible person, if P2 is in the demo. |

Board is pre-made. App notifications on. Rehearse the buzz before going on stage.

## Voice

Spoken caption and spoken prompt make the tablet feel like a person, not a form.

| Level | What | For this build |
| --- | --- | --- |
| Device speech | Caption + “How are you today?” read out loud | Do this if it is cheap (browser TTS is enough) |
| Dictation | Whisper / Wispr-style speech-to-text so a caretaker can speak a caption, or the patient can speak a reply | Nice if it is already easy |
| Voice clone | Local or hosted model that sounds like the family member | Stretch only. Skip unless it is free and already working. Do not block the demo on it. |

## Feature 1 — Daily photo check-in

The core loop. Build this first.

Caretakers preload photos: a place they went, a picture of people together, anything they want. Each photo can have a **caption**. That caption is the spoken/shown message for that photo and overrides any generic caption. The **app still supplies a prompt to respond**, so a caption-only photo is never a dead end.

Example beat:

1. Slideshow is running.
2. Today’s photo arrives and interrupts: “Here’s your check-in.”
3. Patient taps.
4. They see the sender’s avatar, the photo, and hear the caption.
5. The app asks something like “How are you today?”
6. They respond.
7. The photo leaves the active queue. History keeps it.

### Queue rules

- Caretaker can load many photos at once, or add one on any day.
- If nobody does anything today, the system still sends the next queued photo.
- If someone *did* do something today, they can **prioritize** that photo so today’s send stays relevant.
- A finished check-in is not reused until the caretaker puts it back.

### Prompt vs caption

| Layer | Who writes it | Role |
| --- | --- | --- |
| Caption | Caretaker, optional, per photo | What this picture is about. Spoken with the image. |
| Response prompt | The app | Always present. Asks the patient to check in (e.g. “How are you today?”). |

Do not let a custom caption replace the need to answer.

## Feature 2 — Pill reminders

Same engine, medication payload.

- Caretaker sets a time and one or more pill items.
- Each item can be its own photo, or one photo of the whole clump. Number of fields is the number of taps required.
- At the time, the tablet alerts and shows the pill photo(s).
- Patient taps each pill, then **Done**.
- Caretaker is notified. The app keeps a log.

## Feature 3 — Errands

Same engine, a task with a responsible person.

Used for doctor visits, pickups, “please be ready,” and other household logistics.

- An errand has a time, patient-facing copy, and a **responsible party**.
- **Reminder only:** ping the patient (e.g. “Grandma, remember your appointment”).
- **Hand-off:** patient is pinged to get ready; Bob is pinged to do the pickup. Each side can have its own notify-ahead time (travel time for Bob, 15 minutes for the patient, or whatever is set).
- This is the reason to allow more than one caretaker user on day one, if it does not slow the check-in demo.

## Must-haves for the demo

In order. Stop adding types when the first loop is not reliable.

| Priority | Capability | Done when |
| --- | --- | --- |
| P0 | Photo check-in | Caretaker queues/prioritizes a photo; tablet slideshow interrupts; patient responds; caretaker sees the log |
| P0 | Miss → caretaker phone | After N misses, a Trello card fires and the presenter’s phone pings in the room |
| P1 | Pill reminder | Timed pill with photo; patient taps items + Done; caretaker is notified and can see the log |
| P2 | Errand with a second person | Patient reminder plus a ping to the responsible caretaker |

## Will not build this round

- Login, signup, or accounts. Both surfaces are already in the household.
- Multiple households or multiple patients
- A full family social feed
- Drawing on photos
- A polished gradual/multi-stage alarm
- A real carrier phone call (patient retries stay in-app; caretaker ping is Trello)
- Voice cloning, unless it drops in with no extra risk
- Clinical medical records, dosing math, or pharmacy integrations
- Calendar sync, maps, or live travel-time APIs (a notify-ahead offset is enough)
- Patient typing or small-text settings screens

Roadmap, say it in the demo if asked: several family members can each send check-ins; gradual alarms; a real follow-up voice call.

## Ideal demo (about 90 seconds)

1. Patient tablet is idle: photos cycling, looks like a frame.
2. Caretaker uploads today’s photo, writes a caption, marks it priority.
3. Tablet interrupts. Patient taps. Image, who it is from, spoken caption, “How are you today?”
4. Patient answers with a large control. Caretaker panel updates.
5. Second beat: she does not answer. After N misses, the presenter’s phone pings from Trello.
6. If time: a pill appears, they tap it, Done, log updates. If more time: Bob gets the pickup ping.

Five-minute version and fallbacks: [DEMO.md](DEMO.md).

## Open questions to lock in five minutes

1. **How does the patient answer a check-in?** Recommendation: three huge buttons (e.g. Good / Okay / Need help). Optional later: hold-to-talk or Whisper dictation.
2. **Miss count N** before the caretaker ping. Recommendation: 2 in product, 1 retry on stage.
3. **Multi-caretaker:** one caretaker for P0/P1. Add Bob only if P2 is in the demo.

Locked: no login. Locked: missed path ends on the caretaker’s phone via Trello. Locked: voice clone is optional.

## Contracts the demo needs

Write these in [`api-contracts/`](api-contracts/README.md) before splitting frontend and backend.

1. Household bootstrap (one patient, caretakers, avatars). Already “logged in.”
2. Check-in media queue (create, list, prioritize, mark sent/complete).
3. Patient device state (current slideshow, active interrupt, submit response).
4. Reminder schedule, response window, retry count.
5. Escalation: miss N times → Trello caretaker ping.
6. Pill regimen, due dose, tap-each-item completion, caretaker notify/log.
7. Errand create, responsible party, notify-ahead offsets, completion.

## Suggested vertical slices

1. Patient idle slideshow + caretaker can add a photo to the queue.
2. Priority photo becomes today’s interrupt; patient opens it and sees caption + prompt.
3. Patient submits a response; caretaker log and queue update.
4. Miss N times → retry patient → Trello card → phone pings (demo skip control).
5. Pill due → tap items → Done → notify/log.
6. Errand pings patient and Bob.
