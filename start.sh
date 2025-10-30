#!/bin/bash

export CLAUDE_CODE_MAX_OUTPUT_TOKENS=4096
export CLAUDE_CODE_USE_BEDROCK=1
export MAX_THINKING_TOKENS=1024

PS3="Select a model: "
  select model in "Claude Sonnet" "Claude Haiku"; do
    case $REPLY in
      1) export MODEL="global.anthropic.claude-sonnet-4-5-20250929-v1:0"; break;;
      2) export MODEL="global.anthropic.claude-haiku-4-5-20251001-v1:0"; break;;
      *) echo "Invalid choice. Enter 1 or 2.";;
    esac
done
echo "Selected: $model (MODEL=$MODEL)"

claude --model $MODEL
