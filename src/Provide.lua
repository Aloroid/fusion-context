--[[
	Provide.lua;
		Used to distribute the Context values
	
]]
local sharedState = require(script.Parent.sharedState)
local PubTypes = require(script.Parent.PubTypes)

type Key = PubTypes.Key

local providers = sharedState.providers

local function provide(key: Key, value: any)
	
	
	-- Gets the values needed to identify the Provider
	local f = debug.info(2, "f")
	local providersInThread = providers[coroutine.running()] or {}
	providers[coroutine.running()] = providersInThread
	
	providersInThread[key] = providersInThread[key] or {}
	
	providersInThread[key][f] = value
	
	--print("Provider made:", coroutine.running(), key, s, f, l)
	
end

return provide