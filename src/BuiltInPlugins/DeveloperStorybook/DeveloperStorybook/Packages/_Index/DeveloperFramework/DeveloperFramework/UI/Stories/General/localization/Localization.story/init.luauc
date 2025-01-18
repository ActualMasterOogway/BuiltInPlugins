local Framework = script:FindFirstAncestor("UI").Parent
local Roact = require(Framework.Parent.Roact)
local ContextServices = require(Framework.UI.ContextServices)
local Plugin = ContextServices.Plugin
local Localization = ContextServices.Localization

local Label = require(script.Parent.Label)

local stringResourceTable = script.Parent.SourceStrings
local translationResourceTable = script.Parent.LocalizedStrings

local pluginItem = Plugin.new(plugin)
local localization = Localization.new({
	stringResourceTable = stringResourceTable,
	translationResourceTable = translationResourceTable,
	pluginName = "TestFramework",
})

return ContextServices.provide({ pluginItem, localization }, {
	Label = Roact.createElement(Label, {
		Name = "ZeroIndex",
	}),
})
