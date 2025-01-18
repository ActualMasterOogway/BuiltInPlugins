local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.Roact);
local l_UI_0 = v3.UI;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local l_Button_0 = l_UI_0.Button;
local v8 = require(l_Packages_0.Dash);
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local _ = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local v15 = require(l_Parent_0.Core.ContextServices.IXPContext);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v3.Util.formatLocalDateTime;
local l_Util_0 = l_Parent_0.Core.Util;
local v20 = require(l_Util_0.Analytics.Analytics);
local v21 = require(l_Util_0.Images);
local v22 = require(l_Util_0.ToolboxUtilities);
local v23 = require(l_Util_0.getUserId);
local l_withAbsoluteSize_0 = v3.Wrappers.withAbsoluteSize;
local v25 = require(l_Parent_0.Core.ContextServices.Settings);
local v26 = require(l_Parent_0.Core.ContextServices.ModalContext);
local v27 = UDim2.fromOffset(110, 30);
local v28 = UDim2.fromOffset(264, 110);
local v29 = v4.PureComponent:extend("AnnouncementDialog");
v29.init = function(v30, _) --[[ Line: 75 ]] --[[ Name: init ]]
    -- upvalues: v22 (copy), v23 (copy), l_GuiService_0 (copy), v20 (copy)
    v30.state = {
        isEnabled = true, 
        openStartTime = 0
    };
    v30.shouldShowAnnouncementDialog = function() --[[ Line: 81 ]]
        -- upvalues: v30 (copy), v22 (ref), v23 (ref)
        local l_state_0 = v30.state;
        local l_props_0 = v30.props;
        local v34 = l_props_0.Settings:get("Plugin"):getLastAnnouncementViewedKey();
        local v35 = v22.getAnnouncementConfiguration();
        local v36 = v35.Date or "";
        local v37 = false;
        local v38 = false;
        local v39 = false;
        local l_IXPComparisonDefinitionKey_0 = v35.IXPComparisonDefinitionKey;
        local l_IXPComparisonVariableKey_0 = v35.IXPComparisonVariableKey;
        if l_IXPComparisonDefinitionKey_0 ~= nil and l_IXPComparisonDefinitionKey_0 ~= "" and l_IXPComparisonVariableKey_0 ~= nil and l_IXPComparisonVariableKey_0 ~= "" then
            local l_checkUserInIXP_0 = l_props_0.checkUserInIXP;
            local v43 = false;
            if l_checkUserInIXP_0 ~= nil then
                v43 = l_checkUserInIXP_0(l_props_0.IXP, l_IXPComparisonDefinitionKey_0, l_IXPComparisonVariableKey_0);
            end;
            v39 = v43;
        else
            v39 = true;
        end;
        if v36 ~= "" then
            local v44, v45, v46, v47, v48, v49 = v36:match("(%d+)-(%d+)-(%d+) (%d+):(%d+):(%d+)");
            local v50 = {
                year = tonumber(v44), 
                month = tonumber(v45), 
                day = tonumber(v46), 
                hour = tonumber(v47), 
                min = tonumber(v48), 
                sec = tonumber(v49)
            };
            local v51 = os.time(v50);
            if math.floor(os.difftime(os.time(), v51) / 86400) > 30 then
                v37 = true;
            end;
        end;
        local l_LatestUserId_0 = v35.LatestUserId;
        if l_LatestUserId_0 and l_LatestUserId_0 ~= "" then
            v38 = tonumber(l_LatestUserId_0) < v23();
        end;
        return l_state_0.isEnabled and v36 ~= "" and v34 ~= v36 and not v37 and not v38 and v39;
    end;
    v30.onClose = function() --[[ Line: 145 ]]
        -- upvalues: v30 (copy), v22 (ref)
        local l_props_1 = v30.props;
        local v54 = v22.getAnnouncementConfiguration().Date or "";
        l_props_1.Modal.onAssetPreviewToggled(false);
        l_props_1.Settings:get("Plugin"):setLastAnnouncementViewedKey(v54);
        v30:setState(function(v55) --[[ Line: 157 ]]
            if v55.isEnabled then
                return {
                    isEnabled = false
                };
            else
                return;
            end;
        end);
    end;
    v30.onClickLink = function() --[[ Line: 166 ]]
        -- upvalues: v22 (ref), l_GuiService_0 (ref), v30 (copy), v20 (ref)
        local l_LinkLocation_0 = v22.getAnnouncementConfiguration().LinkLocation;
        l_GuiService_0:OpenBrowserWindow(l_LinkLocation_0);
        local v57 = v30.getAnnouncementConfigurationOrDefault();
        v20.AnnouncementLinkClicked(v57.ButtonKey, v57.Date, v57.DescriptionKey, v57.HeaderKey, v57.LinkKey, v57.LinkLocation);
    end;
    v30.onClickXButton = function() --[[ Line: 182 ]]
        -- upvalues: v30 (copy), v20 (ref)
        local v58 = v30.getAnnouncementConfigurationOrDefault();
        local v59 = (tick() - v30.state.openStartTime) * 1000;
        v20.AnnouncementClosed(v58.ButtonKey, v58.Date, v58.DescriptionKey, v58.HeaderKey, v58.LinkKey, v58.LinkLocation, v59);
        v30.onClose();
    end;
    v30.onClickAcknowledgeButton = function() --[[ Line: 199 ]]
        -- upvalues: v30 (copy), v20 (ref)
        local v60 = v30.getAnnouncementConfigurationOrDefault();
        local v61 = (tick() - v30.state.openStartTime) * 1000;
        v20.AnnouncementAcknowledged(v60.ButtonKey, v60.Date, v60.DescriptionKey, v60.HeaderKey, v60.LinkKey, v60.LinkLocation, v61);
        v30.onClose();
    end;
    v30.getAnnouncementConfigurationOrDefault = function(_) --[[ Line: 216 ]]
        -- upvalues: v22 (ref)
        local v63 = v22.getAnnouncementConfiguration();
        return {
            ButtonKey = v63.ButtonKey or "Button_Default", 
            Date = v63.Date or "", 
            DescriptionKey = v63.DescriptionKey or "", 
            HeaderKey = v63.HeaderKey or "Header_Default", 
            Image = v63.Image, 
            LinkKey = v63.LinkKey or "LinkText_Default", 
            LinkLocation = v63.LinkLocation
        };
    end;
