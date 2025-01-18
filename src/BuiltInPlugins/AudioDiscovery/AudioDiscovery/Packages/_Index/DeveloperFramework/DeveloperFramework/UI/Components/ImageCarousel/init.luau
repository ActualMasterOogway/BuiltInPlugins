local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local l_Typecheck_0 = require(l_Parent_0.Util).Typecheck;
local l_shallowEqual_0 = require(l_Parent_0.Parent.Dash).shallowEqual;
local v7 = if l_Parent_0.Parent:FindFirstChild("Otter") then require(l_Parent_0.Parent.Otter) else nil;
local l_prioritize_0 = require(l_Parent_0.Util).prioritize;
local v9 = require(l_Parent_0.UI.Components.Image);
local v10 = require(l_Parent_0.UI.Components.IconButton);
local v11 = require(l_Parent_0.UI.Components.Pane);
local v12 = v2.PureComponent:extend("ImageCarousel");
l_Typecheck_0.wrap(v12, script);
local l_RunService_0 = game:GetService("RunService");
v12.defaultProps = {
    AutoAdvanceTimer = 5000, 
    OnImageChangeTransparencyThreshold = 1
};
v12.init = function(v14) --[[ Line: 115 ]] --[[ Name: init ]]
    -- upvalues: v7 (copy)
    v14.state = {
        autoAdvance = v14.props.AutoAdvance, 
        currentImageTransparency = 0, 
        fadeInProgress = false, 
        imageElements = {}, 
        indexOfImageShown = 1, 
        isHovering = false, 
        startTimeForAutoAdvanceTimer = os.clock()
    };
    v14.state = {
        autoAdvance = v14.props.AutoAdvance, 
        currentImageTransparency = 0, 
        fadeInProgress = false, 
        imageElements = {}, 
        indexOfImageShown = 1, 
        isHovering = false, 
        startTimeForAutoAdvanceTimer = os.clock()
    };
    v14._useAnimations = v7 and not v14.props.DisableAnimations;
    if v14._useAnimations then
        v14:_createOtterMotors();
    end;
    v14.preloadedImagesAlready = false;
    if v14.props.AutoAdvance then
        v14:_handlePreloadImages();
    end;
    v14._onMouseEnter = function() --[[ Line: 145 ]]
        -- upvalues: v14 (copy)
        if not v14.props.AutoAdvance then
            v14:_handlePreloadImages();
        end;
        local v15 = not v14.props.DisableHoverToggle;
        local v16 = if v15 then not v14.props.AutoAdvance else v14.props.AutoAdvance;
        local v17 = if v15 then os.clock() else v14.state.startTimeForAutoAdvanceTimer;
        v14:setState({
            autoAdvance = v16, 
            startTimeForAutoAdvanceTimer = v17, 
            isHovering = true
        });
    end;
    v14._onMouseLeave = function() --[[ Line: 162 ]]
        -- upvalues: v14 (copy)
        local v18 = if not v14.props.ResetWhenHoveredOff and v14.props.DisableHoverToggle then v14.state.startTimeForAutoAdvanceTimer else os.clock();
        local v19 = v14.props.ResetWhenHoveredOff and 1 or nil;
        v14:setState({
            autoAdvance = v14.props.AutoAdvance and true or false, 
            startTimeForAutoAdvanceTimer = v18, 
            indexOfImageShown = v19, 
            isHovering = false
        });
        if v14.props.ResetWhenHoveredOff and v14._useAnimations then
            v14:_resetAnimation(v19);
        end;
    end;
    v14._moveRight = function() --[[ Line: 181 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            startTimeForAutoAdvanceTimer = os.clock()
        });
        v14:_changeImageIndexBy(1);
    end;
    v14._moveLeft = function() --[[ Line: 188 ]]
        -- upvalues: v14 (copy)
        v14:setState({
            startTimeForAutoAdvanceTimer = os.clock()
        });
        v14:_changeImageIndexBy(-1);
    end;
end;
v12._createOtterMotors = function(v20) --[[ Line: 196 ]] --[[ Name: _createOtterMotors ]]
    -- upvalues: v7 (copy)
    v20._transparencyMotor = v7.createSingleMotor(0);
    v20._transparencyMotor:onStep(function(v21) --[[ Line: 198 ]]
        -- upvalues: v20 (copy)
        v20:setState({
            currentImageTransparency = v21
        });
    end);
    v20._transparencyMotor:onComplete(function() --[[ Line: 204 ]]
        -- upvalues: v20 (copy)
        if v20.state.currentImageTransparency == 0 then
            return;
        else
            v20:_resetAnimation(v20.state.indexOfNextImage);
            return;
        end;
    end);
