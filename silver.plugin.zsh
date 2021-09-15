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
  PROMPT="$(code=$? jobs=$(jobs | wc -l) cmdtime=$(($(now)-$SILVER_START)) silver lprint)%{$reset_color%}"
  RPROMPT="$(code=$? jobs=$(jobs | wc -l) cmdtime=$(($(now)-$SILVER_START)) silver rprint)%{$reset_color%}"
  SILVER_START=$(now)
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
