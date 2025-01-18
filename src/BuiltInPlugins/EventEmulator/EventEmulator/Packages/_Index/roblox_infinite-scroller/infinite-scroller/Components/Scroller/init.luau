local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("infinite-scroller").Parent;
local v3 = require(l_Parent_0.Roact);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.t);
local v6 = require(l_Parent_0.Otter);
local l_FitFrameOnAxis_0 = require(l_Parent_0.FitFrame).FitFrameOnAxis;
local v8 = require(script.Parent.findNewIndices);
local v9 = require(script.Parent.relocateIndices);
local v10 = require(script.Parent.Round);
local v11 = require(script.Parent.Distance);
local v12 = require(script.Parent.KeyPool);
local v13 = require(script.Parent.Logger);
local v14 = require(script.Parent.TimeLogger);
local v15 = require(script.Parent.NotifyReady);
local v16 = v3.PureComponent:extend("Scroller");
v16.Orientation = require(script.Parent.Orientation);
local v17 = {
    frequency = 4, 
    dampingRatio = 1
};
local v18 = {
    [v16.Orientation.Up] = true, 
    [v16.Orientation.Down] = true, 
    [v16.Orientation.Left] = false, 
    [v16.Orientation.Right] = false
};
local v19 = {
    [v16.Orientation.Up] = true, 
    [v16.Orientation.Down] = false, 
    [v16.Orientation.Left] = true, 
    [v16.Orientation.Right] = false
};
local v20 = {
    [v16.Orientation.Up] = -1, 
    [v16.Orientation.Down] = 1, 
    [v16.Orientation.Left] = -1, 
    [v16.Orientation.Right] = 1
};
v16.validateProps = v5.interface({
    itemList = v5.array(v5.any), 
    renderItem = v5.callback, 
    identifier = v5.optional(v5.callback), 
    orientation = v5.optional(v16.Orientation.isOrientation), 
    loadNext = v5.optional(v5.callback), 
    loadPrevious = v5.optional(v5.callback), 
    padding = v5.optional(v5.UDim), 
    loadingBuffer = v5.optional(v5.numberPositive), 
    mountingBuffer = v5.optional(v5.numberPositive), 
    leadBuffer = v5.optional(v5.UDim), 
    trailBuffer = v5.optional(v5.UDim), 
    estimatedItemSize = v5.optional(v5.numberPositive), 
    maximumSearchDistance = v5.optional(v5.numberPositive), 
    focusIndex = v5.optional(v5.integer), 
    focusLock = v5.optional(v5.any), 
    anchorLocation = v5.optional(v5.UDim), 
    animateScrolling = v5.optional(v5.boolean), 
    animateOptions = v5.optional(v5.table), 
    extraProps = v5.optional(v5.table), 
    onScrollUpdate = v5.optional(v5.callback), 
    recyclingDisabledFor = v5.optional(v5.array(v5.string)), 
    useAutoSizing = v5.optional(v5.boolean), 
    [v15] = v5.any
});
v16.defaultProps = {
    itemList = {}, 
    renderItem = {}, 
    identifier = function(v21) --[[ Line: 136 ]] --[[ Name: identifier ]]
        return v21;
    end, 
    orientation = v16.Orientation.Down, 
    loadNext = function() --[[ Line: 140 ]] --[[ Name: loadNext ]]

    end, 
    loadPrevious = function() --[[ Line: 141 ]] --[[ Name: loadPrevious ]]

    end, 
    padding = UDim.new(), 
    loadingBuffer = 10, 
    mountingBuffer = 200, 
    leadBuffer = UDim.new(), 
    trailBuffer = UDim.new(), 
    estimatedItemSize = 50, 
    maximumSearchDistance = 100, 
    focusIndex = 1, 
    focusLock = {}, 
    anchorLocation = UDim.new(0, 0), 
    animateScrolling = false, 
    animateOptions = v17, 
    extraProps = {}, 
    onScrollUpdate = function() --[[ Line: 155 ]] --[[ Name: onScrollUpdate ]]

    end, 
    recyclingDisabledFor = {}, 
    [v15] = false, 
    useAutoSizing = false
};
v16.render = function(v22) --[[ Line: 161 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), l_FitFrameOnAxis_0 (copy), v4 (copy), v3 (copy), v19 (copy)
    v22.log:debug("render");
    local v23 = v18[v22.props.orientation] and {
        fillDirection = Enum.FillDirection.Vertical, 
        scrollDirection = Enum.ScrollingDirection.Y, 
        fitDirection = l_FitFrameOnAxis_0.Axis.Vertical, 
        minimumSize = UDim2.new(1, 0, 0, 0), 
        canvasSize = UDim2.new(0, 0, 0, v22.state.size), 
        paddingSize = UDim2.new(0, 0, 0, v22.state.padding)
    } or {
        fillDirection = Enum.FillDirection.Horizontal, 
        scrollDirection = Enum.ScrollingDirection.X, 
        fitDirection = l_FitFrameOnAxis_0.Axis.Horizontal, 
        minimumSize = UDim2.new(0, 0, 1, 0), 
        canvasSize = UDim2.new(0, v22.state.size, 0, 0), 
        paddingSize = UDim2.new(0, v22.state.padding, 0, 0)
    };
    local v24 = v4.Dictionary.join(v22.props, v22.propsToClear, {
        CanvasSize = v23.canvasSize, 
        ScrollingDirection = v23.scrollDirection, 
        [v3.Change.CanvasPosition] = v22.onScroll, 
        [v3.Change.AbsoluteSize] = v22.onResize, 
        [v3.Ref] = v22:getRef()
    });
    local v25 = {
        layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = v23.fillDirection, 
            Padding = UDim.new(0, v22.itemPadding), 
            [v3.Change.AbsoluteContentSize] = v22.onContentResize
        }), 
        padding = v3.createElement("Frame", {
            Size = v23.paddingSize, 
            LayoutOrder = -1 - (v22.state.listSize or 0), 
            BackgroundTransparency = 1
        })
    };
    if v22.state.ready and not v4.isEmpty(v22.props.itemList) then
        v22.log:trace("  Rendering elements between {} and {}", v22.state.trail.index, v22.state.lead.index);
        for v26 = v22.state.trail.index, v22.state.lead.index do
            local v27 = v22:getMetadata(v26);
            v25[v27.name] = v3.createElement(l_FitFrameOnAxis_0, {
                minimumSize = v23.minimumSize, 
                axis = v23.fitDirection, 
                useAutoSizing = v22.props.useAutoSizing, 
                FillDirection = v23.fillDirection, 
                BackgroundTransparency = 1, 
                LayoutOrder = v19[v22.props.orientation] and -v26 or v26, 
                [v3.Ref] = v27.ref
            }, {
                item = v22.props.renderItem(v22.props.itemList[v26], false)
            });
        end;
    end;
    return v3.createElement("ScrollingFrame", v24, v25);
