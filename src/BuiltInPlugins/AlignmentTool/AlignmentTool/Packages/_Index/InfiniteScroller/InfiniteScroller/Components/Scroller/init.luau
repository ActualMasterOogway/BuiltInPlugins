local l_RunService_0 = game:GetService("RunService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script:FindFirstAncestor("InfiniteScroller").Parent;
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
local v16 = v3.Component:extend("Scroller");
local v17 = require(script.Parent.Parent.Flags.GetFFlagFixLoadMoreScrollDebounce);
v16.Orientation = require(script.Parent.Orientation);
local v18 = {
    frequency = 4, 
    dampingRatio = 1
};
local v19 = {
    [v16.Orientation.Up] = true, 
    [v16.Orientation.Down] = true, 
    [v16.Orientation.Left] = false, 
    [v16.Orientation.Right] = false
};
local v20 = {
    [v16.Orientation.Up] = true, 
    [v16.Orientation.Down] = false, 
    [v16.Orientation.Left] = true, 
    [v16.Orientation.Right] = false
};
local v21 = {
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
    scrollingFrameRef = v5.optional(v5.table), 
    [v15] = v5.any
});
v16.defaultProps = {
    itemList = {}, 
    renderItem = {}, 
    identifier = function(v22) --[[ Line: 137 ]] --[[ Name: identifier ]]
        return v22;
    end, 
    orientation = v16.Orientation.Down, 
    loadNext = function() --[[ Line: 141 ]] --[[ Name: loadNext ]]

    end, 
    loadPrevious = function() --[[ Line: 142 ]] --[[ Name: loadPrevious ]]

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
    animateOptions = v18, 
    extraProps = {}, 
    onScrollUpdate = function() --[[ Line: 156 ]] --[[ Name: onScrollUpdate ]]

    end, 
    recyclingDisabledFor = {}, 
    [v15] = false
};
v16.render = function(v23) --[[ Line: 161 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), l_FitFrameOnAxis_0 (copy), v4 (copy), v3 (copy), v20 (copy)
    v23.numberOfTopTrims = 0;
    v23.numberOfBottomTrims = 0;
    v23.lastTrimTop = 0;
    v23.lastTrimBottom = 0;
    v23.log:debug("render");
    local v24 = v19[v23.props.orientation] and {
        fillDirection = Enum.FillDirection.Vertical, 
        scrollDirection = Enum.ScrollingDirection.Y, 
        fitDirection = l_FitFrameOnAxis_0.Axis.Vertical, 
        minimumSize = UDim2.new(1, 0, 0, 0), 
        canvasSize = UDim2.new(0, 0, 0, v23.state.size), 
        paddingSize = UDim2.new(0, 0, 0, v23.state.padding)
    } or {
        fillDirection = Enum.FillDirection.Horizontal, 
        scrollDirection = Enum.ScrollingDirection.X, 
        fitDirection = l_FitFrameOnAxis_0.Axis.Horizontal, 
        minimumSize = UDim2.new(0, 0, 1, 0), 
        canvasSize = UDim2.new(0, v23.state.size, 0, 0), 
        paddingSize = UDim2.new(0, v23.state.padding, 0, 0)
    };
    local v25 = v4.Dictionary.join(v23.props, v23.propsToClear, {
        CanvasSize = v24.canvasSize, 
        ScrollingDirection = v24.scrollDirection, 
        [v3.Change.CanvasPosition] = v23.onScroll, 
        [v3.Change.AbsoluteSize] = v23.onResize, 
        [v3.Ref] = v23:getRef()
    });
    local v26 = {
        layout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = v24.fillDirection, 
            Padding = UDim.new(0, v23.itemPadding), 
            [v3.Change.AbsoluteContentSize] = v23.onContentResize
        }), 
        padding = v3.createElement("Frame", {
            Size = v24.paddingSize, 
            LayoutOrder = -1 - (v23.state.listSize or 0), 
            BackgroundTransparency = 1, 
            [v3.Ref] = v23.paddingRef
        })
    };
    if v23.state.ready and not v4.isEmpty(v23.props.itemList) then
        v23.log:trace("  Rendering elements between {} and {}", v23.state.trail.index, v23.state.lead.index);
        for v27 = v23.state.trail.index, v23.state.lead.index do
            local v28 = v23:getMetadata(v27);
            v26[v28.name] = v3.createElement(l_FitFrameOnAxis_0, {
                minimumSize = v24.minimumSize, 
                axis = v24.fitDirection, 
                FillDirection = v24.fillDirection, 
                BackgroundTransparency = 1, 
                LayoutOrder = v20[v23.props.orientation] and -v27 or v27, 
                [v3.Ref] = v28.ref
            }, {
                item = v23.props.renderItem(v23.props.itemList[v27], false)
            });
        end;
    end;
    return v3.createElement("ScrollingFrame", v25, v26);
end;
v16.didMount = function(v29) --[[ Line: 236 ]] --[[ Name: didMount ]]
    -- upvalues: v10 (copy)
    v29.sizeDebounce = false;
    v29.prevCycle = {
        frameSize = v29:measure(v29:getCurrent().AbsoluteSize), 
        canvasSize = v29.state.size, 
        canvasPosition = v10.nearest(v29:measure(v29:getCurrent().CanvasPosition)), 
        relativeAnchorLocation = v29.relativeAnchorLocation
    };
end;
v16.shouldUpdate = function(v30, v31, v32) --[[ Line: 247 ]] --[[ Name: shouldUpdate ]]
    if not v30.alive then
        return false;
    else
        v30.sizeDebounce = true;
        if v30.state.lastFocusLock ~= v32.lastFocusLock then
            v30.scrollDebounce = true;
            v30.motorActive = false;
            v30.anchorFramePosition = 0;
            if v30.state.listSize and v30.state.listSize > v32.listSize then
                v30.anchorCanvasPosition = v30.relativeAnchorLocation;
            else
                v30.anchorCanvasPosition = v30:frameToCanvasPosition(v30.relativeAnchorLocation);
            end;
        end;
        v30.log:trace("shouldUpdate");
        if v30.props.Size ~= v31.Size then
            v30.log:trace("  Size Prop Changed");
            v30._sizePropChanged = true;
        end;
        if v32 ~= v30.state then
            v30.log:trace("  State changed");
            return true;
        else
            for v33, v34 in pairs(v31) do
                if v30.props[v33] ~= v34 then
                    if v33 ~= "extraProps" then
                        v30.log:trace("  Prop changed: {}", v33);
                        return true;
                    else
                        for v35, v36 in pairs(v34) do
                            if v30.props.extraProps[v35] ~= v36 then
                                v30.log:trace("  Extra prop changed: {}", v35);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
            for v37, v38 in pairs(v30.props) do
                if v31[v37] ~= v38 then
                    if v37 ~= "extraProps" then
                        v30.log:trace("  Prop changed: {}", v37);
                        return true;
                    else
                        for v39, v40 in pairs(v38) do
                            if v31.extraProps[v39] ~= v40 then
                                v30.log:trace("  Extra prop changed: {}", v39);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
            v30.scrollDebounce = false;
            v30.sizeDebounce = false;
            return false;
        end;
    end;
