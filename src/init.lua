
local PubTypes = require(script.PubTypes)

--[=[
	@class FusionContext
	The main Class you would be accessing
	
]=]

--[=[
	@within FusionContext
	@function Context
	Creates a new Context object that is used as a template for providers and default value for Consumers
	
	@param key string
	@param defaultValue any
	@return FusionContext.Context
	
]=]

--[=[
	@within FusionContext
	@function Consume
	Looks through the call stack to find a provider to get a value from.
		
	@param key FusionContext.Key
	@return any
	
]=]

--[=[
	@within FusionContext
	@function Provide
	Creates a new Provider that provides the Context to all it's Consumers.
	
	@param key FusionContext.Key
	@param value any
	@return void
	
]=]

--[=[
	@within FusionContext
	@prop version {major: number,minor: number,patch: number}
	The current Version of Fusion-Context
	
]=]

export type Key = PubTypes.Key
export type Context = PubTypes.Context

return {
	Consume = require(script.Consume),
	Provide = require(script.Provide),
	Context = require(script.Context),
	
	version = {
		major = 0,
		minor = 1,
		patch = 1
	}
	
}