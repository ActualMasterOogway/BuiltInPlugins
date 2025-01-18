local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local v6 = require(l_script_FirstAncestor_0.Core.ContextServices.NavigationContext);
local v7 = require(l_script_FirstAncestor_0.Core.Components.StyledScrollingFrame);
local v8 = require(l_script_FirstAncestor_0.Core.Components.NoSceneSuggestions);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LoadingIndicator_0 = v3.UI.LoadingIndicator;
local l_Pane_0 = v3.UI.Pane;
local v13 = v2.PureComponent:extend("LoadScroller");
v13.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0)
};
v13.init = function(v14, v15) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy), v5 (copy)
    v14.state = {
        initialLoading = v15.Loading
    };
    v14.scrollingFrameRef = v2.createRef();
    v14.calculateRenderBounds = function(_) --[[ Line: 54 ]]
        -- upvalues: v14 (copy)
        v14:setState(function(_) --[[ Line: 55 ]]

        end);
    end;
    v14.checkForNextPage = function() --[[ Line: 58 ]]
        -- upvalues: v14 (copy), v5 (ref)
        local l_props_0 = v14.props;
        local l_current_0 = v14.scrollingFrameRef.current;
        if not l_current_0 or l_props_0.Loading or l_props_0.Total and l_props_0.Total == #l_props_0.Items then
            return;
        else
            local l_Y_0 = l_current_0.CanvasPosition.Y;
            local l_Y_1 = l_current_0.AbsoluteWindowSize.Y;
            if l_current_0.CanvasSize.Y.Offset - (l_Y_0 + l_Y_1) < v5.DIST_FROM_BOTTOM_BEFORE_NEXT_PAGE and l_props_0.FetchNextPage then
                l_props_0.FetchNextPage(l_props_0.PageSize);
            end;
            return;
        end;
    end;
end;
v13.didMount = function(v22) --[[ Line: 79 ]] --[[ Name: didMount ]]
    v22.checkForNextPage();
end;
v13.didUpdate = function(v23, v24) --[[ Line: 83 ]] --[[ Name: didUpdate ]]
    local l_props_1 = v23.props;
    v23.checkForNextPage();
    if not l_props_1.Loading and v24.Loading then
        v23:setState({
            initialLoading = false
        });
    end;
end;
v13.render = function(v26) --[[ Line: 92 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), l_LoadingIndicator_0 (copy), v5 (copy), v8 (copy), v7 (copy), l_Pane_0 (copy)
    local l_props_2 = v26.props;
    local l_initialLoading_0 = v26.state.initialLoading;
    local l_Items_0 = l_props_2.Items;
    local l_CalculateCanvasHeight_0 = l_props_2.CalculateCanvasHeight;
    local l_Loading_0 = l_props_2.Loading;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Position_0 = l_props_2.Position;
    local l_RenderTopContent_0 = l_props_2.RenderTopContent;
    local l_RenderContent_0 = l_props_2.RenderContent;
    local l_Size_0 = l_props_2.Size;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Navigation_0 = l_props_2.Navigation;
    local v39 = l_CalculateCanvasHeight_0();
    if l_initialLoading_0 then
        return v2.createElement("Frame", {
            BackgroundColor3 = l_Stylizer_0.backgroundColor, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            LoadingIndicator = v2.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
        });
    else
        local v40 = nil;
        if l_RenderTopContent_0 then
            v40 = l_RenderTopContent_0();
        end;
        local v41 = nil;
        v41 = if not (not (l_Navigation_0:getCurrentPath() == v5.CONTEXTUAL_RECOMMENDATIONS_HOME_CONFIG_SECTION_NAME) or l_props_2.Loading) and #l_props_2.Items == 0 then v2.createElement(v8, {
            LayoutOrder = 2
        }) else l_RenderContent_0(l_Items_0);
        return v2.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = l_Size_0, 
            LayoutOrder = l_LayoutOrder_0, 
            Position = l_Position_0, 
            [v2.Change.AbsoluteSize] = v26.checkForNextPage
        }, {
            StyledScrollingFrame = v2.createElement(v7, {
                CanvasSize = UDim2.new(1, 0, 0, v39), 
                Size = UDim2.new(1, 0, 1, 0), 
                onScroll = v26.checkForNextPage, 
                [v2.Ref] = v26.scrollingFrameRef, 
                [v2.Change.AbsoluteSize] = v26.checkForNextPage
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, v5.LOAD_SCROLL_PADDING), 
                    PaddingRight = UDim.new(0, v5.LOAD_SCROLL_PADDING + v5.SCROLLBAR_BACKGROUND_THICKNESS), 
                    PaddingTop = UDim.new(0, v5.LOAD_SCROLL_PADDING), 
                    PaddingBottom = UDim.new(0, v5.LOAD_SCROLL_PADDING)
                }), 
                Layout = v2.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                TopContent = v40, 
                Content = v41, 
                LoadingIndicator = l_Loading_0 and v2.createElement(l_Pane_0, {
                    LayoutOrder = 3, 
                    Size = UDim2.fromScale(1, 1), 
                    Layout = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center
                }, {
                    Wrapper = v2.createElement("Frame", {
                        Size = UDim2.new(0, 60, 1, 0), 
                        BackgroundTransparency = 1
                    }, {
                        LoadingIndicator = v2.createElement(l_LoadingIndicator_0)
                    })
                })
            })
        });
    end;
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Navigation = v6
})(v13));