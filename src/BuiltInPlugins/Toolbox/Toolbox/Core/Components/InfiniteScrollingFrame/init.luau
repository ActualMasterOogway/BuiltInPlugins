local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Parent_0.Core.Components.StyledScrollingFrame);
local v5 = v2.PureComponent:extend("InfiniteScrollingFrame");
v5.init = function(v6, _) --[[ Line: 36 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v6.state = {
        currentPage = 1
    };
    v6.scrollingFrameRef = v2.createRef();
    v6.checkCanvasAndRequest = function(v8) --[[ Line: 43 ]]
        local l_current_0 = v8.scrollingFrameRef.current;
        if not l_current_0 then
            return;
        else
            local l_Y_0 = l_current_0.CanvasPosition.Y;
            local l_Y_1 = l_current_0.AbsoluteWindowSize.Y;
            if l_current_0.CanvasSize.Y.Offset - (l_Y_0 + l_Y_1) <= 0 then
                v8.requestNextPage();
            end;
            return;
        end;
    end;
    v6.onScroll = function() --[[ Line: 61 ]]
        -- upvalues: v6 (copy)
        v6.checkCanvasAndRequest(v6);
    end;
    v6.requestNextPage = function() --[[ Line: 65 ]]
        -- upvalues: v6 (copy)
        if v6.props.nextPageFunc then
            v6.props.nextPageFunc(v6.state.currentPage + 1);
        end;
    end;
end;
v5.getDerivedStateFromProps = function(v12, _) --[[ Line: 72 ]] --[[ Name: getDerivedStateFromProps ]]
    return {
        currentPage = v12.currentPage
    };
end;
v5.didMount = function(v14) --[[ Line: 78 ]] --[[ Name: didMount ]]
    v14:checkCanvasAndRequest();
end;
v5.didUpdate = function(v15, _, _) --[[ Line: 82 ]] --[[ Name: didUpdate ]]
    v15:checkCanvasAndRequest();
end;
v5.render = function(v18) --[[ Line: 86 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v4 (copy)
    local l_props_0 = v18.props;
    local _ = v18.state;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_current_1 = l_props_0.layouterRef.current;
    local v25 = 900;
    if l_current_1 then
        v25 = l_current_1.AbsoluteContentSize.Y;
    end;
    return v2.createElement(v4, {
        Position = l_Position_0, 
        Size = l_Size_0, 
        CanvasSize = UDim2.new(1, 0, 0, v25), 
        ZIndex = 1, 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        scrollingEnabled = true, 
        [v2.Ref] = v18.scrollingFrameRef, 
        onScroll = v18.onScroll, 
        LayoutOrder = l_LayoutOrder_0
    }, l_props_0[v2.Children]);
end;
return v3.connect(function(v26, _) --[[ Line: 118 ]] --[[ Name: mapStateToProps ]]
    return {
        currentPage = (v26 or {}).currentPage or 1
    };
end, nil)(v5);