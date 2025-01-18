local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_BrowserService_0 = game:GetService("BrowserService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v9 = require(l_script_FirstAncestor_0.Packages.Dash);
local v10 = require(l_script_FirstAncestor_0.Packages.Framework);
local v11 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.UGCValidation);
local v13 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v15 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
local v16 = require(l_script_FirstAncestor_0.Src.Util.localizePlural);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerRerunValidation);
local v18 = game:DefineFastFlag("AvatarPreviewerForceValidationDialogModal", false);
local v19 = game:DefineFastString("AvatarPreviewerAgeIDVerificationLink", "https://en.help.roblox.com/hc/en-us/articles/4407282410644-Age-ID-Verification");
local v20 = game:DefineFastString("AvatarPreviewerPremiumLink", "https://www.roblox.com/premium/membership");
local l_UI_0 = v10.UI;
local l_Image_0 = l_UI_0.Image;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_LayoutOrderIterator_0 = v10.Util.LayoutOrderIterator;
local l_StyleModifier_0 = v10.Util.StyleModifier;
local l_Localization_0 = v10.ContextServices.Localization;
local l_Stylizer_0 = v10.ContextServices.Stylizer;
return function(v32) --[[ Line: 47 ]] --[[ Name: UGCValidationErrorDialog ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_Localization_0 (copy), l_Stylizer_0 (copy), v11 (copy), v13 (copy), l_StyledDialog_0 (copy), v17 (copy), v18 (copy), l_StyleModifier_0 (copy), l_Pane_0 (copy), l_Image_0 (copy), l_TextLabel_0 (copy), v16 (copy), l_ScrollingFrame_0 (copy), l_TextWithLinks_0 (copy), l_BrowserService_0 (copy), v19 (copy), v20 (copy), v9 (copy), v15 (copy)
    local v33 = l_LayoutOrderIterator_0.new();
    local v34 = l_Localization_0:use();
    local v35 = l_Stylizer_0:use("UGCValidationErrorDialog");
    local v36, v37 = v11.useState(0);
    local v39 = v11.useCallback(function(v38) --[[ Line: 54 ]]
        -- upvalues: v37 (copy)
        v37(v38.AbsoluteSize.Y);
    end, {});
    local v40, v41 = v11.useState(0);
    local v43 = v11.useCallback(function(v42) --[[ Line: 59 ]]
        -- upvalues: v41 (copy)
        v41(v42.AbsolutePosition.Y);
    end, {});
    local v44 = v11.useContext(v13.Context);
    local v45 = if v44.canUploadBundles ~= nil and v44.canUploadBundles.type == "notAllowed" then v44.canUploadBundles.denyReason else nil;
    local l_createElement_0 = v11.createElement;
    local l_l_StyledDialog_0_0 = l_StyledDialog_0;
    local v49 = {
        Style = v17() and "CancelAccept" or "Alert", 
        Title = v34:getText("UGCValidation", "AlertTitle"), 
        MinContentSize = v35.AlertMinContentSize, 
        Modal = v18, 
        Resizable = true, 
        Buttons = if v17() then {
            {
                Key = "rerun", 
                Text = v34:getText("UGCValidation", "RerunValidation"), 
                StyleModifier = if v32.ValidationCompleted then nil else l_StyleModifier_0.Disabled
            }, 
            {
                Key = "ok", 
                Text = v34:getText("UGCValidation", "OK")
            }
        } else {
            {
                Key = "ok", 
                Text = "OK"
            }
        }, 
        OnButtonPressed = v17() and function(v48) --[[ Line: 95 ]]
            -- upvalues: v32 (copy)
            if v48 == "ok" then
                v32.OnClose();
                return;
            elseif v48 == "rerun" and v32.ValidationCompleted then
                v32.RunValidation();
                v32.OnClose();
                return;
            else
                return;
            end;
        end or v32.OnClose, 
        OnClose = v32.OnClose
    };
    local v50 = {};
    local l_createElement_1 = v11.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v53 = {
        Layout = Enum.FillDirection.Horizontal, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    };
    local v54 = {
        LeftColumn = v11.createElement(l_Pane_0, {
            Size = UDim2.fromOffset(v35.TextSize + v35.IconTextSpacing, v35.TextSize), 
            LayoutOrder = v33:getNextOrder()
        }, {
            Image = v11.createElement(l_Image_0, {
                Image = v35.WarningImage, 
                ImageColor3 = v35.WarningColor, 
                Size = UDim2.fromOffset(v35.TextSize, v35.TextSize)
            })
        })
    };
    local l_createElement_2 = v11.createElement;
    local l_l_Pane_0_1 = l_Pane_0;
    local v57 = {
        Size = UDim2.new(1, -v35.TextSize, 1, 0), 
        LayoutOrder = v33:getNextOrder(), 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = v35.TitleDetailsSpacing, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        [v11.Change.AbsoluteSize] = v39
    };
    local v58 = {
        WarningLabel = v11.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Font = v35.WarningFont, 
            Size = UDim2.fromScale(1, 0), 
            Text = v16(v34, "UGCValidation", "WarningLongTitle", #v32.Errors + (v45 == nil and 0 or 1)), 
            TextColor = v35.WarningColor, 
            TextSize = v35.TextSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextWrapped = true
        })
    };
    local l_createElement_3 = v11.createElement;
    local l_l_ScrollingFrame_0_0 = l_ScrollingFrame_0;
    local v61 = {
        AutomaticCanvasSize = Enum.AutomaticSize.Y, 
        Size = UDim2.new(1, 0, 0, v36 - v40), 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = UDim.new(0, v35.DetailsSpacing), 
        [v11.Change.AbsolutePosition] = v43
    };
    local v62 = {};
    local v63 = v45 and v11.createElement(v11.Fragment, {}, {
        Header = v11.createElement(l_TextLabel_0, {
            Text = v34:getText("UGCValidation", "PermissionsRequiredHeader"), 
            Style = "Bold", 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextSize = v35.TextSize, 
            TextWrapped = true, 
            LayoutOrder = v33:getNextOrder()
        }), 
        ErrorText = v11.createElement(l_TextWithLinks_0, {
            LayoutOrder = v33:getNextOrder(), 
            Text = if v45 == "MissingIdVerification" then v34:getText("UGCValidation", "UploadBundleDenied_MissingIdVerification_Text") else if v45 == "MissingPremiumSubscriptionTier" then v34:getText("UGCValidation", "UploadBundleDenied_MissingPremiumSubscriptionTier_Text") else v34:getText("UGCValidation", "UploadBundleDenied_UnknownError", {
                errorCode = v45
            }), 
            TextProps = {
                Font = Enum.Font.SourceSans, 
                TextSize = v35.TextSize, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            LinkMap = {
                ["[Age_Verified]"] = {
                    LinkText = v34:getText("UGCValidation", "UploadBundleDenied_MissingIdVerification_Link"), 
                    LinkCallback = function() --[[ Line: 207 ]] --[[ Name: LinkCallback ]]
                        -- upvalues: l_BrowserService_0 (ref), v19 (ref)
                        l_BrowserService_0:OpenBrowserWindow(v19);
                    end
                }, 
                ["[Premium_1000_Or_2200_Subscription]"] = {
                    LinkText = v34:getText("UGCValidation", "UploadBundleDenied_MissingPremiumSubscriptionTier_Link"), 
                    LinkCallback = function() --[[ Line: 217 ]] --[[ Name: LinkCallback ]]
                        -- upvalues: l_BrowserService_0 (ref), v20 (ref)
                        l_BrowserService_0:OpenBrowserWindow(v20);
                    end
                }
            }
        })
    });
    local v64 = false;
    if #v32.Errors > 0 then
        v64 = v11.createElement(v11.Fragment, {}, {
            Header = v11.createElement(l_TextLabel_0, {
                Text = v34:getText("UGCValidation", "ValidationErrorsHeader"), 
                Style = "Bold", 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextSize = v35.TextSize, 
                TextWrapped = true, 
                LayoutOrder = v33:getNextOrder()
            })
        }, v9.map(v32.Errors, function(v65, v66) --[[ Line: 241 ]]
            -- upvalues: v11 (ref), l_TextLabel_0 (ref), v34 (copy), v15 (ref), v35 (copy), v33 (copy)
            return v11.createElement(l_TextLabel_0, {
                key = ("Error%*"):format(v66), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.fromScale(1, 0), 
                Text = if v65.error.type == "message" then v65.error.message else if v65.error.type == "notFound" then v34:getText("UGCValidation", "AssetNotFound", {
                    asset = v34:getText("AssetType", assert(v65.assetType, "notFound sent with no error type").Name)
                }) else v15(v65.error.type), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextSize = v35.TextSize, 
                TextWrapped = true, 
                LayoutOrder = v33:getNextOrder()
            });
        end));
    end;
    v6(v62, 1, v63, v64);
    v58.Warnings = l_createElement_3(l_l_ScrollingFrame_0_0, v61, v62);
    v54.RightColumn = l_createElement_2(l_l_Pane_0_1, v57, v58);
    v54.Rerun_Disabled = v17() and not v32.ValidationCompleted and v11.createElement("Folder");
    v50.Contents = l_createElement_1(l_l_Pane_0_0, v53, v54);
    return l_createElement_0(l_l_StyledDialog_0_0, v49, v50);
end;