end;
v16.didUpdate = function(v41, v42, v43) --[[ Line: 320 ]] --[[ Name: didUpdate ]]
    -- upvalues: v4 (copy), v17 (copy), v10 (copy)
    if not v41.alive then
        return;
    else
        v41.log:debug("didUpdate");
        if v4.isEmpty(v41.props.itemList) then
            if v17() then
                v41.scrollDebounce = false;
            end;
            return;
        elseif not v41.state.ready then
            v41.onResize(v41:getRef().current);
            return;
        else
            if v41.props.focusIndex ~= v42.focusIndex and v41.props.focusLock ~= v42.focusLock then
                v41.indexChanged = {
                    oldIndex = v42.focusIndex, 
                    newIndex = v41.props.focusIndex, 
                    lastFocusLock = v41.props.focusLock
                };
                v41.motorActive = false;
                v41.log:trace("self.props.focusIndex {}", v41.props.focusIndex);
                v41.log:trace("self.state.anchor.index {}", v41.state.anchor.index);
                v41.log:trace("previousState.anchor.index {}", v43.anchor and v43.anchor.index or tostring(nil));
            end;
            if not v41:adjustCanvas(v41.scrollingForward, v41.scrollingBackward) then
                if v41.indexChanged and v41.props.animateScrolling then
                    v41:scrollToAnchor();
                else
                    v41:moveToAnchor();
                end;
                if v41.anchorOffset ~= 0 then
                    if v41.forceUpdate then
                        v41:forceUpdate();
                        return;
                    else
                        v41:setState({});
                        return;
                    end;
                else
                    v41.resized = false;
                    v41:loadMore();
                    v41.sizeDebounce = false;
                    if v41.updating then
                        v41.timeLog:info("End of update");
                    end;
                    v41.updating = false;
                    if v41.props.onScrollUpdate then
                        v41.props.onScrollUpdate({
                            leadIndex = v41.state.lead.index, 
                            anchorIndex = v41.state.anchor.index, 
                            trailIndex = v41.state.trail.index, 
                            animationActive = v41.motorActive
                        });
                    end;
                end;
            end;
            v41.scrollDebounce = false;
            v41.sizeDebounce = false;
            v41._sizePropChanged = false;
            v41.prevCycle = {
                frameSize = v41:measure(v41:getCurrent().AbsoluteSize), 
                canvasSize = v41.state.size, 
                canvasPosition = v10.nearest(v41:measure(v41:getCurrent().CanvasPosition)), 
                relativeAnchorLocation = v41.relativeAnchorLocation
            };
            return;
        end;
    end;
end;
v16.updateMetadataList = function(v44, v45, v46, v47, v48, v49) --[[ Line: 407 ]] --[[ Name: updateMetadataList ]]
    -- upvalues: v16 (copy)
    local v50 = {};
    local v51 = {};
    for v52 = v48, v49 do
        local v53 = v47.itemList[v52];
        v51[v47.identifier(v53)] = v53;
    end;
    for v54, _ in pairs(v44) do
        if not v51[v54] then
            v50[v54] = true;
        elseif v44[v54].name then
            v51[v54] = nil;
        end;
    end;
    if next(v50) == nil and next(v51) == nil then
        return false;
    else
        for v56, _ in pairs(v50) do
            v16.clearMetadata(v44, v56, v47);
        end;
        for v58, v59 in pairs(v51) do
            v16.updateMetadata(v58, v59, v47, v44, v45, v46);
        end;
        return true;
    end;
end;
v16.copyMetadataState = function(v60) --[[ Line: 440 ]] --[[ Name: copyMetadataState ]]
    local v61 = {};
    for v62, v63 in pairs(v60.metadata) do
        v61[v62] = v63;
    end;
    local v64 = {};
    for v65, v66 in pairs(v60.pools) do
        v64[v65] = v66;
    end;
    local v67 = {};
    for v68, v69 in pairs(v60.refpool) do
        v67[v68] = v69;
    end;
    return v61, v64, v67;
