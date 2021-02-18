" Liitännäiset
call plug#begin()
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar', { 'for': 'python' }
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-fugitive'
Plug 'romainl/vim-qf'
Plug 'chrisbra/csv.vim'
Plug 'wellle/targets.vim'
Plug 'sukima/xmledit'
Plug 'posva/vim-vue'
Plug 'Chiel92/vim-autoformat'
Plug 'AndrewRadev/linediff.vim'

" Tmux-navigate-liitännäinen.
Plug 'sunaku/tmux-navigate'

" Käytöstä poistetut.
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'dracula/vim', { 'as': 'dracula' }
call plug#end()

" Syntaksin mukainen korostus.
syntax on

" Sisennykset
set autoindent
set smartindent
set tabstop=2
set shiftwidth=2
set expandtab
autocmd FileType java setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
autocmd FileType javascript setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType html setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType xml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType php setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2
autocmd FileType python setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

" Hiiri
set mouse=a

" Painamalla F5 poistetaan kaikkien rivien lopussa olevat tyhjät välilyönnit
nnoremap <silent> <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" Painamalla F8 avataan Tagbar
nmap <F8> :TagbarToggle<CR>

" Asetetaan VIM tukemaan enemmän värejä
set t_Co=256

" Vaihdetaan silmäystävällisempi väriteema
colorscheme holokai

" Asetetaan modeline päälle eli luetaan avattavasta tiedosta VIM konfiguraatiot
" kommenteista tiedoston ensimmäiseltä tai viimeiseltä riviltä, mikäli niitä on
set modeline

" Näytetään tilarivi aina. Normaalisti se näkyy vain kun on monta ikkunaa auki
set laststatus=2

" Ei näytä lisäys-, valinta- tms. Vim-toimintatilaa.
" Airline-liitännäinen näyttää tämän tilarivillä.
set noshowmode

" Kursorin väri: valkea lisäystilassa, vihreä muuten.
" Palautetaan oletus poistuttaessa.
let &t_SI = "\<Esc>]12;#ffffff\x7"
let &t_EI = "\<Esc>]12;#5fffaf\x7"
silent !echo -ne "\033]12;\#5fffaf\007"
autocmd VimLeave * silent !echo -ne "\033]112\007"

" Näytetään tilarivillä kursorin sijaintitiedot
set ruler

" ====== Tilarivin tyyliasetukset ======
" Muista käyttää += lisättäessä omia tyylejä

" Fugitive
set statusline=%{fugitive#statusline()}
set statusline+=\ %*

" start of default statusline
set statusline+=%f\ %h%w%m%r

" end of default statusline (with ruler)
set statusline+=%=%(%l,%c%V\ %=\ %P%)
" =================================

" neomake asetukset
" Ajetaan tarkistukset 1/4 sekunnin kuluttua kirjoittaessa tiedostoon
" sekä kun normaalitila ('komentotila', 'escitila') vaihtuu
call neomake#configure#automake('nw', 250)
" Avataan virhelista automaattisesti
let g:neomake_open_list = 2


" Airline-liitännäinen.
let g:airline#extensions#tabline#enabled = 1


" Vim-qf-liitännäinen.
" Korjaa ongelman, joka tulee neomaken kanssa kun kahdessa ikkunassa on
" quickfix lista ja toinen niistä suljetaan
" https://github.com/neomake/neomake/issues/842
let g:qf_loclist_window_bottom=0


" Liiku kirjainkoolla/alaviivoilla eroteltujen osien välillä Optio-näppäimellä.
let g:wordmotion_mappings = {
\ 'w' : 'Ω',
\ 'b' : '›',
\ 'e' : 'é',
\ 'ge' : 'gé',
\ 'aw' : 'aΩ',
\ 'iw' : 'iΩ'
\ }
" Samat näppäinyhdistelmät PC-ympäristössä (Meta-näppäin).
"let g:wordmotion_mappings = {
"\ 'w' : 'w',
"\ 'b' : 'b',
"\ 'e' : 'e',
"\ 'ge' : 'ge',
"\ 'aw' : 'aw',
"\ 'iw' : 'iw'
"\ }

" Hae symbolit VIMTAGS-ympäristömuuttujan osoittamasta tiedostosta.
set tags=$VIMTAGS

" set shell=/bin/bash\ -i

" Muunna sisennyssyvyys neljästä kahteen / kahdesta neljään.
vnoremap <C-H> :s/^\( *\)\1/\1/<CR>:nohlsearch<CR>
vnoremap <C-L> :s/^\( *\)/&&/<CR>:nohlsearch<CR>

" inoremap jk <Esc>

" Siirry lisäystilassa Control-[HJKL]-komentoa käyttäen.
inoremap <C-H> <Left>
inoremap <C-J> <Down>
inoremap <C-K> <Up>
inoremap <C-L> <Right>

" SQL-sisällön automaattinen sisennys.
noremap <F3> :Autoformat<CR>
let g:formatdef_sql = '"sqlformat --reindent --indent_width 2 --reindent_aligned --wrap_after 80 --keywords upper -"'
let g:formatters_sql = ['sql']

" XML-sisällön sisennys komennolla :FormatXML ja automaattisesti.
let g:formatdef_xml = '"python -c \"import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())\""'
let g:formatters_xml = ['xml']
com! FormatXML :%!python3 -c "import xml.dom.minidom, sys; print(xml.dom.minidom.parse(sys.stdin).toprettyxml())"

" Käytä järjestelmän leikepöytää nimettömänä Vim-leikepöytänä.
set clipboard=unnamed

" Salli laajempi muokkaus askelpalauttimella lisäystilassa.
set backspace=indent,eol,start

" Lisää python-luokkaan __init__-metodi näppäinyhdistelmää <Alt-I> käyttäen.
autocmd FileType python nnoremap ı odef __init__(self, *args, **kwargs):<CR>super().__init__(*args, **kwargs)<CR># def __init__<Esc>O
" Huom. vastaavasti ^[i PC-ympäristössä.

" Lisää python-koodilohkon loppukommentti näppäinyhdistelmää <Alt-O> käyttäen.
autocmd FileType python nnoremap œ ma0j?\S<CR>^:s/  #/###/e<CR>hh"ay0:s/###/  #/e<CR>?^<C-R>a\w<CR>"ayy'a"apI  # <Esc>$x:s/(.*)//ge<CR>
" Huom. vastaavasti ^[o PC-ympäristössä.

" Korosta virheelliset välilyönnit punaisella.
highlight ValeValilyonti ctermbg=red guibg=red
autocmd Syntax * syn match ValeValilyonti / /


" Siirrytään Vim-ikkunoiden ja Tmux-paneelien välillä
" Ctrl-välilyönti + HJKL-näppäimillä.
" Vrt. https://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  inoremap <C-w>h <Esc>:call TmuxOrSplitSwitch('h', 'L')<cr>
  inoremap <C-w>j <Esc>:call TmuxOrSplitSwitch('j', 'D')<cr>
  inoremap <C-w>k <Esc>:call TmuxOrSplitSwitch('k', 'U')<cr>
  inoremap <C-w>l <Esc>:call TmuxOrSplitSwitch('l', 'R')<cr>

  nnoremap <C-w>h :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <C-w>j :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <C-w>k :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <C-w>l :call TmuxOrSplitSwitch('l', 'R')<cr>
endif
