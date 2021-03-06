local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  vim.notify("alpha require failed")
  return
end

local dashboard = require("alpha.themes.dashboard")
dashboard.section.header.val = {
  [[       ,.,                           ]],
  [[      MMMM_    ,..,                  ]],
  [[        "_ "__"MMMMM          ,...,, ]],
  [[ ,..., __." --"    ,.,     _-"MMMMMMM]],
  [[MMMMMM"___ "_._   MMM"_."" _ """"""  ]],
  [[ """""    "" , \_.   "_. ."          ]],
  [[        ,., _"__ \__./ ."            ]],
  [[       MMMMM_"  "_    ./             ]],
  [[        ''''      (    )             ]],
  [[ ._______________.-'____"---._.      ]],
  [[  \                          /       ]],
  [[   \________________________/        ]],
  [[   (_)                    (_)        ]],
  [[                                     ]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope find_files <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

local function footer()
  -- NOTE: requires the fortune-mod package to work
  -- local handle = io.popen("fortune")
  -- local fortune = handle:read("*a")
  -- handle:close()
  -- return fortune
  return "OwO"
end

dashboard.section.footer.val = footer()

dashboard.section.footer.opts.hl = "Type"
dashboard.section.header.opts.hl = "Include"
dashboard.section.buttons.opts.hl = "Keyword"

dashboard.opts.opts.noautocmd = true
-- vim.cmd([[autocmd User AlphaReady echo 'ready']])
alpha.setup(dashboard.opts)
