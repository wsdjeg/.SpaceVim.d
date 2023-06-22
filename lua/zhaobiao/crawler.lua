--!/usr/bin/lua
local db = require('zhaobiao.database')
local jobstart = vim.fn.jobstart

local crawler_list = {}

local current_rule
local current_stdout = {}

local function extend(t1, t2) -- {{{
  for _, v in pairs(t2) do table.insert(t1, v) end
end
-- }}}

local function curl_stdout(id, data, event) -- {{{
  extend(current_stdout, data)
end
-- }}}


local function curl_exit(id, data, event) -- {{{
  if id == 0 then
    db.insert(current_rule(current_stdout))
  end
end
-- }}}

local function crawler(url, rule) -- {{{
  current_rule = rule
  jobstart({'curl', url}, {
    on_stdout = curl_stdout,
    on_exit = curl_exit,
  })
  
end
-- }}}



return crawler
