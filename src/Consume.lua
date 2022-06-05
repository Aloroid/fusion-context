--[[
	Consume.lua;
		Looks through the call stack to find a provider to return a value from.
	
]]

local sharedState = require(script.Parent.sharedState)
local PubTypes = require(script.Parent.PubTypes)

local function consume(key: PubTypes.Key)
	
	-- Get the string key
	if type(key) == "table" then
		key = key.key
	end
	
	assert(sharedState.context[key], "Context doesn't exist")
	
	-- Return the default value if there is no provider with that key
	if sharedState.provide[key] == nil then
		return sharedState.context[key].value

	end

	-- Iterate through the stack and find out if there is a provider/checkpoint
	-- If we have found a Provider, get the value from it
	-- If we have not found a Provider, return the default value.
	local ok, level, value = false, 2, sharedState.context[key].value
	local provide = sharedState.provide[key]
	
	while ok == false do

		-- Get the debug info as it will be used to identify the Context
		local s, n = debug.info(level, "sn")
		
		-- Make sure we aren't running into dead ends or places
		-- where there is no provider
		if s == nil then break end
		if s == "[C]" then level += 1 continue end
		if provide[s] == nil then level += 1 continue end
		
		-- Get the value of the Provider
		local providerValue = provide[s][n]
		
		if providerValue then
			ok = true
			value = providerValue
			
		end

		level += 1

	end
	
	--print("consumed", level-3,"levels")
	return value

end

return consume