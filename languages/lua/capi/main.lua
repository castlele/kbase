-- local pthread = require("pthread")

-- local t = pthread.createThread("threadCall.lua")

-- pthread.joinThread(t)

local t = love.thread.newThread("threadCall.lua")

t:start()

t:wait()
