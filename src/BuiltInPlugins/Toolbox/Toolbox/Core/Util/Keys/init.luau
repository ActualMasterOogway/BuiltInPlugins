local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.wrapStrictTable);
local function _(v2) --[[ Line: 5 ]] --[[ Name: createKey ]]
    local v3 = newproxy(true);
    local v4 = ("Symbol(%s)"):format((tostring(v2)));
    getmetatable(v3).__tostring = function() --[[ Line: 8 ]]
        -- upvalues: v4 (copy)
        return v4;
    end;
    return v3;
end;
local v6 = {};
local v7 = newproxy(true);
local v8 = ("Symbol(%s)"):format((tostring("Localization")));
local l_v8_0 = v8 --[[ copy: 6 -> 7 ]];
getmetatable(v7).__tostring = function() --[[ Line: 8 ]]
    -- upvalues: l_v8_0 (copy)
    return l_v8_0;
end;
v6.localization = v7;
v7 = newproxy(true);
v8 = ("Symbol(%s)"):format((tostring("NetworkInterface")));
local l_v8_1 = v8 --[[ copy: 6 -> 8 ]];
getmetatable(v7).__tostring = function() --[[ Line: 8 ]]
    -- upvalues: l_v8_1 (copy)
    return l_v8_1;
end;
v6.networkInterface = v7;
v7 = newproxy(true);
v8 = ("Symbol(%s)"):format((tostring("PluginGui")));
local l_v8_2 = v8 --[[ copy: 6 -> 9 ]];
getmetatable(v7).__tostring = function() --[[ Line: 8 ]]
    -- upvalues: l_v8_2 (copy)
    return l_v8_2;
end;
v6.pluginGui = v7;
v7 = newproxy(true);
v8 = ("Symbol(%s)"):format((tostring("Plugin")));
local l_v8_3 = v8 --[[ copy: 6 -> 10 ]];
getmetatable(v7).__tostring = function() --[[ Line: 8 ]]
    -- upvalues: l_v8_3 (copy)
    return l_v8_3;
end;
v6.plugin = v7;
v7 = newproxy(true);
v8 = ("Symbol(%s)"):format((tostring("Settings")));
local l_v8_4 = v8 --[[ copy: 6 -> 11 ]];
getmetatable(v7).__tostring = function() --[[ Line: 8 ]]
    -- upvalues: l_v8_4 (copy)
    return l_v8_4;
end;
v6.settings = v7;
v7 = newproxy(true);
v8 = ("Symbol(%s)"):format((tostring("Theme")));
local l_v8_5 = v8 --[[ copy: 6 -> 12 ]];
getmetatable(v7).__tostring = function() --[[ Line: 8 ]]
    -- upvalues: l_v8_5 (copy)
    return l_v8_5;
end;
v6.theme = v7;
v7 = newproxy(true);
v8 = ("Symbol(%s)"):format((tostring("MarketplaceCamera")));
local l_v8_6 = v8 --[[ copy: 6 -> 13 ]];
getmetatable(v7).__tostring = function() --[[ Line: 8 ]]
    -- upvalues: l_v8_6 (copy)
    return l_v8_6;
end;
v6.camera = v7;
v7 = newproxy(true);
v8 = ("Symbol(%s)"):format((tostring("LoadingInProgress")));
getmetatable(v7).__tostring = function() --[[ Line: 8 ]]
    -- upvalues: v8 (copy)
    return v8;
end;
v6.LoadingInProgress = v7;
return v1(v6, "Keys");