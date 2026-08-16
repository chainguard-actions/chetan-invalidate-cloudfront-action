<!-- markdownlint-disable -->

# Hardening Report: chetan--invalidate-cloudfront-action/v2.4.2

> This file was generated automatically by the hardening agent.

**Policy SHA:** `d636be7e43ef829af6e853da6b3c7566db9f72fe`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **chetan--invalidate-cloudfront-action/v2.4.2** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### unpinned-uses (severity: high)

Workflow files contain `uses:` references pinned to mutable version tags instead of immutable 40-character commit SHAs. This exposes the workflow to supply-chain attacks if the referenced action tag is moved or overwritten.

Failing references in .github/workflows/on_push_test.yml:
- `uses: actions/checkout@v2` (active step in the `experiment` job)

Failing references in .github/workflows/tests.yml:
- `uses: actions/checkout@v5`
- `uses: aws-actions/configure-aws-credentials@v6` (appears twice)

All should be pinned to full 40-character hex commit SHAs, e.g. `uses: actions/checkout@11bd71901bbe5b1630ceea73d27597364c9af683 # v5`.

Locations:

- `.github/workflows/on_push_test.yml:109`
- `.github/workflows/tests.yml:24`
- `.github/workflows/tests.yml:79`
- `.github/workflows/tests.yml:91`

## Iteration Notes

### Iteration 1

**Fixes applied:** unpinned-uses

**Notes:**

Pinned all four unpinned `uses:` references to full 40-character commit SHAs:
- `.github/workflows/on_push_test.yml` line 109: `actions/checkout@v2` → `@0717577d45739eb3c851188b29f50ed6c0b2194e # v2`
- `.github/workflows/tests.yml` line 24: `actions/checkout@v5` → `@fbc6f3992d24b796d5a048ff273f7fcc4a7b6c09 # v5`
- `.github/workflows/tests.yml` lines 79 & 91: `aws-actions/configure-aws-credentials@v6` → `@517a711dbcd0e402f90c77e7e2f81e849156e31d # v6` (both occurrences)

Remaining `@v` references in on_push_test.yml are all inside commented-out blocks and are not active steps.

