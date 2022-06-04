---@diagnostic disable: undefined-global



local New = Fusion.New
local Computed = Fusion.Computed
local Value = Fusion.Value
local ThemeContext = ThemeContext

local function ThemeController()
	
	return ThemeContext:provide({
		background = Color3.fromRGB(26, 26, 26),
		backgroundPressed = Color3.fromRGB(46, 46, 46),
		
		text = Color3.fromRGB(242, 242, 242)
	})
	
end

return ThemeController