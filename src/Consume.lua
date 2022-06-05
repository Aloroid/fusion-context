--[[
	Consume.lua;
		Looks through the call stack to find a provider to return a value from.
	
]]

local sharedState = require(script.Parent.sharedState)
local PubTypes = require(script.Parent.PubTypes)

local providers = sharedState.providers
local checkpoints = sharedState.checkpoints

local function consume(key: PubTypes.Key)
	
	local threadToCheck = coroutine.running()
	local stack = nil
	local levelToCheck = 2
	
	while true do
		
		local f
		local lookInto = providers[threadToCheck] or {}
		lookInto = lookInto[key] or {}
		
		-- used by Checkpoints
		if stack == nil then
			f = debug.info(threadToCheck, levelToCheck, "f")
		else
			f = stack[levelToCheck]
		end
		
		if f == nil then break end
		
		if lookInto[f] then
			return lookInto[f]
		end
		
		-- Activates the checkpoint
		if checkpoints[f] then
			levelToCheck = 1
			threadToCheck = checkpoints[f]._thread
			stack = checkpoints[f]._stack
			lookInto = providers[threadToCheck][key]
			
			continue
		end
		
		levelToCheck += 1
	end

end

print(consume)
return consume