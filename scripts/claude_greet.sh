#!/bin/zsh

# Random greeting messages for Claude CLI.
messages=(
  "早安，祝你今天順利！"
  "午安！希望你一切都好。"
  "晚安，辛苦了！"
  "嗨～祝你今天心情很好。"
  "哈囉！送你一個小問候。"
  "今天也一起加油！"
  "祝你工作順利、心情愉快。"
  "希望你今天過得很棒。"
  "打聲招呼：你好啊！"
  "祝你有個美好的一天。"
)

index=$((RANDOM % ${#messages[@]}))
msg=${messages[$((index + 1))]}

# Send to Claude CLI in non-interactive mode and avoid permission prompts.
CLAUDE_BIN="${CLAUDE_BIN:-claude}"
if [[ -n "${CLAUDE_SESSION_ID:-}" ]]; then
  "$CLAUDE_BIN" -p --permission-mode dontAsk --session-id "$CLAUDE_SESSION_ID" -- "$msg"
else
  "$CLAUDE_BIN" -p --permission-mode dontAsk -- "$msg"
fi
