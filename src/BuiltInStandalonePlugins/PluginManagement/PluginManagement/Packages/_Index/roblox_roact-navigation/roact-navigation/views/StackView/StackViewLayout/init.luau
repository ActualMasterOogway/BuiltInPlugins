local v0 = require(script.Parent.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.Parent.Parent.Parent.Roact);
local v2 = require(script.Parent.StackPresentationStyle);
local v3 = require(script.Parent.StackViewTransitionConfigs);
local v4 = require(script.Parent.StackViewOverlayFrame);
local v5 = require(script.Parent.StackViewCard);
local v6 = require(script.Parent.Parent.SceneView);
local v10 = {
    absorbInput = true, 
    overlayEnabled = false, 
    overlayColor3 = Color3.new(0, 0, 0), 
    overlayTransparency = 0.7, 
    renderOverlay = function(v7, v8, v9) --[[ Line: 15 ]] --[[ Name: renderOverlay ]]
        -- upvalues: v1 (copy), v4 (copy)
        return v1.createElement(v4, {
            navigationOptions = v7, 
            initialTransitionValue = v8, 
            transitionChangedSignal = v9
        });
    end
};
local function _(v11, v12) --[[ Line: 25 ]] --[[ Name: calculateTransitionValue ]]
    return (math.max(math.min(1 + v12 - v11, 1), 0));
end;
local v14 = v1.Component:extend("StackViewLayout");
v14.init = function(v15) --[[ Line: 32 ]] --[[ Name: init ]]
    local l_index_0 = v15.props.transitionProps.navigation.state.index;
    v15._isMounted = false;
    v15._positionLastValue = l_index_0;
    v15._renderScene = function(v17) --[[ Line: 38 ]]
        -- upvalues: v15 (copy)
        return v15:_renderInnerScene(v17);
    end;
    v15._subscribeToOverlayUpdates = function(v18) --[[ Line: 42 ]]
        -- upvalues: v15 (copy)
        local l_position_0 = v15.props.transitionProps.position;
        local l_index_1 = v15.props.transitionProps.scene.index;
        return l_position_0:onStep(function(v21) --[[ Line: 46 ]]
            -- upvalues: v18 (copy), l_index_1 (copy)
            local l_v18_0 = v18;
            local l_l_index_1_0 = l_index_1;
            l_v18_0((math.max(math.min(1 + v21 - l_l_index_1_0, 1), 0)));
        end);
    end;
end;
v14._renderCard = function(v24, v25, v26) --[[ Line: 52 ]] --[[ Name: _renderCard ]]
    -- upvalues: v0 (copy), v1 (copy), v5 (copy)
    local l_transitionProps_0 = v24.props.transitionProps;
    local l_lastTransitionProps_0 = v24.props.lastTransitionProps;
    local l_transitionConfig_0 = v24.state.transitionConfig;
    local l_cardColor3_0 = v26.cardColor3;
    local l_overlayEnabled_0 = v26.overlayEnabled;
    local l_index_2 = l_transitionProps_0.scene.index;
    if l_lastTransitionProps_0 then
        l_index_2 = l_lastTransitionProps_0.scene.index;
    end;
    local v33 = {};
    local l_screenInterpolator_0 = l_transitionConfig_0.screenInterpolator;
    if l_screenInterpolator_0 then
        v33 = l_screenInterpolator_0(v0.Dictionary.join(l_transitionProps_0, {
            initialPositionValue = l_index_2, 
            scene = v25
        }));
    end;
    return v1.createElement(v5, v0.Dictionary.join(l_transitionProps_0, v33, {
        key = "card_" .. tostring(v25.key), 
        scene = v25, 
        renderScene = v24._renderScene, 
        transparent = l_overlayEnabled_0, 
        cardColor3 = l_cardColor3_0
    }));
end;
v14._renderInnerScene = function(v35, v36) --[[ Line: 88 ]] --[[ Name: _renderInnerScene ]]
    -- upvalues: v1 (copy), v6 (copy)
    local l_navigation_0 = v36.descriptor.navigation;
    local v38 = v36.descriptor.getComponent();
    local l_screenProps_0 = v35.props.screenProps;
    return v1.createElement(v6, {
        screenProps = l_screenProps_0, 
        navigation = l_navigation_0, 
        component = v38
    });
