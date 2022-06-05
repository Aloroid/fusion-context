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
	local s,f,l = debug.info(2, "sfl")
	local providersInThread = providers[coroutine.running()] or {}
	providers[coroutine.running()] = providersInThread
	
	local providersWithKey = providersInThread[key] or {}
	providersInThread[key] = providersWithKey
	
	local providersInScript = providersWithKey[s] or {}
	providersWithKey[s] = providersInScript
	
	local providersInFunction = providersInScript[f] or {}
	providersInScript[f] = providersInFunction
	
	providersInFunction[l] = value
	
	--print("Provider made:", coroutine.running(), key, s, f, l)
	
end

return provide