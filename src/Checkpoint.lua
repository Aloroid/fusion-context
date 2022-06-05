--[[
	Checkpoint.lua
		Checkpoints must be used to connect call stacks together.
	
]]
local sharedState = require(script.Parent.sharedState)

local checkpoints = sharedState.checkpoints

local function Checkpoint()
	
	local checkpoint = {
		_stack = {},
		_thread = coroutine.running(),
		_checkpointed = {}
	}
	
	-- Go through the entire call stack and record each call into
	-- the table. This is done because when the thread has
	-- moved on or died, it will not return nil or some other unwanted data
	for i = 2, math.huge do
		local callback = debug.info(i, "f")
		if callback == nil then break end
		
		table.insert(checkpoint._stack, callback)
		
	end
	
	-- Applies the Checkpoint to the function it's being called inside
	function checkpoint:apply()
		local caller = debug.info(2, "f")
		print("Applying Checkpoint", caller, debug.info(2, "slnaf"))
		
		checkpoints[caller] = self
		table.insert(self._checkpointed, caller)
	end
	
	function checkpoint:clear()
		
		for caller, checkpointPointer in pairs(self._checkpointed) do
			if checkpointPointer == self._func then
				checkpoints[caller] = nil
				
			end
		end
		
	end
	
	return checkpoint
	
end

return Checkpoint