--[[

|WARNING| THESE TESTS RUN IN YOUR REAL ENVIRONMENT. |WARNING|

If your tests alter a DataStore, it will actually alter your DataStore.

This is useful in allowing your tests to move Parts around in the workspace or something,
but with great power comes great responsibility. Don't mess up your stuff!

---------------------------------------------------------------------

Documentation and Change Log:
https://devforum.roblox.com/t/benchmarker-plugin-compare-function-speeds-with-graphs-percentiles-and-more/829912/1

--------------------------------------------------------------------]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages

local FusionContext = require(Packages.FusionContext:Clone())

local Context = FusionContext.Context
local Consume = FusionContext.Consume
local Provide = FusionContext.Provide


return {

	ParameterGenerator = function()
		-- This function is called before running your function (outside the timer)
		-- and the return(s) are passed into your function arguments (after the Profiler). This sample
		-- will pass the function a random number, but you can make it pass
		-- arrays, Vector3s, or anything else you want to test your function on.
		
		return Context("Theme", "Light")
	end;

	Functions = {
		["Context"] = function(Profiler, context) -- You can change "Sample A" to a descriptive name for your function

			-- The first argument passed is always our Profiler tool, so you can put
			-- Profiler.Begin("UNIQUE_LABEL_NAME") ... Profiler.End() around portions of your code
			-- to break your function into labels that are viewable under the results
			-- histogram graph to see what parts of your function take the most time.


			-- Your code here
			Profiler.Begin("Provider")
			for i = 1, 10 do
				Provide(context, "Dark")
			end
			
			Profiler.End()
			Profiler.Begin("Consume")
			for i = 1, 10 do
				Consume(context)
			end
			
			Profiler.End()

		end;
	};

}