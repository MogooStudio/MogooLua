
--[[
ViewBase：
	view层基类

]]

ViewBase = class("ViewBase", Caller)

function ViewBase:ctor(model)
	ViewBase.super.ctor(self)
	self.model = model
	self:_initUI()
end

function ViewBase:_initUI()
	self.tblWidgets = { btnClosed="btnClosed"}
end

function ViewBase:refreshUI()
	print("ViewBase:refreshUI name: " .. self.model:getName())
end