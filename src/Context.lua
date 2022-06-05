--[[
	Context.lua;
		Creates a new Context object that can be used to provide.
	
]]

local sharedState = require(script.Parent.sharedState)
local PubTypes = require(script.Parent.PubTypes)

--[=[
	@class Context
	A special table that surrounds a key and value that can be used by providers
	to distribute to their consumers
	
]=]

--- @within Context
--- @prop _context boolean
--- Indicates it is a Context

--- @within Context
--- @prop key string
--- The key of the Context.

--- @within Context
--- @prop value any
--- The default value that will be retrieved if there is no provider

local function context(key: string, value: any): PubTypes.Context

	if sharedState.context[key] then
		return sharedState.context[key]

	end

	local self = {
		_context = true,
		key = key,
		value = value

	}

	sharedState.context[key] = self

	return self

end

return context