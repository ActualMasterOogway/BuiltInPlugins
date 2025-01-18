local l_Parent_0 = script.Parent.Parent;
if require(l_Parent_0.Src.Util.DebugFlags).RunningUnderCLI() then
    return;
else
    local l_MultipleDocumentInterfaceInstance_0 = plugin.MultipleDocumentInterfaceInstance;
    local l_Common_0 = script.Parent.Parent.Common;
    local v3 = require(l_Common_0.commonInit);
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 25 ]]
        return game:GetService("StudioService"):HasInternalPermission();
    end);
    if not l_status_0 then
        l_result_0 = false;
    end;
    local v6 = nil;
    local function _() --[[ Line: 34 ]] --[[ Name: initializeDataModel ]]
        -- upvalues: l_result_0 (ref), l_Parent_0 (copy), v6 (ref)
        if not plugin.HostDataModelTypeIsCurrent then
            return;
        else
            if l_result_0 then
                v6 = require(l_Parent_0.Packages.Framework).DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                v6:addPluginRouter(plugin);
            end;
            return;
        end;
    end;
    (function() --[[ Line: 46 ]] --[[ Name: init ]]
        -- upvalues: v3 (copy), l_MultipleDocumentInterfaceInstance_0 (copy), v6 (ref), l_result_0 (ref), l_Parent_0 (copy)
        v3();
        local l_FocusedDataModelSession_0 = l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession;
        l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function() --[[ Line: 50 ]]
            -- upvalues: v6 (ref)
            if v6 then
                v6:destroy();
                v6 = nil;
            end;
        end);
        l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(function() --[[ Line: 57 ]]
            -- upvalues: l_result_0 (ref), l_Parent_0 (ref), v6 (ref)
            if not plugin.HostDataModelTypeIsCurrent then
                return;
            else
                if l_result_0 then
                    v6 = require(l_Parent_0.Packages.Framework).DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                    v6:addPluginRouter(plugin);
                end;
                return;
            end;
        end);
        if not plugin.HostDataModelTypeIsCurrent then
            return;
        else
            if l_result_0 then
                v6 = require(l_Parent_0.Packages.Framework).DeveloperTools.forPlugin(l_Parent_0.Name, plugin);
                v6:addPluginRouter(plugin);
            end;
            return;
        end;
    end)();
    return;
end;