end;
v16.shouldUpdate = function(v28, v29, v30) --[[ Line: 231 ]] --[[ Name: shouldUpdate ]]
    if not v28.alive then
        return false;
    else
        v28.log:trace("shouldUpdate");
        if v28.props.Size ~= v29.Size then
            v28.log:trace("  Size Prop Changed");
            v28._sizePropChanged = true;
        end;
        if v30 ~= v28.state then
            v28.log:trace("  State changed");
            return true;
        else
            for v31, v32 in pairs(v29) do
                if v28.props[v31] ~= v32 then
                    if v31 ~= "extraProps" then
                        v28.log:trace("  Prop changed: {}", v31);
                        return true;
                    else
                        for v33, v34 in pairs(v32) do
                            if v28.props.extraProps[v33] ~= v34 then
                                v28.log:trace("  Extra prop changed: {}", v33);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
            for v35, v36 in pairs(v28.props) do
                if v29[v35] ~= v36 then
                    if v35 ~= "extraProps" then
                        v28.log:trace("  Prop changed: {}", v35);
                        return true;
                    else
                        for v37, v38 in pairs(v36) do
                            if v29.extraProps[v37] ~= v38 then
                                v28.log:trace("  Extra prop changed: {}", v37);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
            return false;
        end;
    end;
end;
v16.willUpdate = function(v39, v40, v41) --[[ Line: 285 ]] --[[ Name: willUpdate ]]
    -- upvalues: v4 (copy)
    if not v39.alive then
        return;
    else
        v39.log:debug("willUpdate");
        if not v41.ready then
            return;
        else
            if v39.updating then
                v39.timeLog:info("Middle of update");
            else
                v39.timeLog:info("Start of update");
                v39.numberOfTopTrims = 0;
                v39.numberOfBottomTrims = 0;
                v39.lastTrimTop = 0;
                v39.lastTrimBottom = 0;
            end;
            v39.updating = true;
            v39.sizeDebounce = true;
            local v42 = {};
            local v43 = {};
            if not v4.isEmpty(v39.props.itemList) and v39.state.lead then
                for v44 = v39.state.trail.index, v39.state.lead.index do
                    v42[v39.props.identifier(v39.props.itemList[v44])] = true;
                end;
            end;
            if not v4.isEmpty(v40.itemList) and v41.lead then
                for v45 = v41.trail.index, v41.lead.index do
                    local v46 = v40.itemList[v45];
                    local v47 = v40.identifier(v46);
                    if v42[v47] then
                        v42[v47] = nil;
                    else
                        v43[v47] = v46;
                    end;
                end;
            end;
            for v48, _ in pairs(v42) do
                v39:clearMetadata(v48);
            end;
            for v50, v51 in pairs(v43) do
                v39:updateMetadata(v50, v51, v40);
            end;
            if v39.state.lastFocusLock ~= v41.lastFocusLock then
                v39.scrollDebounce = true;
                v39.motorActive = false;
                v39.anchorFramePosition = 0;
                if v39.state.listSize and v39.state.listSize > v41.listSize then
                    v39.anchorCanvasPosition = v39.relativeAnchorLocation;
                    return;
                else
                    v39.anchorCanvasPosition = v39:frameToCanvasPosition(v39.relativeAnchorLocation);
                end;
            end;
            return;
        end;
    end;
end;
v16.didUpdate = function(v52, v53, v54) --[[ Line: 359 ]] --[[ Name: didUpdate ]]
    -- upvalues: v4 (copy), v10 (copy)
    if not v52.alive then
        return;
    else
        v52.log:debug("didUpdate");
        if v4.isEmpty(v52.props.itemList) then
            return;
        elseif not v52.state.ready then
            v52.onResize(v52:getRef().current);
            return;
        else
            if v52.props.focusIndex ~= v53.focusIndex and v52.props.focusLock ~= v53.focusLock then
                v52.indexChanged = {
                    oldIndex = v53.focusIndex, 
                    newIndex = v52.props.focusIndex, 
                    lastFocusLock = v52.props.focusLock
                };
                v52.motorActive = false;
                v52.log:trace("self.props.focusIndex {}", v52.props.focusIndex);
                v52.log:trace("self.state.anchor.index {}", v52.state.anchor.index);
                v52.log:trace("previousState.anchor.index {}", v54.anchor.index);
            end;
            if not v52:adjustCanvas(v52.scrollingForward, v52.scrollingBackward) then
                if v52.indexChanged and v52.props.animateScrolling then
                    v52:scrollToAnchor();
                else
                    v52:moveToAnchor();
                end;
                if v52.anchorOffset ~= 0 then
                    v52:setState({});
                    return;
                else
                    v52.resized = false;
                    v52:loadMore();
                    v52.sizeDebounce = false;
                    if v52.updating then
                        v52.timeLog:info("End of update");
                    end;
                    v52.updating = false;
                    if v52.props.onScrollUpdate then
                        v52.props.onScrollUpdate({
                            leadIndex = v52.state.lead.index, 
                            anchorIndex = v52.state.anchor.index, 
                            trailIndex = v52.state.trail.index, 
                            animationActive = v52.motorActive
                        });
                    end;
                end;
            end;
            v52._sizePropChanged = false;
            v52.prevCycle = {
                frameSize = v52:measure(v52:getCurrent().AbsoluteSize), 
                canvasSize = v52.state.size, 
                canvasPosition = v10.nearest(v52:measure(v52:getCurrent().CanvasPosition)), 
                relativeAnchorLocation = v52.relativeAnchorLocation
            };
            return;
        end;
    end;
