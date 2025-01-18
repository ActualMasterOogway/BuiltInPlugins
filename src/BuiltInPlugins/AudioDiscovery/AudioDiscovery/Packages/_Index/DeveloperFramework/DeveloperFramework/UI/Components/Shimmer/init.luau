local l_TweenService_0 = game:GetService("TweenService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkShimmerImprovements);
local v4 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v4.withContext;
local v6 = require(l_Parent_0.Util.Typecheck);
local l_UI_0 = l_Parent_0.UI;
local v8 = require(l_UI_0.Components.Pane);
local v9 = require(l_Parent_0.Util.prioritize);
local v10 = v2.PureComponent:extend("Shimmer");
v6.wrap(v10, script);
v10.init = function(v11) --[[ Line: 41 ]] --[[ Name: init ]]
    -- upvalues: v3 (copy), v2 (copy)
    if v3() then
        v11.gradientRef = v2.createRef();
        return;
    else
        local v12, v13 = v2.createBinding(os.clock());
        v11.clockBinding = v12;
        v11.updateClockBinding = v13;
        return;
    end;
end;
v10.didMount = function(v14) --[[ Line: 49 ]] --[[ Name: didMount ]]
    -- upvalues: v3 (copy), l_TweenService_0 (copy)
    if v3() then
        local l_Stylizer_0 = v14.props.Stylizer;
        local l_current_0 = v14.gradientRef.current;
        local v17 = TweenInfo.new(l_Stylizer_0.TweenInfo.Time, l_Stylizer_0.TweenInfo.EasingStyle, l_Stylizer_0.TweenInfo.EasingDirection);
        local v18 = l_TweenService_0:Create(l_current_0, v17, {
            Offset = l_Stylizer_0.OffsetEnd
        });
        v14.animateTask = task.defer(function() --[[ Line: 63 ]]
            -- upvalues: l_Stylizer_0 (copy), l_current_0 (copy), v18 (copy)
            local l_DelayTime_0 = l_Stylizer_0.DelayTime;
            while true do
                l_current_0.Offset = l_Stylizer_0.OffsetStart;
                v18:Play();
                v18.Completed:Wait();
                l_current_0.Offset = l_Stylizer_0.OffsetStart;
                v18:Play();
                v18.Completed:Wait();
                task.wait(l_DelayTime_0);
            end;
        end);
        return;
    else
        v14.clockTask = task.spawn(function() --[[ Line: 76 ]]
            -- upvalues: v14 (copy)
            while true do
                v14.updateClockBinding(os.clock());
                task.wait();
            end;
        end);
        return;
    end;
end;
v10.willUnmount = function(v20) --[[ Line: 85 ]] --[[ Name: willUnmount ]]
    -- upvalues: v3 (copy)
    if v3() then
        task.cancel(v20.animateTask);
        return;
    else
        task.cancel(v20.clockTask);
        return;
    end;
end;
v10.render = function(v21) --[[ Line: 93 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v9 (copy), v2 (copy), v8 (copy)
    local l_props_0 = v21.props;
    local l_Stylizer_1 = l_props_0.Stylizer;
    if v3() then
        local v24 = v9(l_props_0.BackgroundColor, l_Stylizer_1.BackgroundColor);
        local v25 = v9(l_props_0.CornerRadius, l_Stylizer_1.CornerRadius);
        if typeof(v25) == "number" then
            v25 = UDim.new(0, v25);
        end;
        local v26 = l_props_0.Size or UDim2.fromScale(1, 1);
        return v2.createElement(v8, {
            AnchorPoint = l_props_0.AnchorPoint, 
            BackgroundColor = v24, 
            LayoutOrder = l_props_0.LayoutOrder, 
            Position = l_props_0.Position, 
            Size = v26
        }, {
            UIGradient = v2.createElement("UIGradient", {
                Color = ColorSequence.new({
                    ColorSequenceKeypoint.new(0, l_Stylizer_1.ColorStart), 
                    ColorSequenceKeypoint.new(0.5, l_Stylizer_1.ColorMiddle), 
                    ColorSequenceKeypoint.new(1, l_Stylizer_1.ColorEnd)
                }), 
                Offset = l_Stylizer_1.OffsetStart, 
                Rotation = l_Stylizer_1.Rotation, 
                [v2.Ref] = v21.gradientRef
            }), 
            UICorner = if v25 then v2.createElement("UICorner", {
                CornerRadius = v25
            }) else nil
        }, l_props_0[v2.Children]);
    else
        return v2.createElement(v8, {
            BackgroundColor = v21.clockBinding:map(function(v27) --[[ Line: 130 ]]
                -- upvalues: l_Stylizer_1 (copy)
                return l_Stylizer_1.ColorStart:Lerp(l_Stylizer_1.ColorEnd, (math.sin(6.283185307179586 * (1 / l_Stylizer_1.TransitionPeriod) * v27) + 1) / 2);
            end), 
            LayoutOrder = l_props_0.LayoutOrder, 
            Size = l_props_0.Size, 
            Style = {
                CornerRadius = l_Stylizer_1.CornerRadius
            }
        });
    end;
end;
return (l_withContext_0({
    Stylizer = v4.Stylizer
})(v10));