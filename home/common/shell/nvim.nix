{ pkgs, colorscheme, ... }:


{
  programs.neovim = {
    enable = true;
    package = pkgs.unstable.neovim-unwrapped;
    #Set as default editor using the EDITOR env variable
    defaultEditor = true;
    #Set Aliases
    viAlias = true;
    vimAlias = true;
    #Enable NodeJs and Python3 providers
    withPython3 = true;
    withNodeJs = true;

    extraConfig = ''

      colorscheme ${colorscheme}
      luafile $HOME/nixos-config/config/nvim/options.lua
      luafile $HOME/nixos-config/config/nvim/autotag.lua
      luafile $HOME/nixos-config/config/nvim/comment.lua
      luafile $HOME/nixos-config/config/nvim/nvim-tree.lua
      luafile $HOME/nixos-config/config/nvim/indent.lua
      luafile $HOME/nixos-config/config/nvim/lualine.lua

      luafile $HOME/nixos-config/config/nvim/lspconfig.lua
      luafile $HOME/nixos-config/config/nvim/lspsaga.lua
      luafile $HOME/nixos-config/config/nvim/lspkind.lua
      luafile $HOME/nixos-config/config/nvim/null-ls.lua
      luafile $HOME/nixos-config/config/nvim/cmp.lua
      luafile $HOME/nixos-config/config/nvim/gitsigns.lua

      luafile $HOME/nixos-config/config/nvim/plugins.lua
      luafile $HOME/nixos-config/config/nvim/mappings.lua
      luafile $HOME/nixos-config/config/nvim/bufferline.lua
      luafile $HOME/nixos-config/config/nvim/treesitter.lua
      luafile $HOME/nixos-config/config/nvim/toggleterm.lua
      luafile $HOME/nixos-config/config/nvim/utils.lua
      luafile $HOME/nixos-config/config/nvim/devicons.lua
      luafile $HOME/nixos-config/config/nvim/which_key.lua


    '';
    # extraLuaConfig = ''
    #
    # '';

    plugins = with pkgs.unstable.vimPlugins; [
      #Color Scheme
      gruvbox-nvim
      dracula-nvim
      nvim-colorizer-lua
      # Nvim Tree
      nvim-tree-lua
      nvim-web-devicons
      #BufferLine
      bufferline-nvim
      #KeyMapping Helper
      which-key-nvim
      #AutoClose Brackets
      nvim-autopairs
      nvim-ts-autotag
      #Nvim lualine
      nvim-navic
      {
        plugin = lualine-nvim;
        type = "lua";
        config = ''
          require("lualine").setup({
            options= {
              theme = "${colorscheme}",
            },
          })
        '';


      }
      #Fidget Loading Bar 
      fidget-nvim
      #Comment Line and Blocks of code
      comment-nvim
      #show Indentation Line
      indent-blankline-nvim

      #Preview Markdown Live in the browser
      markdown-preview-nvim

      #TreeSitter
      nvim-treesitter.withAllGrammars

      #Telescope
      telescope-nvim
      telescope-file-browser-nvim
      plenary-nvim

      #Git 
      gitsigns-nvim
      vim-fugitive

      #Floatting terminal
      toggleterm-nvim

      ##LSP
      nvim-lspconfig
      rust-tools-nvim
      null-ls-nvim
      lspkind-nvim
      lspsaga-nvim

      #CMP
      nvim-cmp
      cmp_luasnip
      cmp-spell
      cmp-path
      cmp-nvim-lua
      cmp-nvim-tags
      cmp-nvim-lsp
      cmp-git
      cmp-buffer
      cmp-cmdline

      vim-nix
    ];
    extraPackages = with pkgs;[
      unstable.terraform-ls
      unstable.prettierd
      unstable.marksman
      unstable.nil
      unstable.nixfmt-rfc-style
      unstable.nixpkgs-fmt
      unstable.shellcheck
      unstable.lua-language-server
      unstable.nodePackages_latest.bash-language-server
      unstable.nodePackages_latest.yaml-language-server
      unstable.nodePackages.typescript-language-server
      unstable.stylua
      unstable.luajitPackages.luacheck
    ];

  };
}
   
