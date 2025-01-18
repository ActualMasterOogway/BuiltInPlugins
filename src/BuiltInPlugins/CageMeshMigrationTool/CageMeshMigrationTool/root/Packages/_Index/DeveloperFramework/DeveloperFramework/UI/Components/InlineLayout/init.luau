local Framework = script:FindFirstAncestor("UI").Parent
local React = require(Framework.Util.React)
type ReactNode = React.ReactNode
local isReact = React.Tag ~= nil

local Types = require(Framework.Types)
type StudioUri = Types.StudioUri

local Dash = require(Framework.Parent.Dash)
local map = Dash.map

local useCallback = React.useCallback
local useLayoutEffect = React.useEffect
local useRef = React.useRef
local useState = React.useState

local Pane = require(Framework.UI.Components.Pane)
local InlineElement = require(script.InlineElement)
local HoverContext = require(script.HoverContext)
type InlineElement = InlineElement.InlineElement

type Props = {
	Elements: { InlineElement },
}

local function layoutElements(elements: { InlineElement }, width: number): { ReactNode }
	if #elements == 0 then
		return {}
	end

	local rows = {}
	local currentRow = {}
	local availableWidth = width
	local wrappedElement = nil
	local i = 1
	local breakPoint = 0

	while (i <= #elements or wrappedElement) and breakPoint < 100 do
		-- 1. Pick wrappedElement or ith element
		local element = wrappedElement or elements[i]
		local elementWidth = element:getWidth()

		-- 2. Check if its preferred size would exceed the remaining width
		if elementWidth <= availableWidth then
			-- 3. If not, push rendered element onto currentRow, increment currentRowWidth and continue
			table.insert(currentRow, element:render(i))
			availableWidth -= elementWidth
			wrappedElement = nil
			i += 1
		else
			local head, tail = element:split(availableWidth)
			-- 5. Check if head can fit on the row. If so, push it and assign the tail to wrappedElement.
			if head:getWidth() <= availableWidth then
				table.insert(currentRow, head:render(i))
				wrappedElement = tail
			else
				-- 6. Put element on the next available row.
				if #currentRow == 0 then
					table.insert(currentRow, head:render(i))
					-- Most probably will be nil, but can be an element if the element can be split, just not exactly as we want.
					wrappedElement = tail
				else
					-- Assign the element back, it will be processed first on the next cycle and pushed to the empty row under the condition above in the worst case.
					wrappedElement = element
				end
			end
			table.insert(rows, currentRow)
			currentRow = {}
			availableWidth = width
		end
		breakPoint += 1
	end

	if breakPoint == 100 then
		warn(
			"InlineLayout: trying to wrap text across multiple lines and iterations cap is reached. Layout may be imperfect"
		)
	end

	-- Handle the last row, since we may exit the loop without commiting it
	if #currentRow > 0 then
		table.insert(rows, currentRow)
	end
	return map(rows, function(row)
		return React.createElement(Pane, { [React.Tag] = "X-Fit X-Row" }, row)
	end)
end

local function InlineLayout(props: Props)
	local ref = useRef(nil :: GuiObject?)
	local rows, setRows = useState({})

	if not isReact then
		warn("Can't use InlineLayout in old Roact, please upgrade your plugin to React 17")
		return
	end

	local onSizeChanged = useCallback(function()
		if ref.current == nil then
			return
		end
		if ref.current.AbsoluteSize.X == 0 then
			return
		end
		setRows(layoutElements(props.Elements, ref.current.AbsoluteSize.X))
	end, { props.Elements })

	useLayoutEffect(onSizeChanged, {})

	return React.createElement(
		HoverContext.Provider,
		nil,
		React.createElement(Pane, {
			[React.Change.AbsoluteSize] = onSizeChanged,
			ref = ref,
			[React.Tag] = "X-FitY X-ColumnS",
		}, rows)
	)
end

return InlineLayout
