local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v1.withContext;
local v3 = require(l_Parent_0.Parent.Dash);
local l_append_0 = v3.append;
local l_collect_0 = v3.collect;
local l_join_0 = v3.join;
local l_map_0 = v3.map;
local l_mapFirst_0 = v3.mapFirst;
local l_omit_0 = v3.omit;
local l_reduce_0 = v3.reduce;
local v11 = require(l_Parent_0.Util.prioritize);
local v12 = require(l_Parent_0.Parent.Roact);
local v13 = require(script.GridCell);
local v14 = require(script.GroupHeader);
local v15 = require(script.style);
local l_getFFlagDevFrameworkFixGridCanvasSizeCalculation_0 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkFixGridCanvasSizeCalculation;
local l_getFFlagDevFrameworkMaterialPickerImprovedScroll_0 = require(l_Parent_0.SharedFlags).getFFlagDevFrameworkMaterialPickerImprovedScroll;
local v18 = game:DefineFastFlag("DevFrameworkGridOnLoadRange", false);
local v19 = {
    "InitialCanvasPosition", 
    "CellComponent", 
    "CellGroupHeader", 
    "CellGroups", 
    "CellPadding", 
    "CellSize", 
    "Cells", 
    "GetCellProps", 
    "OnScrollUpdate", 
    "OnLoadRange", 
    "SpecialCells", 
    "Stylizer"
};
local v20 = {
    AfterContent = false, 
    Collapsible = true, 
    HeaderComponent = v14, 
    SnapWidthToGrid = true
};
local function _(v21, v22) --[[ Line: 127 ]] --[[ Name: getGroupFromCell ]]
    -- upvalues: l_mapFirst_0 (copy)
    return l_mapFirst_0(v21, function(v23) --[[ Line: 128 ]]
        -- upvalues: v22 (copy)
        local v24 = v23.CellStart + v23.CellCount - 1;
        if v22 >= v23.CellStart and v22 <= v24 then
            return v23;
        else
            return nil;
        end;
    end);
end;
local v26 = v12.PureComponent:extend("Grid");
v26.init = function(v27) --[[ Line: 140 ]] --[[ Name: init ]]
    -- upvalues: v12 (copy)
    v27.state = {
        updateCount = 0
    };
    v27.cellGroups = nil;
    v27.minIndex = 0;
    v27.maxIndex = 0;
    v27.canvasPosition = nil;
    v27.ref = v12.createRef();
    v27._getCellProps = function(v28, v29, v30, v31) --[[ Line: 149 ]]
        -- upvalues: v27 (copy)
        return v27:getDefaultCellProps(v28, v29, v30, v31);
    end;
end;
v26._getAbsoluteSize = function(v32, v33) --[[ Line: 154 ]] --[[ Name: _getAbsoluteSize ]]
    local v34 = v32:_getCurrentRef();
    if not v34 then
        return Vector2.new(0, 0);
    else
        return Vector2.new(v34.AbsoluteSize.X * v33.X.Scale + v33.X.Offset, v34.AbsoluteSize.Y * v33.Y.Scale + v33.Y.Offset);
    end;
end;
v26._getCellGroupHeader = function(v35, v36, v37) --[[ Line: 173 ]] --[[ Name: _getCellGroupHeader ]]
    -- upvalues: v15 (copy), l_join_0 (copy), v20 (copy)
    local l_props_0 = v35.props;
    local v39 = {
        Size = (l_props_0.Stylizer or v15).CellGroupHeader.Size
    };
    local v40 = l_join_0(v20, v39, l_props_0.CellGroupHeader);
    local l_Size_0 = v40.Size;
    if v40.SnapWidthToGrid then
        local v42 = v36.X + v37.X;
        local v43 = v35:_getCellsPerRow() * v42 - v37.X;
        v40.Size = UDim2.new(0, v43, l_Size_0.Y.Scale, l_Size_0.Y.Offset);
        return v40;
    else
        v40.Size = l_Size_0 - UDim2.fromOffset(v37.X, 0);
        return v40;
    end;
end;
v26._getCellSize = function(v44) --[[ Line: 193 ]] --[[ Name: _getCellSize ]]
    -- upvalues: v15 (copy), v11 (copy)
    local l_props_1 = v44.props;
    local v46 = l_props_1.Stylizer or v15;
    return v44:_getAbsoluteSize((v11(l_props_1.CellSize, v46.CellSize)));
