--[[
	Controls allow a story to define simple state in its schema.
	The state can be change by interacting with this component, which generates UI controls for
	each type of state. For example, a boolean control will display a toggle button in this
	component that the user can set to true/false.

	See https://confluence.rbx.com/display/RDE/Developer+Storybook for the story API.
]]
local Main = script.Parent.Parent.Parent
local React = require(Main.Packages.React)

local Framework = require(Main.Packages.Framework)
local UI = Framework.UI
local Checkbox = UI.Checkbox
local TextInput = UI.TextInput
local SelectInput = UI.SelectInput

local Foundation = require(Main.Packages.Foundation)
local View = Foundation.View
local Text = Foundation.Text

local Dash = Framework.Dash
local keys = Dash.keys
local map = Dash.map
local collect = Dash.collect
local findIndex = Dash.findIndex

local sort = table.sort

local PanelEntry = require(Main.Src.Components.PanelEntry)

local Types = require(Main.Src.Types)

type Props = {
	LayoutOrder: number,
	Controls: Types.StoryControls,
	ControlState: Types.StoryControls,
	SetControls: (Types.StoryControls) -> (),
}

-- A checkbox for boolean values
local function getCheckbox(key: string, value: any, props: Props)
	return React.createElement(Checkbox, {
		Checked = value,
		Text = key,
		OnClick = function()
			props.SetControls({
				[key] = not value,
			})
		end,
	})
end

-- A text input for number or string values
local function getTextInput(key: string, value: any, props: Props)
	return React.createElement(React.Fragment, {}, {
		Label = React.createElement(Text, {
			Text = key,
			LayoutOrder = 1,
			tag = "auto-xy text-label-small",
		}),
		TextInput = React.createElement(TextInput, {
			Size = UDim2.fromOffset(100, 32),
			Text = tostring(value),
			OnTextChanged = function(newValue: string)
				local typedValue = newValue
				if typeof(props.Controls[key]) == "number" then
					typedValue = tonumber(newValue) or 0
				end
				props.SetControls({
					[key] = typedValue,
				})
			end,
			LayoutOrder = 2,
		}),
	})
end

-- A select input for table values
local function getSelectInput(key: string, value: any, props: Props)
	local values = props.Controls[key]
	local index = findIndex(values, function(current)
		return tostring(value) == tostring(current)
	end) or 1
	return React.createElement(React.Fragment, {}, {
		Label = React.createElement(Text, {
			Text = key,
			LayoutOrder = 1,
			tag = "auto-xy text-align-x-left text-label-small",
		}),
		SelectInput = React.createElement(SelectInput, {
			LayoutOrder = 2,
			Items = map(values, tostring),
			SelectedIndex = index,
			OnItemActivated = function(_value, itemIndex: number)
				props.SetControls({
					[key] = values[itemIndex],
				})
			end,
			TextTruncate = Enum.TextTruncate.AtEnd,
		}),
	})
end

local function Controls(props: Props)
	-- Sort the keys so the controls don't swap about
	local controlKeys = keys(props.ControlState)
	sort(controlKeys)
	-- Collect the controls into a table of (key, element) pairs
	local controls = collect(controlKeys, function(index: number, key: string)
		local initialValue = props.Controls[key]
		local value = props.ControlState[key]
		local child
		if typeof(initialValue) == "boolean" then
			child = getCheckbox(key, value, props)
		elseif typeof(initialValue) == "table" then
			child = getSelectInput(key, value, props)
		else
			child = getTextInput(key, value, props)
		end
		local element = React.createElement(View, {
			LayoutOrder = index,
			tag = "auto-xy row gap-small items-center",
		}, {
			Child = child,
		})
		return key, element
	end)

	return React.createElement(PanelEntry, {
		Header = "Controls",
		Description = "Configuration options for the story",
		LayoutOrder = props.LayoutOrder,
	}, {
		View = React.createElement(View, {
			tag = "size-full-0 auto-y row wrap gap-large items-center",
		}, controls),
	})
end

return Controls
