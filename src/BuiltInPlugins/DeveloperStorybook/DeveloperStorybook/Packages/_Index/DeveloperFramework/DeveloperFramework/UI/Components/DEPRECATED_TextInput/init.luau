--[[
	(DEPRECATED)
	PLEASE USE TextInput instead
	A single line text input box.
	It handles scrolling to the right when the text reaches the end of the visible box. That functionality can be removed from here when UISYS-276 is implemented.
	It supports a placeholder value.
	It does not handle labels, error messages or tooltips. They should be implemented by higher order wrappers.

	Optional Props:
		table ForwardRef: An optional ref to pass to the underlying Frame.
		boolean Enabled: Whether the input is editable. Defaults to true.
		number LayoutOrder: The layout order of this component in a list.
		boolean ForceOnTextChange: Whether or not to always run the textChange function regardless of difference in text shown
		callback OnInputBegan: callback for when user input (keystroke) begins.
		callback OnInputEnded: callback for when user input (keystroke) ends.
		callback OnTextChanged: callback for when the text was changed - OnTextChanged(text: string)
		callback OnFocusGained: callback to tell parent that this component's focus was gained - OnFocusGained()
		callback OnFocusLost: callback to tell parent that this component's focus was lost - OnFocusLost(enterPressed: boolean)
		string PlaceholderText: Placeholder text to show when the input is empty.
		string Text: Text to populate the input with.
		Style Style: The style with which to render this component.
		Stylizer Stylizer: A Stylizer ContextItem, which is provided via withContext.
		StyleModifier StyleModifier: The StyleModifier index into Style.
		boolean ShouldFocus: Set focus onto the box so that the user can start typing.
		UDim2 Position: The position of this component.
		UDim2 Size: The size of this component.
		Vector2 AnchorPoint: The anchor point of this component
		boolean MultiLine: If the TextBox is Multilined.
		boolean TextWrapped: If the Text should be wrapped to the next line.
		Enum.Font Font: The font used to render the text.
		Enum.TextXAlignment TextXAlignment: The X Alignment of the text.
		Enum.TextYAlignment TextYAlignment: The Y Alignment of the text.
		number TextSize: The font size of the text.
		string PlaceholderText: The PlaceholderText.

	Style Values:
		Enum.Font Font: The font used to render the text.
		Color3 PlaceholderTextColor: The color of the placeholder text.
		number Padding: The padding of the text input.
		table Padding: Specific padding values for Top, Bottom, Left, and Right.
		number TextSize: The font size of the text.
		Color3 TextColor: The color of the search term text.
]]
local Framework = script:FindFirstAncestor("UI").Parent
local Roact = require(Framework.Parent.Roact)

local ContextServices = require(Framework.UI.ContextServices)
local withContext = ContextServices.withContext

local prioritize = require(Framework.Util.prioritize)
local Typecheck = require(Framework.Util.Typecheck)

local withForwardRef = require(Framework.Wrappers.withForwardRef)

local Container = require(Framework.UI.Components.Container)
local RoundBox = require(Framework.UI.Components.RoundBox)
local StyleModifier = require(Framework.Util.StyleModifier)

local TextInput = Roact.PureComponent:extend("DEPRECATED_TextInput")
Typecheck.wrap(TextInput, script)

local FFlagDevFrameworkFixTextInputFits = game:DefineFastFlag("DevFrameworkFixTextInputFits", false)

