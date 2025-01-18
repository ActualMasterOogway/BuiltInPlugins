local l_Selection_0 = game:GetService("Selection");
return function(v1, v2, v3) --[[ Line: 3 ]] --[[ Name: openInsertObjectMenu ]]
    -- upvalues: l_Selection_0 (copy)
    local l_v1_PluginComponent_0 = v1:GetPluginComponent("InsertObjectDataModelController");
    l_Selection_0:Set({
        v2
    });
    task.spawn(function() --[[ Line: 9 ]]
        -- upvalues: l_v1_PluginComponent_0 (copy), v3 (copy), v2 (copy)
        l_v1_PluginComponent_0:OpenPopupAsync({
            TargetWidgetUri = {
                DataModel = "Standalone", 
                PluginId = "ExplorerPlugin", 
                PluginType = "Standalone"
            }, 
            Offset = v3
        }, v2);
    end);
end;