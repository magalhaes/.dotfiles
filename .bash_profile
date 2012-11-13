#mac colorized terminal output
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

# git
if [ -f ~/.git-completion.bash ] ; then source ~/.git-completion.bash ; fi

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/[\1$(parse_git_dirty)]/"
}

function current_ruby {
  ruby -v | ruby -e 'puts "rubai #{gets.chop.split(" ")[1]}"'
}

#aliases:
alias sbp="source ~/.bash_profile"
alias kp="ps auxwww"
alias ss="open /System/Library/Frameworks/ScreenSaver.framework/Resources/ScreenSaverEngine.app"

alias firefox="open /Applications/Firefox.app"
alias chrome="open /Applications/Google\ Chrome.app"
alias please="bundle exec rake"

export PATH=/opt/local/bin:/opt/local/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/mysql/bin:$PATH

#homebrew
export HOMEBREW_CC=llvm
export HOMEBREW_EDITOR=vim

#macvim command line
alias vim="echo using 'mvim -v';mvim -v"

#scripts e rbenv
export PATH="~/.dotfiles/scripts:$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

function promp {
  PS1="[\u@\h] (\e[0;30m$(current_ruby)\e[m) \e[0;33m\w\a\e[m $(parse_git_branch)\n\$ " 
}
PROMPT_COMMAND=promp

# Setting PATH for JRuby 1.7.0
# The orginal version is saved in .bash_profile.jrubysave
PATH="${PATH}:/Library/Frameworks/JRuby.framework/Versions/Current/bin"
export PATH
