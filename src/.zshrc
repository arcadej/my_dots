# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
# End of lines configured by zsh-newuser-install
bindkey -e

autoload -U compinit; compinit

autoload -Uz colors
colors

setopt auto_cd

alias ...='cd ../../'
alias ....='cd ../../../'

setopt extended_glob

zstyle ':completion:*:default' menu select=1

# 2行表示
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

####
#### 日付入力
#### F5 で日付時刻を入力
####
#### 参考URL http://nanabit.net/blog/2009/11/29/insert-date-on-single-key/
##function insert_date {
###  LBUFFER=$LBUFFER'$(date +%Y%m%d)'
##  LBUFFER=$LBUFFER`date +%Y-%m-%dT%H:%M:%S`
##}
### 新しいキーマップの作成
##zle -N insert_date
### F5に割り当て
##bindkey '^[[15~' insert_date

chroot_info() {
    chroot=$(cat /etc/debian_chroot 2>/dev/null) || return
    echo "${chroot}|"
}

##
## プロンプトの設定
##   メモ
##   %~ : カレントディレクトリのフルパス
##   %B 〜 %b : この間を太文字に
##   %m : ホスト名
##   %n : ユーザ名
##   %# : ユーザ種別 (#: root, %: root 以外)
##
autoload -U colors
colors

if [ $USER = root ] ; then
  export PROMPT='%B%F{red}%m:%/%#%b '
else
  # 被る時は右プロンプトを消す
  unsetopt promptcr
  # 環境変数をプロンプトに展開する
  setopt prompt_subst
 
  # 左プロンプトの表示
  if [ $TERM = "dumb" ]; then
    # 石渡オリジナル  tramp 用
    export PROMPT='%m:%/%# '
  else
    # http://www.gentei.org/~yuuji/rec/pc/intro-zsh.html より
    PROMPT='%{[$[32+$RANDOM % 5]m%}%U%B$HOST'"{`whoami`}%b%%%{[m%}%u 
%$"
  fi
  # フルパス全て表示
  local dirs='%B%F{yellow}%~%b%f'
 
  # 右プロンプトの設定
  local chroot='%B%F{green}$(chroot_info)%f'
  local vcs='%B%F{red}$(vcs_prompt_info)%f'
  # 右プロンプトを設定 -- chroot|vcsinfo|pwd という表示
  RPROMPT=$chroot$vcs$dirs
fi

##
## VCS 情報の表示
##
if [[ $ZSH_VERSION == (<5->|4.<4->|4.3.<10->)* ]]; then
    autoload -Uz vcs_info
    autoload -Uz add-zsh-hook
    zstyle ':vcs_info:*' enable git svn
    zstyle ':vcs_info:*' formats '%F{green}%s:%b|'
    # コンフリクトなど特別な場合
    zstyle ':vcs_info:*' actionformats '%F{red}%s:%b%a'
    vcs_prompt_info(){
        LANG=C vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && echo "$vcs_info_msg_0_"
    }
else
    vcs_prompt_info() {
        ref=$(git-symbolic-ref HEAD 2> /dev/null) || return
        echo "git:${ref#refs/heads/}|"
    }
fi

#zstyle ':completion:*::::' completer _complete _migemo_complete

# ファイル名をたたいた時,cygopen で開くようにする
function command_not_found_handler() {
	if [ -f $0 ]; then
		cygstart $0
		return 0
	else
		return 127
	fi
}
