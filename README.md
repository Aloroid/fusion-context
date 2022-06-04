# fusion-context
A implementation of Context from React/Roact within Fusion because I needed it

ThemeContext Example:
```lua

local FusionContext = require("path.to.FusionContext")

local ThemeContext = FusionContext({
	background = Color3.fromRGB(242, 242, 242),
	
	buttonPressed = Color3.fromRGB(180, 180, 180),
	buttonDefault = Color3.fromRGB(200, 200, 200),
	buttonText = Color3.fromRGB(26, 26, 26)
	
})

return ThemeContext

```

Provider Example:
```lua

local Fusion = require("path.to.Fusion")
local ThemeContext = require("path.to.ThemeContext")

local Children = Fusion.Children

local function ThemeController(props)
	
	local provider = ThemeContext:provide({
		
		value = {
			background = Color3.fromRGB(26, 26, 26),
			
			buttonPressed = Color3.fromRGB(20, 20, 20),
			buttonDefault = Color3.fromRGB(40, 40, 40),
			buttonText = Color3.fromRGB(242, 242, 242)
		},
		
		[Children] = props[Children]
		
	})
	
	return provider
	
end

```

Consumer Example:
```lua

local Fusion = require("path.to.Fusion")
local ThemeContext = require("path.to.ThemeContext")

local New = Fusion.New
local Computed = Fusion.Computed
local Value = Fusion.Value

local function ThemedButton(props, theme)
	
	return New "TextButton" {
		
		Size = props.Size,
		Text = props.Text,
		
		TextColor3 = theme.text,
		BackgroundColor3 = theme.background
		
	}
	
end

return ThemeContext:consume(ThemedButton)
