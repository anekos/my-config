# Start {{{

# コメントアウトを外すと、 .zshrc の処理時間を表示する (猫も走らない)
# __anekos_start_at=$(date +%s.%3N)

# }}}

# Util functions {{{

function has-command () {
  which "$1" > /dev/null 2>&1
}

function has-package () {
  case "$HOST"  in
    *)
      pacman -Qi "$1" > /dev/null 2>&1
    ;;
  esac
}

function parent-pid () {
  ps -h -o ppid -p "$1" | tr -d ' '
}

function file-size () {
  stat --format '%s' "$@"
}

# ウィンドウが、表示されていなければ 1
function is-unmapped () {
  if [ -z "$WINDOWID" ]
  then
    return 1
  else
    # 一度、親(端末)のウィンドウが削除された後に、復活していると WINDOWID が不正なものになる
    # tmux attach などで起る
    # ので、エラー出力は捨ててしまう
    xwininfo -id "$WINDOWID" 2>&1 | grep '^  Map State: IsUnMapped' &> /dev/null
  fi
}

# }}}

# AUTOLOAD {{{

fpath=($fpath ~/.zsh_func)
autoload -U ~/.zsh_func/*(:t)

autoload -Uz is-at-least

autoload -U compinit
compinit -u

autoload -U colors
colors

autoload -Uz add-zsh-hook

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

# http://d.hatena.ne.jp/sugyan/20100712/1278869962
autoload -U select-word-style
# select-word-style bash
# WORDCHARS='*?_-.,[]~=&;!#$%^(){}<>'
# zstyle ':zle:*' word-chars " _-./;@"
# zstyle ':zle:*' word-style unspecified

# zsh editor
autoload zed

autoload zargs

# }}}

# MODULES {{{

zmodload -i zsh/mathfunc

# }}}

# COMPLETION {{{

# zshの補完を強化するTips - Qiita [キータ] - http://qiita.com/PSP_T/items/ed2d36698a5cc314557d
# zshのzstyleでの補完時の挙動について - voidy21の日記 - http://voidy21.hatenablog.jp/entry/20090902/1251918174
# 補完関数の表示を強化する
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _list _approximate # _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT

# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} m:{A-Z}={a-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'

# 補完候補が複数ある時、一覧表示 (auto_list) せず、すぐに最初の候補を補完する
#setopt menu_complete

# 一覧表示された補完候補を C-p C-n などで選択可能にする
zstyle ':completion:*:default' menu select=1

# 補完リストを詰めて表示
setopt list_packed

# エイリアスを展開して補完
setopt complete_aliases

# カーソルの位置に補なうことで単語を完成させようとする。
setopt complete_in_word

# *.o とかは補完しない
zstyle ':completion:*:*files' ignored-patterns '*?.hi' '*?.o' '*?~' '*\#'

# }}}

# OPTION {{{

# based by http://devel.aquahill.net/zsh/zshoptions

# 複数の zsh を同時に使う時など history ファイルに上書きせず追加する
setopt append_history

# 指定したコマンド名がなく、ディレクトリ名と一致した場合 cd する
setopt auto_cd

# 補完候補が複数ある時に、一覧表示する
setopt auto_list

# 補完キー（Tab, Ctrl+I) を連打するだけで順に補完候補を自動で補完する
setopt auto_menu

# カッコの対応などを自動的に補完する
setopt auto_param_keys

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# cd -[tab] でpushd
setopt autopushd

# {a-c} を a b c に展開する機能を使えるようにする
setopt brace_ccl

# コマンドのスペルチェックをする
setopt correct

# =command を command のパス名に展開する
setopt equals

# ファイル名で #, ~, ^ の 3 文字を正規表現っぽく使えるように
setopt extended_glob

# zsh の開始・終了時刻をヒストリファイルに書き込む
setopt extended_history

# 直前と同じコマンドラインはヒストリに追加しない
setopt hist_ignore_dups

# 履歴を重複して登録しないようにする
setopt hist_ignore_dups

# コマンドラインの先頭がスペースで始まる場合ヒストリに追加しない
setopt hist_ignore_space

# history (fc -l) コマンドをヒストリリストから取り除く。
setopt hist_no_store

# ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_verify

# Ctrl+D では終了しないようになる（exit, logout などを使う）
setopt ignore_eof

# コマンドラインでも # 以降をコメントと見なす
setopt interactive_comments

# auto_list の補完候補一覧で、ls -F のようにファイルの種別をマーク表示
setopt list_types

# 内部コマンド jobs の出力をデフォルトで jobs -l にする
setopt long_list_jobs

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# ファイル名の展開でディレクトリにマッチした場合末尾に / を付加する
setopt mark_dirs

# 複数のリダイレクトやパイプなど、必要に応じて tee や cat の機能が使われる
setopt multios

# ファイル名の展開で、辞書順ではなく数値的にソートされるようになる
setopt numeric_glob_sort

# 8 ビット目を通すようになり、日本語のファイル名などを見れるようになる
setopt print_eightbit

# 色を使う(エスケープシーケンスを通す)
setopt prompt_subst

# ディレクトリスタックに同じディレクトリを追加しないようになる
setopt pushd_ignore_dups

# rm_star_silent の逆で、10 秒間反応しなくなり、頭を冷ます時間が与えられる
setopt rm_star_wait

# シェルのプロセスごとに履歴を共有
setopt share_history

# for, repeat, select, if, function などで簡略文法が使えるようになる
setopt short_loops

#コピペの時rpromptを非表示する
setopt transient_rprompt

# ビープ音を鳴らさないようにする
unsetopt beep
unsetopt listbeep

# Ctrl+S/Ctrl+Q によるフロー制御を使わないようにする
unsetopt flow_control

# シェルが終了しても裏ジョブに HUP シグナルを送らないようにする
unsetopt hup

# 文字列末尾に改行コードが無い場合でも表示する
unsetopt promptcr

# }}}

# keys {{{

# emacs 風のバインド
bindkey -e

# 履歴検索
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

# zaw
bindkey "^Xt" zaw-tmux
bindkey "^Xh" zaw-history
bindkey "^Xbb" zaw-bookmark
bindkey "^Xba" zaw-bookmark-add

# }}}

# 左プロンプト {{{

# ホストに寄って色を変える
# http://absolute-area.com/post/6664864690/zsh

function pcolor () {
  for ((f = 0; f < 255; f++)); do
    printf "\e[38;5;%dm %3d#\e[m" $f $f
    if [[ $f%8 -eq 7 ]] then
      printf "\n"
    fi
  done
  echo
}

if [ -f ~/.hostname ]
then
  local LOCAL_HOSTNAME=$(head -1 ~/.hostname | tr --delete '\n')
else
  local LOCAL_HOSTNAME=$(hostname)
fi
local HOSTC=$'%{\e[38;5;'"$(printf "%d\n" 0x$(echo "$LOCAL_HOSTNAME"|md5sum|cut -c3-4))"'m%}'
local DEFAULTC=$'%{\e[m%}'

function _anekos_prompt_precmd () {
  local ec="$?"
  if [ "$ec" = "0" ]
  then
    _anekos_prompt_lrc=""
  else
    _anekos_prompt_lrc=" ∴$ec∴ "
  fi
}

precmd_functions=($precmd_functions _anekos_prompt_precmd)

PROMPT="%F{red}┏%F{yellow}%B\${_anekos_prompt_lrc}%b%f${HOSTC}[${LOCAL_HOSTNAME}:%~] %F{green}%T${DEFAULTC}
%F{red}┗%F{blue}▶%f "
#〽【】

# }}}

# 右プロンプト {{{

case "$HOST" in
  ildjarn | napalmdeath | *.*)
    # zsh の vcs_info に独自の処理を追加して stash 数とか push していない件数とか何でも表示する - Qiita
    # http://qiita.com/mollifier/items/8d5a627d773758dd8078

    autoload -Uz vcs_info

    RPROMPT=""

    # 以下の3つのメッセージをエクスポートする
    #   $vcs_info_msg_0_ : 通常メッセージ用 (緑)
    #   $vcs_info_msg_1_ : 警告メッセージ用 (黄色)
    #   $vcs_info_msg_2_ : エラーメッセージ用 (赤)
    zstyle ':vcs_info:*' max-exports 3

    zstyle ':vcs_info:*' enable git svn hg bzr
    # 標準のフォーマット(git 以外で使用)
    # misc(%m) は通常は空文字列に置き換えられる
    zstyle ':vcs_info:*' formats '(%s)-[%b]'
    zstyle ':vcs_info:*' actionformats '(%s)-[%b]' '%m' '<!%a>'
    zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
    zstyle ':vcs_info:bzr:*' use-simple true


    if is-at-least 4.3.10
    then
      # git 用のフォーマット
      # git のときはステージしているかどうかを表示
      zstyle ':vcs_info:git:*' formats '[%b]' '%c%u %m'
      zstyle ':vcs_info:git:*' actionformats '[%b]' '%c%u %m' '<!%a>'
      zstyle ':vcs_info:git:*' check-for-changes true
      zstyle ':vcs_info:git:*' stagedstr "+"
      zstyle ':vcs_info:git:*' unstagedstr "-"
    fi

    # hooks 設定
    if is-at-least 4.3.11
    then
      # git のときはフック関数を設定する

      # formats '(%s)-[%b]' '%c%u %m' , actionformats '(%s)-[%b]' '%c%u %m' '<!%a>'
      # のメッセージを設定する直前のフック関数
      # 今回の設定の場合はformat の時は2つ, actionformats の時は3つメッセージがあるので
      # 各関数が最大3回呼び出される。
      zstyle ':vcs_info:git+set-message:*' hooks \
        git-hook-begin \
        git-untracked \
        git-push-status \
        git-nomerge-branch \
        git-stash-count

      # フックの最初の関数
      # git の作業コピーのあるディレクトリのみフック関数を呼び出すようにする
      # (.git ディレクトリ内にいるときは呼び出さない)
      # .git ディレクトリ内では git status --porcelain などがエラーになるため
      function +vi-git-hook-begin() {
        # 0以外を返すとそれ以降のフック関数は呼び出されない
        [[ $(command git rev-parse --is-inside-work-tree 2> /dev/null) != 'true' ]] && return 1

        return 0
      }

      # untracked フィアル表示
      #
      # untracked ファイル(バージョン管理されていないファイル)がある場合は
      # unstaged (%u) に ? を表示

      function +vi-git-untracked() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        [[ "$1" != "1" ]] && return 0

        if command git status --porcelain 2> /dev/null \
          | awk '{print $1}' \
          | command grep -F '??' > /dev/null 2>&1
        then
          # unstaged (%u) に追加
          hook_com[unstaged]+='?'
        fi
      }

      # push していないコミットの件数表示
      #
      # リモートリポジトリに push していないコミットの件数を
      # pN という形式で misc (%m) に表示する
      function +vi-git-push-status() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        [[ "$1" != "1" ]] && return 0

        # ブランチ名
        local branch="${hook_com[branch]}"

        # リモート名
        local remote="$(command git remote | command grep -v backup)"

        [ -z "$remote" ] && return 0

        # push していないコミット数を取得する
        local ahead
        ahead="$(command git rev-list "$remote/$branch".."$branch" 2>/dev/null \
          | wc -l \
          | tr -d ' ')"

        if [[ "$ahead" -gt 0 ]]
        then
          # misc (%m) に追加
          hook_com[misc]+="p${ahead}"
        fi
      }

      # マージしていない件数表示
      #
      # master/develop 以外のブランチにいる場合に、
      # 現在のブランチ上でまだ master/develop にマージしていないコミットの件数を
      # (mN) という形式で misc (%m) に表示
      # 対象の優先度は、 develop > master
      function +vi-git-nomerge-branch() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        [[ "$1" != "1" ]] && return 0

        local target='master'
        git rev-parse develop >/dev/null 2>&1 && local target='develop'


        # master ブランチの場合は何もしない
        [[ "${hook_com[branch]}" == "$target" ]] && return 0

        local nomerged
        nomerged=$(command git rev-list "$target"..${hook_com[branch]} 2>/dev/null | wc -l | tr -d ' ')

        # misc (%m) に追加
        [[ "$nomerged" -gt 0 ]] && hook_com[misc]+="m${nomerged}"
      }

      # stash 件数表示
      #
      # stash している場合は :SN という形式で misc (%m) に表示
      function +vi-git-stash-count() {
        # zstyle formats, actionformats の2番目のメッセージのみ対象にする
        [[ "$1" != "1" ]] && return 0

        local stash
        stash=$(command git stash list 2>/dev/null | wc -l | tr -d ' ')
        if [[ "${stash}" -gt 0 ]]; then
          # misc (%m) に追加
          hook_com[misc]+=":S${stash}"
        fi
      }

    fi

    function _update_vcs_info_msg() {
      local -a messages
      local prompt

      LANG=en_US.UTF-8 vcs_info

      if [[ -z ${vcs_info_msg_0_} ]]; then
        # vcs_info で何も取得していない場合はプロンプトを表示しない
        prompt=""
      else
        # vcs_info で情報を取得した場合
        # $vcs_info_msg_0_ , $vcs_info_msg_1_ , $vcs_info_msg_2_ を
        # それぞれ緑、黄色、赤で表示する
        [[ -n "$vcs_info_msg_1_" ]] && messages+=( "%B%F{yellow}${vcs_info_msg_1_}%f%b" )
        [[ -n "$vcs_info_msg_2_" ]] && messages+=( "%B%F{red}${vcs_info_msg_2_}%f%b" )
        [[ -n "$vcs_info_msg_0_" ]] && messages+=( "%F{green}${vcs_info_msg_0_}%f" )

        # 間にスペースを入れて連結する
        prompt="${(j: :)messages}"
      fi

      RPROMPT="$prompt"
    }

    add-zsh-hook precmd _update_vcs_info_msg
    ;;
esac

# }}}

# SET {{{

# 履歴
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000 # 100万パワー

# }}}

# ENV {{{

export EDITOR=vim
export LINAME_EDITOR='gvim -f'

export SVIM_FOCUS_COMMAND="xc focus"
export SVIM_COMMAND_NORMAL="s"
export SVIM_COMMAND_TAB="t"

export DARCS_ALWAYS_COLOR=1

# perl ENV
export PERL_LOCAL_LIB_ROOT="$HOME/perl5"
export PERL_MB_OPT="--install_base $HOME/perl5"
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"
export PERL5LIB="$HOME/perl5/lib/perl5/x86_64-linux-thread-multi:$HOME/perl5/lib/perl5"

case "$OSTYPE" in
  linux*)
    export TERMCMD=urxvt
  ;;
esac

export EDITOR=vim

export LANG="ja_JP.UTF-8"
export LC_COLLATE="C"
export LANGUAGE="ja_JP:en"

export NOX_DOCUMENT=~/nox

# }}}

# zsh 終了時の処理 {{{

function on_zsh_exit () {
  [ -f ~/.zexit ] && source ~/.zexit
}

trap on_zsh_exit EXIT

# }}}

# 文字装飾 {{{

# ref: http://ascii-table.com/ansi-escape-sequences.php

TEXT_FG_Black=30
TEXT_FG_Red=31
TEXT_FG_Green=32
TEXT_FG_Yellow=33
TEXT_FG_Blue=34
TEXT_FG_Magenta=35
TEXT_FG_Cyan=36
TEXT_FG_White=37

TEXT_BG_Black=40
TEXT_BG_Red=41
TEXT_BG_Green=42
TEXT_BG_Yellow=43
TEXT_BG_Blue=44
TEXT_BG_Magenta=45
TEXT_BG_Cyan=46
TEXT_BG_White=47

TEXT_Clear=0
TEXT_Bold=1
TEXT_Italic=3
TEXT_Underscore=4
TEXT_Blink=5
TEXT_Reversed=7
TEXT_Concealed=8

function colorname2number {
  local background=0

  while getopts :b opt "$@"
  do
    case $opt in
      b)
        local background=1
        ;;
      \?)
        return 2
        ;;
    esac
  done

  shift $((OPTIND-1))

  case "$1" in
    black)
      local code=30
      ;;
    red)
      local code=31
      ;;
    green)
      local code=32
      ;;
    brown)
      local code=33
      ;;
    blue)
      local code=34
      ;;
    magenta)
      local code=35
      ;;
    cyan)
      local code=36
      ;;
    white)
      local code=37
      ;;
    bblack)
      local code=30
      ;;
    bred)
      local code=31
      ;;
    bgreen)
      local code=32
      ;;
    bbrown)
      local code=33
      ;;
    bblue)
      local code=34
      ;;
    bmagenta)
      local code=35
      ;;
    bcyan)
      local code=36
      ;;
    bwhite)
      local code=37
      ;;
    *)
      echo "Invalid color name: $1
  Valid names: red, green, brown, blue, magenta, cyan, white
               (background color: 'b<color>')" >&2
      return 1
    ;;
  esac

  if [ $background = 1 ]
  then
    code=$((code + 10))
  fi

  echo "$code"
}

# }}}

# VimClojure {{{
function ngserver () {
  case "$1" in
    start)
      java -server -cp 'src:classes:lib/*' vimclojure.nailgun.NGServer 127.0.0.1 &
      ;;
    stop)
      ng ng-stop
  esac
}

# }}}

# エイリアス {{{

# Fail safe
has-command trash-put && alias rm=trash-put
alias crontab='crontab -i'

# short
if has-command rifle
then
  alias o=rifle
elif has-command exo-open
then
  alias o=exo-open
fi

if has-command notify-send
then
  alias ns='notify-send -u normal'
  alias nsl='notify-send -u low'
  alias nsc='notify-send -u critical'
fi

# override
alias ls='ls --color=auto'
has-command hub && alias git='hub'

# override with rlwrap
has-command rlwrap && has-command buildr && alias buildr='rlwrap buildr'
has-command rlwrap && has-command sbcl && alias sbcl='rlwrap sbcl --noinform'

# alias man=w3mman

alias grep="grep --color"

# with args
alias ll='ls -lah'
alias lr='ls -ltrah'
alias ,,=popd
alias ,.=pushd
alias sct='screen -t'
alias quote='sed "s/^\|$/\"/g"'
alias mv='mv -i'
alias tailff='tail --follow=name --retry'
alias bell='echo -e "\\a"'

# vim
alias v="gvim"
alias vimshell='gvim -c VimShell -c "bdelete 1"'
alias vimlein='vim -c "VimShellInteractive lein repl" -c "bdelete 1" -c "split"'
alias vil='find . -maxdepth 3 -type f | egrep -v "/(\\..*|classes)" | vim -c "setlocal readonly nomodified" - '
alias vinarise='vim -c Vinarise'
alias gvinarise='gvim -c Vinarise'
alias refe='noglob refe-color'

# Get My IP
alias myip='curl icanhazip.com'

# cpan - http://d.hatena.ne.jp/holidays-l/20070601/p1
alias cpan-uninstall='perl -MConfig -MExtUtils::Install -e '"'"'($FULLEXT=shift)=~s{-}{/}g;uninstall "$Config{sitearchexp}/auto/$FULLEXT/.packlist",1'"'"

# global
alias -g A='| awk'
alias -g G='| grep --line-buffered --color'
alias -g EG='| egrep --color'
alias -g GI='| grep --line-buffered -i'
alias -g H='| head'
alias -g L='| less -R'
alias -g M='| more'
alias -g T='| tail'
alias -g W='| wc'
alias -g WL='| wc -l'
alias -g S='| sed --unbuffered'
alias -g X='| xargs'
alias -g Q='| quote'
alias -g V='| vim -R -'
alias -g GV='| gvim -R -'
alias -g HTML='| w3m -T "text/html"'
alias -g HTMLD='| w3m -cols `tput cols` -dump -T "text/html"'
alias -g 2N='2> /dev/null'
alias -g 12N='&> /dev/null'
has-command osd_cat && alias -g OSDCAT='| cut -b-100 | osd_cat --pos=middle --align=center  --font="-*-*-medium-*-*-*-20-*-*-*-*-*-*-*"'
has-command dzen2 && alias -g DZEN='| dzen2 -bg orange -fg black -xs 1 -e "onstart=uncollapse"'
has-command python && alias -g JSON='| python -mjson.tool'

# H1 〜 H100、T1 〜 T100
function () {
  local i=0
  for i in {1..100}
  do
    alias -g H$i="| head -$i"
    alias -g T$i="| tail -$i"
  done
}

# iconv
alias -g SU="| iconv -f CP932 -t UTF-8 -c"
alias -g SUL="| iconv -f CP932 -t UTF-8 -c | less"

# Clipboard
if has-command pbcopy ; then
  # Mac
  alias -g C='| pbcopy'
elif has-command xsel ; then
  # Linux
  alias -g C='| xsel --input --clipboard'
elif has-command putclip ; then
  # Cygwin
  alias -g C='| putclip'
fi

alias eclear="echo -e '\026\033c'"

# extension
# alias -s vim="vi"
# alias -s txt="vi"
# alias -s htm="vi"
# alias -s html="vi"

if has-command longcat
then
  function fitcat () {
    local wait="$1"
    [ -z "$1"] && wait=1
    (echo '' ; tput clear; longcat $((`tput lines` - 20)); sleep $wait)
  }
fi

# OS
case "$OSTYPE" in
  linux*)
    # clipboard
    alias -g GC='xclip -o'
    if has-command xsel && has-command tpipe
    then
      alias -g PC="| tpipe 'xsel --input --clipboard' | tpipe 'xsel --input --primary' | tpipe 'xsel --input --secondary'"
    else
      alias -g PC='| xclip -i'
    fi
  ;;
esac

# TMUX
[ -n "$TMUX" ] && alias copy=~/script/tmux/copy


# }}}

# Plugin {{{

for plugin_name in ~/.zsh_plugin/*; source $plugin_name


# }}}

# 履歴 history-all {{{

function history-all { history -E 1 } # 全履歴の一覧を出力する

# }}}

# マウントしながら cd {{{
function cdmount () {
  mount "$@"
  cd "$1"
}
# }}}

# zshrc スカウター {{{

function scouter() {
  sed -e '/^\s*$/d' -e '/^\s*#/d' ${ZDOTDIR:-$HOME}/.zshrc | wc -l
}

# }}}

# パスをクリップボードへコピー {{{
function cpwd () {
  echo -n `realpath "${1:-.}"` | xclip -i
}
# }}}

# mkdir + cd {{{
function mkcd () {
  mkdir "$@"
  cd "${@: - 1}"
}
# }}}

# dabbrev {{{

# zsh + screen で端末に表示されてる文字列を補完する - coﾘ・ー・ﾝ＜2nd life
# http://d.hatena.ne.jp/secondlife/20060108/1136650653

case "$OSTYPE" in
  *)
    if [ "$TERM" = "screen" ]
    then
      HARDCOPYFILE="/tmp/$USER-screen-hardcopy"
      touch "$HARDCOPYFILE"
      chmod 600 "$HARDCOPYFILE"

      if [ -n "$TMUX" ]
      then
        dabbrev-complete () {
          local reply lines=80 # 80行分
          tmux capture-pane
          tmux save-buffer -b 0 "$HARDCOPYFILE"
          tmux delete-buffer -b 0
          reply=($(sed '/^$/d' $HARDCOPYFILE | sed '$ d' | tail -$lines))
          compadd - "${reply[@]%[*/=@|]}"
        }
      else
        dabbrev-complete () {
          local reply lines=80 # 80行分
          screen -X eval "hardcopy -h $HARDCOPYFILE"
          reply=($(sed '/^$/d' $HARDCOPYFILE | sed '$ d' | tail -$lines))
          compadd - "${reply[@]%[*/=@|]}"
        }
      fi

      zle -C dabbrev-complete menu-complete dabbrev-complete
      bindkey '^o' dabbrev-complete
      bindkey '^o^_' reverse-menu-complete
    fi
