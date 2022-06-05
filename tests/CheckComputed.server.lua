--[[
	CheckComputed.server.lua;
	
]]

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Packages = ReplicatedStorage.Packages

local FusionContext = require(Packages.FusionContext)
local Fusion = require(Packages.Fusion)

local New = Fusion.New
local Value = Fusion.State
local Computed = Fusion.Computed
local Context = FusionContext.Context
local Consume = FusionContext.Consume
local Provide = FusionContext.Provide

local ThemeContext = Context("Theme", {	
	background = Color3.fromRGB(26, 26, 26),
	backgroundPressed = Color3.fromRGB(46, 46, 46),
	
	text = Color3.fromRGB(242, 242, 242),
	
})

local function App()
	
	Provide(ThemeContext, {
		background = Color3.fromRGB(242, 242, 242),
		backgroundPressed = Color3.fromRGB(210, 210, 210),
		text = Color3.fromRGB(26, 26, 26)
	})
	
	local isPressed = Value(false)
	local backgroundColor = Computed(function()
		local theme = Consume("Theme")
		local isPressed = isPressed:get()
		
		if isPressed then
			return theme.backgroundPressed
		else
			return theme.background
		end
		
		
	end)
	
	local color1 = backgroundColor:get()
	isPressed:set(true)
	local color2 = backgroundColor:get()
	
	print(color1, color2)
	
end

App()