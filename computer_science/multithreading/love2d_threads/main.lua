function love.load()
   local counterThread = love.thread.newThread("counter.lua")

   counterThread:start()
end

local mousePos = {0, 0}

function love.update(dt)
   if love.mouse.isDown(1) then
      mousePos[1] = love.mouse.getX()
      mousePos[2] = love.mouse.getY()
   end
end

function love.draw()
   local w = love.graphics.getWidth()
   local h = love.graphics.getHeight()

   local rw = 50
   local rh = 50

   love.graphics.rectangle(
      "fill",
      mousePos[1],
      mousePos[2],
      rw,
      rh
   )
end