esac

# }}}

# コマンドの成否を報告 {{{

function zsay {
  if [ "$HOST" = "ildjarn" ] && has-command say
  then
    say "$_anekos_longtimeago_name おわたで"
  fi
}

function saycode {
  if [ $? -ne 0 ];
  then
    zsay しっぱい
  else
    zsay せいこう
  fi
}

# }}}

# 履歴に記録する条件 {{{
# http://d.hatena.ne.jp/mollifier/20090728/p1
zshaddhistory() {
    local ok=$?
    local line=${1%%$'\n'}
    local cmd=`basename "${line%% *}"`

    # 以下の条件をすべて満たすものだけをヒストリに追加する
    [[ ${#line} -ge 4
        && ${cmd} != (exit|halt|reboot)
        && ${cmd} != (rm|rmdir)
        && ${cmd} != (man)
        #&& ${cmd} != (l[salr])
        #&& ${cmd} != (c|cd)
        && ( ${ok} = 0 || ${ok} = 130 )
    ]]
}
# }}}

# read -> copy {{{

function rcopy () {
  local line
  while read line
  do
    echo -n "$line" | xclip -i
  done
}

# }}}

# TMUX の自動タイトル {{{
if [ -n "$TMUX" ]
then
  function _anekos_tmux_window_title_preexec () {
    local -a cmd
    cmd=(${(z)2})

    _anekos_tmux_window_title_do_set=0

    if [ "$_anekos_tmux_window_title_set" -ne 1 ] && [ "$cmd[1]" = "cd" ] || [ "$cmd[1]" = "j" ]
    then
      _anekos_tmux_window_title_set=1
      _anekos_tmux_window_title_do_set=1
    fi
  }

  function _anekos_tmux_window_title_precmd () {
    if [ "$_anekos_tmux_window_title_do_set" = 1 ]
    then
      local title=`basename "$PWD"`
      tmux rename-window "$title"
    fi
  }

  precmd_functions=($precmd_functions _anekos_tmux_window_title_precmd)
  preexec_functions=($preexec_functions _anekos_tmux_window_title_preexec)
fi
# }}}

# autojump {{{

[[ -s /etc/profile.d/autojump.zsh ]] && source /etc/profile.d/autojump.zsh

# }}}

# keychain {{{

#  function start_keychain {
#    keychain $1 ~/.ssh/id_rsa && source ~/.keychain/main-sh
#    _anekos_keychain_started=1
#  }
#
#  function _anekos_keychain_preexec {
#    [ -z $_anekos_keychain_started ] && [[ $1 = ((ssh|scp)\ *) ]] && start_keychain
#  }
#
#  #preexec_functions=($preexec_functions _anekos_keychain_preexec)
#
#  [[ $TERM = (screen*) ]] || start_keychain

has-command keychain && eval `keychain --eval --agents ssh id_rsa --quiet`

# }}}

# reload functions {{{
function reload-functions () {
  local f
  f=(~/.zsh_func/*(.))
  unfunction $f:t 2> /dev/null
  autoload -U $f:t
}
# }}}

# 色付けする {{{
function marker () {
  local OPTARG
  local OPTIND

  local usage="usage: ${0##*/} [-c COLOR] [-C COLOR] [-b] [-B] [-r] [-u] <WORD>
  -c      Foreground color
  -C      Background color
  -b      Bold
  -B      Blink
  -r      Reversed
"

  if [ -z "$1" ]
  then
    echo "$usage" >&2
    return 1
  fi

  local attrs="0"

  while getopts :c:C:bBru opt "$@"
  do
    case $opt in
      c)
        local col=`colorname2number "$OPTARG"`
        attrs="$attrs;$col"
        ;;
      \C)
        local col=`colorname2number -b "$OPTARG"`
        attrs="$attrs;$col"
        ;;
      b)
        attrs="$attrs;$TEXT_Bold"
        ;;
      B)
        attrs="$attrs;$TEXT_Blink"
        ;;
      r)
        attrs="$attrs;$TEXT_Reversed"
        ;;
      u)
        attrs="$attrs;$TEXT_Underscore"
        ;;
      \?)
        echo "$usage" >&2
        return 2
        ;;
    esac
  done

  shift $((OPTIND-1))

  # perl -e 's/$ARGV[0]/\e\[$ARGV[1]m$&\e\[0m/gi' "$1" "$color" -p
  # perl -pe 's/'"$1"'/\e\['"$attrs"'m$&\e\[0m/gi'
  perl -e '$|=1; while (<STDIN>){ s/'"$1"'/\e\['"$attrs"'m$&\e\[0m/gi; print $_; }'
}
# }}}

