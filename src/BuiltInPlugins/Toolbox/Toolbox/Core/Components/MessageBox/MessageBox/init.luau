local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v8 = require(l_Parent_0.Core.Components.PluginWidget.Dialog);
local v9 = require(l_Parent_0.Core.Components.MessageBox.MessageBoxButton);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxFixMessageBoxSize);
local v11 = v2.PureComponent:extend("MessageBox");
v11.init = function(v12, _) --[[ Line: 21 ]] --[[ Name: init ]]
    v12.isDead = false;
    v12.onEnabledChanged = function(v14) --[[ Line: 30 ]]
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
    v12.onAncestryChanged = function(_, _, v17) --[[ Line: 39 ]]
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
v11.willUnmount = function(v18) --[[ Line: 49 ]] --[[ Name: willUnmount ]]
    v18.isDead = true;
end;
v11.render = function(v19) --[[ Line: 55 ]] --[[ Name: render ]]
    -- upvalues: v4 (copy), v2 (copy), v9 (copy), l_GetTextSize_0 (copy), v8 (copy), v10 (copy)
    local l_props_0 = v19.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v22 = l_props_0.Title or "";
    local v23 = l_props_0.Name or v22;
    local v24 = l_props_0.Id or nil;
    local v25 = l_props_0.Text or "";
    local v26 = l_props_0.InformativeText or "";
    local v27 = l_props_0.Icon or "";
    local v28 = #v26 ~= 0;
    local v29 = v27 ~= "";
    local l_FONT_0 = v4.FONT;
    local l_FONT_SIZE_SMALL_0 = v4.FONT_SIZE_SMALL;
    local l_FONT_1 = v4.FONT;
    local l_FONT_SIZE_SMALL_1 = v4.FONT_SIZE_SMALL;
    local l_messageBox_0 = l_Stylizer_0.messageBox;
    local v35 = l_props_0.buttons or {};
    if #v35 == 0 then
        v35 = {
            {
                Text = "Ok", 
                action = "ok"
            }
        };
    end;
    local l_MESSAGE_BOX_BUTTON_WIDTH_0 = v4.MESSAGE_BOX_BUTTON_WIDTH;
    local v37 = {
        UIListLayout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            FillDirection = Enum.FillDirection.Horizontal, 
            Padding = UDim.new(0, 8)
        })
    };
    for v38, v39 in ipairs(v35) do
        v37[v39.action .. v38] = v2.createElement(v9, {
            index = v38, 
            Text = v39.Text, 
            action = v39.action, 
            onButtonClicked = v19.props.onButtonClicked
        });
    end;
    local v40 = l_GetTextSize_0(v25, l_FONT_SIZE_SMALL_0, l_FONT_0, Vector2.new(0, 0));
    local v41 = l_GetTextSize_0(v26, l_FONT_SIZE_SMALL_1, l_FONT_1, Vector2.new(0, 0));
    local v42 = math.max(math.min(v40.X, 424), (math.min(v41.X, 192)));
    local v43 = v29 and 32 or 0;
    local v44 = v43 + 20;
    local v45 = v44 + v42;
    local v46 = if l_props_0.IconColor then l_props_0.IconColor else nil;
    local v47 = math.max(math.max(#v35 * l_MESSAGE_BOX_BUTTON_WIDTH_0 + (#v35 - 1) * 8, v45), 120);
    local v48 = v47 - v44;
    local v49 = l_GetTextSize_0(v25, l_FONT_SIZE_SMALL_0, l_FONT_0, Vector2.new(v48, 1000));
    local v50 = l_GetTextSize_0(v26, l_FONT_SIZE_SMALL_1, l_FONT_1, Vector2.new(v48, 1000));
    local l_Y_0 = v49.Y;
    local l_Y_1 = v50.Y;
    local v53 = math.max(v43, l_Y_0 + (v28 and 8 + l_Y_1 or 0));
    local v54 = 12 + v47 + 12;
    local v55 = 8 + v53 + 12 + 23 + 12;
    return v2.createElement(v8, {
        Name = v23, 
        Title = v22, 
        Id = v24, 
        Size = Vector2.new(v54, v55), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        Modal = true, 
        plugin = v19.props.Plugin:get(), 
        [v2.Change.Enabled] = v19.onEnabledChanged, 
        [v2.Event.AncestryChanged] = v19.onAncestryChanged
    }, {
        Background = v2.createElement("Frame", {
            AutomaticSize = if v10() then Enum.AutomaticSize.Y else nil, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_messageBox_0.backgroundColor
        }, {
            UIPadding = v2.createElement("UIPadding", {
                PaddingBottom = UDim.new(0, 12), 
                PaddingLeft = UDim.new(0, 12), 
                PaddingRight = UDim.new(0, 12), 
                PaddingTop = UDim.new(0, 8)
            }), 
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top, 
                Padding = UDim.new(0, 12)
            }), 
            Information = v2.createElement("Frame", {
                AutomaticSize = if v10() then Enum.AutomaticSize.Y else nil, 
                Size = UDim2.new(1, 0, 0, v53), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    Padding = UDim.new(0, 20), 
                    FillDirection = Enum.FillDirection.Horizontal
                }), 
                Icon = v2.createElement("ImageLabel", {
                    Size = UDim2.new(0, v43, 0, v43), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0, 
                    Image = v27, 
                    ImageColor3 = v46
                }), 
                Texts = v2.createElement("Frame", {
                    AutomaticSize = if v10() then Enum.AutomaticSize.Y else nil, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, -v44, v10() and 0 or 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        Padding = UDim.new(0, 8), 
                        FillDirection = Enum.FillDirection.Vertical
                    }), 
                    TextLabel = v2.createElement("TextLabel", {
                        AutomaticSize = if v10() then Enum.AutomaticSize.Y else nil, 
                        LayoutOrder = 0, 
                        Size = UDim2.new(1, 0, 0, l_Y_0), 
                        BackgroundTransparency = 1, 
                        Text = v25, 
                        Font = l_FONT_0, 
                        TextSize = l_FONT_SIZE_SMALL_0, 
                        TextColor3 = l_messageBox_0.textColor, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true
                    }), 
                    InformativeLabel = v28 and v2.createElement("TextLabel", {
                        AutomaticSize = if v10() then Enum.AutomaticSize.Y else nil, 
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, l_Y_1), 
                        BackgroundTransparency = 1, 
                        Text = v26, 
                        Font = l_FONT_1, 
                        TextSize = l_FONT_SIZE_SMALL_1, 
                        TextColor3 = l_messageBox_0.informativeTextColor, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true
                    })
                })
            }), 
            Buttons = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 23), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, v37)
        })
    });
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v11));