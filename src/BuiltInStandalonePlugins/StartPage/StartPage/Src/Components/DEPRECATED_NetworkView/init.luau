local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageQuickLoad)();
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useContext_0 = v2.useContext;
local l_useState_0 = v2.useState;
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
local l_memo_0 = v2.memo;
local l_join_0 = require(l_script_FirstAncestor_0.Src.Util.TypedDash).join;
local v9 = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_LuaStartPageFixFailingNetworkRequests_0 = game:GetFastFlag("LuaStartPageFixFailingNetworkRequests");
local v12 = require(l_script_FirstAncestor_0.Src.Util.TempUrls);
local function v17(v13, v14) --[[ Line: 88 ]] --[[ Name: generateUniqueKeyFromQuery ]]
    if not v13 or not v14 then
        return "";
    else
        assert(v13, "Luau: Ensure this is defined");
        assert(v14, "Luau: Ensure this is defined");
        local v15 = v13 .. "?";
        local v16 = {};
        if v14.search then
            table.insert(v16, "search=" .. v14.search);
        end;
        if v14.creatorType then
            table.insert(v16, "creatorType=" .. v14.creatorType);
        end;
        if v14.creatorTargetId then
            table.insert(v16, "creatorTargetId=" .. tostring(v14.creatorTargetId));
        end;
        if v14.isPublic then
            table.insert(v16, "isPublic=true");
        end;
        if v14.isArchived then
            table.insert(v16, "isArchived=true");
        end;
        if v14.sortParam then
            table.insert(v16, "sortParam=" .. v14.sortParam);
        end;
        if v14.sortOrder then
            table.insert(v16, "sortOrder=" .. v14.sortOrder);
        end;
        return v15 .. table.concat(v16, "&");
    end;
