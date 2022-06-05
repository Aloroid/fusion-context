local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages

local FusionContext = require(Packages.FusionContext)

local checkpoint = FusionContext.Checkpoint
local consume = FusionContext.Consume
local provide = FusionContext.Provide

provide("theme", "bright")

local function a()
	print(consume("theme"))
	warn("getting")
end

local function b()
	a()
end

local function c()
	
	local newCheckpoint = checkpoint()
	provide("theme", "dark")
	
	local co = coroutine.create(function()
		newCheckpoint:apply()
		
		b()
	end)
	warn(coroutine.resume(co))
	
end

c()
warn("Finished")