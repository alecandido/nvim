-- only pure lua + neovim available, since plugins are loaded later on
-- (including plenary)

-- takes the path of the current file from 'require' call
-- https://stackoverflow.com/a/9146653/8653979
local parent = ...

require(parent .. ".airline")
require(parent .. ".filebrowser")
require(parent .. ".nord")
require(parent .. ".polyglot")
