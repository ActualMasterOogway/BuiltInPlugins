--[[
	A basic TextBox. Does not have a Style and does not rely on Theme.

	This component is a thin wrapper around a TextBox host component that adds
	improved cursor visibility, overflow text clipping, and options for controlling
	tab behavior.

	Optional Props:
		table ForwardRef: An optional ref to pass to the underlying Frame.
		boolean AllowTab: Whether to accept tab characters in input text.
		Color3 BackgroundColor: Background color for the component.
		boolean ClearTextOnFocus: Whether clicking on the component will clear its text.
		boolean Disabled: Whether the input is editable.
		Enum.Font Font: The font used to render the text.
		number LayoutOrder: The layout order of the component.
		number LineHeight: The line height for the component.
		boolean MultiLine: Whether the input is multiline.
		callback OnEnter: Callback fired when Enter is pressed.
		callback OnFocused: Callback fired when the component is focused.
		callback OnFocusLost: Callback fired when the focus is lost.
		callback OnTextChanged: Callback fired when the text has changed.
		string PlaceholderText: Placeholder text to show when the input is empty.
		Color3 PlaceholderTextColor: Color of the placeholder text.
		UDim2 Size: The size of the component.
		string Text: Text to populate the input with.
		Color3 TextColor: The color of the text.
		number TextSize: The font size of the text.
		boolean TextWrapped: If the Text should be wrapped to the next line.
		Enum.TextXAlignment TextXAlignment: The X alignment of the text.
		Enum.TextYAlignment TextYAlignment: The Y alignment of the text.
]]
local TextService = game:GetService("TextService")

local Framework = script:FindFirstAncestor("UI").Parent

local Roact = require(Framework.Parent.Roact)

local Typecheck = require(Framework.Util.Typecheck)

local withForwardRef = require(Framework.Wrappers.withForwardRef)

local Pane = require(Framework.UI.Components.Pane)

local FFlagDevFrameworkTextInputRemoveScrollingHack =
	game:DefineFastFlag("DevFrameworkTextInputRemoveScrollingHack", false)

local ZERO_VECTOR = Vector2.new(0, 0)

local TextBox = Roact.PureComponent:extend("TextBox")
Typecheck.wrap(TextBox, script)

TextBox.defaultProps = {
	AllowTab = false,
	Disabled = false,
	ClearTextOnFocus = false,
	PlaceholderText = "",
	Size = UDim2.new(0, 100, 0, 32),
	TextWrapped = false,
}

function TextBox:init(initialProps)
	if not FFlagDevFrameworkTextInputRemoveScrollingHack then
		self.clipBoxRef = Roact.createRef()
	end
	self.textBoxRef = initialProps.ForwardRef or Roact.createRef()

	if not FFlagDevFrameworkTextInputRemoveScrollingHack then
		self.cursorPositionChanged = function()
			self:_updateTextBoxOffset()
		end
	end

	self.focused = function()
		if self.props.OnFocused then
			self.props.OnFocused()
		end
	end

	self.focusLost = function(_rbx, submitted, inputObject)
		if not FFlagDevFrameworkTextInputRemoveScrollingHack then
			self:_resetTextBoxOffset()
		end
		if self.props.OnFocusLost then
			self.props.OnFocusLost(_rbx, submitted, inputObject)
		end

		if submitted and self.props.OnEnter ~= nil then
			self.props.OnEnter()
		end
	end

	if not FFlagDevFrameworkTextInputRemoveScrollingHack then
		self.textPropertiesUpdated = function()
			local textBox = self.textBoxRef.current
			if not textBox then
				return
			end

			if #textBox.Text == 0 then
				self:_resetTextBoxOffset()
			else
				self:_updateTextBoxOffset()
			end
		end
	end

	self.textChanged = function()
		local textBox = self.textBoxRef.current
		if not textBox then
			return
		end

		local text = textBox.Text
		local newText = text

		if not self.props.AllowTab then
			if string.find(newText, "\t") then
				newText = newText:gsub("\t", "")
			end
		end

		if self.props.OnEnter ~= nil then
			if string.find(newText, "\n") then
				newText = newText:gsub("\n", "")
			end
		end

		if newText ~= text then
			text = newText
			textBox.Text = text

			local submitted = true
			textBox:ReleaseFocus(submitted)
		end

		if self.props.OnTextChanged then
			self.props.OnTextChanged(text)
		end

		if not FFlagDevFrameworkTextInputRemoveScrollingHack then
			self.textPropertiesUpdated()
		end
	end
end

