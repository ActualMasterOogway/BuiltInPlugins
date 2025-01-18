local Framework = script:FindFirstAncestor("UI").Parent

local Roact = require(Framework.Parent.Roact)

local Pane = require(Framework.UI.Components.Pane)
local DraggableTileList = require(Framework.UI.Components.DraggableTileList)
local TextLabel = require(Framework.UI.Components.TextLabel)

local DraggableTiles = Roact.PureComponent:extend("DraggableTiles")

local CustomTileBox = Roact.PureComponent:extend("CustomTileBox")

function CustomTileBox:render()
	local props = self.props
	local tile = props.Tile
	local style = props.Style

	return Roact.createElement(Pane, {
		Style = "BorderBox",
		HorizontalAlignment = Enum.HorizontalAlignment.Left,
		Layout = Enum.FillDirection.Horizontal,
		Position = props.Position,
		Size = props.Size,
	}, {
		Text = Roact.createElement(TextLabel, {
			Size = UDim2.new(1, 0, 1, 0),
			LayoutOrder = 2,
			Text = tile.Text,
			TextXAlignment = style.TextXAlignment or Enum.TextXAlignment.Center,
		}),
	})
end

function DraggableTiles:init()
	self.boxes = {}
end

local function createBox(text: string, layoutOrder: number)
	return {
		Text = text,
		LayoutOrder = layoutOrder,
	}
end

function DraggableTiles:render()
	if not next(self.boxes) then
		self.boxes = {
			[1] = createBox("Box 1", 1),
			[2] = createBox("Box 2", 2),
			[3] = createBox("Box 3", 3),
		}
	end

	return Roact.createElement(DraggableTileList, {
		Size = UDim2.fromOffset(100, 300),
		Capacity = 3,
		TileList = self.boxes,
		TileComponent = CustomTileBox,
		PaneStyle = "BorderBox",
	})
end

return DraggableTiles
