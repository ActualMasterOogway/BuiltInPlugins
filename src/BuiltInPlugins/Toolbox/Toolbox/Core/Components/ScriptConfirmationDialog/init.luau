local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v5 = require(l_Util_0.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Checkbox_0 = v3.UI.Checkbox;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v10 = require(l_Parent_0.Core.Components.PluginWidget.Dialog);
local v11 = require(l_Parent_0.Core.Components.MessageBox.MessageBoxButton);
local _ = require(l_Parent_0.Core.ContextServices.ModalContext);
local v13 = v2.PureComponent:extend("ScriptConfirmationDialog");
v13.init = function(v14, _) --[[ Line: 31 ]] --[[ Name: init ]]
    v14.isDead = false;
    v14.onEnabledChanged = function(v16) --[[ Line: 40 ]]
        -- upvalues: v14 (copy)
        if v14.isDead then
            return;
        else
            if not v16.Enabled and v14.props.onClose then
                v14.props.onClose();
            end;
            return;
        end;
    end;
    v14.onAncestryChanged = function(_, _, v19) --[[ Line: 49 ]]
        -- upvalues: v14 (copy)
        if v14.isDead then
            return;
        else
            if not v19 and v14.props.onClose then
                v14.props.onClose();
            end;
            return;
        end;
    end;
    v14.onToggleShowAgain = function() --[[ Line: 58 ]]
        -- upvalues: v14 (copy)
        local v20 = not v14.state.checked;
        v14:setState({
            checked = v20
        });
        v14.props.onChangeShowDialog(not v20);
    end;
    v14:setState({
        checked = false
    });
end;
v13.willUnmount = function(v21) --[[ Line: 71 ]] --[[ Name: willUnmount ]]
    v21.isDead = true;
end;
v13.render = function(v22) --[[ Line: 77 ]] --[[ Name: render ]]
    -- upvalues: v5 (copy), l_GetTextSize_0 (copy), v2 (copy), v11 (copy), v10 (copy), l_Checkbox_0 (copy)
    local l_props_0 = v22.props;
    local l_state_0 = v22.state;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Info_0 = l_props_0.Info;
    local v27 = l_props_0.Localization:getText("ScriptWarning", "DetailText", {
        assetName = l_Info_0.assetName, 
        numScripts = l_Info_0.numScripts
    });
    local l_FONT_SIZE_MEDIUM_0 = v5.FONT_SIZE_MEDIUM;
    local l_FONT_BOLD_0 = v5.FONT_BOLD;
    local v30 = l_props_0.Localization:getText("ScriptWarning", "InstructionText") .. " " .. l_props_0.Localization:getText("ScriptWarning", "InstructionText2");
    local l_FONT_SIZE_MEDIUM_1 = v5.FONT_SIZE_MEDIUM;
    local l_FONT_0 = v5.FONT;
    local v33 = l_props_0.Localization:getText("ScriptWarning", "DontShowAgain");
    local l_FONT_SIZE_MEDIUM_2 = v5.FONT_SIZE_MEDIUM;
    local l_FONT_1 = v5.FONT;
    local v36 = l_props_0.Localization:getText("Common", "OK");
    local v37 = l_props_0.Localization:getText("Purchase", "Cancel");
    local v38 = l_props_0.Localization:getText("General", "ToolboxToolbarName");
    local l_MESSAGE_BOX_BUTTON_WIDTH_0 = v5.MESSAGE_BOX_BUTTON_WIDTH;
    local v40 = l_GetTextSize_0(v27, l_FONT_SIZE_MEDIUM_0, l_FONT_BOLD_0, Vector2.new(0, 0));
    local v41 = l_GetTextSize_0(v30, l_FONT_SIZE_MEDIUM_1, l_FONT_0, Vector2.new(0, 0));
    local v42 = l_GetTextSize_0(v33, l_FONT_SIZE_MEDIUM_2, l_FONT_1, Vector2.new(0, 0));
    local v43 = math.max(math.max(l_MESSAGE_BOX_BUTTON_WIDTH_0, 52 + math.max(math.min(v40.X, 424), math.min(v41.X, 424), math.min(v42.X, 424) + 16)), 120);
    local v44 = v43 - 52;
    local v45 = l_GetTextSize_0(v27, l_FONT_SIZE_MEDIUM_0, l_FONT_BOLD_0, Vector2.new(v44, 1000));
    local v46 = l_GetTextSize_0(v30, l_FONT_SIZE_MEDIUM_1, l_FONT_0, Vector2.new(v44, 1000));
    local v47 = l_GetTextSize_0(v33, l_FONT_SIZE_MEDIUM_2, l_FONT_1, Vector2.new(v44 - 16, 1000));
    local l_Y_0 = v45.Y;
    local l_Y_1 = v46.Y;
    local l_Y_2 = v47.Y;
    local v51 = math.max(32, l_Y_0 + l_Y_2 + l_Y_1 + 8);
    local v52 = 12 + v43 + 12;
    local v53 = 8 + v51 + 12 + 23 + 12;
    local v54 = v2.createElement(v11, {
        Text = v37, 
        onButtonClicked = v22.props.onCancel
    });
    return v2.createElement(v10, {
        Name = l_props_0.Name, 
        Title = v38, 
        Size = Vector2.new(v52, v53), 
        ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
        Modal = true, 
        plugin = v22.props.Plugin:get(), 
        [v2.Change.Enabled] = v22.onEnabledChanged, 
        [v2.Event.AncestryChanged] = v22.onAncestryChanged
    }, {
        Background = v2.createElement("Frame", {
            Position = UDim2.new(0, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = l_Stylizer_0.messageBox.backgroundColor
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
                Size = UDim2.new(1, 0, 0, v51), 
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
                    Size = UDim2.new(0, 32, 0, 32), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 0, 
                    Image = l_props_0.Icon
                }), 
                Texts = v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, -52, 1, 0), 
                    BackgroundTransparency = 1
                }, {
                    UIListLayout = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                        VerticalAlignment = Enum.VerticalAlignment.Top, 
                        Padding = UDim.new(0, 8), 
                        FillDirection = Enum.FillDirection.Vertical
                    }), 
                    DetailLabel = v2.createElement("TextLabel", {
                        LayoutOrder = 0, 
                        Size = UDim2.new(1, 0, 0, l_Y_0), 
                        BackgroundTransparency = 1, 
                        Text = v27, 
                        Font = l_FONT_BOLD_0, 
                        TextSize = l_FONT_SIZE_MEDIUM_0, 
                        TextColor3 = l_Stylizer_0.messageBox.textColor, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true
                    }), 
                    InstructionLabel = v2.createElement("TextLabel", {
                        LayoutOrder = 1, 
                        Size = UDim2.new(1, 0, 0, l_Y_1), 
                        BackgroundTransparency = 1, 
                        Text = v30, 
                        Font = l_FONT_0, 
                        TextSize = l_FONT_SIZE_MEDIUM_1, 
                        TextColor3 = l_Stylizer_0.messageBox.textColor, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextYAlignment = Enum.TextYAlignment.Top, 
                        TextWrapped = true
                    }), 
                    ShowAgainCheckbox = v2.createElement(l_Checkbox_0, {
                        LayoutOrder = 2, 
                        Text = v33, 
                        Font = l_FONT_1, 
                        TextSize = l_FONT_SIZE_MEDIUM_2, 
                        OnClick = v22.onToggleShowAgain, 
                        Size = UDim2.new(1, 0, 0, l_Y_2), 
                        Checked = l_state_0.checked
                    })
                })
            }), 
            Buttons = v2.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 23), 
                BackgroundTransparency = 1, 
                LayoutOrder = 2
            }, {
                UIListLayout = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    VerticalAlignment = Enum.VerticalAlignment.Top, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, 8)
                }), 
                OkButton = v2.createElement(v11, {
                    Text = v36, 
                    onButtonClicked = v22.props.onOkButtonClicked
                }), 
                CancelButton = v54
            })
        })
    });
end;
return (l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v13));