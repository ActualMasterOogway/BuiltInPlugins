local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v3 = require(l_Parent_0.UI.Components.Dialog);
local v4 = v1.PureComponent:extend("ExampleDialog");
v4.init = function(v5) --[[ Line: 9 ]] --[[ Name: init ]]
    v5.state = {
        enabled = false
    };
    v5.open = function() --[[ Line: 13 ]]
        -- upvalues: v5 (copy)
        v5:setState({
            enabled = true
        });
    end;
    v5.close = function() --[[ Line: 18 ]]
        -- upvalues: v5 (copy)
        v5:setState({
            enabled = false
        });
    end;
end;
v4.render = function(v6) --[[ Line: 25 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return v1.createElement(v2, {
        Style = "Round", 
        Text = "Open Dialog", 
        Size = UDim2.fromOffset(120, 32), 
        OnClick = v6.open
    }, {
        Dialog = v1.createElement(v3, {
            Title = "A Vanilla Dialog", 
            Enabled = v6.state.enabled, 
            Size = Vector2.new(300, 120), 
            OnClose = v6.close, 
            Modal = true
        })
    });
end;
return v4;