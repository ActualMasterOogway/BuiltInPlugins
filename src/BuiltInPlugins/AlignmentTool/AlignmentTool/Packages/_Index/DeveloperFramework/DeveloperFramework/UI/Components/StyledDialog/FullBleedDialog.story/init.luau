local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.StyledDialog);
local v3 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v4 = require(l_Parent_0.UI.Components.TextLabel);
local v5 = v1.PureComponent:extend("FullBleedDialogStory");
v5.init = function(v6) --[[ Line: 11 ]] --[[ Name: init ]]
    v6.state = {
        enabled = false
    };
end;
v5.render = function(v7) --[[ Line: 17 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v3 (copy), v2 (copy), v4 (copy)
    return v1.createElement(v3, {
        Size = UDim2.new(1, 0, 0, 30), 
        LayoutOrder = 2, 
        Style = "Round", 
        Text = "Open FullBleed Dialog", 
        OnClick = function() --[[ Line: 23 ]] --[[ Name: OnClick ]]
            -- upvalues: v7 (copy)
            v7:setState({
                enabled = true
            });
        end
    }, {
        Dialog = v1.createElement(v2, {
            Style = "FullBleed", 
            Enabled = v7.state.enabled, 
            Resizable = true, 
            Title = "Styled Dialog examples", 
            MinContentSize = Vector2.new(400, 100), 
            Buttons = {
                {
                    Key = "ok", 
                    Text = "OK"
                }
            }, 
            OnButtonPressed = function() --[[ Line: 38 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: v7 (copy)
                v7:setState({
                    enabled = false
                });
            end, 
            OnClose = function() --[[ Line: 43 ]] --[[ Name: OnClose ]]
                -- upvalues: v7 (copy)
                v7:setState({
                    enabled = false
                });
            end
        }, {
            Contents = v1.createElement("Frame", {
                BackgroundColor3 = Color3.new(0, 1, 0), 
                Size = UDim2.fromScale(1, 1)
            }, {
                Label = v1.createElement(v4, {
                    Size = UDim2.fromScale(1, 1), 
                    Text = "No padding is added to content above the button container", 
                    TextColor = Color3.new(0, 0, 0), 
                    TextWrapped = true
                })
            })
        })
    });
end;
return v5;