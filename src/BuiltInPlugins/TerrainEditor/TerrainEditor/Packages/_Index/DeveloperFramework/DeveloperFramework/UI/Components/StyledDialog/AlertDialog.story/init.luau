local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v3 = require(l_Parent_0.UI.Components.StyledDialog);
local v4 = v1.PureComponent:extend("AlertDialog");
v4.init = function(v5) --[[ Line: 8 ]] --[[ Name: init ]]
    v5.state = {
        enabled = false
    };
end;
v4.render = function(v6) --[[ Line: 14 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.createElement(v2, {
        Size = UDim2.new(1, 0, 0, 30), 
        LayoutOrder = 2, 
        Style = "Round", 
        Text = "Open Alert Dialog", 
        OnClick = function() --[[ Line: 20 ]] --[[ Name: OnClick ]]
            -- upvalues: v6 (copy)
            v6:setState({
                enabled = true
            });
        end
    }, {
        Dialog = v1.createElement(v3, {
            Style = "Alert", 
            Enabled = v6.state.enabled, 
            Title = "Styled Dialog examples", 
            MinContentSize = Vector2.new(400, 100), 
            Buttons = {
                {
                    Key = "ok", 
                    Text = "OK"
                }
            }, 
            OnButtonPressed = function(v7) --[[ Line: 34 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: v6 (copy)
                print("Dialog button pressed : ", v7);
                v6:setState({
                    enabled = false
                });
            end, 
            OnClose = function() --[[ Line: 40 ]] --[[ Name: OnClose ]]
                -- upvalues: v6 (copy)
                v6:setState({
                    enabled = false
                });
            end
        }, {
            Contents = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                TextSize = 50, 
                Text = "WARNING!", 
                TextColor3 = Color3.new(1, 1, 1), 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0, 0)
            })
        })
    });
end;
return v4;