end;
v26._getCellPadding = function(v47) --[[ Line: 201 ]] --[[ Name: _getCellPadding ]]
    -- upvalues: v15 (copy), v11 (copy)
    local l_props_2 = v47.props;
    local v49 = l_props_2.Stylizer or v15;
    return v47:_getAbsoluteSize((v11(l_props_2.CellPadding, v49.CellPadding)));
end;
v26._getCurrentRef = function(v50) --[[ Line: 209 ]] --[[ Name: _getCurrentRef ]]
    -- upvalues: v12 (copy)
    return (v50.props[v12.Ref] or v50.ref).current;
end;
v26._getCellsPerRow = function(v51) --[[ Line: 215 ]] --[[ Name: _getCellsPerRow ]]
    local v52 = v51:_getCurrentRef();
    if not v52 then
        return 0;
    else
        local l_X_0 = v52.AbsoluteSize.X;
        local v54 = v51:_getCellPadding();
        local v55 = v51:_getCellSize().X + v54.X;
        if v55 == 0 then
            return 0;
        else
            return (math.floor((l_X_0 - v54.X) / v55));
        end;
    end;
end;
v26.didMount = function(v56) --[[ Line: 232 ]] --[[ Name: didMount ]]
    -- upvalues: l_getFFlagDevFrameworkMaterialPickerImprovedScroll_0 (copy)
    if l_getFFlagDevFrameworkMaterialPickerImprovedScroll_0() then
        v56.firstUpdateDone = false;
    end;