# p (syntax highligitng) {{{
# easy_install-2.7 --user pygments

_p_command_base='pygmentize -O style=monokai -f console256 -g'

function p () {
  eval $_p_command_base "$@" 2> /dev/null | less -R
}

function pl () {
  eval $_p_command_base "$@" 2> /dev/null | nl -n ln -b a | less -R
}

# }}}

# MD5 / SHA-256 コピー {{{
function copy-md5sum () {
  md5sum -b "$@" | cut -d ' ' -f1 | tr --delete "\n" | tee >(xclip -i)
  echo
}

function copy-sha256sum () {
  sha256sum -b "$@" | cut -d ' ' -f1 | tr --delete "\n" | tee >(xclip -i)
  echo
}
# }}}

# Volume 10 {{{
function manowar () {
  mpc volume 100
  amixer set PCM 100%
}
# }}}

# Shell Title {{{

function _anekos_auto_shell_title_preexec {
  echo -n "\e]2; [$USER@$HOST] $1\a"
}

if [ "$TERM" = "screen" ]
then
  preexec_functions=($preexec_functions _anekos_auto_shell_title_preexec)
fi

# }}}

# 長い処理が終わったときに通知する {{{

function _anekos_longtimeago_preexec {
  # マッチするコマンドの時は無視する
  [[ $1 == (mfc|axe|weechat*|sc|vi*|screen|ssh|vim|git ci|man|ack|ghci|gprolog|irb|lein repl)\ * ]] && return

  local -a cmd
  cmd=(${(z)2})
  local name=$cmd[1]
  [ "$name" = "sudo" ] && local name=$cmd[2]

  _anekos_longtimeago_name="$name"
  _anekos_longtimeago_cmd="$1"
  _anekos_longtimeago_time=`date +%s`
}

