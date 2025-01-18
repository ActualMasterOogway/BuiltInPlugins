local v0 = require(script.Parent.Parent.Parent.Cryo);
local v1 = require(script.Parent.Parent.Parent.Roact);
local v2 = require(script.Parent.Parent.Parent.Otter);
local v3 = require(script.Parent.ScenesReducer);
local v4 = require(script.Parent.Parent.utils.validate);
local v5 = {
    frequency = 4
};
local function v16(v6, v7) --[[ Line: 11 ]] --[[ Name: buildTransitionProps ]]
    -- upvalues: v4 (copy)
    local l_navigation_0 = v6.navigation;
    local l_options_0 = v6.options;
    local l_layout_0 = v7.layout;
    local l_position_0 = v7.position;
    local l_scenes_0 = v7.scenes;
    local v13 = nil;
    for _, v15 in ipairs(l_scenes_0) do
        if v15.isActive then
            v13 = v15;
            break;
        end;
    end;
    v4(v13, "Could not find active scene");
    return {
        layout = l_layout_0, 
        navigation = l_navigation_0, 
        position = l_position_0, 
        scenes = l_scenes_0, 
        scene = v13, 
        options = l_options_0, 
        index = v13.index
    };
end;
local function _(v17) --[[ Line: 40 ]] --[[ Name: filterStale ]]
    -- upvalues: v0 (copy)
    local v19 = v0.List.filter(v17, function(v18) --[[ Line: 41 ]]
        return not v18.isStale;
    end);
    if #v19 == #v17 then
        return v17;
    else
        return v19;
    end;
