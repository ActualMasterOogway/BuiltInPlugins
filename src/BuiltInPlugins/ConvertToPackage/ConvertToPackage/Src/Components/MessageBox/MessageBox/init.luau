local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v7 = require(l_Parent_0.Src.Util.Constants);
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_Dialog_0 = l_UI_0.Dialog;
local v11 = v2.PureComponent:extend("MessageBox");
v11.init = function(v12, _) --[[ Line: 19 ]] --[[ Name: init ]]
    v12.isDead = false;
    v12.onEnabledChanged = function(v14) --[[ Line: 28 ]]
        -- upvalues: v12 (copy)
        if v12.isDead then
            return;
        else
            if not v14.Enabled and v12.props.onClose then
                v12.props.onClose();
            end;
            return;
        end;
    end;
    v12.onAncestryChanged = function(_, _, v17) --[[ Line: 37 ]]
        -- upvalues: v12 (copy)
        if v12.isDead then
            return;
        else
            if not v17 and v12.props.onClose then
                v12.props.onClose();
            end;
            return;
        end;
    end;
end;
v11.willUnmount = function(v18) --[[ Line: 47 ]] --[[ Name: willUnmount ]]
    v18.isDead = true;
end;
v11.render = function(v19) --[[ Line: 53 ]] --[[ Name: render ]]
    -- upvalues: v7 (copy), v2 (copy), l_Button_0 (copy), l_GetTextSize_0 (copy), l_Dialog_0 (copy)
    local l_props_0 = v19.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v23 = l_props_0.Title or "";
    local v24 = l_props_0.Text or "";
    local v25 = l_props_0.InformativeText or "";
    local v26 = l_props_0.Icon or "";
    local v27 = l_props_0.mockTesting or "";
    local v28 = #v25 ~= 0;
    local v29 = v26 ~= "";
    local l_FONT_0 = v7.FONT;
    local l_FONT_SIZE_MEDIUM_0 = v7.FONT_SIZE_MEDIUM;
    local l_FONT_1 = v7.FONT;
    local l_FONT_SIZE_SMALL_0 = v7.FONT_SIZE_SMALL;
    local l_messageBox_0 = l_Stylizer_0.messageBox;
    local v35 = l_props_0.buttons or {};
    if #v35 == 0 then
        v35 = {
            {
                Text = l_Localization_0:getText("General", "OK"), 
                action = "ok"
            }
        };
    end;
    local l_MESSAGE_BOX_BUTTON_WIDTH_0 = v7.MESSAGE_BOX_BUTTON_WIDTH;
    local v37 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 15)
        })
    };
    for v38, v39 in ipairs(v35) do
        v37[v38] = v2.createElement(l_Button_0, {
            OnClick = v39.OnClick, 
            Size = UDim2.new(0, l_MESSAGE_BOX_BUTTON_WIDTH_0, 1, 0), 
            Style = "Round", 
            Text = v39.Text
        });
    end;
    local v40 = l_GetTextSize_0(v24, l_FONT_SIZE_MEDIUM_0, l_FONT_0, Vector2.new(0, 0));
    local v41 = l_GetTextSize_0(v25, l_FONT_SIZE_SMALL_0, l_FONT_1, Vector2.new(0, 0));
    local v42 = math.max(math.min(v40.X, 424), (math.min(v41.X, 192)));
    local v43 = v29 and 32 or 0;
    local v44 = v29 and 20 or 0;
    local v45 = v43 + v44;
    local v46 = v45 + v42;
    local v47 = math.max(math.max(#v35 * l_MESSAGE_BOX_BUTTON_WIDTH_0 + (#v35 - 1) * 15, v46), 120);
    local v48 = v47 - v45;
    local v49 = l_GetTextSize_0(v24, l_FONT_SIZE_MEDIUM_0, l_FONT_0, Vector2.new(v48, 1000));
    local v50 = l_GetTextSize_0(v25, l_FONT_SIZE_SMALL_0, l_FONT_1, Vector2.new(v48, 1000));
    local l_Y_0 = v49.Y;
    local l_Y_1 = v50.Y;
    local v53 = math.max(v43, l_Y_0 + (v28 and 8 + l_Y_1 or 0));
    local v54 = 12 + v47 + 12;
    local v55 = 20 + v53 + 20 + 30 + 12;
    if v27 ~= "" then
        return nil;
    else
        return v2.createElement(l_Dialog_0, {
            Title = v23, 
            Modal = true, 
            Resizable = false, 
            Size = Vector2.new(v54, v55), 
            MinSize = Vector2.new(v54, v55), 
            Enabled = true, 
            OnClose = l_props_0.onClose, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            [v2.Change.Enabled] = v19.onEnabledChanged, 
            [v2.Event.AncestryChanged] = v19.onAncestryChanged
        }, {
            Background = v2.createElement("Frame", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_messageBox_0.backgroundColor
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 12), 
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingRight = UDim.new(0, 12), 
                    PaddingTop = UDim.new(0, 20)
                }), 
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 20)
                }), 
                Information = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, v53), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        Padding = UDim.new(0, v44), 
                        FillDirection = Enum.FillDirection.Horizontal
                    }), 
                    Icon = v2.createElement("ImageLabel", {
                        Size = UDim2.new(0, v43, 0, v43), 
                        BackgroundTransparency = 1, 
                        LayoutOrder = 0, 
                        Image = v26
                    }), 
                    Texts = v2.createElement("Frame", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, -v45, 1, 0), 
                        BackgroundTransparency = 1
                    }, {
                        UIListLayout = v2.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                            VerticalAlignment = Enum.VerticalAlignment.Top, 
                            Padding = UDim.new(0, 8), 
                            FillDirection = Enum.FillDirection.Vertical
                        }), 
                        TextLabel = v2.createElement("TextLabel", {
                            LayoutOrder = 0, 
                            Size = UDim2.new(1, 0, 0, l_Y_0), 
                            BackgroundTransparency = 1, 
                            Text = v24, 
                            Font = l_FONT_0, 
                            TextSize = l_FONT_SIZE_MEDIUM_0, 
                            TextColor3 = l_messageBox_0.textColor, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            TextWrapped = true
                        }), 
                        InformativeLabel = v28 and v2.createElement("TextLabel", {
                            LayoutOrder = 1, 
                            Size = UDim2.new(1, 0, 0, l_Y_1), 
                            BackgroundTransparency = 1, 
                            Text = v25, 
                            Font = l_FONT_1, 
                            TextSize = l_FONT_SIZE_SMALL_0, 
                            TextColor3 = l_messageBox_0.informativeTextColor, 
                            TextXAlignment = Enum.TextXAlignment.Center, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            TextWrapped = true
                        })
                    })
                }), 
                Buttons = v2.createElement("Frame", {
                    Size = UDim2.new(1, 0, 0, 30), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, v37)
            })
        });
    end;
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v11));