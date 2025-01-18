local l_RobloxPluginGuiService_0 = game:GetService("RobloxPluginGuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local v4 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxMigrateToOpenCloudUpload);
return function(v5, v6) --[[ Line: 11 ]] --[[ Name: SerializeInstances ]]
    -- upvalues: l_Promise_0 (copy), l_RobloxPluginGuiService_0 (copy), v4 (copy)
    return l_Promise_0.new(function(v7, v8) --[[ Line: 12 ]]
        -- upvalues: l_RobloxPluginGuiService_0 (ref), v5 (copy), v4 (ref), v6 (copy)
        task.spawn(function() --[[ Line: 13 ]]
            -- upvalues: l_RobloxPluginGuiService_0 (ref), v5 (ref), v4 (ref), v6 (ref), v7 (copy), v8 (copy)
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "TemporaryInstances";
            l_Folder_0.Parent = l_RobloxPluginGuiService_0;
            for _, v11 in pairs(v5) do
                v11.Parent = l_Folder_0;
            end;
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 21 ]]
                -- upvalues: v4 (ref), v6 (ref), v5 (ref)
                if v4() then
                    return v6:SerializeInstances(v5);
                else
                    return v6:DEPRECATED_SerializeInstances(v5);
                end;
            end);
            for _, v15 in pairs(v5) do
                v15.Parent = nil;
            end;
            l_Folder_0:Destroy();
            if l_status_0 then
                v7(l_result_0);
                return;
            else
                v8("SerializeInstances failed: " .. tostring(l_result_0));
                return;
            end;
        end);
    end);
end;