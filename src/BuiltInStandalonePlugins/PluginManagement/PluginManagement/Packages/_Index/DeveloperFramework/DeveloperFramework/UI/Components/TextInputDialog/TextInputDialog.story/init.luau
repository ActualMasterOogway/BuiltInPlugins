local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.TextInputDialog);
local v3 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v4 = v1.PureComponent:extend("ExampleTextInputDialog");
v4.init = function(v5) --[[ Line: 8 ]] --[[ Name: init ]]
    v5.state = {
        enabled = false
    };
end;
v4.render = function(v6) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy)
    return v1.createElement(v3, {
        Size = UDim2.new(0, 200, 0, 30), 
        LayoutOrder = 1, 
        Text = "Open TextInputDialog", 
        Style = "RoundPrimary", 
        OnClick = function() --[[ Line: 20 ]] --[[ Name: OnClick ]]
            -- upvalues: v6 (copy)
            v6:setState({
                enabled = true
            });
        end
    }, {
        Dialog = v1.createElement(v2, {
            Enabled = v6.state.enabled, 
            Title = "Title", 
            Header = "Header", 
            Buttons = {
                {
                    Key = "Submit", 
                    Text = "Submit"
                }, 
                {
                    Key = "Cancel", 
                    Text = "Cancel"
                }
            }, 
            Body = "Body of Dialog. You could use this to inform a user about what the dialog is doing.", 
            Description = "Description for the TextInput on what the user should input or whatever you want!", 
            TextInput = {
                {
                    PlaceholderText = "Placeholder Text"
                }
            }, 
            OnClose = function(v7) --[[ Line: 37 ]] --[[ Name: OnClose ]]
                -- upvalues: v6 (copy)
                print("TextInputDialog - OnClose - TextInput: ", v7);
                v6:setState({
                    enabled = false
                });
            end, 
            OnButtonPressed = function(v8, v9) --[[ Line: 43 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: v6 (copy)
                print("TextInputDialog - OnButtonPressed: ", v8, " - TextInput: ", v9);
                v6:setState({
                    enabled = false
                });
            end
        })
    });
end;
return v4;