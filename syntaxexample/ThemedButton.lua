---@diagnostic disable: undefined-global



local New = Fusion.New
local Computed = Fusion.Computed
local Value = Fusion.Value
local OnEvent = Fusion.OnEvent
local ThemeContext = ThemeContext

local function ThemedButton(props)
	
	local theme = ThemeContext:consume()
	local isPressed = Value(false)
	
	return New "TextButton" {
		
		BackgroundColor3 = Computed(function()
			if isPressed:get() then
				return theme.backgroundPressed:get()
			else
				return theme.background:get()
			end
			
		end),
		TextColor3 = theme.text,
		
		[OnEvent "MouseButton1Down"] = function()
			isPressed:set(true)
			
		end,
		
		[OnEvent "MouseButton1Up"] = function()
			isPressed:set(false)
			
		end
		
		
	}
	
end

return ThemedButton