local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactUtils);
local l_Plugin_0 = v1.ContextServices.Plugin;
return function() --[[ Line: 9 ]] --[[ Name: useFocusedDataModelType ]]
    -- upvalues: l_Plugin_0 (copy), v2 (copy), v3 (copy)
    local v5 = l_Plugin_0:use():get();
    local v6, v7 = v2.useState(v5.MultipleDocumentInterfaceInstance);
    local v8, v9 = v2.useState(nil);
    local v10, v11 = v2.useState(nil);
    v3.useEventConnection(v5:GetPropertyChangedSignal("MultipleDocumentInterfaceInstance"), function() --[[ Line: 18 ]]
        -- upvalues: v7 (copy), v5 (copy)
        v7(v5.MultipleDocumentInterfaceInstance);
    end, {});
    v2.useEffect(function() --[[ Line: 22 ]]
        -- upvalues: v6 (copy), v9 (copy)
        if v6 == nil then
            return nil;
        else
            v9(v6.FocusedDataModelSession);
            local v12 = v6.DataModelSessionStarted:Connect(function() --[[ Line: 30 ]]
                -- upvalues: v9 (ref), v6 (ref)
                v9(v6.FocusedDataModelSession);
            end);
            return function() --[[ Line: 34 ]]
                -- upvalues: v12 (copy)
                v12:Disconnect();
            end;
        end;
    end, {
        v6
    });
    v2.useEffect(function() --[[ Line: 39 ]]
        -- upvalues: v8 (copy), v11 (copy)
        if v8 == nil then
            return nil;
        else
            v11(v8.CurrentDataModelType);
            local v13 = v8.CurrentDataModelTypeChanged:Connect(function() --[[ Line: 45 ]]
                -- upvalues: v11 (ref), v8 (ref)
                v11(v8.CurrentDataModelType);
            end);
            return function() --[[ Line: 49 ]]
                -- upvalues: v13 (copy)
                v13:Disconnect();
            end;
        end;
    end, {
        v8
    });
    return v10;
end;