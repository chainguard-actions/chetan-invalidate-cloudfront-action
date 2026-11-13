<!-- markdownlint-disable -->

# Hardening Report: chetan--invalidate-cloudfront-action/v2.4.1

> This file was generated automatically by the hardening agent.

**Policy SHA:** `374911c4be584df24e6da57af2d990570ef0f859`

**Test Policy SHA:** `843adf9e4b8f85d0c08b27b9d0b09dd094b54702`

**Harden Agent Version:** `2`

Action **chetan--invalidate-cloudfront-action/v2.4.1** was hardened automatically. 2 finding(s) were identified and resolved across 1 iteration(s).

## Findings Fixed

### script-injection (severity: high)

Rule (b): the composite action's run: block expands an inherited environment variable without double quotes: `$GITHUB_ACTION_PATH/entrypoint.sh`. Composite run: blocks inherit their environment from the calling workflow, so the check treats such variables as untrusted. The expansion is open to word splitting and glob expansion, and a path containing spaces breaks it. Fix: quote it as "$GITHUB_ACTION_PATH/entrypoint.sh".

Locations:

- `action.yml:13`

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

**Fixes applied:** script-injection, prior-fix

**Notes:**

In action.yml, $GITHUB_ACTION_PATH/entrypoint.sh is now double-quoted so word splitting and glob expansion can't act on it. The previous harden's only change to action.yml was removing a blank line, and that has been applied again. entrypoint.sh was left unchanged.

