Config:

```json
// Zed settings
//
// For information on how to configure Zed, see the Zed
// documentation: https://zed.dev/docs/configuring-zed
//
// To see all of Zed's default settings without changing your
// custom settings, run the `open default settings` command
// from the command palette or from `Zed` application menu.
{
  "assistant": {
    "default_model": {
      "provider": "copilot_chat",
      "model": "gpt-4"
    },
    "version": "2"
  },
  "theme": "One Dark",
  "terminal": {
    "dock": "bottom",
    "font_family": "JetBrains Mono"
  },
  "telemetry": {
    "diagnostics": true,
    "metrics": false
  },
  "buffer_font_size": 15,
  "buffer_font_features": {
    "calt": false
  },
  "soft_wrap": "editor_width",
  "tabs": { "file_icons": true },
  "lsp": {
    "rust-analyzer": {
      "runnables": {
        "extraEnv": {
          "env": {
            "DYLD_FALLBACK_LIBRARY_PATH": "/Library/Developer/CommandLineTools/usr/lib/"
          }
        }
      }
    }
  }
}

```
