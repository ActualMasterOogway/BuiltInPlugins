local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Signal);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 15 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy)
    local v3 = {
        Name = "", 
        Tooltip = "", 
        Icon = "", 
        Enabled = false, 
        Click = v1.new()
    };
    setmetatable(v3);
    return v3;
end;
v2.SetActive = function(v4, v5) --[[ Line: 28 ]] --[[ Name: SetActive ]]
    v4.Enabled = v5;
end;
local v6 = {};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 41 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v8 = {
        Title = v7, 
        Buttons = {}
    };
    setmetatable(v8, v6);
    return v8;
end;
v6.CreateButton = function(_, v10, v11, v12) --[[ Line: 51 ]] --[[ Name: CreateButton ]]
    -- upvalues: v2 (copy)
    return v2.new(v10, v11, v12);
end;
local v13 = {};
v13.__index = v13;
v13.__newindex = function(v14, v15, v16) --[[ Line: 63 ]]
    if v15 == "_signals" then
        return;
    else
        v14[v15] = v16;
        v14._signals[v15]:fire(v16);
        return;
    end;
end;
v13.new = function(v17, v18) --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v13 (copy)
    assert(type(v17) == "string", "DockWidgetPluginGui's title must be a string");
    assert(type(v18) == "table", "DockWidgetPluginGui's widgetInfo must be an array");
    assert(#v18 == 7, "Unexpected table provided for widgetInfo, expected an array");
    local v19 = {
        Name = "", 
        Title = v17, 
        ZIndexBehavior = Enum.ZIndexBehavior.Global, 
        Enabled = true
    };
    local v20 = {};
    for v21, _ in pairs(v19) do
        v20[v21] = v1.new();
    end;
    v19._signals = v20;
    setmetatable(v19, v13);
    return v19;
end;
v13.GetPropertyChangedSignal = function(v23, v24) --[[ Line: 105 ]] --[[ Name: GetPropertyChangedSignal ]]
    assert(v24 ~= nil, "Need a property to observe changes");
    assert(v23[v24] ~= nil, "Could not find the key," .. tostring(v24) .. " please add it to the constructor");
    return v23._signals[v24];
end;
local v25 = {};
v25.__index = v25;
v25.new = function(_, v27) --[[ Line: 120 ]] --[[ Name: new ]]
    local v28 = true;
    if v27.InitialEnabled then
        v28 = v27.InitialEnabled == true;
    end;
    local l_BillboardGui_0 = Instance.new("BillboardGui");
    l_BillboardGui_0.Enabled = v28;
    return l_BillboardGui_0;
end;
local v30 = {};
v30.__index = v30;
v30.new = function() --[[ Line: 140 ]] --[[ Name: new ]]
    -- upvalues: v30 (copy)
    local v31 = {
        Name = ""
    };
    setmetatable(v31, v30);
    return v31;
end;
v30.CreateToolbar = function(_, v33) --[[ Line: 149 ]] --[[ Name: CreateToolbar ]]
    -- upvalues: v6 (copy)
    return v6.new(v33);
end;
v30.CreateDockWidgetPluginGui = function(_, v35, v36) --[[ Line: 153 ]] --[[ Name: CreateDockWidgetPluginGui ]]
    -- upvalues: v13 (copy)
    return v13.new(v35, v36);
end;
v30.CreateQWidgetPluginGui = function(_, v38, v39) --[[ Line: 157 ]] --[[ Name: CreateQWidgetPluginGui ]]
    -- upvalues: v25 (copy)
    return v25.new(v38, v39);
end;
v30.GetMouse = function(_) --[[ Line: 161 ]] --[[ Name: GetMouse ]]
    return {};
end;
return v30;