end;
local v21 = v1.Component:extend("Transitioner");
v21.init = function(v22) --[[ Line: 54 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v3 (copy), v16 (copy)
    local l_state_0 = v22.props.navigation.state;
    local l_descriptors_0 = v22.props.descriptors;
    v22.state = {
        layout = {
            initWidth = 0, 
            initHeight = 0, 
            isMeasured = false
        }, 
        position = v2.createSingleMotor(l_state_0.index), 
        scenes = v3({}, l_state_0, nil, l_descriptors_0)
    };
    v22._doOnAbsoluteSizeChanged = function(...) --[[ Line: 70 ]]
        -- upvalues: v22 (copy)
        return v22:_onAbsoluteSizeChanged(...);
    end;
    v22._positionLastValue = l_state_0.index;
    v22._prevTransitionProps = nil;
    v22._transitionProps = v16(v22.props, v22.state);
    v22._isMounted = false;
    v22._isTransitionRunning = false;
    v22._transitionQueue = {};
    v22._completeSignalDisconnector = v22.state.position:onComplete(function() --[[ Line: 83 ]]
        -- upvalues: v22 (copy)
        spawn(function() --[[ Line: 88 ]]
            -- upvalues: v22 (ref)
            if v22._isMounted then
                v22:_onTransitionEnd();
            end;
        end);
    end);
    v22._stepSignalDisconnector = v22.state.position:onStep(function(v25) --[[ Line: 95 ]]
        -- upvalues: v22 (copy)
        if v22._isMounted then
            v22:_onPositionStep(v25);
        end;
    end);
end;
v21.didMount = function(v26) --[[ Line: 102 ]] --[[ Name: didMount ]]
    v26._isMounted = true;
end;
v21.willUnmount = function(v27) --[[ Line: 106 ]] --[[ Name: willUnmount ]]
    v27._isMounted = false;
    if v27._completeSignalDisconnector then
        v27._completeSignalDisconnector();
        v27._completeSignalDisconnector = nil;
    end;
    if v27._stepSignalDisconnector then
        v27._stepSignalDisconnector();
        v27._stepSignalDisconnector = nil;
    end;
end;
v21.didUpdate = function(v28, v29) --[[ Line: 120 ]] --[[ Name: didUpdate ]]
    if v28.props ~= v29 then
        if v28._isTransitionRunning then
            if (v28._transitionQueue[#v28._transitionQueue] or {}).prevProps ~= v29 then
                table.insert(v28._transitionQueue, {
                    prevProps = v29
                });
            end;
            return;
        else
            v28:_startTransition(v29, v28.props);
        end;
    end;
end;
v21.render = function(v30) --[[ Line: 139 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy)
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ClipsDescendants = true, 
        [v1.Change.AbsoluteSize] = v30._doOnAbsoluteSizeChanged
    }, {
        TransitionerScenes = v30.props.render(v30._transitionProps, v30._prevTransitionProps)
    });
end;
v21._onAbsoluteSizeChanged = function(v31, v32) --[[ Line: 153 ]] --[[ Name: _onAbsoluteSizeChanged ]]
    -- upvalues: v0 (copy), v16 (copy)
    local l_X_0 = v32.AbsoluteSize.X;
    local l_Y_0 = v32.AbsoluteSize.Y;
    if l_X_0 == v31.state.layout.initWidth and l_Y_0 == v31.state.layout.initHeight then
        return;
    else
        local v35 = v0.Dictionary.join(v31.state.layout, {
            initWidth = l_X_0, 
            initHeight = l_Y_0, 
            isMeasured = true
        });
        local v36 = v0.Dictionary.join(v31.state, {
            layout = v35
        });
        v31._transitionProps = v16(v31.props, v36);
        v31:setState({
            layout = v35
        });
        return;
    end;
end;
v21._computeScenes = function(v37, v38, v39) --[[ Line: 179 ]] --[[ Name: _computeScenes ]]
    -- upvalues: v3 (copy), v0 (copy)
    local v40 = v3(v37.state.scenes, v39.navigation.state, v38.navigation.state, v39.descriptors);
    if not v39.navigation.state.isTransitioning then
        local l_v40_0 = v40;
        local v43 = v0.List.filter(l_v40_0, function(v42) --[[ Line: 41 ]]
            return not v42.isStale;
        end);
        v40 = if #v43 == #l_v40_0 then l_v40_0 else v43;
    end;
    if v40 == v37.state.scenes then
        return nil;
    else
        return v40;
    end;
end;
v21._startTransition = function(v44, v45, v46) --[[ Line: 197 ]] --[[ Name: _startTransition ]]
    -- upvalues: v0 (copy), v16 (copy), v2 (copy), v5 (copy)
    local v47 = v45.navigation.state.index ~= v46.navigation.state.index;
    local v48 = v44:_computeScenes(v45, v46);
    if not v48 then
        v44._prevTransitionProps = v44._transitionProps;
        if v44._isTransitionRunning then
            v44:_onTransitionEnd();
        end;
        return;
    else
        local v49 = v0.Dictionary.join(v44.state, {
            scenes = v48
        });
        local l_position_1 = v49.position;
        local l_index_0 = v46.navigation.state.index;
        v44._prevTransitionProps = v44._transitionProps;
        v44._transitionProps = v16(v46, v49);
        local l_isTransitioning_0 = v44._transitionProps.navigation.state.isTransitioning;
        if not l_isTransitioning_0 or not v47 then
            v44:setState(v49);
            if v46.onTransitionStart then
                v46.onTransitionStart(v44._transitionProps, v44._prevTransitionProps);
            end;
            l_position_1:setGoal(v2.instant(l_index_0));
            return;
        else
            if l_isTransitioning_0 then
                v44._isTransitionRunning = true;
                v44:setState(v49);
                if v46.onTransitionStart then
                    v46.onTransitionStart(v44._transitionProps, v44._prevTransitionProps);
                end;
                local v53 = v44._positionLastValue ~= l_index_0;
                if v47 and v53 then
                    local v54 = {};
                    if v46.configureTransition then
                        v54 = v46.configureTransition(v44._transitionProps, v44._prevTransitionProps) or {};
                    end;
                    local v55 = v0.Dictionary.join(v5, v54);
                    l_position_1:setGoal(v2.spring(v46.navigation.state.index, v55));
                    return;
                else
                    l_position_1:setGoal(v2.instant(v46.navigation.state.index));
                end;
            end;
            return;
        end;
    end;
end;
v21._onTransitionEnd = function(v56) --[[ Line: 265 ]] --[[ Name: _onTransitionEnd ]]
    -- upvalues: v0 (copy), v16 (copy)
    local l__prevTransitionProps_0 = v56._prevTransitionProps;
    v56._prevTransitionProps = nil;
    local l_scenes_1 = v56.state.scenes;
    local v60 = v0.List.filter(l_scenes_1, function(v59) --[[ Line: 41 ]]
        return not v59.isStale;
    end);
    local v61 = if #v60 == #l_scenes_1 then l_scenes_1 else v60;
    l_scenes_1 = v0.Dictionary.join(v56.state, {
        scenes = v61
    });
    v56._transitionProps = v16(v56.props, l_scenes_1);
    v56:setState(l_scenes_1);
    if v56.props.onTransitionEnd then
        v56.props.onTransitionEnd(v56._transitionProps, l__prevTransitionProps_0);
    end;
    v60 = v56._transitionQueue[1];
    if v60 then
        local l_prevProps_0 = v60.prevProps;
        v56._transitionQueue = v0.List.removeIndex(v56._transitionQueue, 1);
        v56:_startTransition(l_prevProps_0, v56.props);
        return;
    else
        v56._isTransitionRunning = false;
        return;
    end;
end;
v21._onPositionStep = function(v63, v64) --[[ Line: 293 ]] --[[ Name: _onPositionStep ]]
    v63._positionLastValue = v64;
    local l_index_1 = v63._transitionProps.index;
    local l_l_index_1_0 = l_index_1;
    if v63._prevTransitionProps then
        l_l_index_1_0 = v63._prevTransitionProps.index;
    end;
    if v63.props.onTransitionStep and l_l_index_1_0 ~= l_index_1 then
        local v67 = (v64 - l_l_index_1_0) / (l_index_1 - l_l_index_1_0);
        v63.props.onTransitionStep(v63._transitionProps, v63._prevTransitionProps, v67);
    end;
end;
return v21;