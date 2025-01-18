local l_RobloxPluginGuiService_0 = game:GetService("RobloxPluginGuiService");
local l_StudioAssetService_0 = game:GetService("StudioAssetService");
return function(v2) --[[ Line: 4 ]] --[[ Name: serializeInstances ]]
    -- upvalues: l_RobloxPluginGuiService_0 (copy), l_StudioAssetService_0 (copy)
    local l_Folder_0 = Instance.new("Folder");
    l_Folder_0.Name = "TemporaryInstances";
    l_Folder_0.Parent = l_RobloxPluginGuiService_0;
    for _, v5 in pairs(v2) do
        v5.Parent = l_Folder_0;
    end;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 12 ]]
        -- upvalues: l_StudioAssetService_0 (ref), v2 (copy)
        return l_StudioAssetService_0:DEPRECATED_SerializeInstances(v2);
    end);
    for _, v9 in pairs(v2) do
        v9.Parent = nil;
    end;
    l_Folder_0:Destroy();
    if l_status_0 then
        return l_result_0;
    else
        error("SerializeInstances failed: " .. tostring(l_result_0));
        return;
    end;
end;