local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_join_0 = v3.join;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_joinTags_0 = v4.Styling.joinTags;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_DragListener_0 = l_UI_0.DragListener;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v16 = require(l_Components_0.Line);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v18 = require(l_Thunks_0.SetOverride);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v20 = require(l_Util_0.Constants);
local v21 = require(l_Util_0.findInterval);
local v22 = require(script.Parent.styles);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v24 = {
    Grid = 1, 
    Axis = 2, 
    Dot = 3, 
    Trail = 4, 
    Cursor = 5
};
local v25 = v1.PureComponent:extend("BlendBase");
local function _(v26) --[[ Line: 58 ]] --[[ Name: getPosition ]]
    if not v26.LayerData then
        return nil;
    elseif v26.Overrides and v26.Overrides.targetPosition then
        return v26.Overrides.targetPosition;
    elseif v26.LayerData and v26.LayerData.props then
        return v26.LayerData.props.targetPosition;
    else
        return nil;
    end;
end;
v25.init = function(v28) --[[ Line: 74 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v22 (copy), v21 (copy)
    v28.dragArea = v1.createRef();
    v28.cursor = v1.createRef();
    v28.state = {};
    v28.onCanvasAbsoluteSizeChanged = function(v29) --[[ Line: 80 ]]
        -- upvalues: v28 (copy)
        local l_AbsoluteSize_0 = v29.AbsoluteSize;
        if not v28.state.size or l_AbsoluteSize_0 ~= v28.state.size then
            v28:setState({
                size = l_AbsoluteSize_0
            });
        end;
    end;
    v28.resetOverride = function() --[[ Line: 87 ]]
        -- upvalues: v28 (copy)
        local l_LayerData_0 = v28.props.LayerData;
        v28.props.SetOverride(l_LayerData_0.id, {
            "targetPosition"
        }, nil);
    end;
    v28.onDragStarted = function(_, v33) --[[ Line: 93 ]]
        -- upvalues: v22 (ref), v28 (copy)
        local l_v22_Attribute_0 = v22:GetAttribute("DotSize");
        if v33.UserInputType == Enum.UserInputType.MouseButton1 then
            v28:setState({
                dragging = true, 
                delta = v28.cursor.current.AbsolutePosition + 0.5 * Vector2.new(l_v22_Attribute_0, l_v22_Attribute_0) - Vector2.new(v33.Position.X, v33.Position.Y)
            });
        end;
    end;
    v28.onDragMoved = function(v35) --[[ Line: 108 ]]
        -- upvalues: v28 (copy)
        local l_props_0 = v28.props;
        local l_state_0 = v28.state;
        local l_LayerData_1 = l_props_0.LayerData;
        local v39 = Vector2.new(v35.Position.X, v35.Position.Y) + v28.state.delta;
        local l_current_0 = v28.dragArea.current;
        local l_AbsolutePosition_0 = l_current_0.AbsolutePosition;
        local l_AbsoluteSize_1 = l_current_0.AbsoluteSize;
        local v43 = (v39 - l_AbsolutePosition_0) / l_AbsoluteSize_1;
        v43 = Vector2.new(math.clamp(v43.X, 0, 1), if v28.props.Show2D then math.clamp(v43.Y, 0, 1) else 0.5);
        v28.cursor.current.Position = UDim2.fromScale(v43.X, v43.Y);
        local v44 = Vector2.new(v43.X, 1 - v43.Y);
        local v45 = l_state_0.min + v44 * (l_state_0.max - l_state_0.min);
        l_props_0.SetOverride(l_LayerData_1.id, {
            "targetPosition"
        }, if v28.props.Show2D then v45 else v45.X);
    end;
    v28.onDragEnded = function() --[[ Line: 128 ]]
        -- upvalues: v28 (copy)
        v28:setState({
            dragging = false
        });
    end;
    v28.make2dPosition = function(v46) --[[ Line: 134 ]]
        -- upvalues: v28 (copy)
        if v28.props.Show2D then
            if typeof(v46) == "number" then
                return Vector2.new(v46, 0);
            elseif typeof(v46) == "Vector2" then
                return v46;
            elseif typeof(v46) == "Vector3" or type(v46) == "userdata" or type(v46) == "table" then
                return Vector2.new(v46.X or 0, v46.Y or 0);
            else
                return Vector2.new();
            end;
        elseif typeof(v46) == "number" then
            return Vector2.new(v46, 0.5);
        elseif typeof(v46) == "Vector2" or typeof(v46) == "Vector3" or type(v46) == "userdata" or type(v46) == "table" then
            return Vector2.new(v46.X or 0, 0.5);
        else
            return Vector2.new(0, 0.5);
        end;
    end;
    v28.updateMinMax = function(v47, v48, v49) --[[ Line: 162 ]]
        -- upvalues: v28 (copy)
        local v50 = v28.make2dPosition(v47);
        return Vector2.new(math.min(v50.X, v48.X), (math.min(v50.Y, v48.Y))), Vector2.new(math.max(v50.X, v49.X), (math.max(v50.Y, v49.Y)));
    end;
    v28.makeTooltipText = function(v51, v52) --[[ Line: 168 ]]
        -- upvalues: v28 (copy)
        local v53 = if v51 then v51 .. "\n" else "";
        if v28.props.Show2D then
            return v53 .. string.format("(%.2f, %.2f)", v52.X, v52.Y);
        else
            return v53 .. string.format("(%.2f)", v52.X);
        end;
    end;
    v28.calculateGrid = function() --[[ Line: 178 ]]
        -- upvalues: v28 (copy), v21 (ref)
        local l_state_1 = v28.state;
        local v55 = l_state_1.max - l_state_1.min;
        local v56 = Vector2.new(v21(v55.X), v21(v55.Y));
        return Vector2.new(math.floor(l_state_1.min.X / v56.X) * v56.X, math.floor(l_state_1.min.Y / v56.Y) * v56.Y), Vector2.new(math.ceil(l_state_1.max.X / v56.X) * v56.X, math.ceil(l_state_1.max.Y / v56.Y) * v56.Y), v56;
    end;
    v28:calculateExtents(true);
end;
v25.createDots = function(v57) --[[ Line: 191 ]] --[[ Name: createDots ]]
    -- upvalues: v1 (copy), v24 (copy), l_Tooltip_0 (copy), l_joinTags_0 (copy), l_DragListener_0 (copy)
    local l_props_1 = v57.props;
    local l_state_2 = v57.state;
    local l_LayerData_2 = l_props_1.LayerData;
    local l_dragging_0 = l_state_2.dragging;
    local v62 = {};
    if l_LayerData_2 then
        local v63 = l_LayerData_2.children or {};
        for v64, v65 in v63 do
            local v66 = "Dot_" .. (v65.name or tostring(v64));
            local v67 = if v65 and v65.linkData then v65.linkData.position else nil;
            if v67 then
                local v68 = v57.make2dPosition(v67);
                local v69 = (v68 - l_state_2.min) / (l_state_2.max - l_state_2.min);
                v62[v66] = v1.createElement("ImageButton", {
                    LayoutOrder = 4, 
                    Position = UDim2.fromScale(v69.X, 1 - v69.Y), 
                    ZIndex = v24.Dot, 
                    [v1.Tag] = "Dot"
                }, {
                    Tooltip = if not l_dragging_0 then v1.createElement(l_Tooltip_0, {
                        Text = v57.makeTooltipText(v65.name, v68)
                    }) else nil
                });
            end;
        end;
        if l_LayerData_2.props and l_LayerData_2.props.targetPosition then
            v63 = l_props_1.Overrides and l_props_1.Overrides.targetPosition or nil;
            local v70 = v63 or l_LayerData_2.props.targetPosition;
            local v71 = v57.make2dPosition(v70);
            local v72 = (v71 - l_state_2.min) / (l_state_2.max - l_state_2.min);
            v62.cursor = v1.createElement("ImageButton", {
                LayoutOrder = 4, 
                Position = UDim2.fromScale(v72.X, 1 - v72.Y), 
                ZIndex = v24.Cursor, 
                ref = v57.cursor, 
                [v1.Event.InputBegan] = v57.onDragStarted, 
                [v1.Tag] = l_joinTags_0("Dot", "Cursor", v63 and "Override" or nil)
            }, if l_dragging_0 then {
                DragListener = v1.createElement(l_DragListener_0, {
                    OnDragMoved = v57.onDragMoved, 
                    OnDragEnded = v57.onDragEnded
                }), 
                Tooltip = v1.createElement(l_Tooltip_0, {
                    Text = v57.makeTooltipText(nil, v71)
                })
            } else nil);
        end;
    end;
    return v62;
end;
v25.createTrail = function(v73) --[[ Line: 260 ]] --[[ Name: createTrail ]]
    -- upvalues: v20 (copy), v1 (copy), v16 (copy), v24 (copy)
    local l_props_2 = v73.props;
    local l_state_3 = v73.state;
    if not l_props_2.FrameBuffer or not l_props_2.ShowTrail or l_state_3.dragging or l_props_2.Overrides and l_props_2.Overrides.targetPosition then
        return {};
    else
        local v76 = {};
        local v77 = nil;
        for v78 = 0, v20.BLEND_TRAIL_LENGTH do
            local v79 = l_props_2.FrameBuffer[(l_props_2.HistoryFrame or 1) + v78];
            local v80 = v79 and v79.layerMap and v79.layerMap[l_props_2.LayerData.id];
            local v81 = v80 and v80.props.targetPosition;
            if v81 and v77 and l_state_3.size then
                local v82 = (v73.make2dPosition(v81) - l_state_3.min) / (l_state_3.max - l_state_3.min);
                local v83 = Vector2.new(l_state_3.size.X * v82.X, l_state_3.size.Y * (1 - v82.Y));
                local v84 = (v73.make2dPosition(v77) - l_state_3.min) / (l_state_3.max - l_state_3.min);
                local v85 = Vector2.new(l_state_3.size.X * v84.X, l_state_3.size.Y * (1 - v84.Y));
                v76["Trail" .. tostring(v78)] = v1.createElement(v16, {
                    From = v85, 
                    To = v83, 
                    ZIndex = v24.Trail, 
                    Color = Color3.new(1, 0, 0), 
                    Transparency = v78 / v20.BLEND_TRAIL_LENGTH, 
                    [v1.Tag] = "Trail"
                });
            end;
            v77 = v81;
        end;
        return v76;
    end;
end;
v25.createAxes = function(v86) --[[ Line: 305 ]] --[[ Name: createAxes ]]
    -- upvalues: v1 (copy), l_Pane_0 (copy), v24 (copy)
    local l_props_3 = v86.props;
    local l_state_4 = v86.state;
    local v89 = {};
    local v90, v91, v92 = v86.calculateGrid();
    local v93 = 1;
    if l_props_3.Show2D then
        for v94 = v90.Y, v91.Y, v92.Y do
            local v95 = string.format("Y%d", v93);
            v93 = v93 + 1;
            v89[v95] = v1.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(1, 0, 0, 1), 
                Position = UDim2.fromScale(0, 1 - (v94 - l_state_4.min.Y) / (l_state_4.max.Y - l_state_4.min.Y)), 
                ZIndex = if v94 == 0 then v24.Axis else v24.Grid, 
                [v1.Tag] = v94 == 0 and "Axis" or "Grid"
            });
        end;
    end;
    v93 = 1;
    for v96 = v90.X, v91.X, v92.X do
        local v97 = string.format("X%d", v93);
        v93 = v93 + 1;
        v89[v97] = v1.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(0, 1, 1, 0), 
            Position = UDim2.fromScale((v96 - l_state_4.min.X) / (l_state_4.max.X - l_state_4.min.X), 0), 
            ZIndex = if v96 == 0 then v24.Axis else v24.Grid, 
            [v1.Tag] = v96 == 0 and "Axis" or "Grid"
        });
    end;
    return v89;
