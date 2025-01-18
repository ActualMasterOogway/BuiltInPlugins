local Packages = script:FindFirstAncestor("Packages")
local GuiService = game:GetService("GuiService")

if not Packages then
	-- The embedded storybook should only load in Studio if it has been included as a library
	return nil
end

local Roact = require(Packages.Roact)
local React = require(Packages.React)
local Rodux = require(Packages.Rodux)
local Framework = require(Packages.Framework)

local registerPluginStyles = Framework.Styling.registerPluginStyles

local ContextServices = Framework.ContextServices
local MockPlugin = Framework.TestHelpers.Instances.MockPlugin
local Analytics = ContextServices.Analytics
local Focus = ContextServices.Focus
local Mouse = ContextServices.Mouse
local Design = ContextServices.Design
local Localization = ContextServices.Localization
local Plugin = ContextServices.Plugin
local Store = ContextServices.Store

local Src = Packages.DeveloperStorybook.Src
local MainReducer = require(Src.Reducers.MainReducer)
local Window = require(Src.Components.Window)
local MakeTheme = require(Src.Resources.MakeTheme)
local SourceStrings = Src.Resources.SourceStrings
local LocalizedStrings = Src.Resources.LocalizedStrings
local ExternalEventConnection = require(Src.Util.ExternalEventConnection)
local GetStories = require(Src.Thunks.GetStories)

function WindowWrapper()
	local sideBarPadding, setSideBarPadding = React.useState(0)

	local onInsetChange = React.useCallback(function()
		setSideBarPadding(GuiService.TopbarInset.Height)
	end, {})

	return Roact.createFragment({
		Roact.createElement(Window, { sideBarPadding = sideBarPadding }),
		Roact.createElement(ExternalEventConnection, {
			event = GuiService:GetPropertyChangedSignal("TopbarInset"),
			callback = onInsetChange,
		}),
	})
end

local EmbeddedStorybook = {}

function EmbeddedStorybook.start(storybookGui: ScreenGui, player: Player)
	local store = Rodux.Store.new(MainReducer, {}, {
		Rodux.thunkMiddleware,
	})
	store:dispatch(GetStories())
	local localization = Localization.new({
		stringResourceTable = SourceStrings,
		translationResourceTable = LocalizedStrings,
		pluginName = "StorybookClient",
		libraries = {
			[Framework.Resources.LOCALIZATION_PROJECT_NAME] = {
				stringResourceTable = Framework.Resources.SourceStrings,
				translationResourceTable = Framework.Resources.LocalizedStrings,
			},
		},
	})

	local plugin = MockPlugin.new()
	local design = registerPluginStyles(plugin, Packages.DeveloperStorybook, game.Workspace)

	local contextItems = {
		Store.new(store),
		MakeTheme(),
		localization,
		Focus.new(storybookGui),
		Plugin.new(plugin),
		Mouse.new(player:GetMouse()),
		Design.new(design),
		Analytics.mock(),
	}
	local Screen = function()
		return ContextServices.provide(contextItems, {
			Window = Roact.createElement(WindowWrapper),
			StyleLink = Roact.createElement("StyleLink", {
				StyleSheet = design,
			}),
		})
	end
	local element = Roact.createElement(Screen, {})
	EmbeddedStorybook.handle = Roact.mount(element, storybookGui)
end

function EmbeddedStorybook.stop()
	Roact.unmount(EmbeddedStorybook.handle)
end

return EmbeddedStorybook
