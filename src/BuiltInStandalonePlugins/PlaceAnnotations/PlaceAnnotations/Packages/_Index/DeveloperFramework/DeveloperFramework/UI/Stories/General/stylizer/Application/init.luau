local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local l_withContext_0 = require(l_Parent_0.UI.ContextServices).withContext;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(script.Parent.Button);
local v4 = require(script.Parent.Dialog);
local l_Stylizer_0 = require(l_Parent_0.Style).Stylizer;
local v6 = v2.PureComponent:extend("Application");
v6.init = function(v7) --[[ Line: 16 ]] --[[ Name: init ]]
    v7.state = {
        className = "Important"
    };
    v7.changeStyle = function() --[[ Line: 21 ]]
        -- upvalues: v7 (copy)
        local v8 = "Sub";
        if v7.state.className == v8 then
            v8 = "Important";
        end;
        v7:setState({
            className = v8
        });
    end;
end;
v6.render = function(v9) --[[ Line: 32 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy)
    return v2.createElement("Frame", {
        Size = UDim2.fromOffset(500, 500)
    }, {
        UIListLayout = v2.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Padding = UDim.new(0, 20), 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        }), 
        Dialog1 = v2.createElement(v4, {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(300, 150), 
            Style = v9.state.className
        }), 
        Dialog2 = v2.createElement(v4, {
            LayoutOrder = 2, 
            Size = UDim2.fromOffset(300, 150)
        }), 
        Button = v2.createElement(v3, {
            LayoutOrder = 3, 
            Size = UDim2.fromOffset(300, 60), 
            Text = "Click to change Style prop for Dialog 2", 
            OnClick = v9.changeStyle
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_Stylizer_0
})(v6));