end;
v14.render = function(v40) --[[ Line: 101 ]] --[[ Name: render ]]
    -- upvalues: v0 (copy), v10 (copy), v1 (copy)
    local l_transitionProps_1 = v40.props.transitionProps;
    local l_topMostOpaqueSceneIndex_0 = v40.state.topMostOpaqueSceneIndex;
    local l_scenes_0 = l_transitionProps_1.scenes;
    local v59 = v0.List.map(l_scenes_0, function(v44) --[[ Line: 106 ]]
        -- upvalues: l_topMostOpaqueSceneIndex_0 (copy), v0 (ref), v10 (ref), v1 (ref), v40 (copy)
        local v45 = false;
        if v44.index < l_topMostOpaqueSceneIndex_0 then
            v45 = not v44.isActive;
        end;
        local v46 = v0.Dictionary.join(v10, v44.descriptor.options or {});
        local l_overlayEnabled_1 = v46.overlayEnabled;
        local l_absorbInput_0 = v46.absorbInput;
        local l_renderOverlay_0 = v46.renderOverlay;
        local v50 = nil;
        if l_overlayEnabled_1 then
            local l_createElement_0 = v1.createElement;
            local v52 = "Frame";
            local v53 = {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                BorderSizePixel = 0, 
                ZIndex = 1
            };
            local v54 = {};
            local l_l_renderOverlay_0_0 = l_renderOverlay_0;
            local l_v46_0 = v46;
            local l_index_3 = v44.index;
            v54.Overlay = l_l_renderOverlay_0_0(l_v46_0, math.max(math.min(1 + v40._positionLastValue - l_index_3, 1), 0), v40._subscribeToOverlayUpdates);
            v50 = l_createElement_0(v52, v53, v54);
        end;
        local v58 = nil;
        if not v45 and l_absorbInput_0 then
            v58 = v1.createElement("TextButton", {
                Active = true, 
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = true, 
                Size = UDim2.new(1, 0, 1, 0), 
                Text = " ", 
                ZIndex = 2 * v44.index - 1
            });
        end;
        return v1.createFragment({
            AbsorbInput = v58, 
            [tostring(v44.index)] = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ClipsDescendants = true, 
                ZIndex = 2 * v44.index, 
                Visible = not v45
            }, {
                StationaryContent = v50, 
                DynamicContent = v1.createElement("Frame", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    ClipsDescendants = true, 
                    BorderSizePixel = 0, 
                    ZIndex = 2
                }, {
                    ["card_" .. v44.key] = v40:_renderCard(v44, v46)
                })
            })
        });
    end);
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        BorderSizePixel = 0
    }, v59);
end;
v14.getDerivedStateFromProps = function(v60, _) --[[ Line: 189 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v2 (copy), v0 (copy), v10 (copy), v3 (copy)
    local l_transitionProps_2 = v60.transitionProps;
    local l_scenes_1 = l_transitionProps_2.scenes;
    local l_isTransitioning_0 = l_transitionProps_2.navigation.state.isTransitioning;
    local v65 = #l_scenes_1;
    local v66 = true;
    if v60.mode ~= v2.Modal then
        v66 = v60.mode == v2.Overlay;
    end;
    local v67 = 0;
    if v66 then
        for v68 = v65, 1, -1 do
            local v69 = l_scenes_1[v68];
            if not v0.Dictionary.join(v10, v69.descriptor.options or {}).overlayEnabled and (not l_isTransitioning_0 or v68 ~= v65) then
                v67 = v68;
                break;
            end;
        end;
    else
        for v70 = v65, 1, -1 do
            if not l_isTransitioning_0 or v70 ~= v65 then
                v67 = v70;
                break;
            end;
        end;
    end;
    return {
        topMostOpaqueSceneIndex = v67, 
        transitionConfig = v3.getTransitionConfig(v60.transitionConfig, v60.transitionProps, v60.lastTransitionProps, v60.mode)
    };
end;
v14.didMount = function(v71) --[[ Line: 231 ]] --[[ Name: didMount ]]
    v71._isMounted = true;
    v71._positionDisconnector = v71.props.transitionProps.position:onStep(function(...) --[[ Line: 234 ]]
        -- upvalues: v71 (copy)
        v71:_onPositionStep(...);
    end);
end;
v14.willUnmount = function(v72) --[[ Line: 239 ]] --[[ Name: willUnmount ]]
    v72._isMounted = false;
    if v72._positionDisconnector then
        v72._positionDisconnector();
        v72._positionDisconnector = nil;
    end;
end;
v14.didUpdate = function(v73, v74) --[[ Line: 248 ]] --[[ Name: didUpdate ]]
    local l_position_1 = v73.props.transitionProps.position;
    if l_position_1 ~= v74.transitionProps.position then
        v73._positionDisconnector();
        v73._positionDisconnector = l_position_1:onStep(function(...) --[[ Line: 253 ]]
            -- upvalues: v73 (copy)
            v73:_onPositionStep(...);
        end);
    end;
end;
v14._onPositionStep = function(v76, v77) --[[ Line: 259 ]] --[[ Name: _onPositionStep ]]
    if v76._isMounted then
        v76._positionLastValue = v77;
    end;
end;
return v14;