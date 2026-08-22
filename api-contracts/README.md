# API Contracts

This directory is the shared source of truth for API decisions before implementation begins.

## Workflow

1. Propose or update a contract in this directory.
2. Review it with all four team members.
3. Resolve open questions and record the decision.
4. Mark the contract as approved before building against it.
5. Update the contract first when an API changes.

## Contract checklist

Each contract should define:

- Purpose and owner
- Endpoint and HTTP method
- Authentication and authorization
- Path, query, and header parameters
- Request body and example
- Success response and example
- Error responses
- Validation rules
- Pagination, filtering, or sorting when applicable
- Open questions and approval status

## Suggested status

Use one of these labels at the top of each contract:

- `Draft` — still being discussed
- `Approved` — ready to implement
- `Implemented` — available in the application
- `Deprecated` — kept only for compatibility or migration
