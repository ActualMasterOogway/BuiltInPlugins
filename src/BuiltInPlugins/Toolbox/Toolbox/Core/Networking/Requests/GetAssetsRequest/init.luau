local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.GetAssets);
local v3 = require(l_Actions_0.NetworkError);
local v4 = require(l_Actions_0.SetLoading);
local v5 = require(l_Actions_0.SetCachedCreatorInfo);
local v6 = require(l_Actions_0.SetCurrentPage);
local v7 = require(l_Parent_0.Core.Types.Category);
local l_Util_0 = l_Parent_0.Core.Util;
local v9 = require(l_Util_0.CreatorInfoHelper);
local v10 = require(l_Util_0.PageInfoHelper);
local v11 = require(l_Util_0.PagedRequestCursor);
local v12 = require(l_Util_0.DebugFlags);
local v13 = require(l_Parent_0.Core.Models.AssetInfo);
local v14 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixGroupCreatedAvatarAssetRequest);
local function v19(v15) --[[ Line: 23 ]] --[[ Name: extractAssetIdsFromGetGroupAssetsResponse ]]
    -- upvalues: v14 (copy)
    local v16 = {};
    if v15 then
        for _, v18 in pairs(v15) do
            if v14() then
                table.insert(v16, v18.id or v18.assetId);
            else
                v16[#v16 + 1] = v18.id;
            end;
        end;
    end;
    return v16;
end;
local function v24(v20) --[[ Line: 37 ]] --[[ Name: extractAssetIdsFromGetAssetsResponse ]]
    local v21 = {};
    if v20 then
        for _, v23 in pairs(v20) do
            v21[#v21 + 1] = v23.id or v23.assetId;
        end;
    end;
    return v21;
end;
local function v30(v25) --[[ Line: 48 ]] --[[ Name: convertItemDetailsToResultsFormat ]]
    -- upvalues: v13 (copy)
    local v26 = {};
    if v25 then
        for _, v28 in pairs(v25) do
            local v29 = nil;
            v29 = v13.fromItemDetailsRequest(v28);
            v26[#v26 + 1] = v29;
        end;
    end;
    return v26;
end;
local function v39(v31, v32, v33, v34) --[[ Line: 61 ]] --[[ Name: convertCreationsDetailsToResultsFormat ]]
    -- upvalues: v13 (copy)
    local v35 = {};
    if v31 then
        for _, v37 in pairs(v31) do
            local v38 = nil;
            v38 = v13.fromCreationsDetails(v37, v32, v33, v34);
            v35[#v35 + 1] = v38;
        end;
    end;
    return v35;
end;
local function _(v40) --[[ Line: 74 ]] --[[ Name: extractCreatorInfo ]]
    -- upvalues: v9 (copy)
    if v40 and #v40 > 0 then
        local v41 = v40[1];
        return v41.Creator.Id, v41.Creator.Name, v9.backendToClient(v41.Creator.Type);
    else
        return;
    end;
end;
local function _(v43, v44, v45, v46) --[[ Line: 83 ]] --[[ Name: dispatchCreatorInfo ]]
    -- upvalues: v5 (copy)
    v43:dispatch(v5({
        Id = v44, 
        Name = v45, 
        Type = v46
    }));
end;
local function v53(v48, v49, v50, v51) --[[ Line: 87 ]] --[[ Name: dispatchGetAssetsForToolboxItemDetails ]]
    -- upvalues: v10 (copy), v30 (copy), v2 (copy), v6 (copy), v4 (copy)
    if v10.isPageInfoStale(v49, v48) then
        return;
    else
        local v52 = v30(v50);
        v48:dispatch(v2(v52, nil, v51));
        v48:dispatch(v6(0));
        v48:dispatch(v4(false));
        return;
    end;
end;
local function v62(v54, v55, v56, v57, v58, v59) --[[ Line: 98 ]] --[[ Name: dispatchGetAssets ]]
    -- upvalues: v10 (copy), v39 (copy), v2 (copy), v6 (copy), v4 (copy)
    if v10.isPageInfoStale(v55, v54) then
        return;
    else
        local v60 = v10.getEngineAssetTypeForPageInfoCategory(v55);
        local v61 = v39(v56, v60, v57, v59);
        v54:dispatch(v2(v61, nil, v58));
        v54:dispatch(v6(0));
        v54:dispatch(v4(false));
        return;
    end;
end;
local function v66(v63, v64, v65) --[[ Line: 111 ]] --[[ Name: dispatchGetAssetsWarning ]]
    -- upvalues: v12 (copy), v2 (copy), v4 (copy)
    if v12.shouldDebugWarnings() and v64 then
        warn(v64);
    end;
    v63:dispatch(v2({}, nil, v65));
    v63:dispatch(v4(false));
end;
return function(v67, v68) --[[ Line: 119 ]]
    -- upvalues: v4 (copy), v7 (copy), v14 (copy), v10 (copy), v3 (copy), v9 (copy), v5 (copy), v2 (copy), v6 (copy), v19 (copy), v24 (copy), v11 (copy), v53 (copy), v66 (copy), v62 (copy)
    return function(v69) --[[ Line: 120 ]]
        -- upvalues: v4 (ref), v68 (copy), v7 (ref), v14 (ref), v10 (ref), v3 (ref), v9 (ref), v5 (ref), v2 (ref), v6 (ref), v67 (copy), v19 (ref), v24 (ref), v11 (ref), v53 (ref), v66 (ref), v62 (ref)
        v69:dispatch(v4(true));
        local v70 = v68.creator and v68.creator.Id == -1;
        local v71 = v7.getTabForCategoryName(v68.categoryName) == v7.CREATIONS;
        local v72 = v7.categoryIsGroupAsset(v68.categoryName) and (not v7.categoryIsAvatarAssetByCategoryName(v68.categoryName) or v14());
        local function v74(v73) --[[ Line: 130 ]]
            -- upvalues: v10 (ref), v68 (ref), v69 (copy), v3 (ref), v4 (ref)
            if v10.isPageInfoStale(v68, v69) then
                return;
            else
                v69:dispatch(v3(v73));
                v69:dispatch(v4(false));
                return;
            end;
        end;
        local function v86(v75) --[[ Line: 138 ]]
            -- upvalues: v69 (copy), v68 (ref), v10 (ref), v9 (ref), v5 (ref), v2 (ref), v6 (ref), v4 (ref)
            local l_responseBody_0 = v75.responseBody;
            local l_pageInfo_0 = v69:getState().pageInfo;
            local _ = v68.categoryName;
            local _ = l_pageInfo_0.categoryName;
            if not v10.isPageInfoStale(v68, v69) then
                if l_responseBody_0 then
                    local l_v69_0 = v69;
                    local l_Results_0 = l_responseBody_0.Results;
                    local v82, v83, v84;
                    if l_Results_0 and #l_Results_0 > 0 then
                        local v85 = l_Results_0[1];
                        v82 = v85.Creator.Id;
                        v83 = v85.Creator.Name;
                        v84 = v9.backendToClient(v85.Creator.Type);
                    else
                        v82 = nil;
                        v83 = nil;
                        v84 = nil;
                    end;
                    l_v69_0:dispatch(v5({
                        Id = v82, 
                        Name = v83, 
                        Type = v84
                    }));
                    l_v69_0 = l_responseBody_0.Results or {};
                    v69:dispatch(v2(l_v69_0, l_responseBody_0.TotalResults));
                    v69:dispatch(v6(v68.targetPage));
                end;
                v69:dispatch(v4(false));
            end;
        end;
        local function v89(v87) --[[ Line: 160 ]]
            -- upvalues: v67 (ref), v68 (ref), v19 (ref)
            return v67:getAssetGroupCreations(v68, v87):andThen(function(v88) --[[ Line: 163 ]]
                -- upvalues: v19 (ref)
                return v19(v88.responseBody and v88.responseBody.data), v88;
            end);
        end;
        local function v92(v90) --[[ Line: 171 ]]
            -- upvalues: v67 (ref), v68 (ref), v24 (ref)
            return v67:getAssetCreations(v68, v90):andThen(function(v91) --[[ Line: 172 ]]
                -- upvalues: v24 (ref)
                return v24(v91.responseBody and v91.responseBody.data), v91;
            end);
        end;
        if v70 then
            local v93 = {
                Results = {}, 
                TotalResults = 0
            };
            v69:dispatch(v2(v93.Results, v93.TotalResults));
            v69:dispatch(v6(0));
            v69:dispatch(v4(false));
            return;
        elseif v71 then
            local l_currentCursor_0 = v69:getState().assets.currentCursor;
            if v11.isNextPageAvailable(l_currentCursor_0) then
                local v95 = if v72 then v89 else v92;
                local v96 = if v7.getCategoryByName(v68.categoryName) then v7.getCategoryByName(v68.categoryName).assetType else nil;
                local v97 = false;
                if v96 ~= v7.AssetType.ANIMATION then
                    v97 = v7.ToolboxMarketplaceAssetTypes[v96] ~= nil;
                end;
                return v95(v11.getNextPageCursor(l_currentCursor_0)):andThen(function(v98, v99) --[[ Line: 201 ]]
                    -- upvalues: v11 (ref), v97 (copy), v67 (ref), v53 (ref), v69 (copy), v68 (ref), v66 (ref), v74 (copy), v9 (ref), v5 (ref), v62 (ref)
                    local v100 = v11.createCursor(v99.responseBody);
                    if v98 and #v98 > 0 then
                        if v97 then
                            v67:getItemDetailsAssetIds(v98):andThen(function(v101) --[[ Line: 205 ]]
                                -- upvalues: v53 (ref), v69 (ref), v68 (ref), v100 (copy), v66 (ref)
                                local l_data_0 = v101.responseBody.data;
                                if l_data_0 and #l_data_0 > 0 then
                                    v53(v69, v68, l_data_0, v100);
                                    return;
                                else
                                    v66(v69, "getItemDetailsAssetIds() did not return any asset details", v100);
                                    return;
                                end;
                            end, v74);
                            return;
                        else
                            v67:getAssetCreationDetails(v98):andThen(function(v103) --[[ Line: 225 ]]
                                -- upvalues: v9 (ref), v69 (ref), v67 (ref), v5 (ref), v62 (ref), v68 (ref), v100 (copy), v74 (ref), v66 (ref)
                                local l_responseBody_1 = v103.responseBody;
                                if l_responseBody_1 and #l_responseBody_1 > 0 then
                                    local v105 = false;
                                    local l_creatorTargetId_0 = l_responseBody_1[1].creatorTargetId;
                                    local v107 = v9.getCreatorTypeValueFromName(l_responseBody_1[1].creatorType);
                                    v105 = not v9.isCached(v69, l_creatorTargetId_0, v107);
                                    if v105 then
                                        v67:getCreatorInfo(l_creatorTargetId_0, v107):andThen(function(v108) --[[ Line: 240 ]]
                                            -- upvalues: v9 (ref), v107 (copy), v69 (ref), l_creatorTargetId_0 (copy), v5 (ref), v62 (ref), v68 (ref), l_responseBody_1 (copy), v100 (ref)
                                            local v109 = v9.getNameFromResult(v108, v107);
                                            local l_v69_1 = v69;
                                            local l_l_creatorTargetId_0_0 = l_creatorTargetId_0;
                                            local l_v107_0 = v107;
                                            l_v69_1:dispatch(v5({
                                                Id = l_l_creatorTargetId_0_0, 
                                                Name = v109, 
                                                Type = l_v107_0
                                            }));
                                            v62(v69, v68, l_responseBody_1, v109, v100, v107);
                                        end, v74);
                                    end;
                                    if not v105 then
                                        local l_Name_0 = v69:getState().assets.cachedCreatorInfo.Name;
                                        v62(v69, v68, l_responseBody_1, l_Name_0, v100, v107);
                                        return;
                                    end;
                                else
                                    v66(v69, "getAssetCreationDetails() did not return any asset details", v100);
                                end;
                            end, v74);
                            return;
                        end;
                    else
                        v66(v69, nil, v100);
                        return;
                    end;
                end, v74);
            else
                return;
            end;
        else
            local v114 = false;
            local v115 = v7.categoryIsAudio(v68.categoryName);
            local v116 = v7.categoryIsVideo(v68.categoryName);
            if v10.isDeveloperCategory(v68) or v10.isPackagesCategory(v68) or v115 or v116 then
                v114 = true;
            end;
            if v114 then
                return v67:getDevelopAsset(v68):andThen(v86, v74);
            else
                return v67:getAssets(v68):andThen(v86, v74);
            end;
        end;
    end;
end;