function TextInput:init()
	self.textBoxRef = self.props.ForwardRef or Roact.createRef()

	self.isHover = false
	self.isFocused = false

	self.setStyleModifier = function()
		local modifier
		if self.isFocused then
			modifier = StyleModifier.Selected
		elseif self.isHover then
			modifier = StyleModifier.Hover
		else
			modifier = Roact.None
		end

		self:setState({
			StyleModifier = modifier,
		})
	end

	if FFlagDevFrameworkFixTextInputFits then
		self.refit = function(rbx)
			if rbx.TextFits then
				rbx.TextXAlignment = self.props.TextXAlignment or Enum.TextXAlignment.Left
			else
				rbx.TextXAlignment = self.props.TextXAlignment or Enum.TextXAlignment.Right
			end
		end
	end

	self.onTextChanged = function(rbx)
		-- workaround because we do not disconnect events before we start unmounting host components.
		-- see https://github.com/Roblox/roact/issues/235 for more info
		if not self.textBoxRef.current then
			return
		end

		if not self.props.MultiLine then
			if FFlagDevFrameworkFixTextInputFits then
				self.refit(rbx)
			else
				if rbx.TextFits then
					rbx.TextXAlignment = self.props.TextXAlignment or Enum.TextXAlignment.Left
				else
					rbx.TextXAlignment = self.props.TextXAlignment or Enum.TextXAlignment.Right
				end
			end

			if self.props.ForceOnTextChange then
				local processed = string.gsub(rbx.Text, "[\n\r]", " ")
				self.props.OnTextChanged(processed)
			else
				if rbx.Text ~= self.props.Text then
					local processed = string.gsub(rbx.Text, "[\n\r]", " ")
					if self.props.OnTextChanged then
						self.props.OnTextChanged(processed)
					end
				end
			end
		else
			if rbx.Text ~= self.props.Text then
				self.props.OnTextChanged(rbx.Text)
			end
		end
	end

	self.onFocusGained = function(rbx, pressed)
		self.isFocused = true
		self.setStyleModifier()

		if self.props.OnFocusGained then
			self.props.OnFocusGained(rbx, pressed)
		end
	end

	self.onFocusLost = function(rbx, enterPressed)
		-- workaround because we do not disconnect events before we start unmounting host components.
		-- see https://github.com/Roblox/roact/issues/235 for more info
		if not self.textBoxRef.current then
			return
		end

		self.isFocused = false
		self.setStyleModifier()

		local textBox = self.textBoxRef.current
		textBox.TextXAlignment = self.props.TextXAlignment or Enum.TextXAlignment.Left

		if self.props.OnFocusLost then
			self.props.OnFocusLost(enterPressed, rbx)
		end
	end

	self.mouseEnter = function()
		self.isHover = true
		self.setStyleModifier()
	end

	self.mouseLeave = function()
		self.isHover = false
		self.setStyleModifier()
	end
end

function TextInput:didUpdate(prevProps)
	-- The ShouldFocus prop is used in preference to exposing a ref to the parent component
	-- to avoid exposing the inner TextBox to manipulation
	if self.props.ShouldFocus and not prevProps.ShouldFocus and self.textBoxRef.current then
		self.textBoxRef.current:CaptureFocus()
	end
end

function TextInput:render()
	local props = self.props

	local enabled = props.Enabled == nil and true or props.Enabled
	local layoutOrder = props.LayoutOrder or 0
	local multiLine = props.MultiLine
	local placeholderText = props.PlaceholderText
	local position = props.Position
	local size = props.Size or UDim2.new(1, 0, 1, 0)
	local text = props.Text or ""
	local textWrapped = props.TextWrapped
	local onInputBegan = self.props.OnInputBegan
	local onInputEnded = self.props.OnInputEnded

	local style = props.Stylizer
	local font = prioritize(props.Font, style.Font)
	local textSize = prioritize(props.TextSize, style.TextSize)

	local textColor = style.TextColor
	local placeholderTextColor = style.PlaceholderTextColor

	local textBox = Roact.createElement("TextBox", {
		Visible = self.props.Visible,

		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClearTextOnFocus = false,

		PlaceholderText = placeholderText,
		PlaceholderColor3 = placeholderTextColor,
		Font = font,
		MultiLine = multiLine,
		TextSize = textSize,
		TextColor3 = textColor,
		Text = text,
		TextXAlignment = props.TextXAlignment or Enum.TextXAlignment.Left,
		TextYAlignment = props.TextYAlignment or nil,
		TextEditable = enabled,
		TextWrapped = textWrapped,

		[Roact.Ref] = self.textBoxRef,

		[Roact.Event.Focused] = self.onFocusGained,
		[Roact.Event.FocusLost] = self.onFocusLost,
		[Roact.Change.Text] = self.onTextChanged,
		[Roact.Change.TextFits] = if FFlagDevFrameworkFixTextInputFits then self.refit else nil,
		[Roact.Event.MouseEnter] = self.mouseEnter,
		[Roact.Event.MouseLeave] = self.mouseLeave,

		[Roact.Event.InputBegan] = onInputBegan,
		[Roact.Event.InputEnded] = onInputEnded,
	})

	local backgroundStyle = style.BackgroundStyle
	local padding = style.Padding

	local background = style.useRoundBox and RoundBox or nil

	return Roact.createElement(Container, {
		AnchorPoint = props.AnchorPoint,
		ClipsDescendants = true,
		Position = position,
		Padding = padding,
		Size = size,
		Background = background,
		BackgroundStyle = backgroundStyle,
		LayoutOrder = layoutOrder,
	}, {
		TextBox = textBox,
	})
end

TextInput = withContext({
	Stylizer = ContextServices.Stylizer,
})(TextInput)

return withForwardRef(TextInput)
