
ViewModel = class("ViewModel")

function ViewModel:ctor(name)
	self.name = name
end

function ViewModel:getName()
	return self.name
end

function ViewModel:setName(name)
	self.name = name
end