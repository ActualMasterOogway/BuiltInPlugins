--[[
	The StoryMiddleware wraps each DeveloperFramework Roact story in a typical context stack.
	These can always be overridden if need be. For example, if you need to extend the theme for
	a demonstration, you can do so by providing it again lower down in the stack.
]]
local Framework = script:FindFirstAncestor("UI").Parent
local Packages = Framework.Parent

local Roact = require(Packages.Roact)

local ContextServices = require(Framework.UI.ContextServices)
local Analytics = ContextServices.Analytics
local Design = ContextServices.Design
local Localization = ContextServices.Localization
local Focus = ContextServices.Focus
local Mouse = ContextServices.Mouse
local Plugin = ContextServices.Plugin

local FFlagDevFrameworkStorybookEmbedStyles = require(Framework.SharedFlags.getFFlagDevFrameworkStorybookEmbedStyles)

local ThemeSwitcher = require(Framework.Style.ThemeSwitcher)
local Resources = require(Framework.Resources)

local function StoryMiddleware(story)
	-- Stories use the DevFramework localization
	local localization = Localization.new({
		stringResourceTable = Resources.SourceStrings,
		translationResourceTable = Resources.LocalizedStrings,
		pluginName = "Storybook",
		libraries = {
			[Resources.LOCALIZATION_PROJECT_NAME] = {
				stringResourceTable = Resources.SourceStrings,
				translationResourceTable = Resources.LocalizedStrings,
			},
		},
	})
	-- Stories use the ThemeSwitcher theme
	local themeContext = ThemeSwitcher.new()
	return function(storyProps)
		if not FFlagDevFrameworkStorybookEmbedStyles then
			-- Update the theme if the storybook theme has changed
			ThemeSwitcher.setTheme(storyProps.theme)
		end
		-- Real or mock context items depending on current capability
		local contextItems = {
			themeContext,
			localization,
			Focus.new(storyProps.focus),
			Plugin.new(storyProps.plugin),
			Mouse.new(storyProps.plugin:GetMouse()),
			Analytics.mock(),
			Design.new(storyProps.design),
		}
		return ContextServices.provide(contextItems, {
			Child = Roact.createElement(story, storyProps),
		})
	end
end

return StoryMiddleware
