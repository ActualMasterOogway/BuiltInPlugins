local l_game_FastInt_0 = game:GetFastInt("LuobuDevPublishAnalyticsHundredthsPercentage");
local l_GameSettingsAddCreatorHubLinkToFooter_0 = game:GetFastFlag("GameSettingsAddCreatorHubLinkToFooter");
local l_game_FastString_0 = game:GetFastString("GameSettingsCreatorHubManageExperienceLink");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_Promise_0 = v6.Util.Promise;
local l_RoactStudioWidgets_0 = l_Parent_0.Packages.RoactStudioWidgets;
local v9 = require(l_RoactStudioWidgets_0.Hyperlink);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_Parent_0.Src.ContextServices.Dialog);
local v13 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v14 = require(l_Parent_0.Src.Util.isEmpty);
local v15 = require(l_Parent_0.Src.Components.ButtonBar);
local v16 = require(l_Parent_0.Src.Thunks.ConfirmAndSaveChanges);
local v17 = require(l_Parent_0.Src.Thunks.PostContactEmail);
local v18 = require(l_Parent_0.Src.Util.CurrentStatus);
local l_TextInputDialog_0 = v6.UI.TextInputDialog;
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.GameSettingsUtilities).shouldShowDevPublishLocations;
local l_sendAnalyticsToKibana_0 = require(l_Parent_0.Src.Util.GameSettingsUtilities).sendAnalyticsToKibana;
local v22 = require(l_Parent_0.Src.Util.KeyProvider);
local v23 = v22.getOptInLocationsKeyName();
local v24 = v22.getChinaKeyName();
local v25 = v22.getSelectedKeyName();
local v26 = v22.getFooterKeyName();
local v27 = v22.getLuobuStudioDevPublishKeyName();
local v28 = v4.PureComponent:extend("Footer");
local l_GuiService_0 = game:GetService("GuiService");
v28.saveAllSettings = function(v30, v31) --[[ Line: 55 ]] --[[ Name: saveAllSettings ]]
    local l_props_0 = v30.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Dialog_0 = l_props_0.Dialog;
    v30.props.SaveAllSettings(v31, l_Localization_0, l_Dialog_0):andThen(function() --[[ Line: 60 ]]
        -- upvalues: v30 (copy), v31 (copy)
        v30.props.OnClose(v31);
    end);
end;
v28.init = function(v35) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v24 (copy), v25 (copy)
    v35.shouldShowEmailDialog = function() --[[ Line: 66 ]]
        -- upvalues: v35 (copy), v24 (ref), v25 (ref)
        local l_props_1 = v35.props;
        local l_CurrentOptInLocations_0 = l_props_1.CurrentOptInLocations;
        local l_ChangedOptInLocations_0 = l_props_1.ChangedOptInLocations;
        if not l_CurrentOptInLocations_0 then
            assert(not l_ChangedOptInLocations_0);
            return false;
        elseif not l_CurrentOptInLocations_0[v24][v25] and l_ChangedOptInLocations_0 then
            assert(l_ChangedOptInLocations_0[v24][v25], "China should be selected in Changed");
            return true;
        else
            return false;
        end;
    end;
    v35.state = {
        showEmailDialog = false, 
        userPressedSave = false, 
        bottomText = ""
    };
