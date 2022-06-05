--[[
	Consume.lua;
		Looks through the call stack to find a provider to return a value from.
	
]]

local sharedState = require(script.Parent.sharedState)
local PubTypes = require(script.Parent.PubTypes)

local providers = sharedState.providers

local function consume(key: PubTypes.Key)
	
	if providers[coroutine.running()] == nil or providers[coroutine.running()][key] == nil then return end
	
	local lookInto = providers[coroutine.running()][key]
	--print(lookInto)
	
	for levelToCheck = 1, math.huge do
		
		local s, f, l = debug.info(levelToCheck, "sfl")
		
		--print(levelToCheck)
		if s == nil then break end
		if s == "[C]" or lookInto[s] == nil or lookInto[s][f] == nil then continue end
		
		local nearestLine, value = 0, nil
		for lineProvider, providerValue in pairs(lookInto[s][f]) do
			if lineProvider <= l and lineProvider > nearestLine then
				nearestLine,value = lineProvider, providerValue
				
			end
			
		end
		
		return value
		
	end

end

return consume