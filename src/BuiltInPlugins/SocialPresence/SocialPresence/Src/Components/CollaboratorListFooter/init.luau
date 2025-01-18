local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_StyleModifier_0 = v2.Util.StyleModifier;
local l_UI_0 = v2.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_DropdownMenu_0 = l_UI_0.DropdownMenu;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Button_0 = l_UI_0.Button;
local l_TextService_0 = game:GetService("TextService");
local v12 = Vector2.new(1000, 1);
local l_FixSocialPresenceDropdown_0 = game:GetFastFlag("FixSocialPresenceDropdown");
return function() --[[ Line: 20 ]] --[[ Name: CollaboratorListFooter ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), v1 (copy), l_TextService_0 (copy), v12 (copy), l_IconButton_0 (copy), l_FixSocialPresenceDropdown_0 (copy), l_DropdownMenu_0 (copy), l_TextLabel_0 (copy), l_Button_0 (copy), l_StyleModifier_0 (copy)
    local l_CollaboratorsService_0 = game:GetService("CollaboratorsService");
    local v15 = l_Localization_0.use();
    local v16 = l_Stylizer_0:use();
    local v17, v18 = v1.useState(false);
    local l_X_0 = l_TextService_0:GetTextSize(v15:getText("Settings", "DisableTeamCreate"), 22, Enum.Font.SourceSans, v12).X;
    return v1.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, v16.footer.height), 
        AnchorPoint = Vector2.new(0, 1), 
        Position = UDim2.fromScale(0, 1), 
        ZIndex = 2
    }, {
        Border = v1.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Thickness = 1, 
            Color = v16.footer.borderColor
        }), 
        Button = v1.createElement(l_IconButton_0, {
            OnClick = function() --[[ Line: 46 ]] --[[ Name: OnClick ]]
                -- upvalues: v18 (copy)
                v18(true);
            end, 
            LeftIcon = v16.footer.moreIcon, 
            IconColor = v16.footer.iconColor, 
            Size = UDim2.fromOffset(16, 16), 
            Style = "IconOnly", 
            Position = UDim2.new(1, -4, 0.5, 0), 
            AnchorPoint = Vector2.new(1, 0.5)
        }), 
        Menu = v1.createElement("Frame", {
            Position = l_FixSocialPresenceDropdown_0 and UDim2.new(1, -20, 1, -16) or UDim2.new(1, -4, 0.5, 0), 
            AnchorPoint = l_FixSocialPresenceDropdown_0 and Vector2.new(1, 0) or Vector2.new(1, 0.5), 
            BackgroundTransparency = 1
        }, {
            v1.createElement(l_DropdownMenu_0, {
                Hide = not v17, 
                Items = {
                    v1.createElement(l_TextLabel_0, {
                        Text = v15:getText("Settings", "DisableTeamCreate"), 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        TextColor = v16.footer.disableTeamCreateColor
                    }, {
                        Padding = v1.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 10)
                        })
                    })
                }, 
                OnItemActivated = function(_, v21) --[[ Line: 74 ]] --[[ Name: OnItemActivated ]]
                    -- upvalues: l_CollaboratorsService_0 (copy)
                    if v21 == 1 then
                        l_CollaboratorsService_0:ToggleTeamCreate(false);
                    end;
                end, 
                OnRenderItem = function(v22, v23, v24, v25) --[[ Line: 79 ]] --[[ Name: OnRenderItem ]]
                    -- upvalues: v1 (ref), l_Button_0 (ref), l_StyleModifier_0 (ref)
                    return v1.createElement(l_Button_0, {
                        LayoutOrder = v23, 
                        OnClick = v24, 
                        Size = UDim2.new(1, 0, 0, 32), 
                        StyleModifier = if v25 then l_StyleModifier_0.Hover else nil
                    }, {
                        v22
                    });
                end, 
                OnFocusLost = function() --[[ Line: 87 ]] --[[ Name: OnFocusLost ]]
                    -- upvalues: v18 (copy)
                    v18(false);
                end, 
                Style = {
                    Width = l_X_0, 
                    MaxHeight = l_FixSocialPresenceDropdown_0 and 32 or 120, 
                    Offset = l_FixSocialPresenceDropdown_0 and Vector2.zero or Vector2.new(0, 12)
                }
            })
        })
    });
end;