local Framework = script.Parent.Parent

local Dash = require(Framework.Parent.Dash)
local filter = Dash.filter
local includes = Dash.includes

local StudioThemeFallback = require(Framework.Style.StudioThemeFallback)
local createDesign = require(Framework.Styling.createDesign)
local createStyleSheet = require(Framework.Styling.createStyleSheet)
local shouldOrderStyleRulesByInsertion = require(Framework.Styling.shouldOrderStyleRulesByInsertion)

local Components = Framework.UI.Components

local StudioPalette = require(Framework.Styling.StudioPalette)
local StudioMixins = require(Framework.Styling.StudioMixins)
local LightThemeTokens = require(Framework.Styling.LightThemeTokens)
local DarkThemeTokens = require(Framework.Styling.DarkThemeTokens)

local FFlagSelectRendererOnRenderItem = require(Framework.SharedFlags.getFFlagSelectRendererOnRenderItem)()
local FFlagStyleRulePriorityOrderRefactor = game:GetFastFlag("StyleRulePriorityOrderRefactor")

local getStudioSettings = require(Framework.Util.getStudioSettings)

local CORE_COMPONENTS = {
	"Image",
	"Pane",
	if FFlagSelectRendererOnRenderItem then "TextLabel" else nil,
}

local function registerComponent(design: Folder, component: Instance)
	local styles = component:FindFirstChild("styles")
	if styles then
		local componentRule = require(styles)
		local designStyleSheet = design:FindFirstChild("Design")
		if designStyleSheet and designStyleSheet:IsA("StyleSheet") then
			designStyleSheet:InsertStyleRule(componentRule)
		end
	end
end

-- Returns the StudioDesign as well as a connection for watching the themes changed signal.
-- If Studio settings are not available (such as in CI), this connection is nil.
local function createStudioDesign()
	local studioSettings = getStudioSettings()
	local currentTheme = if studioSettings then studioSettings.Theme.Name else StudioThemeFallback

	local design = createDesign("StudioDesign")
	local palette = createStyleSheet("Palette", {}, StudioPalette, {})
	palette.Parent = design

	local themes = {
		Light = createStyleSheet("Light", {}, LightThemeTokens, { palette }),
		Dark = createStyleSheet("Dark", {}, DarkThemeTokens, { palette }),
	}
	for name, theme in themes do
		theme.Parent = design.Themes
		theme:SetAttribute("StyleCategory", "Theme")
		if name == currentTheme then
			design.Design:SetDerives({ theme })
		end
	end

	local children = Components:GetChildren()
	local nonCoreChildren = filter(children, function(child: Instance)
		return not includes(CORE_COMPONENTS, child.Name)
	end)
	table.sort(nonCoreChildren, function(a, b)
		return a.Name < b.Name
	end)
	for _, name in CORE_COMPONENTS do
		registerComponent(design, Components:FindFirstChild(name))
	end
	for _, child in nonCoreChildren do
		registerComponent(design, child)
	end

	local hasOnlyZeros
	if not pcall(function()
		hasOnlyZeros = shouldOrderStyleRulesByInsertion(StudioMixins)
	end) then
		error(`Zero priorities mixed with non-zero priorities in Studio Mixins`)
	end
	for i, rule in StudioMixins do
		if FFlagStyleRulePriorityOrderRefactor and hasOnlyZeros then
			rule.Priority = i - 1
		end
		design.Design:InsertStyleRule(rule)
	end

	local connection = nil

	if studioSettings ~= nil then
		connection = studioSettings.ThemeChanged:Connect(function()
			local newStudioSettings = getStudioSettings()
			if not newStudioSettings then
				return
			end

			local nextTheme = newStudioSettings.Theme.Name
			design.Design:SetDerives({ themes[nextTheme] })
		end)
	end

	return design, connection
end

return createStudioDesign
