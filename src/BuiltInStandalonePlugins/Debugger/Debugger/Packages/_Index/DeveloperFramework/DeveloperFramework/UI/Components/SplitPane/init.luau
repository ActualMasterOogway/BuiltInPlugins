local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local _ = require(l_Parent_0.Types);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Parent.Roact);
local v5 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v6 = require(l_Parent_0.Styling.supportsStyleSheets);
local v7 = require(l_Parent_0.Styling.joinTags);
local l_RunService_0 = game:GetService("RunService");
local v9 = require(l_Parent_0.Parent.Dash);
local l_filter_0 = v9.filter;
local l_forEach_0 = v9.forEach;
local l_reduce_0 = v9.reduce;
local v13 = require(l_Parent_0.UI.Components.DragBar);
local v14 = require(l_Parent_0.UI.Components.Pane);
local v15 = require(script.getNextSizes);
local v16 = v4.PureComponent:extend("SplitPane");
v16.init = function(v17) --[[ Line: 77 ]] --[[ Name: init ]]
    -- upvalues: v4 (copy), l_reduce_0 (copy), v15 (copy), l_filter_0 (copy), l_forEach_0 (copy), l_RunService_0 (copy)
    v17.prevOffset = 0;
    v17.ref = v4.createRef();
    v17.scrollingFrames = {};
    v17.onMove = function() --[[ Line: 82 ]]
        -- upvalues: v17 (copy), l_reduce_0 (ref), v15 (ref)
        local l_props_0 = v17.props;
        if not v17.pluginGui or not v17.pluginGui:IsA("PluginGui") or not v17.currentDragIndex or not v17.ref.current then
            return;
        else
            local l_RelativeMousePosition_0 = v17.pluginGui:GetRelativeMousePosition();
            local l_X_0 = l_RelativeMousePosition_0.X;
            local l_Y_0 = l_RelativeMousePosition_0.Y;
            local l_AbsolutePosition_0 = v17.ref.current.AbsolutePosition;
            local l_AbsoluteSize_0 = v17.ref.current.AbsoluteSize;
            local v24 = l_props_0.Layout == Enum.FillDirection.Vertical;
            local v25 = if v24 then l_Y_0 - l_AbsolutePosition_0.Y else l_X_0 - l_AbsolutePosition_0.X;
            local v26 = if v24 then l_AbsoluteSize_0.Y else l_AbsoluteSize_0.X;
            local v27 = v17.prevOffset <= v25;
            local l_currentDragIndex_0 = v17.currentDragIndex;
            v17.prevOffset = v25;
            local v31 = l_reduce_0(l_props_0.Sizes, function(v29, v30) --[[ Line: 108 ]]
                return v29 + v30;
            end, UDim.new());
            local v32 = v31.Scale * v26 + v31.Offset;
            if not v27 then
                v25 = v32 - v25;
                l_currentDragIndex_0 = l_currentDragIndex_0 + 1;
            end;
            local v33 = v15(v17.props, v25, v32, v27, l_currentDragIndex_0);
            l_props_0.OnSizesChange(v33);
            return;
        end;
    end;
    v17.onStartDrag = function(v34) --[[ Line: 123 ]]
        -- upvalues: v17 (copy), l_filter_0 (ref), l_forEach_0 (ref), l_RunService_0 (ref)
        local l_OnResizeStart_0 = v17.props.OnResizeStart;
        if l_OnResizeStart_0 then
            l_OnResizeStart_0(v34.Index);
        end;
        v17.currentDragIndex = v34.Index;
        v17.scrollingFrames = l_filter_0(v17.ref.current:GetDescendants(), function(v36) --[[ Line: 130 ]]
            return v36.ClassName == "ScrollingFrame";
        end);
        l_forEach_0(v17.scrollingFrames, function(v37) --[[ Line: 133 ]]
            v37.ScrollingEnabled = false;
        end);
        v17._heartbeat = l_RunService_0.Heartbeat:Connect(function() --[[ Line: 136 ]]
            -- upvalues: v17 (ref)
            v17:onMove();
        end);
    end;
    v17.onEndDrag = function() --[[ Line: 140 ]]
        -- upvalues: v17 (copy), l_forEach_0 (ref)
        local l_OnResizeEnd_0 = v17.props.OnResizeEnd;
        if l_OnResizeEnd_0 and v17.currentDragIndex then
            l_OnResizeEnd_0(v17.currentDragIndex);
        end;
        v17.currentDragIndex = nil;
        if v17.scrollingFrames then
            l_forEach_0(v17.scrollingFrames, function(v39) --[[ Line: 147 ]]
                v39.ScrollingEnabled = true;
            end);
        end;
        if v17._heartbeat then
            v17._heartbeat:Disconnect();
        end;
    end;