function _anekos_longtimeago_precmd {
  local rc=$(( `echo \$status` ))

  [ ${+_anekos_longtimeago_time} = 1 ] || return

  local time=$((`date +%s` - $_anekos_longtimeago_time))
  unset _anekos_longtimeago_time

  # 120 秒以上かかるか、隠れたウィンドウで終了していたら、お知らせ
  if [ $time -gt 120 ] || is-unmapped
  then
    bell
    local short_name=$(echo "$_anekos_longtimeago_name" | awk "{print $1}")
    if [ $rc = 0 ]
    then
      has-command notify-send && notify-send Success "$_anekos_longtimeago_cmd"
      # zsay "$_anekos_longtimeago_name おわたで"
    else
      has-command notify-send && notify-send Fail "$_anekos_longtimeago_cmd"
      # zsay "$_anekos_longtimeago_name 失敗したで"
    fi
  fi

  # おまけで処理にかかった時間も表示
  if [ $time -gt 5 ]
  then
    local unit=sec
    if [ $time -gt 120 ]
    then
      time=$(( $time / 60 ))
      unit=min
    fi
    echo "\e[${TEXT_FG_Green};${TEXT_Italic}mprocessing time: $time $unit\e[0m"
  fi
}

if has-command notify-send || has-command say
then
  TRAPZERR_functions=($TRAPZERR_functions _anekos_longtimeago_TRAPZERR)
  preexec_functions=($preexec_functions _anekos_longtimeago_preexec)
  precmd_functions=($precmd_functions _anekos_longtimeago_precmd)
