local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local l_UI_0 = l_Parent_0.UI;
local v3 = require(l_UI_0.Components.ScrollingFrame);
local v4 = require(l_UI_0.Components.Pane);
local v5 = require(l_UI_0.Components.LoadingIndicator);
local _ = require(script.style);
local v7 = require(l_Parent_0.Wrappers.withAbsoluteSize);
local l_join_0 = require(l_Parent_0.Parent.Dash).join;
local v9 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v9.withContext;
local v11 = require(l_Parent_0.Util.Typecheck);
local v12 = v1.PureComponent:extend("InfiniteScrollingGrid");
v11.wrap(v12, script);
v12.defaultProps = {
    BufferedRows = 1, 
    CellPadding = UDim2.fromOffset(0, 0), 
    CellSize = UDim2.fromOffset(100, 100), 
    GetItemKey = function(v13) --[[ Line: 120 ]] --[[ Name: GetItemKey ]]
        return v13;
    end, 
    LoadRange = function() --[[ Line: 123 ]] --[[ Name: LoadRange ]]

    end, 
    OnScrollUpdate = function() --[[ Line: 126 ]] --[[ Name: OnScrollUpdate ]]

    end, 
    RenderEmpty = function() --[[ Line: 129 ]] --[[ Name: RenderEmpty ]]
        -- upvalues: v1 (copy), v4 (copy)
        return v1.createElement(v4, {
            Size = UDim2.fromScale(1, 1)
        });
    end, 
    Position = UDim2.fromOffset(0, 0), 
    Size = UDim2.fromScale(1, 1)
};
local function _(v14, v15, v16) --[[ Line: 138 ]] --[[ Name: getCellsPerRow ]]
    if v15.X == 0 then
        return 0;
    else
        return (math.floor((v14.X + v16.X) / v15.X));
    end;
end;
local function _(v18, v19) --[[ Line: 146 ]] --[[ Name: getAbsoluteCellPadding ]]
    return Vector2.new(v18.X.Scale * v19.X + v18.X.Offset, v18.Y.Scale * v19.Y + v18.Y.Offset);
end;
local function v25(v21, v22, v23) --[[ Line: 153 ]] --[[ Name: getAbsoluteCellSize ]]
    local v24 = Vector2.new(math.floor((v21.X.Scale + v22.X.Scale) * v23.X), (math.floor((v21.Y.Scale + v22.Y.Scale) * v23.Y)));
    return Vector2.new(v24.X + v21.X.Offset + v22.X.Offset, v24.Y + v21.Y.Offset + v22.Y.Offset);
