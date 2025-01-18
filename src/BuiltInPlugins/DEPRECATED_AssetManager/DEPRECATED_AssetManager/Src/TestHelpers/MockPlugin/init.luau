local l_Parent_0 = script.Parent.Parent.Parent;
local l_Signal_0 = require(l_Parent_0.Packages.Framework).Util.Signal;
local v2 = require(script.Parent.MockMouse);
local v3 = {};
v3.__index = v3;
v3.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v3 (copy)
    local v4 = {
        Name = "", 
        Tooltip = "", 
        Icon = "", 
        Enabled = false, 
        Click = l_Signal_0.new()
    };
    setmetatable(v4, v3);
    return v4;
end;
v3.SetActive = function(v5, v6) --[[ Line: 29 ]] --[[ Name: SetActive ]]
    v5.Enabled = v6;
end;
local v7 = {};
v7.__index = v7;
v7.new = function(v8) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v7 (copy)
    local v9 = {
        Title = v8, 
        Buttons = {}
    };
    setmetatable(v9, v7);
    return v9;
end;
v7.CreateButton = function(_, _, _, _) --[[ Line: 51 ]] --[[ Name: CreateButton ]]
    -- upvalues: v3 (copy)
    return v3.new();
end;
local v14 = {};
v14.__index = v14;
v14.__newindex = function(v15, v16, v17) --[[ Line: 62 ]]
    if v16 == "_signals" then
        return;
    else
        v15[v16] = v17;
        v15._signals[v16]:fire(v17);
        return;
    end;
end;
v14.new = function(v18, v19) --[[ Line: 74 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v14 (copy)
    assert(type(v18) == "string", "DockWidgetPluginGui's title must be a string");
    assert(type(v19) == "table", "DockWidgetPluginGui's widgetInfo must be an array");
    assert(#v19 == 7, "Unexpected table provided for widgetInfo, expected an array");
    local v20 = {
        Name = "", 
        Title = v18, 
        ZIndexBehavior = Enum.ZIndexBehavior.Global, 
        Enabled = true
    };
    local v21 = {};
    for v22, _ in pairs(v20) do
        v21[v22] = l_Signal_0.new();
    end;
    v20._signals = v21;
    setmetatable(v20, v14);
    return v20;
end;
v14.GetPropertyChangedSignal = function(v24, v25) --[[ Line: 104 ]] --[[ Name: GetPropertyChangedSignal ]]
    assert(v25 ~= nil, "Need a property to observe changes");
    assert(v24[v25] ~= nil, "Could not find the key," .. tostring(v25) .. " please add it to the constructor");
    return v24._signals[v25];
end;
local v26 = {};
local v27 = {};
v27.__index = v27;
v27.new = function() --[[ Line: 120 ]] --[[ Name: new ]]
    -- upvalues: l_Signal_0 (copy), v2 (copy), v27 (copy), v26 (copy)
    local v28 = setmetatable({
        Name = "", 
        Deactivation = l_Signal_0.new(), 
        Unloading = l_Signal_0.new(), 
        _activated = false, 
        _activatedWithExclusiveMouse = false, 
        _mouse = v2.new()
    }, v27);
    v26[v28] = true;
    return v28;
end;
v27.Destroy = function(v29) --[[ Line: 138 ]] --[[ Name: Destroy ]]
    -- upvalues: v26 (copy)
    v26[v29] = nil;
end;
v27.CreateToolbar = function(_, v31) --[[ Line: 142 ]] --[[ Name: CreateToolbar ]]
    -- upvalues: v7 (copy)
    return v7.new(v31);
end;
v27.CreateDockWidgetPluginGui = function(_, v33, v34) --[[ Line: 146 ]] --[[ Name: CreateDockWidgetPluginGui ]]
    -- upvalues: v14 (copy)
    return v14.new(v33, v34);
end;
v27.GetMouse = function(v35) --[[ Line: 150 ]] --[[ Name: GetMouse ]]
    return v35._mouse;
end;
v27.IsActivated = function(v36) --[[ Line: 154 ]] --[[ Name: IsActivated ]]
    return v36._activated;
end;
v27.IsActivatedWithExclusiveMouse = function(v37) --[[ Line: 158 ]] --[[ Name: IsActivatedWithExclusiveMouse ]]
    return v37._activatedWithExclusiveMouse;
end;
v27.Activate = function(v38, v39) --[[ Line: 162 ]] --[[ Name: Activate ]]
    -- upvalues: v26 (copy)
    if v38._activated then
        return;
    else
        for v40, _ in pairs(v26) do
            if v40._activated then
                v40:Deactivate();
            end;
        end;
        v38._activated = true;
        v38._activatedWithExclusiveMouse = v39;
        return;
    end;
end;
v27.Deactivate = function(v42) --[[ Line: 175 ]] --[[ Name: Deactivate ]]
    if not v42._activated then
        return;
    else
        v42._activated = false;
        v42._activatedWithExclusiveMouse = false;
        v42.Deactivation:fire();
        return;
    end;
end;
return v27;