{ ... }: {
  plugins = {
    cmp = {
      enable = true;
      settings = {
        preselect = "None";
        formatting.fields = [ "kind" "abbr" "menu" ];
        completion.autocomplete = [ "TextChanged" ];
        completion.keywordLength = 1;
        mapping = {
          "<Up>" =
            "cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }";
          "<Down>" =
            "cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }";
          "<C-p>" =
            "cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }";
          "<C-n>" =
            "cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }";
          "<C-k>" =
            "cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert }";
          "<C-j>" =
            "cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert }";
          "<C-u>" = "cmp.mapping.scroll_docs(-4)";
          "<C-d>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-y>" = "cmp.config.disable";
          "<C-e>" =
            "cmp.mapping { i = cmp.mapping.abort(), c = cmp.mapping.close() }";
          "<CR>" = "cmp.mapping.confirm { select = false }";
        };
        sources = [
          {
            name = "nvim_lsp";
            priority = 1000;
          }
          {
            name = "luasnip";
            priority = 750;
          }
          {
            name = "path";
            priority = 250;
          }
          {
            name = "latex_symbols";
            priority = 200;
          }
          {
            name = "emoji";
            priority = 150;
          }
        ];

      };
    };

    cmp-nvim-lsp.enable = true;
    cmp-path.enable = true;
    cmp-buffer.enable = true;
    # cmp-calc.enable = true;
    # cmp-emoji.enable = true;
    # cmp-latex-symbols.enable = true;
    # cmp-pandoc-references.enable = true;
    # cmp-spell.enable = true;
  };

}