end;
v16.getDerivedStateFromProps = function(v55, v56) --[[ Line: 435 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v13 (copy), v4 (copy), v8 (copy), v9 (copy)
    v13:trace("getDerivedStateFromProps");
    if not v56.ready or v4.isEmpty(v55.itemList) then
        return nil;
    else
        local v57 = #v55.itemList;
        local v58 = nil;
        if v56.lastFocusLock ~= v55.focusLock then
            v13:trace("  Resetting focus lock {} to {}", v56.lastFocusLock, v55.focusLock);
            if v55.animateScrolling and v56.lastFocusLock ~= nil then
                v58 = v55.focusLock;
            else
                local v59 = v55.identifier(v55.itemList[v55.focusIndex]);
                return {
                    listSize = v57, 
                    trail = {
                        index = v55.focusIndex, 
                        id = v59
                    }, 
                    anchor = {
                        index = v55.focusIndex, 
                        id = v59
                    }, 
                    lead = {
                        index = v55.focusIndex, 
                        id = v59
                    }, 
                    padding = 0, 
                    size = 0, 
                    lastFocusLock = v55.focusLock
                };
            end;
        end;
        local v60, v61, v62 = v8(v55, v56);
        v13:trace("  Trailing index moved from {} to {}", v56.trail.index, v60);
        v13:trace("  Anchor index moved from {} to {}", v56.anchor.index, v61);
        v13:trace("  Leading index moved from {} to {}", v56.lead.index, v62);
        if v61 and v56.anchor.index == v61 and v60 and v56.trail.index == v60 and v62 and v56.lead.index == v62 then
            v13:trace("  No change, returning early");
            if v57 == v56.listSize then
                if v58 then
                    return {
                        lastFocusLock = v58
                    };
                else
                    return nil;
                end;
            else
                return {
                    listSize = v57, 
                    lastFocusLock = v58
                };
            end;
        else
            local v63 = v9({
                trailIndex = v60, 
                anchorIndex = v61, 
                leadIndex = v62
            }, {
                trailIndex = v56.trail.index, 
                anchorIndex = v56.anchor.index, 
                leadIndex = v56.lead.index
            }, v57);
            v13:trace("  Anchor index moved to {}", v63.anchorIndex);
            v13:trace("  Trailing index moved to {}", v63.trailIndex);
            v13:trace("  Leading index moved to {}", v63.leadIndex);
            local v64 = v55.identifier(v55.itemList[v63.trailIndex]);
            local v65 = v55.identifier(v55.itemList[v63.anchorIndex]);
            local v66 = v55.identifier(v55.itemList[v63.leadIndex]);
            return {
                listSize = v57, 
                trail = {
                    index = v63.trailIndex, 
                    id = v64
                }, 
                anchor = {
                    index = v63.anchorIndex, 
                    id = v65
                }, 
                lead = {
                    index = v63.leadIndex, 
                    id = v66
                }, 
                lastFocusLock = v58
            };
        end;
    end;
end;
v16.init = function(v67) --[[ Line: 515 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v13 (copy), v14 (copy), v3 (copy), v4 (copy), v10 (copy), v19 (copy), l_RunService_0 (copy), v15 (copy), v16 (copy)
    v67.guid = l_HttpService_0:GenerateGUID();
    v67.log = v13:new(script:GetFullName() .. "." .. v67.guid);
    v67.timeLog = v14:new(script:GetFullName() .. "." .. v67.guid);
    v67.log:debug("init");
    v67._ref = v3.createRef();
    v67.motorPrevValue = 0;
    v67.motorOnStep = function(v68) --[[ Line: 527 ]]
        -- upvalues: v67 (copy)
        v67.log:trace("onStep {}", v68);
        if not v67.motorActive or v67.indexChanged == nil then
            v67.motor:stop();
            return;
        elseif v67.indexChanged.currentPos == nil then
            v67.motor:stop();
            return;
        else
            local v69 = v68 - v67.motorPrevValue;
            if v67:getCurrent() then
                v67:scrollRelative(v69);
                v67.motorPrevValue = v68;
            end;
            return;
        end;
    end;
    v67.motorOnComplete = function() --[[ Line: 545 ]]
        -- upvalues: v67 (copy)
        v67.log:trace("otter onComplete");
        v67.motorActive = false;
        if v67.props.onScrollUpdate then
            v67.props.onScrollUpdate({
                leadIndex = v67.props.focusIndex, 
                anchorIndex = v67.props.focusIndex, 
                trailIndex = v67.props.focusIndex, 
                animationActive = v67.motorActive
            });
        end;
        v67.motorPrevValue = 0;
        v67.indexChanged = nil;
        if v67.motor then
            v67.motor:destroy();
        end;
    end;
    v67.motorActive = false;
    v67.springLock = 0;
    v67.scrollDebounce = false;
    v67.sizeDebounce = true;
    v67.indexChanged = nil;
    v67.onScroll = function(v70) --[[ Line: 572 ]]
        -- upvalues: v67 (copy), v4 (ref), v3 (ref), v10 (ref)
        v67.log:trace("onScroll");
        if not v67.alive or v67.resized then
            return;
        else
            v67.log:trace("  CanvasPosition is {}", v70.CanvasPosition);
            if v67.scrollDebounce then
                v67.log:trace("  Debouncing scroll");
                return;
            else
                local v71, v72 = v67:recalculateAnchor();
                v67.scrollingBackward = v71 < 0;
                v67.scrollingForward = v71 > 0;
                v67.log:trace("  Delta is {}", v71);
                v72 = v4.Dictionary.join(v72, v67:resetAnchorPosition(v72), v67:recalculateBounds(v67.scrollingForward, v67.scrollingBackward, v72));
                if not v4.isEmpty(v72) then
                    v67:setState(v72);
                end;
                if v67.props[v3.Change.CanvasPosition] then
                    v67.props[v3.Change.CanvasPosition](v70);
                end;
                v67.prevCycle.canvasPosition = v10.nearest(v67:measure(v70.CanvasPosition));
                return;
            end;
        end;
    end;
    v67.onResize = function(v73) --[[ Line: 607 ]]
        -- upvalues: v67 (copy), v10 (ref), v19 (ref), v3 (ref), l_RunService_0 (ref), v15 (ref)
        v67.log:trace("onResize");
        if not v67.alive then
            return;
        else
            local v74 = v67:measure(v73.AbsoluteSize);
            local v75 = v67:measure(v73.AbsolutePosition);
            v67.leadBufferPx = v10.nearest(v67.props.leadBuffer.Scale * v74 + v67.props.leadBuffer.Offset);
            v67.trailBufferPx = v10.nearest(v67.props.trailBuffer.Scale * v74 + v67.props.trailBuffer.Offset);
            v67.itemPadding = v67.props.padding.Scale * v74 + v67.props.padding.Offset;
            if v19[v67.props.orientation] then
                v67.relativeAnchorLocation = v10.nearest(v67.props.anchorLocation.Scale * v74 + v67.props.anchorLocation.Offset);
            else
                v67.relativeAnchorLocation = v10.nearest((1 - v67.props.anchorLocation.Scale) * v74 - v67.props.anchorLocation.Offset);
            end;
            v67.absoluteAnchorLocation = v67.relativeAnchorLocation + v75;
            v67.mountAboveAnchor = v67.relativeAnchorLocation + v67.props.mountingBuffer;
            v67.mountBelowAnchor = v74 - v67.relativeAnchorLocation + v67.props.mountingBuffer;
            v67.resized = true;
            v67.increasedSize = v67.state.size < v74;
            if v67.props[v3.Change.AbsoluteSize] then
                v67.props[v3.Change.AbsoluteSize](v73);
            end;
            if not v67.state.ready then
                v67.log:trace("  Setting initial anchor position to {}", v67.relativeAnchorLocation);
                v67.anchorFramePosition = 0;
                v67.anchorCanvasPosition = v67.relativeAnchorLocation;
                coroutine.wrap(function() --[[ Line: 649 ]]
                    -- upvalues: l_RunService_0 (ref), v67 (ref), v15 (ref)
                    l_RunService_0.Heartbeat:Wait();
                    if not v67.state.ready and v67.alive then
                        v67:setState({
                            ready = true
                        });
                        if v67.props[v15] then
                            v67.props[v15]:Fire();
                        end;
                    end;
                end)();
                return;
            else
                v67:handleResize(v74);
                return;
            end;
        end;
    end;
    v67.onContentResize = function() --[[ Line: 667 ]]
        -- upvalues: v67 (copy)
        v67.log:trace("onContentResize");
        if not v67.alive or v67.sizeDebounce or not v67.state.ready or v67:isScrollingWithElasticBehavior() then
            v67.log:trace("  Skipping onContentResize");
            return;
        else
            v67:setState({});
            return;
        end;
    end;
    v67.anchorCanvasPosition = 0;
    v67.anchorFramePosition = 0;
    v67.anchorOffset = 0;
    v67.metadata = {};
    v67.pools = {};
    v67.refpool = {};
    v67.scrollingBackward = false;
    v67.scrollingForward = false;
    v67.lastLoadPrevItems = nil;
    v67.lastLoadNextItems = nil;
    v67.alive = true;
    v67.updating = false;
    v67.propsToClear = {};
    for v76, _ in pairs(v16.defaultProps) do
        v67.propsToClear[v76] = v4.None;
    end;
    v67:setState({
        ready = false, 
        lastFocusLock = nil, 
        padding = 0, 
        size = 0
    });
end;
v16.willUnmount = function(v78) --[[ Line: 709 ]] --[[ Name: willUnmount ]]
    if v78.motor then
        v78.motor:destroy();
    end;
    v78.alive = false;
end;
v16.recalculateAnchor = function(v79) --[[ Line: 718 ]] --[[ Name: recalculateAnchor ]]
    v79.log:trace("recalculateAnchor");
    local v80 = v79:findIndexAt(v79:absoluteToCanvasPosition(v79.absoluteAnchorLocation), v79.state.anchor.index, false);
    v79.anchorCanvasPosition = v79:getAnchorCanvasFromIndex(v80);
    v79.anchorFramePosition = v79:getAnchorFrameFromIndex(v80);
    local v81 = nil;
    if v80 == v79.state.anchor.index then
        v79.log:trace("  Current anchor still works");
        return 0, {};
    else
        v81 = v80 < v79.state.anchor.index and -1 or 1;
        v79.log:trace("  New anchor at index {}", v80);
        v79.log:trace("  New anchor at canvas position {}", v79.anchorCanvasPosition);
        v79.log:trace("  New anchor at frame position {}", v79.anchorFramePosition);
        return v81, {
            anchor = {
                index = v80, 
                id = v79:getID(v80)
            }
        };
    end;
end;
v16.resetAnchorPosition = function(v82, v83) --[[ Line: 749 ]] --[[ Name: resetAnchorPosition ]]
    -- upvalues: v10 (copy)
    local v84 = v83 and v83.anchor or v82.state.anchor;
    local v85 = v83 and v83.padding or v82.state.padding;
    v82.log:trace("resetAnchorPosition");
    v82.log:trace("  Anchor index is {}", v84.index);
    local v86 = v82:getAnchorCanvasFromIndex(v84.index);
    v82.log:trace("  Anchor is at {}", v86);
    v82.log:trace("  Anchor offset is {}", v82.anchorOffset);
    local v87 = v82.anchorCanvasPosition - v82.anchorOffset;
    v82.log:trace("  Anchor should be at {}", v87);
    local v88 = v10.nearest(v87 - v86);
    if v88 ~= 0 then
        v82.log:trace("  Changing padding from {} to {}", v85, v85 + v88);
        v82.log:trace("  Changing anchorCanvasPosition from {} to {}", v82.anchorCanvasPosition, v10.nearest(v82.anchorCanvasPosition - v82.anchorOffset));
        v82.anchorCanvasPosition = v10.nearest(v82.anchorCanvasPosition - v82.anchorOffset);
        v82.anchorOffset = 0;
        return {
            padding = v85 + v88
        };
    else
        return {};
    end;
end;
v16.getCurrentPadding = function(v89) --[[ Line: 773 ]] --[[ Name: getCurrentPadding ]]
    local l_padding_0 = v89:getCurrent().padding;
    return l_padding_0.Size.X.Offset + l_padding_0.Size.Y.Offset;
end;
v16.recalculateBounds = function(v91, v92, v93, v94) --[[ Line: 781 ]] --[[ Name: recalculateBounds ]]
    local v95 = v94 and v94.lead or v91.state.lead;
    local v96 = v94 and v94.trail or v91.state.trail;
    local v97 = v94 and v94.anchor or v91.state.anchor;
    v91.log:trace("recalculateBounds");
    v91.log:trace("  Leading index was {}", v95.index);
    v91.log:trace("  Trailing index was {}", v96.index);
    local v98 = v91:getAnchorCanvasFromIndex(v97.index);
    local v99 = v98 - v91.mountAboveAnchor;
    local v100 = v98 + v91.mountBelowAnchor;
    v91.log:trace("  Target for top at {}", v99);
    v91.log:trace("  Target for bottom at {}", v100);
    local v101 = v91:findIndexAt(v99, v97.index, true);
    v91.log:trace("  Found new top index at {}", v101);
    local v102 = v91:findIndexAt(v100, v97.index, true);
    v91.log:trace("  Found new bottom index at {}", v102);
    local v103 = math.max(v101, v102);
    if v103 < v95.index and not v93 then
        v103 = v95.index;
    end;
    local v104 = math.min(v101, v102);
    if v96.index < v104 and not v92 then
        v104 = v96.index;
    end;
    if v104 < v96.index or v95.index < v103 then
        v91.log:trace("  Changing leading index to {}", v103);
        v91.log:trace("  Changing trailing index to {}", v104);
        return {
            trail = {
                index = v104, 
                id = v91:getID(v104)
            }, 
            lead = {
                index = v103, 
                id = v91:getID(v103)
            }
        };
    else
        return {};
    end;
end;
v16.findIndexAt = function(v105, v106, v107, v108) --[[ Line: 824 ]] --[[ Name: findIndexAt ]]
    -- upvalues: v10 (copy)
    v105.log:trace("  findIndexAt");
    local v109 = v107 or v105.state.anchor.index;
    local v110 = v105:distanceToPosition(v109, v106);
    v105.log:trace("    Searching from index {}", v109);
    v105.log:trace("    Position is {} from {}", v110, v106);
    if v110 == 0 then
        local v111 = v109 + v10.awayFromZero(v105.props.anchorLocation.Scale - 0.5);
        if v105.state.listSize < v111 or v111 < 1 then
            return v109;
        elseif v105:distanceToPosition(v111, v106) == 0 then
            return v111;
        else
            return v109;
        end;
    else
        local v112 = v110 < 0 and v105.state.trail.index or v105.state.lead.index;
        v105.log:trace("    Nearest end at {}", v112);
        if v109 == v112 then
            v105.log:trace("    Hint index already at end");
            if v109 + v110 < v105.state.trail.index or v109 + v110 > v105.state.lead.index then
                v105.log:trace("    Target out of bounds");
                if not v108 then
                    return v109;
                else
                    local v113 = v10.awayFromZero(v110 / v105.props.estimatedItemSize);
                    v105.log:trace("    Estimating target at {} from end", v113);
                    return (math.min(math.max(v109 + v113, 1), v105.state.listSize));
                end;
            end;
        else
            local v114 = v105:distanceToPosition(v112, v106);
            v105.log:trace("    End is {} from target", v114);
            if v114 == 0 then
                return v112;
            elseif v110 * v114 > 0 then
                v105.log:trace("    Target out of bounds");
                if not v108 then
                    return v112;
                else
                    local v115 = v10.awayFromZero(v114 / v105.props.estimatedItemSize);
                    v105.log:trace("    Estimating target at {} from end", v115);
                    return (math.min(math.max(v112 + v115, 1), v105.state.listSize));
                end;
            else
                local v116 = math.abs(v110) + math.abs(v114);
                local v117 = math.abs(v109 - v112);
                v109 = v109 + v10.nearest(v117 * v110 / v116);
                v110 = v105:distanceToPosition(v109, v106);
                v105.log:trace("    Interpolated index is {}", v109);
                v105.log:trace("    Distance from interpolated index is {}", v110);
            end;
        end;
        while v110 ~= 0 do
            if v110 < 0 then
                v109 = v109 - 1;
            else
                v109 = v109 + 1;
            end;
            v110 = v105:distanceToPosition(v109, v106);
            v105.log:trace("    Distance after step is {}", v110);
        end;
        return v109;
    end;
end;
v16.findIndexWithRemainder = function(v118, v119, v120, v121) --[[ Line: 908 ]] --[[ Name: findIndexWithRemainder ]]
    -- upvalues: v19 (copy), v10 (copy)
    local v122 = v19[v118.props.orientation];
    if v119 < (v122 and v118.leadBufferPx or v118.trailBufferPx) then
        return v122 and v118.state.listSize or 1, 0;
    elseif v10.nearest(v118:measure(v118:getCurrent().CanvasSize).Offset) < v119 then
        return v122 and 1 or v118.state.listSize, 0;
    else
        local v123 = v118:findIndexAt(v119, v120, v121);
        local v124 = v118:getAnchorCanvasFromIndex(v123);
        local v125 = v123 + v10.awayFromZero(v118.props.anchorLocation.Scale - 0.5);
        if v118.state.listSize < v125 or v125 < 1 then
            return v123, 0;
        elseif v118:distanceToPosition(v125, v119) == 0 then
            return v125, 0;
        else
            return v123, v124 - v119;
        end;
    end;
end;
v16.checkTrimTopError = function(v126, v127) --[[ Line: 938 ]] --[[ Name: checkTrimTopError ]]
    if v126.lastTrimTop == v127 then
        if v126.numberOfTopTrims >= 3 then
            error("There was an error laying out the items.  Check to see if you provided enough leadBuffer and/or trailBuffer");
            return;
        else
            v126.numberOfTopTrims = v126.numberOfTopTrims + 1;
            return;
        end;
    else
        v126.lastTrimTop = v127;
        v126.numberOfTopTrims = 0;
        return;
    end;
end;
v16.trimTopHelper = function(v128, v129, v130, v131, v132, v133, v134) --[[ Line: 951 ]] --[[ Name: trimTopHelper ]]
    -- upvalues: v10 (copy)
    local v135 = v129 and v128.leadBufferPx or v128.trailBufferPx;
    if v131 + v134 < v135 then
        v134 = v131 - v135;
    end;
    if v134 >= 0 or v130 + v134 < 0 then
        return {};
    else
        v128:checkTrimTopError(v134);
        local v136 = v10.nearest(v130 + v134);
        local v137 = v10.nearest(v131 + v134);
        local v138 = v10.nearest(v128.anchorCanvasPosition + v134);
        v128.log:trace("  Changing anchor canvas position from {} to {}", v128.anchorCanvasPosition, v138);
        v128.anchorCanvasPosition = v138;
        local v139 = v128:getChildFramePosition(v133);
        local v140 = v132.index - 1;
        if v140 > 0 and v139 > 0 and v128:getChildCanvasPosition(v140) > v128.anchorCanvasPosition then
            local v141 = {
                index = v140, 
                id = v128:getID(v140)
            };
            return {
                size = v136, 
                padding = v137, 
                anchor = v141
            };
        else
            return {
                size = v136, 
                padding = v137
            };
        end;
    end;
end;
v16.trimTop = function(v142, v143, v144, v145, v146, v147, v148) --[[ Line: 997 ]] --[[ Name: trimTop ]]
    local v149 = v143 and v147 == v142.state.listSize or not v143 and v147 == 1;
    local v150 = v143 and v142.leadBufferPx or v142.trailBufferPx;
    return v142:trimTopHelper(v143, v144, v145, v146, v147, v149 and v150 - v148 or 0);
end;
v16.shortTrimTop = function(v151, v152, v153, v154, v155, v156, v157) --[[ Line: 1006 ]] --[[ Name: shortTrimTop ]]
    -- upvalues: v10 (copy)
    local v158 = v151:getChildFramePosition(v157);
    local v159 = v152 and v151.trailBufferPx or v151.leadBufferPx;
    local _ = nil;
    return v151:trimTopHelper(v152, v153, v155, v156, v157, if v158 >= 0 and v158 <= v154 then -v10.towardsZero(v153 - v159 - v154) else v158);
end;
v16.checkTrimBottomError = function(v161, v162) --[[ Line: 1022 ]] --[[ Name: checkTrimBottomError ]]
    if v161.lastTrimBottom == v162 then
        if v161.numberOfBottomTrims >= 3 then
            error("There was an error laying out the items.  Check to see if you provided enough leadBuffer and/or trailBuffer");
            return;
        else
            v161.numberOfBottomTrims = v161.numberOfBottomTrims + 1;
            return;
        end;
    else
        v161.lastTrimBottom = v162;
        v161.numberOfBottomTrims = 0;
        return;
    end;
end;
v16.trimBottomHelper = function(v163, v164, v165) --[[ Line: 1035 ]] --[[ Name: trimBottomHelper ]]
    -- upvalues: v10 (copy)
    if v165 <= 0 then
        return {};
    else
        v163:checkTrimBottomError(v165);
        return {
            size = v10.nearest(v164 - v165)
        };
    end;
end;
v16.trimBottom = function(v166, v167, v168, v169, v170) --[[ Line: 1052 ]] --[[ Name: trimBottom ]]
    local v171 = v167 and v168 == 1 or not v167 and v168 == v166.state.listSize;
    local v172 = v167 and v166.trailBufferPx or v166.leadBufferPx;
    local v173 = v171 and v170 - v172 - v169 or 0;
    if v166.resized and v166.increasedSize then
        return {};
    else
        return v166:trimBottomHelper(v170, v173);
    end;
end;
v16.shortTrimBottom = function(v174, v175, v176, v177, v178, v179) --[[ Line: 1065 ]] --[[ Name: shortTrimBottom ]]
    local v180 = v174:getChildFramePosition(v176) + v174:getChildSize(v176);
    if v180 >= 0 and v180 <= v179 then
        return {};
    else
        return v174:trimBottomHelper(v178, v178 - (v175 and v174.trailBufferPx or v174.leadBufferPx) - v177);
    end;
end;
v16.adjustEdges = function(v181, v182) --[[ Line: 1083 ]] --[[ Name: adjustEdges ]]
    -- upvalues: v10 (copy), v19 (copy), v4 (copy)
    v181.log:trace("adjustEdges");
    local v183 = v182.size or v181.state.size;
    v183 = v10.nearest(v183);
    local v184 = v182.padding or v181.state.padding;
    local v185 = v182.anchor or v181.state.anchor;
    local v186 = v19[v181.props.orientation];
    local v187 = v181:measure(v181:getCurrent().AbsoluteSize);
    local v188 = v186 and v181.state.lead.index or v181.state.trail.index;
    local v189 = v10.nearest(v181:getChildCanvasPosition(v188)) - v181.itemPadding;
    local v190 = v186 and v181.state.trail.index or v181.state.lead.index;
    local v191 = v181:getChildSize(v190);
    local v192 = v10.nearest(v181:getChildCanvasPosition(v190) + v191);
    local v193 = v181.leadBufferPx + v181.trailBufferPx + (v192 - v189);
    local v194 = nil;
    if v192 - v189 <= v187 or v193 <= v187 then
        if v186 then
            local v195 = v181:trimBottom(v186, v190, v192, v183);
            local v196 = v181:shortTrimTop(v186, v195.size or v183, v187, v184, v185, v188);
            v194 = v4.Dictionary.join(v195, v196);
        else
            local v197 = v181:trimTop(v186, v183, v184, v185, v188, v189);
            local v198 = v181:shortTrimBottom(v186, v190, v192, v197.size or v183, v187);
            v194 = v4.Dictionary.join(v197, v198);
        end;
    else
        local v199 = v181:trimTop(v186, v183, v184, v185, v188, v189);
        local v200 = v181:trimBottom(v186, v190, v192, v199.size or v183);
        v194 = v4.Dictionary.join(v199, v200);
    end;
    if v194.size then
        v181.log:trace("  Changing canvas size from {} to {}", v183, v194.size);
    end;
    if v194.padding then
        v181.log:trace("  Changing canvas padding from {} to {}", v184, v194.padding);
    end;
    if v194.anchor then
        v181.log:trace("  Changing anchor index from {} to {}", v185.index, v194.anchor.index);
    end;
    return v194;
end;
v16.expandCanvas = function(v201, v202) --[[ Line: 1137 ]] --[[ Name: expandCanvas ]]
    -- upvalues: v19 (copy), v10 (copy)
    v201.log:trace("expandCanvas");
    local v203 = v19[v201.props.orientation];
    local v204 = v203 and v201.state.trail.index or v201.state.lead.index;
    local v205 = v203 and v201.leadBufferPx or v201.trailBufferPx;
    local v206 = v203 and v201.trailBufferPx or v201.leadBufferPx;
    local v207 = v202.size or v201.state.size;
    v207 = v10.nearest(v207);
    local l_v207_0 = v207;
    local v209 = v202.padding or v201.state.padding;
    local l_v209_0 = v209;
    local v211 = v201:getCurrentPadding();
    local v212 = v201:getChildCanvasPosition(v204) + v201:getChildSize(v204) - (v211 - v209);
    local v213 = v10.nearest(v212 + v206);
    v201.log:trace("  Padding is {}", v209);
    v201.log:trace("  Padding should be at least {}", v205);
    if v209 < v205 then
        local v214 = v209 - v205;
        v207 = v10.nearest(v207 - v214);
        v201.anchorCanvasPosition = v10.nearest(v201.anchorCanvasPosition - v214);
        v209 = v205;
        v201.log:trace("  Expanding canvas top to size {}", v207);
        v201.log:trace("  Shifting anchor to {}", v201.anchorCanvasPosition);
        v201.log:trace("  Padding is now {}", v209);
    end;
    v201.log:trace("  Bottom of bottom child is {}", v212);
    v201.log:trace("  Canvas size is {}", l_v207_0);
    v201.log:trace("  Canvas bottom should be {}", v213);
    local v215 = v201:measure(v201:getCurrent().AbsoluteSize) - math.max(0, v209);
    if l_v207_0 < v215 then
        v207 = v215;
        v201.log:trace("  Expanding canvas to minimum size {}", v207);
    end;
    if l_v207_0 < v213 then
        v207 = math.max(v213, v207);
        v201.log:trace("  Expanding canvas bottom to size {}", v207);
    end;
    if v207 ~= l_v207_0 or v209 ~= l_v209_0 then
        v201.log:trace("  Changing size from {} to {}", l_v207_0, v207);
        v201.log:trace("  Changing padding from {} to {}", l_v209_0, v209);
        return {
            size = v207, 
            padding = v209
        };
    else
        v201.log:trace("  No changes to size or padding");
        return {};
    end;
end;
v16.adjustCanvas = function(v216, v217, v218) --[[ Line: 1199 ]] --[[ Name: adjustCanvas ]]
    -- upvalues: v4 (copy)
    v216.log:trace("adjustCanvas");
    if v216._sizePropChanged then
        v216.log:trace("  Skipping because Size prop changed");
        return true;
    else
        local v219 = v4.Dictionary.join(v216:resetAnchorPosition(), v216:recalculateBounds(v217, v218));
        if not v219.trail and not v219.lead then
            v219 = v4.Dictionary.join(v219, v216:expandCanvas(v219));
        end;
        if not v219.size and not v219.padding then
            v219 = v4.Dictionary.join(v219, v216:adjustEdges(v219));
        end;
        if v4.isEmpty(v219) then
            v216.log:trace("  No state changes after adjustment");
            return false;
        else
            v216:setState(v219);
            return true;
        end;
    end;
end;
v16.handleResize = function(v220, v221) --[[ Line: 1230 ]] --[[ Name: handleResize ]]
    -- upvalues: v19 (copy), v10 (copy)
    local v222 = v19[v220.props.orientation];
    local v223 = v10.nearest(v220:measure(v220:getCurrent().CanvasSize).Offset);
    local v224 = v220:measure(v220:getCurrent().AbsoluteSize);
    local v225 = v222 and v220.leadBufferPx or v220.trailBufferPx;
    local v226 = v222 and v220.trailBufferPx or v220.leadBufferPx;
    local v227 = v222 and v220.state.trail.index or v220.state.lead.index;
    local v228 = v222 and v220.state.lead.index or v220.state.trail.index;
    local v229 = v220:getChildSize(v227);
    local v230 = v10.nearest(v220:getChildCanvasPosition(v228)) - v220.itemPadding;
    local v231 = v10.nearest(v220:getChildCanvasPosition(v227)) + v229 + v226 - v230;
    local v232 = 0;
    if v220.prevCycle.frameSize and v221 then
        v232 = v221 - v220.prevCycle.frameSize;
    end;
    local v233 = v220.prevCycle.canvasPosition + v220.prevCycle.frameSize;
    local v234 = math.max(v220.prevCycle.canvasSize - v226 - v233, 0);
    local l_canvasPosition_0 = v220.prevCycle.canvasPosition;
    local v236 = 0;
    if v224 < v223 then
        v236 = v230 - v225;
    end;
    local v237 = nil;
    local v238 = nil;
    if v232 < 0 then
        if v220.relativeAnchorLocation > v224 * 0.5 then
            v238 = math.min(v236, v232);
            v237 = v232 - v238;
        else
            v237 = v232;
            v238 = 0;
        end;
    elseif v220.relativeAnchorLocation > v224 * 0.5 then
        v238 = math.min(l_canvasPosition_0, v232);
        local v239 = v232 - v238;
        v237 = math.min(v234, v239);
        v238 = v238 + (v239 - v237);
    else
        v237 = math.min(v234, v232);
        local v240 = v232 - v237;
        v238 = math.min(l_canvasPosition_0, v240);
        v237 = v237 + (v240 - v238);
    end;
    if v220.relativeAnchorLocation >= v224 * 0.5 then
        local v241 = v220:getAnchorCanvasFromIndex(v220.state.anchor.index) - v220.anchorFramePosition;
        local v242, v243 = v220:findIndexWithRemainder(v241 + v232 - v238, v220.state.anchor.index, false);
        v220.anchorFramePosition = math.max(v243, 0);
        v220.anchorCanvasPosition = math.min(v241 + v232, v223 - v226);
        if v232 > 0 then
            v220.anchorOffset = l_canvasPosition_0 + v220.anchorFramePosition - v238;
        end;
        v220:setState({
            anchor = {
                index = v242, 
                id = v220:getID(v242)
            }
        });
        return;
    else
        local l_v223_0 = v223;
        if v231 < v223 then
            l_v223_0 = math.min(v231, v223 + v237);
        end;
        local v245, v246 = v220:findIndexWithRemainder(v220.anchorCanvasPosition - v238, v220.state.anchor.index, false);
        if math.abs(v237) < math.abs(v232) then
            v220.anchorFramePosition = 0;
        elseif v245 == v220.state.anchor.index then
            v220.anchorFramePosition = v220.anchorFramePosition + v238;
        else
            v220.anchorFramePosition = v220.anchorFramePosition + v246;
        end;
        v220.anchorCanvasPosition = v220.anchorCanvasPosition - v238;
        v220:setState({
            size = l_v223_0, 
            anchor = {
                index = v245, 
                id = v220:getID(v245)
            }
        });
        return;
    end;
end;
v16.scrollToAnchor = function(v247) --[[ Line: 1340 ]] --[[ Name: scrollToAnchor ]]
    -- upvalues: v6 (copy)
    if v247.motorActive then
        return;
    else
        v247.log:trace("scrollToAnchor");
        if v247.indexChanged == nil then
            v247:moveToAnchor();
        end;
        local l_newIndex_0 = v247.indexChanged.newIndex;
        local l_oldIndex_0 = v247.indexChanged.oldIndex;
        v247.log:trace(" newIndex {}", l_newIndex_0);
        v247.log:trace(" previousIndex {}", l_oldIndex_0);
        local v250 = v247:measure(v247:getCurrent().CanvasPosition) + v247.relativeAnchorLocation;
        local v251 = v247:getAnchorCanvasFromIndex(l_newIndex_0);
        v247.log:trace(" old anchor pos {}", v250);
        v247.log:trace(" new anchor pos {}", v251);
        v247.indexChanged.currentPos = v250;
        v247.indexChanged.newPos = v251;
        v247.motorActive = true;
        v247.springLock = v247.springLock + 1;
        local v252 = v251 - v250;
        v247.log:trace(" delta {}", v252);
        v247.motor = v6.createSingleMotor(0);
        v247.motor:onStep(v247.motorOnStep);
        v247.motor:onComplete(v247.motorOnComplete);
        v247.motor:setGoal(v6.spring(v252, v247.props.animateOptions));
        return;
    end;
end;
v16.moveToAnchor = function(v253) --[[ Line: 1374 ]] --[[ Name: moveToAnchor ]]
    -- upvalues: v10 (copy)
    v253.log:trace("moveToAnchor");
    if v253.motorActive then
        return;
    elseif v253:isScrollingWithElasticBehavior() then
        return;
    else
        local v254 = v253:getAnchorFramePosition();
        v253.log:trace("  Anchor was at frame position {}", v253.anchorFramePosition);
        v253.log:trace("  Anchor is currently at frame position {}", v254);
        local v255 = v253:measure(v253:getCurrent().CanvasPosition) + v254 - v253.anchorFramePosition;
        v253.log:trace("  Canvas should scroll to {}", v255);
        local v256 = v253:getCurrent();
        local v257 = math.max(0, v253:measure(v256.CanvasSize).Offset - v253:measure(v256.AbsoluteSize));
        v253:setScroll(v255);
        if v255 < 0 then
            v253.log:trace("  Canvas scroll limited to 0, was {}", v255);
            v253.anchorOffset = v10.towardsZero(v255);
            return;
        elseif v257 <= v255 then
            v253.log:trace("  Canvas scroll limited to {}, was {}", v257, v255);
            v253.anchorOffset = v10.towardsZero(v255 - v257);
            return;
        else
            v253.log:trace("  Clearing anchorOffset");
            v253.anchorOffset = 0;
            return;
        end;
    end;
end;
v16.isScrollingWithElasticBehavior = function(v258) --[[ Line: 1405 ]] --[[ Name: isScrollingWithElasticBehavior ]]
    -- upvalues: v19 (copy), v10 (copy)
    if v258.resized then
        return false;
    else
        local v259 = v19[v258.props.orientation];
        local v260 = v259 and v258.state.lead.index or v258.state.trail.index;
        local v261 = v259 and v258.state.listSize or 1;
        if v258:measure(v258:getCurrent().CanvasPosition) < 0 and v260 == v261 then
            return true;
        else
            local v262 = v259 and v258.state.trail.index or v258.state.lead.index;
            local v263 = v258:measure(v258:getCurrent().AbsoluteSize);
            local v264 = v258:measure(v258:getCurrent().CanvasPosition);
            local v265 = v259 and 1 or v258.state.listSize;
            if v10.nearest(v264 + v263) > v10.nearest(v258:measure(v258:getCurrent().CanvasSize).Offset) and v262 == v265 and v264 > 0 then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
v16.loadMore = function(v266) --[[ Line: 1436 ]] --[[ Name: loadMore ]]
    v266.log:trace("loadMore");
    if v266.props.loadPrevious and v266.state.trail.index <= v266.props.loadingBuffer and v266.props.itemList ~= v266.lastLoadPrevItems then
        v266.log:trace("  Calling loadPrevious");
        v266.lastLoadPrevItems = v266.props.itemList;
        v266.props.loadPrevious();
    end;
    if v266.props.loadNext and v266.state.lead.index > v266.state.listSize - v266.props.loadingBuffer and v266.props.itemList ~= v266.lastLoadNextItems then
        v266.log:trace("  Calling loadNext");
        v266.lastLoadNextItems = v266.props.itemList;
        v266.props.loadNext();
    end;
end;
v16.setScroll = function(v267, v268) --[[ Line: 1456 ]] --[[ Name: setScroll ]]
    -- upvalues: v18 (copy)
    v267.log:trace("    Scrolling to {}", v268);
    v267.scrollDebounce = true;
    v267:getCurrent().CanvasPosition = v18[v267.props.orientation] and Vector2.new(v267:getCurrent().CanvasPosition.X, v268) or Vector2.new(v268, v267:getCurrent().CanvasPosition.Y);
    v267.scrollDebounce = false;
end;
v16.scrollRelative = function(v269, v270) --[[ Line: 1466 ]] --[[ Name: scrollRelative ]]
    v269.log:trace("  Current CanvasPosition {}", v269:getCurrent().CanvasPosition);
    v269.log:trace("self.motorActive {}", v269.motorActive);
    v269:setScroll(v269:measure(v269:getCurrent().CanvasPosition) + v270, true);
    v269.onScroll(v269:getCurrent());
end;
v16.distanceToPosition = function(v271, v272, v273) --[[ Line: 1479 ]] --[[ Name: distanceToPosition ]]
    -- upvalues: v10 (copy), v11 (copy), v20 (copy)
    local v274 = v271:getRbx(v272);
    if not v274 then
        return nil;
    else
        local v275 = v271:absoluteToCanvasPosition(v271:measure(v274.AbsolutePosition)) - v271.itemPadding;
        local v276 = v271:measure(v274.AbsoluteSize) + 2 * v271.itemPadding;
        return v10.nearest(v11.fromPointToRangeSigned(v273, v275, v276) * v20[v271.props.orientation]);
    end;
end;
v16.getAnchorCanvasPosition = function(v277) --[[ Line: 1492 ]] --[[ Name: getAnchorCanvasPosition ]]
    return v277:getAnchorCanvasFromIndex(v277.state.anchor.index);
end;
v16.getAnchorCanvasFromIndex = function(v278, v279) --[[ Line: 1496 ]] --[[ Name: getAnchorCanvasFromIndex ]]
    -- upvalues: v19 (copy), v10 (copy)
    local l_Scale_0 = v278.props.anchorLocation.Scale;
    if not v19[v278.props.orientation] then
        l_Scale_0 = 1 - l_Scale_0;
    end;
    return v10.nearest(v278:getChildCanvasPosition(v279) + l_Scale_0 * v278:getChildSize(v279));
end;
v16.getAnchorFramePosition = function(v281) --[[ Line: 1506 ]] --[[ Name: getAnchorFramePosition ]]
    return v281:getAnchorFrameFromIndex(v281.state.anchor.index);
end;
v16.getAnchorFrameFromIndex = function(v282, v283) --[[ Line: 1510 ]] --[[ Name: getAnchorFrameFromIndex ]]
    -- upvalues: v19 (copy), v10 (copy)
    local l_Scale_1 = v282.props.anchorLocation.Scale;
    if not v19[v282.props.orientation] then
        l_Scale_1 = 1 - l_Scale_1;
    end;
    return v10.nearest(v282:getChildFramePosition(v283) + l_Scale_1 * v282:getChildSize(v283)) - v282.relativeAnchorLocation;
end;
v16.absoluteToCanvasPosition = function(v285, v286) --[[ Line: 1521 ]] --[[ Name: absoluteToCanvasPosition ]]
    local v287 = v285:getCurrent();
    local l_CanvasPosition_0 = v287.CanvasPosition;
    local l_AbsolutePosition_0 = v287.AbsolutePosition;
    return v286 + v285:measure(l_CanvasPosition_0) - v285:measure(l_AbsolutePosition_0);
end;
v16.absoluteToFramePosition = function(v290, v291) --[[ Line: 1529 ]] --[[ Name: absoluteToFramePosition ]]
    return v291 - v290:measure(v290:getCurrent().AbsolutePosition);
end;
v16.frameToCanvasPosition = function(v292, v293) --[[ Line: 1536 ]] --[[ Name: frameToCanvasPosition ]]
    return v293 + v292:measure(v292:getCurrent().CanvasPosition);
end;
v16.getChildCanvasPosition = function(v294, v295) --[[ Line: 1543 ]] --[[ Name: getChildCanvasPosition ]]
    local v296 = v294:getRbx(v295);
    return v296 and v294:absoluteToCanvasPosition(v294:measure(v296.AbsolutePosition)) or 0;
end;
v16.getChildFramePosition = function(v297, v298) --[[ Line: 1549 ]] --[[ Name: getChildFramePosition ]]
    local v299 = v297:getRbx(v298);
    return v299 and v297:absoluteToFramePosition(v297:measure(v299.AbsolutePosition)) or 0;
end;
v16.getChildSize = function(v300, v301) --[[ Line: 1555 ]] --[[ Name: getChildSize ]]
    local v302 = v300:getRbx(v301);
    return v302 and v300:measure(v302.AbsoluteSize) or 0;
end;
v16.getID = function(v303, v304) --[[ Line: 1561 ]] --[[ Name: getID ]]
    return v303.props.identifier(v303.props.itemList[v304]);
end;
v16.updateMetadata = function(v305, v306, v307, v308) --[[ Line: 1567 ]] --[[ Name: updateMetadata ]]
    -- upvalues: v3 (copy)
    local v309 = v305.metadata[v306];
    if not v309 then
        v309 = {};
        v305.metadata[v306] = v309;
    end;
    if not v309.name then
        v309.class = tostring(v308.renderItem(v307, false).component);
        v309.name = v305:getKeyPool(v309.class):get();
    end;
    if not v305.refpool[v309.name] then
        v305.refpool[v309.name] = v3.createRef();
    end;
    v309.ref = v305.refpool[v309.name];
end;
v16.clearMetadata = function(v310, v311) --[[ Line: 1588 ]] --[[ Name: clearMetadata ]]
    -- upvalues: v4 (copy)
    local v312 = v310.metadata[v311];
    if not v312 then
        return;
    else
        if not v4.List.find(v310.props.recyclingDisabledFor, v312.class) then
            v312.name:release();
        end;
        v312.name = nil;
        v312.ref = nil;
        return;
    end;
end;
v16.getKeyPool = function(v313, v314) --[[ Line: 1606 ]] --[[ Name: getKeyPool ]]
    -- upvalues: v12 (copy)
    if not v313.pools[v314] then
        v313.pools[v314] = v12.new(v314);
    end;
    return v313.pools[v314];
end;
v16.getMetadata = function(v315, v316) --[[ Line: 1614 ]] --[[ Name: getMetadata ]]
    return v315.metadata[v315:getID(v316)];
end;
v16.getRbx = function(v317, v318) --[[ Line: 1619 ]] --[[ Name: getRbx ]]
    local v319 = v317:getMetadata(v318);
    return v319 and v319.ref and v319.ref.current;
end;
v16.measure = function(v320, v321) --[[ Line: 1625 ]] --[[ Name: measure ]]
    -- upvalues: v18 (copy)
    return v18[v320.props.orientation] and v321.Y or v321.X;
end;
v16.getCurrent = function(v322) --[[ Line: 1630 ]] --[[ Name: getCurrent ]]
    return v322:getRef().current;
end;
v16.getRef = function(v323) --[[ Line: 1634 ]] --[[ Name: getRef ]]
    -- upvalues: v3 (copy)
    return v323.props[v3.Ref] or v323._ref;
end;
return v16;