end;
v12.init = function(v26) --[[ Line: 164 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v25 (copy)
    v26.itemElements = {};
    v26.itemKeys = {};
    v26.scrollingFrameRef = v1.createRef();
    v26.onUpdateView = function(v27, v28) --[[ Line: 169 ]]
        -- upvalues: v26 (copy), v25 (ref)
        local l_props_0 = v26.props;
        local l_state_0 = v26.state;
        if l_state_0.canvasPosition and not v28 and v27.X == l_state_0.canvasPosition.X and v27.Y == l_state_0.canvasPosition.Y then
            return;
        else
            local l_AbsoluteMax_0 = l_props_0.AbsoluteMax;
            local l_AbsoluteSize_0 = l_props_0.AbsoluteSize;
            local l_BufferedRows_0 = l_props_0.BufferedRows;
            local l_CellSize_0 = l_props_0.CellSize;
            local l_CellPadding_0 = l_props_0.CellPadding;
            local v36 = v25(l_CellSize_0, l_CellPadding_0, l_AbsoluteSize_0);
            local v37 = Vector2.new(l_CellPadding_0.X.Scale * l_AbsoluteSize_0.X + l_CellPadding_0.X.Offset, l_CellPadding_0.Y.Scale * l_AbsoluteSize_0.Y + l_CellPadding_0.Y.Offset);
            local v38 = math.max(math.floor(v27.Y / v36.Y) - l_BufferedRows_0, 0);
            local v39 = math.floor((v27.Y + l_AbsoluteSize_0.Y) / v36.Y) + l_BufferedRows_0;
            local v40 = v36.X == 0 and 0 or math.floor((l_AbsoluteSize_0.X + v37.X) / v36.X);
            local v41 = v39 - v38;
            local v42 = v40 * v38 + 1;
            local v43 = v40 * v39;
            if v42 ~= l_state_0.minItemIndex or v43 ~= l_state_0.maxItemIndex then
                l_props_0.LoadRange(v42, v43 - v42 + 1);
                local l_v42_0 = v42;
                local l_v43_0 = v43;
                if math.floor(l_AbsoluteMax_0 / v40) < v39 then
                    v39 = math.floor(l_AbsoluteMax_0 / v40);
                    v38 = math.max(v39 - v41, 0);
                end;
                v42 = v40 * v38 + 1;
                v43 = v40 * v39 + l_AbsoluteMax_0 % v40;
                local v46 = l_state_0.minItemIndex or 1;
                local v47 = l_state_0.maxItemIndex or 1;
                if v46 < v42 then
                    for v48 = v46, v42 do
                        v26.itemElements[v48] = nil;
                    end;
                end;
                if v43 < v47 then
                    for v49 = v43, v47 do
                        v26.itemElements[v49] = nil;
                    end;
                end;
                if v42 ~= l_state_0.minItemIndex or v43 ~= l_state_0.maxItemIndex or l_v42_0 ~= l_v42_0 or l_v43_0 ~= l_v43_0 then
                    v26:setState({
                        absoluteSize = l_AbsoluteSize_0, 
                        canvasPosition = v27, 
                        cellsPerRow = v40, 
                        maxItemIndex = v43, 
                        maxRowIndex = v39, 
                        minItemIndex = v42, 
                        minRowIndex = v38, 
                        targetMaxItemIndex = l_v43_0, 
                        targetMinItemIndex = l_v42_0
                    });
                end;
            end;
            return;
        end;
    end;
    v26.onBoundsUpdated = function() --[[ Line: 249 ]]
        -- upvalues: v26 (copy)
        local l_props_1 = v26.props;
        local l_state_1 = v26.state;
        local l_Items_0 = l_props_1.Items;
        local l_AbsoluteMax_1 = l_props_1.AbsoluteMax;
        local l_minItemIndex_0 = l_state_1.minItemIndex;
        local l_maxItemIndex_0 = l_state_1.maxItemIndex;
        local l_targetMinItemIndex_0 = l_state_1.targetMinItemIndex;
        local l_targetMaxItemIndex_0 = l_state_1.targetMaxItemIndex;
        local v58 = math.min(l_targetMinItemIndex_0, l_AbsoluteMax_1 - l_AbsoluteMax_1 % l_state_1.cellsPerRow - (l_targetMaxItemIndex_0 - l_targetMinItemIndex_0));
        local v59 = math.min(l_targetMaxItemIndex_0, l_AbsoluteMax_1);
        for v60 = l_minItemIndex_0, v58, -1 do
            if not l_Items_0[v60] then
                return;
            end;
        end;
        for v61 = l_maxItemIndex_0, v59 do
            if not l_Items_0[v61] then
                return;
            end;
        end;
        v26:setState({
            maxItemIndex = v59, 
            minItemIndex = v58, 
            targetMaxItemIndex = v59, 
            targetMinItemIndex = v58
        });
    end;
    v26.onScrollUpdate = function(v62) --[[ Line: 286 ]]
        -- upvalues: v26 (copy)
        v26.props.OnScrollUpdate(v62);
        v26.onUpdateView(v62, false);
    end;
end;
v12.didUpdate = function(v63, v64) --[[ Line: 294 ]] --[[ Name: didUpdate ]]
    -- upvalues: v25 (copy), v1 (copy)
    local l_props_2 = v63.props;
    local l_state_2 = v63.state;
    local l_AbsoluteSize_1 = l_props_2.AbsoluteSize;
    local l_CellPadding_1 = l_props_2.CellPadding;
    local l_CellSize_1 = l_props_2.CellSize;
    local v70 = v25(l_CellSize_1, l_CellPadding_1, l_AbsoluteSize_1);
    local v71 = Vector2.new(l_CellPadding_1.X.Scale * l_AbsoluteSize_1.X + l_CellPadding_1.X.Offset, l_CellPadding_1.Y.Scale * l_AbsoluteSize_1.Y + l_CellPadding_1.Y.Offset);
    local v72 = v70.X == 0 and 0 or math.floor((l_AbsoluteSize_1.X + v71.X) / v70.X);
    local v73 = true;
    if v64.CellSize.X.Offset == l_CellSize_1.X.Offset then
        v73 = v64.CellSize.Y.Offset ~= l_CellSize_1.Y.Offset;
    end;
    if v64.Items ~= v63.props.Items or v73 then
        v63:setState({
            absoluteSize = v1.None, 
            canvasPosition = v1.None, 
            cellsPerRow = v1.None, 
            minItemIndex = v1.None, 
            minRowIndex = v1.None, 
            maxItemIndex = v1.None, 
            maxRowIndex = v1.None, 
            targetMaxItemIndex = v1.None, 
            targetMinItemIndex = v1.None
        });
        return;
    else
        if v72 ~= 0 then
            local v74 = v63.scrollingFrameRef:getValue();
            if not l_state_2.absoluteSize or l_state_2.absoluteSize.X ~= l_AbsoluteSize_1.X or l_state_2.absoluteSize.Y ~= l_AbsoluteSize_1.Y or v73 or v74 and v74.CanvasPosition ~= l_state_2.canvasPosition then
                local v75 = if v74 then v74.CanvasPosition else l_state_2.canvasPosition;
                v63.onUpdateView(v75 or Vector2.new(0, 0), true);
            end;
        end;
        if l_state_2.minItemIndex and l_state_2.targetMinItemIndex and l_state_2.maxItemIndex and l_state_2.targetMaxItemIndex and (l_state_2.minItemIndex ~= l_state_2.targetMinItemIndex or l_state_2.maxItemIndex ~= l_state_2.targetMaxItemIndex) then
            v63.onBoundsUpdated();
        end;
        return;
    end;
end;
v12.render = function(v76) --[[ Line: 344 ]] --[[ Name: render ]]
    -- upvalues: v25 (copy), v1 (copy), v4 (copy), l_join_0 (copy), v5 (copy), v3 (copy)
    local l_props_3 = v76.props;
    local l_state_3 = v76.state;
    local l_AbsoluteMax_2 = l_props_3.AbsoluteMax;
    local l_AbsoluteSize_2 = l_props_3.AbsoluteSize;
    local l_CellSize_2 = l_props_3.CellSize;
    local l_CellPadding_2 = l_props_3.CellPadding;
    local l_GetItemKey_0 = l_props_3.GetItemKey;
    local l_Items_1 = l_props_3.Items;
    local l_Loading_0 = l_props_3.Loading;
    local l_Padding_0 = l_props_3.Padding;
    local l_Position_0 = l_props_3.Position;
    local l_RenderItem_0 = l_props_3.RenderItem;
    local l_RenderEmpty_0 = l_props_3.RenderEmpty;
    local l_Size_0 = l_props_3.Size;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local v92 = v25(l_CellSize_2, l_CellPadding_2, l_AbsoluteSize_2);
    local v93 = Vector2.new(l_CellPadding_2.X.Scale * l_AbsoluteSize_2.X + l_CellPadding_2.X.Offset, l_CellPadding_2.Y.Scale * l_AbsoluteSize_2.Y + l_CellPadding_2.Y.Offset);
    local v94 = v92.X == 0 and 0 or math.floor((l_AbsoluteSize_2.X + v93.X) / v92.X);
    if v94 == 0 or not l_state_3.minItemIndex or not l_state_3.maxItemIndex then
        return v1.createElement(v4, l_join_0({
            Size = l_Size_0, 
            Position = l_Position_0
        }, l_props_3.WrapperProps));
    else
        local v95 = {
            UIGridLayout = v1.createElement("UIGridLayout", {
                CellPadding = l_CellPadding_2, 
                CellSize = l_CellSize_2, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder
            })
        };
        for v96 = l_state_3.minItemIndex, l_state_3.maxItemIndex do
            if not l_Items_1[v96] then
                v95[v96] = l_RenderEmpty_0(v96);
            elseif v76.itemElements[v96] and v76.itemKeys[v96] == l_GetItemKey_0(l_Items_1[v96]) then
                v95[v96] = v76.itemElements[v96];
            else
                v76.itemElements[v96] = l_RenderItem_0(v96, l_Items_1[v96]);
                v76.itemKeys[v96] = l_GetItemKey_0(l_Items_1[v96]);
                v95[v96] = v76.itemElements[v96];
            end;
        end;
        local v97 = nil;
        if l_Loading_0 then
            v97 = v1.createElement(v4, {
                Padding = l_Stylizer_0.LoadingIndicatorPadding, 
                Size = l_Stylizer_0.LoadingIndicatorSize
            }, {
                loadingIndicator = v5
            });
        end;
        return v1.createElement(v4, l_join_0({
            Size = l_Size_0, 
            Position = l_Position_0, 
            ZIndex = l_props_3.ZIndex
        }, l_props_3.WrapperProps), {
            scrollingFrame = v1.createElement(v3, {
                AutoSizeCanvas = true, 
                AutomaticCanvasSize = Enum.AutomaticSize.XY, 
                CanvasSize = UDim2.fromScale(1, 1), 
                OnScrollUpdate = v76.onScrollUpdate, 
                Padding = l_Padding_0, 
                Size = UDim2.fromScale(1, 1), 
                [v1.Ref] = v76.scrollingFrameRef
            }, {
                Grid = v1.createElement(v4, {
                    LayoutOrder = 1, 
                    Position = UDim2.fromOffset(0, l_state_3.minRowIndex * v92.Y), 
                    Size = UDim2.new(1, 0, 0, v92.Y * (l_state_3.maxRowIndex - l_state_3.minRowIndex))
                }, v95), 
                Loader = v1.createElement(v4, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    LayoutOrder = 2, 
                    Position = UDim2.new(0.5 - l_Stylizer_0.LoadingIndicatorSize.X.Scale / 2, -(l_Stylizer_0.LoadingIndicatorSize.X.Offset + l_Stylizer_0.LoadingIndicatorPadding) / 2, 0, math.ceil(l_AbsoluteMax_2 / v94) * v92.Y), 
                    Size = UDim2.fromOffset(0, l_Padding_0 or 0)
                }, {
                    Indicator = v97
                })
            })
        });
    end;
end;
return v7((l_withContext_0({
    Stylizer = v9.Stylizer
})(v12)));