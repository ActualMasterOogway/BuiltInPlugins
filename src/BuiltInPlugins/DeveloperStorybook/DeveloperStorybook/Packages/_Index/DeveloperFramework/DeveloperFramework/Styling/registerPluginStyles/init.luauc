local Framework = script.Parent.Parent

local StylingService = game:GetService("StylingService")
local createStudioDesign = require(script.Parent.createStudioDesign)

local getStudioSettings = require(Framework.Util.getStudioSettings)
local StudioThemeFallback = require(Framework.Style.StudioThemeFallback)

local function getThemes(pluginFolder, studioDesignStyleSheet: StyleSheet)
	local okLight, lightTheme = pcall(function()
		return require(pluginFolder.Src.Resources.PluginStylesLightTheme)
	end)

	local okDark, darkTheme = pcall(function()
		return require(pluginFolder.Src.Resources.PluginStylesDarkTheme)
	end)

	local themes = {}
	if okLight then
		lightTheme:SetDerives({ studioDesignStyleSheet })
		themes["Light"] = lightTheme
	end

	if okDark then
		darkTheme:SetDerives({ studioDesignStyleSheet })
		themes["Dark"] = darkTheme
	end

	return themes
end

-- pluginRoot and parent are optional parameters used by embedded plugins to override the default values in the function
local function registerPluginStyles(plugin: Plugin, pluginRoot: any, parent: Folder?)
	local studioSettings = getStudioSettings()
	local currentTheme = if studioSettings then studioSettings.Theme.Name else StudioThemeFallback

	-- Use the existing copy of StudioDesign if it exists
	local studioDesign = StylingService:FindFirstChild("StudioDesign")
	if not studioDesign then
		studioDesign = createStudioDesign()
		studioDesign.Parent = StylingService
	end

	-- Set default pluginRoot
	if not pluginRoot then
		pluginRoot = plugin:FindFirstChildWhichIsA("Folder")
	end

	local pluginName = pluginRoot.Name

	local pluginDesign = StylingService:FindFirstChild(pluginName) :: StyleSheet
	if pluginDesign then
		pluginDesign.Parent = nil
	end

	pluginDesign = require(pluginRoot.Src.Resources.PluginStyles)
	local pluginThemes = getThemes(pluginRoot, studioDesign.Design)

	local componentDescendants = pluginRoot.Src.Components:GetDescendants()
	for _, descendant in pairs(componentDescendants) do
		if descendant:IsA("ModuleScript") and descendant.Name == "styles" then
			pluginDesign:InsertStyleRule(require(descendant))
		end
	end

	local derivations = {}
	if pluginThemes[currentTheme] ~= nil then
		table.insert(derivations, pluginThemes[currentTheme])
	end
	-- NOTE (mbae 09/24/23): Insert studioDesign.Design after because of bug in StyleSheets diamond inheritance
	table.insert(derivations, studioDesign.Design)

	-- Set default parent
	if not parent then
		parent = StylingService
	end
	pluginDesign:SetDerives(derivations)
	pluginDesign.Parent = parent

	local connection = nil

	if studioSettings ~= nil then
		connection = studioSettings.ThemeChanged:Connect(function()
			local newStudioSettings = getStudioSettings()
			if not newStudioSettings then
				return
			end

			local nextTheme = newStudioSettings.Theme.Name
			local nextDerivations = {}
			if pluginThemes[nextTheme] ~= nil then
				table.insert(nextDerivations, pluginThemes[nextTheme])
			end
			table.insert(nextDerivations, studioDesign.Design)

			pluginDesign:SetDerives(nextDerivations)
		end)
	end

	return pluginDesign, connection
end

return registerPluginStyles
