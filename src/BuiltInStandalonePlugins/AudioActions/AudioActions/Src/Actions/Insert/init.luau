local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
local v3 = require(l_script_FirstAncestor_0.Src.Util.LocalizationUtil);
local v4 = require(l_script_FirstAncestor_0.Src.Util.WiringUtil);
local function v12(v5) --[[ Line: 10 ]] --[[ Name: insertInstance ]]
    -- upvalues: l_Selection_0 (copy), l_ChangeHistoryService_0 (copy)
    local v6 = l_Selection_0:Get();
    if #v6 == 0 then
        v6 = {
            workspace
        };
    end;
    local v7 = l_ChangeHistoryService_0:TryBeginRecording((("Insert %*"):format(v5)));
    local v8 = {};
    for _, v10 in v6 do
        local v11 = Instance.new(v5);
        v11.Parent = v10;
        table.insert(v8, v11);
    end;
    l_Selection_0:Set(v8);
    if v7 then
        l_ChangeHistoryService_0:FinishRecording(v7, Enum.FinishRecordingOperation.Commit);
    end;
end;
local v13 = {};
local function v16() --[[ Line: 32 ]] --[[ Name: resetInsertConnections ]]
    -- upvalues: v13 (ref)
    for _, v15 in v13 do
        if v15 then
            v15:Disconnect();
        end;
    end;
    v13 = {};
end;
return {
    register = function(v17) --[[ Line: 43 ]] --[[ Name: register ]]
        -- upvalues: v16 (copy), v4 (copy), v3 (copy), v13 (ref), v12 (copy)
        local l_v17_PluginComponent_0 = v17:GetPluginComponent("Actions");
        v16();
        for v19, _ in v4.getAudioInstanceDefs() do
            local v21 = {
                Uri = {
                    DataModel = "Standalone", 
                    PluginId = "Audio", 
                    Category = "Actions", 
                    ItemId = ("Insert/%*"):format(v19)
                }, 
                Enabled = true, 
                Visible = true, 
                Text = string.gsub(v3.action("Insert"), "%%s", v19), 
                Tooltip = string.gsub(v3.tooltip("Insert"), "%%s", v19), 
                Icon = v19, 
                Shortcuts = {}
            };
            table.insert(v13, l_v17_PluginComponent_0:CreateAsync(v21, true)[1]:Connect(function() --[[ Line: 66 ]]
                -- upvalues: v12 (ref), v19 (copy)
                v12(v19);
            end));
        end;
    end, 
    deregister = function() --[[ Line: 73 ]] --[[ Name: deregister ]]
        -- upvalues: v16 (copy)
        v16();
    end
};