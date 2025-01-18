local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Src.Actions.SetAssets);
local v3 = require(l_Parent_0.Src.Actions.SetAssetsModerationData);
local v4 = require(l_Parent_0.Src.Actions.SetIsFetchingAssets);
local _ = require(l_Parent_0.Src.Thunks.GetAssetResponse);
local _ = require(l_Parent_0.Src.Util.Screens);
local l_enableAudioImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableAudioImport;
local l_enableVideoImport_0 = require(l_Parent_0.Src.Util.AssetManagerUtilities).enableVideoImport;
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local l_game_FastInt_0 = game:GetFastInt("StudioAssetManagerAssetFetchNumber");
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local l_AssetManagerMigrateAliasesEndpoint2_0 = game:GetFastFlag("AssetManagerMigrateAliasesEndpoint2");
return function(v13, v14, v15, v16, v17) --[[ Line: 25 ]]
    -- upvalues: v4 (copy), l_game_FastInt_0 (copy), l_NewPackageAnalyticsWithRefactor2_0 (copy), l_sendResultToKibana_0 (copy), l_enableAudioImport_0 (copy), l_enableVideoImport_0 (copy), l_AssetManagerMigrateAliasesEndpoint2_0 (copy), v1 (copy), v2 (copy), v3 (copy)
    return function(v18) --[[ Line: 26 ]]
        -- upvalues: v17 (copy), v15 (copy), v16 (copy), v4 (ref), v14 (copy), v13 (copy), l_game_FastInt_0 (ref), l_NewPackageAnalyticsWithRefactor2_0 (ref), l_sendResultToKibana_0 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), l_AssetManagerMigrateAliasesEndpoint2_0 (ref), v1 (ref), v2 (ref), v3 (ref)
        local v19 = v18:getState();
        local v20 = nil;
        v20 = v17 == nil or v17;
        local v21 = nil;
        local v22 = {
            index = 0, 
            assets = {}, 
            assetsModerationData = {}
        };
        local v23 = {};
        local v24 = 1;
        if v15 or v16 and v16 ~= 1 then
            v22 = v19.AssetManagerReducer.assetsTable;
            v24 = v22.index + 1;
        end;
        if v20 then
            v18:dispatch(v4(true));
        end;
        if v14 == Enum.AssetType.Place then
            v21 = v13.Develop.V2.Universes.places(game.GameId, v15, l_game_FastInt_0):makeRequest():andThen(function(v25) --[[ Line: 55 ]]
                return v25;
            end, function() --[[ Line: 57 ]]
                -- upvalues: v18 (copy), v4 (ref)
                v18:dispatch(v4(false));
                error("Failed to load places");
            end);
        elseif v14 == Enum.AssetType.Package then
            v21 = v13.APIS.Packages.V1.packages(game.GameId, v15, l_game_FastInt_0):makeRequest():andThen(function(v26) --[[ Line: 65 ]]
                -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), l_sendResultToKibana_0 (ref)
                if l_NewPackageAnalyticsWithRefactor2_0 then
                    l_sendResultToKibana_0(v26);
                end;
                return v26;
            end, function(v27) --[[ Line: 70 ]]
                -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), l_sendResultToKibana_0 (ref), v18 (copy), v4 (ref)
                if l_NewPackageAnalyticsWithRefactor2_0 then
                    l_sendResultToKibana_0(v27);
                end;
                v18:dispatch(v4(false));
                error("Failed to load packages");
            end);
        elseif v14 == Enum.AssetType.Image or v14 == Enum.AssetType.MeshPart or l_enableAudioImport_0() and v14 == Enum.AssetType.Audio or l_enableVideoImport_0() and v14 == Enum.AssetType.Video or v14 == Enum.AssetType.Model then
            if l_AssetManagerMigrateAliasesEndpoint2_0 then
                v13.APIS.ContentAliasesApi.aliases(game.GameId, l_game_FastInt_0, v15):makeRequest():andThen(function(v28) --[[ Line: 88 ]]
                    -- upvalues: v22 (ref), v14 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), v24 (ref), v1 (ref), v23 (copy), v18 (copy), v4 (ref), v2 (ref), v21 (ref), v13 (ref), v3 (ref)
                    local l_responseBody_0 = v28.responseBody;
                    if not l_responseBody_0 then
                        return;
                    else
                        v22.nextPageCursor = l_responseBody_0.NextPageToken;
                        for _, v31 in pairs(l_responseBody_0.Aliases) do
                            if v14 == Enum.AssetType.Image and string.find(v31.Name, "Images/") or v14 == Enum.AssetType.MeshPart and string.find(v31.Name, "Meshes/") or l_enableAudioImport_0() and v14 == Enum.AssetType.Audio and string.find(v31.Name, "Audio/") or l_enableVideoImport_0() and v14 == Enum.AssetType.Video and string.find(v31.Name, "Video/") or v14 == Enum.AssetType.Model and string.find(v31.Name, "Models/") then
                                local v32 = {};
                                local v33 = tostring(v31.TargetId);
                                v32.assetType = v14;
                                v32.asset = v31.Asset;
                                v32.id = v31.TargetId;
                                if v14 == Enum.AssetType.Image and string.find(v31.Name, "Images/") then
                                    v32.name = string.gsub(v31.Name, "Images/", "");
                                elseif v14 == Enum.AssetType.MeshPart and string.find(v31.Name, "Meshes/") then
                                    v32.name = string.gsub(v31.Name, "Meshes/", "");
                                elseif l_enableAudioImport_0() and v14 == Enum.AssetType.Audio and string.find(v31.Name, "Audio/") then
                                    v32.name = string.gsub(v31.Name, "Audio/", "");
                                elseif l_enableVideoImport_0() and v14 == Enum.AssetType.Video and string.find(v31.Name, "Video/") then
                                    v32.name = string.gsub(v31.Name, "Video/", "");
                                elseif v14 == Enum.AssetType.Model and string.find(v31.Name, "Models/") then
                                    v32.name = string.gsub(v31.Name, "Models/", "");
                                end;
                                v32.layoutOrder = v24;
                                v22.assets = v1.Dictionary.join(v22.assets, {
                                    [v33] = v32
                                });
                                v24 = v24 + 1;
                                table.insert(v23, v32.id);
                            end;
                        end;
                        v18:dispatch(v4(false));
                        v18:dispatch(v2(v22, v24));
                        v21 = v13.Develop.V1.Assets.assets(v23):makeRequest():andThen(function(v34) --[[ Line: 148 ]]
                            -- upvalues: v22 (ref), v1 (ref), v18 (ref), v3 (ref)
                            local l_responseBody_1 = v34.responseBody;
                            if not l_responseBody_1 then
                                return;
                            else
                                for _, v37 in pairs(l_responseBody_1.data) do
                                    assetModerationData = {
                                        reviewStatus = v37.reviewStatus, 
                                        isModerated = v37.isModerated, 
                                        moderationStatus = v37.moderationStatus
                                    };
                                    v22.assetsModerationData = v1.Dictionary.join(v22.assetsModerationData, {
                                        [v37.id] = assetModerationData
                                    });
                                end;
                                v18:dispatch(v3(v22.assetsModerationData));
                                return;
                            end;
                        end, function() --[[ Line: 165 ]]
                            error("Failed to load asset information");
                        end);
                        return;
                    end;
                end, function() --[[ Line: 168 ]]
                    -- upvalues: v18 (copy), v4 (ref)
                    v18:dispatch(v4(false));
                    error("Failed to load aliases");
                end);
            else
                local v38 = nil;
                v38 = not v16 and 1 or v16;
                do
                    local l_v38_0 = v38;
                    v13.API.Universes.getAliases(game.GameId, l_v38_0):makeRequest():andThen(function(v40) --[[ Line: 180 ]]
                        -- upvalues: v22 (ref), l_v38_0 (ref), v14 (ref), l_enableAudioImport_0 (ref), l_enableVideoImport_0 (ref), v24 (ref), v1 (ref), v23 (copy), v18 (copy), v4 (ref), v2 (ref), v21 (ref), v13 (ref), v3 (ref)
                        local l_responseBody_2 = v40.responseBody;
                        if not l_responseBody_2 then
                            return;
                        else
                            if not l_responseBody_2.FinalPage then
                                v22.pageNumber = l_v38_0 + 1;
                            else
                                v22.pageNumber = nil;
                            end;
                            for _, v43 in pairs(l_responseBody_2.Aliases) do
                                if v14 == Enum.AssetType.Image and string.find(v43.Name, "Images/") or v14 == Enum.AssetType.MeshPart and string.find(v43.Name, "Meshes/") or l_enableAudioImport_0() and v14 == Enum.AssetType.Audio and string.find(v43.Name, "Audio/") or l_enableVideoImport_0() and v14 == Enum.AssetType.Video and string.find(v43.Name, "Video/") or v14 == Enum.AssetType.Model and string.find(v43.Name, "Models/") then
                                    local v44 = {};
                                    local v45 = tostring(v43.TargetId);
                                    v44.assetType = v14;
                                    v44.asset = v43.Asset;
                                    v44.id = v43.TargetId;
                                    if v14 == Enum.AssetType.Image and string.find(v43.Name, "Images/") then
                                        v44.name = string.gsub(v43.Name, "Images/", "");
                                    elseif v14 == Enum.AssetType.MeshPart and string.find(v43.Name, "Meshes/") then
                                        v44.name = string.gsub(v43.Name, "Meshes/", "");
                                    elseif l_enableAudioImport_0() and v14 == Enum.AssetType.Audio and string.find(v43.Name, "Audio/") then
                                        v44.name = string.gsub(v43.Name, "Audio/", "");
                                    elseif l_enableVideoImport_0() and v14 == Enum.AssetType.Video and string.find(v43.Name, "Video/") then
                                        v44.name = string.gsub(v43.Name, "Video/", "");
                                    elseif v14 == Enum.AssetType.Model and string.find(v43.Name, "Models/") then
                                        v44.name = string.gsub(v43.Name, "Models/", "");
                                    end;
                                    v44.layoutOrder = v24;
                                    v22.assets = v1.Dictionary.join(v22.assets, {
                                        [v45] = v44
                                    });
                                    v24 = v24 + 1;
                                    table.insert(v23, v44.id);
                                end;
                            end;
                            v18:dispatch(v4(false));
                            v18:dispatch(v2(v22, v24));
                            v21 = v13.Develop.V1.Assets.assets(v23):makeRequest():andThen(function(v46) --[[ Line: 241 ]]
                                -- upvalues: v22 (ref), v1 (ref), v18 (ref), v3 (ref)
                                local l_responseBody_3 = v46.responseBody;
                                for _, v49 in pairs(l_responseBody_3.data) do
                                    assetModerationData = {
                                        reviewStatus = v49.reviewStatus, 
                                        isModerated = v49.isModerated, 
                                        moderationStatus = v49.moderationStatus
                                    };
                                    v22.assetsModerationData = v1.Dictionary.join(v22.assetsModerationData, {
                                        [v49.id] = assetModerationData
                                    });
                                end;
                                v18:dispatch(v3(v22.assetsModerationData));
                            end, function() --[[ Line: 254 ]]
                                error("Failed to load asset information");
                            end);
                            return;
                        end;
                    end, function() --[[ Line: 257 ]]
                        -- upvalues: v18 (copy), v4 (ref)
                        v18:dispatch(v4(false));
                        error("Failed to load aliases");
                    end);
                end;
            end;
        end;
        if v14 == Enum.AssetType.Place or v14 == Enum.AssetType.Package then
            v21:andThen(function(v50) --[[ Line: 264 ]]
                -- upvalues: l_NewPackageAnalyticsWithRefactor2_0 (ref), l_sendResultToKibana_0 (ref), v22 (ref), v14 (ref), v24 (ref), v1 (ref), v23 (copy), v18 (copy), v4 (ref), v2 (ref), v21 (ref), v13 (ref), v3 (ref)
                if l_NewPackageAnalyticsWithRefactor2_0 then
                    l_sendResultToKibana_0(v50);
                end;
                local l_responseBody_4 = v50.responseBody;
                if not l_responseBody_4 then
                    return;
                else
                    v22.previousPageCursor = l_responseBody_4.previousPageCursor;
                    v22.nextPageCursor = l_responseBody_4.nextPageCursor;
                    for _, v53 in pairs(l_responseBody_4.data) do
                        v53.assetType = v14;
                        local v54 = tostring(v53.id);
                        v53.layoutOrder = v24;
                        v22.assets = v1.Dictionary.join(v22.assets, {
                            [v54] = v53
                        });
                        v24 = v24 + 1;
                        table.insert(v23, v53.id);
                    end;
                    v18:dispatch(v4(false));
                    v18:dispatch(v2(v22, v24));
                    v21 = v13.Develop.V1.Assets.assets(v23):makeRequest():andThen(function(v55) --[[ Line: 290 ]]
                        -- upvalues: v22 (ref), v1 (ref), v18 (ref), v3 (ref)
                        local l_responseBody_5 = v55.responseBody;
                        for _, v58 in pairs(l_responseBody_5.data) do
                            assetModerationData = {
                                reviewStatus = v58.reviewStatus, 
                                isModerated = v58.isModerated, 
                                moderationStatus = v58.moderationStatus
                            };
                            v22.assetsModerationData = v1.Dictionary.join(v22.assetsModerationData, {
                                [v58.id] = assetModerationData
                            });
                        end;
                        v18:dispatch(v3(v22.assetsModerationData));
                    end, function() --[[ Line: 303 ]]
                        error("Failed to load asset information");
                    end);
                    return;
                end;
            end);
        end;
    end;
end;