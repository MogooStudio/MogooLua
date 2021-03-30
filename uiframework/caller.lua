
--[[
Caller：事件分发器

]]


Caller = class("Caller")

function Caller:ctor()
	self.listenerMap = {}
end

function Caller:addListener(type, obj, func)
	if not self.listenerMap[type] then
		self.listenerMap[type] = {}
	end
	table.insert(self.listenerMap[type], {obj = obj, func = func})
end

function Caller:removeListener(type, obj, func)
	if not self.listenerMap[type] then
		return false
	end
	local listenerList = self.listenerMap[type]
	for n=#listenerList, 1, -1 do
		if listenerList[n].func == func and listenerList[n].obj == obj then
			table.remove(listenerList, n)
			return true
		end
	end
	return false
end

function Caller:each(type, ... )
	if not self.listenerMap[type] then
		return
	end
	local listenerList = self.listenerMap[type]
	for n=#listenerList, 1, -1 do
		listenerList[n].func(listenerList[n].obj, ...)
	end
end

function Caller:notify(type, ...)
	if not type then
		for k,v in pairs(self.listenerMap) do
			self:each(k, ...)
		end
		return
	end
	self:each(type, ...)
end

function Caller:removeAllListener(type)
	if not type then
		self.listenerMap = {}
		return
	end
	if not self.listenerMap[type] then
		return
	end
	self.listenerMap[type] = {}
end
