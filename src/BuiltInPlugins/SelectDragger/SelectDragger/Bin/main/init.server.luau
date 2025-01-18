local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local l_DraggerFramework_0 = l_Parent_0.Packages.DraggerFramework;
local v3 = require(l_Parent_0.Packages.Roact);
local l_DraggerSchemaCore_0 = l_Parent_0.Packages.DraggerSchemaCore;
local v5 = require(l_DraggerSchemaCore_0.DraggerSchema);
local v6 = require(l_DraggerFramework_0.Implementation.DraggerContext_PluginImpl);
local v7 = require(l_DraggerFramework_0.DraggerTools.DraggerToolComponent);
if require(l_DraggerFramework_0.Utility.isCli)() then
    return;
else
    local v8 = nil;
    local v9 = false;
    local v10 = nil;
    local v11 = nil;
    local function v13(v12) --[[ Line: 31 ]] --[[ Name: openPlugin ]]
        -- upvalues: v10 (ref), v9 (ref), v11 (ref), v3 (copy), v7 (copy), v8 (ref), v5 (copy)
        if v10 then
            warn("Plugin handle already exists");
            return;
        else
            v9 = true;
            plugin:Activate(true);
            v11:SetActive(true);
            v10 = v3.mount(v3.createElement(v7, {
                Mouse = plugin:GetMouse(), 
                DraggerContext = v8, 
                DraggerSchema = v5, 
                DraggerSettings = {
                    AnalyticsName = "Select", 
                    AllowDragSelect = true, 
                    AllowFreeformDrag = true
                }, 
                WasAutoSelected = v12
            }));
            return;
        end;
    end;
    local function _() --[[ Line: 56 ]] --[[ Name: closePlugin ]]
        -- upvalues: v9 (ref), v11 (ref), v10 (ref), v3 (copy)
        v9 = false;
        v11:SetActive(false);
        if v10 then
            v3.unmount(v10);
            v10 = nil;
        end;
    end;
    (function() --[[ Line: 65 ]] --[[ Name: main ]]
        -- upvalues: v11 (ref), v8 (ref), v6 (copy), v5 (copy), v9 (ref), v10 (ref), v3 (copy), v13 (copy)
        plugin.Name = "SelectDragger";
        v11 = plugin:CreateToolbar("Home"):CreateButton("Select", "Select an Object", "", "Select");
        v8 = v6.new(plugin, game, settings(), v5.Selection.new());
        plugin.Deactivation:connect(function() --[[ Line: 72 ]]
            -- upvalues: v9 (ref), v11 (ref), v10 (ref), v3 (ref)
            if v9 then
                v9 = false;
                v11:SetActive(false);
                if v10 then
                    v3.unmount(v10);
                    v10 = nil;
                end;
            end;
        end);
        v11.Click:Connect(function() --[[ Line: 78 ]]
            -- upvalues: v9 (ref), v11 (ref), v10 (ref), v3 (ref), v13 (ref)
            if v9 then
                v9 = false;
                v11:SetActive(false);
                if v10 then
                    v3.unmount(v10);
                    v10 = nil;
                    return;
                end;
            else
                v13(false);
            end;
        end);
    end)();
    if not l_RunService_0:IsRunning() or l_RunService_0:IsRunMode() then
        v13(true);
    end;
    return;
end;