local l_UserGameSettings_0 = UserSettings():GetService("UserGameSettings");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
local v2 = require(l_script_FirstAncestor_0.Src.Util.LocalizationUtil);
local function v4(v3) --[[ Line: 8 ]] --[[ Name: updateMainVolume ]]
    -- upvalues: l_UserGameSettings_0 (copy)
    if l_UserGameSettings_0 then
        l_UserGameSettings_0.MasterVolumeStudio = v3.Value;
    end;
end;
local v5 = {
    DataModel = "Standalone", 
    PluginId = "Audio", 
    Category = "Settings", 
    ItemId = "Main Volume"
};
local function _() --[[ Line: 21 ]] --[[ Name: getSettingDef ]]
    -- upvalues: v5 (copy), v2 (copy), l_UserGameSettings_0 (copy)
    return {
        Uri = v5, 
        Text = v2.action("MainVolume"), 
        Tooltip = v2.tooltip("MainVolume"), 
        Enabled = true, 
        Value = l_UserGameSettings_0.MasterVolumeStudio
    };
end;
local v7 = {};
local v8 = nil;
local v9 = nil;
v7.register = function(v10) --[[ Line: 36 ]] --[[ Name: register ]]
    -- upvalues: v5 (copy), v2 (copy), l_UserGameSettings_0 (copy), v8 (ref), v4 (copy), v9 (ref)
    local l_v10_PluginComponent_0 = v10:GetPluginComponent("Settings");
    if l_v10_PluginComponent_0:GetAsync({
        v5
    })[1] then
        l_v10_PluginComponent_0:UpdateAsync({
            {
                Uri = v5, 
                Text = v2.action("MainVolume"), 
                Tooltip = v2.tooltip("MainVolume"), 
                Enabled = true, 
                Value = l_UserGameSettings_0.MasterVolumeStudio
            }
        });
    else
        l_v10_PluginComponent_0:CreateAsync({
            {
                Uri = v5, 
                Text = v2.action("MainVolume"), 
                Tooltip = v2.tooltip("MainVolume"), 
                Enabled = true, 
                Value = l_UserGameSettings_0.MasterVolumeStudio
            }
        });
    end;
    if v8 then
        v8:Disconnect();
        v8 = nil;
    end;
    v8 = l_v10_PluginComponent_0:BindAsync(v5):Connect(v4);
    if v9 then
        v9:Disconnect();
        v9 = nil;
    end;
    v9 = l_UserGameSettings_0:GetPropertyChangedSignal("MasterVolumeStudio"):Connect(function() --[[ Line: 56 ]]
        -- upvalues: l_v10_PluginComponent_0 (copy), v5 (ref), v2 (ref), l_UserGameSettings_0 (ref)
        l_v10_PluginComponent_0:UpdateAsync({
            {
                Uri = v5, 
                Text = v2.action("MainVolume"), 
                Tooltip = v2.tooltip("MainVolume"), 
                Enabled = true, 
                Value = l_UserGameSettings_0.MasterVolumeStudio
            }
        });
    end);
end;
v7.deregister = function() --[[ Line: 61 ]] --[[ Name: deregister ]]
    -- upvalues: v8 (ref), v9 (ref)
    if v8 then
        v8:Disconnect();
        v8 = nil;
    end;
    if v9 then
        v9:Disconnect();
        v9 = nil;
    end;
end;
return v7;