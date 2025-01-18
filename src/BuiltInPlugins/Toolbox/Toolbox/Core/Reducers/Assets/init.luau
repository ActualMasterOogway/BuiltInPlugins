local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_Util_0.DebugFlags);
local v7 = require(l_Util_0.PagedRequestCursor);
local l_Math_0 = require(l_Packages_0.Framework).Util.Math;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v10 = require(l_Actions_0.ClearAssets);
local v11 = require(l_Parent_0.Core.Actions.SetAssetMediaIds);
local v12 = require(l_Actions_0.GetAssets);
local v13 = require(l_Actions_0.SetLoading);
local v14 = require(l_Actions_0.SetCachedCreatorInfo);
local v15 = require(l_Actions_0.SetAssetPreview);
local v16 = require(l_Actions_0.SetPreviewModel);
local v17 = require(l_Actions_0.ClearPreview);
local v18 = require(l_Actions_0.SetCanManageAsset);
local v19 = require(l_Actions_0.SetCodeSummaryForAsset);
local v20 = require(l_Actions_0.SetPluginData);
local v21 = require(l_Actions_0.SetMostRecentAssetInsertTime);
local v22 = require(l_Actions_0.GetAssetContentAttributionInfo);
local v23 = require(l_Parent_0.Core.Actions.UpdateAssetData);
local v24 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxCodeUnderstandingSummary);
local function v44(v25, v26, v27, v28) --[[ Line: 34 ]] --[[ Name: handleAssetsAddedToState ]]
    -- upvalues: v6 (copy), v2 (copy), l_Math_0 (copy), v5 (copy), v7 (copy)
    if not v26 then
        if v6.shouldDebugWarnings() then
            warn("Lua Toolbox: handleAssetsAddedToState() got assets = nil");
        end;
        return v25;
    else
        local v29 = {};
        local v30 = {};
        local v31 = {
            Voting = v2.None
        };
        for _, v33 in ipairs(v26) do
            local l_Id_0 = v33.Asset.Id;
            local v35 = #v30 + 1;
            if v29[l_Id_0] == nil then
                local v36 = v25.assetsReceived or 0;
                local v37 = v36 + v35;
                local v38 = l_Math_0.round(v36 / v5.TOOLBOX_ITEM_SEARCH_LIMIT, 0) + 1;
                local v39 = v33.Context or {};
                v33.Context = v2.Dictionary.join(v39, {
                    page = v38, 
                    pagePosition = v35, 
                    position = v37
                });
                v29[l_Id_0] = v2.Dictionary.join(v33, v31);
                v30[v35] = l_Id_0;
            end;
        end;
        local v40 = math.max(v25.totalAssets or 0, v27 or 0);
        local v41 = (v25.assetsReceived or 0) + #v30;
        local v42 = false;
        if v28 then
            v42 = not v7.isNextPageAvailable(v28);
        else
            local v43 = false;
            if v40 <= v41 then
                v43 = #v26 == 0;
            end;
            v42 = v25.hasReachedBottom or v43 or #v30 == 0 and v40 > 0;
        end;
        return v2.Dictionary.join(v25, {
            idToAssetMap = v2.Dictionary.join(v25.idToAssetMap or {}, v29), 
            idsToRender = v2.List.join(v25.idsToRender or {}, v30), 
            totalAssets = v40, 
            assetsReceived = v41, 
            hasReachedBottom = v42, 
            currentCursor = v28 or v7.createDefaultCursor()
        });
    end;