fi

# }}}

# 何かをインストールしたら、rehash を実行する {{{

function _anekos_rehash_preexec {
  _anekos_rehash_cmd="$1"
}

function _anekos_rehash_precmd {
  if [ "$?" = 0 ]
  then
    case "$_anekos_rehash_cmd" in
     "sudo pacman -S"*|"sudo pacmatic -S"*|"yaourt "*|"pacaur -S "*)
        rehash
        echo "Rehashed."
      ;;
   esac
  fi
  unset _anekos_rehash_cmd
}

preexec_functions=($preexec_functions _anekos_rehash_preexec)
precmd_functions=($precmd_functions _anekos_rehash_precmd)

# }}}

# 猫走る {{{

if [ -z "$__anekos_start_at" ]
then
  function () {
    local pcmd="$(ps --no-header -o cmd --pid `ps --pid $$ -o ppid --no-header`)" # 親プロセス名
    # script 内では走らせない
    [[ "$pcmd" =~ '^script ?.*' ]] && return 0
    local screen_rows=`tput lines`
    local screen_cols=`tput cols`
    if [ "$screen_rows" -gt 20 -a "$screen_cols" -gt 90 -a "$TERM" != "linux" ]
    then
      if has-command nyancat
      then
        nyancat -f 5 --no-count --no-title -e
      elif has-command  ~/script/shell/cat
      then
        ~/script/shell/cat
      fi
    fi
  }
