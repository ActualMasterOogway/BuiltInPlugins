local Framework = script:FindFirstAncestor("UI").Parent

local Dash = require(Framework.Parent.Dash)
local join = Dash.join

local Roact = require(Framework.Parent.Roact)
local TreeTable = require(Framework.UI.Components.TreeTable)
local TextLabel = require(Framework.UI.Components.TextLabel)
local FFlagDevFrameworkModernTreeTable = require(Framework.SharedFlags).getFFlagDevFrameworkModernTreeTable()

local ModernTreeTable = Roact.PureComponent:extend(script.Parent.Name .. "ModernTreeTable")

function ModernTreeTable:init()
	self.state = {
		Expansion = {},
		Selection = {},
		Items = {
			{
				name = "Very long workspace that should wrap Very long workspace that should wrap Very long workspace that should wrap Very long workspace that should wrap Very long workspace that should wrap",
				value = {
					Value = "Very long value that should wrap Very long value that should wrap Very long value that should wrap Very long value that should wrap Very long value that should wrap",
					LeftIcon = {
						Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png",
						Size = UDim2.new(0, 14, 0, 14),
					},
				},
				children = {
					{
						name = "Ocean",
						value = 53,
						children = {
							{
								name = "Billy The Fish",
								value = 12,
							},
						},
					},
				},
			},
			{
				name = "ReplicatedStorage",
				value = 18,
				children = {
					{
						name = "WeatherSystem",
						value = {
							Value = 193,
							LeftIcon = {
								Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png",
								Size = UDim2.new(0, 14, 0, 14),
							},
						},
					},
					{
						name = "CloudSystem",
						value = 9001,
						children = {
							{
								name = "Cheeky Cumulus",
								value = {
									Value = 200,
									LeftIcon = {
										Image = "rbxasset://textures/DeveloperFramework/Favorites/star_filled.png",
										Size = UDim2.new(0, 14, 0, 14),
									},
								},
							},
						},
					},
				},
			},
			{
				name = "ServerStorage",
				value = 30,
				children = {
					{
						name = "Secret Base",
						value = 212,
						children = {
							{
								name = "Obsidian Door",
								value = 120,
							},
						},
					},
				},
			},
		},
	}
end

function ModernTreeTable:render()
	if not FFlagDevFrameworkModernTreeTable then
		return Roact.createElement(TextLabel, { Text = "Please enable FFlagDevFrameworkModernTreeTable" })
	end

	return Roact.createElement(TreeTable, {
		Size = UDim2.new(1, 0, 0, 240),
		Columns = {
			{
				Name = "Name",
				Key = "name",
			},
			{
				Name = "Value",
				Key = "value",
			},
		},
		OnExpansionChange = function(newExpansion)
			self:setState({
				Expansion = join(self.state.Expansion, newExpansion),
			})
		end,
		OnSelectionChange = function(newSelection)
			self:setState({
				Selection = newSelection,
			})
		end,
		Expansion = self.state.Expansion,
		Selection = self.state.Selection,
		RootItems = self.state.Items,
		GetChildren = function(item)
			return item.children or {}
		end,
		Scroll = false,
		Variant = "modern",
	})
end

return ModernTreeTable
