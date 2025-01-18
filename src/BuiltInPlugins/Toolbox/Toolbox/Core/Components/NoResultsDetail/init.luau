local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Cryo);
local l_t_0 = require(l_Packages_0.Framework).Util.Typecheck.t;
local v5 = require(l_Parent_0.Core.Util.Constants);
local l_TextWithInlineLink_0 = require(l_Packages_0.Framework).UI.TextWithInlineLink;
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = v2.PureComponent:extend("NoResultsDetail");
v9.init = function(v10) --[[ Line: 20 ]] --[[ Name: init ]]
    v10.state = {
        maxChildWidth = 0
    };
    v10.updateSize = function(v11) --[[ Line: 25 ]]
        -- upvalues: v10 (copy)
        local l_X_0 = v11.AbsoluteSize.X;
        v10:setState({
            maxChildWidth = l_X_0
        });
    end;
end;
v9.render = function(v13) --[[ Line: 34 ]] --[[ Name: render ]]
    -- upvalues: l_t_0 (copy), v5 (copy), v2 (copy), l_TextWithInlineLink_0 (copy), v3 (copy)
    local l_props_0 = v13.props;
    assert(l_t_0.interface({
        content = l_t_0.interface({
            TextLine1 = l_t_0.string, 
            TextLine2 = l_t_0.string, 
            LinkText = l_t_0.string
        }), 
        onLinkClicked = l_t_0.callback
    })(l_props_0));
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_FONT_SIZE_MEDIUM_0 = v5.FONT_SIZE_MEDIUM;
    local l_content_0 = l_props_0.content;
    local v18 = l_props_0.Position or UDim2.new(0, 0, 0, 0);
    local v19 = l_props_0.ZIndex or 0;
    local v20 = l_props_0.Visible ~= nil and l_props_0.Visible or l_props_0.Visible == nil;
    local v21 = {
        TextProps = {
            TextColor = l_Stylizer_0.infoBanner.textColor, 
            BackgroundTransparency = 1, 
            Font = v5.FONT, 
            TextSize = l_FONT_SIZE_MEDIUM_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true, 
            ClipsDescendants = true
        }, 
        LinkPlaceholder = "{link}", 
        LinkText = l_content_0.LinkText, 
        OnLinkClicked = l_props_0.onLinkClicked, 
        MaxWidth = v13.state.maxChildWidth
    };
    return v2.createElement("Frame", {
        Position = v18, 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ZIndex = v19, 
        Visible = v20, 
        [v2.Change.AbsoluteSize] = v13.updateSize
    }, {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center
        }), 
        TextLine1 = v2.createElement(l_TextWithInlineLink_0, v3.Dictionary.join({
            Text = l_content_0.TextLine1, 
            LayoutOrder = 1
        }, v21)), 
        TextLine2 = v2.createElement(l_TextWithInlineLink_0, v3.Dictionary.join({
            Text = l_content_0.TextLine2, 
            LayoutOrder = 2
        }, v21))
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v9));