end;
v16.getDerivedStateFromProps = function(v70, v71) --[[ Line: 459 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v13 (copy), v4 (copy), v16 (copy), v8 (copy), v9 (copy)
    v13:trace("getDerivedStateFromProps");
    if not v71.ready or v4.isEmpty(v70.itemList) then
        return nil;
    else
        local v72 = #v70.itemList;
        local v73 = nil;
        local v74, v75, v76 = v16.copyMetadataState(v71);
        if v71.lastFocusLock ~= v70.focusLock then
            v13:trace("  Resetting focus lock {} to {}", v71.lastFocusLock, v70.focusLock);
            if v70.animateScrolling and v71.lastFocusLock ~= nil then
                v73 = v70.focusLock;
            else
                local v77 = v70.identifier(v70.itemList[v70.focusIndex]);
                v16.updateMetadataList(v74, v75, v76, v70, v70.focusIndex, v70.focusIndex);
                return {
                    listSize = v72, 
                    trail = {
                        index = v70.focusIndex, 
                        id = v77
                    }, 
                    anchor = {
                        index = v70.focusIndex, 
                        id = v77
                    }, 
                    lead = {
                        index = v70.focusIndex, 
                        id = v77
                    }, 
                    padding = 0, 
                    size = 0, 
                    lastFocusLock = v70.focusLock, 
                    metadata = v74, 
                    pools = v75, 
                    refpool = v76
                };
            end;
        end;
        local v78, v79, v80 = v8(v70, v71);
        v13:trace("  Trailing index moved from {} to {}", v71.trail.index, v78);
        v13:trace("  Anchor index moved from {} to {}", v71.anchor.index, v79);
        v13:trace("  Leading index moved from {} to {}", v71.lead.index, v80);
        if v79 and v71.anchor.index == v79 and v78 and v71.trail.index == v78 and v80 and v71.lead.index == v80 then
            local v81 = v16.updateMetadataList(v74, v75, v76, v70, v71.trail.index, v71.lead.index);
            v13:trace("  No change, returning early");
            if v72 == v71.listSize then
                if v73 then
                    return {
                        lastFocusLock = v73, 
                        metadata = v74, 
                        pools = v75, 
                        refpool = v76
                    };
                elseif v81 then
                    return {
                        metadata = v74, 
                        pools = v75, 
                        refpool = v76
                    };
                else
                    return nil;
                end;
            else
                return {
                    listSize = v72, 
                    lastFocusLock = v73, 
                    metadata = v74, 
                    pools = v75, 
                    refpool = v76
                };
            end;
        else
            local v82 = v9({
                trailIndex = v78, 
                anchorIndex = v79, 
                leadIndex = v80
            }, {
                trailIndex = v71.trail.index, 
                anchorIndex = v71.anchor.index, 
                leadIndex = v71.lead.index
            }, v72);
            v13:trace("  Anchor index moved to {}", v82.anchorIndex);
            v13:trace("  Trailing index moved to {}", v82.trailIndex);
            v13:trace("  Leading index moved to {}", v82.leadIndex);
            local v83 = v70.identifier(v70.itemList[v82.trailIndex]);
            local v84 = v70.identifier(v70.itemList[v82.anchorIndex]);
            local v85 = v70.identifier(v70.itemList[v82.leadIndex]);
            v16.updateMetadataList(v74, v75, v76, v70, v82.trailIndex, v82.leadIndex);
            return {
                listSize = v72, 
                trail = {
                    index = v82.trailIndex, 
                    id = v83
                }, 
                anchor = {
                    index = v82.anchorIndex, 
                    id = v84
                }, 
                lead = {
                    index = v82.leadIndex, 
                    id = v85
                }, 
                lastFocusLock = v73, 
                metadata = v74, 
                pools = v75, 
                refpool = v76
            };
        end;
    end;
end;
v16.init = function(v86) --[[ Line: 567 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v13 (copy), v14 (copy), v3 (copy), v4 (copy), v10 (copy), v17 (copy), v20 (copy), l_RunService_0 (copy), v15 (copy), v16 (copy)
    v86.guid = l_HttpService_0:GenerateGUID();
    v86.log = v13:new(script:GetFullName() .. "." .. v86.guid);
    v86.timeLog = v14:new(script:GetFullName() .. "." .. v86.guid);
    v86.log:debug("init");
    v86._ref = v3.createRef();
    v86.paddingRef = v3.createRef();
    v86.motorPrevValue = 0;
    v86.motorOnStep = function(v87) --[[ Line: 581 ]]
        -- upvalues: v86 (copy)
        v86.log:trace("onStep {}", v87);
        if not v86.motorActive or v86.indexChanged == nil then
            v86.motor:stop();
            return;
        elseif v86.indexChanged.currentPos == nil then
            v86.motor:stop();
            return;
        else
            local v88 = v87 - v86.motorPrevValue;
            if v86:getCurrent() then
                v86:scrollRelative(v88);
                v86.motorPrevValue = v87;
            end;
            return;
        end;
    end;
    v86.motorOnComplete = function() --[[ Line: 599 ]]
        -- upvalues: v86 (copy)
        v86.log:trace("otter onComplete");
        v86.motorActive = false;
        if v86.props.onScrollUpdate then
            v86.props.onScrollUpdate({
                leadIndex = v86.props.focusIndex, 
                anchorIndex = v86.props.focusIndex, 
                trailIndex = v86.props.focusIndex, 
                animationActive = v86.motorActive
            });
        end;
        v86.motorPrevValue = 0;
        v86.indexChanged = nil;
        if v86.motor then
            v86.motor:destroy();
        end;
    end;
    v86.motorActive = false;
    v86.springLock = 0;
    v86.scrollDebounce = false;
    v86.sizeDebounce = true;
    v86.indexChanged = nil;
    v86.onScroll = function(v89) --[[ Line: 626 ]]
        -- upvalues: v86 (copy), v4 (ref), v3 (ref), v10 (ref), v17 (ref)
        v86.log:trace("onScroll");
        if not v86.alive or v86.resized then
            return;
        else
            v86.log:trace("  CanvasPosition is {}", v89.CanvasPosition);
            if v86.scrollDebounce then
                v86.log:trace("  Debouncing scroll");
                return;
            else
                v86.scrollDebounce = not v86:isScrollingWithElasticBehavior();
                if not v86:getRbx(v86.state.trail.index) or not v86:getRbx(v86.state.lead.index) then
                    v86.scrollDebounce = false;
                    return;
                else
                    local v90, v91 = v86:recalculateAnchor();
                    v86.scrollingBackward = v90 < 0;
                    v86.scrollingForward = v90 > 0;
                    v86.log:trace("  Delta is {}", v90);
                    v91 = v4.Dictionary.join(v91, v86:resetAnchorPosition(v91), v86:recalculateBounds(v86.scrollingForward, v86.scrollingBackward, v91));
                    local v92 = v4.isEmpty(v91);
                    if not v92 then
                        v86:setState(v91);
                    end;
                    if v86.props[v3.Change.CanvasPosition] then
                        v86.props[v3.Change.CanvasPosition](v89);
                    end;
                    v86.prevCycle.canvasPosition = v10.nearest(v86:measure(v89.CanvasPosition));
                    if v92 and v17() then
                        v86.scrollDebounce = false;
                    end;
                    return;
                end;
            end;
        end;
    end;
    v86.onResize = function(v93) --[[ Line: 673 ]]
        -- upvalues: v86 (copy), v10 (ref), v20 (ref), v3 (ref), l_RunService_0 (ref), v15 (ref)
        v86.log:trace("onResize");
        if not v86.alive then
            return;
        else
            local v94 = v86:measure(v93.AbsoluteSize);
            local v95 = v86:measure(v93.AbsolutePosition);
            v86.leadBufferPx = v10.nearest(v86.props.leadBuffer.Scale * v94 + v86.props.leadBuffer.Offset);
            v86.trailBufferPx = v10.nearest(v86.props.trailBuffer.Scale * v94 + v86.props.trailBuffer.Offset);
            v86.itemPadding = v86.props.padding.Scale * v94 + v86.props.padding.Offset;
            if v20[v86.props.orientation] then
                v86.relativeAnchorLocation = v10.nearest(v86.props.anchorLocation.Scale * v94 + v86.props.anchorLocation.Offset);
            else
                v86.relativeAnchorLocation = v10.nearest((1 - v86.props.anchorLocation.Scale) * v94 - v86.props.anchorLocation.Offset);
            end;
            v86.absoluteAnchorLocation = v86.relativeAnchorLocation + v95;
            v86.mountAboveAnchor = v86.relativeAnchorLocation + v86.props.mountingBuffer;
            v86.mountBelowAnchor = v94 - v86.relativeAnchorLocation + v86.props.mountingBuffer;
            v86.resized = true;
            v86.increasedSize = v86.state.size < v94;
            if v86.props[v3.Change.AbsoluteSize] then
                v86.props[v3.Change.AbsoluteSize](v93);
            end;
            if not v86.state.ready then
                v86.log:trace("  Setting initial anchor position to {}", v86.relativeAnchorLocation);
                v86.anchorFramePosition = 0;
                v86.anchorCanvasPosition = v86.relativeAnchorLocation;
                if v86.alive then
                    v86:setState({
                        ready = true
                    });
                    coroutine.wrap(function() --[[ Line: 720 ]]
                        -- upvalues: l_RunService_0 (ref), v86 (ref), v15 (ref)
                        l_RunService_0.Heartbeat:Wait();
                        if v86.props[v15] then
                            v86.props[v15]:Fire();
                        end;
                    end)();
                    return;
                end;
            else
                v86:handleResize(v94);
            end;
            return;
        end;
    end;
    v86.onContentResize = function() --[[ Line: 733 ]]
        -- upvalues: v86 (copy)
        v86.log:trace("onContentResize");
        if not v86.alive or v86.sizeDebounce or not v86.state.ready or v86:isScrollingWithElasticBehavior() then
            v86.log:trace("  Skipping onContentResize");
            return;
        elseif v86.forceUpdate then
            v86:forceUpdate();
            return;
        else
            v86:setState({});
            return;
        end;
    end;
    v86.anchorCanvasPosition = 0;
    v86.anchorFramePosition = 0;
    v86.anchorOffset = 0;
    v86.scrollingBackward = false;
    v86.scrollingForward = false;
    v86.lastLoadPrevItems = nil;
    v86.lastLoadNextItems = nil;
    v86.alive = true;
    v86.updating = false;
    v86.propsToClear = {
        scrollingFrameRef = v4.None
    };
    for v96, _ in pairs(v16.defaultProps) do
        v86.propsToClear[v96] = v4.None;
    end;
    v86:setState({
        ready = false, 
        lastFocusLock = nil, 
        padding = 0, 
        size = 0, 
        metadata = {}, 
        pools = {}, 
        refpool = {}
    });
end;
v16.willUnmount = function(v98) --[[ Line: 781 ]] --[[ Name: willUnmount ]]
    if v98.motor then
        v98.motor:destroy();
    end;
    v98.alive = false;
end;
v16.recalculateAnchor = function(v99) --[[ Line: 790 ]] --[[ Name: recalculateAnchor ]]
    v99.log:trace("recalculateAnchor");
    local v100 = v99:findIndexAt(v99:absoluteToCanvasPosition(v99.absoluteAnchorLocation), v99.state.anchor.index, false);
    v99.anchorCanvasPosition = v99:getAnchorCanvasFromIndex(v100);
    v99.anchorFramePosition = v99:getAnchorFrameFromIndex(v100);
    local v101 = nil;
    if v100 == v99.state.anchor.index then
        v99.log:trace("  Current anchor still works");
        return 0, {};
    else
        v101 = v100 < v99.state.anchor.index and -1 or 1;
        v99.log:trace("  New anchor at index {}", v100);
        v99.log:trace("  New anchor at canvas position {}", v99.anchorCanvasPosition);
        v99.log:trace("  New anchor at frame position {}", v99.anchorFramePosition);
        return v101, {
            anchor = {
                index = v100, 
                id = v99:getID(v100)
            }
        };
    end;
end;
v16.resetAnchorPosition = function(v102, v103) --[[ Line: 821 ]] --[[ Name: resetAnchorPosition ]]
    -- upvalues: v10 (copy)
    local v104 = v103 and v103.anchor or v102.state.anchor;
    local v105 = v103 and v103.padding or v102.state.padding;
    v102.log:trace("resetAnchorPosition");
    v102.log:trace("  Anchor index is {}", v104.index);
    local v106 = v102:getAnchorCanvasFromIndex(v104.index);
    v102.log:trace("  Anchor is at {}", v106);
    v102.log:trace("  Anchor offset is {}", v102.anchorOffset);
    local v107 = v102.anchorCanvasPosition - v102.anchorOffset;
    v102.log:trace("  Anchor should be at {}", v107);
    local v108 = v10.nearest(v107 - v106);
    if v108 ~= 0 then
        v102.log:trace("  Changing padding from {} to {}", v105, v105 + v108);
        v102.log:trace("  Changing anchorCanvasPosition from {} to {}", v102.anchorCanvasPosition, v10.nearest(v102.anchorCanvasPosition - v102.anchorOffset));
        v102.anchorCanvasPosition = v10.nearest(v102.anchorCanvasPosition - v102.anchorOffset);
        v102.anchorOffset = 0;
        return {
            padding = v105 + v108
        };
    else
        return {};
    end;
end;
v16.getCurrentPadding = function(v109) --[[ Line: 845 ]] --[[ Name: getCurrentPadding ]]
    local l_current_0 = v109.paddingRef.current;
    if not l_current_0 then
        return 0;
    else
        return l_current_0.Size.X.Offset + l_current_0.Size.Y.Offset;
    end;
end;
v16.recalculateBounds = function(v111, v112, v113, v114) --[[ Line: 856 ]] --[[ Name: recalculateBounds ]]
    local v115 = v114 and v114.lead or v111.state.lead;
    local v116 = v114 and v114.trail or v111.state.trail;
    local v117 = v114 and v114.anchor or v111.state.anchor;
    v111.log:trace("recalculateBounds");
    v111.log:trace("  Leading index was {}", v115.index);
    v111.log:trace("  Trailing index was {}", v116.index);
    local v118 = v111:getAnchorCanvasFromIndex(v117.index);
    local v119 = v118 - v111.mountAboveAnchor;
    local v120 = v118 + v111.mountBelowAnchor;
    v111.log:trace("  Target for top at {}", v119);
    v111.log:trace("  Target for bottom at {}", v120);
    local v121 = v111:findIndexAt(v119, v117.index, true);
    v111.log:trace("  Found new top index at {}", v121);
    local v122 = v111:findIndexAt(v120, v117.index, true);
    v111.log:trace("  Found new bottom index at {}", v122);
    local v123 = math.max(v121, v122);
    if v123 < v115.index and not v113 then
        v123 = v115.index;
    end;
    local v124 = math.min(v121, v122);
    if v116.index < v124 and not v112 then
        v124 = v116.index;
    end;
    if v124 < v116.index or v115.index < v123 then
        v111.log:trace("  Changing leading index to {}", v123);
        v111.log:trace("  Changing trailing index to {}", v124);
        return {
            trail = {
                index = v124, 
                id = v111:getID(v124)
            }, 
            lead = {
                index = v123, 
                id = v111:getID(v123)
            }
        };
    else
        return {};
    end;
end;
v16.findIndexAt = function(v125, v126, v127, v128) --[[ Line: 901 ]] --[[ Name: findIndexAt ]]
    -- upvalues: v10 (copy)
    v125.log:trace("  findIndexAt");
    local v129 = v127 or v125.state.anchor.index;
    local v130 = v125:distanceToPosition(v129, v126);
    v125.log:trace("    Searching from index {}", v129);
    v125.log:trace("    Position is {} from {}", v130, v126);
    if v130 == 0 then
        local v131 = v129 + v10.awayFromZero(v125.props.anchorLocation.Scale - 0.5);
        if v125.state.listSize < v131 or v131 < 1 then
            return v129;
        elseif v125:distanceToPosition(v131, v126) == 0 then
            return v131;
        else
            return v129;
        end;
    elseif not v130 then
        return v127;
    else
        local v132 = v130 < 0 and v125.state.trail.index or v125.state.lead.index;
        v125.log:trace("    Nearest end at {}", v132);
        if v129 == v132 then
            v125.log:trace("    Hint index already at end");
            if v129 + v130 < v125.state.trail.index or v129 + v130 > v125.state.lead.index then
                v125.log:trace("    Target out of bounds");
                if not v128 then
                    return v129;
                else
                    local v133 = v10.awayFromZero(v130 / v125.props.estimatedItemSize);
                    v125.log:trace("    Estimating target at {} from end", v133);
                    return (math.min(math.max(v129 + v133, 1), v125.state.listSize));
                end;
            end;
        else
            local v134 = v125:distanceToPosition(v132, v126);
            v125.log:trace("    End is {} from target", v134);
            if v134 == 0 then
                return v132;
            elseif not v134 then
                return v127;
            elseif v130 * v134 > 0 then
                v125.log:trace("    Target out of bounds");
                if not v128 then
                    return v132;
                else
                    local v135 = v10.awayFromZero(v134 / v125.props.estimatedItemSize);
                    v125.log:trace("    Estimating target at {} from end", v135);
                    return (math.min(math.max(v132 + v135, 1), v125.state.listSize));
                end;
            else
                local v136 = math.abs(v130) + math.abs(v134);
                local v137 = math.abs(v129 - v132);
                v129 = v129 + v10.nearest(v137 * v130 / v136);
                v130 = v125:distanceToPosition(v129, v126);
                v125.log:trace("    Interpolated index is {}", v129);
                v125.log:trace("    Distance from interpolated index is {}", v130);
            end;
        end;
        while v130 ~= 0 and v130 ~= nil do
            if v130 < 0 then
                v129 = v129 - 1;
            else
                v129 = v129 + 1;
            end;
            v130 = v125:distanceToPosition(v129, v126);
            v125.log:trace("    Distance after step is {}", v130);
        end;
        return v129;
    end;
end;
v16.findIndexWithRemainder = function(v138, v139, v140, v141) --[[ Line: 989 ]] --[[ Name: findIndexWithRemainder ]]
    -- upvalues: v20 (copy), v10 (copy)
    local v142 = v20[v138.props.orientation];
    if v139 < (v142 and v138.leadBufferPx or v138.trailBufferPx) then
        return v142 and v138.state.listSize or 1, 0;
    elseif v10.nearest(v138:measure(v138:getCurrent().CanvasSize).Offset) < v139 then
        return v142 and 1 or v138.state.listSize, 0;
    else
        local v143 = v138:findIndexAt(v139, v140, v141);
        local v144 = v138:getAnchorCanvasFromIndex(v143);
        local v145 = v143 + v10.awayFromZero(v138.props.anchorLocation.Scale - 0.5);
        if v138.state.listSize < v145 or v145 < 1 then
            return v143, 0;
        elseif v138:distanceToPosition(v145, v139) == 0 then
            return v145, 0;
        else
            return v143, v144 - v139;
        end;
    end;
end;
v16.checkTrimTopError = function(v146, v147) --[[ Line: 1019 ]] --[[ Name: checkTrimTopError ]]
    if v146.lastTrimTop == v147 then
        if v146.numberOfTopTrims >= 3 then
            error("There was an error laying out the items.  Check to see if you provided enough leadBuffer and/or trailBuffer");
            return;
        else
            v146.numberOfTopTrims = v146.numberOfTopTrims + 1;
            return;
        end;
    else
        v146.lastTrimTop = v147;
        v146.numberOfTopTrims = 0;
        return;
    end;
end;
v16.trimTopHelper = function(v148, v149, v150, v151, v152, v153, v154) --[[ Line: 1032 ]] --[[ Name: trimTopHelper ]]
    -- upvalues: v10 (copy)
    local v155 = v149 and v148.leadBufferPx or v148.trailBufferPx;
    if v151 + v154 < v155 then
        v154 = v151 - v155;
    end;
    if v154 >= 0 or v150 + v154 < 0 then
        return {};
    else
        v148:checkTrimTopError(v154);
        local v156 = v10.nearest(v150 + v154);
        local v157 = v10.nearest(v151 + v154);
        local v158 = v10.nearest(v148.anchorCanvasPosition + v154);
        v148.log:trace("  Changing anchor canvas position from {} to {}", v148.anchorCanvasPosition, v158);
        v148.anchorCanvasPosition = v158;
        local v159 = v148:getChildFramePosition(v153);
        local v160 = v152.index - 1;
        if v160 > 0 and v159 > 0 and v148:getChildCanvasPosition(v160) > v148.anchorCanvasPosition then
            local v161 = {
                index = v160, 
                id = v148:getID(v160)
            };
            return {
                size = v156, 
                padding = v157, 
                anchor = v161
            };
        else
            return {
                size = v156, 
                padding = v157
            };
        end;
    end;
end;
v16.trimTop = function(v162, v163, v164, v165, v166, v167, v168) --[[ Line: 1078 ]] --[[ Name: trimTop ]]
    local v169 = v163 and v167 == v162.state.listSize or not v163 and v167 == 1;
    local v170 = v163 and v162.leadBufferPx or v162.trailBufferPx;
    return v162:trimTopHelper(v163, v164, v165, v166, v167, v169 and v170 - v168 or 0);
end;
v16.shortTrimTop = function(v171, v172, v173, v174, v175, v176, v177) --[[ Line: 1087 ]] --[[ Name: shortTrimTop ]]
    -- upvalues: v10 (copy)
    local v178 = v171:getChildFramePosition(v177);
    local v179 = v172 and v171.trailBufferPx or v171.leadBufferPx;
    local _ = nil;
    return v171:trimTopHelper(v172, v173, v175, v176, v177, if v178 >= 0 and v178 <= v174 then -v10.towardsZero(v173 - v179 - v174) else v178);
end;
v16.checkTrimBottomError = function(v181, v182) --[[ Line: 1103 ]] --[[ Name: checkTrimBottomError ]]
    if v181.lastTrimBottom == v182 then
        if v181.numberOfBottomTrims >= 3 then
            error("There was an error laying out the items.  Check to see if you provided enough leadBuffer and/or trailBuffer");
            return;
        else
            v181.numberOfBottomTrims = v181.numberOfBottomTrims + 1;
            return;
        end;
    else
        v181.lastTrimBottom = v182;
        v181.numberOfBottomTrims = 0;
        return;
    end;
end;
v16.trimBottomHelper = function(v183, v184, v185) --[[ Line: 1116 ]] --[[ Name: trimBottomHelper ]]
    -- upvalues: v10 (copy)
    if v185 <= 0 then
        return {};
    else
        v183:checkTrimBottomError(v185);
        return {
            size = v10.nearest(v184 - v185)
        };
    end;
end;
v16.trimBottom = function(v186, v187, v188, v189, v190) --[[ Line: 1133 ]] --[[ Name: trimBottom ]]
    local v191 = v187 and v188 == 1 or not v187 and v188 == v186.state.listSize;
    local v192 = v187 and v186.trailBufferPx or v186.leadBufferPx;
    local v193 = v191 and v190 - v192 - v189 or 0;
    if v186.resized and v186.increasedSize then
        return {};
    else
        return v186:trimBottomHelper(v190, v193);
    end;
end;
v16.shortTrimBottom = function(v194, v195, v196, v197, v198, v199) --[[ Line: 1146 ]] --[[ Name: shortTrimBottom ]]
    local v200 = v194:getChildFramePosition(v196) + v194:getChildSize(v196);
    if v200 >= 0 and v200 <= v199 then
        return {};
    else
        return v194:trimBottomHelper(v198, v198 - (v195 and v194.trailBufferPx or v194.leadBufferPx) - v197);
    end;
end;
v16.adjustEdges = function(v201, v202) --[[ Line: 1164 ]] --[[ Name: adjustEdges ]]
    -- upvalues: v10 (copy), v20 (copy), v4 (copy)
    v201.log:trace("adjustEdges");
    local v203 = v202.size or v201.state.size;
    v203 = v10.nearest(v203);
    local v204 = v202.padding or v201.state.padding;
    local v205 = v202.anchor or v201.state.anchor;
    local v206 = v20[v201.props.orientation];
    local v207 = v201:measure(v201:getCurrent().AbsoluteSize);
    local v208 = v206 and v201.state.lead.index or v201.state.trail.index;
    local v209 = v10.nearest(v201:getChildCanvasPosition(v208)) - v201.itemPadding;
    local v210 = v206 and v201.state.trail.index or v201.state.lead.index;
    local v211 = v201:getChildSize(v210);
    local v212 = v10.nearest(v201:getChildCanvasPosition(v210) + v211);
    local v213 = v201.leadBufferPx + v201.trailBufferPx + (v212 - v209);
    local v214 = nil;
    if v212 - v209 <= v207 or v213 <= v207 then
        if v206 then
            local v215 = v201:trimBottom(v206, v210, v212, v203);
            local v216 = v201:shortTrimTop(v206, v215.size or v203, v207, v204, v205, v208);
            v214 = v4.Dictionary.join(v215, v216);
        else
            local v217 = v201:trimTop(v206, v203, v204, v205, v208, v209);
            local v218 = v201:shortTrimBottom(v206, v210, v212, v217.size or v203, v207);
            v214 = v4.Dictionary.join(v217, v218);
        end;
    else
        local v219 = v201:trimTop(v206, v203, v204, v205, v208, v209);
        local v220 = v201:trimBottom(v206, v210, v212, v219.size or v203);
        v214 = v4.Dictionary.join(v219, v220);
    end;
    if v214.size then
        v201.log:trace("  Changing canvas size from {} to {}", v203, v214.size);
    end;
    if v214.padding then
        v201.log:trace("  Changing canvas padding from {} to {}", v204, v214.padding);
    end;
    if v214.anchor then
        v201.log:trace("  Changing anchor index from {} to {}", v205.index, v214.anchor.index);
    end;
    return v214;
end;
v16.expandCanvas = function(v221, v222) --[[ Line: 1218 ]] --[[ Name: expandCanvas ]]
    -- upvalues: v20 (copy), v10 (copy)
    v221.log:trace("expandCanvas");
    local v223 = v20[v221.props.orientation];
    local v224 = v223 and v221.state.trail.index or v221.state.lead.index;
    local v225 = v223 and v221.leadBufferPx or v221.trailBufferPx;
    local v226 = v223 and v221.trailBufferPx or v221.leadBufferPx;
    local v227 = v222.size or v221.state.size;
    v227 = v10.nearest(v227);
    local l_v227_0 = v227;
    local v229 = v222.padding or v221.state.padding;
    local l_v229_0 = v229;
    local v231 = v221:getCurrentPadding();
    local v232 = v221:getChildCanvasPosition(v224) + v221:getChildSize(v224) - (v231 - v229);
    local v233 = v10.nearest(v232 + v226);
    v221.log:trace("  Padding is {}", v229);
    v221.log:trace("  Padding should be at least {}", v225);
    if v229 < v225 then
        local v234 = v229 - v225;
        v227 = v10.nearest(v227 - v234);
        v221.anchorCanvasPosition = v10.nearest(v221.anchorCanvasPosition - v234);
        v229 = v225;
        v221.log:trace("  Expanding canvas top to size {}", v227);
        v221.log:trace("  Shifting anchor to {}", v221.anchorCanvasPosition);
        v221.log:trace("  Padding is now {}", v229);
    end;
    v221.log:trace("  Bottom of bottom child is {}", v232);
    v221.log:trace("  Canvas size is {}", l_v227_0);
    v221.log:trace("  Canvas bottom should be {}", v233);
    local v235 = v221:measure(v221:getCurrent().AbsoluteSize) - math.max(0, v229);
    if l_v227_0 < v235 then
        v227 = v235;
        v221.log:trace("  Expanding canvas to minimum size {}", v227);
    end;
    if l_v227_0 < v233 then
        v227 = math.max(v233, v227);
        v221.log:trace("  Expanding canvas bottom to size {}", v227);
    end;
    if v227 ~= l_v227_0 or v229 ~= l_v229_0 then
        v221.log:trace("  Changing size from {} to {}", l_v227_0, v227);
        v221.log:trace("  Changing padding from {} to {}", l_v229_0, v229);
        return {
            size = v227, 
            padding = v229
        };
    else
        v221.log:trace("  No changes to size or padding");
        return {};
    end;
end;
v16.adjustCanvas = function(v236, v237, v238) --[[ Line: 1280 ]] --[[ Name: adjustCanvas ]]
    -- upvalues: v4 (copy)
    v236.log:trace("adjustCanvas");
    if v236._sizePropChanged then
        v236.log:trace("  Skipping because Size prop changed");
        return true;
    else
        local v239 = v4.Dictionary.join(v236:resetAnchorPosition(), v236:recalculateBounds(v237, v238));
        if not v239.trail and not v239.lead then
            v239 = v4.Dictionary.join(v239, v236:expandCanvas(v239));
        end;
        if not v239.size and not v239.padding then
            v239 = v4.Dictionary.join(v239, v236:adjustEdges(v239));
        end;
        if v4.isEmpty(v239) then
            v236.log:trace("  No state changes after adjustment");
            return false;
        else
            v236:setState(v239);
            return true;
        end;
    end;
end;
v16.handleResize = function(v240, v241) --[[ Line: 1311 ]] --[[ Name: handleResize ]]
    -- upvalues: v20 (copy), v10 (copy)
    if not v240:getRbx(v240.state.anchor.index) then
        return;
    else
        local v242 = v20[v240.props.orientation];
        local v243 = v10.nearest(v240:measure(v240:getCurrent().CanvasSize).Offset);
        local v244 = v240:measure(v240:getCurrent().AbsoluteSize);
        local v245 = v242 and v240.leadBufferPx or v240.trailBufferPx;
        local v246 = v242 and v240.trailBufferPx or v240.leadBufferPx;
        local v247 = v242 and v240.state.trail.index or v240.state.lead.index;
        local v248 = v242 and v240.state.lead.index or v240.state.trail.index;
        local v249 = v240:getChildSize(v247);
        local v250 = v10.nearest(v240:getChildCanvasPosition(v248)) - v240.itemPadding;
        local v251 = v10.nearest(v240:getChildCanvasPosition(v247)) + v249 + v246 - v250;
        local v252 = 0;
        if v240.prevCycle.frameSize and v241 then
            v252 = v241 - v240.prevCycle.frameSize;
        end;
        local v253 = v240.prevCycle.canvasPosition + v240.prevCycle.frameSize;
        local v254 = math.max(v240.prevCycle.canvasSize - v246 - v253, 0);
        local l_canvasPosition_0 = v240.prevCycle.canvasPosition;
        local v256 = 0;
        if v244 < v243 then
            v256 = v250 - v245;
        end;
        local v257 = nil;
        local v258 = nil;
        if v252 < 0 then
            if v240.relativeAnchorLocation > v244 * 0.5 then
                v258 = math.min(v256, v252);
                v257 = v252 - v258;
            else
                v257 = v252;
                v258 = 0;
            end;
        elseif v240.relativeAnchorLocation > v244 * 0.5 then
            v258 = math.min(l_canvasPosition_0, v252);
            local v259 = v252 - v258;
            v257 = math.min(v254, v259);
            v258 = v258 + (v259 - v257);
        else
            v257 = math.min(v254, v252);
            local v260 = v252 - v257;
            v258 = math.min(l_canvasPosition_0, v260);
            v257 = v257 + (v260 - v258);
        end;
        if v240.relativeAnchorLocation >= v244 * 0.5 then
            local v261 = v240:getAnchorCanvasFromIndex(v240.state.anchor.index) - v240.anchorFramePosition;
            local v262, v263 = v240:findIndexWithRemainder(v261 + v252 - v258, v240.state.anchor.index, false);
            v240.anchorFramePosition = math.max(v263, 0);
            v240.anchorCanvasPosition = math.min(v261 + v252, v243 - v246);
            if v252 > 0 then
                v240.anchorOffset = l_canvasPosition_0 + v240.anchorFramePosition - v258;
            end;
            v240:setState({
                anchor = {
                    index = v262, 
                    id = v240:getID(v262)
                }
            });
            return;
        else
            local l_v243_0 = v243;
            if v251 < v243 then
                l_v243_0 = math.min(v251, v243 + v257);
            end;
            local v265, v266 = v240:findIndexWithRemainder(v240.anchorCanvasPosition - v258, v240.state.anchor.index, false);
            if math.abs(v257) < math.abs(v252) then
                v240.anchorFramePosition = 0;
            elseif v265 == v240.state.anchor.index then
                v240.anchorFramePosition = v240.anchorFramePosition + v258;
            else
                v240.anchorFramePosition = v240.anchorFramePosition + v266;
            end;
            v240.anchorCanvasPosition = v240.anchorCanvasPosition - v258;
            v240:setState({
                size = l_v243_0, 
                anchor = {
                    index = v265, 
                    id = v240:getID(v265)
                }
            });
            return;
        end;
    end;
end;
v16.scrollToAnchor = function(v267) --[[ Line: 1425 ]] --[[ Name: scrollToAnchor ]]
    -- upvalues: v6 (copy)
    if v267.motorActive then
        return;
    else
        v267.log:trace("scrollToAnchor");
        if v267.indexChanged == nil then
            v267:moveToAnchor();
        end;
        local l_newIndex_0 = v267.indexChanged.newIndex;
        local l_oldIndex_0 = v267.indexChanged.oldIndex;
        v267.log:trace(" newIndex {}", l_newIndex_0);
        v267.log:trace(" previousIndex {}", l_oldIndex_0);
        local v270 = v267:measure(v267:getCurrent().CanvasPosition) + v267.relativeAnchorLocation;
        local v271 = v267:getAnchorCanvasFromIndex(l_newIndex_0);
        v267.log:trace(" old anchor pos {}", v270);
        v267.log:trace(" new anchor pos {}", v271);
        v267.indexChanged.currentPos = v270;
        v267.indexChanged.newPos = v271;
        v267.motorActive = true;
        v267.springLock = v267.springLock + 1;
        local v272 = v271 - v270;
        v267.log:trace(" delta {}", v272);
        v267.motor = v6.createSingleMotor(0);
        v267.motor:onStep(v267.motorOnStep);
        v267.motor:onComplete(v267.motorOnComplete);
        v267.motor:setGoal(v6.spring(v272, v267.props.animateOptions));
        return;
    end;
end;
v16.moveToAnchor = function(v273) --[[ Line: 1459 ]] --[[ Name: moveToAnchor ]]
    -- upvalues: v10 (copy)
    v273.log:trace("moveToAnchor");
    if v273.motorActive then
        return;
    elseif v273:isScrollingWithElasticBehavior() then
        return;
    else
        local v274 = v273:getAnchorFramePosition();
        v273.log:trace("  Anchor was at frame position {}", v273.anchorFramePosition);
        v273.log:trace("  Anchor is currently at frame position {}", v274);
        local v275 = v273:measure(v273:getCurrent().CanvasPosition) + v274 - v273.anchorFramePosition;
        v273.log:trace("  Canvas should scroll to {}", v275);
        local v276 = v273:getCurrent();
        local v277 = math.max(0, v273:measure(v276.CanvasSize).Offset - v273:measure(v276.AbsoluteSize));
        v273:setScroll(v275);
        if v275 < 0 then
            v273.log:trace("  Canvas scroll limited to 0, was {}", v275);
            v273.anchorOffset = v10.towardsZero(v275);
            return;
        elseif v277 <= v275 then
            v273.log:trace("  Canvas scroll limited to {}, was {}", v277, v275);
            v273.anchorOffset = v10.towardsZero(v275 - v277);
            return;
        else
            v273.log:trace("  Clearing anchorOffset");
            v273.anchorOffset = 0;
            return;
        end;
    end;
end;
v16.isScrollingWithElasticBehavior = function(v278) --[[ Line: 1490 ]] --[[ Name: isScrollingWithElasticBehavior ]]
    -- upvalues: v20 (copy), v10 (copy)
    if v278.resized then
        return false;
    else
        local v279 = v20[v278.props.orientation];
        local v280 = v279 and v278.state.lead.index or v278.state.trail.index;
        local v281 = v279 and v278.state.listSize or 1;
        if v278:measure(v278:getCurrent().CanvasPosition) < 0 and v280 == v281 then
            return true;
        else
            local v282 = v279 and v278.state.trail.index or v278.state.lead.index;
            local v283 = v278:measure(v278:getCurrent().AbsoluteSize);
            local v284 = v278:measure(v278:getCurrent().CanvasPosition);
            local v285 = v279 and 1 or v278.state.listSize;
            if v10.nearest(v284 + v283) > v10.nearest(v278:measure(v278:getCurrent().CanvasSize).Offset) and v282 == v285 and v284 > 0 then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
v16.loadMore = function(v286) --[[ Line: 1521 ]] --[[ Name: loadMore ]]
    v286.log:trace("loadMore");
    if v286.props.loadPrevious and v286.state.trail.index <= v286.props.loadingBuffer and v286.props.itemList ~= v286.lastLoadPrevItems then
        v286.log:trace("  Calling loadPrevious");
        v286.lastLoadPrevItems = v286.props.itemList;
        v286.props.loadPrevious();
    end;
    if v286.props.loadNext and v286.state.lead.index > v286.state.listSize - v286.props.loadingBuffer and v286.props.itemList ~= v286.lastLoadNextItems then
        v286.log:trace("  Calling loadNext");
        v286.lastLoadNextItems = v286.props.itemList;
        v286.props.loadNext();
    end;
end;
v16.setScroll = function(v287, v288) --[[ Line: 1541 ]] --[[ Name: setScroll ]]
    -- upvalues: v19 (copy)
    v287.log:trace("    Scrolling to {}", v288);
    v287.scrollDebounce = true;
    v287:getCurrent().CanvasPosition = v19[v287.props.orientation] and Vector2.new(v287:getCurrent().CanvasPosition.X, v288) or Vector2.new(v288, v287:getCurrent().CanvasPosition.Y);
    v287.scrollDebounce = false;
end;
v16.scrollRelative = function(v289, v290) --[[ Line: 1551 ]] --[[ Name: scrollRelative ]]
    v289.log:trace("  Current CanvasPosition {}", v289:getCurrent().CanvasPosition);
    v289.log:trace("self.motorActive {}", v289.motorActive);
    v289:setScroll(v289:measure(v289:getCurrent().CanvasPosition) + v290, true);
    v289.onScroll(v289:getCurrent());
end;
v16.distanceToPosition = function(v291, v292, v293) --[[ Line: 1564 ]] --[[ Name: distanceToPosition ]]
    -- upvalues: v10 (copy), v11 (copy), v21 (copy)
    local v294 = v291:getRbx(v292);
    if not v294 then
        return nil;
    else
        local v295 = v291:absoluteToCanvasPosition(v291:measure(v294.AbsolutePosition)) - v291.itemPadding;
        local v296 = v291:measure(v294.AbsoluteSize) + 2 * v291.itemPadding;
        return v10.nearest(v11.fromPointToRangeSigned(v293, v295, v296) * v21[v291.props.orientation]);
    end;
end;
v16.getAnchorCanvasPosition = function(v297) --[[ Line: 1577 ]] --[[ Name: getAnchorCanvasPosition ]]
    return v297:getAnchorCanvasFromIndex(v297.state.anchor.index);
end;
v16.getAnchorCanvasFromIndex = function(v298, v299) --[[ Line: 1581 ]] --[[ Name: getAnchorCanvasFromIndex ]]
    -- upvalues: v20 (copy), v10 (copy)
    local l_Scale_0 = v298.props.anchorLocation.Scale;
    if not v20[v298.props.orientation] then
        l_Scale_0 = 1 - l_Scale_0;
    end;
    return v10.nearest(v298:getChildCanvasPosition(v299) + l_Scale_0 * v298:getChildSize(v299));
end;
v16.getAnchorFramePosition = function(v301) --[[ Line: 1591 ]] --[[ Name: getAnchorFramePosition ]]
    return v301:getAnchorFrameFromIndex(v301.state.anchor.index);
end;
v16.getAnchorFrameFromIndex = function(v302, v303) --[[ Line: 1595 ]] --[[ Name: getAnchorFrameFromIndex ]]
    -- upvalues: v20 (copy), v10 (copy)
    local l_Scale_1 = v302.props.anchorLocation.Scale;
    if not v20[v302.props.orientation] then
        l_Scale_1 = 1 - l_Scale_1;
    end;
    return v10.nearest(v302:getChildFramePosition(v303) + l_Scale_1 * v302:getChildSize(v303)) - v302.relativeAnchorLocation;
end;
v16.absoluteToCanvasPosition = function(v305, v306) --[[ Line: 1606 ]] --[[ Name: absoluteToCanvasPosition ]]
    local v307 = v305:getCurrent();
    local l_CanvasPosition_0 = v307.CanvasPosition;
    local l_AbsolutePosition_0 = v307.AbsolutePosition;
    return v306 + v305:measure(l_CanvasPosition_0) - v305:measure(l_AbsolutePosition_0);
end;
v16.absoluteToFramePosition = function(v310, v311) --[[ Line: 1614 ]] --[[ Name: absoluteToFramePosition ]]
    return v311 - v310:measure(v310:getCurrent().AbsolutePosition);
end;
v16.frameToCanvasPosition = function(v312, v313) --[[ Line: 1621 ]] --[[ Name: frameToCanvasPosition ]]
    return v313 + v312:measure(v312:getCurrent().CanvasPosition);
end;
v16.getChildCanvasPosition = function(v314, v315) --[[ Line: 1628 ]] --[[ Name: getChildCanvasPosition ]]
    local v316 = v314:getRbx(v315);
    return v316 and v314:absoluteToCanvasPosition(v314:measure(v316.AbsolutePosition)) or 0;
end;
v16.getChildFramePosition = function(v317, v318) --[[ Line: 1634 ]] --[[ Name: getChildFramePosition ]]
    local v319 = v317:getRbx(v318);
    return v319 and v317:absoluteToFramePosition(v317:measure(v319.AbsolutePosition)) or 0;
end;
v16.getChildSize = function(v320, v321) --[[ Line: 1640 ]] --[[ Name: getChildSize ]]
    local v322 = v320:getRbx(v321);
    return v322 and v320:measure(v322.AbsoluteSize) or 0;
end;
v16.getID = function(v323, v324) --[[ Line: 1646 ]] --[[ Name: getID ]]
    return v323.props.identifier(v323.props.itemList[v324]);
end;
v16.updateMetadata = function(v325, v326, v327, v328, v329, v330) --[[ Line: 1652 ]] --[[ Name: updateMetadata ]]
    -- upvalues: v16 (copy), v3 (copy)
    local v331 = v328[v325];
    if not v331 then
        v331 = {};
        v328[v325] = v331;
    end;
    if not v331.name then
        local v332 = v327.renderItem(v326, false);
        v331.class = tostring(v332.component or v332.type);
        v331.name = v16.getKeyPool(v331.class, v329):get();
    end;
    if not v330[v331.name] then
        v330[v331.name] = v3.createRef();
    end;
    v331.ref = v330[v331.name];
end;
v16.clearMetadata = function(v333, v334, v335) --[[ Line: 1673 ]] --[[ Name: clearMetadata ]]
    -- upvalues: v4 (copy)
    local v336 = v333[v334];
    if not v336 then
        return;
    else
        if not v4.List.find(v335.recyclingDisabledFor, v336.class) and v336.name then
            v336.name:release();
        end;
        v336.name = nil;
        v336.ref = nil;
        return;
    end;
end;
v16.getKeyPool = function(v337, v338) --[[ Line: 1693 ]] --[[ Name: getKeyPool ]]
    -- upvalues: v12 (copy)
    if not v338[v337] then
        v338[v337] = v12.new(v337);
    end;
    return v338[v337];
end;
v16.getMetadata = function(v339, v340) --[[ Line: 1701 ]] --[[ Name: getMetadata ]]
    return v339.state.metadata[v339:getID(v340)];
end;
v16.getRbx = function(v341, v342) --[[ Line: 1706 ]] --[[ Name: getRbx ]]
    local v343 = v341:getMetadata(v342);
    return v343 and v343.ref and v343.ref.current;
end;
v16.measure = function(v344, v345) --[[ Line: 1712 ]] --[[ Name: measure ]]
    -- upvalues: v19 (copy)
    return v19[v344.props.orientation] and v345.Y or v345.X;
end;
v16.getCurrent = function(v346) --[[ Line: 1717 ]] --[[ Name: getCurrent ]]
    return v346:getRef().current;
end;
v16.getRef = function(v347) --[[ Line: 1721 ]] --[[ Name: getRef ]]
    return v347.props.scrollingFrameRef or v347._ref;
end;
return v16;