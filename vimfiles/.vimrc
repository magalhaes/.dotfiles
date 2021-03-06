function SetupWrapping(w)
  let &textwidth=a:w
  let &colorcolumn=a:w
endfunction

call pathogen#infect()
syntax on
filetype plugin indent on

:color github

set number

au BufNewFile,BufRead *.thor,Gemfile,Guardfile set filetype=ruby
au BufNewFile,BufRead *.afc,*.afc.txt call SetupWrapping(87)
au BufNewFile,BufRead *.md,README,Readme,*.html,*.markdown call SetupWrapping(80)
au BufNewFile,BufRead *.txt call SetupWrapping(70)

set laststatus=2
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_auto_jump=1

set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is

let mapleader=","

"NerdTree
map <leader>n :NERDTreeToggle<cr>
"Closes vim if the last tab is NERDtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let NERDTreeShowHidden=1
