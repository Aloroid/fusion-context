--[[
	Provide.lua;
		Used to distribute the Context values
	
]]
local sharedState = require(script.Parent.sharedState)
local PubTypes = require(script.Parent.PubTypes)

type Key = PubTypes.Key

local function provide(context: Key, value: any)
	
	if type(context) == "table" then
		context = context.key
	end
	
	-- Gets the values needed to identify the Provider
	local s,n = debug.info(2, "sn")
	local provider = sharedState.provide[context]

	-- Checks if there isnt a provider table for the context
	if provider == nil then
		provider = {}
		sharedState.provide[context] = provider
		
	end
	
	if provider[s] == nil then
		provider[s] = {}
	end
	
	provider[s][n] = value

end

return provide