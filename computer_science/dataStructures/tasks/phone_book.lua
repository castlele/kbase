-- This task is taken from https://www.hackerrank.com/challenges/30-dictionaries-and-maps/problem

require("cluautils.string_utils")
local HashMap = require("cluautils.datastructures.hashmap")

---@param item string
---@return integer
local function hashFunction(item)
   return #item
end

---@param input table?
---@return HashMap, table<string>
local function parseInput(input)
   local localInput = input or arg
   local capacity = tonumber(localInput[1])
   local storage = {}
   local queries = {}

   for i = 2, capacity + 1 do
      local items = tostring(localInput[i]):split(" ")

      storage[items[1]] = items[2]
   end

   for i = capacity + 2, #localInput do
      table.insert(queries, localInput[i])
   end

   return HashMap:new(storage, nil, hashFunction), queries
end

local t = require("cluautils.tests")

t.describe("Phone book tests", function ()
   t.it("Test 1: Normal input", function ()
      local map, queries = parseInput({
         "3",
         "sam 99912222",
         "tom 11122222",
         "harry 12299933",
         "sam",
         "edward",
         "harry",
      })

      for _, query in ipairs(queries) do
         local number = map:get(query)

         if number then
            print(query .. "=" .. number)
         else
            print("Not found")
         end
      end
   end)
end)
