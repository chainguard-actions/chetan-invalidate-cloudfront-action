<!-- markdownlint-disable -->

# Hardening Report: chetan--invalidate-cloudfront-action/v2.4.1

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **chetan--invalidate-cloudfront-action/v2.4.1** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

The workflow file uses action references pinned to mutable version tags instead of immutable 40-character commit SHAs. This exposes the workflow to supply-chain attacks if the upstream action tag is moved or compromised. Failing references:
- `actions/checkout@v2` (line ~22)
- `aws-actions/configure-aws-credentials@v1` (line ~68, used twice at lines ~68 and ~84)

These should be pinned to full SHA digests, e.g. `actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v2`.

Locations:

- `.github/workflows/tests.yml:22`
- `.github/workflows/tests.yml:68`
- `.github/workflows/tests.yml:84`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned all three unpinned action references in hardened/action/.github/workflows/tests.yml to full commit SHAs: actions/checkout@v2 → @0717577d45739eb3c851188b29f50ed6c0b2194e # v2; aws-actions/configure-aws-credentials@v1 → @67fbcbb121271f7775d2e7715933280b06314838 # v1 (both occurrences at lines 68 and 84). Original tag names preserved as inline comments.