end;
v12._resetAnimation = function(v22, v23) --[[ Line: 216 ]] --[[ Name: _resetAnimation ]]
    -- upvalues: v7 (copy)
    local l_props_0 = v22.props;
    local l_state_0 = v22.state;
    if l_props_0.OnImageChange and l_state_0.currentImageTransparency >= l_props_0.OnImageChangeTransparencyThreshold then
        l_props_0.OnImageChange(v23, l_state_0.fromAutoRotation);
    end;
    v22:setState({
        indexOfImageShown = v23, 
        fadeInProgress = false
    });
    v22._transparencyMotor:setGoal(v7.instant(0));
    v22._transparencyMotor:step(0);
end;
v12._handlePreloadImages = function(v26, v27) --[[ Line: 234 ]] --[[ Name: _handlePreloadImages ]]
    -- upvalues: l_ContentProvider_0 (copy)
    if not v27 and v26.preloadedImagesAlready then
        return;
    else
        task.spawn(function() --[[ Line: 238 ]]
            -- upvalues: l_ContentProvider_0 (ref), v26 (copy)
            l_ContentProvider_0:PreloadAsync(v26.props.ImageStrings);
        end);
        v26.preloadedImagesAlready = true;
        return;
    end;
end;
v12._createImageElement = function(v28, v29, v30) --[[ Line: 244 ]] --[[ Name: _createImageElement ]]
    -- upvalues: v2 (copy), v9 (copy), l_prioritize_0 (copy)
    local l_Stylizer_0 = v28.props.Stylizer;
    return v2.createElement(v9, {
        Style = {
            Image = v29, 
            Size = v28.props.Size, 
            ScaleType = l_prioritize_0(v28.props.ImageScaleType, l_Stylizer_0.ImageScaleType), 
            Transparency = if not v28._useAnimations then nil else if v30 == v28.state.indexOfImageShown then v28.state.currentImageTransparency else if v30 == v28.state.indexOfNextImage then 1 - v28.state.currentImageTransparency else 1
        }, 
        OnMouseEnter = v28._onMouseEnter, 
        OnMouseLeave = v28._onMouseLeave
    }, {
        UICorner = if v28.props.ImageCornerRadius then v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, v28.props.ImageCornerRadius)
        }) else nil
    });
end;
v12._createImageElements = function(v32) --[[ Line: 268 ]] --[[ Name: _createImageElements ]]
    local v33 = {};
    for v34 = 1, #v32.props.ImageStrings do
        table.insert(v33, v34, v32:_createImageElement(v32.props.ImageStrings[v34], v34));
    end;
    return v33;
end;
v12._createMoveButton = function(v35, v36) --[[ Line: 276 ]] --[[ Name: _createMoveButton ]]
    -- upvalues: v2 (copy), v10 (copy), l_prioritize_0 (copy)
    local l_props_1 = v35.props;
    local l_MoveButtons_0 = l_props_1.Stylizer.MoveButtons;
    return v2.createElement(v10, {
        AnchorPoint = l_prioritize_0(l_props_1.ButtonAnchorPoint, l_MoveButtons_0.AnchorPoint), 
        BackgroundColor = l_prioritize_0(l_props_1.ButtonBackgroundColor, l_MoveButtons_0.BackgroundColor), 
        Cursor = l_prioritize_0(l_props_1.ButtonCursor, l_MoveButtons_0.Cursor), 
        HoverColor = l_prioritize_0(l_props_1.ButtonHoverColor, l_MoveButtons_0.HoverColor), 
        IconColor = l_prioritize_0(l_props_1.ButtonIconColor, l_MoveButtons_0.Color), 
        IconScaleType = l_prioritize_0(l_props_1.ButtonIconScaleType, l_MoveButtons_0.IconScaleType), 
        IconSize = l_prioritize_0(l_props_1.ButtonIconSize, l_MoveButtons_0.IconSize), 
        ImageTransparency = l_prioritize_0(l_props_1.ButtonImageTransparency, l_MoveButtons_0.ImageTransparency), 
        LeftIcon = l_prioritize_0(l_props_1.ButtonIcon, v36.Icon), 
        OnClick = v36.ShouldMoveRight and function() --[[ Line: 298 ]]
            -- upvalues: v35 (copy)
            v35:setState({
                fromAutoRotation = false
            });
            v35._moveRight();
        end or function() --[[ Line: 304 ]]
            -- upvalues: v35 (copy)
            v35:setState({
                fromAutoRotation = false
            });
            v35._moveLeft();
        end, 
        Padding = l_prioritize_0(l_props_1.ButtonPadding, v36.Padding), 
        Position = v36.Position, 
        Size = l_prioritize_0(l_props_1.ButtonSize, l_MoveButtons_0.Size), 
        ZIndex = v36.ZIndex
    });
