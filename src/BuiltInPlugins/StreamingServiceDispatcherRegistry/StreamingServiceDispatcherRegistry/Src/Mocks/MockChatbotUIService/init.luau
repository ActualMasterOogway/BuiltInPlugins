local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local l_Signal_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.Signal;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 10 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), l_Signal_0 (copy)
    local v3 = {};
    setmetatable(v3, v2);
    v3.ShiftVariationSignal = l_Signal_0.new();
    v3.ShiftToAssetIdSignal = l_Signal_0.new();
    v3.ActionActivatedSignal = l_Signal_0.new();
    v3.FindVariationsSignal = l_Signal_0.new();
    v3.SetMaterialSettingsSignal = l_Signal_0.new();
    v3.SettingChangedSignal = l_Signal_0.new();
    v3.settings = {
        AutoRunCode = true
    };
    v3.displayContentCalls = {};
    return v3;
end;
v2.DisplayContent = function(v4, v5, v6) --[[ Line: 27 ]] --[[ Name: DisplayContent ]]
    if not v4.displayContentCalls[v5] then
        v4.displayContentCalls[v5] = {};
    end;
    table.insert(v4.displayContentCalls[v5], v6);
end;
v2.GetSettings = function(v7) --[[ Line: 34 ]] --[[ Name: GetSettings ]]
    return v7.settings;
end;
return v2;