end;
v16.willUnmount = function(v40) --[[ Line: 157 ]] --[[ Name: willUnmount ]]
    if v40._heartbeat then
        v40._heartbeat:Disconnect();
    end;
end;
v16.render = function(v41) --[[ Line: 163 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v13 (copy), v14 (copy), v6 (copy), v5 (copy), v7 (copy)
    local l_props_1 = v41.props;
    local v43 = l_props_1[v4.Children];
    local v44 = l_props_1.Layout == Enum.FillDirection.Vertical;
    local v45 = {};
    local v46 = #l_props_1.Sizes;
    local v47 = v44 and Enum.FillDirection.Horizontal or Enum.FillDirection.Vertical;
    v41.pluginGui = v41.props.Focus:get();
    local l_HideBars_0 = l_props_1.HideBars;
    local v49 = UDim.new(0, 0);
    for v50 = 1, v46 do
        local v51 = l_props_1.Sizes[v50];
        local l_Offset_0 = v51.Offset;
        if v50 > 1 then
            local l_Offset_1 = v49.Offset;
            if l_HideBars_0 then
                l_Offset_1 = l_Offset_1 - 3;
            else
                l_Offset_0 = l_Offset_0 - 6;
                v49 = v49 + UDim.new(0, 6);
            end;
            v45["Drag " .. v50 - 1] = v4.createElement(v13, {
                Index = v50 - 1, 
                Hide = l_HideBars_0, 
                FillDirection = v47, 
                BarStyle = l_props_1.BarStyle, 
                Position = if v44 then UDim2.new(0, 0, v49.Scale, l_Offset_1) else UDim2.new(v49.Scale, l_Offset_1, 0, 0), 
                ZIndex = 10, 
                OnPress = v41.onStartDrag, 
                OnPressEnd = v41.onEndDrag, 
                OnDoubleClick = v41.props.ExpandColumnOnDoubleClick and function() --[[ Line: 200 ]]
                    -- upvalues: v41 (copy), v50 (copy)
                    v41.props.ExpandColumnOnDoubleClick(v50 - 1, v41.ref.current.AbsoluteSize.X);
                end or nil
            });
        end;
        local v54 = {
            Size = v44 and UDim2.new(1, 0, v51.Scale, l_Offset_0) or UDim2.new(v51.Scale, l_Offset_0, 1, 0), 
            Position = if v44 then UDim2.new(0, 0, v49.Scale, v49.Offset) else UDim2.new(v49.Scale, v49.Offset, 0, 0), 
            LayoutOrder = v50 * 2 + 1
        };
        v45["Pane " .. v50] = v4.createElement(v14, v54, {
            Child = v43 and v43[v50] or nil
        });
        if l_props_1.UseScale then
            v49 = v49 + UDim.new(v51.Scale, 0);
        else
            v49 = v49 + UDim.new(0, l_Offset_0);
        end;
    end;
    local v55 = if l_props_1.PaneStyle == "Default" then nil else l_props_1.PaneStyle or "Box";
    return v4.createElement(v14, if v6 then {
        AutomaticSize = l_props_1.AutomaticSize, 
        LayoutOrder = l_props_1.LayoutOrder, 
        Position = l_props_1.Position, 
        Size = l_props_1.Size, 
        [v4.Ref] = v41.ref, 
        [v5.Tag] = v7("Component-SplitPane", l_props_1.PaneStyle, l_props_1[v5.Tag])
    } else {
        AutomaticSize = l_props_1.AutomaticSize, 
        LayoutOrder = l_props_1.LayoutOrder, 
        Style = v55, 
        Size = l_props_1.Size, 
        Position = l_props_1.Position, 
        [v4.Ref] = v41.ref
    }, v45);
end;
return (l_withContext_0({
    Focus = v2.Focus, 
    Mouse = v2.Mouse, 
    Stylizer = if v6 then nil else v2.Stylizer
})(v16));