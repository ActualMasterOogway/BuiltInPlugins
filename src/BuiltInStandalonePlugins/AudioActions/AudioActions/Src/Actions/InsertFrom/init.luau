local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioActions");
local v2 = require(l_script_FirstAncestor_0.Src.Util.LocalizationUtil);
local v3 = require(l_script_FirstAncestor_0.Src.Util.WiringUtil);
local v4 = nil;
return {
    register = function(v5) --[[ Line: 11 ]] --[[ Name: register ]]
        -- upvalues: l_Selection_0 (copy), v3 (copy), v2 (copy), v4 (ref)
        local l_v5_PluginComponent_0 = v5:GetPluginComponent("Actions");
        local function v16() --[[ Line: 14 ]] --[[ Name: updateAction ]]
            -- upvalues: l_Selection_0 (ref), v3 (ref), v2 (ref), l_v5_PluginComponent_0 (copy)
            local v7 = l_Selection_0:Get();
            local v8 = false;
            if #v7 == 1 then
                v8 = v3.hasInputPin(v7[1]);
            end;
            local v9 = false;
            if #v7 == 1 then
                v9 = v3.hasOutputPin(v7[1]);
            end;
            local v10, v11 = v3.getWirableInstances(v7);
            local v12 = false;
            if v10 ~= nil then
                v12 = v11 ~= nil;
            end;
            local v13 = {
                Uri = {
                    DataModel = "Standalone", 
                    PluginId = "Audio", 
                    Category = "Actions", 
                    ItemId = "Insert Before"
                }, 
                Enabled = v8, 
                Visible = v8, 
                Text = v2.action("InsertBefore"), 
                Tooltip = v2.tooltip("InsertBefore"), 
                Shortcuts = {}
            };
            local v14 = {
                Uri = {
                    DataModel = "Standalone", 
                    PluginId = "Audio", 
                    Category = "Actions", 
                    ItemId = "Insert After"
                }, 
                Enabled = v9, 
                Visible = v9, 
                Text = v2.action("InsertAfter"), 
                Tooltip = v2.tooltip("InsertAfter"), 
                Shortcuts = {}
            };
            local v15 = {
                Uri = {
                    DataModel = "Standalone", 
                    PluginId = "Audio", 
                    Category = "Actions", 
                    ItemId = "Insert Between"
                }, 
                Enabled = v12, 
                Visible = v12, 
                Text = v2.action("InsertBetween"), 
                Tooltip = v2.tooltip("InsertBetween"), 
                Shortcuts = {}
            };
            l_v5_PluginComponent_0:CreateAsync(v13, true);
            l_v5_PluginComponent_0:CreateAsync(v14, true);
            l_v5_PluginComponent_0:CreateAsync(v15, true);
        end;
        v16();
        v4 = l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 73 ]]
            -- upvalues: v16 (copy)
            v16();
        end);
    end, 
    deregister = function() --[[ Line: 78 ]] --[[ Name: deregister ]]
        -- upvalues: v4 (ref)
        if v4 then
            v4:Disconnect();
            v4 = nil;
        end;
    end
};