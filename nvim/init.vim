call plug#begin('~/.config/nvim/plugged')

" -- LSP & Syntax -----------------
Plug 'rescript-lang/vim-rescript', {'branch': 'master'}
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'editorconfig/editorconfig-vim'
" ---------------------------------

" -- Telescope & Navigation --------
Plug 'nvim-lua/plenary.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
" ----------------------------------

" -- Themes ------------------------
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'joshdick/onedark.vim' 
Plug 'drewtempelmeyer/palenight.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'arcticicestudio/nord-vim'
Plug 'mhartington/oceanic-next'
Plug 'morhetz/gruvbox'
Plug 'cocopon/iceberg.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'altercation/vim-colors-solarized'
Plug 'haishanh/night-owl.vim'
" ----------------------------------

" -- General Plugins ---------------
Plug 'junegunn/seoul256.vim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'sheerun/vim-polyglot'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jparise/vim-graphql'
Plug 'neomake/neomake'
Plug 'chrisbra/Colorizer'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'tpope/vim-fugitive'
Plug 'andymass/vim-matchup'
Plug 'windwp/nvim-autopairs'
Plug 'glepnir/dashboard-nvim'
Plug 'SirVer/ultisnips'
" ----------------------------------

call plug#end()

" -- Themes and Colors ----------------
set t_Co=256
set termguicolors
set background=dark

let g:UltiSnipsEditSplit="vertical"
" Dracula
" let g:dracula_colorterm = 0
" let g:dracula_italic = 0
" colorscheme dracula
" let g:airline_theme='dracula'

" Palenight 
" colorscheme palenight
" let g:airline_theme='palenight'

" OceanicNext 
" colorscheme OceanicNext 
" let g:airline_theme='oceanicnext'

" Gruvbox
" colorscheme gruvbox
" let g:airline_theme='gruvbox'
" let g:gruvbox_invert_selection = 0
" set background=light

" Iceberg
" colorscheme iceberg
" let g:airline_theme='iceberg'

" Ayu  
" let ayucolor="light"
" colorscheme ayu 
" let g:airline_theme='ayu'

" One Half
" colorscheme onehalfdark
" let g:airline_theme='onehalfdark'

" Solarized
" syntax enable
" set background=light
" colorscheme solarized

" Night Owl 
" colorscheme night-owl
" let g:airline_theme='night_owl'

" Captuccin 
lua << EOF
local catppuccin = require("catppuccin")

catppuccin.setup {
transparent_background = true,
term_colors = false,
styles = {
	comments = "italic",
	conditionals = "italic",
	loops = "NONE",
	functions = "NONE",
	keywords = "NONE",
	strings = "NONE",
	variables = "NONE",
	numbers = "NONE",
	booleans = "NONE",
	properties = "NONE",
	types = "NONE",
	operators = "NONE",
},
integrations = {
	treesitter = true,
	native_lsp = {
		enabled = true,
		virtual_text = {
			errors = "italic",
			hints = "italic",
			warnings = "italic",
			information = "italic",
		},
		underlines = {
			errors = "underline",
			hints = "underline",
			warnings = "underline",
			information = "underline",
		},
	},
    coc_nvim = false,
	lsp_trouble = false,
	cmp = true,
	lsp_saga = false,
	gitgutter = false,
	gitsigns = true,
	telescope = true,
	nvimtree = {
		enabled = true,
		show_root = false,
		transparent_panel = false,
	},
	neotree = {
		enabled = false,
		show_root = false,
		transparent_panel = false,
	},
	which_key = false,
	indent_blankline = {
		enabled = true,
		colored_indent_levels = false,
	},
	dashboard = true,
	neogit = false,
	vim_sneak = false,
	fern = false,
	barbar = false,
	bufferline = true,
	markdown = true,
	lightspeed = false,
	ts_rainbow = false,
	hop = false,
	notify = true,
	telekasten = true,
	symbols_outline = true,
  }}
EOF
let g:catppuccin_flavour = "macchiato"
colorscheme catppuccin

" ---------------------------------------

" -- lualine ----------------------------
lua << END
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {''},
    lualine_x = {'filename', 'filetype'},
    lualine_y = {''},
    lualine_z = {''}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'nvim-tree', 'fugitive' },
  options = {
     disabled_filetypes = {'NvimTree'}
   }
}
END

" -- nvim-web-devicons ------------------
lua << EOF
require('nvim-autopairs').setup{}
require("nvim-web-devicons").set_icon {
  res = {
    icon = "■",
    color = "#e6484f",
    name = "rescript"
  }
}
EOF
" -------------------------------------------------

