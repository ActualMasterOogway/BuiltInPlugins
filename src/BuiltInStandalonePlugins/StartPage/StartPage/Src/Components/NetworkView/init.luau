local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_memo_0 = v1.memo;
local l_useEffect_0 = v1.useEffect;
local l_useRef_0 = v1.useRef;
local l_slice_0 = require(l_script_FirstAncestor_0.Packages.Dash).slice;
local _ = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
local v7 = require(l_script_FirstAncestor_0.Src.Network.GameCache);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_script_FirstAncestor_0.Src.Util.getQueryString);
NetworkView = function(v10) --[[ Line: 77 ]] --[[ Name: NetworkView ]]
    -- upvalues: v9 (copy), v7 (copy), l_useRef_0 (copy), l_useEffect_0 (copy), v1 (copy), l_slice_0 (copy)
    local l_searchKey_0 = v10.Query.searchKey;
    local v12 = v9(l_searchKey_0, v10.Query);
    local l_pageSize_0 = v10.Query.pageSize;
    if not l_pageSize_0 then
        warn(l_pageSize_0, "Should have a page size in the query");
        l_pageSize_0 = 30;
    end;
    local v14, v15, v16 = v7:use(v10.Query, v12, v10.FetchItems);
    local v17 = l_useRef_0(false);
    if not v17.current and v10.InitialContentHasLoaded and v15 ~= nil then
        v17.current = true;
        v10.InitialContentHasLoaded((math.min(#v14, v10.MaxCount or #v14)));
    end;
    l_useEffect_0(function() --[[ Line: 96 ]]
        -- upvalues: v10 (copy), v15 (copy), v14 (copy)
        if v10.OnItemCountUpdated and v15 then
            v10.OnItemCountUpdated(#v14);
        end;
    end, {
        #v14, 
        v15
    });
    if v15 == 0 and v10.NoContentDisplayComponent then
        return v1.createElement(v10.NoContentDisplayComponent, {
            Size = v10.Size
        });
    else
        return v1.createElement(v10.DisplayComponent, {
            Cells = if v10.MaxCount then l_slice_0(v14, 1, v10.MaxCount) else v14, 
            OnLoadRange = v16, 
            LayoutOrder = v10.LayoutOrder, 
            CellComponent = v10.CellComponent, 
            CellSize = v10.CellSize, 
            CellPadding = v10.CellPadding, 
            Size = v10.Size, 
            DisplayComponentHasAdjustedQuery = if v10.CanDisplayComponentAdjustQuery then v10.DisplayComponentHasAdjustedQuery else nil, 
            CanDisplayComponentAdjustQuery = v10.CanDisplayComponentAdjustQuery or nil, 
            Query = if v10.CanDisplayComponentAdjustQuery then v10.Query else nil
        });
    end;
end;
return l_memo_0(NetworkView);