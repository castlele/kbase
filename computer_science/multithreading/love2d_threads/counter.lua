local function count(n)
   print("Counting: " .. n)

   return n + 1
end

local n = 0

while true do
   n = count(n)
   -- love.timer.sleep(5)
   print(coroutine.running())
end