" -- nvim.tree config -----------------------------
lua << EOF
local g = vim.g

g.nvim_tree_git_hl = git_status

require'nvim-tree'.setup {
   disable_netrw = true,
   hijack_netrw = true,
   ignore_ft_on_setup = { "dashboard" },
   open_on_tab = true,
   hijack_cursor = true,
   update_cwd = true,
   renderer = {
     root_folder_modifier = table.concat { ":t:gs?$?/", string.rep(" ", 1000), "?:gs?^??" },
     highlight_opened_files = "all",
     add_trailing = true,
     special_files = { },
     indent_markers = {
       enable = true
     },
     icons = {
       glyphs = {
           default = "",
           symlink = "",
           git = {
              deleted = "",
              ignored = "◌",
              renamed = "➜",
              staged = "✓",
              unmerged = "",
              unstaged = "",
              untracked = "",
           },
           folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              empty = "",
              empty_open = "",
              open = "",
              symlink = "",
              symlink_open = "",
           },
        }
     }
   },
   filters = {
     custom = { ".git", "node_modules", ".cache", "*.bs.js" }
   },
   git = {
    ignore = true
   },
   update_focused_file = {
      enable = true,
      update_cwd = true,
   },
   view = {
      side = "left",
      width = 32,
   },
}
EOF
" -------------------------------------------------

" ----- telescope ---------------------------------
lua << EOF
local actions = require "telescope.actions"
require("telescope").setup {
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<c-d>"] = actions.delete_buffer + actions.move_to_top,
        }
      }
    }
  }
}
EOF

" -------------------------------------------------

" -- indent_blankline -----------------------------
lua << EOF
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" -- Shortcuts ------------------------------------
autocmd FileType json nnoremap <leader>fi <cmd>CocCommand  prettier.formatFile eslint.executeAutofix<cr>
autocmd FileType javascript nnoremap <leader>fi <cmd>CocCommand  prettier.formatFile eslint.executeAutofix<cr>
autocmd FileType markdown nnoremap <leader>fi <cmd>CocCommand  prettier.formatFile eslint.executeAutofix<cr>
autocmd FileType rescript nnoremap <leader>fi <cmd>RescriptFormat<cr>
nnoremap <c-s> :w <cr>
nnoremap <c-j> :m +1 <cr>
nnoremap <c-k> :m -2 <cr>
nnoremap <c-l> :nohl <cr>
nnoremap <s-k> 5k <cr>
nnoremap <s-j> 5j <cr>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fw <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>tt <cmd>NvimTreeToggle<cr>
" -------------------------------------------------

" -- Files & Folders ------------------------------
set wildignore+=*_esy/*,*esy.lock/*,*/node_modules/*,*.reast,*.cmj,*.d,*.cmt,*.cmi,*.bs.js
" -------------------------------------------------

" -- Typos ----------------------------------------
iabbrev lenght length
iabbrev widht width
iabbrev heigth height
iabbrev investiments investments
" -------------------------------------------------

" -- Highlight line number ------------------------
 set cursorline
 au InsertEnter * highlight CursorLine ctermfg=none ctermbg=none cterm=none guifg=none guibg=none gui=none
" -------------------------------------------------

function! DisableST()
  return "%#NonText#"
endfunction

lua << EOF
local home = os.getenv('HOME')
local db = require('dashboard')
db.default_banner = {
  "",
  "",
  "",
  "",
  "",
  "",
  "",
  "",
}

db.custom_footer = {"", "📦 " .. vim.fn.getcwd():gsub(home, ""):gsub("/Projects", "") .. ""}

db.custom_center = {
     {
        icon = " ",
        desc = "Open explorer                     ",
        action = "NvimTreeToggle",
        shortcut = "\\tt"
    },{
        icon = "  ",
        desc = "Find word                         ",
        action = "Telescope live_grep",
        shortcut = "\\fh"
    },
    {
        icon = "  ",
        desc = "Find  File                        ",
        action = "Telescope find_files find_command=rg,--hidden,--files",
        shortcut = "\\ff"
    },
    
    {
        icon = "  ",
        desc = "Open dotfiles                     ",
        action = "e " .. home .. "/Projects/dotfiles/nvim/init.vim",
        shortcut = "\\sd"
    }
}

EOF

au BufEnter NvimTree setlocal statusline=%!DisableST()
au VimEnter * Dashboard

syntax on
set nowrap
set clipboard+=unnamedplus
set mouse=a
set completeopt+=preview
set expandtab
set tabstop=2
set softtabstop=2
set relativenumber
set ignorecase
set encoding=utf8
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