end;
v25.calculateExtents = function(v98, v99) --[[ Line: 345 ]] --[[ Name: calculateExtents ]]
    local l_props_4 = v98.props;
    local l_LayerData_3 = l_props_4.LayerData;
    local v102 = not v99 and v98.state.min or Vector2.new(1e999, l_props_4.Show2D and 1e999 or 0);
    local v103 = not v99 and v98.state.max or Vector2.new(-1e999, l_props_4.Show2D and -1e999 or 1);
    if l_LayerData_3 then
        local v104 = if not l_props_4.LayerData then nil else if l_props_4.Overrides and l_props_4.Overrides.targetPosition then l_props_4.Overrides.targetPosition else if l_props_4.LayerData and l_props_4.LayerData.props then l_props_4.LayerData.props.targetPosition else nil;
        if v104 then
            local v105, v106 = v98.updateMinMax(v104, v102, v103);
            v102 = v105;
            v103 = v106;
        end;
        local v107 = l_LayerData_3.children or {};
        for _, v109 in v107 do
            if v109.linkData and v109.linkData.position then
                local v110, v111 = v98.updateMinMax(v109.linkData.position, v102, v103);
                v102 = v110;
                v103 = v111;
            end;
        end;
    end;
    if v102 ~= v98.state.min or v103 ~= v98.state.max then
        v98:setState({
            min = v102, 
            max = v103
        });
    end;
