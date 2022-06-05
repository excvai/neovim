local ls = require("luasnip")
local fmt = require("luasnip.extras.fmt")

local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local ecma_snippets = {
  s(
    "usest",
    fmt.fmta("const [<>, <>] = useState(<>);", {
      i(1),
      f(function(args)
        return "set" .. args[1][1]:sub(1, 1):upper() .. args[1][1]:sub(2)
      end, 1),
      i(0),
    })
  ),
}

ls.add_snippets("javascript", ecma_snippets)
ls.add_snippets("javascriptreact", ecma_snippets)
ls.add_snippets("typescript", ecma_snippets)
ls.add_snippets("typescriptreact", ecma_snippets)
