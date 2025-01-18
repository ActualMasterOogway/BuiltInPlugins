local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Util_0 = l_Parent_0.Core.Util;
local _ = require(l_Util_0.AssetConfigConstants);
local _ = require(l_Util_0.PagedRequestCursor);
local v4 = require(l_Util_0.DebugFlags);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v6 = require(l_Actions_0.NetworkError);
local v7 = require(l_Actions_0.SetOverrideAssets);
local v8 = require(l_Actions_0.SetLoadingPage);
local v9 = require(l_Actions_0.UpdateOverrideAssetData);
local v10 = require(l_Actions_0.SetCurrentPage);
local v11 = require(l_Actions_0.SetOverrideCursor);
local _ = function(v12, v13) --[[ Line: 16 ]] --[[ Name: filterAssetByCreatorId ]]
    local v14 = {};
    for _, v16 in pairs(v12) do
        if v16.Creator.Id == v13 then
            table.insert(v14, v16);
        end;
    end;
    return v14;
end;
local function v23(v18) --[[ Line: 26 ]] --[[ Name: convertCreationsDetailsToResultsFormat ]]
    local v19 = {};
    if v18 then
        for _, v21 in pairs(v18) do
            local v22 = {
                Asset = {
                    Id = v21.id or v21.assetId, 
                    Name = v21.name or ""
                }
            };
            v19[#v19 + 1] = v22;
        end;
    end;
    return v19;
end;
local function _(v24) --[[ Line: 43 ]] --[[ Name: getNextCursor ]]
    local l_overrideCursor_0 = v24:getState().overrideCursor;
    local v26 = "";
    if l_overrideCursor_0.nextPageCursor then
        v26 = l_overrideCursor_0.nextPageCursor;
    end;
    return v26;
end;
return function(v28, v29, v30, v31, v32) --[[ Line: 54 ]]
    -- upvalues: v4 (copy), v8 (copy), v6 (copy), v23 (copy), v7 (copy), v11 (copy), v10 (copy), v9 (copy)
    return function(v33) --[[ Line: 55 ]]
        -- upvalues: v4 (ref), v32 (copy), v8 (ref), v6 (ref), v23 (ref), v7 (ref), v11 (ref), v10 (ref), v9 (ref), v30 (copy), v31 (copy), v28 (copy), v29 (copy)
        local v34 = v33:getState().loadingPage or 0;
        if v4.shouldDebugOverrideAssetLoading() then
            print(string.format("GetOverrideAssetRequest: curr=%s, loading=%s, target=%s", tostring(v33:getState().currentPage), tostring(v33:getState().loadingPage), (tostring(v32))));
        end;
        if v32 > 1 then
            if v33:getState().fetchedAll then
                if v4.shouldDebugOverrideAssetLoading() then
                    print("GetOverrideAssetRequest: fetchedAll, stopping");
                end;
                return;
            elseif v32 <= v34 then
                if v4.shouldDebugOverrideAssetLoading() then
                    print("GetOverrideAssetRequest: loadingPage >= targetPage, stopping");
                end;
                return;
            end;
        end;
        if v4.shouldDebugOverrideAssetLoading() then
            print("GetOverrideAssetRequest: continuing to run request");
        end;
        v33:dispatch(v8(v32));
        local function v36(v35) --[[ Line: 92 ]]
            -- upvalues: v33 (copy), v6 (ref), v8 (ref)
            v33:dispatch(v6(v35));
            v33:dispatch(v8(0));
        end;
        local function v43(v37) --[[ Line: 97 ]]
            -- upvalues: v4 (ref), v33 (copy), v32 (ref), v23 (ref), v7 (ref), v11 (ref), v10 (ref), v9 (ref), v8 (ref)
            if v4.shouldDebugOverrideAssetLoading() then
                print(string.format("handleGetCreationOverrideSuccess: curr=%s, loading=%s, target=%s", tostring(v33:getState().currentPage), tostring(v33:getState().loadingPage), (tostring(v32))));
            end;
            local l_responseBody_0 = v37.responseBody;
            local v39 = v23(l_responseBody_0.data);
            if v32 == 1 then
                v33:dispatch(v7(v39));
                v33:dispatch(v11({
                    nextPageCursor = l_responseBody_0.nextPageCursor
                }));
                v33:dispatch(v10(1));
            else
                local l_overrideCursor_1 = v33:getState().overrideCursor;
                local v41 = l_responseBody_0.nextPageCursor ~= nil;
                local v42 = not v41;
                if v41 then
                    l_overrideCursor_1 = {
                        nextPageCursor = l_responseBody_0.nextPageCursor
                    };
                end;
                v33:dispatch(v9(v39, v42));
                v33:dispatch(v11(l_overrideCursor_1));
                v33:dispatch(v10(v32));
            end;
            v33:dispatch(v8(0));
        end;
        local v44 = nil;
        if v30 == "Group" then
            v44 = v31;
        end;
        if v30 == "Group" then
            local l_overrideCursor_2 = v33:getState().overrideCursor;
            local v46 = "";
            if l_overrideCursor_2.nextPageCursor then
                v46 = l_overrideCursor_2.nextPageCursor;
            end;
            v28:getAssetGroupCreations(nil, v46, v29, v44):andThen(v43, v36);
            return;
        else
            local l_overrideCursor_3 = v33:getState().overrideCursor;
            local v48 = "";
            if l_overrideCursor_3.nextPageCursor then
                v48 = l_overrideCursor_3.nextPageCursor;
            end;
            return v28:getAssetCreations(nil, v48, v29):andThen(v43, v36);
        end;
    end;
end;