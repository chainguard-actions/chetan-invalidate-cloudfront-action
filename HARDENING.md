<!-- markdownlint-disable -->

# Hardening Report: chetan--invalidate-cloudfront-action/v2.3

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **chetan--invalidate-cloudfront-action/v2.3** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Two `uses:` references in .github/workflows/tests.yml are pinned to mutable version tags rather than full 40-character commit SHA digests, making the workflow vulnerable to supply-chain attacks if those tags are moved:
- `actions/checkout@v2` (line 25) — should be pinned to a full SHA, e.g. `actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v2`
- `aws-actions/configure-aws-credentials@v1` (line 72) — should be pinned to a full SHA

Locations:

- `.github/workflows/tests.yml:25`
- `.github/workflows/tests.yml:72`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned two mutable `uses:` references in hardened/action/.github/workflows/tests.yml to full commit SHAs:
- `actions/checkout@v2` → `actions/checkout@ee0669bd1cc54295c223e0bb666b733df41de1c5 # v2` (line 25)
- `aws-actions/configure-aws-credentials@v1` → `aws-actions/configure-aws-credentials@67fbcbb121271f7775d2e7715933280b06314838 # v1` (line 72)
SHAs were resolved using lookup_action_sha. Original tags preserved as inline comments.

