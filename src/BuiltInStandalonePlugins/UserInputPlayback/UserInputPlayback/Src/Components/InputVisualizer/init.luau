local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Otter);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_Pane_0 = v4.UI.Pane;
local v7 = require(l_Parent_0.Src.Components.KeyBarTile);
local l_UserInputService_0 = game:GetService("UserInputService");
local v9 = Color3.new(0, 1, 0);
local v10 = Color3.new(1, 1, 1);
local v11 = Color3.new(1, 1, 0);
local v12 = {
    [1] = v10, 
    [2] = v11
};
local v13 = {
    [Enum.UserInputType.Keyboard] = 1, 
    [Enum.UserInputType.Gamepad1] = 2, 
    [Enum.UserInputType.Gamepad2] = 2, 
    [Enum.UserInputType.Gamepad3] = 2, 
    [Enum.UserInputType.Gamepad4] = 2, 
    [Enum.UserInputType.Gamepad5] = 2, 
    [Enum.UserInputType.Gamepad6] = 2, 
    [Enum.UserInputType.Gamepad7] = 2, 
    [Enum.UserInputType.Gamepad8] = 2
};
local v14 = {
    [Enum.KeyCode.Thumbstick1] = 1, 
    [Enum.KeyCode.Thumbstick2] = 1
};
local v15 = v1.PureComponent:extend("InputVisualizer");
local v16 = 0;
local v17;
do
    local l_v16_0 = v16;
    v17 = function() --[[ Line: 112 ]]
        -- upvalues: l_v16_0 (ref)
        l_v16_0 = l_v16_0 + 1;
        return l_v16_0;
    end;
end;
v16 = function(v19, v20, v21, v22) --[[ Line: 118 ]] --[[ Name: makeCursorRingData ]]
    -- upvalues: v1 (copy), v17 (copy), v12 (copy), v2 (copy)
    local v23, v24 = v1.createBinding(UDim2.fromOffset(0, 0));
    local v25, v26 = v1.createBinding(UDim2.fromOffset(0, 0));
    local v27, v28 = v1.createBinding(0);
    return {
        id = v17(), 
        buttonId = v19, 
        color = v12[v19], 
        position = v23, 
        updatePosition = v24, 
        size = v25, 
        updateSize = v26, 
        transparency = v27, 
        image = v20, 
        zIndex = v21 or 1, 
        updateTransparency = v28, 
        motor = v2.createGroupMotor({
            size = 0, 
            transparency = v22 or 0
        })
    };
