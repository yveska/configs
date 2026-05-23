if status is-interactive
  set -g fish_greeting ""

  alias ls='eza -lh --group-directories-first --icons=auto'
  alias lsa='eza -la --group-directories-first --icons=auto'
  alias grep='grep --color=auto'
  alias vim='nvim'
  alias cd='z'
  alias mnt='udisksctl mount -b /dev/sda1'
  alias unmnt='udisksctl unmount -b /dev/sda1'

  set -gx FZF_DEFAULT_OPTS "--preview 'bat --style=numbers --color=always {}' --layout=reverse --exact --border=bold --border=rounded --margin=3% --color=dark"
  set -gx DRIVE /run/media/adam/HDD/
  set -gx EDITOR nvim
  set -gx TERMIANL kitty
  set -gx BROWSER zen-browser

  fzf --fish | source
  zoxide init fish | source
  starship init fish | source

end
