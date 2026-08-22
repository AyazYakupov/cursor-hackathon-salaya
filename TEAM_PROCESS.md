# Hackathon Team Process

Our goal is to deliver one reliable, polished demonstration rather than several disconnected features. Everyone contributes to implementation, while each person has a primary area in which they make the final call.

## Responsibilities

Assign names before development begins.

| Role | Team member | Primary responsibility | Also owns |
| --- | --- | --- | --- |
| Product and demo captain | TBD | Scope, user journey, and cross-team decisions | Pitch and demo script |
| Frontend owner | TBD | UI and client state | Loading states, error states, and API mocks |
| Backend owner | TBD | APIs, data, and business logic | API contracts |
| Integration owner | TBD | External services and deployment | Testing, demo data, and production stability |

These are ownership areas, not silos. Teammates should pair across roles whenever a feature crosses boundaries or someone is blocked.

## Kickoff

Spend no more than 45 minutes agreeing on:

1. A one-sentence description of the problem.
2. One primary user.
3. The ideal 90-second demo.
4. Three must-have capabilities.
5. A clear list of things we will not build.
6. The API contracts required for the demo.
7. An owner and reviewer for every capability.

Plan backward from the demo. Work that will not appear in the demo or make it more reliable is lower priority.

## Work breakdown

Divide work into demonstrable vertical slices rather than long-running frontend and backend phases. Example slices include:

- The user submits input and receives a result.
- The user saves a result.
- The user views previous results.
- The application handles an API failure.

Each slice has one owner and includes everything needed to demonstrate it. The frontend can use mocked responses from the agreed contract while the backend is being implemented.

## API contract workflow

The [`api-contracts`](api-contracts/README.md) directory is the source of truth for communication between frontend and backend.

1. Create or update the contract before implementation.
2. Review it with the affected teammates.
3. Resolve open questions and mark it `Approved`.
4. Build the frontend mock and backend implementation against the same contract.
5. Update the contract first if an agreed API must change.

## Task board

Use a single shared board with these columns:

`Backlog` → `Ready` → `In Progress` → `Review` → `Done`

Every task must have an owner, a priority, and a clear completion condition. Each person should have no more than one major task in progress. Prioritize work as:

- `P0`: required for the core demo
- `P1`: improves the demo if time allows
- `P2`: optional or post-hackathon work

## Git workflow

- Keep `main` deployable and demoable.
- Create short-lived branches such as `feat/create-analysis` or `fix/result-loading`.
- Keep pull requests small and focused.
- Require one teammate to review each pull request.
- Merge frequently, ideally every one or two hours.
- Pull or rebase from `main` before merging to reduce integration conflicts.
- Do not leave major integration work until the end.
- Never commit secrets, API keys, or local environment files.

## Communication rhythm

Hold a five-to-ten-minute check-in every two hours. Each teammate answers:

1. What is working now?
2. What will I finish next?
3. Am I blocked?
4. Did an API or product assumption change?

Report blockers immediately instead of waiting for the next check-in. If a disagreement lasts more than ten minutes, the relevant role owner decides. The product and demo captain breaks cross-functional ties.

## Suggested timeline

Allocate the available time approximately as follows:

- First 10%: scope, demo flow, architecture, and contracts
- Next 55%: build the critical path
- Next 20%: integration, deployment, and reliability
- Final 15%: bug fixes, visual polish, pitch, and rehearsal

Deploy a minimal working version during the first quarter of the hackathon. Freeze new features before the final phase.

## Definition of done

A task is `Done` only when:

- Its critical path works from the user's perspective.
- It follows the approved API contract.
- Loading, empty, and failure states needed by the demo are handled.
- Another teammate has reviewed it.
- It is merged into `main` and works in the deployed environment.

## Demo readiness

Before presenting:

- Rehearse the exact demo several times.
- Prepare stable demo accounts and seeded data.
- Test on the device and network that will be used.
- Keep screenshots or a short recording as a fallback.
- Assign one presenter and one teammate to monitor or recover the application.
- Stop adding features early enough to fix integration problems calmly.
