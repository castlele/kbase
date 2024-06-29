local anim8 = require("libs.anim8")

---@class Animator
local animator = {}

---@class GridInitArgs
---@field frameSize Size
---@field sheetSize Size
---@param args GridInitArgs
---@return Grid
function animator:newGrid(args)
   assert(args.frameSize, "No size for a single animation provided")
   assert(args.sheetSize, "No size for source image provided")

   return anim8.newGrid(
      args.frameSize.width,
      args.frameSize.height,
      args.sheetSize.width,
      args.sheetSize.height
   )
end

return animator