end;
local function v37(v29, v30) --[[ Line: 146 ]] --[[ Name: makeKeyTileData ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v31, v32 = v1.createBinding(UDim2.fromOffset(v29, 50));
    local v33, v34 = v1.createBinding(v30);
    local v35, v36 = v1.createBinding(v30);
    return {
        size = v31, 
        updateSize = v32, 
        backgroundTransparency = v33, 
        updateBackgroundTransparency = v34, 
        foregroundTransparency = v35, 
        updateForegroundTransparency = v36, 
        motor = v2.createGroupMotor({
            size = v29 or UDim2.new(), 
            transparency = v30 or 0
        })
    };
end;
v15.init = function(v38) --[[ Line: 164 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v16 (copy), v2 (copy), v3 (copy), l_UserInputService_0 (copy), v9 (copy), v14 (copy), v17 (copy), v37 (copy)
    v38.state = {
        visibleCursorRingIds = {}, 
        keyRows = {}
    };
    v38.cursorRings = {};
    v38.currentCursorRingsByButtonId = {};
    v38.mouseButtonIsDown = {};
    v38.connections = {};
    v38.touchMap = {};
    v38.keyTileData = {};
    local v39, v40 = v1.createBinding(UDim2.fromOffset(0, 0));
    v38.fakeCursorPosition = v39;
    v38.updateFakeCursorPosition = v40;
    v38.onMouseDown = function(v41, v42) --[[ Line: 180 ]]
        -- upvalues: v38 (copy), v16 (ref), v2 (ref), v3 (ref)
        if v38.currentCursorRingsByButtonId[v42] then
            return;
        else
            local v43 = v16(v42, "rbxasset://textures/UserInputPlaybackPlugin/Ring.png");
            table.insert(v38.cursorRings, v43);
            v43.updatePosition(UDim2.fromOffset(v41.X, v41.Y));
            v43.updateSize(UDim2.fromOffset(1, 1));
            v43.updateTransparency(0);
            v43.motor:onStep(function(v44) --[[ Line: 192 ]]
                -- upvalues: v43 (copy)
                v43.updateSize(UDim2.fromOffset(v44.size, v44.size));
                v43.updateTransparency(v44.transparency);
            end);
            v43.motor:setGoal({
                size = v2.spring(50, {
                    frequency = 1
                }), 
                transparency = v2.instant(0)
            });
            v38:setState({
                visibleCursorRingIds = v3.Dictionary.join(v38.state.visibleCursorRingIds, {
                    [v43.id] = true
                })
            });
            v38.currentCursorRingsByButtonId[v42] = v43;
            v38.mouseButtonIsDown[v42] = true;
            return;
        end;
    end;
    v38.onMouseMove = function(v45) --[[ Line: 214 ]]
        -- upvalues: v38 (copy), l_UserInputService_0 (ref)
        v38.updateFakeCursorPosition(UDim2.fromOffset(v45.X, v45.Y));
        for v46 = 1, 2 do
            if v38.currentCursorRingsByButtonId[v46] and v38.mouseButtonIsDown[v46] then
                v38.currentCursorRingsByButtonId[v46].updatePosition(UDim2.fromOffset(v45.X, v45.Y));
            end;
        end;
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceHide;
    end;
    v38.removeCursorRing = function(v47) --[[ Line: 227 ]]
        -- upvalues: v38 (copy), v3 (ref)
        if not v38.isMounted then
            return;
        else
            v38:setState({
                visibleCursorRingIds = v3.Dictionary.join(v38.state.visibleCursorRingIds, {
                    [v47.id] = false
                })
            });
            local v48 = table.find(v38.cursorRings, v47);
            assert(v48 ~= nil, "Couldn't find ring");
            table.remove(v38.cursorRings, v48);
            return;
        end;
    end;
    v38.onMouseUp = function(v49, v50) --[[ Line: 243 ]]
        -- upvalues: v38 (copy), v2 (ref)
        local v51 = v38.currentCursorRingsByButtonId[v50];
        if v51 then
            v51.updatePosition(UDim2.fromOffset(v49.X, v49.Y));
            v51.motor:setGoal({
                size = v2.spring(100, {
                    frequency = 1
                }), 
                transparency = v2.spring(1, {
                    frequency = 1
                })
            });
            v51.motor:onComplete(function() --[[ Line: 255 ]]
                -- upvalues: v38 (ref), v51 (copy)
                v38.removeCursorRing(v51);
            end);
        end;
        v38.currentCursorRingsByButtonId[v50] = nil;
        v38.mouseButtonIsDown[v50] = false;
    end;
    v38.onTouchStarted = function(v52) --[[ Line: 265 ]]
        -- upvalues: v16 (ref), v38 (copy), v2 (ref), v9 (ref)
        local l_Position_0 = v52.Position;
        local v54 = UDim2.fromOffset(l_Position_0.X, l_Position_0.Y);
        local v55 = v16(0, "rbxasset://textures/UserInputPlaybackPlugin/Ring.png", 2, 0);
        table.insert(v38.cursorRings, v55);
        v55.updatePosition(v54);
        v55.motor:onStep(function(v56) --[[ Line: 272 ]]
            -- upvalues: v55 (copy)
            v55.updateSize(UDim2.fromOffset(v56.size, v56.size));
            v55.updateTransparency(v56.transparency);
        end);
        v55.motor:setGoal({
            size = v2.spring(50, {
                frequency = 1
            }), 
            transparency = v2.instant(0)
        });
        local v57 = v16(0, "rbxasset://textures/UserInputPlaybackPlugin/TapCursor.png", 1, 1);
        table.insert(v38.cursorRings, v57);
        v57.color = v9;
        v57.updatePosition(v54);
        v57.updateTransparency(1);
        v57.updateSize(UDim2.fromOffset(64, 64));
        v57.motor:onStep(function(v58) --[[ Line: 289 ]]
            -- upvalues: v57 (copy)
            v57.updateTransparency(v58.transparency);
        end);
        v57.motor:setGoal({
            transparency = v2.spring(0, {
                frequency = 2.5
            })
        });
        local l_visibleCursorRingIds_0 = v38.state.visibleCursorRingIds;
        l_visibleCursorRingIds_0[v55.id] = true;
        l_visibleCursorRingIds_0[v57.id] = true;
        v38:setState({
            visibleCursorRingIds = l_visibleCursorRingIds_0
        });
        v38.touchMap[v52] = {
            tapImage = v57, 
            ring = v55
        };
    end;
    v38.onTouchMoved = function(v60) --[[ Line: 311 ]]
        -- upvalues: v38 (copy)
        local v61 = v38.touchMap[v60];
        if v61 then
            local l_Position_1 = v60.Position;
            local v63 = UDim2.fromOffset(l_Position_1.X, l_Position_1.Y);
            v61.tapImage.updatePosition(v63);
            v61.ring.updatePosition(v63);
        end;
    end;
    v38.onTouchEnded = function(v64) --[[ Line: 321 ]]
        -- upvalues: v38 (copy), v2 (ref)
        local v65 = v38.touchMap[v64];
        if v65 then
            v38.onTouchMoved(v64);
            v65.ring.motor:setGoal({
                size = v2.spring(100, {
                    frequency = 1
                }), 
                transparency = v2.spring(1, {
                    frequency = 1
                })
            });
            v65.ring.motor:onComplete(function() --[[ Line: 334 ]]
                -- upvalues: v38 (ref), v65 (copy)
                v38.removeCursorRing(v65.ring);
            end);
            v65.tapImage.motor:setGoal({
                transparency = v2.spring(1, {
                    frequency = 1
                })
            });
            v65.tapImage.motor:onComplete(function() --[[ Line: 343 ]]
                -- upvalues: v38 (ref), v65 (copy)
                v38.removeCursorRing(v65.tapImage);
            end);
        end;
    end;
    v38.onKeyDown = function(v66) --[[ Line: 350 ]]
        -- upvalues: v14 (ref), v38 (copy), v3 (ref), v17 (ref), v37 (ref), v2 (ref)
        if v14[v66] then
            return;
        else
            v38:setState(function(v67, _) --[[ Line: 355 ]]
                -- upvalues: v3 (ref), v17 (ref), v37 (ref), v38 (ref), v2 (ref), v66 (copy)
                local l_keyRows_0 = v67.keyRows;
                local v70 = v3.Dictionary.join(l_keyRows_0);
                local v71 = v70[1];
                if not v71 or v71.numberOfKeys >= 6 then
                    v71 = {
                        lastUpdateTime = tick(), 
                        numberOfKeys = 0, 
                        keys = {}, 
                        dataId = v17()
                    };
                    table.insert(v70, 1, v71);
                    local v72 = v37(0, 1);
                    v38.keyTileData[v71.dataId] = v72;
                    v72.updateSize(UDim2.fromOffset(50, 0));
                    local l_v72_0 = v72 --[[ copy: 5 -> 7 ]];
                    v72.motor:onStep(function(v74) --[[ Line: 374 ]]
                        -- upvalues: l_v72_0 (copy)
                        l_v72_0.updateSize(UDim2.fromOffset(50, v74.size));
                    end);
                    v72.motor:setGoal({
                        size = v2.spring(50, {
                            frequency = 2.5
                        })
                    });
                end;
                local v75 = v37(0, 1);
                local v76 = v17();
                v38.keyTileData[v76] = v75;
                v75.motor:onStep(function(v77) --[[ Line: 387 ]]
                    -- upvalues: v75 (copy)
                    v75.updateSize(UDim2.fromOffset(v77.size, 50));
                    v75.updateForegroundTransparency(v77.transparency);
                    v75.updateBackgroundTransparency(1 - (1 - v77.transparency) * 0.6);
                end);
                v75.motor:setGoal({
                    size = v2.spring(50, {
                        frequency = 2.5
                    }), 
                    transparency = v2.spring(0, {
                        frequency = 2.5
                    })
                });
                v71.lastUpdateTime = tick();
                v71.numberOfKeys = v71.numberOfKeys + 1;
                table.insert(v71.keys, {
                    keyCode = v66, 
                    dataId = v76
                });
                return {
                    keyRows = v70
                };
            end);
            return;
        end;
    end;
    v38.deleteKeyRowThread = function() --[[ Line: 414 ]]
        -- upvalues: v38 (copy), v3 (ref), v2 (ref)
        local _ = function(v78) --[[ Line: 415 ]] --[[ Name: deleteKeyRowWithId ]]
            -- upvalues: v38 (ref), v3 (ref)
            if not v38.isMounted then
                return;
            else
                v38:setState(function(v79, _) --[[ Line: 420 ]]
                    -- upvalues: v3 (ref), v78 (copy), v38 (ref)
                    local l_keyRows_1 = v79.keyRows;
                    local v82 = v3.Dictionary.join(l_keyRows_1);
                    local v83 = nil;
                    local v84 = nil;
                    for v85, v86 in ipairs(v82) do
                        if v86.dataId == v78 then
                            v83 = v86;
                            v84 = v85;
                            break;
                        end;
                    end;
                    if not v83 then
                        return;
                    else
                        v38.keyTileData[v83.dataId] = nil;
                        for _, v88 in ipairs(v83.keys) do
                            v38.keyTileData[v88.dataId] = nil;
                        end;
                        v83.keys = nil;
                        table.remove(v82, v84);
                        return {
                            keyRows = v82
                        };
                    end;
                end);
                return;
            end;
        end;
        local function v105(v90) --[[ Line: 452 ]] --[[ Name: fadeOutKeyRow ]]
            -- upvalues: v38 (ref), v2 (ref), v3 (ref)
            for v91, v92 in ipairs(v90.keys) do
                local v93 = v38.keyTileData[v92.dataId];
                v93.motor:setGoal({
                    transparency = v2.spring(1, {
                        frequency = 2
                    })
                });
                if v91 == 1 then
                    v93.motor:onComplete(function() --[[ Line: 462 ]]
                        -- upvalues: v90 (copy), v38 (ref), v3 (ref)
                        local l_dataId_0 = v90.dataId;
                        if not v38.isMounted then
                            return;
                        else
                            v38:setState(function(v95, _) --[[ Line: 420 ]]
                                -- upvalues: v3 (ref), l_dataId_0 (copy), v38 (ref)
                                local l_keyRows_2 = v95.keyRows;
                                local v98 = v3.Dictionary.join(l_keyRows_2);
                                local v99 = nil;
                                local v100 = nil;
                                for v101, v102 in ipairs(v98) do
                                    if v102.dataId == l_dataId_0 then
                                        v99 = v102;
                                        v100 = v101;
                                        break;
                                    end;
                                end;
                                if not v99 then
                                    return;
                                else
                                    v38.keyTileData[v99.dataId] = nil;
                                    for _, v104 in ipairs(v99.keys) do
                                        v38.keyTileData[v104.dataId] = nil;
                                    end;
                                    v99.keys = nil;
                                    table.remove(v98, v100);
                                    return {
                                        keyRows = v98
                                    };
                                end;
                            end);
                            return;
                        end;
                    end);
                end;
            end;
        end;
        while v38.isMounted do
            local l_keyRows_3 = v38.state.keyRows;
            for _, v108 in ipairs(l_keyRows_3) do
                local l_lastUpdateTime_0 = v108.lastUpdateTime;
                if tick() - l_lastUpdateTime_0 > 1.5 then
                    v105(v108);
                end;
            end;
            wait(0.5);
        end;
    end;
end;
v15.didMount = function(v110) --[[ Line: 487 ]] --[[ Name: didMount ]]
    -- upvalues: l_UserInputService_0 (copy), v13 (copy)
    table.insert(v110.connections, l_UserInputService_0.InputBegan:connect(function(v111) --[[ Line: 490 ]]
        -- upvalues: v110 (copy), v13 (ref)
        local l_Position_2 = v111.Position;
        if v111.UserInputType == Enum.UserInputType.MouseButton1 then
            v110.onMouseDown(Vector2.new(l_Position_2.X, l_Position_2.Y), 1);
            return;
        elseif v111.UserInputType == Enum.UserInputType.MouseButton2 then
            v110.onMouseDown(Vector2.new(l_Position_2.X, l_Position_2.Y), 2);
            return;
        elseif v111.UserInputType == Enum.UserInputType.Touch then
            v110.onTouchStarted(v111);
            return;
        else
            if v13[v111.UserInputType] then
                v110.onKeyDown(v111.KeyCode);
            end;
            return;
        end;
    end));
    table.insert(v110.connections, l_UserInputService_0.InputEnded:connect(function(v113) --[[ Line: 506 ]]
        -- upvalues: v110 (copy)
        local l_Position_3 = v113.Position;
        if v113.UserInputType == Enum.UserInputType.MouseButton1 then
            v110.onMouseUp(Vector2.new(l_Position_3.X, l_Position_3.Y), 1);
            return;
        elseif v113.UserInputType == Enum.UserInputType.MouseButton2 then
            v110.onMouseUp(Vector2.new(l_Position_3.X, l_Position_3.Y), 2);
            return;
        else
            if v113.UserInputType == Enum.UserInputType.Touch then
                v110.onTouchEnded(v113);
            end;
            return;
        end;
    end));
    table.insert(v110.connections, l_UserInputService_0.InputChanged:connect(function(v115) --[[ Line: 520 ]]
        -- upvalues: v110 (copy)
        local l_Position_4 = v115.Position;
        if v115.UserInputType == Enum.UserInputType.MouseMovement then
            v110.onMouseMove(Vector2.new(l_Position_4.X, l_Position_4.Y));
            return;
        else
            if v115.UserInputType == Enum.UserInputType.Touch then
                v110.onTouchMoved(v115);
            end;
            return;
        end;
    end));
    v110.isMounted = true;
    task.defer(v110.deleteKeyRowThread);
end;
v15.willUnmount = function(v117) --[[ Line: 534 ]] --[[ Name: willUnmount ]]
    for _, v119 in ipairs(v117.connections) do
        v119:Disconnect();
    end;
    v117.connections = {};
    v117.isMounted = false;
end;
v15.render = function(v120) --[[ Line: 542 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v7 (copy), l_Pane_0 (copy), v9 (copy)
    local l_props_0 = v120.props;
    local l_state_0 = v120.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v124 = {};
    for v125, v126 in ipairs(l_state_0.keyRows) do
        local v127 = {};
        for v128, v129 in ipairs(v126.keys) do
            local v130 = v120.keyTileData[v129.dataId];
            if v130 then
                v127[v128] = v1.createElement(v7, {
                    KeyCode = v129.keyCode, 
                    LayoutOrder = v128, 
                    Size = v130.size, 
                    ForegroundTransparency = v130.foregroundTransparency, 
                    BackgroundTransparency = v130.backgroundTransparency
                });
            end;
        end;
        local v131 = v120.keyTileData[v126.dataId];
        if v131 then
            v124[v125] = v1.createElement(l_Pane_0, {
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                VerticalAlignment = Enum.VerticalAlignment.Bottom, 
                Spacing = l_Stylizer_0.KeyBarRowSpacingPx, 
                Size = v131.size, 
                LayoutOrder = -v125
            }, v127);
        end;
    end;
    local v132 = {
        FakeCursorImage = v1.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Image = "rbxasset://textures/UserInputPlaybackPlugin/ArrowCursor.png", 
            Position = v120.fakeCursorPosition, 
            Size = UDim2.fromOffset(64, 64), 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Visible = true, 
            ImageColor3 = v9, 
            ZIndex = 1
        }), 
        KeyBar = v1.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            Spacing = l_Stylizer_0.KeyBarRowSpacingPx, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Bottom, 
            Size = l_Stylizer_0.KeyBarSize, 
            Position = UDim2.fromScale(0, 1), 
            AnchorPoint = Vector2.new(0, 1)
        }, v124)
    };
    for _, v134 in ipairs(v120.cursorRings) do
        if l_state_0.visibleCursorRingIds[v134.id] then
            v132[v134.id] = v1.createElement("ImageLabel", {
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = v134.image, 
                ZIndex = v134.zIndex, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = v134.size, 
                Position = v134.position, 
                ImageTransparency = v134.transparency, 
                ImageColor3 = v134.color, 
                Visible = true
            });
        end;
    end;
    return v1.createFragment(v132);
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v15));