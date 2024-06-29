---@class Player
---@field pos Vector2D
local player = {
   pos = { x=0, y=0 },
}

local playerSize = 16

---@private
---@return Player
function player:init()
   local animationGrid = Animator:newGrid {
      frameSize = { width=playerSize, height=playerSize },
      sheetSize = Sprites:getSize("player"),
   }

   return self
end

return player:init()

