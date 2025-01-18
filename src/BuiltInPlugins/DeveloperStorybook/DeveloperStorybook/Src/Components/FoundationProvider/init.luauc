local Main = script.Parent.Parent.Parent
local React = require(Main.Packages.React)
local RoactRodux = require(Main.Packages.RoactRodux)

local Framework = require(Main.Packages.Framework)
local Dash = Framework.Dash

local ThemeSwitcher = Framework.Style.ThemeSwitcher

local Foundation = require(Main.Packages.Foundation)
local FoundationProvider = Foundation.FoundationProvider

function FoundationProviderAdaptor(props)
	return React.createElement(
		FoundationProvider,
		Dash.join(props, {
			theme = props.theme,
		})
	)
end

-- Hack to react to the theme change, we update value in the rodux store, but initially it's empty.
-- When the ThemeSwitcher has the correct value and doesn't have Default which may map to a different theme in Foundation.
return RoactRodux.connect(function()
	return { theme = ThemeSwitcher.getThemeName() }
end)(FoundationProviderAdaptor)