end;
v26.didUpdate = function(v57, v58) --[[ Line: 238 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_getFFlagDevFrameworkMaterialPickerImprovedScroll_0 (copy), v18 (copy)
    if l_getFFlagDevFrameworkMaterialPickerImprovedScroll_0() then
        local l_props_3 = v57.props;
        if v57.firstUpdateDone then
            return;
        else
            local v60 = v57:_getCurrentRef();
            if v60 and l_props_3.InitialCanvasPosition then
                v60.CanvasPosition = l_props_3.InitialCanvasPosition;
                if l_props_3.OnScrollUpdate then
                    local v61 = Vector2.new(v60.CanvasSize.X.Offset, v60.CanvasSize.Y.Offset);
                    l_props_3.OnScrollUpdate(v60.CanvasPosition, v61);
                end;
                v57.firstUpdateDone = true;
            end;
        end;
    end;
    local l_props_4 = v57.props;
    if v58.OnScrollUpdate ~= l_props_4.OnScrollUpdate or v58.OnLoadRange ~= l_props_4.OnLoadRange and v18 or v58.SpecialCells ~= l_props_4.SpecialCells or v58.CellGroups ~= l_props_4.CellGroups then
        v57:_update();
    end;
end;
v26._update = function(v63) --[[ Line: 271 ]] --[[ Name: _update ]]
    -- upvalues: l_getFFlagDevFrameworkMaterialPickerImprovedScroll_0 (copy), v18 (copy)
    local l_props_5 = v63.props;
    local v65, v66, v67 = v63:_getRange();
    if v66 == 0 then
        return;
    else
        local v68 = v63:_getCurrentRef();
        if v68 and v68.CanvasPosition ~= v63.canvasPosition then
            v63.canvasPosition = v68.CanvasPosition;
            if l_props_5.OnScrollUpdate then
                local v69 = Vector2.new(v68.CanvasSize.X.Offset, v68.CanvasSize.Y.Offset);
                if l_getFFlagDevFrameworkMaterialPickerImprovedScroll_0() then
                    if v69.X ~= 0 or v69.Y ~= 0 then
                        l_props_5.OnScrollUpdate(v63.canvasPosition, v69);
                    end;
                else
                    l_props_5.OnScrollUpdate(v63.canvasPosition, v69);
                end;
            end;
        end;
        if v63.minIndex == v65 and v63.maxIndex == v66 then
            return;
        else
            if v18 and l_props_5.OnLoadRange and #l_props_5.Cells <= v66 then
                l_props_5.OnLoadRange(v65, v66);
            end;
            v63.minIndex = v65;
            v63.maxIndex = v66;
            v63.cellGroups = v67;
            v63:_incrementRender();
            return;
        end;
    end;
end;
v26._incrementRender = function(v70) --[[ Line: 311 ]] --[[ Name: _incrementRender ]]
    v70:setState(function(v71) --[[ Line: 312 ]]
        return {
            updateCount = (v71.updateCount + 1) % 5000
        };
    end);
end;
v26._getRange = function(v72) --[[ Line: 321 ]] --[[ Name: _getRange ]]
    local l_props_6 = v72.props;
    local l_current_0 = v72.ref.current;
    if not l_current_0 then
        return v72.minIndex, v72.maxIndex, v72.cellGroups;
    else
        local v75 = 0;
        local l_SpecialCells_0 = l_props_6.SpecialCells;
        if l_SpecialCells_0 then
            for _, v78 in l_SpecialCells_0 do
                v75 = v75 + v78.AbsoluteSize.Y;
            end;
        end;
        local l_Y_0 = l_current_0.CanvasPosition.Y;
        local l_Y_1 = l_current_0.AbsoluteSize.Y;
        local v81 = v72:_getCellsPerRow();
        local v82 = nil;
        local v83 = nil;
        local v84 = nil;
        if l_props_6.CellGroups and #l_props_6.CellGroups > 0 then
            v84 = v72:_getGroups();
            local v85 = l_Y_0 + l_Y_1;
            for _, v87 in v84 do
                if v85 < v87.Offset then
                    assert(v82 ~= nil, "minIndex should not be nil");
                    assert(v83 ~= nil, "maxIndex should not be nil");
                    return v82, v83, v84;
                elseif v87.Offset + v87.Height >= l_Y_0 then
                    if not v82 then
                        v82 = v87.CellStart;
                    end;
                    v83 = v87.CellStart + v87.RowCount * v81 - 1;
                end;
            end;
            return v82, v83, v84;
        else
            local v88 = v72:_getCellSize();
            local v89 = v72:_getCellPadding();
            return math.max(0, math.floor(l_Y_0 / (v88.Y + v89.Y)) - 10 - v75) * v81, (math.ceil((l_Y_0 + l_Y_1) / (v88.Y + v89.Y)) + 10) * v81, v84;
        end;
    end;
end;
v26._getGroups = function(v90) --[[ Line: 378 ]] --[[ Name: _getGroups ]]
    -- upvalues: l_map_0 (copy), l_join_0 (copy)
    local l_props_7 = v90.props;
    if not l_props_7.CellGroups or #l_props_7.CellGroups == 0 then
        return {};
    else
        local v92 = v90:_getCellPadding();
        local v93 = v90:_getCellSize();
        local v94 = v93.Y + v92.Y;
        local v95 = v90:_getCellGroupHeader(v93, v92).Size.Y.Offset + v92.Y;
        local v96 = 1;
        local v97 = 0;
        local v98 = 0;
        local v99 = v90:_getCellsPerRow();
        local v104 = l_map_0(l_props_7.CellGroups, function(v100) --[[ Line: 395 ]]
            -- upvalues: v99 (copy), v95 (copy), v94 (copy), l_join_0 (ref), v96 (ref), v97 (ref), v98 (ref)
            local v101 = math.ceil(v100.CellCount / v99);
            local l_v95_0 = v95;
            if not v100.IsCollapsed then
                l_v95_0 = l_v95_0 + v101 * v94;
            end;
            local v103 = l_join_0({
                CellStart = v96, 
                Height = l_v95_0, 
                Offset = v97, 
                RowCount = v101, 
                RowStart = v98
            }, v100);
            v96 = v96 + v100.CellCount;
            v97 = v97 + l_v95_0;
            v98 = v98 + v101;
            return v103;
        end);
        local v105 = v104[#v104];
        v105.CellCount = #l_props_7.Cells - v105.CellStart + 1;
        return v104;
    end;
end;
v26._calculateCellPosition = function(v106, v107, v108) --[[ Line: 425 ]] --[[ Name: _calculateCellPosition ]]
    -- upvalues: l_mapFirst_0 (copy)
    local v109 = v106:_getCellPadding();
    local v110 = v106:_getCellSize();
    local v111 = v110.X + v109.X;
    local v112 = v110.Y + v109.Y;
    local v113 = v106:_getCellsPerRow();
    local v114 = nil;
    local v115 = nil;
    if v108 then
        local v116 = v106:_getCellGroupHeader(v110, v109);
        local v119 = l_mapFirst_0(v108, function(v117) --[[ Line: 128 ]]
            -- upvalues: v107 (copy)
            local v118 = v117.CellStart + v117.CellCount - 1;
            if v107 >= v117.CellStart and v107 <= v118 then
                return v117;
            else
                return nil;
            end;
        end);
        assert(v119, "Expected cell to belong to a group");
        local l_Offset_0 = v119.Offset;
        if not v116.AfterContent then
            l_Offset_0 = l_Offset_0 + v116.Size.Y.Offset;
        end;
        local v121 = math.floor((v107 - v119.CellStart) / v113);
        local v122 = (v107 - v119.CellStart) % v113;
        v114 = v109.X + v122 * v111;
        v115 = l_Offset_0 + v109.Y + v121 * v112;
    else
        local v123 = v107 <= 1 and 0 or math.floor((v107 - 1) / v113);
        local v124 = (v107 - 1) % v113;
        v114 = v109.X + v124 * v111;
        v115 = v109.Y + v123 * v112;
    end;
    return UDim2.fromOffset(v114, v115);
end;
v26.getDefaultCellProps = function(v125, v126, v127, v128, v129) --[[ Line: 457 ]] --[[ Name: getDefaultCellProps ]]
    -- upvalues: v15 (copy)
    local v130 = v125.props.Stylizer or v15;
    return {
        Key = v127, 
        Position = v128, 
        Cell = v126, 
        Size = v129, 
        Style = v130
    };
end;
v26.render = function(v131) --[[ Line: 469 ]] --[[ Name: render ]]
    -- upvalues: v11 (copy), l_mapFirst_0 (copy), v12 (copy), v13 (copy), l_append_0 (copy), l_omit_0 (copy), v19 (copy), l_reduce_0 (copy), l_getFFlagDevFrameworkFixGridCanvasSizeCalculation_0 (copy), l_join_0 (copy)
    local l_props_8 = v131.props;
    local v133 = l_props_8.GetCellProps or v131._getCellProps;
    local l_Stylizer_0 = l_props_8.Stylizer;
    local v135 = v131:_getCellPadding();
    local v136 = v131:_getCellSize();
    local v137 = v131:_getCellsPerRow();
    local l_Cells_0 = l_props_8.Cells;
    local l_SpecialCells_1 = l_props_8.SpecialCells;
    assert(not l_props_8.SpecialCells or not l_props_8.CellGroups, "Cannot use SpecialCells with CellGroups");
    local v140 = 0;
    if l_SpecialCells_1 then
        for _, v142 in pairs(l_SpecialCells_1) do
            v140 = v140 + v142.AbsoluteSize.Y;
        end;
    end;
    local v143 = {};
    local v144, v145, v146 = v131:_getRange();
    local v147 = v11(l_props_8.CellSize, l_Stylizer_0.CellSize);
    local v148 = 0;
    local v149 = 0;
    local v150 = if l_SpecialCells_1 then l_SpecialCells_1.HEADER else nil;
    if v150 then
        v143.Header = v150.OnRender(nil, 1, UDim2.fromOffset(0, 0), UDim2.fromOffset(v150.AbsoluteSize.X, v150.AbsoluteSize.Y));
        v148 = v148 + v150.AbsoluteSize.Y;
        v149 = v149 + 1;
    end;
    local v151 = l_props_8.CellGroupHeader or {};
    for v152 = v144, v145 do
        local v153 = l_Cells_0[v152];
        if v153 then
            local v154 = nil;
            if v146 then
                if not v151.Collapsible or not l_mapFirst_0(v146, function(v155) --[[ Line: 128 ]]
                    -- upvalues: v152 (copy)
                    local v156 = v155.CellStart + v155.CellCount - 1;
                    if v152 >= v155.CellStart and v152 <= v156 then
                        return v155;
                    else
                        return nil;
                    end;
                end).IsCollapsed then
                    v154 = v131:_calculateCellPosition(v152, v146);
                else
                    continue;
                end;
            else
                local v157 = (v152 <= 1 and 0 or math.floor((v152 - 1) / v137)) * (v135.Y + v136.Y) + v135.Y + v148;
                v154 = UDim2.fromOffset(v135.X + (v152 - 1) % v137 * (v135.X + v136.X), v157);
            end;
            local v158 = v133(v153, v152 + v149, v154, v147);
            local v159 = v158.Key or tostring(v152);
            local v160 = if l_SpecialCells_1 then l_SpecialCells_1[v159] else nil;
            if v160 then
                v143[v159] = v160.OnRender(v153, v152 + v149, v154, UDim2.fromOffset(v160.AbsoluteSize.X, v160.AbsoluteSize.Y));
                v148 = v160.AbsoluteSize.Y;
            else
                v143[v159] = v12.createElement(l_props_8.CellComponent or v13, v158);
            end;
        end;
    end;
    if v146 then
        l_append_0(v143, v131:renderGroupHeaders(v146));
    end;
    local v161 = l_omit_0(l_props_8, v19);
    local v162 = nil;
    v162 = if v146 then l_reduce_0(v146, function(v163, v164) --[[ Line: 561 ]]
        return v163 + v164.Height;
    end, 0) else if l_getFFlagDevFrameworkFixGridCanvasSizeCalculation_0() then v140 + (v136.Y + v135.Y) * math.ceil(#l_props_8.Cells / v137) + v135.Y else v140 + (v136.Y + v135.Y) * math.ceil(#l_props_8.Cells / v137);
    local function v165() --[[ Line: 576 ]] --[[ Name: processUpdate ]]
        -- upvalues: v131 (copy)
        v131:_update();
    end;
    return v12.createElement("ScrollingFrame", l_join_0({
        AutomaticSize = l_props_8.AutomaticSize, 
        AutomaticCanvasSize = if not l_props_8.CanvasSize then Enum.AutomaticSize.X else nil, 
        BackgroundColor = BrickColor.new(l_Stylizer_0.BackgroundColor), 
        CanvasSize = l_props_8.CanvasSize or UDim2.new(0, 0, 0, v162), 
        ScrollingDirection = l_props_8.ScrollingDirection, 
        Size = UDim2.fromScale(1, 1), 
        [v12.Ref] = v131.ref, 
        [v12.Change.AbsoluteSize] = v165, 
        [v12.Change.CanvasPosition] = v165, 
        [v12.Change.CanvasSize] = v165
    }, l_Stylizer_0.ScrollingFrame, v161), v143);
end;
v26.renderGroupHeaders = function(v166, v167) --[[ Line: 598 ]] --[[ Name: renderGroupHeaders ]]
    -- upvalues: l_collect_0 (copy), l_join_0 (copy), v12 (copy)
    local l_Stylizer_1 = v166.props.Stylizer;
    local v169 = v166:_getCellSize();
    local v170 = v166:_getCellPadding();
    local v171 = v166:_getCellGroupHeader(v169, v170);
    local l_Offset_1 = v171.Size.Y.Offset;
    local l_HeaderComponent_0 = v171.HeaderComponent;
    return l_collect_0(v167, function(v174, v175) --[[ Line: 608 ]]
        -- upvalues: v171 (copy), l_Offset_1 (copy), l_join_0 (ref), v170 (copy), l_Stylizer_1 (copy), v12 (ref), l_HeaderComponent_0 (copy)
        local l_Offset_2 = v175.Offset;
        if v171.AfterContent then
            l_Offset_2 = l_Offset_2 + (v175.Height - l_Offset_1);
        end;
        local v177 = l_join_0({
            Collapsible = v171.Collapsible, 
            OnExpandCollapseClicked = function() --[[ Line: 617 ]] --[[ Name: OnExpandCollapseClicked ]]
                -- upvalues: v171 (ref), v174 (copy)
                if v171.OnExpandCollapseClicked then
                    v171.OnExpandCollapseClicked(v174);
                end;
            end, 
            Position = UDim2.fromOffset(v170.X, l_Offset_2), 
            Size = v171.Size, 
            Style = l_Stylizer_1.CellGroupHeader
        }, v175);
        return ("Group %*"):format(v174), v12.createElement(l_HeaderComponent_0, v177);
    end);
end;
return (l_withContext_0({
    Stylizer = v1.Stylizer
})(v26));