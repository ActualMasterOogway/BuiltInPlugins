local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local _ = require(l_script_FirstAncestor_0.Components.Types);
local _ = require(l_script_FirstAncestor_0.Providers.Style.Tokens);
local v3 = require(l_script_FirstAncestor_0.Enums.StateLayerMode);
local v4 = require(l_script_FirstAncestor_0.Enums.ControlState);
guiStateToStateLayer = function(v5) --[[ Line: 13 ]] --[[ Name: guiStateToStateLayer ]]
    -- upvalues: v4 (copy)
    if v5 == v4.Pressed then
        return "Press";
    elseif v5 == v4.SelectedPressed then
        return "Press";
    elseif v5 == v4.Hover then
        return "Hover";
    else
        return "Idle";
    end;
end;
stateLayerModeToTokenNamespace = function(v6) --[[ Line: 25 ]] --[[ Name: stateLayerModeToTokenNamespace ]]
    -- upvalues: v3 (copy)
    if v6 == v3.Default then
        return "Color";
    elseif v6 == v3.Inverse then
        return "Inverse";
    elseif v6 == v3.Light then
        return "LightMode";
    elseif v6 == v3.Dark then
        return "DarkMode";
    else
        return "Color";
    end;
end;
return function(v7, v8, v9) --[[ Line: 39 ]] --[[ Name: getStateLayerStyle ]]
    local v10 = stateLayerModeToTokenNamespace(v8 and v8.mode);
    local v11 = guiStateToStateLayer(v9);
    return v7[v10].State[v11];
end;