
Test = class("Test", ViewControl)

function Test:ctor(model)
	Test.super.ctor(self, model)
end

-- 刷新ui事件
function Test:onShow()
	print("Test:onShow")
	self:refreshUI()
end

-- 控件点击事件
function Test:onClicked()
	print("Test:onClicked")
	self:refreshUI()
end