end;
NetworkView = function(v18) --[[ Line: 122 ]] --[[ Name: NetworkView ]]
    -- upvalues: v9 (copy), l_useState_0 (copy), v1 (copy), l_useRef_0 (copy), v17 (copy), l_useContext_0 (copy), v12 (copy), l_join_0 (copy), l_useEffect_0 (copy), l_LuaStartPageFixFailingNetworkRequests_0 (copy), v2 (copy)
    local v19 = v9:use();
    local v20, v21 = l_useState_0({});
    local v22 = nil;
    local v23 = nil;
    if v1 then
        v22 = l_useRef_0(false);
    else
        local v24, v25 = l_useState_0(false);
        v22 = v24;
        v23 = v25;
    end;
    local v26 = l_useRef_0(nil);
    local l_searchKey_0 = v18.Query.searchKey;
    local v28 = v17(l_searchKey_0, v18.Query);
    local l_pageSize_0 = v18.Query.pageSize;
    local v30 = v20[v28];
    assert(l_pageSize_0, "Should have a page size in the query");
    local v31 = l_useContext_0(v12);
    local function v39(v32, v33) --[[ Line: 146 ]] --[[ Name: onLoadRange ]]
        -- upvalues: v26 (copy), v30 (copy), l_pageSize_0 (copy), l_join_0 (ref), v18 (copy), v28 (copy), v21 (copy), v19 (copy)
        local v34 = v32 + v33;
        local v35 = not v26.current or v30 ~= nil and v30.pages ~= nil and v30.pages[v26.current] ~= nil;
        local v36 = true;
        if v26.current ~= nil then
            v36 = false;
            if l_pageSize_0 ~= nil then
                v36 = v26.current * l_pageSize_0 < v34;
            end;
        end;
        local v37 = true;
        if v26.current ~= nil then
            v37 = true;
            if v30 ~= nil then
                v37 = false;
                if l_pageSize_0 ~= nil then
                    v37 = v26.current * l_pageSize_0 < v30.targetResults;
                end;
            end;
        end;
        if v35 and v36 and v37 then
            v26.current = if v26.current then v26.current + 1 else 1;
            assert(v26.current, "Force Luau to know that page.current is non-nil");
            if v30 and v30[v26.current] then
                return;
            else
                local v38 = l_join_0(v18.Query, {
                    PageIndex = v26.current - 1
                });
                v18.FetchItems(v38, v26.current, v28, v21, v19);
            end;
        end;
    end;
    l_useEffect_0(function() --[[ Line: 175 ]]
        -- upvalues: v1 (ref), v23 (ref), v26 (copy), v30 (copy), v39 (copy), l_pageSize_0 (copy)
        if not v1 then
            v23(false);
        end;
        v26.current = if v30 then #v30.pages else nil;
        v39(0, l_pageSize_0);
    end, {
        v28
    });
    local v40 = {};
    local v41 = math.min(l_pageSize_0, v18.MaxCount or 1e999);
    if v26.current and v30 then
        for _, v43 in v30.pages do
            local v44 = true;
            for _, v46 in v43 do
                assert(not v46.IsPlaceholder, "Data returned from network should not be a placeholder sentinel value");
                if not v46.ImageUrl and v46.CDNUrl and v31[v46.CDNUrl] then
                    v46.ImageUrl = v31[v46.CDNUrl];
                end;
                v46.TeamCreatePresence = {};
                assert(v46.TeamCreatePresence, "Force Luau to know that TeamCreatePresence is non-nil");
                if v46.TeamCreateCDNUrls then
                    for _, v48 in v46.TeamCreateCDNUrls do
                        local v49 = v31[v48];
                        if v49 then
                            table.insert(v46.TeamCreatePresence, v49);
                        end;
                    end;
                end;
                if not l_LuaStartPageFixFailingNetworkRequests_0 and not v46.ImageUrl and not v46.NoLoadableImage then
                    v44 = false;
                end;
                if l_LuaStartPageFixFailingNetworkRequests_0 then
                    v46.IsImageStillLoading = not v46.ImageUrl and not v46.NoLoadableImage;
                    table.insert(v40, v46);
                end;
            end;
            if not l_LuaStartPageFixFailingNetworkRequests_0 then
                for _, v51 in v43 do
                    assert(not v51.IsPlaceholder, "Data returned form network should not be a placeholder sentinel value");
                    v51.IsImageStillLoading = not v44;
                    table.insert(v40, v51);
                end;
            end;
        end;
        if v1 then
            if #v40 > 0 and #v40 < v30.targetResults then
                for _ = 1, math.min(v30.targetResults - #v40, v18.MaxCount or 6) do
                    table.insert(v40, {
                        IsPlaceholder = true
                    });
                end;
            end;
            if v1 and not v22.current and v30 and v30.targetResults and (#v40 >= math.min(v30.targetResults, v41) or v30.targetResults == 0) then
                v22.current = true;
                v18.InitialContentHasLoaded((math.min(#v40, v18.MaxCount or #v40)));
            end;
        else
            if not v22 and v30 and v30.targetResults and (#v40 >= math.min(v30.targetResults, v41) or v30.targetResults == 0) then
                v23(true);
                v18.InitialContentHasLoaded((math.min(#v40, v18.MaxCount or #v40)));
            end;
            local v53 = v26.current * (l_pageSize_0 or v30.targetResults);
            if v18.HasParentLoaded and #v40 > 0 and v53 < v30.targetResults then
                for _ = 1, math.min(v30.targetResults - v53, v18.MaxCount or 6) do
                    table.insert(v40, {
                        IsPlaceholder = true
                    });
                end;
            end;
        end;
    end;
    if v1 then
        if not v30 or #v40 < math.min(v30.targetResults, v41) then
            v40 = {};
            for _ = 1, v41 do
                table.insert(v40, {
                    IsPlaceholder = true
                });
            end;
        end;
    elseif not v18.HasParentLoaded or not v30 or #v40 < math.min(v30.targetResults, v41) then
        v40 = {};
        for _ = 1, v41 do
            table.insert(v40, {
                IsPlaceholder = true
            });
        end;
    end;
    for _, v58 in v40 do
        v58.SetNetworkResults = v21;
    end;
    if v18.MaxCount then
        v40 = {
            table.unpack(v40, 1, v18.MaxCount)
        };
    end;
    if #v40 == 0 and v18.NoContentDisplayComponent then
        return v2.createElement(v18.NoContentDisplayComponent, {
            Position = v18.Position, 
            Size = v18.Size
        });
    else
        return v2.createElement(v18.DisplayComponent, {
            Position = v18.Position, 
            Size = v18.Size, 
            Cells = v40, 
            OnLoadRange = v39, 
            LayoutOrder = v18.LayoutOrder, 
            CanvasSize = if not not v1 or v18.HasParentLoaded then nil else v18.Size, 
            CellComponent = v18.CellComponent, 
            CellSize = v18.CellSize, 
            CellPadding = v18.CellPadding, 
            DisplayComponentHasAdjustedQuery = if v18.CanDisplayComponentAdjustQuery then v18.DisplayComponentHasAdjustedQuery else nil, 
            CanDisplayComponentAdjustQuery = v18.CanDisplayComponentAdjustQuery or nil, 
            Query = if v18.CanDisplayComponentAdjustQuery then v18.Query else nil
        });
    end;
end;
if v1 then
    return (l_memo_0(NetworkView));
else
    return NetworkView;
end;