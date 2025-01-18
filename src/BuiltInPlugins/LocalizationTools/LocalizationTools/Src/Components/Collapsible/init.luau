local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local v9 = v1.PureComponent:extend("Collapsible");
v9.init = function(v10) --[[ Line: 19 ]] --[[ Name: init ]]
    v10.state = {
        open = false
    };
    v10.onActivated = function() --[[ Line: 24 ]]
        -- upvalues: v10 (copy)
        if not v10.props.Active then
            return;
        else
            v10:setState(function(v11) --[[ Line: 31 ]]
                return {
                    open = not v11.open
                };
            end);
            return;
        end;
    end;
end;
v9.render = function(v12) --[[ Line: 39 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_TextLabel_0 (copy), l_StyleModifier_0 (copy), l_Pane_0 (copy)
    local l_props_0 = v12.props;
    local l_open_0 = v12.state.open;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Title_0 = l_props_0.Title;
    local l_RenderContent_0 = l_props_0.RenderContent;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Active_0 = l_props_0.Active;
    local v20 = v1.createElement("TextButton", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, l_Stylizer_0.TopBarHeight), 
        Text = "", 
        [v1.Event.Activated] = v12.onActivated
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        IconFrame = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(0, l_Stylizer_0.TopBarHeight, 1, 0)
        }, {
            Icon = v1.createElement("ImageLabel", {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                BackgroundTransparency = 1, 
                ImageColor3 = l_Stylizer_0.IconColor, 
                Image = l_open_0 and l_Stylizer_0.IconImageOpen or l_Stylizer_0.IconImageClosed, 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                Size = UDim2.new(0, l_Stylizer_0.IconSize, 0, l_Stylizer_0.IconSize)
            })
        }), 
        Title = v1.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 2, 
            Text = l_Title_0, 
            StyleModifier = if l_Active_0 then nil else l_StyleModifier_0.Disabled
        })
    });
    local v21 = l_open_0 and l_RenderContent_0() or nil;
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        TopBar = v20, 
        Content = v21
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));