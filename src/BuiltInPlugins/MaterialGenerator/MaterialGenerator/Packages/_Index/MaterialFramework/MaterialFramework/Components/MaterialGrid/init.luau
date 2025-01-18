local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Types);
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_0.Components.MaterialPreview);
local v4 = require(l_Parent_1.Dash);
local v5 = require(l_Parent_1.Framework);
local v6 = require(l_Parent_1.React);
local l_useState_0 = v6.useState;
local l_Localization_0 = v5.ContextServices.Localization;
local l_Stylizer_0 = v5.Style.Stylizer;
local l_UI_0 = v5.UI;
local l_Grid_0 = l_UI_0.Grid;
local l_List_0 = l_UI_0.List;
local l_Pane_0 = l_UI_0.Pane;
local l_prioritize_0 = v5.Util.prioritize;
local v15 = require(script.MaterialGridItem);
local v16 = require(script.MaterialListItem);
local v17 = require(l_Parent_0.Enums.ViewType);
local v18 = require(l_Parent_0.Util.getMaterialName);
local v19 = require(l_Parent_0.Util.getSerializedMaterialIdentifier);
local l_RunService_0 = game:GetService("RunService");
local v21 = require(l_Parent_0.Flags.getFFlagMaterialGridExtraProps);
local v22 = require(l_Parent_0.Flags.getFFlagMaterialPickerUIChanges);
local v23 = require(l_Parent_0.Flags.getFFlagMaterialPickerInstantTooltip);
local v24 = require(l_Parent_0.Flags.getFFlagMaterialPickerImprovedScroll);
local function _(v25) --[[ Line: 131 ]] --[[ Name: convertToItems ]]
    -- upvalues: v4 (copy)
    return v4.map(v25, function(v26) --[[ Line: 132 ]]
        if typeof(v26) == "table" then
            return v26;
        else
            return {
                Id = v26, 
                Loading = false, 
                Material = v26
            };
        end;
    end);
