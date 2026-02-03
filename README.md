# Fix-session-time

Schedule Claude CLI to send a random greeting at 07:00, 13:00, and 18:00 every day on macOS.

Author: Kelvin

## Files

- `scripts/claude_greet.sh`: random greeting sender (non-interactive)
- `launchd/com.example.claude.greet.plist`: launchd schedule (rename if desired)

## Setup

1) Copy the script into your home bin and make it executable:

```sh
mkdir -p "$HOME/bin"
cp scripts/claude_greet.sh "$HOME/bin/claude_greet.sh"
chmod +x "$HOME/bin/claude_greet.sh"
```

2) Copy the plist into LaunchAgents:

```sh
cp launchd/com.example.claude.greet.plist "$HOME/Library/LaunchAgents/"
```

3) Load the job:

```sh
launchctl bootstrap gui/$(id -u) "$HOME/Library/LaunchAgents/com.example.claude.greet.plist"
```

## Test

```sh
"$HOME/bin/claude_greet.sh"
```

## Stop

```sh
launchctl bootout gui/$(id -u) "$HOME/Library/LaunchAgents/com.example.claude.greet.plist"
```

## Notes

- Optional: set a fixed session ID to keep all greetings in one thread:

```sh
export CLAUDE_SESSION_ID="your-uuid-here"
```

- Optional: if `claude` is not on your `PATH`, set a custom binary path:

```sh
export CLAUDE_BIN="/absolute/path/to/claude"
```

## Customize

### Change greeting messages

Edit the `messages=(...)` list in `scripts/claude_greet.sh`.

### Change schedule

Edit `StartCalendarInterval` in `launchd/com.example.claude.greet.plist`.
Add or remove `<dict>` blocks to change the run times.
