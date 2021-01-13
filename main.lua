require "class"


local base_class = class()

function base_class:ctor()
	print("base_class:ctor")
end

function base_class:aa()
	print("aa")
end


local bb = class(base_class)

function bb:ctor()
	print("bb:ctor")
end

function bb:bb()
	print("bb")
end

local c = bb.new()

print(c:bb())
