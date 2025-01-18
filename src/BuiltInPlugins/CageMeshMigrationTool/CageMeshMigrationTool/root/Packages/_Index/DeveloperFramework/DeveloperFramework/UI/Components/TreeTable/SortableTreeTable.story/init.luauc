local Framework = script:FindFirstAncestor("UI").Parent

local Dash = require(Framework.Parent.Dash)
local join = Dash.join
local map = Dash.map

local sort = table.sort

local Roact = require(Framework.Parent.Roact)
local TreeTable = require(Framework.UI.Components.TreeTable)

local ExampleTreeTable = Roact.PureComponent:extend(script.Parent.Name .. "ExampleTreeTable")

local DEFAULT_COLUMNS = {
	{
		Name = "Name",
		Key = "name",
	},
	{
		Name = "Value",
		Key = "value",
	},
}

function ExampleTreeTable:init()
	self.state = {
		SortChildren = nil,
		SortIndex = nil,
		SortOrder = nil,
		Expansion = {},
		Sizes = { UDim.new(0.5, 0), UDim.new(0.5, 0) },
		Items = {
			{
				name = "Workspace",
				value = {
					Value = 12,
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
	self.onSortChange = function(index, sortOrder)
		local function sortChildren(left, right)
			local column = DEFAULT_COLUMNS[index]
			local leftCell = typeof(left[column.Key]) == "table" and left[column.Key].Value or left[column.Key]
			local rightCell = typeof(right[column.Key]) == "table" and right[column.Key].Value or right[column.Key]
			if sortOrder == Enum.SortDirection.Descending then
				return leftCell < rightCell
			else
				return leftCell > rightCell
			end
		end
		local items = join(self.state.Items)
		sort(items, sortChildren)
		self:setState({
			Items = items,
			SortChildren = sortChildren,
			SortIndex = index,
			SortOrder = sortOrder,
		})
	end
	self.onSizesChange = function(sizes: { UDim })
		self:setState({
			Sizes = sizes,
		})
	end
end

function ExampleTreeTable:render()
	local columns = map(DEFAULT_COLUMNS, function(column, index: number)
		return join(column, {
			Width = self.state.Sizes[index],
		})
	end)

	return Roact.createElement(TreeTable, {
		Columns = columns,
		SortIndex = self.state.SortIndex,
		SortOrder = self.state.SortOrder,
		SortChildren = self.state.SortChildren,
		OnSortChange = self.onSortChange,
		Size = UDim2.new(1, 0, 0, 240),
		OnExpansionChange = function(newExpansion)
			self:setState({
				Expansion = join(self.state.Expansion, newExpansion),
			})
		end,
		OnColumnSizesChange = self.onSizesChange,
		Expansion = self.state.Expansion,
		RootItems = self.state.Items,
		GetChildren = function(item)
			return item.children or {}
		end,
		UseScale = true,
		ClampSize = true,
		Scroll = true,
	})
end

return ExampleTreeTable
