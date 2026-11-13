<!-- markdownlint-disable -->

# Hardening Report: chetan--invalidate-cloudfront-action/v2.4.2

> This file was generated automatically by the hardening agent.

**Policy SHA:** `374911c4be584df24e6da57af2d990570ef0f859`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **chetan--invalidate-cloudfront-action/v2.4.2** was hardened automatically. 1 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### prior-fix (severity: high)

Carried forward from this version's previous harden, which fixed it; fix it again unless the code no longer has the problem. The previous harden changed action.yml without recording a finding for it, and this analysis reported nothing there. Re-apply its security changes unless the code no longer needs them. The previous patch:
```diff
diff --git a/action.yml b/action.yml
index 981efd3..e5aeee5 100644
--- a/action.yml
+++ b/action.yml
@@ -4,10 +4,26 @@ author: "Pixelcop Research, Inc."
 branding:
   icon: "cloud-lightning"
   color: "orange"
-
 runs:
   using: "composite"
   steps:
     - shell: bash
       run: |
         $GITHUB_ACTION_PATH/entrypoint.sh

```

Locations:

- `action.yml`

## Iteration Notes

### Iteration 1

**Fixes applied:** prior-fix

**Notes:**

The previous harden's patch made no security change: all it did was delete one blank line in action.yml. I re-applied that deletion. I also put quotes around "$GITHUB_ACTION_PATH/entrypoint.sh" so the path still works if it contains spaces or other characters the shell would split on. action.yml has no ${{ }} expressions, no `uses:` references and no credentials, so there was nothing else to fix there. I read entrypoint.sh but left it alone, since the finding only covered action.yml. One thing I noticed: it downloads jq from GitHub releases with wget and runs it without checking a checksum. It does not pipe a script straight into a shell.

