
--[[
    双端队列
--]]

local deque = {}

function deque:ctor()
    self.list = {first = 0, last = -1}
end
 
function deque:pushFront(value)
    local first = self.list.first - 1
    self.list.first = first
    self.list[first] = value
end
 
function deque:pushBack(value)
    local last = self.list.last + 1
    self.list.last = last
    self.list[last] = value
end

function deque:popFront()
    local first = self.list.first
    if first > self.list.last then
        return nil
    end
    local value = self.list[first]
    self.list[first] = nil
    self.list.first = first + 1
    return value
end

function deque:popBack()
    local last = self.list.last
    if self.list.first > last then
        return nil
    end
    local value = self.list[last]
    self.list[last] = nil
    self.list.last = last - 1
    return value
end

function deque:display()
    if self.list.first > self.list.last then
        return
    end
    for i = self.list.first,self.list.last do
        print(self.list[i])
    end
end

function deque:size()
    if self.list.first > self.list.last then
        return 0
    end
    return math.abs(self.list.last - self.list.first) + 1
end

deque:ctor()

return deque