end;
v29.didMount = function(v64) --[[ Line: 230 ]] --[[ Name: didMount ]]
    -- upvalues: v20 (copy)
    if v64.shouldShowAnnouncementDialog() then
        v64.props.Modal.onAssetPreviewToggled(true);
        v64:setState({
            openStartTime = tick()
        });
        local v65 = v64.getAnnouncementConfigurationOrDefault();
        v20.AnnouncementViewed(v65.ButtonKey, v65.Date, v65.DescriptionKey, v65.HeaderKey, v65.LinkKey, v65.LinkLocation);
    end;
end;
v29.render = function(v66) --[[ Line: 250 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v4 (copy), l_CaptureFocus_0 (copy), l_Pane_0 (copy), v8 (copy), v21 (copy), l_HoverArea_0 (copy), l_TextLabel_0 (copy), v27 (copy), l_LinkText_0 (copy), l_Button_0 (copy), v28 (copy)
    if not v66.shouldShowAnnouncementDialog() then
        return;
    else
        local _ = v66.state;
        local v68 = l_LayoutOrderIterator_0.new();
        local l_props_2 = v66.props;
        local l_Localization_0 = l_props_2.Localization;
        local _ = l_props_2.Settings:get("Plugin");
        local l_Stylizer_0 = l_props_2.Stylizer;
        local l_WrapperProps_0 = l_props_2.WrapperProps;
        local l_announcementDialog_0 = l_Stylizer_0.announcementDialog;
        local v75 = v66.getAnnouncementConfigurationOrDefault();
        local l_ButtonKey_0 = v75.ButtonKey;
        local l_DescriptionKey_0 = v75.DescriptionKey;
        local l_HeaderKey_0 = v75.HeaderKey;
        local l_Image_1 = v75.Image;
        local l_LinkKey_0 = v75.LinkKey;
        local l_LinkLocation_1 = v75.LinkLocation;
        local v82 = l_Localization_0:getText("Announcement", l_ButtonKey_0);
        local v83 = l_Localization_0:getText("Announcement", l_DescriptionKey_0);
        local v84 = l_Localization_0:getText("Announcement", l_HeaderKey_0);
        local v85 = l_Localization_0:getText("Announcement", l_LinkKey_0);
        local v86 = l_props_2.AbsoluteSize.X > 400;
        local v87 = nil;
        v87 = if v86 then UDim.new(0, 400) else UDim.new(1, 0);
        return v4.createElement(l_CaptureFocus_0, {
            OnFocusLost = function() --[[ Line: 290 ]] --[[ Name: OnFocusLost ]]

            end
        }, {
            Overlay = v4.createElement("Frame", {
                BackgroundColor3 = l_announcementDialog_0.overlayColor, 
                BackgroundTransparency = l_announcementDialog_0.overlayTransparency, 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                Contents = v4.createElement(l_Pane_0, v8.join({
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    Layout = Enum.FillDirection.Vertical, 
                    Padding = 20, 
                    Size = UDim2.new(1, 0, 1, 0), 
                    Spacing = 10, 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }, l_WrapperProps_0), {
                    CloseButtonContainer = v4.createElement(l_Pane_0, {
                        AutomaticSize = Enum.AutomaticSize.XY, 
                        HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                        Layout = Enum.FillDirection.Horizontal, 
                        LayoutOrder = v68:getNextOrder(), 
                        Size = UDim2.new(v87, UDim.new(0, 0))
                    }, {
                        CloseButton = v4.createElement("ImageButton", {
                            AutoButtonColor = false, 
                            BackgroundTransparency = 1, 
                            Image = v21.CLOSE_ICON, 
                            ImageColor3 = l_announcementDialog_0.closeIconColor, 
                            Size = UDim2.fromOffset(28, 28), 
                            LayoutOrder = 1, 
                            [v4.Event.Activated] = v66.onClickXButton
                        }, {
                            HoverArea = v4.createElement(l_HoverArea_0, {
                                Cursor = "PointingHand"
                            })
                        })
                    }), 
                    AnnouncementDialog = v4.createElement("Frame", {
                        AutomaticSize = Enum.AutomaticSize.Y, 
                        BackgroundColor3 = l_announcementDialog_0.backgroundColor, 
                        LayoutOrder = v68:getNextOrder(), 
                        Size = UDim2.new(v87, UDim.new(0, 0))
                    }, {
                        Contents = v4.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            Layout = Enum.FillDirection.Vertical, 
                            Padding = {
                                Bottom = 20, 
                                Left = 16, 
                                Right = 16, 
                                Top = 20
                            }, 
                            Spacing = 10, 
                            Size = UDim2.new(1, 0, 0, 0), 
                            VerticalAlignment = Enum.VerticalAlignment.Top
                        }, {
                            Header = v4.createElement(l_TextLabel_0, {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                Font = Enum.Font.SourceSansSemibold, 
                                LayoutOrder = v68:getNextOrder(), 
                                RichText = true, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                Text = v84 or "", 
                                TextColor = l_announcementDialog_0.headerTextColor, 
                                TextWrapped = true, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            }), 
                            Description = v4.createElement(l_TextLabel_0, {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                LayoutOrder = v68:getNextOrder(), 
                                RichText = true, 
                                Size = UDim2.new(1, 0, 0, 0), 
                                Text = v83 or "", 
                                TextColor = l_announcementDialog_0.descriptionColor, 
                                TextWrapped = true, 
                                TextXAlignment = Enum.TextXAlignment.Left
                            }), 
                            ActionContainer = v4.createElement(l_Pane_0, {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                LayoutOrder = v68:getNextOrder(), 
                                Padding = {
                                    Top = 10
                                }, 
                                Size = UDim2.new(1, 0, 0, 0)
                            }, {
                                LinkContainer = if l_LinkLocation_1 and l_LinkLocation_1 ~= "" then v4.createElement(l_Pane_0, {
                                    AutomaticSize = Enum.AutomaticSize.X, 
                                    LayoutOrder = v68:getNextOrder(), 
                                    Size = UDim2.new(0, 0, 0, v27.Y.Offset), 
                                    Layout = Enum.FillDirection.Horizontal, 
                                    VerticalAlignment = Enum.VerticalAlignment.Center
                                }, {
                                    LinkText = v4.createElement(l_LinkText_0, {
                                        LayoutOrder = v68:getNextOrder(), 
                                        OnClick = v66.onClickLink, 
                                        Style = "Underlined", 
                                        Text = v85
                                    })
                                }) else nil, 
                                Button = v4.createElement(l_Button_0, {
                                    AnchorPoint = Vector2.new(1, 0), 
                                    Position = UDim2.new(1, 0, 0, 0), 
                                    LayoutOrder = v68:getNextOrder(), 
                                    OnClick = v66.onClickAcknowledgeButton, 
                                    Size = v27, 
                                    Style = "RoundPrimary", 
                                    Text = v82
                                }, {
                                    HoverArea = v4.createElement(l_HoverArea_0, {
                                        Cursor = "PointingHand"
                                    })
                                })
                            }), 
                            ImageContainer = if l_Image_1 and l_Image_1 ~= "" then v4.createElement(l_Pane_0, {
                                AutomaticSize = Enum.AutomaticSize.Y, 
                                ClipsDescendants = true, 
                                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                                Layout = Enum.FillDirection.Vertical, 
                                LayoutOrder = v68:getNextOrder(), 
                                Size = UDim2.new(1, 0, 0, 0)
                            }, {
                                Image = v4.createElement("ImageLabel", {
                                    AutomaticSize = Enum.AutomaticSize.Y, 
                                    BackgroundTransparency = 1, 
                                    Image = l_Image_1, 
                                    Size = v28
                                })
                            }) else nil
                        })
                    })
                })
            })
        });
    end;
end;
v29 = l_withContext_0({
    IXP = v15, 
    Localization = l_ContextServices_0.Localization, 
    Settings = v25, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Modal = v26
})(v29);
TypedComponent = function(v88, v89) --[[ Line: 448 ]] --[[ Name: TypedComponent ]]
    -- upvalues: v4 (copy), v29 (ref)
    return v4.createElement(v29, v88, v89);
end;
return l_withAbsoluteSize_0(TypedComponent);