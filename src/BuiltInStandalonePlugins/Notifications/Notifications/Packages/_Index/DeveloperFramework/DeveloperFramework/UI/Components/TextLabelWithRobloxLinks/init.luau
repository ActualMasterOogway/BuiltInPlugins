local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v2 = require(l_Parent_0.Parent.Roact);
local v3 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v3.withContext;
local l_UI_0 = l_Parent_0.UI;
local v6 = require(l_UI_0.Components.Pane);
local v7 = require(l_UI_0.Components.LinkText);
local v8 = require(l_UI_0.Components.TextLabel);
local l_Util_0 = l_Parent_0.Util;
local v10 = require(l_Util_0.getRobloxLinksFromString);
local v11 = require(l_Util_0.LayoutOrderIterator);
local v12 = require(l_Util_0.prioritize);
local v13 = v2.PureComponent:extend("TextLabelWithRobloxLinks");
v13.defaultProps = {
    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
    TextXAlignment = Enum.TextXAlignment.Left
};
v13.init = function(v14) --[[ Line: 59 ]] --[[ Name: init ]]
    -- upvalues: l_GuiService_0 (copy), v10 (copy)
    v14.state = {
        linkifyItems = {}
    };
    v14.onClickLink = function(v15) --[[ Line: 64 ]]
        -- upvalues: v14 (copy), l_GuiService_0 (ref)
        local l_props_0 = v14.props;
        if l_props_0.OnClickLink then
            l_props_0.OnClickLink(v15);
        end;
        l_GuiService_0:OpenBrowserWindow(v15);
    end;
    v14.createLinkifiedItems = function() --[[ Line: 72 ]]
        -- upvalues: v14 (copy), v10 (ref)
        local l_props_1 = v14.props;
        local v18 = v10(l_props_1.Text);
        v14:setState(function() --[[ Line: 76 ]]
            -- upvalues: v18 (copy)
            return {
                linkifyItems = v18
            };
        end);
    end;
end;
v13.didMount = function(v19) --[[ Line: 84 ]] --[[ Name: didMount ]]
    v19.createLinkifiedItems();
end;
v13.didUpdate = function(v20, v21) --[[ Line: 88 ]] --[[ Name: didUpdate ]]
    local l_props_2 = v20.props;
    if v21.Text ~= l_props_2.Text then
        v20.createLinkifiedItems();
    end;
end;
v13.render = function(v23) --[[ Line: 95 ]] --[[ Name: render ]]
    -- upvalues: v12 (copy), v11 (copy), v2 (copy), v7 (copy), v8 (copy), v6 (copy)
    local l_props_3 = v23.props;
    local l_state_0 = v23.state;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local v27 = v12(l_props_3.Font, l_Stylizer_0.Font);
    local v28 = v12(l_props_3.TextSize, l_Stylizer_0.TextSize);
    local v29 = v12(l_props_3.TextColor, l_Stylizer_0.TextColor);
    local v30 = v12(l_props_3.TextXAlignment, l_Stylizer_0.TextXAlignment);
    local v31 = v12(l_props_3.TextYAlignment, l_Stylizer_0.TextYAlignment);
    local v32 = v11.new();
    local v33 = {};
    for v34, v35 in pairs(l_state_0.linkifyItems) do
        if v35.IsLink then
            local l_Link_0 = v35.UrlInfo.Link;
            v33[v34] = v2.createElement(v7, {
                Font = v27, 
                LayoutOrder = v32:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v35.Text, 
                TextSize = v28, 
                TextTruncate = l_props_3.TextTruncate, 
                TextWrapped = l_props_3.TextWrapped, 
                TextXAlignment = v30, 
                TextYAlignment = v31, 
                OnClick = function() --[[ Line: 121 ]] --[[ Name: OnClick ]]
                    -- upvalues: v23 (copy), l_Link_0 (copy)
                    v23.onClickLink(l_Link_0);
                end
            });
        else
            v33[v34] = v2.createElement(v8, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v27, 
                LayoutOrder = v32:getNextOrder(), 
                RichText = l_props_3.RichText, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = v35.Text, 
                TextColor = v29, 
                TextSize = v28, 
                TextTruncate = l_props_3.TextTruncate, 
                TextWrapped = l_props_3.TextWrapped, 
                TextXAlignment = v30, 
                TextYAlignment = v31
            });
        end;
    end;
    return v2.createElement(v6, {
        AutomaticSize = l_props_3.AutomaticSize, 
        ClipsDescendants = l_props_3.ClipsDescendants, 
        HorizontalAlignment = l_props_3.HorizontalAlignment, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_3.LayoutOrder, 
        Position = l_props_3.Position, 
        Size = l_props_3.Size, 
        Spacing = l_Stylizer_0.Spacing, 
        VerticalAlignment = l_props_3.VerticalAlignment
    }, v33);
end;
return (l_withContext_0({
    Stylizer = v3.Stylizer
})(v13));