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
	local s,n,l = debug.info(2, "snl")
	local provider = sharedState.provide[context]

	-- Checks if there isnt a provider table for the context
	if provider == nil then
		provider = {}
		sharedState.provide[context] = provider
		
	end
	
	if provider[s] == nil then
		provider[s] = {}
	end
	
	if provider[s][n] == nil then
		provider[s][n] = {}
		
	end
	
	provider[s][n][l] = value

end

return provide