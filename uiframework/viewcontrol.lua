
--[[
ViewControl：
	处理view层各类事件

]]

ViewControl = class("ViewControl", ViewBase)

function ViewControl:ctor(model)
	ViewControl.super.ctor(self, model)
	self:_initEvents()
end

function ViewControl:_initEvents()

end