fi

# }}}

# フォントサイズ変更 <Esc>- <Esc>+ {{{
if has-command set-font
then
  function change-font-size-smaller () {
    set-font '' -1 '' ''
  }
  function change-font-size-larger () {
    set-font '' +1 '' ''
  }
  zle -N change-font-size-smaller
  zle -N change-font-size-larger
  bindkey '^[-' change-font-size-smaller
  bindkey '^[+' change-font-size-larger
  bindkey '^[=' change-font-size-larger
fi
# }}}

# zsh マニュアル {{{

# http://qiita.com/yuyuchu3333/items/67630d597c7700a51b95
## man zshall
# zman [search word]
zman() {
    if [[ -n $1 ]]; then
        PAGER="less -g -s '+/"$1"'" man zshall
        echo "Search word: $1"
    else
        man zshall
    fi
}
# zsh 用語検索
# http://qiita.com/mollifier/items/14bbea7503910300b3ba
zwman() {
    zman "^       $1"
}

# zsh フラグ検索
zfman() {
    local w='^'
    w=${(r:8:)w}
    w="$w${(r:7:)1}|$w$1(\[.*\].*)|$w$1:.*:|$w$1/.*/.*"
    zman "$w"
}
# }}}

# RPN 電卓 {{{

function _calc {
  if [[ -z $@ ]] then
    dc | while read r
    do
      echo -e "\e[2m"$(( $r )) 0x$(([##16] $r )) 0b$(([##2] $r ))"\e[m"
    done
  else
    #echo $(( $@ )) 0x$(([##16] $@ )) 0b$(([##2] $@ ))
    local R=`dc -e "$* p"`
    local LR=`echo $R | tail -n 1`
    echo $R | head -n -1
    echo -e "\e[2m"$(( $LR )) 0x$(([##16] $LR )) 0b$(([##2] $LR ))"\e[m"
  fi
}

function _rpncalc () {
  /bin/rpncalc "$@"
}

# alias c="noglob _calc"
alias mfc="noglob mfc"

# }}}

# 補完 {{{

compdef pacaur=pacman

# }}}

# 操作のログをとるコマンド {{{

local _anekos_recorder_logfile=''

function _anekos_recorder_preexec {
  if [ -n "$_anekos_recorder_logfile" ]
  then
    echo "$3" >> "$_anekos_recorder_logfile"
  fi
}

function recorder () {
  local sub="$1"
  local fn="$2"

  case "$sub" in
    start)
      [ -z "$fn" ] && echo "No output file name: $1" && return 1
      [ -e "$fn" ] && echo "Already exitsts: $1" && return 1
      _anekos_recorder_logfile=$(cd $(dirname "$fn") && pwd)/$(basename "$fn")
      printf "\e[${TEXT_FG_White};${TEXT_BG_Blue}m%s\e[0m\n" 'Recorder started!'
      ;;
    stop)
      _anekos_recorder_logfile=''
      printf "\e[${TEXT_FG_White};${TEXT_BG_Blue}m%s\e[0m\n" 'Recorder stopped'
      ;;
    *)
      echo "Ooops"
  esac
}

add-zsh-hook preexec _anekos_recorder_preexec

# }}}

# tt - todo.sh override {{{

function tt {
  local sub="$1"

  case "$sub" in
    a)
      shift

      local full_tags=''
      while [ "${#1}" = 1 ]
      do
        case "$1" in
          h) local full_tag='hledger' ;;
          b) local full_tag='buy' ;;
          w) local full_tag='wish' ;;
          p) local full_tag='project' ;;
          f) local full_tag='food' ;;
          s) local full_tag='shipping' ;;
        esac
        local full_tags="$full_tags +$full_tag"
        shift
      done

      if [ -n "$full_tags" ]
      then
        todo.sh "$sub" "$(date +'%Y-%m-%d') $@ ${full_tags/ /}"
      else
        todo.sh "$sub" "$(date +'%Y-%m-%d') $@"
      fi
      ;;
    ls)
      todo.sh "$@" | marker -c cyan '\d{4}(-\d{2}){2}|\+\S+'
      ;;
    *)
      todo.sh "$@"
  esac
}

