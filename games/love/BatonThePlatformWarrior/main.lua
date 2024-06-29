local anim8 = require("libs.anim8")
local wf = require("libs.windfield")

function love.load()
   love.graphics.setDefaultFilter("nearest", "nearest")

   local gravity = { x=0, y=500 }

   World = wf.newWorld(gravity.x, gravity.y)
   Player = {
      x = 400,
      y = 200,
      size = 16,
      maxSpeed = 300,
      animations = {},
   }

   Player.spriteSheet = love.graphics.newImage("res/sprites/player-baton-16x16.png")
   Player.animationGrid = anim8.newGrid(
      Player.size,
      Player.size,
      Player.spriteSheet:getWidth(),
      Player.spriteSheet:getHeight()
   )
   Player.animations.idle = anim8.newAnimation {
      frames = Player.animationGrid("1-1", 1),
      durations = 0.2,
   }
   Player.collider = World:newRectangleCollider(
      Player.x,
      Player.y,
      Player.size * 6,
      Player.size * 6
   )
   Player.animation = Player.animations.idle

   local ground = World:newRectangleCollider(100, 400, 600, 100)
   ground:setType("static")
end

function love.update(dt)
   local px, _ = Player.collider:getLinearVelocity()

   if love.keyboard.isDown("left") and px > -Player.maxSpeed then
      Player.collider:applyForce(-5000, 0)
   elseif love.keyboard.isDown("right") and px < Player.maxSpeed then
      Player.collider:applyForce(5000, 0)
   end

   World:update(dt)

   Player.x = (Player.collider:getX() - Player.size * 6 / 2)
   Player.y = (Player.collider:getY() - Player.size * 6 / 2)

   Player.animation:update(dt)
end

function love.keypressed(key)
   if key == "up" then
      Player.collider:applyLinearImpulse(0, -5000)
   end
end

function love.draw()
   World:draw()
   Player.animation:draw(
      Player.spriteSheet,
      Player.x,
      Player.y,
      nil,
      6
   )
end
