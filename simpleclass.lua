
--[[
    简单实现的类

--]]

local function search (k, plist)
  for i=1, table.getn(plist) do
    local v = plist[i][k]
    if v then return v end
  end
end

function createClass (...)
  local class = {}

  setmetatable(class, {__index=
      function (t, k)
        return search(k, arg)
      end
  })

  class.__index = class

  function class:new (o)
    o = o or {}
    setmetatable(o, class)
    return o
  end

  return class
end