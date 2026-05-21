if status is-interactive
  set -g fish_greeting ""

  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='eza -la --group-directories-first --icons=auto'
  alias grep='grep --color=auto'
  alias vim='nvim'
  alias cd='z'

  set -gx FZF_DEFAULT_OPTS "--preview 'bat --style=numbers --color=always {}' --layout=reverse --exact --border=bold --border=rounded --margin=3% --color=dark"

  fzf --fish | source
  zoxide init fish | source
  starship init fish | source

end