end;
v12._getInBoundsImagesIndex = function(v39, v40) --[[ Line: 317 ]] --[[ Name: _getInBoundsImagesIndex ]]
    local v41 = #v39.props.ImageStrings;
    local v42 = v40 % v41;
    if v42 == 0 then
        v42 = v41;
    end;
    return v42;
end;
v12._changeImageIndexBy = function(v43, v44) --[[ Line: 326 ]] --[[ Name: _changeImageIndexBy ]]
    -- upvalues: v7 (copy)
    if v43._useAnimations and v43.state.fadeInProgress then
        v43:_resetAnimation(v43.state.indexOfNextImage);
    end;
    local l_indexOfImageShown_0 = v43.state.indexOfImageShown;
    local v46 = nil;
    v46 = v43:_getInBoundsImagesIndex(l_indexOfImageShown_0 + v44);
    if v43._useAnimations then
        v43:setState({
            indexOfImageShown = l_indexOfImageShown_0, 
            indexOfNextImage = v46, 
            fadeInProgress = true
        });
        v43._transparencyMotor:setGoal(v7.spring(1, {
            frequency = 0.8
        }));
    else
        v43:setState({
            indexOfImageShown = v46
        });
    end;
    if v43.props.OnImageChange and not v43._useAnimations then
        v43.props.OnImageChange(v46, v43.state.fromAutoRotation);
    end;
end;
v12.willUpdate = function(v47, v48) --[[ Line: 354 ]] --[[ Name: willUpdate ]]
    if v48.ImageStrings ~= v47.props.ImageStrings then
        v47:_handlePreloadImages(true);
    end;
end;
v12.didMount = function(v49) --[[ Line: 360 ]] --[[ Name: didMount ]]
    -- upvalues: l_RunService_0 (copy)
    v49._unmounting = false;
    v49._heartbeat = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 362 ]]
        -- upvalues: v49 (copy)
        if not v49._unmounting then
            v49:_update();
        end;
    end);
    v49:setState({
        imageElements = v49:_createImageElements()
    });
    if v49.props.OnSetImages then
        v49.props.OnSetImages(1);
    end;
end;
v12.willUnmount = function(v50) --[[ Line: 375 ]] --[[ Name: willUnmount ]]
    v50._unmounting = true;
    if v50._heartbeat then
        v50._heartbeat:Disconnect();
    end;
    if v50._useAnimations then
        v50._transparencyMotor:destroy();
    end;
end;
v12._update = function(v51) --[[ Line: 385 ]] --[[ Name: _update ]]
    local l_state_1 = v51.state;
    local l_props_2 = v51.props;
    local v54 = os.clock();
    if l_state_1.autoAdvance and v54 - l_state_1.startTimeForAutoAdvanceTimer >= l_props_2.AutoAdvanceTimer / 1000 then
        v51:setState({
            fromAutoRotation = true
        });
        v51._moveRight();
    end;
end;
v12.didUpdate = function(v55, v56) --[[ Line: 397 ]] --[[ Name: didUpdate ]]
    -- upvalues: l_shallowEqual_0 (copy)
    if not l_shallowEqual_0(v56.ImageStrings, v55.props.ImageStrings) then
        v55:setState({
            imageElements = v55:_createImageElements()
        });
        if v55.props.OnSetImages then
            v55.props.OnSetImages(v55.state.indexOfImageShown);
        end;
    end;
end;
v12.render = function(v57) --[[ Line: 408 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v11 (copy), l_prioritize_0 (copy)
    local l_props_3 = v57.props;
    local l_state_2 = v57.state;
    local l_Stylizer_1 = l_props_3.Stylizer;
    local v61 = l_props_3.ShowNavigationOnHover and l_state_2.isHovering;
    assert(type(v57.props.ImageStrings) == "table", "Expected 'ImageStrings' to be a table.");
    return v2.createElement(v11, {
        Size = l_prioritize_0(l_props_3.Size, l_Stylizer_1.Size), 
        Style = l_props_3.PaneStyle
    }, {
        LeftButton = if v61 then v57:_createMoveButton(l_Stylizer_1.LeftButton) else nil, 
        CurrentCarouselImage = v57:_createImageElement(v57.props.ImageStrings[l_state_2.indexOfImageShown], l_state_2.indexOfImageShown), 
        NextCarouselImage = if v57._useAnimations and l_state_2.fadeInProgress and l_state_2.indexOfNextImage then v57:_createImageElement(v57.props.ImageStrings[l_state_2.indexOfNextImage], l_state_2.indexOfNextImage) else nil, 
        RightButton = if v61 then v57:_createMoveButton(l_Stylizer_1.RightButton) else nil
    });
end;
return (l_withContext_0({
    Stylizer = v3.Stylizer
})(v12));