end;
v28.render = function(v39) --[[ Line: 92 ]] --[[ Name: render ]]
    -- upvalues: l_GameSettingsAddCreatorHubLinkToFooter_0 (copy), v4 (copy), v13 (copy), v9 (copy), l_GuiService_0 (copy), l_game_FastString_0 (copy), v15 (copy), l_shouldShowDevPublishLocations_0 (copy), v24 (copy), v25 (copy), v23 (copy), l_sendAnalyticsToKibana_0 (copy), v27 (copy), l_game_FastInt_0 (copy), v26 (copy), l_TextInputDialog_0 (copy)
    local l_props_2 = v39.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_Localization_1 = l_props_2.Localization;
    local l_SaveActive_0 = l_props_2.SaveActive;
    local l_CancelActive_0 = l_props_2.CancelActive;
    local l_PostContactEmail_0 = l_props_2.PostContactEmail;
    local v46 = nil;
    local v47 = nil;
    local v48 = nil;
    if l_GameSettingsAddCreatorHubLinkToFooter_0 then
        local function _(v49, v50, v51) --[[ Line: 106 ]] --[[ Name: calculateTextSize ]]
            local v52 = Vector2.new(5000, 5000);
            return game:GetService("TextService"):GetTextSize(v49, v50, v51, v52);
        end;
        v46 = l_Localization_1:getText("General", "CreatorHubManageLink");
        v47 = game.GameId;
        local l_v46_0 = v46;
        local l_SourceSans_0 = Enum.Font.SourceSans;
        local v56 = Vector2.new(5000, 5000);
        v48 = game:GetService("TextService"):GetTextSize(l_v46_0, 22, l_SourceSans_0, v56);
    end;
    return v4.createElement("Frame", {
        BackgroundColor3 = l_Stylizer_0.backgroundColor, 
        BorderSizePixel = 0, 
        Size = UDim2.fromScale(1, 1), 
        ZIndex = 2
    }, {
        Gradient = v4.createElement("ImageLabel", {
            Size = UDim2.new(1, 0, 0, 3), 
            AnchorPoint = Vector2.new(0, 1), 
            Image = v13.GRADIENT_IMAGE, 
            ImageRectSize = v13.GRADIENT_RECT_SIZE, 
            BorderSizePixel = 0, 
            BackgroundTransparency = 1, 
            ImageColor3 = l_Stylizer_0.footer.gradient, 
            ImageTransparency = 0.9, 
            ZIndex = 1
        }), 
        CreatorDocsLink = if l_GameSettingsAddCreatorHubLinkToFooter_0 then v4.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 16, 0.5, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Hyperlink = v4.createElement(v9, {
                Text = v46, 
                TextSize = 20, 
                Size = UDim2.new(0, v48.X, 0, v48.Y), 
                Enabled = true, 
                Mouse = l_props_2.Mouse, 
                OnClick = function() --[[ Line: 149 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_GuiService_0 (ref), l_game_FastString_0 (ref), v47 (ref)
                    l_GuiService_0:OpenBrowserWindow(l_game_FastString_0:gsub("{}", (("%*"):format(v47))));
                end
            })
        }) else nil, 
        SaveSettings = v4.createElement(v15, {
            ZIndex = 2, 
            Buttons = {
                {
                    Name = l_Localization_1:getText("General", "ButtonCancel"), 
                    Active = l_CancelActive_0, 
                    Value = false
                }, 
                {
                    Name = l_Localization_1:getText("General", "ButtonSave"), 
                    Default = true, 
                    Active = l_SaveActive_0, 
                    Value = true
                }
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
            ButtonClicked = function(v57) --[[ Line: 170 ]] --[[ Name: ButtonClicked ]]
                -- upvalues: l_shouldShowDevPublishLocations_0 (ref), v39 (copy), v24 (ref), v25 (ref), v23 (ref), l_sendAnalyticsToKibana_0 (ref), v27 (ref), l_game_FastInt_0 (ref), v26 (ref)
                if v57 and l_shouldShowDevPublishLocations_0() and v39.shouldShowEmailDialog() then
                    v39:setState({
                        showEmailDialog = true, 
                        userPressedSave = v57
                    });
                    return;
                else
                    if v57 and l_shouldShowDevPublishLocations_0() and v39.props.CurrentOptInLocations and v39.props.CurrentOptInLocations[v24][v25] then
                        local v58 = {
                            [v23] = v24
                        };
                        if not v39.props.ChangedOptInLocations then
                            v58.selected = true;
                        else
                            assert(not v39.props.ChangedOptInLocations[v24][v25]);
                            v58.selected = false;
                        end;
                        l_sendAnalyticsToKibana_0(v27, l_game_FastInt_0, v26, v58);
                    end;
                    v39:saveAllSettings(v57);
                    return;
                end;
            end
        }, {
            EmailDialog = v4.createElement(l_TextInputDialog_0, {
                Enabled = v39.state.showEmailDialog, 
                Size = Vector2.new(l_Stylizer_0.emailDialog.Size.X, l_Stylizer_0.emailDialog.Size.Y), 
                Title = l_Localization_1:getText(v23, "EmailDialogHeader"), 
                Header = l_Localization_1:getText(v23, "EmailDialogHeader"), 
                Buttons = {
                    {
                        Key = "Submit", 
                        Text = l_Localization_1:getText("General", "ButtonSubmit")
                    }, 
                    {
                        Key = "Cancel", 
                        Text = l_Localization_1:getText("General", "ButtonCancel")
                    }
                }, 
                Body = l_Localization_1:getText(v23, "EmailDialogBody"), 
                Description = l_Localization_1:getText(v23, "EmailDialogDescription"), 
                TextInput = {
                    {
                        PlaceholderText = l_Localization_1:getText(v23, "EmailAddress")
                    }, 
                    {
                        PlaceholderText = l_Localization_1:getText(v23, "ConfirmEmailAddress"), 
                        BottomText = v39.state.bottomText
                    }
                }, 
                OnClose = function() --[[ Line: 219 ]] --[[ Name: OnClose ]]
                    -- upvalues: v39 (copy)
                    v39:setState({
                        showEmailDialog = false, 
                        userPressedSave = false, 
                        bottomText = ""
                    });
                end, 
                OnButtonPressed = function(v59, v60, v61) --[[ Line: 226 ]] --[[ Name: OnButtonPressed ]]
                    -- upvalues: v23 (ref), v24 (ref), v25 (ref), l_sendAnalyticsToKibana_0 (ref), v27 (ref), l_game_FastInt_0 (ref), v26 (ref), l_PostContactEmail_0 (copy), v39 (copy), l_Localization_1 (copy)
                    if v59 == "Submit" then
                        if v60 == v61 then
                            local v62 = {
                                [v23] = v24, 
                                [v25] = true
                            };
                            l_sendAnalyticsToKibana_0(v27, l_game_FastInt_0, v26, v62);
                            local v63 = l_PostContactEmail_0(v60);
                            if not v63 then
                                v39:saveAllSettings(v39.state.userPressedSave);
                                v39:setState({
                                    showEmailDialog = false, 
                                    userPressedSave = false, 
                                    bottomText = ""
                                });
                                return;
                            else
                                local v64 = l_Localization_1:getText(v23, "EmailSubmitFailure") .. v63;
                                warn(v64);
                                return;
                            end;
                        else
                            v39:setState({
                                bottomText = l_Localization_1:getText(v23, "ErrorEmailNotEqual")
                            });
                            return;
                        end;
                    else
                        v39:setState({
                            showEmailDialog = false, 
                            userPressedSave = false, 
                            bottomText = ""
                        });
                        return;
                    end;
                end
            })
        })
    });
end;
v28 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Dialog = v12
})(v28);
return (v5.connect(function(v65, _) --[[ Line: 277 ]]
    -- upvalues: v14 (copy), v18 (copy), v23 (copy)
    if not v65 then
        return;
    else
        return {
            SaveActive = not v14(v65.Settings.Changed) and v65.Status == v18.Open and v14(v65.Settings.Errors), 
            CancelActive = v65.Status == v18.Open, 
            CurrentOptInLocations = v65.Settings.Current[v23], 
            ChangedOptInLocations = v65.Settings.Changed[v23]
        };
    end;
end, function(v67) --[[ Line: 289 ]]
    -- upvalues: v16 (copy), l_Promise_0 (copy), v17 (copy)
    return {
        SaveAllSettings = function(v68, ...) --[[ Line: 291 ]] --[[ Name: SaveAllSettings ]]
            -- upvalues: v67 (copy), v16 (ref), l_Promise_0 (ref)
            if v68 then
                return v67(v16(...));
            else
                return l_Promise_0.resolve();
            end;
        end, 
        PostContactEmail = function(v69) --[[ Line: 299 ]] --[[ Name: PostContactEmail ]]
            -- upvalues: v67 (copy), v17 (ref)
            return v67(v17(v69));
        end
    };
end)(v28));