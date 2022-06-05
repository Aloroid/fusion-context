--[[
	CheckOrder.server.lua;
	
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages

local FusionContext = require(Packages.FusionContext)

local Consume = FusionContext.Consume
local Provide = FusionContext.Provide
local Context = FusionContext.Context

Provide("Color", {value = "Dark"})

-- We create a Context object here as we need the value to use Provide/Consume
-- The first argument is the special key for the context, while the second argument
-- is the default value that will be given to consumers if it can't find a Provider

local function a()
    -- Looks up the call stack to find out the Provider we need  to use
    local startTime = os.clock()
    local theme = Consume("Color")    
    local endTime = os.clock()
    
    
    print("[CHECKORDER]", theme.value)
    print("[CHECKORDER]", endTime - startTime)
end

local function b()
    -- We create a provider here so that every call inside this function onward will now get the
    -- value "Light" instead of the value "Dark" which is the default
	a() -- Should print "Dark"
	
    Provide("Color", {
      value = "Light"
    })

    a() -- Should print "Light"
end

local function c()
    b()
    -- Looks up the Call stack, but can't find anything so returns the value Dark
    a()
end

c()