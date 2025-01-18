local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = l_Parent_0.Src.Util;
local v8 = require(l_Util_0.Constants);
local l_Pane_0 = v3.UI.Pane;
local v10 = v4.Component:extend("LoadingBar");
v10.init = function(v11, _) --[[ Line: 37 ]] --[[ Name: init ]]
    v11:setState({
        progress = 0, 
        time = 0
    });
end;
v10.loadUntil = function(v13, v14) --[[ Line: 44 ]] --[[ Name: loadUntil ]]
    -- upvalues: l_RunService_0 (copy)
    while v13.state.progress < v14 do
        local v15 = l_RunService_0.RenderStepped:Wait();
        if v13.isMounted then
            local v16 = v13.state.time + v15;
            v13:setState({
                time = v16, 
                progress = v16 / v13.props.loadingTime
            });
        else
            break;
        end;
    end;
end;
v10.didMount = function(v17) --[[ Line: 58 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v17.isMounted = true;
    spawn(function() --[[ Line: 60 ]]
        -- upvalues: v17 (copy), l_RunService_0 (ref)
        v17:loadUntil(v17.props.holdPercent);
        while v17.isMounted and v17.props.onFinish == nil do
            l_RunService_0.RenderStepped:Wait();
        end;
        v17:loadUntil(1);
        v17:loadUntil(1.5);
        if v17.isMounted then
            v17.props.onFinish();
        end;
    end);
end;
v10.willUnmount = function(v18) --[[ Line: 81 ]] --[[ Name: willUnmount ]]
    v18.isMounted = false;
end;
v10.render = function(v19) --[[ Line: 85 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v8 (copy), l_Pane_0 (copy)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v22 = math.min(math.max(v19.state.progress, 0), 1);
    local v23 = l_props_0.loadingText .. " ( " .. math.floor(v22 * 100 + 0.5) .. "% )";
    return v4.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = l_props_0.Position
    }, {
        LoadingTitle = v4.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Font = v8.FONT, 
            Position = UDim2.new(0, 0, 0, -30), 
            Size = UDim2.new(1, 0, 0, 20), 
            Text = v23, 
            TextColor3 = l_Stylizer_0.loading.text, 
            TextSize = v8.FONT_SIZE_MEDIUM, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        LoadingBackgroundBar = v4.createElement(l_Pane_0, {
            Style = "BorderBox"
        }, {
            LoadingBar = v4.createElement(l_Pane_0, {
                Style = "Box", 
                BackgroundColor = l_Stylizer_0.loading.bar, 
                Size = UDim2.new(v22, 0, 1, 0)
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v10));