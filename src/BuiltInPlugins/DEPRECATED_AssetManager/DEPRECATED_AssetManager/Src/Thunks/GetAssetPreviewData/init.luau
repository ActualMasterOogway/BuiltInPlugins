local l_Parent_0 = script.Parent.Parent.Parent;
local l_Players_0 = game:GetService("Players");
local l_GroupService_0 = game:GetService("GroupService");
local v3 = require(l_Parent_0.Src.Thunks.GetRootTreeViewInstance);
local v4 = require(l_Parent_0.Src.Actions.SetAssetPreviewData);
local v5 = require(l_Parent_0.Src.Actions.SetAssetOwnerName);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
return function(v10, v11) --[[ Line: 18 ]]
    -- upvalues: v4 (copy), l_NewPackageAnalyticsWithRefactor2_0 (copy), l_sendResultToKibana_0 (copy), l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy), l_GroupService_0 (copy), v5 (copy), l_Players_0 (copy), v3 (copy)
    return function(v12) --[[ Line: 19 ]]
        -- upvalues: v11 (copy), v4 (ref), v10 (copy), l_NewPackageAnalyticsWithRefactor2_0 (ref), l_sendResultToKibana_0 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), l_GroupService_0 (ref), v5 (ref), l_Players_0 (ref), v3 (ref)
        local v13 = {};
        for _, v15 in ipairs(v11) do
            v13[v15] = true;
        end;
        v12:dispatch(v4(v13));
        v10.Develop.V1.Assets.assets(v11):makeRequest():andThen(function(v16) --[[ Line: 26 ]]
            -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), l_sendResultToKibana_0 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), l_GroupService_0 (ref), v12 (copy), v5 (ref), l_Players_0 (ref), v3 (ref), v4 (ref)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                l_sendResultToKibana_0(v16);
            end;
            local l_responseBody_0 = v16.responseBody;
            if not l_responseBody_0 or #l_responseBody_0.data == 0 then
                return;
            else
                local v18 = {};
                for _, v20 in ipairs(l_responseBody_0.data) do
                    local l_id_0 = v20.id;
                    local l_targetId_0 = v20.creator.targetId;
                    local l_name_0 = v20.name;
                    local l_typeId_0 = v20.typeId;
                    if l_typeId_0 == Enum.AssetType.Image.Value and string.find(v20.name, "Images/") then
                        l_name_0 = string.gsub(v20.name, "Images/", "");
                    elseif l_typeId_0 == Enum.AssetType.MeshPart.Value and string.find(v20.name, "Meshes/") then
                        l_name_0 = string.gsub(v20.name, "Meshes/", "");
                    elseif l_enableAudioImport_0() and l_typeId_0 == Enum.AssetType.Audio.Value and string.find(v20.name, "Audio/") then
                        l_name_0 = string.gsub(v20.name, "Audio/", "");
                    elseif l_enableVideoImport_0() and l_typeId_0 == Enum.AssetType.Video.Value and string.find(v20.name, "Video/") then
                        l_name_0 = string.gsub(v20.name, "Video/", "");
                    elseif l_typeId_0 == Enum.AssetType.Model.Value and string.find(v20.Name, "Models/") then
                        l_name_0 = string.gsub(v20.Name, "Models/", "");
                    end;
                    local l_created_0 = v20.created;
                    local l_updated_0 = v20.updated;
                    v18[l_id_0] = {
                        Asset = {
                            Id = v20.id, 
                            Type = v20.type, 
                            TypeId = l_typeId_0, 
                            Name = l_name_0, 
                            Description = v20.description, 
                            AssetGenres = v20.genres, 
                            Created = l_created_0, 
                            Updated = l_updated_0
                        }, 
                        Creator = {
                            Type = v20.creator.type, 
                            TypeId = v20.creator.typeId, 
                            TargetId = v20.creator.targetId, 
                            Name = ""
                        }
                    };
                    spawn(function() --[[ Line: 84 ]]
                        -- upvalues: v20 (copy), l_GroupService_0 (ref), l_targetId_0 (copy), v12 (ref), v5 (ref), l_id_0 (copy), l_Players_0 (ref)
                        if v20.creator.type == "Group" then
                            local l_Name_0 = l_GroupService_0:GetGroupInfoAsync(l_targetId_0).Name;
                            if l_Name_0 then
                                v12:dispatch(v5(l_id_0, l_Name_0));
                                return;
                            end;
                        elseif v20.creator.type == "User" then
                            local l_l_Players_0_NameFromUserIdAsync_0 = l_Players_0:GetNameFromUserIdAsync(l_targetId_0);
                            if l_l_Players_0_NameFromUserIdAsync_0 then
                                v12:dispatch(v5(l_id_0, l_l_Players_0_NameFromUserIdAsync_0));
                            end;
                        end;
                    end);
                    v12:dispatch(v3(l_id_0, v20.typeId));
                end;
                v12:dispatch(v4(v18));
                return v16;
            end;
        end, function(v29) --[[ Line: 104 ]]
            -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), l_sendResultToKibana_0 (ref)
            if l_NewPackageAnalyticsWithRefactor2_0 then
                l_sendResultToKibana_0(v29);
            end;
            error("Failed to load data for Asset Preview");
        end);
    end;
end;