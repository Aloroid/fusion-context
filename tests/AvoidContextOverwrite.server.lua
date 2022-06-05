local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages

local FusionContext = require(Packages.FusionContext)

local consume = FusionContext.Consume
local provide = FusionContext.Provide

local function doStuff()
    local id = consume("thread")
    print("I am thread", id)
    task.wait()
    print("I was thread", id, "and now I'm thread", consume("thread"))
end

local function abc(id)
    provide("thread", id)
	--print(consume("thread"))
	
    doStuff()
end

for id=1, 10 do
    task.spawn(abc, id)
end