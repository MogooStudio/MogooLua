require "init"
require "test"

--[[
uiframe template

]]

local m = ViewModel.new("test")
local t = Test.new(m)

local m1 = ViewModel.new("Theme")
local test = ViewControl.new(m1)
test:addListener("a", t, handler(t, t.onShow))
test:addListener("b", t, handler(t, t.onClicked))
-- test:removeAllListener("a")
test:notify()