unsetopt prompt_subst

now() {
  date +%s%3N
}

SILVER_START=$(now)

preexec() {
  SILVER_START=$(now)
}

precmd() {
  ZLE_RPROMPT_INDENT=0
  PROMPT="$(code=$? jobs=$(jobs | wc -l) cmdtime=$(($(now)-$SILVER_START)) silver lprint)"
  RPROMPT="$(code=$? jobs=$(jobs | wc -l) cmdtime=$(($(now)-$SILVER_START)) silver rprint)"
  SILVER_START=$(now)
}