end;
MaterialGrid = function(v28) --[[ Line: 145 ]] --[[ Name: MaterialGrid ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), l_prioritize_0 (copy), v4 (copy), v6 (copy), l_useState_0 (copy), l_RunService_0 (copy), v24 (copy), v17 (copy), v23 (copy), v22 (copy), v19 (copy), v18 (copy), l_Pane_0 (copy), v3 (copy), l_Grid_0 (copy), v21 (copy), v15 (copy), l_List_0 (copy), v16 (copy)
    local v29 = l_Localization_0:use();
    local v30 = l_Stylizer_0:use("MaterialGrid");
    local v31 = l_prioritize_0(v28.GridItemSize, v30.GridItemSize);
    local v32 = l_prioritize_0(v28.ListItemHeight, v30.ListItemHeight);
    local v33 = l_prioritize_0(v28.Padding, v30.Padding);
    local v34 = l_prioritize_0(v28.GridPadding, v30.Padding);
    local v35 = l_prioritize_0(v28.ListPadding, v30.Padding);
    local v36 = l_prioritize_0(v28.ViewType, v30.ViewType);
    local v37 = l_prioritize_0(v28.TooltipDelay, v30.TooltipDelay);
    local l_Items_0 = v28.Items;
    local v40 = v4.map(l_Items_0, function(v39) --[[ Line: 132 ]]
        if typeof(v39) == "table" then
            return v39;
        else
            return {
                Id = v39, 
                Loading = false, 
                Material = v39
            };
        end;
    end);
    l_Items_0 = v6.createRef();
    local v41, v42 = l_useState_0();
    local function v45() --[[ Line: 162 ]] --[[ Name: takeDummySnapshot ]]
        -- upvalues: l_Items_0 (copy), v28 (copy)
        if l_Items_0 then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 164 ]]
                -- upvalues: l_Items_0 (ref)
                return l_Items_0:getValue():CaptureSnapshotAsync();
            end);
            if l_status_0 and v28.OnSnapshotTaken then
                v28.OnSnapshotTaken(l_result_0);
                return;
            else
                warn("Material Grid failed to get temporary image from viewport frame" .. l_result_0);
            end;
        end;
    end;
    local v46, v47 = l_useState_0(false);
    local v48 = v6.useRef(0);
    local v49 = nil;
    local v50, v51 = l_useState_0(true);
    local v52 = v6.useRef(0);
    local v53, v54 = l_useState_0(Vector2.new());
    local function v55() --[[ Line: 193 ]] --[[ Name: onTooltipShown ]]
        -- upvalues: v28 (copy), v47 (copy)
        if v28.UseInstantTooltip then
            v47(true);
        end;
    end;
    local function _() --[[ Line: 199 ]] --[[ Name: disconnectDisableInstantTooltip ]]
        -- upvalues: v49 (ref)
        if v49 then
            v49:Disconnect();
            v49 = nil;
        end;
    end;
    local function _() --[[ Line: 206 ]] --[[ Name: connectDisableInstantTooltip ]]
        -- upvalues: v49 (ref), l_RunService_0 (ref), v48 (copy), v47 (copy)
        if v49 then
            v49:Disconnect();
            v49 = nil;
        end;
        v49 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 208 ]]
            -- upvalues: v48 (ref), v49 (ref), v47 (ref)
            if tick() >= v48.current then
                if v49 then
                    v49:Disconnect();
                    v49 = nil;
                end;
                v47(false);
            end;
        end);
    end;
    local function _() --[[ Line: 216 ]] --[[ Name: onMouseEnter ]]
        -- upvalues: v28 (copy), v48 (copy), v37 (copy), v46 (copy), v49 (ref), l_RunService_0 (ref), v47 (copy)
        if v28.UseInstantTooltip then
            v48.current = tick() + v37;
            if v46 then
                if v49 then
                    v49:Disconnect();
                    v49 = nil;
                end;
                v49 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 208 ]]
                    -- upvalues: v48 (ref), v49 (ref), v47 (ref)
                    if tick() >= v48.current then
                        if v49 then
                            v49:Disconnect();
                            v49 = nil;
                        end;
                        v47(false);
                    end;
                end);
            end;
        end;
    end;
    local function v59() --[[ Line: 226 ]] --[[ Name: onMouseMoved ]]
        -- upvalues: v28 (copy), v48 (copy), v37 (copy), v52 (copy), v51 (copy)
        if v28.UseInstantTooltip then
            v48.current = tick() + v37;
        end;
        if tick() >= v52.current then
            v51(true);
        end;
    end;
    local function _() --[[ Line: 236 ]] --[[ Name: onMouseLeave ]]
        -- upvalues: v28 (copy), v48 (copy), v37 (copy)
        if v28.UseInstantTooltip then
            v48.current = tick() + v37;
        end;
    end;
    local v61 = v6.useRef(v28.InitialListCanvasPosition or Vector2.new(0, 0));
    local v62 = v6.useRef(v28.InitialGridCanvasPosition or Vector2.new(0, 0));
    local _ = function(v63) --[[ Line: 245 ]] --[[ Name: createOnScrollUpdate ]]
        -- upvalues: v32 (copy), v30 (copy), v31 (copy), v28 (copy), v24 (ref), v17 (ref), v61 (copy), v23 (ref), v54 (copy), v48 (copy), v37 (copy), v51 (copy), v52 (copy), v62 (copy)
        local v64 = v32 + v30.ListItemPadding;
        local v65 = v31 + v30.GridItemPadding;
        local v66 = v28.GridItemsPerRow or 1;
        local v67 = v64 / v65 * v66;
        return function(v68, _) --[[ Line: 255 ]]
            -- upvalues: v24 (ref), v28 (ref), v63 (copy), v17 (ref), v61 (ref), v67 (copy), v23 (ref), v54 (ref), v48 (ref), v37 (ref), v51 (ref), v52 (ref), v62 (ref)
            if v24() and v28.OnScrollUpdate then
                v28.OnScrollUpdate(v68);
            end;
            if v63 == v17.Grid then
                if v24() and v28.ShouldSyncScroll then
                    v61.current = Vector2.new(0, v68.Y * v67);
                end;
                if v23() then
                    if v28.ShouldCenterTooltip then
                        v54(v68);
                    end;
                    if v28.UseInstantTooltip then
                        v48.current = tick() + v37;
                    end;
                    v51(false);
                    v52.current = tick() + 0.01;
                    return;
                end;
            elseif v63 == v17.List and v24() and v28.ShouldSyncScroll then
                v62.current = Vector2.new(0, v68.Y / v67);
            end;
        end;
    end;
    local v71 = nil;
    if v28.SelectedItemId then
        v71 = v28.SelectedItemId;
    elseif v28.SelectedItem then
        local v72 = {
            v28.SelectedItem
        };
        local v74 = v4.map(v72, function(v73) --[[ Line: 132 ]]
            if typeof(v73) == "table" then
                return v73;
            else
                return {
                    Id = v73, 
                    Loading = false, 
                    Material = v73
                };
            end;
        end)[1];
        v71 = v74.Id or v74.Material;
    end;
    local v75 = nil;
    if v22() and v28.AppliedItemId then
        v75 = v28.AppliedItemId;
    end;
    local function v87(v76, v77, v78, v79) --[[ Line: 312 ]] --[[ Name: getItemProps ]]
        -- upvalues: v22 (ref), v19 (ref), v71 (ref), v75 (ref), v18 (ref), v29 (copy), v6 (ref), v23 (ref), v53 (copy), v28 (copy), v31 (copy), v50 (copy), v46 (copy), v45 (copy), v48 (copy), v37 (copy), v49 (ref), l_RunService_0 (ref), v47 (copy), v42 (copy), v59 (copy), v55 (copy), v30 (copy)
        local l_Material_0 = v76.Material;
        local v81 = nil;
        local v82 = nil;
        local v83 = nil;
        if not v76.Loading then
            v81 = if v22() then v19(l_Material_0) == v71 else v76.Id == v71;
            if v22() then
                v82 = v19(l_Material_0) == v75;
            end;
            if l_Material_0 then
                v83 = v18(l_Material_0, v29);
            end;
        end;
        local v84 = v6.createRef();
        return {
            Applied = if v22() then v82 else nil, 
            CanvasPosition = if v23() then v53 else nil, 
            ShouldCenterTooltip = if v23() then v28.ShouldCenterTooltip else nil, 
            ContainerXBounds = if v23() then v28.ContainerXBounds else nil, 
            ContainerYBounds = if v23() then v28.ContainerYBounds else nil, 
            CustomPreview = if v28.CustomPreviews then v28.CustomPreviews[l_Material_0] else nil, 
            InitialDistance = v28.InitialDistance, 
            GridItemSize = if v23() then v31 else nil, 
            HoverEffectsEnabled = if v23() then v50 else nil, 
            InstantTooltipEnabled = if v23() then v46 else nil, 
            LayoutOrder = v77, 
            Loading = v76.Loading, 
            Material = l_Material_0, 
            MaterialPreviewGeometryType = v28.MaterialPreviewGeometryType, 
            OnClick = function() --[[ Line: 351 ]] --[[ Name: OnClick ]]
                -- upvalues: v22 (ref), v28 (ref), v45 (ref), v76 (copy), v84 (copy)
                if v22() and v28.OnSnapshotTaken then
                    v45();
                end;
                if v28.OnClick then
                    v28.OnClick(v76);
                end;
                if not v22() and v28.OnSnapshotTaken then
                    local l_status_1, l_result_1 = pcall(function() --[[ Line: 362 ]]
                        -- upvalues: v84 (ref)
                        return v84:getValue():CaptureSnapshotAsync();
                    end);
                    if l_status_1 then
                        v28.OnSnapshotTaken(l_result_1);
                        return;
                    else
                        warn("Material Grid failed to get temporary image from viewport frame");
                    end;
                end;
            end, 
            OnMouseEnter = function() --[[ Line: 374 ]] --[[ Name: OnMouseEnter ]]
                -- upvalues: v23 (ref), v28 (ref), v48 (ref), v37 (ref), v46 (ref), v49 (ref), l_RunService_0 (ref), v47 (ref), v22 (ref), v42 (ref), l_Material_0 (copy), v76 (copy)
                if v23() and v28.UseInstantTooltip then
                    v48.current = tick() + v37;
                    if v46 then
                        if v49 then
                            v49:Disconnect();
                            v49 = nil;
                        end;
                        v49 = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 208 ]]
                            -- upvalues: v48 (ref), v49 (ref), v47 (ref)
                            if tick() >= v48.current then
                                if v49 then
                                    v49:Disconnect();
                                    v49 = nil;
                                end;
                                v47(false);
                            end;
                        end);
                    end;
                end;
                if v22() and v28.OnSnapshotTaken then
                    v42(l_Material_0);
                end;
                if v28.OnMouseEnter then
                    v28.OnMouseEnter(v76);
                end;
            end, 
            OnMouseLeave = function() --[[ Line: 388 ]] --[[ Name: OnMouseLeave ]]
                -- upvalues: v23 (ref), v28 (ref), v48 (ref), v37 (ref), v76 (copy)
                if v23() and v28.UseInstantTooltip then
                    v48.current = tick() + v37;
                end;
                if v28.OnMouseLeave then
                    v28.OnMouseLeave(v76);
                end;
            end, 
            OnRenderChildren = v28.OnRenderItemChildren and function() --[[ Line: 398 ]]
                -- upvalues: v28 (ref), v76 (copy)
                return v28.OnRenderItemChildren(v76);
            end or nil, 
            OnRightClick = function() --[[ Line: 402 ]] --[[ Name: OnRightClick ]]
                -- upvalues: v28 (ref), v76 (copy)
                if v28.OnRightClick then
                    v28.OnRightClick(v76);
                end;
            end, 
            OnMouseMoved = if v23() then v59 else nil, 
            OnTooltipShown = if v23() then v55 else nil, 
            Position = v78, 
            Selected = v81, 
            ShowGridLabels = v28.ShowGridLabels, 
            Size = v79, 
            Style = v30, 
            Text = v83, 
            TooltipDelay = if v23() then v37 else nil, 
            ref = if v22() then nil else v84
        };
    end;
    local function v88() --[[ Line: 420 ]] --[[ Name: renderDummyViewport ]]
        -- upvalues: v6 (ref), l_Pane_0 (ref), v3 (ref), v41 (copy), l_prioritize_0 (ref), v28 (copy), v30 (copy), l_Items_0 (copy)
        return v6.createElement(l_Pane_0, {}, {
            v6.createElement(v3, {
                Static = true, 
                Transparent = true, 
                Material = v41, 
                Size = l_prioritize_0(v28.SnapshotSize, v30.SnapshotSize), 
                BackgroundColor = v30.GridItemBackgroundColor, 
                MeshPartBorderThickness = v28.SnapshotBorderThickness, 
                ref = l_Items_0
            }), 
            v6.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 1), 
                BackgroundColor3 = v30.BackgroundColor
            })
        });
    end;
    local function v100() --[[ Line: 438 ]] --[[ Name: renderGrid ]]
        -- upvalues: v6 (ref), l_Grid_0 (ref), v21 (ref), v28 (copy), v24 (ref), v62 (copy), v15 (ref), v30 (copy), v31 (copy), v40 (copy), v87 (copy), v23 (ref), v17 (ref), v32 (copy), v61 (copy), v54 (copy), v48 (copy), v37 (copy), v51 (copy), v52 (copy)
        local l_createElement_0 = v6.createElement;
        local l_l_Grid_0_0 = l_Grid_0;
        local v91 = {
            AutomaticSize = if v21() then v28.AutomaticSize else nil, 
            InitialCanvasPosition = if v24() then v62.current else nil, 
            CellComponent = v15, 
            CellGroups = v28.CellGroups, 
            CellGroupHeader = v28.CellGroupHeader, 
            CellPadding = UDim2.fromOffset(v30.GridItemPadding, v30.GridItemPadding), 
            CellSize = UDim2.fromOffset(v31, v31), 
            Cells = v40, 
            GetCellProps = v87
        };
        local v92;
        if v23() or v24() then
            local l_Grid_1 = v17.Grid;
            local v94 = v32 + v30.ListItemPadding;
            local v95 = v31 + v30.GridItemPadding;
            local v96 = v28.GridItemsPerRow or 1;
            local v97 = v94 / v95 * v96;
            v92 = function(v98, _) --[[ Line: 255 ]]
                -- upvalues: v24 (ref), v28 (ref), l_Grid_1 (copy), v17 (ref), v61 (ref), v97 (copy), v23 (ref), v54 (ref), v48 (ref), v37 (ref), v51 (ref), v52 (ref), v62 (ref)
                if v24() and v28.OnScrollUpdate then
                    v28.OnScrollUpdate(v98);
                end;
                if l_Grid_1 == v17.Grid then
                    if v24() and v28.ShouldSyncScroll then
                        v61.current = Vector2.new(0, v98.Y * v97);
                    end;
                    if v23() then
                        if v28.ShouldCenterTooltip then
                            v54(v98);
                        end;
                        if v28.UseInstantTooltip then
                            v48.current = tick() + v37;
                        end;
                        v51(false);
                        v52.current = tick() + 0.01;
                        return;
                    end;
                elseif l_Grid_1 == v17.List and v24() and v28.ShouldSyncScroll then
                    v62.current = Vector2.new(0, v98.Y / v97);
                end;
            end;
        else
            v92 = nil;
        end;
        v91.OnScrollUpdate = v92;
        v91.ScrollingDirection = if v21() then v28.ScrollingDirection else nil;
        return l_createElement_0(l_l_Grid_0_0, v91);
    end;
    local function v112() --[[ Line: 456 ]] --[[ Name: renderList ]]
        -- upvalues: v6 (ref), l_List_0 (ref), v21 (ref), v28 (copy), v24 (ref), v61 (copy), v87 (copy), v17 (ref), v32 (copy), v30 (copy), v31 (copy), v23 (ref), v54 (copy), v48 (copy), v37 (copy), v51 (copy), v52 (copy), v62 (copy), v16 (ref), v40 (copy)
        local l_createElement_1 = v6.createElement;
        local l_l_List_0_0 = l_List_0;
        local v103 = {
            AutomaticSize = if v21() then v28.AutomaticSize else nil, 
            InitialCanvasPosition = if v24() then v61.current else nil, 
            GetRowProps = v87
        };
        local v104;
        if v24() then
            local l_List_1 = v17.List;
            local v106 = v32 + v30.ListItemPadding;
            local v107 = v31 + v30.GridItemPadding;
            local v108 = v28.GridItemsPerRow or 1;
            local v109 = v106 / v107 * v108;
            v104 = function(v110, _) --[[ Line: 255 ]]
                -- upvalues: v24 (ref), v28 (ref), l_List_1 (copy), v17 (ref), v61 (ref), v109 (copy), v23 (ref), v54 (ref), v48 (ref), v37 (ref), v51 (ref), v52 (ref), v62 (ref)
                if v24() and v28.OnScrollUpdate then
                    v28.OnScrollUpdate(v110);
                end;
                if l_List_1 == v17.Grid then
                    if v24() and v28.ShouldSyncScroll then
                        v61.current = Vector2.new(0, v110.Y * v109);
                    end;
                    if v23() then
                        if v28.ShouldCenterTooltip then
                            v54(v110);
                        end;
                        if v28.UseInstantTooltip then
                            v48.current = tick() + v37;
                        end;
                        v51(false);
                        v52.current = tick() + 0.01;
                        return;
                    end;
                elseif l_List_1 == v17.List and v24() and v28.ShouldSyncScroll then
                    v62.current = Vector2.new(0, v110.Y / v109);
                end;
            end;
        else
            v104 = nil;
        end;
        v103.OnScrollUpdate = v104;
        v103.RowComponent = v16;
        v103.RowHeight = v32;
        v103.Rows = v40;
        v103.ScrollingDirection = if v21() then v28.ScrollingDirection else nil;
        return l_createElement_1(l_l_List_0_0, v103);
    end;
    if v22() then
        return v6.createElement(l_Pane_0, {
            AutomaticSize = if v21() then v28.AutomaticSize else nil, 
            BackgroundColor = v30.BackgroundColor, 
            LayoutOrder = v28.LayoutOrder, 
            OnRightClick = function() --[[ Line: 476 ]] --[[ Name: OnRightClick ]]
                -- upvalues: v28 (copy)
                if v28.OnRightClick then
                    v28.OnRightClick();
                end;
            end, 
            Padding = if v28.Padding then v33 else if v36 == v17.Grid then v34 else v35, 
            Size = v28.Size
        }, {
            DummyViewport = if v28.OnSnapshotTaken then v88() else nil, 
            Grid = if v36 == v17.Grid then v100() else nil, 
            List = if v36 == v17.List then v112() else nil
        });
    else
        return v6.createElement(l_Pane_0, {
            AutomaticSize = if v21() then v28.AutomaticSize else nil, 
            BackgroundColor = v30.BackgroundColor, 
            LayoutOrder = v28.LayoutOrder, 
            OnRightClick = function() --[[ Line: 493 ]] --[[ Name: OnRightClick ]]
                -- upvalues: v28 (copy)
                if v28.OnRightClick then
                    v28.OnRightClick();
                end;
            end, 
            Padding = v33, 
            Size = v28.Size
        }, {
            Grid = if v36 == v17.Grid then v100() else nil, 
            List = if v36 == v17.List then v112() else nil
        });
    end;
end;
return MaterialGrid;