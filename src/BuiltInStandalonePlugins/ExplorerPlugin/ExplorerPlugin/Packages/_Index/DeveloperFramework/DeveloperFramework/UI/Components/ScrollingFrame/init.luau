local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.Util);
local v3 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
local v4 = require(l_Parent_0.Styling.supportsStyleSheets);
local v5 = require(l_Parent_0.Styling.joinTags);
local v6 = require(l_Parent_0.Parent.Cryo);
local v7 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v7.withContext;
local v9 = require(script.Parent.Pane);
local l_prioritize_0 = v2.prioritize;
local v11 = require(l_Parent_0.Util.Typecheck);
local v12 = require(l_Parent_0.Wrappers.withForwardRef);
local v13 = if not v4 then require(script.style) else nil;
local v14 = v1.PureComponent:extend("ScrollingFrame");
v11.wrap(v14, script);
v14.init = function(v15) --[[ Line: 75 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v4 (copy), v13 (copy), v6 (copy), l_prioritize_0 (copy)
    v15.scrollingRef = v15.props.ForwardRef or v1.createRef();
    v15.layoutRef = v1.createRef();
    v15.state = {
        isRequestingNextPage = false
    };
    if v4 then
        assert(not v15.props.EnableScrollBarBackground, "[StyleSheets] ScrollingFrame does not support EnableScrollbarBackground due to design consistency");
        assert(not v15.props.Style, "[StyleSheets] ScrollingFrame does not support Style prop, use React.Tag for style props instead");
    end;
    v15.onScroll = function(v16) --[[ Line: 92 ]]
        -- upvalues: v15 (copy)
        if v15.props.OnScrollUpdate then
            v15.props.OnScrollUpdate(v16.CanvasPosition);
        end;
        v15:checkNextPage();
    end;
    if not v4 then
        v15.updateCanvasSize = function() --[[ Line: 100 ]]
            -- upvalues: v15 (copy), v13 (ref)
            local l_AutomaticCanvasSize_0 = v15.props.AutomaticCanvasSize;
            if v15.props.CanvasSize or l_AutomaticCanvasSize_0 then
                return;
            else
                if v15.scrollingRef.current and v15.layoutRef.current then
                    local l_AbsoluteContentSize_0 = v15.layoutRef.current.AbsoluteContentSize;
                    local l_X_0 = l_AbsoluteContentSize_0.X;
                    local l_Y_0 = l_AbsoluteContentSize_0.Y;
                    local v21 = v15.getPaddingProps();
                    l_X_0 = l_X_0 + v21.PaddingLeft.Offset + v21.PaddingRight.Offset;
                    l_Y_0 = l_Y_0 + v21.PaddingTop.Offset + v21.PaddingBottom.Offset;
                    if not l_AutomaticCanvasSize_0 then
                        local l_props_0 = v15.props;
                        local v23 = l_props_0.Stylizer or v13;
                        local v24 = v15.getScrollingFrameProps(l_props_0, v23);
                        if v24.ScrollingDirection == Enum.ScrollingDirection.Y then
                            l_X_0 = 0;
                        elseif v24.ScrollingDirection == Enum.ScrollingDirection.X then
                            l_Y_0 = 0;
                        end;
                    end;
                    v15.scrollingRef.current.CanvasSize = UDim2.new(0, l_X_0, 0, l_Y_0);
                    if v15.props.OnCanvasResize then
                        v15.props.OnCanvasResize(Vector2.new(l_X_0, l_Y_0));
                    end;
                end;
                return;
            end;
        end;
    end;
    v15.propFilters = {
        parentContainerProps = {
            Position = v6.None, 
            Size = v6.None, 
            Layout = v6.None, 
            LayoutOrder = v6.None, 
            AutoSizeCanvas = v6.None, 
            AutoSizeLayoutElement = v6.None, 
            AutoSizeLayoutOptions = v6.None, 
            OnCanvasResize = v6.None, 
            OnScrollUpdate = v6.None, 
            NextPageFunc = v6.None, 
            NextPageRequestDistance = v6.None, 
            Theme = if v4 then nil else v6.None, 
            Style = if v4 then nil else v6.None, 
            Stylizer = if v4 then nil else v6.None, 
            ScrollBarBackgroundColor = v6.None, 
            EnableScrollBarBackground = if v4 then nil else v6.None, 
            Padding = v6.None, 
            HorizontalAlignment = v6.None, 
            ScrollingFrameSize = v6.None
        }
    };
    v15.getScrollingFrameProps = function(v25, v26) --[[ Line: 163 ]]
        -- upvalues: v6 (ref), v4 (ref), v15 (copy), v1 (ref)
        local v27 = 1;
        local v28 = 1;
        local l_AutomaticSize_0 = v25.AutomaticSize;
        if l_AutomaticSize_0 then
            if l_AutomaticSize_0 == Enum.AutomaticSize.X or l_AutomaticSize_0 == Enum.AutomaticSize.XY then
                v27 = 0;
            end;
            if l_AutomaticSize_0 == Enum.AutomaticSize.Y or l_AutomaticSize_0 == Enum.AutomaticSize.XY then
                v28 = 0;
            end;
        end;
        local l_ScrollingFrameSize_0 = v25.ScrollingFrameSize;
        return v6.Dictionary.join(if v4 then {} else v26, v25, v15.propFilters.parentContainerProps, {
            AutomaticCanvasSize = if not v4 or v25.CanvasSize then v25.AutomaticCanvasSize else Enum.AutomaticSize.XY, 
            Size = if l_ScrollingFrameSize_0 ~= nil then l_ScrollingFrameSize_0 else UDim2.fromScale(v27, v28), 
            ForwardRef = v6.None, 
            [v1.Children] = v6.None, 
            [v1.Change.CanvasPosition] = v15.onScroll, 
            [v1.Change.AbsoluteSize] = if v4 then nil else v15.updateCanvasSize, 
            [v1.Ref] = v15.scrollingRef, 
            Spacing = v6.None
        });
    end;
    if not v4 then
        v15.getPaddingProps = function() --[[ Line: 199 ]]
            -- upvalues: v15 (copy), v13 (ref), l_prioritize_0 (ref)
            local l_props_1 = v15.props;
            local v32 = l_props_1.Stylizer or v13;
            local v33 = l_prioritize_0(l_props_1.Padding, v32.Padding, 0);
            local v34 = type(v33) == "number";
            return {
                PaddingTop = UDim.new(0, v34 and v33 or v33.Top or 0), 
                PaddingBottom = UDim.new(0, v34 and v33 or v33.Bottom or 0), 
                PaddingLeft = UDim.new(0, v34 and v33 or v33.Left or 0), 
                PaddingRight = UDim.new(0, v34 and v33 or v33.Right or 0)
            };
        end;
    end;
end;
if not v4 then
    v14.didMount = function(v35) --[[ Line: 216 ]] --[[ Name: didMount ]]
        v35.updateCanvasSize();
    end;
end;
v14.checkNextPage = function(v36) --[[ Line: 221 ]] --[[ Name: checkNextPage ]]
    if v36.state.isRequestingNextPage or not v36.props.NextPageFunc then
        return;
    else
        local l_current_0 = v36.scrollingRef.current;
        if not l_current_0 then
            return;
        else
            local v38 = v36.props.NextPageRequestDistance or 100;
            local l_Y_1 = l_current_0.AbsoluteSize.Y;
            local l_Y_2 = l_current_0.AbsoluteCanvasSize.Y;
            if l_current_0.CanvasPosition.Y + l_Y_1 > l_Y_2 - v38 then
                v36:setState({
                    isRequestingNextPage = true
                });
                v36.props.NextPageFunc();
            end;
            return;
        end;
    end;
end;
v14.didUpdate = function(v41, v42) --[[ Line: 242 ]] --[[ Name: didUpdate ]]
    -- upvalues: v1 (copy)
    if v41.state.isRequestingNextPage then
        local v43 = 0;
        local v44 = 0;
        for _ in pairs(v42[v1.Children]) do
            v43 = v43 + 1;
        end;
        for _ in pairs(v41.props[v1.Children]) do
            v44 = v44 + 1;
        end;
        if v43 < v44 then
            v41:setState({
                isRequestingNextPage = false
            });
            v41:checkNextPage();
        end;
    end;
end;
v14.render = function(v47) --[[ Line: 262 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v5 (copy), v3 (copy), v1 (copy), l_prioritize_0 (copy), v6 (copy), v9 (copy)
    local l_props_2 = v47.props;
    local v49 = if v4 then nil else l_props_2.Stylizer;
    local v50 = if v4 then v5("Component-ScrollingFrame", l_props_2[v3.Tag]) else nil;
    local v51 = if v4 then nil else l_props_2.EnableScrollBarBackground;
    local l_Position_0 = l_props_2.Position;
    local l_Size_0 = l_props_2.Size;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local v55 = v47.props[v1.Children];
    local v56 = v47.getScrollingFrameProps(v47.props, v49);
    local l_AutomaticCanvasSize_1 = l_props_2.AutomaticCanvasSize;
    local v58 = if v4 then nil else l_prioritize_0(l_props_2.ScrollBarThickness, v49.ScrollBarThickness);
    if not v4 then
        local v59 = l_prioritize_0(l_props_2.AutoSizeCanvas, v49.AutoSizeCanvas, false);
        local v60 = l_prioritize_0(l_props_2.AutoSizeLayoutElement, v49.AutoSizeLayoutElement, "UIListLayout");
        local v61 = l_prioritize_0(l_props_2.AutoSizeLayoutOptions, v49.AutoSizeLayoutOptions, {});
        if l_AutomaticCanvasSize_1 then
            v59 = false;
            if not l_props_2.CanvasSize then
                v56.CanvasSize = UDim2.new();
            end;
        end;
        local v62 = v47.getPaddingProps();
        local v63 = l_props_2.Spacing or UDim.new(0, 0);
        v55 = if v59 then {
            Layout = v1.createElement(v60, v6.Dictionary.join(v61, {
                [v1.Change.AbsoluteContentSize] = v47.updateCanvasSize, 
                [v1.Ref] = v47.layoutRef
            })), 
            Padding = v1.createElement("UIPadding", v62), 
            Children = v1.createFragment(v55)
        } else if l_props_2.Layout then {
            Layout = v1.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = l_props_2.Layout, 
                Padding = v63, 
                [v1.Change.AbsoluteContentSize] = v47.updateCanvasSize, 
                [v1.Ref] = v47.layoutRef, 
                HorizontalAlignment = l_props_2.HorizontalAlignment
            }), 
            Padding = v1.createElement("UIPadding", v62), 
            Children = v1.createFragment(v55)
        } else {
            Padding = v1.createElement("UIPadding", v62), 
            Children = v1.createFragment(v55)
        };
    end;
    local v64 = {
        AutomaticSize = l_props_2.AutomaticSize, 
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0
    };
    if v50 then
        v64[v3.Tag] = v50;
    end;
    return v1.createElement(v9, v64, {
        ScrollBarBackground = v51 and v1.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            Position = UDim2.new(1, 0, 0, 0), 
            Size = UDim2.new(0, v58, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = v49.ScrollBarBackgroundColor, 
            ZIndex = 0
        }), 
        Scroller = v1.createElement("ScrollingFrame", v56, v55)
    });
end;
if not v4 then
    v14 = l_withContext_0({
        Stylizer = v7.Stylizer
    })(v14);
end;
return v12(v14);