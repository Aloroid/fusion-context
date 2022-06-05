---@diagnostic disable: undefined-global

local FusionContext = require(Packages.FusionContext)
local Fusion = require(Packages.Fusion)
local ThemeContext = require(script.Parent.ThemeContext)
local ThemedButton = require(script.Parent.ThemedButton)

local Provide = FusionContext.Provide
local New = Fusion.New
local Children = Fusion.Children

local function Application()
	
	Provide(ThemeContext, {
		
		background = Color3.fromRGB(26, 26, 26),
		backgroundPressed = Color3.fromRGB(46, 46, 46),
		
		text = Color3.fromRGB(242, 242, 242),
		
	})
	
	return New "ScreenGui" {
		
		[Children] = ThemedButton {
			Text = "Click me!"
		}
		
	}
	
end

return Application