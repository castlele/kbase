local ViewController = {
}


function ViewController:draw()
   -- os.execute("clear")
   io.write("\027[H\027[2J")
   io.write([[
       1 2 3
      -------
     1| | | |
     2| | | |
     3| | | |
      -------
   ]])
end

function ViewController:waitUserInput()
end

function ViewController:shouldClose()
   return io.read(1) == "s"
end


local function main()
   while not ViewController:shouldClose() do
      ViewController:draw()
      ViewController:waitUserInput()
   end
end


main()
