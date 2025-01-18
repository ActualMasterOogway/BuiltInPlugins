--[[
	The footer displayed at the bottom of the plugin.
]]

local Main = script.Parent.Parent.Parent
local Types = require(Main.Src.Types)
local React = require(Main.Packages.React)
local RoactRodux = require(Main.Packages.RoactRodux)

local Framework = require(Main.Packages.Framework)
local ContextServices = Framework.ContextServices
local withContext = ContextServices.withContext
local InspectorContext = require(Main.Src.Util.InspectorContext)

local TestLoader = require(Main.Packages.TestLoader)
local ModuleLoader = TestLoader.ModuleLoader

local UI = Framework.UI
local Button = UI.Button

local Foundation = require(Main.Packages.Foundation)
local View = Foundation.View

local SelectionService = game:GetService("Selection")

local Footer = React.PureComponent:extend("Footer")

function Footer:init()
	self.runTests = function()
		local props = self.props
		local story = props.SelectedStory.Script
		local TestEZ = ModuleLoader:load(Main.Packages.Dev.TestEZ)
		local TestBootstrap = TestEZ.TestBootstrap
		local TextReporter = TestEZ.Reporters.TextReporter
		local children
		if props.SelectedStory.Storybook and props.SelectedStory.Storybook.mapTests then
			children = props.SelectedStory.Storybook:mapTests(story)
		else
			children = { story.Parent }
		end
		TestBootstrap:run(children, TextReporter)
	end
	self.viewStorySource = function()
		local props = self.props
		local plugin = props.Plugin:get()
		local source = props.SelectedStory.Script
		plugin:OpenScript(source)
		SelectionService:Set({ source })
	end
	self.explore = function()
		SelectionService:Set({ self.props.StoryRef.current })
	end
end

function Footer:renderButton(index: number, text: string, callback: () -> ())
	return React.createElement(Button, {
		LayoutOrder = index,
		OnClick = callback,
		Text = text,
		Style = "Round",
		Size = UDim2.fromOffset(150, 32),
	})
end

function Footer:render()
	return React.createElement(View, {
		tag = "size-full-0 row gap-medium align-x-right padding-medium auto-y grow",
		LayoutOrder = self.props.LayoutOrder,
	}, {
		Explore = self:renderButton(2, "Explore", self.explore),
		RunTests = self:renderButton(3, "Run Tests", self.runTests),
		StorySource = self:renderButton(4, "View Source", self.viewStorySource),
	})
end

Footer = withContext({
	Inspector = InspectorContext,
	Plugin = ContextServices.Plugin,
})(Footer)

return RoactRodux.connect(function(state: Types.RoduxStore)
	return {
		SelectedStory = state.Stories.selectedStory,
	}
end)(Footer)
