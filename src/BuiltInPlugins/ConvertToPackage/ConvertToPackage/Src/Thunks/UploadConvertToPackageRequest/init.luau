local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.Constants);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.NetworkError);
local v4 = require(l_Actions_0.SetCurrentScreen);
local v5 = require(l_Actions_0.UploadResult);
local v6 = require(l_Parent_0.Src.Util.Urls);
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local l_MigratePackagesOffOfWWWPart2_0 = game:GetFastFlag("MigratePackagesOffOfWWWPart2");
local _ = game:GetService("PackageUIService") or nil;
local v11 = game:GetService("PublishService") or nil;
local v12 = game:GetService("PackageUIService") or nil;
local l_StudioAssetService_0 = game:GetService("StudioAssetService");
local l_StudioService_0 = game:GetService("StudioService");
return function(v15, v16, v17, v18, v19, v20, v21, v22, v23) --[[ Line: 36 ]]
    -- upvalues: v4 (copy), v1 (copy), l_MigratePackagesOffOfWWWPart2_0 (copy), v6 (copy), v5 (copy), l_NewPackageAnalyticsWithRefactor2_0 (copy), l_sendResultToKibana_0 (copy), v3 (copy), l_StudioAssetService_0 (copy), l_StudioService_0 (copy), v11 (copy), v12 (copy)
    return function(v24) --[[ Line: 37 ]]
        -- upvalues: v4 (ref), v1 (ref), l_MigratePackagesOffOfWWWPart2_0 (ref), v6 (ref), v15 (copy), v16 (copy), v17 (ref), v18 (copy), v19 (copy), v20 (copy), v21 (copy), v5 (ref), l_NewPackageAnalyticsWithRefactor2_0 (ref), l_sendResultToKibana_0 (ref), v3 (ref), l_StudioAssetService_0 (ref), v22 (copy), l_StudioService_0 (ref), v11 (ref), v12 (ref), v23 (copy)
        v24:dispatch(v4(v1.SCREENS.UPLOADING_ASSET));
        local v25 = l_MigratePackagesOffOfWWWPart2_0 and "https://apis.roblox.com/assets/user-auth/v1/assets" or v6.constructPostUploadAssetUrl(v15, "Model", v16 or "", v17 or "", v18, v19, v20, v21);
        local function v29(v26, v27) --[[ Line: 53 ]] --[[ Name: onConvertToPackageResult ]]
            -- upvalues: v24 (copy), v5 (ref), l_NewPackageAnalyticsWithRefactor2_0 (ref), v25 (copy), l_sendResultToKibana_0 (ref), v3 (ref)
            v24:dispatch(v5(v26));
            if l_NewPackageAnalyticsWithRefactor2_0 then
                local v28 = {
                    url = v25, 
                    responseCode = v26 and 200 or -1, 
                    responseBody = v27
                };
                l_sendResultToKibana_0(v28);
            end;
            if v27 then
                v24:dispatch(v3(v27, "uploadRequest"));
            end;
        end;
        if l_MigratePackagesOffOfWWWPart2_0 then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 70 ]]
                -- upvalues: l_StudioAssetService_0 (ref), v22 (ref)
                return l_StudioAssetService_0:SerializeInstances(v22);
            end);
            if l_status_0 then
                local l_status_1, l_result_1 = pcall(function() --[[ Line: 75 ]]
                    -- upvalues: l_StudioService_0 (ref), v21 (ref), v17 (ref), v16 (ref), v11 (ref), l_result_0 (copy)
                    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
                    local l_User_0 = Enum.AssetCreatorType.User;
                    if v21 ~= nil and v21 > 0 then
                        l_l_StudioService_0_UserId_0 = v21;
                        l_User_0 = Enum.AssetCreatorType.Group;
                    end;
                    if v17 == nil or v17 == "" then
                        v17 = v16;
                    end;
                    return v11:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync(l_result_0, l_User_0, l_l_StudioService_0_UserId_0, "Model", 0, v16, v17, "", "model/x-rbxm", 0);
                end);
                if l_status_1 then
                    l_StudioAssetService_0:UpdatePublishedPackage(l_result_1, v22[1], true, true);
                    v29(true, "Successfully convert to package, assetid: " .. l_result_1.AssetId);
                    return;
                else
                    v29(false, "Publish failed during convert to package");
                    return;
                end;
            else
                v29(false, "Asset serialization failed during convert to package");
                return;
            end;
        else
            local v36 = nil;
            v36 = v12.OnConvertToPackageResult:Connect(function(v37, v38) --[[ Line: 116 ]]
                -- upvalues: v36 (ref), v29 (copy)
                v36:Disconnect();
                v29(v37, v38);
            end);
            v12:ConvertToPackageUpload(v25, v22, v23);
            return;
        end;
    end;
end;