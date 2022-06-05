---@diagnostic disable: undefined-global

local FusionContext = require(Packages.FusionContext)

local Context = FusionContext.Context

return Context("Theme", {
	background = Color3.fromRGB(242, 242, 242),
	backgroundPressed = Color3.fromRGB(210, 210, 210),
	text = Color3.fromRGB(26, 26, 26)
})