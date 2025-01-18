local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local v5 = require(l_Parent_0.Src.Actions.SetAssets);
local v6 = require(l_Parent_0.Src.Actions.SetIsFetchingAssets);
local l_game_FastInt_0 = game:GetFastInt("StudioAssetManagerAssetFetchNumber");
local l_AssetManagerMigrateAliasesEndpoint2_0 = game:GetFastFlag("AssetManagerMigrateAliasesEndpoint2");
local function v30(v9, v10, _) --[[ Line: 19 ]] --[[ Name: GetAliases ]]
    -- upvalues: l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy), l_game_FastInt_0 (copy), v1 (copy), l_AssetManagerMigrateAliasesEndpoint2_0 (copy)
    local v12 = {
        assets = {}
    };
    local v13 = 1;
    local function v14(v15) --[[ Line: 24 ]] --[[ Name: request ]]
        -- upvalues: v10 (copy), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), v9 (copy), l_game_FastInt_0 (ref), v13 (ref), v12 (copy), v1 (ref), v14 (copy)
        if v10 == Enum.AssetType.Image or v10 == Enum.AssetType.MeshPart or l_enableAudioImport_0() and v10 == Enum.AssetType.Audio or l_enableVideoImport_0() and v10 == Enum.AssetType.Video or v10 == Enum.AssetType.Model then
            return v9.APIS.ContentAliasesApi.aliases(game.GameId, l_game_FastInt_0, v15):makeRequest():andThen(function(v16) --[[ Line: 35 ]]
                -- upvalues: v10 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), v13 (ref), v12 (ref), v1 (ref), v14 (ref)
                local l_responseBody_0 = v16.responseBody;
                if not l_responseBody_0 then
                    return;
                else
                    for _, v19 in pairs(l_responseBody_0.Aliases) do
                        if v10 == Enum.AssetType.Image and string.find(v19.Name, "Images/") or v10 == Enum.AssetType.MeshPart and string.find(v19.Name, "Meshes/") or l_enableAudioImport_0() and v10 == Enum.AssetType.Audio and string.find(v19.Name, "Audio/") or l_enableVideoImport_0() and v10 == Enum.AssetType.Video and string.find(v19.Name, "Video/") or v10 == Enum.AssetType.Model and string.find(v19.Name, "Models/") then
                            local v20 = {};
                            local v21 = tostring(v19.TargetId);
                            v20.assetType = v10;
                            v20.asset = v19.Asset;
                            v20.id = v19.TargetId;
                            if v10 == Enum.AssetType.Image and string.find(v19.Name, "Images/") then
                                v20.name = string.gsub(v19.Name, "Images/", "");
                            elseif v10 == Enum.AssetType.MeshPart and string.find(v19.Name, "Meshes/") then
                                v20.name = string.gsub(v19.Name, "Meshes/", "");
                            elseif l_enableAudioImport_0() and v10 == Enum.AssetType.Audio and string.find(v19.Name, "Audio/") then
                                v20.name = string.gsub(v19.Name, "Audio/", "");
                            elseif l_enableVideoImport_0() and v10 == Enum.AssetType.Video and string.find(v19.Name, "Video/") then
                                v20.name = string.gsub(v19.Name, "Video/", "");
                            elseif v10 == Enum.AssetType.Model and string.find(v19.Name, "Models/") then
                                v20.name = string.gsub(v19.Name, "Models/", "");
                            end;
                            v20.layoutOrder = v13;
                            v12.assets = v1.Dictionary.join(v12.assets, {
                                [v21] = v20
                            });
                            v13 = v13 + 1;
                        end;
                    end;
                    if l_responseBody_0.NextPageToken then
                        return v14(l_responseBody_0.NextPageToken);
                    else
                        return v12, v13;
                    end;
                end;
            end);
        else
            return;
        end;
    end;
    local function v22(v23) --[[ Line: 96 ]] --[[ Name: DEPRECATED_request ]]
        -- upvalues: v10 (copy), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), v9 (copy), v13 (ref), v12 (copy), v1 (ref), v22 (copy)
        if v10 == Enum.AssetType.Image or v10 == Enum.AssetType.MeshPart or l_enableAudioImport_0() and v10 == Enum.AssetType.Audio or l_enableVideoImport_0() and v10 == Enum.AssetType.Video or v10 == Enum.AssetType.Model then
            return v9.API.Universes.getAliases(game.GameId, v23):makeRequest():andThen(function(v24) --[[ Line: 104 ]]
                -- upvalues: v10 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), v13 (ref), v12 (ref), v1 (ref), v22 (ref), v23 (copy)
                local l_responseBody_1 = v24.responseBody;
                if not l_responseBody_1 then
                    return;
                else
                    for _, v27 in pairs(l_responseBody_1.Aliases) do
                        if v10 == Enum.AssetType.Image and string.find(v27.Name, "Images/") or v10 == Enum.AssetType.MeshPart and string.find(v27.Name, "Meshes/") or l_enableAudioImport_0() and v10 == Enum.AssetType.Audio and string.find(v27.Name, "Audio/") or l_enableVideoImport_0() and v10 == Enum.AssetType.Video and string.find(v27.Name, "Video/") or v10 == Enum.AssetType.Model and string.find(v27.Name, "Models/") then
                            local v28 = {};
                            local v29 = tostring(v27.TargetId);
                            v28.assetType = v10;
                            v28.asset = v27.Asset;
                            v28.id = v27.TargetId;
                            if v10 == Enum.AssetType.Image and string.find(v27.Name, "Images/") then
                                v28.name = string.gsub(v27.Name, "Images/", "");
                            elseif v10 == Enum.AssetType.MeshPart and string.find(v27.Name, "Meshes/") then
                                v28.name = string.gsub(v27.Name, "Meshes/", "");
                            elseif l_enableAudioImport_0() and v10 == Enum.AssetType.Audio and string.find(v27.Name, "Audio/") then
                                v28.name = string.gsub(v27.Name, "Audio/", "");
                            elseif l_enableVideoImport_0() and v10 == Enum.AssetType.Video and string.find(v27.Name, "Video/") then
                                v28.name = string.gsub(v27.Name, "Video/", "");
                            elseif v10 == Enum.AssetType.Model and string.find(v27.Name, "Models/") then
                                v28.name = string.gsub(v27.Name, "Models/", "");
                            end;
                            v28.layoutOrder = v13;
                            v12.assets = v1.Dictionary.join(v12.assets, {
                                [v29] = v28
                            });
                            v13 = v13 + 1;
                        end;
                    end;
                    if not l_responseBody_1.FinalPage then
                        return v22(v23 + 1);
                    else
                        return v12, v13;
                    end;
                end;
            end);
        else
            return;
        end;
    end;
    if l_AssetManagerMigrateAliasesEndpoint2_0 then
        return v14();
    else
        return v22(1);
    end;
end;
return function(v31, v32) --[[ Line: 171 ]]
    -- upvalues: v6 (copy), l_Promise_0 (copy), v30 (copy), v5 (copy)
    return function(v33) --[[ Line: 172 ]]
        -- upvalues: v6 (ref), l_Promise_0 (ref), v30 (ref), v31 (copy), v32 (copy), v5 (ref)
        local v34 = v33:getState();
        v33:dispatch(v6(true));
        return l_Promise_0.resolve(v30(v31, v32, v34)):andThen(function(v35, v36, _) --[[ Line: 177 ]]
            -- upvalues: v33 (copy), v6 (ref), v5 (ref)
            v33:dispatch(v6(false));
            v33:dispatch(v5(v35, v36));
        end, function() --[[ Line: 180 ]]
            -- upvalues: v33 (copy), v6 (ref)
            v33:dispatch(v6(false));
            error("Failed to load aliases");
        end);
    end;
end;