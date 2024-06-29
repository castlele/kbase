---@class Sprites
local spriteSheets = {
   player = love.graphics.newImage("res/sprites/player/playerSheet.png")
}

---@param type string
---| "player"
---@return Size
function spriteSheets:getSize(type)
   assert(type ~= "", "Type can't be an empty string")

   if type == "player" then
      return { width=self.player:getWidth(), height=self.player:getHeight() }
   end

   return SizeZero
end

return spriteSheets
