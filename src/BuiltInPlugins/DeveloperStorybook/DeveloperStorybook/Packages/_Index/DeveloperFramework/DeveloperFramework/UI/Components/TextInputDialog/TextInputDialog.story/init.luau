local Framework = script:FindFirstAncestor("UI").Parent
local Roact = require(Framework.Parent.Roact)
local TextInputDialog = require(Framework.UI.Components.TextInputDialog)
local Button = require(Framework.UI.Components.DEPRECATED_Button)

local ExampleTextInputDialog = Roact.PureComponent:extend("ExampleTextInputDialog")

function ExampleTextInputDialog:init()
	self.state = {
		enabled = false,
	}
end

function ExampleTextInputDialog:render()
	return Roact.createElement(Button, {
		Size = UDim2.new(0, 200, 0, 30),
		LayoutOrder = 1,
		Text = "Open TextInputDialog",
		Style = "RoundPrimary",
		OnClick = function()
			self:setState({
				enabled = true,
			})
		end,
	}, {
		Dialog = Roact.createElement(TextInputDialog, {
			Enabled = self.state.enabled,
			Title = "Title",
			Header = "Header",
			Buttons = {
				{ Key = "Submit", Text = "Submit" },
				{ Key = "Cancel", Text = "Cancel" },
			},
			Body = "Body of Dialog. You could use this to inform a user about what the dialog is doing.",
			Description = "Description for the TextInput on what the user should input or whatever you want!",
			TextInput = { { PlaceholderText = "Placeholder Text" } },
			OnClose = function(text)
				print("TextInputDialog - OnClose - TextInput: ", text)
				self:setState({
					enabled = false,
				})
			end,
			OnButtonPressed = function(buttonKey, text)
				print("TextInputDialog - OnButtonPressed: ", buttonKey, " - TextInput: ", text)
				self:setState({
					enabled = false,
				})
			end,
		}),
	})
end

return ExampleTextInputDialog
