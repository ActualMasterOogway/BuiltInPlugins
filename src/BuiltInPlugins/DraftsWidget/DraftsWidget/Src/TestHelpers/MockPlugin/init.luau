local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Signal);
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v3 = {
        Name = "", 
        Tooltip = "", 
        Icon = "", 
        Enabled = false, 
        Click = v1.new()
    };
    setmetatable(v3, v2);
    return v3;
end;
v2.SetActive = function(v4, v5) --[[ Line: 27 ]] --[[ Name: SetActive ]]
    v4.Enabled = v5;
end;
local v6 = {};
v6.__index = v6;
v6.new = function(v7) --[[ Line: 39 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    local v8 = {
        Title = v7, 
        Buttons = {}
    };
    setmetatable(v8, v6);
    return v8;
end;
v6.CreateButton = function(_, _, _, _) --[[ Line: 49 ]] --[[ Name: CreateButton ]]
    -- upvalues: v2 (copy)
    return v2.new();
end;
local v13 = {};
v13.__index = v13;
v13.__newindex = function(v14, v15, v16) --[[ Line: 60 ]]
    if v15 == "_signals" then
        return;
    else
        v14[v15] = v16;
        v14._signals[v15]:fire(v16);
        return;
    end;
end;
v13.new = function(v17, v18) --[[ Line: 72 ]] --[[ Name: new ]]
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
v13.GetPropertyChangedSignal = function(v23, v24) --[[ Line: 102 ]] --[[ Name: GetPropertyChangedSignal ]]
    assert(v24 ~= nil, "Need a property to observe changes");
    assert(v23[v24] ~= nil, "Could not find the key," .. tostring(v24) .. " please add it to the constructor");
    return v23._signals[v24];
end;
local v25 = {};
v25.__index = v25;
v25.new = function() --[[ Line: 116 ]] --[[ Name: new ]]
    -- upvalues: v25 (copy)
    local v26 = {
        Name = ""
    };
    setmetatable(v26, v25);
    return v26;
end;
v25.CreateToolbar = function(_, v28) --[[ Line: 125 ]] --[[ Name: CreateToolbar ]]
    -- upvalues: v6 (copy)
    return v6.new(v28);
end;
v25.CreateDockWidgetPluginGui = function(_, v30, v31) --[[ Line: 129 ]] --[[ Name: CreateDockWidgetPluginGui ]]
    -- upvalues: v13 (copy)
    return v13.new(v30, v31);
end;
return v25;