end;
return v3.createReducer({
    idToAssetMap = {}, 
    idsToRender = {}, 
    isLoading = true, 
    totalAssets = 0, 
    assetsReceived = 0, 
    hasReachedBottom = false, 
    currentCursor = v7.createDefaultCursor(), 
    previewModel = nil, 
    previewAssetId = nil, 
    previewSwimlaneName = nil, 
    isPreviewing = false, 
    mostRecentAssetInsertTime = 0, 
    manageableAssets = {}, 
    previewPluginData = nil, 
    creatingUniverseName = nil, 
    creatingUniverseRootPlaceId = nil, 
    codeSummaryMap = if v24() then {} else nil
}, {
    [v10.name] = function(v45, _) --[[ Line: 120 ]]
        -- upvalues: v2 (copy), v7 (copy)
        return v2.Dictionary.join(v45, {
            idsToRender = {}, 
            totalAssets = 0, 
            assetsReceived = 0, 
            hasReachedBottom = false, 
            currentCursor = v7.createDefaultCursor(), 
            manageableAssets = {}
        });
    end, 
    [v13.name] = function(v47, v48) --[[ Line: 131 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v47, {
            isLoading = v48.isLoading
        });
    end, 
    [v14.name] = function(v49, v50) --[[ Line: 137 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v49, {
            cachedCreatorInfo = v50.cachedCreatorInfo
        });
    end, 
    [v11.name] = function(v51, v52) --[[ Line: 143 ]]
        -- upvalues: v2 (copy)
        local v53 = if v51.idToAssetMap and v51.idToAssetMap[v52.assetId] then v51.idToAssetMap[v52.assetId].Asset else nil;
        if v53 == nil then
            return v51;
        else
            local v54 = v2.Dictionary.join(v53, {
                AssetMediaIds = v52.assetMediaIds
            });
            local v55 = v2.Dictionary.join(v51.idToAssetMap[v52.assetId], {
                Asset = v54
            });
            local v56 = {
                [v52.assetId] = v55
            };
            return v2.Dictionary.join(v51, {
                idToAssetMap = v2.Dictionary.join(v51.idToAssetMap, v56)
            });
        end;
    end, 
    [v12.name] = function(v57, v58) --[[ Line: 182 ]]
        -- upvalues: v44 (copy)
        return v44(v57, v58.assets, v58.totalResults, v58.cursor);
    end, 
    [v15.name] = function(v59, v60) --[[ Line: 186 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v59, {
            isPreviewing = v60.isPreviewing, 
            previewAssetId = v60.previewAssetId, 
            previewSwimlaneName = if v60.previewSwimlaneName then v60.previewSwimlaneName else v2.None
        });
    end, 
    [v16.name] = function(v61, v62) --[[ Line: 194 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v61, {
            previewModel = v62.previewModel
        });
    end, 
    [v17.name] = function(v63, _) --[[ Line: 200 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v63, {
            previewModel = v2.None, 
            previewPluginData = v2.None
        });
    end, 
    [v18.name] = function(v65, v66) --[[ Line: 207 ]]
        -- upvalues: v2 (copy)
        local l_canManage_0 = v66.canManage;
        local l_assetId_0 = v66.assetId;
        local v69 = v2.Dictionary.join(v65.manageableAssets, {
            [tostring(l_assetId_0)] = l_canManage_0
        });
        return v2.Dictionary.join(v65, {
            manageableAssets = v69
        });
    end, 
    [v20.name] = function(v70, v71) --[[ Line: 219 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v70, {
            previewPluginData = v71.pluginData
        });
    end, 
    [v21.name] = function(v72, v73) --[[ Line: 225 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v72, {
            mostRecentAssetInsertTime = v73.mostRecentAssetInsertTime
        });
    end, 
    [v22.name] = function(v74, v75) --[[ Line: 231 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v74, {
            creatingUniverseId = v75.creatingUniverseId, 
            creatingUniverseName = v75.creatingUniverseName, 
            creatingUniverseRootPlaceId = v75.creatingUniverseRootPlaceId
        });
    end, 
    [v19.name] = v24() and function(v76, v77) --[[ Line: 240 ]]
        -- upvalues: v2 (copy)
        return v2.Dictionary.join(v76, {
            codeSummaryMap = v2.Dictionary.join(v76, {
                [tostring(v77.assetId)] = v77.codeSummary
            })
        });
    end or nil, 
    [v23.name] = function(v78, v79) --[[ Line: 249 ]]
        -- upvalues: v2 (copy)
        if if v78.idToAssetMap and v78.idToAssetMap[v79.assetId] then v78.idToAssetMap[v79.assetId] else nil then
            return v2.Dictionary.join(v78, {
                idToAssetMap = v2.Dictionary.join(v78.idToAssetMap, {
                    [v79.assetId] = v79.assetData
                })
            });
        else
            return;
        end;
    end
});