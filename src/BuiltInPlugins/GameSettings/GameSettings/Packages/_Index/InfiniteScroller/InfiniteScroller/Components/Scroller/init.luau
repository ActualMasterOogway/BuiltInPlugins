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
    scrollingFrameRef = v5.optional(v5.table), 
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
    [v15] = false
};
v16.render = function(v22) --[[ Line: 160 ]] --[[ Name: render ]]
    -- upvalues: v18 (copy), l_FitFrameOnAxis_0 (copy), v4 (copy), v3 (copy), v19 (copy)
    v22.numberOfTopTrims = 0;
    v22.numberOfBottomTrims = 0;
    v22.lastTrimTop = 0;
    v22.lastTrimBottom = 0;
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
            BackgroundTransparency = 1, 
            [v3.Ref] = v22.paddingRef
        })
    };
    if v22.state.ready and not v4.isEmpty(v22.props.itemList) then
        v22.log:trace("  Rendering elements between {} and {}", v22.state.trail.index, v22.state.lead.index);
        for v26 = v22.state.trail.index, v22.state.lead.index do
            local v27 = v22:getMetadata(v26);
            v25[v27.name] = v3.createElement(l_FitFrameOnAxis_0, {
                minimumSize = v23.minimumSize, 
                axis = v23.fitDirection, 
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
v16.didMount = function(v28) --[[ Line: 235 ]] --[[ Name: didMount ]]
    -- upvalues: v10 (copy)
    v28.sizeDebounce = false;
    v28.prevCycle = {
        frameSize = v28:measure(v28:getCurrent().AbsoluteSize), 
        canvasSize = v28.state.size, 
        canvasPosition = v10.nearest(v28:measure(v28:getCurrent().CanvasPosition)), 
        relativeAnchorLocation = v28.relativeAnchorLocation
    };
end;
v16.shouldUpdate = function(v29, v30, v31) --[[ Line: 246 ]] --[[ Name: shouldUpdate ]]
    if not v29.alive then
        return false;
    else
        v29.sizeDebounce = true;
        if v29.state.lastFocusLock ~= v31.lastFocusLock then
            v29.scrollDebounce = true;
            v29.motorActive = false;
            v29.anchorFramePosition = 0;
            if v29.state.listSize and v29.state.listSize > v31.listSize then
                v29.anchorCanvasPosition = v29.relativeAnchorLocation;
            else
                v29.anchorCanvasPosition = v29:frameToCanvasPosition(v29.relativeAnchorLocation);
            end;
        end;
        v29.log:trace("shouldUpdate");
        if v29.props.Size ~= v30.Size then
            v29.log:trace("  Size Prop Changed");
            v29._sizePropChanged = true;
        end;
        if v31 ~= v29.state then
            v29.log:trace("  State changed");
            return true;
        else
            for v32, v33 in pairs(v30) do
                if v29.props[v32] ~= v33 then
                    if v32 ~= "extraProps" then
                        v29.log:trace("  Prop changed: {}", v32);
                        return true;
                    else
                        for v34, v35 in pairs(v33) do
                            if v29.props.extraProps[v34] ~= v35 then
                                v29.log:trace("  Extra prop changed: {}", v34);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
            for v36, v37 in pairs(v29.props) do
                if v30[v36] ~= v37 then
                    if v36 ~= "extraProps" then
                        v29.log:trace("  Prop changed: {}", v36);
                        return true;
                    else
                        for v38, v39 in pairs(v37) do
                            if v30.extraProps[v38] ~= v39 then
                                v29.log:trace("  Extra prop changed: {}", v38);
                                return true;
                            end;
                        end;
                    end;
                end;
            end;
            v29.scrollDebounce = false;
            v29.sizeDebounce = false;
            return false;
        end;
    end;
end;
v16.didUpdate = function(v40, v41, v42) --[[ Line: 319 ]] --[[ Name: didUpdate ]]
    -- upvalues: v4 (copy), v10 (copy)
    if not v40.alive then
        return;
    else
        v40.log:debug("didUpdate");
        if v4.isEmpty(v40.props.itemList) then
            return;
        elseif not v40.state.ready then
            v40.onResize(v40:getRef().current);
            return;
        else
            if v40.props.focusIndex ~= v41.focusIndex and v40.props.focusLock ~= v41.focusLock then
                v40.indexChanged = {
                    oldIndex = v41.focusIndex, 
                    newIndex = v40.props.focusIndex, 
                    lastFocusLock = v40.props.focusLock
                };
                v40.motorActive = false;
                v40.log:trace("self.props.focusIndex {}", v40.props.focusIndex);
                v40.log:trace("self.state.anchor.index {}", v40.state.anchor.index);
                v40.log:trace("previousState.anchor.index {}", v42.anchor and v42.anchor.index or tostring(nil));
            end;
            if not v40:adjustCanvas(v40.scrollingForward, v40.scrollingBackward) then
                if v40.indexChanged and v40.props.animateScrolling then
                    v40:scrollToAnchor();
                else
                    v40:moveToAnchor();
                end;
                if v40.anchorOffset ~= 0 then
                    if v40.forceUpdate then
                        v40:forceUpdate();
                        return;
                    else
                        v40:setState({});
                        return;
                    end;
                else
                    v40.resized = false;
                    v40:loadMore();
                    v40.sizeDebounce = false;
                    if v40.updating then
                        v40.timeLog:info("End of update");
                    end;
                    v40.updating = false;
                    if v40.props.onScrollUpdate then
                        v40.props.onScrollUpdate({
                            leadIndex = v40.state.lead.index, 
                            anchorIndex = v40.state.anchor.index, 
                            trailIndex = v40.state.trail.index, 
                            animationActive = v40.motorActive
                        });
                    end;
                end;
            end;
            v40.scrollDebounce = false;
            v40.sizeDebounce = false;
            v40._sizePropChanged = false;
            v40.prevCycle = {
                frameSize = v40:measure(v40:getCurrent().AbsoluteSize), 
                canvasSize = v40.state.size, 
                canvasPosition = v10.nearest(v40:measure(v40:getCurrent().CanvasPosition)), 
                relativeAnchorLocation = v40.relativeAnchorLocation
            };
            return;
        end;
    end;
end;
v16.updateMetadataList = function(v43, v44, v45, v46, v47, v48) --[[ Line: 403 ]] --[[ Name: updateMetadataList ]]
    -- upvalues: v16 (copy)
    local v49 = {};
    local v50 = {};
    for v51 = v47, v48 do
        local v52 = v46.itemList[v51];
        v50[v46.identifier(v52)] = v52;
    end;
    for v53, _ in pairs(v43) do
        if not v50[v53] then
            v49[v53] = true;
        elseif v43[v53].name then
            v50[v53] = nil;
        end;
    end;
    if next(v49) == nil and next(v50) == nil then
        return false;
    else
        for v55, _ in pairs(v49) do
            v16.clearMetadata(v43, v55, v46);
        end;
        for v57, v58 in pairs(v50) do
            v16.updateMetadata(v57, v58, v46, v43, v44, v45);
        end;
        return true;
    end;
end;
v16.copyMetadataState = function(v59) --[[ Line: 436 ]] --[[ Name: copyMetadataState ]]
    local v60 = {};
    for v61, v62 in pairs(v59.metadata) do
        v60[v61] = v62;
    end;
    local v63 = {};
    for v64, v65 in pairs(v59.pools) do
        v63[v64] = v65;
    end;
    local v66 = {};
    for v67, v68 in pairs(v59.refpool) do
        v66[v67] = v68;
    end;
    return v60, v63, v66;
end;
v16.getDerivedStateFromProps = function(v69, v70) --[[ Line: 455 ]] --[[ Name: getDerivedStateFromProps ]]
    -- upvalues: v13 (copy), v4 (copy), v16 (copy), v8 (copy), v9 (copy)
    v13:trace("getDerivedStateFromProps");
    if not v70.ready or v4.isEmpty(v69.itemList) then
        return nil;
    else
        local v71 = #v69.itemList;
        local v72 = nil;
        local v73, v74, v75 = v16.copyMetadataState(v70);
        if v70.lastFocusLock ~= v69.focusLock then
            v13:trace("  Resetting focus lock {} to {}", v70.lastFocusLock, v69.focusLock);
            if v69.animateScrolling and v70.lastFocusLock ~= nil then
                v72 = v69.focusLock;
            else
                local v76 = v69.identifier(v69.itemList[v69.focusIndex]);
                v16.updateMetadataList(v73, v74, v75, v69, v69.focusIndex, v69.focusIndex);
                return {
                    listSize = v71, 
                    trail = {
                        index = v69.focusIndex, 
                        id = v76
                    }, 
                    anchor = {
                        index = v69.focusIndex, 
                        id = v76
                    }, 
                    lead = {
                        index = v69.focusIndex, 
                        id = v76
                    }, 
                    padding = 0, 
                    size = 0, 
                    lastFocusLock = v69.focusLock, 
                    metadata = v73, 
                    pools = v74, 
                    refpool = v75
                };
            end;
        end;
        local v77, v78, v79 = v8(v69, v70);
        v13:trace("  Trailing index moved from {} to {}", v70.trail.index, v77);
        v13:trace("  Anchor index moved from {} to {}", v70.anchor.index, v78);
        v13:trace("  Leading index moved from {} to {}", v70.lead.index, v79);
        if v78 and v70.anchor.index == v78 and v77 and v70.trail.index == v77 and v79 and v70.lead.index == v79 then
            local v80 = v16.updateMetadataList(v73, v74, v75, v69, v70.trail.index, v70.lead.index);
            v13:trace("  No change, returning early");
            if v71 == v70.listSize then
                if v72 then
                    return {
                        lastFocusLock = v72, 
                        metadata = v73, 
                        pools = v74, 
                        refpool = v75
                    };
                elseif v80 then
                    return {
                        metadata = v73, 
                        pools = v74, 
                        refpool = v75
                    };
                else
                    return nil;
                end;
            else
                return {
                    listSize = v71, 
                    lastFocusLock = v72, 
                    metadata = v73, 
                    pools = v74, 
                    refpool = v75
                };
            end;
        else
            local v81 = v9({
                trailIndex = v77, 
                anchorIndex = v78, 
                leadIndex = v79
            }, {
                trailIndex = v70.trail.index, 
                anchorIndex = v70.anchor.index, 
                leadIndex = v70.lead.index
            }, v71);
            v13:trace("  Anchor index moved to {}", v81.anchorIndex);
            v13:trace("  Trailing index moved to {}", v81.trailIndex);
            v13:trace("  Leading index moved to {}", v81.leadIndex);
            local v82 = v69.identifier(v69.itemList[v81.trailIndex]);
            local v83 = v69.identifier(v69.itemList[v81.anchorIndex]);
            local v84 = v69.identifier(v69.itemList[v81.leadIndex]);
            v16.updateMetadataList(v73, v74, v75, v69, v81.trailIndex, v81.leadIndex);
            return {
                listSize = v71, 
                trail = {
                    index = v81.trailIndex, 
                    id = v82
                }, 
                anchor = {
                    index = v81.anchorIndex, 
                    id = v83
                }, 
                lead = {
                    index = v81.leadIndex, 
                    id = v84
                }, 
                lastFocusLock = v72, 
                metadata = v73, 
                pools = v74, 
                refpool = v75
            };
        end;
    end;
end;
v16.init = function(v85) --[[ Line: 563 ]] --[[ Name: init ]]
    -- upvalues: l_HttpService_0 (copy), v13 (copy), v14 (copy), v3 (copy), v4 (copy), v10 (copy), v19 (copy), l_RunService_0 (copy), v15 (copy), v16 (copy)
    v85.guid = l_HttpService_0:GenerateGUID();
    v85.log = v13:new(script:GetFullName() .. "." .. v85.guid);
    v85.timeLog = v14:new(script:GetFullName() .. "." .. v85.guid);
    v85.log:debug("init");
    v85._ref = v3.createRef();
    v85.paddingRef = v3.createRef();
    v85.motorPrevValue = 0;
    v85.motorOnStep = function(v86) --[[ Line: 577 ]]
        -- upvalues: v85 (copy)
        v85.log:trace("onStep {}", v86);
        if not v85.motorActive or v85.indexChanged == nil then
            v85.motor:stop();
            return;
        elseif v85.indexChanged.currentPos == nil then
            v85.motor:stop();
            return;
        else
            local v87 = v86 - v85.motorPrevValue;
            if v85:getCurrent() then
                v85:scrollRelative(v87);
                v85.motorPrevValue = v86;
            end;
            return;
        end;
    end;
    v85.motorOnComplete = function() --[[ Line: 595 ]]
        -- upvalues: v85 (copy)
        v85.log:trace("otter onComplete");
        v85.motorActive = false;
        if v85.props.onScrollUpdate then
            v85.props.onScrollUpdate({
                leadIndex = v85.props.focusIndex, 
                anchorIndex = v85.props.focusIndex, 
                trailIndex = v85.props.focusIndex, 
                animationActive = v85.motorActive
            });
        end;
        v85.motorPrevValue = 0;
        v85.indexChanged = nil;
        if v85.motor then
            v85.motor:destroy();
        end;
    end;
    v85.motorActive = false;
    v85.springLock = 0;
    v85.scrollDebounce = false;
    v85.sizeDebounce = true;
    v85.indexChanged = nil;
    v85.onScroll = function(v88) --[[ Line: 622 ]]
        -- upvalues: v85 (copy), v4 (ref), v3 (ref), v10 (ref)
        v85.log:trace("onScroll");
        if not v85.alive or v85.resized then
            return;
        else
            v85.log:trace("  CanvasPosition is {}", v88.CanvasPosition);
            if v85.scrollDebounce then
                v85.log:trace("  Debouncing scroll");
                return;
            else
                v85.scrollDebounce = not v85:isScrollingWithElasticBehavior();
                if not v85:getRbx(v85.state.trail.index) or not v85:getRbx(v85.state.lead.index) then
                    v85.scrollDebounce = false;
                    return;
                else
                    local v89, v90 = v85:recalculateAnchor();
                    v85.scrollingBackward = v89 < 0;
                    v85.scrollingForward = v89 > 0;
                    v85.log:trace("  Delta is {}", v89);
                    v90 = v4.Dictionary.join(v90, v85:resetAnchorPosition(v90), v85:recalculateBounds(v85.scrollingForward, v85.scrollingBackward, v90));
                    if not v4.isEmpty(v90) then
                        v85:setState(v90);
                    end;
                    if v85.props[v3.Change.CanvasPosition] then
                        v85.props[v3.Change.CanvasPosition](v88);
                    end;
                    v85.prevCycle.canvasPosition = v10.nearest(v85:measure(v88.CanvasPosition));
                    return;
                end;
            end;
        end;
    end;
    v85.onResize = function(v91) --[[ Line: 664 ]]
        -- upvalues: v85 (copy), v10 (ref), v19 (ref), v3 (ref), l_RunService_0 (ref), v15 (ref)
        v85.log:trace("onResize");
        if not v85.alive then
            return;
        else
            local v92 = v85:measure(v91.AbsoluteSize);
            local v93 = v85:measure(v91.AbsolutePosition);
            v85.leadBufferPx = v10.nearest(v85.props.leadBuffer.Scale * v92 + v85.props.leadBuffer.Offset);
            v85.trailBufferPx = v10.nearest(v85.props.trailBuffer.Scale * v92 + v85.props.trailBuffer.Offset);
            v85.itemPadding = v85.props.padding.Scale * v92 + v85.props.padding.Offset;
            if v19[v85.props.orientation] then
                v85.relativeAnchorLocation = v10.nearest(v85.props.anchorLocation.Scale * v92 + v85.props.anchorLocation.Offset);
            else
                v85.relativeAnchorLocation = v10.nearest((1 - v85.props.anchorLocation.Scale) * v92 - v85.props.anchorLocation.Offset);
            end;
            v85.absoluteAnchorLocation = v85.relativeAnchorLocation + v93;
            v85.mountAboveAnchor = v85.relativeAnchorLocation + v85.props.mountingBuffer;
            v85.mountBelowAnchor = v92 - v85.relativeAnchorLocation + v85.props.mountingBuffer;
            v85.resized = true;
            v85.increasedSize = v85.state.size < v92;
            if v85.props[v3.Change.AbsoluteSize] then
                v85.props[v3.Change.AbsoluteSize](v91);
            end;
            if not v85.state.ready then
                v85.log:trace("  Setting initial anchor position to {}", v85.relativeAnchorLocation);
                v85.anchorFramePosition = 0;
                v85.anchorCanvasPosition = v85.relativeAnchorLocation;
                if v85.alive then
                    v85:setState({
                        ready = true
                    });
                    coroutine.wrap(function() --[[ Line: 711 ]]
                        -- upvalues: l_RunService_0 (ref), v85 (ref), v15 (ref)
                        l_RunService_0.Heartbeat:Wait();
                        if v85.props[v15] then
                            v85.props[v15]:Fire();
                        end;
                    end)();
                    return;
                end;
            else
                v85:handleResize(v92);
            end;
            return;
        end;
    end;
    v85.onContentResize = function() --[[ Line: 724 ]]
        -- upvalues: v85 (copy)
        v85.log:trace("onContentResize");
        if not v85.alive or v85.sizeDebounce or not v85.state.ready or v85:isScrollingWithElasticBehavior() then
            v85.log:trace("  Skipping onContentResize");
            return;
        elseif v85.forceUpdate then
            v85:forceUpdate();
            return;
        else
            v85:setState({});
            return;
        end;
    end;
    v85.anchorCanvasPosition = 0;
    v85.anchorFramePosition = 0;
    v85.anchorOffset = 0;
    v85.scrollingBackward = false;
    v85.scrollingForward = false;
    v85.lastLoadPrevItems = nil;
    v85.lastLoadNextItems = nil;
    v85.alive = true;
    v85.updating = false;
    v85.propsToClear = {
        scrollingFrameRef = v4.None
    };
    for v94, _ in pairs(v16.defaultProps) do
        v85.propsToClear[v94] = v4.None;
    end;
    v85:setState({
        ready = false, 
        lastFocusLock = nil, 
        padding = 0, 
        size = 0, 
        metadata = {}, 
        pools = {}, 
        refpool = {}
    });
end;
v16.willUnmount = function(v96) --[[ Line: 772 ]] --[[ Name: willUnmount ]]
    if v96.motor then
        v96.motor:destroy();
    end;
    v96.alive = false;
end;
v16.recalculateAnchor = function(v97) --[[ Line: 781 ]] --[[ Name: recalculateAnchor ]]
    v97.log:trace("recalculateAnchor");
    local v98 = v97:findIndexAt(v97:absoluteToCanvasPosition(v97.absoluteAnchorLocation), v97.state.anchor.index, false);
    v97.anchorCanvasPosition = v97:getAnchorCanvasFromIndex(v98);
    v97.anchorFramePosition = v97:getAnchorFrameFromIndex(v98);
    local v99 = nil;
    if v98 == v97.state.anchor.index then
        v97.log:trace("  Current anchor still works");
        return 0, {};
    else
        v99 = v98 < v97.state.anchor.index and -1 or 1;
        v97.log:trace("  New anchor at index {}", v98);
        v97.log:trace("  New anchor at canvas position {}", v97.anchorCanvasPosition);
        v97.log:trace("  New anchor at frame position {}", v97.anchorFramePosition);
        return v99, {
            anchor = {
                index = v98, 
                id = v97:getID(v98)
            }
        };
    end;
end;
v16.resetAnchorPosition = function(v100, v101) --[[ Line: 812 ]] --[[ Name: resetAnchorPosition ]]
    -- upvalues: v10 (copy)
    local v102 = v101 and v101.anchor or v100.state.anchor;
    local v103 = v101 and v101.padding or v100.state.padding;
    v100.log:trace("resetAnchorPosition");
    v100.log:trace("  Anchor index is {}", v102.index);
    local v104 = v100:getAnchorCanvasFromIndex(v102.index);
    v100.log:trace("  Anchor is at {}", v104);
    v100.log:trace("  Anchor offset is {}", v100.anchorOffset);
    local v105 = v100.anchorCanvasPosition - v100.anchorOffset;
    v100.log:trace("  Anchor should be at {}", v105);
    local v106 = v10.nearest(v105 - v104);
    if v106 ~= 0 then
        v100.log:trace("  Changing padding from {} to {}", v103, v103 + v106);
        v100.log:trace("  Changing anchorCanvasPosition from {} to {}", v100.anchorCanvasPosition, v10.nearest(v100.anchorCanvasPosition - v100.anchorOffset));
        v100.anchorCanvasPosition = v10.nearest(v100.anchorCanvasPosition - v100.anchorOffset);
        v100.anchorOffset = 0;
        return {
            padding = v103 + v106
        };
    else
        return {};
    end;
end;
v16.getCurrentPadding = function(v107) --[[ Line: 836 ]] --[[ Name: getCurrentPadding ]]
    local l_current_0 = v107.paddingRef.current;
    if not l_current_0 then
        return 0;
    else
        return l_current_0.Size.X.Offset + l_current_0.Size.Y.Offset;
    end;
end;
v16.recalculateBounds = function(v109, v110, v111, v112) --[[ Line: 847 ]] --[[ Name: recalculateBounds ]]
    local v113 = v112 and v112.lead or v109.state.lead;
    local v114 = v112 and v112.trail or v109.state.trail;
    local v115 = v112 and v112.anchor or v109.state.anchor;
    v109.log:trace("recalculateBounds");
    v109.log:trace("  Leading index was {}", v113.index);
    v109.log:trace("  Trailing index was {}", v114.index);
    local v116 = v109:getAnchorCanvasFromIndex(v115.index);
    local v117 = v116 - v109.mountAboveAnchor;
    local v118 = v116 + v109.mountBelowAnchor;
    v109.log:trace("  Target for top at {}", v117);
    v109.log:trace("  Target for bottom at {}", v118);
    local v119 = v109:findIndexAt(v117, v115.index, true);
    v109.log:trace("  Found new top index at {}", v119);
    local v120 = v109:findIndexAt(v118, v115.index, true);
    v109.log:trace("  Found new bottom index at {}", v120);
    local v121 = math.max(v119, v120);
    if v121 < v113.index and not v111 then
        v121 = v113.index;
    end;
    local v122 = math.min(v119, v120);
    if v114.index < v122 and not v110 then
        v122 = v114.index;
    end;
    if v122 < v114.index or v113.index < v121 then
        v109.log:trace("  Changing leading index to {}", v121);
        v109.log:trace("  Changing trailing index to {}", v122);
        return {
            trail = {
                index = v122, 
                id = v109:getID(v122)
            }, 
            lead = {
                index = v121, 
                id = v109:getID(v121)
            }
        };
    else
        return {};
    end;
end;
v16.findIndexAt = function(v123, v124, v125, v126) --[[ Line: 892 ]] --[[ Name: findIndexAt ]]
    -- upvalues: v10 (copy)
    v123.log:trace("  findIndexAt");
    local v127 = v125 or v123.state.anchor.index;
    local v128 = v123:distanceToPosition(v127, v124);
    v123.log:trace("    Searching from index {}", v127);
    v123.log:trace("    Position is {} from {}", v128, v124);
    if v128 == 0 then
        local v129 = v127 + v10.awayFromZero(v123.props.anchorLocation.Scale - 0.5);
        if v123.state.listSize < v129 or v129 < 1 then
            return v127;
        elseif v123:distanceToPosition(v129, v124) == 0 then
            return v129;
        else
            return v127;
        end;
    elseif not v128 then
        return v125;
    else
        local v130 = v128 < 0 and v123.state.trail.index or v123.state.lead.index;
        v123.log:trace("    Nearest end at {}", v130);
        if v127 == v130 then
            v123.log:trace("    Hint index already at end");
            if v127 + v128 < v123.state.trail.index or v127 + v128 > v123.state.lead.index then
                v123.log:trace("    Target out of bounds");
                if not v126 then
                    return v127;
                else
                    local v131 = v10.awayFromZero(v128 / v123.props.estimatedItemSize);
                    v123.log:trace("    Estimating target at {} from end", v131);
                    return (math.min(math.max(v127 + v131, 1), v123.state.listSize));
                end;
            end;
        else
            local v132 = v123:distanceToPosition(v130, v124);
            v123.log:trace("    End is {} from target", v132);
            if v132 == 0 then
                return v130;
            elseif not v132 then
                return v125;
            elseif v128 * v132 > 0 then
                v123.log:trace("    Target out of bounds");
                if not v126 then
                    return v130;
                else
                    local v133 = v10.awayFromZero(v132 / v123.props.estimatedItemSize);
                    v123.log:trace("    Estimating target at {} from end", v133);
                    return (math.min(math.max(v130 + v133, 1), v123.state.listSize));
                end;
            else
                local v134 = math.abs(v128) + math.abs(v132);
                local v135 = math.abs(v127 - v130);
                v127 = v127 + v10.nearest(v135 * v128 / v134);
                v128 = v123:distanceToPosition(v127, v124);
                v123.log:trace("    Interpolated index is {}", v127);
                v123.log:trace("    Distance from interpolated index is {}", v128);
            end;
        end;
        while v128 ~= 0 and v128 ~= nil do
            if v128 < 0 then
                v127 = v127 - 1;
            else
                v127 = v127 + 1;
            end;
            v128 = v123:distanceToPosition(v127, v124);
            v123.log:trace("    Distance after step is {}", v128);
        end;
        return v127;
    end;
end;
v16.findIndexWithRemainder = function(v136, v137, v138, v139) --[[ Line: 980 ]] --[[ Name: findIndexWithRemainder ]]
    -- upvalues: v19 (copy), v10 (copy)
    local v140 = v19[v136.props.orientation];
    if v137 < (v140 and v136.leadBufferPx or v136.trailBufferPx) then
        return v140 and v136.state.listSize or 1, 0;
    elseif v10.nearest(v136:measure(v136:getCurrent().CanvasSize).Offset) < v137 then
        return v140 and 1 or v136.state.listSize, 0;
    else
        local v141 = v136:findIndexAt(v137, v138, v139);
        local v142 = v136:getAnchorCanvasFromIndex(v141);
        local v143 = v141 + v10.awayFromZero(v136.props.anchorLocation.Scale - 0.5);
        if v136.state.listSize < v143 or v143 < 1 then
            return v141, 0;
        elseif v136:distanceToPosition(v143, v137) == 0 then
            return v143, 0;
        else
            return v141, v142 - v137;
        end;
    end;
end;
v16.checkTrimTopError = function(v144, v145) --[[ Line: 1010 ]] --[[ Name: checkTrimTopError ]]
    if v144.lastTrimTop == v145 then
        if v144.numberOfTopTrims >= 3 then
            error("There was an error laying out the items.  Check to see if you provided enough leadBuffer and/or trailBuffer");
            return;
        else
            v144.numberOfTopTrims = v144.numberOfTopTrims + 1;
            return;
        end;
    else
        v144.lastTrimTop = v145;
        v144.numberOfTopTrims = 0;
        return;
    end;
end;
v16.trimTopHelper = function(v146, v147, v148, v149, v150, v151, v152) --[[ Line: 1023 ]] --[[ Name: trimTopHelper ]]
    -- upvalues: v10 (copy)
    local v153 = v147 and v146.leadBufferPx or v146.trailBufferPx;
    if v149 + v152 < v153 then
        v152 = v149 - v153;
    end;
    if v152 >= 0 or v148 + v152 < 0 then
        return {};
    else
        v146:checkTrimTopError(v152);
        local v154 = v10.nearest(v148 + v152);
        local v155 = v10.nearest(v149 + v152);
        local v156 = v10.nearest(v146.anchorCanvasPosition + v152);
        v146.log:trace("  Changing anchor canvas position from {} to {}", v146.anchorCanvasPosition, v156);
        v146.anchorCanvasPosition = v156;
        local v157 = v146:getChildFramePosition(v151);
        local v158 = v150.index - 1;
        if v158 > 0 and v157 > 0 and v146:getChildCanvasPosition(v158) > v146.anchorCanvasPosition then
            local v159 = {
                index = v158, 
                id = v146:getID(v158)
            };
            return {
                size = v154, 
                padding = v155, 
                anchor = v159
            };
        else
            return {
                size = v154, 
                padding = v155
            };
        end;
    end;
end;
v16.trimTop = function(v160, v161, v162, v163, v164, v165, v166) --[[ Line: 1069 ]] --[[ Name: trimTop ]]
    local v167 = v161 and v165 == v160.state.listSize or not v161 and v165 == 1;
    local v168 = v161 and v160.leadBufferPx or v160.trailBufferPx;
    return v160:trimTopHelper(v161, v162, v163, v164, v165, v167 and v168 - v166 or 0);
end;
v16.shortTrimTop = function(v169, v170, v171, v172, v173, v174, v175) --[[ Line: 1078 ]] --[[ Name: shortTrimTop ]]
    -- upvalues: v10 (copy)
    local v176 = v169:getChildFramePosition(v175);
    local v177 = v170 and v169.trailBufferPx or v169.leadBufferPx;
    local _ = nil;
    return v169:trimTopHelper(v170, v171, v173, v174, v175, if v176 >= 0 and v176 <= v172 then -v10.towardsZero(v171 - v177 - v172) else v176);
end;
v16.checkTrimBottomError = function(v179, v180) --[[ Line: 1094 ]] --[[ Name: checkTrimBottomError ]]
    if v179.lastTrimBottom == v180 then
        if v179.numberOfBottomTrims >= 3 then
            error("There was an error laying out the items.  Check to see if you provided enough leadBuffer and/or trailBuffer");
            return;
        else
            v179.numberOfBottomTrims = v179.numberOfBottomTrims + 1;
            return;
        end;
    else
        v179.lastTrimBottom = v180;
        v179.numberOfBottomTrims = 0;
        return;
    end;
end;
v16.trimBottomHelper = function(v181, v182, v183) --[[ Line: 1107 ]] --[[ Name: trimBottomHelper ]]
    -- upvalues: v10 (copy)
    if v183 <= 0 then
        return {};
    else
        v181:checkTrimBottomError(v183);
        return {
            size = v10.nearest(v182 - v183)
        };
    end;
end;
v16.trimBottom = function(v184, v185, v186, v187, v188) --[[ Line: 1124 ]] --[[ Name: trimBottom ]]
    local v189 = v185 and v186 == 1 or not v185 and v186 == v184.state.listSize;
    local v190 = v185 and v184.trailBufferPx or v184.leadBufferPx;
    local v191 = v189 and v188 - v190 - v187 or 0;
    if v184.resized and v184.increasedSize then
        return {};
    else
        return v184:trimBottomHelper(v188, v191);
    end;
end;
v16.shortTrimBottom = function(v192, v193, v194, v195, v196, v197) --[[ Line: 1137 ]] --[[ Name: shortTrimBottom ]]
    local v198 = v192:getChildFramePosition(v194) + v192:getChildSize(v194);
    if v198 >= 0 and v198 <= v197 then
        return {};
    else
        return v192:trimBottomHelper(v196, v196 - (v193 and v192.trailBufferPx or v192.leadBufferPx) - v195);
    end;
end;
v16.adjustEdges = function(v199, v200) --[[ Line: 1155 ]] --[[ Name: adjustEdges ]]
    -- upvalues: v10 (copy), v19 (copy), v4 (copy)
    v199.log:trace("adjustEdges");
    local v201 = v200.size or v199.state.size;
    v201 = v10.nearest(v201);
    local v202 = v200.padding or v199.state.padding;
    local v203 = v200.anchor or v199.state.anchor;
    local v204 = v19[v199.props.orientation];
    local v205 = v199:measure(v199:getCurrent().AbsoluteSize);
    local v206 = v204 and v199.state.lead.index or v199.state.trail.index;
    local v207 = v10.nearest(v199:getChildCanvasPosition(v206)) - v199.itemPadding;
    local v208 = v204 and v199.state.trail.index or v199.state.lead.index;
    local v209 = v199:getChildSize(v208);
    local v210 = v10.nearest(v199:getChildCanvasPosition(v208) + v209);
    local v211 = v199.leadBufferPx + v199.trailBufferPx + (v210 - v207);
    local v212 = nil;
    if v210 - v207 <= v205 or v211 <= v205 then
        if v204 then
            local v213 = v199:trimBottom(v204, v208, v210, v201);
            local v214 = v199:shortTrimTop(v204, v213.size or v201, v205, v202, v203, v206);
            v212 = v4.Dictionary.join(v213, v214);
        else
            local v215 = v199:trimTop(v204, v201, v202, v203, v206, v207);
            local v216 = v199:shortTrimBottom(v204, v208, v210, v215.size or v201, v205);
            v212 = v4.Dictionary.join(v215, v216);
        end;
    else
        local v217 = v199:trimTop(v204, v201, v202, v203, v206, v207);
        local v218 = v199:trimBottom(v204, v208, v210, v217.size or v201);
        v212 = v4.Dictionary.join(v217, v218);
    end;
    if v212.size then
        v199.log:trace("  Changing canvas size from {} to {}", v201, v212.size);
    end;
    if v212.padding then
        v199.log:trace("  Changing canvas padding from {} to {}", v202, v212.padding);
    end;
    if v212.anchor then
        v199.log:trace("  Changing anchor index from {} to {}", v203.index, v212.anchor.index);
    end;
    return v212;
end;
v16.expandCanvas = function(v219, v220) --[[ Line: 1209 ]] --[[ Name: expandCanvas ]]
    -- upvalues: v19 (copy), v10 (copy)
    v219.log:trace("expandCanvas");
    local v221 = v19[v219.props.orientation];
    local v222 = v221 and v219.state.trail.index or v219.state.lead.index;
    local v223 = v221 and v219.leadBufferPx or v219.trailBufferPx;
    local v224 = v221 and v219.trailBufferPx or v219.leadBufferPx;
    local v225 = v220.size or v219.state.size;
    v225 = v10.nearest(v225);
    local l_v225_0 = v225;
    local v227 = v220.padding or v219.state.padding;
    local l_v227_0 = v227;
    local v229 = v219:getCurrentPadding();
    local v230 = v219:getChildCanvasPosition(v222) + v219:getChildSize(v222) - (v229 - v227);
    local v231 = v10.nearest(v230 + v224);
    v219.log:trace("  Padding is {}", v227);
    v219.log:trace("  Padding should be at least {}", v223);
    if v227 < v223 then
        local v232 = v227 - v223;
        v225 = v10.nearest(v225 - v232);
        v219.anchorCanvasPosition = v10.nearest(v219.anchorCanvasPosition - v232);
        v227 = v223;
        v219.log:trace("  Expanding canvas top to size {}", v225);
        v219.log:trace("  Shifting anchor to {}", v219.anchorCanvasPosition);
        v219.log:trace("  Padding is now {}", v227);
    end;
    v219.log:trace("  Bottom of bottom child is {}", v230);
    v219.log:trace("  Canvas size is {}", l_v225_0);
    v219.log:trace("  Canvas bottom should be {}", v231);
    local v233 = v219:measure(v219:getCurrent().AbsoluteSize) - math.max(0, v227);
    if l_v225_0 < v233 then
        v225 = v233;
        v219.log:trace("  Expanding canvas to minimum size {}", v225);
    end;
    if l_v225_0 < v231 then
        v225 = math.max(v231, v225);
        v219.log:trace("  Expanding canvas bottom to size {}", v225);
    end;
    if v225 ~= l_v225_0 or v227 ~= l_v227_0 then
        v219.log:trace("  Changing size from {} to {}", l_v225_0, v225);
        v219.log:trace("  Changing padding from {} to {}", l_v227_0, v227);
        return {
            size = v225, 
            padding = v227
        };
    else
        v219.log:trace("  No changes to size or padding");
        return {};
    end;
end;
v16.adjustCanvas = function(v234, v235, v236) --[[ Line: 1271 ]] --[[ Name: adjustCanvas ]]
    -- upvalues: v4 (copy)
    v234.log:trace("adjustCanvas");
    if v234._sizePropChanged then
        v234.log:trace("  Skipping because Size prop changed");
        return true;
    else
        local v237 = v4.Dictionary.join(v234:resetAnchorPosition(), v234:recalculateBounds(v235, v236));
        if not v237.trail and not v237.lead then
            v237 = v4.Dictionary.join(v237, v234:expandCanvas(v237));
        end;
        if not v237.size and not v237.padding then
            v237 = v4.Dictionary.join(v237, v234:adjustEdges(v237));
        end;
        if v4.isEmpty(v237) then
            v234.log:trace("  No state changes after adjustment");
            return false;
        else
            v234:setState(v237);
            return true;
        end;
    end;
end;
v16.handleResize = function(v238, v239) --[[ Line: 1302 ]] --[[ Name: handleResize ]]
    -- upvalues: v19 (copy), v10 (copy)
    if not v238:getRbx(v238.state.anchor.index) then
        return;
    else
        local v240 = v19[v238.props.orientation];
        local v241 = v10.nearest(v238:measure(v238:getCurrent().CanvasSize).Offset);
        local v242 = v238:measure(v238:getCurrent().AbsoluteSize);
        local v243 = v240 and v238.leadBufferPx or v238.trailBufferPx;
        local v244 = v240 and v238.trailBufferPx or v238.leadBufferPx;
        local v245 = v240 and v238.state.trail.index or v238.state.lead.index;
        local v246 = v240 and v238.state.lead.index or v238.state.trail.index;
        local v247 = v238:getChildSize(v245);
        local v248 = v10.nearest(v238:getChildCanvasPosition(v246)) - v238.itemPadding;
        local v249 = v10.nearest(v238:getChildCanvasPosition(v245)) + v247 + v244 - v248;
        local v250 = 0;
        if v238.prevCycle.frameSize and v239 then
            v250 = v239 - v238.prevCycle.frameSize;
        end;
        local v251 = v238.prevCycle.canvasPosition + v238.prevCycle.frameSize;
        local v252 = math.max(v238.prevCycle.canvasSize - v244 - v251, 0);
        local l_canvasPosition_0 = v238.prevCycle.canvasPosition;
        local v254 = 0;
        if v242 < v241 then
            v254 = v248 - v243;
        end;
        local v255 = nil;
        local v256 = nil;
        if v250 < 0 then
            if v238.relativeAnchorLocation > v242 * 0.5 then
                v256 = math.min(v254, v250);
                v255 = v250 - v256;
            else
                v255 = v250;
                v256 = 0;
            end;
        elseif v238.relativeAnchorLocation > v242 * 0.5 then
            v256 = math.min(l_canvasPosition_0, v250);
            local v257 = v250 - v256;
            v255 = math.min(v252, v257);
            v256 = v256 + (v257 - v255);
        else
            v255 = math.min(v252, v250);
            local v258 = v250 - v255;
            v256 = math.min(l_canvasPosition_0, v258);
            v255 = v255 + (v258 - v256);
        end;
        if v238.relativeAnchorLocation >= v242 * 0.5 then
            local v259 = v238:getAnchorCanvasFromIndex(v238.state.anchor.index) - v238.anchorFramePosition;
            local v260, v261 = v238:findIndexWithRemainder(v259 + v250 - v256, v238.state.anchor.index, false);
            v238.anchorFramePosition = math.max(v261, 0);
            v238.anchorCanvasPosition = math.min(v259 + v250, v241 - v244);
            if v250 > 0 then
                v238.anchorOffset = l_canvasPosition_0 + v238.anchorFramePosition - v256;
            end;
            v238:setState({
                anchor = {
                    index = v260, 
                    id = v238:getID(v260)
                }
            });
            return;
        else
            local l_v241_0 = v241;
            if v249 < v241 then
                l_v241_0 = math.min(v249, v241 + v255);
            end;
            local v263, v264 = v238:findIndexWithRemainder(v238.anchorCanvasPosition - v256, v238.state.anchor.index, false);
            if math.abs(v255) < math.abs(v250) then
                v238.anchorFramePosition = 0;
            elseif v263 == v238.state.anchor.index then
                v238.anchorFramePosition = v238.anchorFramePosition + v256;
            else
                v238.anchorFramePosition = v238.anchorFramePosition + v264;
            end;
            v238.anchorCanvasPosition = v238.anchorCanvasPosition - v256;
            v238:setState({
                size = l_v241_0, 
                anchor = {
                    index = v263, 
                    id = v238:getID(v263)
                }
            });
            return;
        end;
    end;
end;
v16.scrollToAnchor = function(v265) --[[ Line: 1416 ]] --[[ Name: scrollToAnchor ]]
    -- upvalues: v6 (copy)
    if v265.motorActive then
        return;
    else
        v265.log:trace("scrollToAnchor");
        if v265.indexChanged == nil then
            v265:moveToAnchor();
        end;
        local l_newIndex_0 = v265.indexChanged.newIndex;
        local l_oldIndex_0 = v265.indexChanged.oldIndex;
        v265.log:trace(" newIndex {}", l_newIndex_0);
        v265.log:trace(" previousIndex {}", l_oldIndex_0);
        local v268 = v265:measure(v265:getCurrent().CanvasPosition) + v265.relativeAnchorLocation;
        local v269 = v265:getAnchorCanvasFromIndex(l_newIndex_0);
        v265.log:trace(" old anchor pos {}", v268);
        v265.log:trace(" new anchor pos {}", v269);
        v265.indexChanged.currentPos = v268;
        v265.indexChanged.newPos = v269;
        v265.motorActive = true;
        v265.springLock = v265.springLock + 1;
        local v270 = v269 - v268;
        v265.log:trace(" delta {}", v270);
        v265.motor = v6.createSingleMotor(0);
        v265.motor:onStep(v265.motorOnStep);
        v265.motor:onComplete(v265.motorOnComplete);
        v265.motor:setGoal(v6.spring(v270, v265.props.animateOptions));
        return;
    end;
end;
v16.moveToAnchor = function(v271) --[[ Line: 1450 ]] --[[ Name: moveToAnchor ]]
    -- upvalues: v10 (copy)
    v271.log:trace("moveToAnchor");
    if v271.motorActive then
        return;
    elseif v271:isScrollingWithElasticBehavior() then
        return;
    else
        local v272 = v271:getAnchorFramePosition();
        v271.log:trace("  Anchor was at frame position {}", v271.anchorFramePosition);
        v271.log:trace("  Anchor is currently at frame position {}", v272);
        local v273 = v271:measure(v271:getCurrent().CanvasPosition) + v272 - v271.anchorFramePosition;
        v271.log:trace("  Canvas should scroll to {}", v273);
        local v274 = v271:getCurrent();
        local v275 = math.max(0, v271:measure(v274.CanvasSize).Offset - v271:measure(v274.AbsoluteSize));
        v271:setScroll(v273);
        if v273 < 0 then
            v271.log:trace("  Canvas scroll limited to 0, was {}", v273);
            v271.anchorOffset = v10.towardsZero(v273);
            return;
        elseif v275 <= v273 then
            v271.log:trace("  Canvas scroll limited to {}, was {}", v275, v273);
            v271.anchorOffset = v10.towardsZero(v273 - v275);
            return;
        else
            v271.log:trace("  Clearing anchorOffset");
            v271.anchorOffset = 0;
            return;
        end;
    end;
end;
v16.isScrollingWithElasticBehavior = function(v276) --[[ Line: 1481 ]] --[[ Name: isScrollingWithElasticBehavior ]]
    -- upvalues: v19 (copy), v10 (copy)
    if v276.resized then
        return false;
    else
        local v277 = v19[v276.props.orientation];
        local v278 = v277 and v276.state.lead.index or v276.state.trail.index;
        local v279 = v277 and v276.state.listSize or 1;
        if v276:measure(v276:getCurrent().CanvasPosition) < 0 and v278 == v279 then
            return true;
        else
            local v280 = v277 and v276.state.trail.index or v276.state.lead.index;
            local v281 = v276:measure(v276:getCurrent().AbsoluteSize);
            local v282 = v276:measure(v276:getCurrent().CanvasPosition);
            local v283 = v277 and 1 or v276.state.listSize;
            if v10.nearest(v282 + v281) > v10.nearest(v276:measure(v276:getCurrent().CanvasSize).Offset) and v280 == v283 and v282 > 0 then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
v16.loadMore = function(v284) --[[ Line: 1512 ]] --[[ Name: loadMore ]]
    v284.log:trace("loadMore");
    if v284.props.loadPrevious and v284.state.trail.index <= v284.props.loadingBuffer and v284.props.itemList ~= v284.lastLoadPrevItems then
        v284.log:trace("  Calling loadPrevious");
        v284.lastLoadPrevItems = v284.props.itemList;
        v284.props.loadPrevious();
    end;
    if v284.props.loadNext and v284.state.lead.index > v284.state.listSize - v284.props.loadingBuffer and v284.props.itemList ~= v284.lastLoadNextItems then
        v284.log:trace("  Calling loadNext");
        v284.lastLoadNextItems = v284.props.itemList;
        v284.props.loadNext();
    end;
end;
v16.setScroll = function(v285, v286) --[[ Line: 1532 ]] --[[ Name: setScroll ]]
    -- upvalues: v18 (copy)
    v285.log:trace("    Scrolling to {}", v286);
    v285.scrollDebounce = true;
    v285:getCurrent().CanvasPosition = v18[v285.props.orientation] and Vector2.new(v285:getCurrent().CanvasPosition.X, v286) or Vector2.new(v286, v285:getCurrent().CanvasPosition.Y);
    v285.scrollDebounce = false;
end;
v16.scrollRelative = function(v287, v288) --[[ Line: 1542 ]] --[[ Name: scrollRelative ]]
    v287.log:trace("  Current CanvasPosition {}", v287:getCurrent().CanvasPosition);
    v287.log:trace("self.motorActive {}", v287.motorActive);
    v287:setScroll(v287:measure(v287:getCurrent().CanvasPosition) + v288, true);
    v287.onScroll(v287:getCurrent());
end;
v16.distanceToPosition = function(v289, v290, v291) --[[ Line: 1555 ]] --[[ Name: distanceToPosition ]]
    -- upvalues: v10 (copy), v11 (copy), v20 (copy)
    local v292 = v289:getRbx(v290);
    if not v292 then
        return nil;
    else
        local v293 = v289:absoluteToCanvasPosition(v289:measure(v292.AbsolutePosition)) - v289.itemPadding;
        local v294 = v289:measure(v292.AbsoluteSize) + 2 * v289.itemPadding;
        return v10.nearest(v11.fromPointToRangeSigned(v291, v293, v294) * v20[v289.props.orientation]);
    end;
end;
v16.getAnchorCanvasPosition = function(v295) --[[ Line: 1568 ]] --[[ Name: getAnchorCanvasPosition ]]
    return v295:getAnchorCanvasFromIndex(v295.state.anchor.index);
end;
v16.getAnchorCanvasFromIndex = function(v296, v297) --[[ Line: 1572 ]] --[[ Name: getAnchorCanvasFromIndex ]]
    -- upvalues: v19 (copy), v10 (copy)
    local l_Scale_0 = v296.props.anchorLocation.Scale;
    if not v19[v296.props.orientation] then
        l_Scale_0 = 1 - l_Scale_0;
    end;
    return v10.nearest(v296:getChildCanvasPosition(v297) + l_Scale_0 * v296:getChildSize(v297));
end;
v16.getAnchorFramePosition = function(v299) --[[ Line: 1582 ]] --[[ Name: getAnchorFramePosition ]]
    return v299:getAnchorFrameFromIndex(v299.state.anchor.index);
end;
v16.getAnchorFrameFromIndex = function(v300, v301) --[[ Line: 1586 ]] --[[ Name: getAnchorFrameFromIndex ]]
    -- upvalues: v19 (copy), v10 (copy)
    local l_Scale_1 = v300.props.anchorLocation.Scale;
    if not v19[v300.props.orientation] then
        l_Scale_1 = 1 - l_Scale_1;
    end;
    return v10.nearest(v300:getChildFramePosition(v301) + l_Scale_1 * v300:getChildSize(v301)) - v300.relativeAnchorLocation;
end;
v16.absoluteToCanvasPosition = function(v303, v304) --[[ Line: 1597 ]] --[[ Name: absoluteToCanvasPosition ]]
    local v305 = v303:getCurrent();
    local l_CanvasPosition_0 = v305.CanvasPosition;
    local l_AbsolutePosition_0 = v305.AbsolutePosition;
    return v304 + v303:measure(l_CanvasPosition_0) - v303:measure(l_AbsolutePosition_0);
end;
v16.absoluteToFramePosition = function(v308, v309) --[[ Line: 1605 ]] --[[ Name: absoluteToFramePosition ]]
    return v309 - v308:measure(v308:getCurrent().AbsolutePosition);
end;
v16.frameToCanvasPosition = function(v310, v311) --[[ Line: 1612 ]] --[[ Name: frameToCanvasPosition ]]
    return v311 + v310:measure(v310:getCurrent().CanvasPosition);
end;
v16.getChildCanvasPosition = function(v312, v313) --[[ Line: 1619 ]] --[[ Name: getChildCanvasPosition ]]
    local v314 = v312:getRbx(v313);
    return v314 and v312:absoluteToCanvasPosition(v312:measure(v314.AbsolutePosition)) or 0;
end;
v16.getChildFramePosition = function(v315, v316) --[[ Line: 1625 ]] --[[ Name: getChildFramePosition ]]
    local v317 = v315:getRbx(v316);
    return v317 and v315:absoluteToFramePosition(v315:measure(v317.AbsolutePosition)) or 0;
end;
v16.getChildSize = function(v318, v319) --[[ Line: 1631 ]] --[[ Name: getChildSize ]]
    local v320 = v318:getRbx(v319);
    return v320 and v318:measure(v320.AbsoluteSize) or 0;
end;
v16.getID = function(v321, v322) --[[ Line: 1637 ]] --[[ Name: getID ]]
    return v321.props.identifier(v321.props.itemList[v322]);
end;
v16.updateMetadata = function(v323, v324, v325, v326, v327, v328) --[[ Line: 1643 ]] --[[ Name: updateMetadata ]]
    -- upvalues: v16 (copy), v3 (copy)
    local v329 = v326[v323];
    if not v329 then
        v329 = {};
        v326[v323] = v329;
    end;
    if not v329.name then
        local v330 = v325.renderItem(v324, false);
        v329.class = tostring(v330.component or v330.type);
        v329.name = v16.getKeyPool(v329.class, v327):get();
    end;
    if not v328[v329.name] then
        v328[v329.name] = v3.createRef();
    end;
    v329.ref = v328[v329.name];
end;
v16.clearMetadata = function(v331, v332, v333) --[[ Line: 1664 ]] --[[ Name: clearMetadata ]]
    -- upvalues: v4 (copy)
    local v334 = v331[v332];
    if not v334 then
        return;
    else
        if not v4.List.find(v333.recyclingDisabledFor, v334.class) and v334.name then
            v334.name:release();
        end;
        v334.name = nil;
        v334.ref = nil;
        return;
    end;
end;
v16.getKeyPool = function(v335, v336) --[[ Line: 1684 ]] --[[ Name: getKeyPool ]]
    -- upvalues: v12 (copy)
    if not v336[v335] then
        v336[v335] = v12.new(v335);
    end;
    return v336[v335];
end;
v16.getMetadata = function(v337, v338) --[[ Line: 1692 ]] --[[ Name: getMetadata ]]
    return v337.state.metadata[v337:getID(v338)];
end;
v16.getRbx = function(v339, v340) --[[ Line: 1697 ]] --[[ Name: getRbx ]]
    local v341 = v339:getMetadata(v340);
    return v341 and v341.ref and v341.ref.current;
end;
v16.measure = function(v342, v343) --[[ Line: 1703 ]] --[[ Name: measure ]]
    -- upvalues: v18 (copy)
    return v18[v342.props.orientation] and v343.Y or v343.X;
end;
v16.getCurrent = function(v344) --[[ Line: 1708 ]] --[[ Name: getCurrent ]]
    return v344:getRef().current;
end;
v16.getRef = function(v345) --[[ Line: 1712 ]] --[[ Name: getRef ]]
    return v345.props.scrollingFrameRef or v345._ref;
end;
return v16;