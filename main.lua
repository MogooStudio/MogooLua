require "init"
require "test"

--[[
ui framework

]]

local m = ViewModel.new("test")
local t = Test.new(m)

local m1 = ViewModel.new("Theme")
local test = ViewControl.new(m1)
test:addListener("a", t, handler(t, t.onShow))
test:addListener("b", t, handler(t, t.onClicked))
test:removeAllListener("a")
test:notify()

--[[
utils

]]

local tm = utils.GetReaminSecondsTo24()
local timeData = utils.FormatTime(tm)
print(timeData)

tm = os.time()
local week = utils.FormatWeekDay(tm)
print(week)

local str = "My name is {1} , I'm {2} years old."
print(utils.FormatText(str, "jack", 10))

