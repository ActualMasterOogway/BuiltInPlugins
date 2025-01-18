local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = require(l_Parent_0.Util.Typecheck);
local v6 = v2.PureComponent:extend("LoadingIndicator");
v5.wrap(v6, script);
v6.init = function(v7) --[[ Line: 40 ]] --[[ Name: init ]]
    v7.state = {
        time = 1.5707963267948966, 
        sinTime = 1, 
        animatingBlockIndex = 1
    };
end;
v6.didMount = function(v8) --[[ Line: 48 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v8.animationConnection = l_RunService_0.RenderStepped:connect(function(v9) --[[ Line: 49 ]]
        -- upvalues: v8 (copy)
        v8:updateAnimation(v9);
    end);
end;
v6.willUnmount = function(v10) --[[ Line: 54 ]] --[[ Name: willUnmount ]]
    if v10.animationConnection then
        v10.animationConnection:Disconnect();
    end;
end;
v6.updateAnimation = function(v11, v12) --[[ Line: 63 ]] --[[ Name: updateAnimation ]]
    v11:setState(function(v13) --[[ Line: 64 ]]
        -- upvalues: v12 (copy)
        local l_sinTime_0 = v13.sinTime;
        local l_animatingBlockIndex_0 = v13.animatingBlockIndex;
        local v16 = v13.time + v12;
        local v17 = math.sin(v16 * 5);
        if l_sinTime_0 >= 0 and v17 < 0 or l_sinTime_0 < 0 and v17 >= 0 then
            l_animatingBlockIndex_0 = l_animatingBlockIndex_0 % 3 + 1;
        end;
        return {
            time = v16, 
            sinTime = v17, 
            animatingBlockIndex = l_animatingBlockIndex_0
        };
    end);
end;
v6.render = function(v18) --[[ Line: 86 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    local l_props_0 = v18.props;
    local l_state_0 = v18.state;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Position_0 = l_props_0.Position;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Size_0 = l_Stylizer_0.Size;
    local v27 = l_props_0.Size or l_Size_0;
    local l_StartColor_0 = l_Stylizer_0.StartColor;
    local l_EndColor_0 = l_Stylizer_0.EndColor;
    local v30 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0.23076923076923078, 0), 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Center
        })
    };
    local v31 = math.abs(l_state_0.sinTime);
    local l_animatingBlockIndex_1 = l_state_0.animatingBlockIndex;
    for v33 = 1, 3 do
        local v34 = 0.6;
        local l_l_StartColor_0_0 = l_StartColor_0;
        if v33 == l_animatingBlockIndex_1 then
            v34 = v34 + (1 - v34) * v31;
            l_l_StartColor_0_0 = l_StartColor_0:lerp(l_EndColor_0, v31);
        end;
        v30["Frame" .. v33] = v2.createElement("Frame", {
            Size = UDim2.new(0.15384615384615385, 0, v34, 0), 
            LayoutOrder = v33, 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_l_StartColor_0_0
        });
    end;
    return v2.createElement("Frame", {
        AnchorPoint = l_AnchorPoint_0, 
        Position = l_Position_0, 
        Size = v27, 
        ZIndex = l_ZIndex_0, 
        LayoutOrder = l_LayoutOrder_0, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1
    }, v30);
end;
return (l_withContext_0({
    Stylizer = v3.Stylizer
})(v6));