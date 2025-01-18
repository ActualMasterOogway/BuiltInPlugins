local l_Studio_0 = settings().Studio;
local l_ServiceVisibilityService_0 = game:GetService("ServiceVisibilityService");
return function(v2) --[[ Line: 6 ]] --[[ Name: listenForVisibilityChanges ]]
    -- upvalues: l_Studio_0 (copy), l_ServiceVisibilityService_0 (copy)
    local v3 = {
        "Show Hidden Objects in Explorer", 
        "Show Core GUI in Explorer while Playing", 
        "Show Plugin GUI Service in Explorer", 
        "ShowCorePackagesInExplorer", 
        "Show FileSyncService"
    };
    local v4 = {};
    for _, v6 in v3 do
        table.insert(v4, (l_Studio_0:GetPropertyChangedSignal(v6):Connect(function() --[[ Line: 17 ]]
            -- upvalues: v2 (copy)
            v2();
        end)));
    end;
    local v7 = false;
    local v8 = l_ServiceVisibilityService_0.Changed:Connect(function() --[[ Line: 27 ]]
        -- upvalues: v7 (ref), v2 (copy)
        if v7 then
            return;
        else
            v7 = true;
            v2();
            task.defer(function() --[[ Line: 33 ]]
                -- upvalues: v7 (ref)
                v7 = false;
            end);
            return;
        end;
    end);
    return function() --[[ Line: 38 ]]
        -- upvalues: v4 (copy), v8 (copy)
        for _, v10 in v4 do
            v10:Disconnect();
        end;
        v8:Disconnect();
    end;
end;