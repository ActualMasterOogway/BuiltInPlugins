local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_GuiService_0 = game:GetService("GuiService");
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v2.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_LinkText_0 = l_UI_0.LinkText;
local v11 = v1.PureComponent:extend("TextScraperToggle");
v11.init = function(_) --[[ Line: 20 ]] --[[ Name: init ]]

end;
v11.render = function(v13) --[[ Line: 22 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy), l_GuiService_0 (copy), l_ToggleButton_0 (copy), l_HoverArea_0 (copy)
    local l_props_0 = v13.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_LabelText_0 = l_props_0.LabelText;
    local l_LinkText_1 = l_props_0.LinkText;
    local v19 = l_props_0.Active and l_props_0.OnButtonClick or function() --[[ Line: 28 ]]

    end;
    local l_Enabled_0 = l_props_0.Enabled;
    local v21 = v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(0, 0, 0, l_Stylizer_0.Height)
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        Label = v1.createElement(l_TextLabel_0, {
            LayoutOrder = 1, 
            Size = UDim2.new(0, l_Stylizer_0.LabelWidth, 1, 0), 
            Text = l_LabelText_0, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        }), 
        LinkTextFrame = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 3, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.LinkTextHeight)
        }, {
            LinkText = v1.createElement(l_LinkText_0, {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 0, 0, 10), 
                OnClick = function() --[[ Line: 55 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_GuiService_0 (ref), l_props_0 (copy)
                    l_GuiService_0:OpenBrowserWindow(l_props_0.Link);
                end, 
                Text = l_LinkText_1
            })
        })
    });
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(0, 0, 0, l_Stylizer_0.Height)
    }, {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        TextContainer = v21, 
        ButtonContainer = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 2, 
            Size = UDim2.new(0, l_Stylizer_0.ButtonWidth, 1, 0)
        }, {
            Button = v1.createElement(l_ToggleButton_0, {
                Selected = l_Enabled_0, 
                OnClick = v19, 
                Position = UDim2.new(0, 275, 0.2, 0), 
                Size = UDim2.new(1, 0, 0, l_Stylizer_0.ButtonHeight)
            }, {
                v1.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v11));