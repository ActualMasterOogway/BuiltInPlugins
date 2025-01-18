local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = if l_Parent_0.Parent:FindFirstChild("Otter") then require(l_Parent_0.Parent.Otter) else nil;
local v5 = require(l_Parent_0.Util);
local v6 = require(l_Parent_0.Util.Typecheck);
local l_isInputMainPress_0 = v5.isInputMainPress;
local l_prioritize_0 = v5.prioritize;
local v9 = require(l_Parent_0.UI.Components.Pane);
local v10 = require(script.TileBox);
local v11 = v1.PureComponent:extend("DraggableTileList");
v6.wrap(v11, script);
v11.defaultProps = {
    ShowEmptyBoxes = false, 
    LayoutOrder = 1, 
    Capacity = 10, 
    AnimationSpeed = 10, 
    Position = UDim2.new(0, 0, 0, 0)
};
v11.init = function(v12) --[[ Line: 72 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), l_isInputMainPress_0 (copy), v4 (copy), v9 (copy), v10 (copy)
    v12:setState({
        isDragging = false, 
        isAnimating = false, 
        dragPositionY = 0
    });
    v12.draggingIndex = 0;
    v12.blankIndex = 0;
    v12.clickOffsetY = 0;
    v12.frameRef = v1.createRef();
    v12.numBoxesToDisplay = 0;
    v12.otterMotors = {};
    v12.otterMotorBindings = {};
    v12.updateOtterMotorBindings = {};
    v12.tileList = {};
    v12.onInputBegan = function(_, v14) --[[ Line: 88 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v12 (copy)
        if l_isInputMainPress_0(v14) then
            local l_Y_0 = v14.Position.Y;
            local v16 = l_Y_0 - v12.getAbsoluteY();
            v12.draggingIndex = v12.getClosestBox(l_Y_0);
            v12.clickOffsetY = v12.getOffset(l_Y_0, v12.draggingIndex);
            v12.blankIndex = v12.draggingIndex;
            if v12.draggingIndex > 0 and v12.draggingIndex <= #v12.tileList then
                v12:setState({
                    isDragging = true, 
                    dragPositionY = v16
                });
            end;
        end;
    end;
    v12.onInputEnded = function(_, v18) --[[ Line: 104 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v12 (copy)
        if l_isInputMainPress_0(v18) then
            if v12.draggingIndex ~= v12.blankIndex then
                v12.onOrderChanged(v12.draggingIndex, v12.blankIndex);
                if v12.props.OnOrderChanged then
                    v12.props.OnOrderChanged(v12.draggingIndex, v12.blankIndex);
                end;
                v12.destroyMotors();
            end;
            v12:setState({
                isDragging = false
            });
        end;
    end;
    v12.onInputChanged = function(_, v20) --[[ Line: 119 ]]
        -- upvalues: v12 (copy)
        local l_state_0 = v12.state;
        if v20.UserInputType == Enum.UserInputType.MouseMovement and l_state_0.isDragging then
            local l_Y_1 = v20.Position.Y;
            local v23 = l_Y_1 - v12.getAbsoluteY();
            v12.blankIndex = v12.getClosestBox(l_Y_1);
            v12:setState({
                dragPositionY = v23
            });
        end;
    end;
    v12.onOrderChanged = function(v24, v25) --[[ Line: 131 ]]
        -- upvalues: v12 (copy)
        local v26 = table.remove(v12.tileList, v24);
        table.insert(v12.tileList, v25, v26);
    end;
    v12.getOffset = function(v27, v28) --[[ Line: 136 ]]
        -- upvalues: v12 (copy)
        if not v12.frameRef then
            return 0;
        else
            local v29 = v12.frameRef:getValue();
            if v29 then
                local l_numBoxesToDisplay_0 = v12.numBoxesToDisplay;
                local l_Y_2 = v29.AbsoluteSize.Y;
                local v32 = v12.getAbsoluteY();
                return l_Y_2 * (v28 - 1) / l_numBoxesToDisplay_0 - (v27 - v32);
            else
                return 0;
            end;
        end;
    end;
    v12.getClosestBox = function(v33) --[[ Line: 150 ]]
        -- upvalues: v12 (copy)
        if not v12.frameRef then
            return 0;
        else
            local v34 = v12.frameRef:getValue();
            if v34 then
                local l_numBoxesToDisplay_1 = v12.numBoxesToDisplay;
                local l_Y_3 = v34.AbsoluteSize.Y;
                return math.floor((v33 - v12.getAbsoluteY()) / (l_Y_3 / l_numBoxesToDisplay_1)) + 1;
            else
                return 0;
            end;
        end;
    end;
    v12.getAbsoluteY = function() --[[ Line: 164 ]]
        -- upvalues: v12 (copy)
        if not v12.frameRef then
            return 0;
        else
            local v37 = v12.frameRef:getValue();
            if v37 then
                return v37.AbsolutePosition.Y;
            else
                return 0;
            end;
        end;
    end;
    v12.getMaxY = function() --[[ Line: 175 ]]
        -- upvalues: v12 (copy)
        if not v12.frameRef then
            return 0;
        else
            local v38 = v12.frameRef:getValue();
            if v38 then
                local v39 = math.min(#v12.tileList, v12.props.Capacity);
                return v38.AbsoluteSize.Y * (v39 - 1) / v12.numBoxesToDisplay;
            else
                return 0;
            end;
        end;
    end;
    v12.destroyMotors = function() --[[ Line: 188 ]]
        -- upvalues: v12 (copy)
        if v12.otterMotors then
            for _, v41 in ipairs(v12.otterMotors) do
                v41:destroy();
            end;
        end;
        v12.otterMotors = {};
        v12.updateOtterMotorBindings = {};
        v12.otterMotorBindings = {};
    end;
    v12.createOtterMotors = function(v42) --[[ Line: 199 ]]
        -- upvalues: v12 (copy), v4 (ref), v1 (ref)
        if not next(v12.otterMotors) or #v12.otterMotors ~= v12.maxDragIndex then
            v12.destroyMotors();
            for v43 = 1, v42 do
                if #v12.otterMotors ~= v12.numBoxesToDisplay then
                    v12.otterMotors[v43] = v4.createSingleMotor((v43 - 1) / v12.numBoxesToDisplay);
                    local l_otterMotorBindings_0 = v12.otterMotorBindings;
                    local l_updateOtterMotorBindings_0 = v12.updateOtterMotorBindings;
                    local v46, v47 = v1.createBinding((v43 - 1) / v12.numBoxesToDisplay);
                    l_otterMotorBindings_0[v43] = v46;
                    l_updateOtterMotorBindings_0[v43] = v47;
                    v12.otterMotors[v43]:onStep(function(v48) --[[ Line: 209 ]]
                        -- upvalues: v12 (ref), v43 (copy)
                        v12.updateOtterMotorBindings[v43](v48);
                        v12:setState({
                            isAnimating = true
                        });
                    end);
                    v12.otterMotors[v43]:onComplete(function() --[[ Line: 215 ]]
                        -- upvalues: v12 (ref)
                        v12:setState({
                            isAnimating = false
                        });
                    end);
                else
                    break;
                end;
            end;
        end;
    end;
    v12.isDragInBounds = function() --[[ Line: 224 ]]
        -- upvalues: v12 (copy)
        return v12.state.isDragging and v12.draggingIndex <= v12.maxDragIndex and v12.draggingIndex > 0;
    end;
    v12.getTileProps = function(v49) --[[ Line: 228 ]]
        -- upvalues: v12 (copy)
        return v12:getDefaultTileProps(v49);
    end;
    v12.createBoxContainer = function(v50, v51, v52, v53) --[[ Line: 232 ]]
        -- upvalues: v12 (copy), v1 (ref), v9 (ref), v10 (ref)
        local l_props_0 = v12.props;
        local l_TileComponent_0 = l_props_0.TileComponent;
        local v56 = (l_props_0.GetTileProps or v12.getTileProps)(v53);
        return v1.createElement(v9, {
            Size = UDim2.new(1, 0, 1 / v12.numBoxesToDisplay, 0), 
            Position = v50, 
            LayoutOrder = v52, 
            ZIndex = v51
        }, {
            BoxContent = v1.createElement(l_TileComponent_0 or v10, v56)
        });
    end;
    v12.updateMotorAndGetPosition = function(v57, v58, v59) --[[ Line: 247 ]]
        -- upvalues: v12 (copy), v4 (ref)
        local v60 = UDim2.new(0, 0, (v58 - 1) / v12.numBoxesToDisplay, 0);
        if v4 then
            v12.otterMotors[v57]:setGoal(v4.spring((v58 - 1) / v12.numBoxesToDisplay, {
                frequency = v59
            }));
            v60 = UDim2.new(0, 0, v12.otterMotorBindings[v57]:getValue(), 0);
        end;
        return v60;
    end;
    v12.doUpdate = function(v61, v62) --[[ Line: 256 ]]
        -- upvalues: v12 (copy)
        local v63 = false;
        if v61 and v62 and #v61 ~= #v62 then
            v63 = true;
        else
            local v64 = {};
            for _, v66 in ipairs(v61) do
                v64[v66] = true;
            end;
            for _, v68 in ipairs(v62) do
                if not v64[v68] then
                    v63 = true;
                    break;
                end;
            end;
        end;
        if v63 then
            v12.tileList = {};
            for v69, v70 in ipairs(v62) do
                local v71 = v70.LayoutOrder or v69;
                v12.tileList[v71] = v70;
            end;
        end;
    end;
    v12.doUpdate(v12.tileList, v12.props.TileList);
end;
v11.getDefaultTileProps = function(v72, v73) --[[ Line: 287 ]] --[[ Name: getDefaultTileProps ]]
    return {
        Tile = v73 or {
            Text = ""
        }, 
        Style = v72.props.Stylizer
    };
end;
v11.willUnmount = function(v74) --[[ Line: 294 ]] --[[ Name: willUnmount ]]
    v74.destroyMotors();
end;
v11.willUpdate = function(v75, v76) --[[ Line: 298 ]] --[[ Name: willUpdate ]]
    v75.doUpdate(v75.tileList, v76.TileList);
end;
v11.render = function(v77) --[[ Line: 302 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), l_prioritize_0 (copy), v1 (copy)
    if not v4 then
        print("Error: Otter not found, disabling animations. Please re-run manage_libraries.py");
    end;
    local l_props_1 = v77.props;
    local l_state_1 = v77.state;
    local l_AnchorPoint_0 = l_props_1.AnchorPoint;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local v82 = l_prioritize_0(l_props_1.Size, UDim2.new(1, 0, 1, 0));
    local l_Position_0 = l_props_1.Position;
    local l_ShowEmptyBoxes_0 = l_props_1.ShowEmptyBoxes;
    local v85 = math.max(1, l_props_1.Capacity);
    local l_AnimationSpeed_0 = l_props_1.AnimationSpeed;
    local l_dragPositionY_0 = l_state_1.dragPositionY;
    local l_blankIndex_0 = v77.blankIndex;
    v77.numBoxesToDisplay = v85;
    v77.maxDragIndex = v85;
    if #v77.tileList < v85 then
        if not l_ShowEmptyBoxes_0 then
            v77.numBoxesToDisplay = #v77.tileList;
        end;
        v77.maxDragIndex = #v77.tileList;
    end;
    if #v77.tileList > 0 then
        l_blankIndex_0 = math.clamp(l_blankIndex_0, 1, #v77.tileList);
    end;
    if v4 then
        v77.createOtterMotors(#v77.tileList);
    end;
    local v89 = {};
    local v90 = 1;
    for v91, v92 in ipairs(v77.tileList) do
        if #v89 ~= v77.numBoxesToDisplay then
            if v77.isDragInBounds() then
                if v91 == v77.draggingIndex then
                    local v93 = math.clamp(l_dragPositionY_0 + v77.clickOffsetY, 0, (v77.getMaxY()));
                    table.insert(v89, (v77.createBoxContainer(UDim2.new(0, 0, 0, v93), 100, 1, v92)));
                else
                    if v90 == l_blankIndex_0 then
                        v90 = v90 + 1;
                    end;
                    local v94 = v77.updateMotorAndGetPosition(v91, v90, l_AnimationSpeed_0);
                    table.insert(v89, (v77.createBoxContainer(v94, 99, v90 + 1, v92)));
                    v90 = v90 + 1;
                end;
            else
                local v95 = v77.updateMotorAndGetPosition(v91, v91, l_AnimationSpeed_0);
                table.insert(v89, (v77.createBoxContainer(v95, 99, v91 + 1, v92)));
            end;
        else
            break;
        end;
    end;
    if #v89 < v77.numBoxesToDisplay and l_ShowEmptyBoxes_0 then
        for v96 = #v89 + 1, v77.numBoxesToDisplay do
            local v97 = UDim2.new(0, 0, (v96 - 1) / v77.numBoxesToDisplay, 0);
            table.insert(v89, (v77.createBoxContainer(v97, 99, v96 + 1, nil)));
        end;
    end;
    return v1.createElement("TextButton", {
        AnchorPoint = l_AnchorPoint_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = UDim2.new(0, v82.X.Offset, 0, v82.Y.Offset * v77.numBoxesToDisplay / v85), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        [v1.Ref] = v77.frameRef, 
        [v1.Event.InputBegan] = v77.onInputBegan, 
        [v1.Event.InputEnded] = v77.onInputEnded, 
        [v1.Event.InputChanged] = v77.onInputChanged, 
        Text = ""
    }, v89);
end;
return (l_withContext_0({
    Stylizer = v2.Stylizer
})(v11));