local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v3 = require(l_Parent_0.UI.Components.StyledDialog);
local v4 = v1.PureComponent:extend("DefaultDialog");
v4.init = function(v5) --[[ Line: 9 ]] --[[ Name: init ]]
    v5.state = {
        enabled = false
    };
end;
v4.render = function(v6) --[[ Line: 15 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.createElement(v2, {
        Size = UDim2.new(1, 0, 0, 30), 
        LayoutOrder = 1, 
        Style = "Round", 
        Text = "Open Default Dialog", 
        OnClick = function() --[[ Line: 21 ]] --[[ Name: OnClick ]]
            -- upvalues: v6 (copy)
            v6:setState({
                enabled = true
            });
        end
    }, {
        Dialog = v1.createElement(v3, {
            Enabled = v6.state.enabled, 
            Modal = true, 
            Title = "Styled Dialog examples", 
            MinContentSize = Vector2.new(400, 100), 
            Buttons = {
                {
                    Key = "ok", 
                    Text = "OK"
                }
            }, 
            OnButtonPressed = function(v7) --[[ Line: 35 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: v6 (copy)
                print("Dialog button pressed : ", v7);
                v6:setState({
                    enabled = false
                });
            end, 
            OnClose = function() --[[ Line: 41 ]] --[[ Name: OnClose ]]
                -- upvalues: v6 (copy)
                v6:setState({
                    enabled = false
                });
            end
        }, {
            Contents = v1.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                TextSize = 50, 
                Text = "Hello", 
                TextColor3 = Color3.new(0, 0, 0), 
                Size = UDim2.fromScale(1, 1), 
                Position = UDim2.fromScale(0, 0)
            })
        })
    });
end;
return v4;