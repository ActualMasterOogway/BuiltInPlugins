local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
local v3 = require(l_script_FirstAncestor_0.Src.Util.LocalizationUtil);
local v4 = require(l_script_FirstAncestor_0.Src.Util.WiringUtil);
local function v10(v5, v6) --[[ Line: 10 ]] --[[ Name: wireUp ]]
    -- upvalues: l_ChangeHistoryService_0 (copy), v4 (copy), l_Selection_0 (copy)
    if not v5 or not v6 then
        return;
    else
        assert(v5, "inInstance was nil");
        assert(v6, "outInstance was nil");
        local v7 = l_ChangeHistoryService_0:TryBeginRecording("Wire Up");
        local v8 = v4.connectByWire(v5, v6);
        if v8 then
            l_Selection_0:Set({
                v8
            });
        end;
        if v7 then
            local v9 = if v8 then Enum.FinishRecordingOperation.Commit else Enum.FinishRecordingOperation.Cancel;
            l_ChangeHistoryService_0:FinishRecording(v7, v9);
        end;
        return;
    end;
end;
local v11 = nil;
local v12 = nil;
return {
    register = function(v13) --[[ Line: 35 ]] --[[ Name: register ]]
        -- upvalues: l_Selection_0 (copy), v4 (copy), v3 (copy), v11 (ref), v10 (copy), v12 (ref)
        local l_v13_PluginComponent_0 = v13:GetPluginComponent("Actions");
        local function v21() --[[ Line: 38 ]] --[[ Name: updateAction ]]
            -- upvalues: l_Selection_0 (ref), v4 (ref), v3 (ref), v11 (ref), l_v13_PluginComponent_0 (copy), v10 (ref)
            local v15 = l_Selection_0:Get();
            local v16, v17 = v4.getWirableInstances(v15);
            local v18 = false;
            if v16 ~= nil then
                v18 = v17 ~= nil;
            end;
            local v19 = v3.action("WireUpDisabled");
            if v18 then
                assert(v16, "inInstance was nil");
                assert(v17, "outInstance was nil");
                v19 = v3.action("WireUp");
                v19 = string.gsub(v19, "%%s", v16.Name);
                v19 = string.gsub(v19, "%%t", v17.Name);
            end;
            local v20 = {
                Uri = {
                    DataModel = "Standalone", 
                    PluginId = "Audio", 
                    Category = "Actions", 
                    ItemId = "Wire Up"
                }, 
                Enabled = v18, 
                Visible = v18, 
                Text = v19, 
                Icon = "Wire", 
                Tooltip = v3.tooltip("WireUp"), 
                Shortcuts = {}
            };
            if v11 then
                v11:Disconnect();
                v11 = nil;
            end;
            v11 = l_v13_PluginComponent_0:CreateAsync(v20, true)[1]:Connect(function() --[[ Line: 71 ]]
                -- upvalues: v10 (ref), v16 (copy), v17 (copy)
                v10(v16, v17);
            end);
        end;
        v21();
        v12 = l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 77 ]]
            -- upvalues: v21 (copy)
            v21();
        end);
    end, 
    deregister = function() --[[ Line: 82 ]] --[[ Name: deregister ]]
        -- upvalues: v12 (ref), v11 (ref)
        if v12 then
            v12:Disconnect();
            v12 = nil;
        end;
        if v11 then
            v11:Disconnect();
            v11 = nil;
        end;
    end
};