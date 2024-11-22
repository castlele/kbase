local function startLove2dThread(shouldStart)
   if not shouldStart then return end

   local counterThread = love.thread.newThread("counter.lua")

   counterThread:start()
end

local function startCustomThread(shouldStart)
   if not shouldStart then return end

   require("pthread").counterThread("counter.lua")
end

function love.load()
   startLove2dThread(false)
   startCustomThread(true)
end

local mousePos = {0, 0}

function love.update(dt)
   if love.mouse.isDown(1) then
      mousePos[1] = love.mouse.getX()
      mousePos[2] = love.mouse.getY()
   end
end

function love.draw()
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