function TextBox:render()
	local props = self.props

	local isMultiLine = props.MultiLine

	if FFlagDevFrameworkTextInputRemoveScrollingHack then
		return Roact.createElement("TextBox", {
			AutomaticSize = if isMultiLine then Enum.AutomaticSize.Y else nil,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClearTextOnFocus = props.ClearTextOnFocus,
			ClipsDescendants = true,
			Font = props.Font,
			LayoutOrder = props.LayoutOrder,
			LineHeight = props.LineHeight,
			MultiLine = props.MultiLine,
			PlaceholderColor3 = props.PlaceholderTextColor,
			PlaceholderText = props.PlaceholderText,
			Size = props.Size,
			Text = props.Text,
			TextColor3 = props.TextColor,
			TextEditable = not props.Disabled,
			TextSize = props.TextSize,
			TextWrapped = props.TextWrapped,
			TextXAlignment = props.TextXAlignment,
			TextYAlignment = props.TextYAlignment,

			[Roact.Event.Focused] = self.focused,
			[Roact.Event.FocusLost] = self.focusLost,
			[Roact.Change.Text] = self.textChanged,
			[Roact.Ref] = self.textBoxRef,
		})
	else
		return Roact.createElement(Pane, {
			AutomaticSize = if isMultiLine then Enum.AutomaticSize.Y else nil,
			BackgroundColor = props.BackgroundColor,
			ClipsDescendants = true,
			LayoutOrder = props.LayoutOrder,
			Size = props.Size,
			[Roact.Ref] = self.clipBoxRef,
		}, {
			TextBox = Roact.createElement("TextBox", {
				AutomaticSize = if isMultiLine then Enum.AutomaticSize.Y else nil,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClearTextOnFocus = props.ClearTextOnFocus,
				Font = props.Font,
				LineHeight = props.LineHeight,
				MultiLine = props.MultiLine,
				PlaceholderColor3 = props.PlaceholderTextColor,
				PlaceholderText = props.PlaceholderText,
				Size = UDim2.fromScale(1, if isMultiLine then 0 else 1),
				Text = props.Text,
				TextColor3 = props.TextColor,
				TextEditable = not props.Disabled,
				TextSize = props.TextSize,
				TextWrapped = props.TextWrapped,
				TextXAlignment = props.TextXAlignment,
				TextYAlignment = props.TextYAlignment,

				[Roact.Event.Focused] = self.focused,
				[Roact.Event.FocusLost] = self.focusLost,
				[Roact.Change.CursorPosition] = self.cursorPositionChanged,
				[Roact.Change.Text] = self.textChanged,
				[Roact.Ref] = self.textBoxRef,

				[Roact.Change.TextSize] = if not FFlagDevFrameworkTextInputRemoveScrollingHack
					then self.textPropertiesUpdated
					else nil,
				[Roact.Change.Font] = if not FFlagDevFrameworkTextInputRemoveScrollingHack
					then self.textPropertiesUpdated
					else nil,
			}),
		})
	end
end

if not FFlagDevFrameworkTextInputRemoveScrollingHack then
	function TextBox:_resetTextBoxOffset()
		local textBox = self.textBoxRef.current
		if textBox then
			textBox.Position = UDim2.new(0, 0, 0, 0)
		end
	end

	--[[
		Update the position of the TextBox within the clipping Pane so the cursor is
		always visible. This can be revisited once UISYS-276 is fixed.
	]]
	function TextBox:_updateTextBoxOffset()
		local textBox = self.textBoxRef.current
		if not textBox then
			return
		end

		local clipBox = self.clipBoxRef.current
		if not clipBox then
			return
		end

		local isMultiLine = self.props.MultiLine
		if isMultiLine then
			return
		end

		local textBehindCursor = string.sub(textBox.Text, 1, textBox.CursorPosition - 1)
		if #textBehindCursor ~= textBox.CursorPosition - 1 then
			-- When a text change causes the cursor position to change, the CursorPosition
			-- change event is fired before the Text change event. These CursorPosition
			-- change events should be ignored, since the changed text isn't updated yet.
			return
		end

		local font = textBox.Font
		local textSize = textBox.TextSize
		local cursorOffset = TextService:GetTextSize(textBehindCursor, textSize, font, ZERO_VECTOR).X
		local textWidth = TextService:GetTextSize(textBox.Text, textSize, font, ZERO_VECTOR).X

		local textBoxOffset = math.min(textBox.Position.X.Offset, 0)
		local textBoxWidth = clipBox.AbsoluteSize.X
		local visibleStart = -textBoxOffset
		local visibleEnd = visibleStart + textBoxWidth

		if cursorOffset <= visibleStart then
			-- If the cursor is before the leading edge of the clip area, offset
			-- the TextBox so the cursor is at the leading edge.
			textBoxOffset = -cursorOffset
		elseif cursorOffset >= visibleEnd then
			-- If the cursor is after the trailing edge of the clip area, offset
			-- the TextBox so the cursor is at the trailing edge.
			textBoxOffset = -(cursorOffset - textBoxWidth)
		end

		local overflow = math.max(textWidth - textBoxWidth, 0)
		textBoxOffset = math.max(textBoxOffset, -overflow)
		if cursorOffset == textBoxWidth - textBoxOffset then
			textBoxOffset -= 1
		end

		textBox.Position = UDim2.new(0, math.ceil(textBoxOffset), 0, 0)
		textBox.Size = UDim2.new(0, math.ceil(math.max(textWidth, textBoxWidth)), 1, 0)
	end
end

return withForwardRef(TextBox)
