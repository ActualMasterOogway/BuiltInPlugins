if not plugin then
    return;
else
    local l_Parent_0 = script.Parent.Parent.Parent;
    local l_Common_0 = script.Parent.Parent.Common;
    local v2 = require(l_Common_0.commonInit);
    v2();
    local v3 = require(l_Parent_0.Packages.TestLoader);
    v3.launch("Notifications", l_Parent_0.Src);
    if v3.isCli() then
        return;
    else
        local l_MultipleDocumentInterfaceInstance_0 = plugin.MultipleDocumentInterfaceInstance;
        local v5 = nil;
        local function _() --[[ Line: 39 ]] --[[ Name: initializeDataModel ]]
            if not plugin.HostDataModelTypeIsCurrent then
                return;
            else
                return;
            end;
        end;
        (function() --[[ Line: 51 ]] --[[ Name: init ]]
            -- upvalues: v2 (copy), l_MultipleDocumentInterfaceInstance_0 (copy), v5 (ref)
            v2();
            local l_FocusedDataModelSession_0 = l_MultipleDocumentInterfaceInstance_0.FocusedDataModelSession;
            l_FocusedDataModelSession_0.CurrentDataModelTypeAboutToChange:Connect(function() --[[ Line: 55 ]]
                -- upvalues: v5 (ref)
                if v5 then
                    v5:destroy();
                    v5 = nil;
                end;
            end);
            l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(function() --[[ Line: 62 ]]
                if not plugin.HostDataModelTypeIsCurrent then
                    return;
                else
                    return;
                end;
            end);
            if not plugin.HostDataModelTypeIsCurrent then
                return;
            else
                return;
            end;
        end)();
        return;
    end;
end;