local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
local v2 = require(l_script_FirstAncestor_0.Src.Util.LocalizationUtil);
local function v6() --[[ Line: 8 ]] --[[ Name: findAllPlaying ]]
    -- upvalues: l_Selection_0 (copy)
    local v3 = {};
    for _, v5 in game:GetDescendants() do
        if v5:IsA("AudioPlayer") and v5.IsPlaying then
            table.insert(v3, v5);
        end;
    end;
    l_Selection_0:Set(v3);
    return v3;
end;
local v7 = nil;
return {
    register = function(v8) --[[ Line: 25 ]] --[[ Name: register ]]
        -- upvalues: v2 (copy), v7 (ref), v6 (copy)
        local l_v8_PluginComponent_0 = v8:GetPluginComponent("Actions");
        local v10 = {
            Uri = {
                DataModel = "Standalone", 
                PluginId = "Audio", 
                Category = "Actions", 
                ItemId = "Find Playing"
            }, 
            Enabled = true, 
            Visible = true, 
            Text = v2.action("FindPlaying"), 
            Tooltip = v2.tooltip("FindPlaying"), 
            Icon = "Find", 
            Shortcuts = {}
        };
        if v7 then
            v7:Disconnect();
            v7 = nil;
        end;
        v7 = l_v8_PluginComponent_0:CreateAsync(v10, true)[1]:Connect(v6);
    end, 
    deregister = function() --[[ Line: 50 ]] --[[ Name: deregister ]]
        -- upvalues: v7 (ref)
        if v7 then
            v7:Disconnect();
            v7 = nil;
        end;
    end
};