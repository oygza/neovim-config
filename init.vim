" include vim-plug
call plug#begin()

Plug 'neovim/nvim-lspconfig'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'preservim/nerdcommenter'
Plug 'ayu-theme/ayu-vim'
Plug 'kien/ctrlp.vim'
Plug 'hrsh7th/nvim-compe'
Plug 'glepnir/lspsaga.nvim'
Plug 'glepnir/dashboard-nvim'
Plug 'itchyny/vim-gitbranch'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'rakr/vim-one'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'





"""""""""  补全go tag
let g:UltinipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""  高亮go代码
let g:go_highlight_fields=1
let g:go_highlight_functions=1
let g:go_highlight_function_calls=1
let g:go_metalinter_enabled=['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave=1
autocmd FileType go nmap <leader>z  <Plug>(go-run)



call plug#end()


"""""""""""""""""""""""""""""""""""""""
"          temp config                "
"""""""""""""""""""""""""""""""""""""""
let g:dashboard_default_executive ='fzf'
let g:dashboard_custom_section={
  \ 'select_file': {
      \ 'description': ['● Select File                    Leader F '],
      \ 'command': 'FZF' },
  \ 'file_history': {
      \ 'description': ['● File History                   Leader b '],
      \ 'command': ':History'}
  \ }
let g:dashboard_custom_footer=[
            \'哈喽呀'
\]
let g:dashboard_custom_header=[
    \'',
    \'    ████▌█████▌█ ████████▐▀██▀    ',
    \'  ▄█████ █████▌ █ ▀██████▌█▄▄▀▄   ',
    \'  ▌███▌█ ▐███▌▌  ▄▄ ▌█▌███▐███ ▀  ',
    \' ▐ ▐██  ▄▄▐▀█   ▐▄█▀▌█▐███▐█      ',
    \'   ███ ▌▄█▌  ▀  ▀██  ▀██████▌     ',
    \'    ▀█▌▀██▀ ▄         ███▐███     ',
    \'     ██▌             ▐███████▌    ',
    \'     ███     ▀█▀     ▐██▐███▀▌    ',
    \'     ▌█▌█▄         ▄▄████▀ ▀      ',
    \'       █▀██▄▄▄ ▄▄▀▀▒█▀█           ',
    \'',
    \]


"""""""""""" 文件显示git
let g:NERDTreeGitStatusConcealBrackets = 1
"""""""""""" 行数显示git
let g:gitgutter_highlight_linenrs = 1



"""""""""""""""""""""""""""""""""""""""
"          normal config              "
"""""""""""""""""""""""""""""""""""""""

" vim themes
set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
" let ayucolor="dark"   " for dark version of theme
colorscheme one
set background=light



let mapleader=";"
nnoremap <leader>F :FZF<CR>
nnoremap <leader>b :History<CR>
nnoremap <leader>r :e<CR>
nnoremap <leader>s :update<CR>


set encoding=utf-8                                          " 编码
set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1        " 编码猜测
set number
set incsearch                                               " 搜索时即高亮
set mouse=a
set ignorecase                                              " 搜索时大消息不敏感
set hlsearch                                                " 高亮匹配内容
set nowrap                                                  " 不要自动换行
set smartindent                                             " 智能缩进
set autoindent                                              " 自动换行缩进
set autoindent                                              " 使用空格进行缩进
set expandtab                                               " tab扩展为空格
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set smartindent
set shiftround
set nocompatible                                            " 不要兼容vi
"set clipboard=unnamed
set clipboard=unnamedplus
set updatetime=100
syntax on                                                   "


"""""""""""""""""""""""""""""""""""""""
"           nerdtree config           "
"""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let NERDTreeShowBookmarks=1
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

"""""""""""""""""""""""""""""""""""""""
"          vim-airline                "
"""""""""""""""""""""""""""""""""""""""
"let g:airline_theme='luna'
" let g:airline_theme='light'

"""""""""""""""""""""""""""""""""""""""
"          lightline                  "
"""""""""""""""""""""""""""""""""""""""

let g:lightline = {
  \ 'colorscheme': 'PaperColor_light',
  \ 'active': {
  \   'left': [
  \     [ 'mode', 'paste' ], 
  \     [ 'ctrlpmark', 'git', 'diagnostic', 'filename', 'method' ]
  \   ],
  \   'right':[
  \     [ 'filetype', 'fileencoding', 'lineinfo', 'percent','charvaluehex'],
  \     ['gitbranch'],
  \   ],
  \ },
  \ 'component': {
  \   'charvaluehex': '0x%B',
  \},
  \ 'component_function': {
  \   'gitbranch': 'gitbranch#name',
  \   'filename': 'LightlineFilename',
  \   'blame': 'LightlineGitBlame',
  \ }
\ }

function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction

function! LightlineGitBlame() abort
    "let blame = get(b:, 'coc_git_blame', '')
    let blame = get(g:, 'coc_git_status', '')
        " return blame
    return winwidth(0) > 120 ? blame : ''
endfunction

"""""""""""""""""""""""""""""""""""""""
"           nerdcomment config        "
"""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


"""""""""""""""""""""""""""""""""""""""
"           Nvim lsp config           "
"""""""""""""""""""""""""""""""""""""""


lua << EOF
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("v", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
      hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]], false)
  end
end

-- Use a loop to conveniently both setup defined servers 
-- and map buffer local keybindings when the language server attaches
-- local servers = { "pyright", "rust_analyzer", "tsserver" }
-- for _, lsp in ipairs(servers) do
--  nvim_lsp[lsp].setup { on_attach = on_attach }
-- end
nvim_lsp.intelephense.setup{
    on_attach = on_attach;
    cmd = { "intelephense", "--stdio" };
    filetypes = {"php"};
    root_dir = nvim_lsp.util.root_pattern("composer.json",".git");
}



nvim_lsp.bashls.setup{on_attach = on_attach}


nvim_lsp.gopls.setup{
    on_attach = on_attach;
    cmd = {"gopls"};
    filetypes = {"go","gomod"};
    root_dir = nvim_lsp.util.root_pattern("go.mod",".git");
    settings = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    };
}

EOF

"""""""""""""""""""""""""""""""""""""""
"           goimports 自动保存(停用)  "
"""""""""""""""""""""""""""""""""""""""

lua <<EOF
  function goimports(timeout_ms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit or type(action.command) == "table" then
      if action.edit then
        vim.lsp.util.apply_workspace_edit(action.edit)
      end
      if type(action.command) == "table" then
        vim.lsp.buf.execute_command(action.command)
      end
    else
      vim.lsp.buf.execute_command(action)
    end
  end
EOF
" autocmd BufWritePre *.go lua goimports(1000)
" autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
" autocmd FileType go setlocal omnifunc=v:lua.vim.lsp.omnifunc

"""""""""""""""""""""""""""""""""""""""
"           nvim completion config    "
"""""""""""""""""""""""""""""""""""""""

lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'always';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 150;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}
EOF

highlight link CompeDocumentation NormalFloat
set completeopt=menuone,noselect
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <silent><expr> <CR>      compe#confirm('<CR>')


lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF
nnoremap <silent><leader>ai <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ai :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
