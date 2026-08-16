<!-- markdownlint-disable -->

# Hardening Report: chetan--invalidate-cloudfront-action/v2.2

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **chetan--invalidate-cloudfront-action/v2.2** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The workflow file uses `actions/checkout@v2`, which is pinned to a mutable version tag rather than an immutable 40-character commit SHA. This means the action could be silently replaced by a malicious version without any change to the workflow file, enabling a supply-chain attack.

Locations:

- `.github/workflows/tests.yml:21`

### missing-permissions (severity: medium)

The workflow file `.github/workflows/tests.yml` has no top-level `permissions:` key and no job-level `permissions:` key on the `tests` job. Without explicit permissions, the workflow inherits the repository's default token permissions, which may be overly broad (e.g., write access to contents). A minimal `permissions:` block should be declared.

Locations:

- `.github/workflows/tests.yml:1`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses, missing-permissions

**Notes:**

Fixed both findings in .github/workflows/tests.yml: (1) Pinned `actions/checkout@v2` to its immutable commit SHA `ee0669bd1cc54295c223e0bb666b733df41de1c5` with a `# v2` comment for readability. (2) Added a top-level `permissions: contents: read` block — the minimum permission required for the checkout step; all other permissions default to none.

