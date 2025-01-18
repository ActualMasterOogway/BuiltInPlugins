local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Util.Typecheck);
local v5 = require(l_Parent_0.UI.Components.ShowOnTop);
local v6 = v1.PureComponent:extend("KeyboardListener");
v4.wrap(v6, script);
v6.init = function(v7) --[[ Line: 23 ]] --[[ Name: init ]]
    v7.onInputBegan = function(_, v9) --[[ Line: 24 ]]
        -- upvalues: v7 (copy)
        if v9.UserInputType == Enum.UserInputType.Keyboard then
            v7.keysHeld[v9.KeyCode] = true;
            if v7.props.OnKeyPressed then
                v7.props.OnKeyPressed(v9, v7.keysHeld);
            end;
        end;
    end;
    v7.onInputEnded = function(_, v11) --[[ Line: 33 ]]
        -- upvalues: v7 (copy)
        if v11.UserInputType == Enum.UserInputType.Keyboard then
            v7.keysHeld[v11.KeyCode] = nil;
            if v7.props.OnKeyReleased then
                v7.props.OnKeyReleased(v11);
            end;
        end;
    end;
end;
v6.didMount = function(v12) --[[ Line: 43 ]] --[[ Name: didMount ]]
    local l_props_0 = v12.props;
    v12.keysHeld = {};
    v12.target = l_props_0.Focus:get();
    if v12.target:IsA("PluginGui") then
        v12.focusConnection = v12.target.WindowFocusReleased:Connect(function() --[[ Line: 49 ]]
            -- upvalues: v12 (copy), l_props_0 (copy)
            if v12.props.OnKeyReleased then
                for v14, _ in pairs(v12.keysHeld) do
                    l_props_0.OnKeyReleased({
                        KeyCode = v14, 
                        UserInputType = Enum.UserInputType.Keyboard
                    });
                end;
            end;
            v12.keysHeld = {};
        end);
    end;
end;
v6.render = function(v16) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy)
    return v1.createElement(v5, {}, {
        Listener = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundTransparency = 1, 
            [v1.Event.InputBegan] = v16.onInputBegan, 
            [v1.Event.InputEnded] = v16.onInputEnded
        })
    });
end;
v6.willUnmount = function(v17) --[[ Line: 74 ]] --[[ Name: willUnmount ]]
    if v17.focusConnection then
        v17.focusConnection:Disconnect();
    end;
end;
return (l_withContext_0({
    Focus = v2.Focus
})(v6));