# }}}

# コマンドラインを編集 {{{

autoload -U edit-command-line
zle -N edit-command-line
bindkey "^Xe" edit-command-line

# }}}

# flip {{{

function flip () {
   / 
}


# }}}

# Vimperator {{{

# for https://github.com/teramako/vimperator-plugin-httpdjs

function _vimperator {
  curl -X POST -d "q=$*" -d type=cmd -d ot=text http://localhost:8090/vimperator
}

alias vimp="noglob _vimperator"

# }}}

# ruby - rbenv {{{

function init-rbenv {
  if has-command rbenv
  then
    eval "$(rbenv init -)"
  else
    echo 'rbenv not installed' 1>&2
  fi
}

# }}}

# node.js - nvm {{{

function init-nvm {
  if [[ -s ~/.nvm/nvm.sh ]]
  then
    . ~/.nvm/nvm.sh
    nvm use default > /dev/null
    npm_dir="${NVM_PATH}_modules"
    export NODE_PATH="$npm_dir"
  else
    echo 'nvm not found: ~/.nvm/nvm.sh' 1>&2
  fi
}


# }}}

# XMONAD_LAUNCHER {{{

[[ -s ~/.xmonad/zshrc ]] && source ~/.xmonad/zshrc

# }}}

# antigen (bundle for zsh) {{{

[ -f ~/.zshrc.antigen ] && source ~/.zshrc.antigen

# }}}

# Misc {{{

stty erase '^h'

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

has-command pacmatic && alias pacman=pacmatic

# }}}

# LAST {{{

dirs ~/
true

if [ -n "$__anekos_start_at" ]
then
  __anekos_start_time=$(( $(date +%s.%3N) - __anekos_start_at ))
  echo "$__anekos_start_time msec"
fi

# }}}