end;
v25.didUpdate = function(v112, v113) --[[ Line: 374 ]] --[[ Name: didUpdate ]]
    local l_props_5 = v112.props;
    if l_props_5.LayerData ~= v113.LayerData then
        v112:calculateExtents(not v113.LayerData or l_props_5.LayerData and l_props_5.LayerData.id ~= v113.LayerData.id);
    end;
end;
v25.didMount = function(v115) --[[ Line: 382 ]] --[[ Name: didMount ]]
    v115:calculateExtents(true);
end;
v25.render = function(v116) --[[ Line: 386 ]] --[[ Name: render ]]
    -- upvalues: l_join_0 (copy), v1 (copy), l_Pane_0 (copy), v24 (copy)
    local l_props_6 = v116.props;
    local v118 = l_join_0(v116:createDots(), v116:createTrail());
    v118.Grid = v1.createElement(l_Pane_0, {
        ZIndex = v24.Grid
    }, v116:createAxes());
    if l_props_6.Overrides and l_props_6.Overrides.targetPosition then
        v118.Reset = v1.createElement("ImageButton", {
            [v1.Event.Activated] = v116.resetOverride
        });
    end;
    return v1.createElement(l_Pane_0, {
        [v1.Tag] = "BlendBase"
    }, {
        Canvas = v1.createElement(l_Pane_0, {
            [v1.Change.AbsoluteSize] = v116.onCanvasAbsoluteSizeChanged, 
            [v1.Tag] = l_props_6.Show2D and "Blend2D" or "Blend1D", 
            ref = v116.dragArea
        }, v118)
    });
end;
v25 = l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0
})(v25);
return (v2.connect(nil, function(v119) --[[ Line: 416 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v18 (copy)
    return {
        SetOverride = function(v120, v121, v122) --[[ Line: 418 ]] --[[ Name: SetOverride ]]
            -- upvalues: v119 (copy), v18 (ref)
            v119(v18(v120, v121, v122));
        end
    };
end)(v25));