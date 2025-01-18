local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v1.withContext;
local v3 = require(l_Parent_0.Parent.Roact);
local v4 = require(l_Parent_0.Util.Typecheck);
local v5 = require(l_Parent_0.UI.Components.Pane);
local v6 = require(l_Parent_0.UI.Components.IconButton);
local v7 = v3.PureComponent:extend("PaginationDots");
v4.wrap(v7, script);
v7.init = function(v8) --[[ Line: 40 ]] --[[ Name: init ]]
    v8.onPrevious = function() --[[ Line: 41 ]]
        -- upvalues: v8 (copy)
        v8.props.OnSelected(v8.props.SelectedIndex - 1);
    end;
    v8.onNext = function() --[[ Line: 44 ]]
        -- upvalues: v8 (copy)
        v8.props.OnSelected(v8.props.SelectedIndex + 1);
    end;
end;
v7.render = function(v9) --[[ Line: 49 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), v6 (copy), v5 (copy)
    local l_props_0 = v9.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v12 = {};
    for v13 = 1, l_props_0.Count do
        v12["Dot-" .. v13] = v3.createElement(v6, {
            Cursor = "PointingHand", 
            LayoutOrder = v13, 
            LeftIcon = {
                Style = {
                    Background = if v13 == l_props_0.SelectedIndex then l_Stylizer_0.SelectedColor else l_Stylizer_0.DotColor, 
                    Image = l_Stylizer_0.DotImage
                }, 
                Size = l_Stylizer_0.DotSize
            }, 
            OnClick = function() --[[ Line: 65 ]] --[[ Name: OnClick ]]
                -- upvalues: v9 (copy), v13 (copy)
                v9.props.OnSelected(v13);
            end, 
            Size = l_Stylizer_0.DotSize, 
            Style = "IconOnly"
        });
    end;
    return v3.createElement(v5, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = UDim2.fromScale(1, 0)
    }, {
        Previous = if l_props_0.ShowArrows then v3.createElement(v6, {
            Cursor = "PointingHand", 
            LayoutOrder = 1, 
            LeftIcon = {
                Style = {
                    Background = l_Stylizer_0.ArrowColor, 
                    Image = l_Stylizer_0.ArrowImage
                }, 
                Rotation = 180, 
                Size = l_Stylizer_0.ArrowSize
            }, 
            OnClick = v9.onPrevious, 
            Size = l_Stylizer_0.ArrowSize, 
            Style = "IconOnly"
        }) else nil, 
        Dots = v3.createElement(v5, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, -l_Stylizer_0.DotsInset, 0, 0), 
            Spacing = 5
        }, v12), 
        Next = if l_props_0.ShowArrows then v3.createElement(v6, {
            Cursor = "PointingHand", 
            LayoutOrder = 3, 
            LeftIcon = {
                Style = {
                    Background = l_Stylizer_0.ArrowColor, 
                    Image = l_Stylizer_0.ArrowImage
                }, 
                Size = l_Stylizer_0.ArrowSize
            }, 
            OnClick = v9.onNext, 
            Size = l_Stylizer_0.ArrowSize, 
            Style = "IconOnly"
        }) else nil
    });
end;
return (l_withContext_0({
    Stylizer = v1.Stylizer
})(v7));