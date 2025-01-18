local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local v5 = require(l_Parent_0.UI.Components.Pane);
local v6 = require(l_Parent_0.UI.Components.TextLabel);
local v7 = require(l_Parent_0.UI.Components.LoadingBar);
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local v9 = require(l_Parent_0.Util.getSizeFromPropsAndStyle);
local v10 = v2.PureComponent:extend("TimeProgressBar");
l_Typecheck_0.wrap(v10, script);
local function _(v11) --[[ Line: 34 ]] --[[ Name: formatSecondsTimeString ]]
    return string.format("%02i:%02i", v11 / 60 % 60, v11 % 60);
end;
v10.init = function(v13, v14) --[[ Line: 38 ]] --[[ Name: init ]]
    assert(v14.TotalTime, "TotalTime prop must be specified");
    assert(v14.TotalTime >= 0, "TotalTime must not be negative");
    v13:setState({
        currentTime = 0
    });
    v13.isMounted = false;
    v13.disconnectUpdateConnection = function() --[[ Line: 48 ]]
        -- upvalues: v13 (copy)
        if v13.updateConnection then
            v13.updateConnection:Disconnect();
            v13.updateConnection = nil;
        end;
    end;
end;
v10.didMount = function(v15) --[[ Line: 56 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v15.isMounted = true;
    if v15.props.StartTime ~= nil then
        v15.startTime = v15.props.StartTime;
    else
        v15.startTime = tick();
    end;
    v15.updateConnection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 65 ]]
        -- upvalues: v15 (copy)
        if not v15.isMounted then
            v15.disconnectUpdateConnection();
            return;
        else
            local l_props_0 = v15.props;
            local v17 = tick() - v15.startTime;
            if l_props_0.TotalTime < v17 then
                v17 = l_props_0.TotalTime;
                v15.disconnectUpdateConnection();
            end;
            v15:setState({
                currentTime = v17
            });
            return;
        end;
    end);
end;
v10.willUnmount = function(v18) --[[ Line: 84 ]] --[[ Name: willUnmount ]]
    v18.disconnectUpdateConnection();
    v18.isMounted = false;
end;
v10.render = function(v19) --[[ Line: 89 ]] --[[ Name: render ]]
    -- upvalues: v9 (copy), v2 (copy), v5 (copy), v6 (copy), v7 (copy)
    local l_props_1 = v19.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local v22 = 0;
    if l_props_1.TotalTime > 0 then
        v22 = v19.state.currentTime / l_props_1.TotalTime;
    end;
    local v23 = v9(l_props_1, l_Stylizer_0);
    local v24 = UDim2.fromOffset(l_Stylizer_0.LabelWidth, 0);
    local l_createElement_0 = v2.createElement;
    local l_v5_0 = v5;
    local v27 = {
        LayoutOrder = l_props_1.LayoutOrder, 
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Size = v23, 
        Spacing = l_Stylizer_0.Spacing
    };
    local v28 = {};
    local l_createElement_1 = v2.createElement;
    local l_v6_0 = v6;
    local v31 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 1, 
        Size = v24
    };
    local l_currentTime_0 = v19.state.currentTime;
    v31.Text = string.format("%02i:%02i", l_currentTime_0 / 60 % 60, l_currentTime_0 % 60);
    v31.TextXAlignment = Enum.TextXAlignment.Right;
    v28.CurrentTime = l_createElement_1(l_v6_0, v31);
    v28.LoadingBar = v2.createElement(v7, {
        LayoutOrder = 2, 
        Progress = v22, 
        Size = l_Stylizer_0.LoadingBarSize
    });
    l_createElement_1 = v2.createElement;
    l_v6_0 = v6;
    v31 = {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = 3, 
        Size = v24
    };
    l_currentTime_0 = l_props_1.TotalTime;
    v31.Text = string.format("%02i:%02i", l_currentTime_0 / 60 % 60, l_currentTime_0 % 60);
    v31.TextXAlignment = Enum.TextXAlignment.Left;
    v28.TotalTime = l_createElement_1(l_v6_0, v31);
    return l_createElement_0(l_v5_0, v27, v28);
end;
return (l_withContext_0({
    Stylizer = v3.Stylizer
})(v10));