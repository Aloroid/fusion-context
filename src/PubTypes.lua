
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
	@type Key any
	The key used to filter which context to get
	
]=]
export type Key = any

return {}
