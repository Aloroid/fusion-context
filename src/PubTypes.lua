
--[=[
	@within FusionContext
	@type Context {_context: boolean,key: string,value: any}
	A context Object
	
]=]
export type Context = {
	_context: boolean,
	key: string,
	value: any
	
}

--[=[
	@within FusionContext
	@type Key string | Context
	The key used to filter which context to get
	
]=]
export type Key = string | Context

return {}
