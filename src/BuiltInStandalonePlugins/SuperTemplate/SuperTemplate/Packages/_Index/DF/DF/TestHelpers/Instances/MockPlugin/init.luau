local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Util.Signal);
local v2 = require(script.Parent.MockMouse);
local v3 = require(script.Parent.MockPluginToolbar);
local v4 = require(script.Parent.MockPluginComponents);
local v5 = {};
v5.__index = v5;
local function _() --[[ Line: 11 ]] --[[ Name: createScreenGui ]]
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    pcall(function() --[[ Line: 13 ]]
        -- upvalues: l_ScreenGui_0 (copy)
        l_ScreenGui_0.Parent = game.CoreGui;
    end);
    l_ScreenGui_0.Name = "PluginMockGui";
    l_ScreenGui_0.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    return l_ScreenGui_0;
end;
v5.new = function(v8, v9) --[[ Line: 28 ]] --[[ Name: new ]]
    -- upvalues: v1 (copy), v2 (copy), v5 (copy)
    local v10 = setmetatable({
        _id = v8 or "", 
        Name = v8 or "MockPlugin", 
        Deactivation = v1.new(), 
        Unloading = v1.new(), 
        _activated = false, 
        _activatedWithExclusiveMouse = false, 
        _mouse = v2.new(), 
        _toolbars = {}, 
        _mockedSettings = {}, 
        subWindows = {}
    }, v5);
    if v9 then
        v10._mockedPlugins = v9;
        v10._mockedPlugins[v10] = true;
    end;
    return v10;
end;
v5.Destroy = function(v11) --[[ Line: 56 ]] --[[ Name: Destroy ]]
    for _, v13 in pairs(v11._toolbars) do
        v13:Destroy();
    end;
    v11._toolbars = {};
    if v11._mouse then
        v11._mouse:Destroy();
        v11._mouse = nil;
    end;
    if v11._mockedPlugins then
        v11._mockedPlugins[v11] = nil;
        v11._mockedPlugins = nil;
    end;
end;
v5.CreateToolbar = function(v14, v15) --[[ Line: 73 ]] --[[ Name: CreateToolbar ]]
    -- upvalues: v3 (copy)
    if v14._toolbars[v15] then
        return v14._toolbars[v15];
    else
        local v16 = v3.new(v14, v15);
        v14._toolbars[v15] = v16;
        return v16;
    end;
end;
v5.IsActivated = function(v17) --[[ Line: 83 ]] --[[ Name: IsActivated ]]
    return v17._activated;
end;
v5.IsActivatedWithExclusiveMouse = function(v18) --[[ Line: 87 ]] --[[ Name: IsActivatedWithExclusiveMouse ]]
    return v18._activatedWithExclusiveMouse;
end;
v5.Activate = function(v19, v20) --[[ Line: 91 ]] --[[ Name: Activate ]]
    if v19._mockedPlugins then
        for v21, _ in pairs(v19._mockedPlugins) do
            if v21._activated then
                v21:Deactivate();
            end;
        end;
    end;
    v19._activated = true;
    v19._activatedWithExclusiveMouse = v20 and true or false;
end;
v5.CreatePluginAction = function(_) --[[ Line: 104 ]] --[[ Name: CreatePluginAction ]]
    -- upvalues: v1 (copy)
    return {
        Triggered = v1.new()
    };
end;
v5.Deactivate = function(v24) --[[ Line: 110 ]] --[[ Name: Deactivate ]]
    if not v24._activated then
        return;
    else
        v24._activated = false;
        v24._activatedWithExclusiveMouse = false;
        v24.Deactivation:Fire();
        return;
    end;
end;
v5.GetMouse = function(v25) --[[ Line: 119 ]] --[[ Name: GetMouse ]]
    return v25._mouse;
end;
v5.GetSubWindow = function(v26, v27) --[[ Line: 123 ]] --[[ Name: GetSubWindow ]]
    local v28 = tick();
    local v29 = v28 + 1;
    while not v26.subWindows[v27] do
        wait();
        if tick() > v28 + v29 then
            error("Sub-window has not been created");
        end;
    end;
    return v26.subWindows[v27];
end;
v5.CreateDockWidgetPluginGui = function(v30, _, ...) --[[ Line: 136 ]] --[[ Name: CreateDockWidgetPluginGui ]]
    local l_ScreenGui_1 = Instance.new("ScreenGui");
    pcall(function() --[[ Line: 13 ]]
        -- upvalues: l_ScreenGui_1 (copy)
        l_ScreenGui_1.Parent = game.CoreGui;
    end);
    l_ScreenGui_1.Name = "PluginMockGui";
    l_ScreenGui_1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
    local l_l_ScreenGui_1_0 = l_ScreenGui_1;
    table.insert(v30.subWindows, l_l_ScreenGui_1_0);
    l_l_ScreenGui_1_0.Destroying:Connect(function() --[[ Line: 139 ]]
        -- upvalues: v30 (copy), l_l_ScreenGui_1_0 (copy)
        local v34 = assert(table.find(v30.subWindows, l_l_ScreenGui_1_0), "Couldn't find sub window GUI");
        table.remove(v30.subWindows, v34);
    end);
    return l_l_ScreenGui_1_0;
end;
v5.CreateQWidgetPluginGui = function(v35, v36, ...) --[[ Line: 146 ]] --[[ Name: CreateQWidgetPluginGui ]]
    return v35:CreateDockWidgetPluginGui(v36, ...);
end;
v5.GetSetting = function(v37, v38) --[[ Line: 149 ]] --[[ Name: GetSetting ]]
    return v37._mockedSettings[v38];
end;
v5.SetSetting = function(v39, v40, v41) --[[ Line: 153 ]] --[[ Name: SetSetting ]]
    v39._mockedSettings[v40] = v41;
end;
v5.MockSettings = function(v42, v43) --[[ Line: 157 ]] --[[ Name: MockSettings ]]
    v42._mockedSettings = v43;
end;
v5.GetUri = function(_) --[[ Line: 161 ]] --[[ Name: GetUri ]]
    return {
        DataModel = "Standalone", 
        PluginType = "Standalone", 
        PluginId = "MockPlugin"
    };
end;
v5.GetPluginComponent = function(_, v46) --[[ Line: 168 ]] --[[ Name: GetPluginComponent ]]
    -- upvalues: v4 (copy)
    return assert(v4[v46], (("No Plugin Component named %*"):format(v46)));
end;
return v5;