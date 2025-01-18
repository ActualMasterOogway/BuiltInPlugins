local l_TextService_0 = game:GetService("TextService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.FitFrame);
local l_FitFrameOnAxis_0 = v2.FitFrameOnAxis;
local l_FitFrameVertical_0 = v2.FitFrameVertical;
local v5 = require(l_Parent_0.Packages.Roact);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextLabel_0 = v6.UI.TextLabel;
local v10 = v5.PureComponent:extend("LabeledElementListItem");
v10.defaultProps = {
    ContentFillDirection = Enum.FillDirection.Vertical, 
    ContentPadding = UDim.new(0, 0), 
    LabelColumnWidth = UDim.new(0, 100), 
    LayoutOrder = 1, 
    Padding = UDim.new(0, 0), 
    Text = "Label", 
    TextXAlignment = Enum.TextXAlignment.Left, 
    TextYAlignment = Enum.TextYAlignment.Top, 
    OnSizeChanged = function() --[[ Line: 47 ]] --[[ Name: OnSizeChanged ]]

    end
};
v10.init = function(v11) --[[ Line: 50 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v11.contentFrameRef = v5.createRef();
    v11.onContentSizeChanged = function() --[[ Line: 53 ]]
        -- upvalues: v11 (copy)
        local l_props_0 = v11.props;
        if not l_props_0.IsCollapsed and l_props_0.OnSizeChanged then
            local v13 = l_props_0.Id or l_props_0.Text or "";
            local l_current_0 = v11.contentFrameRef.current;
            l_props_0.OnSizeChanged(v13, l_current_0.Size);
        end;
    end;
end;
v10.render = function(v15) --[[ Line: 63 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_FitFrameOnAxis_0 (copy), l_TextLabel_0 (copy)
    local l_props_1 = v15.props;
    local v17 = nil;
    local v18 = nil;
    if l_props_1.IsCollapsed then
        v17 = Enum.FillDirection.Vertical;
        v18 = UDim.new(1, 0);
    else
        v17 = Enum.FillDirection.Horizontal;
        v18 = l_props_1.LabelColumnWidth;
    end;
    local v19 = UDim2.new(v18, UDim.new(0, 22));
    return v5.createElement(l_FitFrameOnAxis_0, {
        axis = l_FitFrameOnAxis_0.Axis.Vertical, 
        contentPadding = l_props_1.Padding, 
        minimumSize = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        FillDirection = v17, 
        LayoutOrder = l_props_1.LayoutOrder
    }, {
        Label = v5.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = v19, 
            Text = l_props_1.Text, 
            TextXAlignment = l_props_1.TextXAlignment, 
            TextYAlignment = l_props_1.TextYAlignment
        }), 
        Content = v5.createElement(l_FitFrameOnAxis_0, {
            axis = l_FitFrameOnAxis_0.Axis.Both, 
            contentPadding = l_props_1.ContentPadding, 
            BackgroundTransparency = 1, 
            FillDirection = l_props_1.ContentFillDirection, 
            LayoutOrder = 2, 
            [v5.Change.Size] = v15.onContentSizeChanged, 
            [v5.Ref] = v15.contentFrameRef
        }, v15.props[v5.Children])
    });
end;
local v20 = v5.PureComponent:extend("LabeledElementList");
v20.defaultProps = {
    Collapsible = false, 
    Items = {}, 
    MaximumLabelWidth = 1e999, 
    LayoutOrder = 1
};
v20.init = function(v21) --[[ Line: 116 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy)
    v21._frameRef = v5.createRef();
    v21._contentSizeMap = {};
    v21._contentColumnWidth = 0;
    v21._maximumContentWidth = 0;
    v21._labelColumnWidth = 0;
    local function _() --[[ Line: 123 ]] --[[ Name: updateCollapsedState ]]
        -- upvalues: v21 (copy)
        local v22 = v21._contentColumnWidth < v21._maximumContentWidth;
        v21:setState(function() --[[ Line: 125 ]]
            -- upvalues: v22 (copy), v21 (ref)
            if v22 ~= v21.state.isCollapsed then
                return {
                    isCollapsed = v22
                };
            else
                return nil;
            end;
        end);
    end;
    v21.onSizeChanged = function() --[[ Line: 135 ]]
        -- upvalues: v21 (copy)
        local l_LabeledElementList_0 = v21.props.Stylizer.LabeledElementList;
        local l_current_1 = v21._frameRef.current;
        local l_Offset_0 = l_LabeledElementList_0.ItemPaddingHorizontal.Offset;
        v21._contentColumnWidth = l_current_1.AbsoluteSize.X - v21._labelColumnWidth - l_Offset_0;
        local v27 = v21._contentColumnWidth < v21._maximumContentWidth;
        v21:setState(function() --[[ Line: 125 ]]
            -- upvalues: v27 (copy), v21 (ref)
            if v27 ~= v21.state.isCollapsed then
                return {
                    isCollapsed = v27
                };
            else
                return nil;
            end;
        end);
    end;
    v21.onSectionSizeChanged = function(v28, v29) --[[ Line: 147 ]]
        -- upvalues: v21 (copy)
        v21._contentSizeMap[v28] = v29;
        v21._maximumContentWidth = 0;
        for _, v31 in pairs(v21._contentSizeMap) do
            local l_Offset_1 = v31.X.Offset;
            v21._maximumContentWidth = math.max(v21._maximumContentWidth, l_Offset_1);
        end;
        local v33 = v21._contentColumnWidth < v21._maximumContentWidth;
        v21:setState(function() --[[ Line: 125 ]]
            -- upvalues: v33 (copy), v21 (ref)
            if v33 ~= v21.state.isCollapsed then
                return {
                    isCollapsed = v33
                };
            else
                return nil;
            end;
        end);
    end;
    v21:setState({
        isCollapsed = false
    });
end;
v20.render = function(v34) --[[ Line: 164 ]] --[[ Name: render ]]
    -- upvalues: l_TextService_0 (copy), v5 (copy), v10 (copy), l_FitFrameVertical_0 (copy)
    local l_props_2 = v34.props;
    local l_state_0 = v34.state;
    local l_Items_0 = l_props_2.Items;
    local l_LabeledElementList_1 = l_props_2.Stylizer.LabeledElementList;
    v34._labelColumnWidth = 0;
    for _, v40 in ipairs(l_Items_0) do
        v34._labelColumnWidth = math.max(l_TextService_0:GetTextSize(v40.Text, l_LabeledElementList_1.TextSize, l_LabeledElementList_1.Font, Vector2.new(l_props_2.MaximumLabelWidth, 10000)).X, v34._labelColumnWidth);
    end;
    local v41 = l_state_0.isCollapsed and l_LabeledElementList_1.ItemPaddingVertical or l_LabeledElementList_1.ItemPaddingHorizontal;
    local v42 = {};
    for v43, v44 in ipairs(l_Items_0) do
        v42["Item" .. tostring(v43)] = v5.createElement(v10, {
            IsCollapsed = l_state_0.isCollapsed, 
            ContentFillDirection = v44.ContentFillDirection, 
            ContentPadding = l_LabeledElementList_1.ItemContentPadding, 
            LabelColumnWidth = UDim.new(0, v34._labelColumnWidth), 
            LayoutOrder = v43, 
            Padding = v41, 
            Text = v44.Text, 
            TextXAlignment = v44.TextXAlignment, 
            TextYAlignment = v44.TextYAlignment, 
            OnSizeChanged = v34.onSectionSizeChanged
        }, {
            Content = v44.Content
        });
    end;
    return v5.createElement(l_FitFrameVertical_0, {
        contentPadding = l_LabeledElementList_1.SectionPadding, 
        width = UDim.new(1, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_2.LayoutOrder, 
        [v5.Change.AbsoluteSize] = v34.onSizeChanged, 
        [v5.Ref] = v34._frameRef
    }, v42);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v20));