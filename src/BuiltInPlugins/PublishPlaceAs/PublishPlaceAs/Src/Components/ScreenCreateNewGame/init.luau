local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_ScrollingFrame_0 = v3.UI.ScrollingFrame;
local v7 = require(l_Parent_0.Src.Network.Requests.SettingsImpl);
local v8 = require(l_Parent_0.Src.Resources.Constants);
local l_Separator_0 = v3.UI.Separator;
local v10 = require(l_Parent_0.Src.Components.Menu.MenuBar);
local v11 = require(l_Parent_0.Src.Components.Footer);
local v12 = require(l_Parent_0.Src.Components.BasicInfo);
local v13 = require(l_Parent_0.Src.Actions.AddChange);
local v14 = require(l_Parent_0.Src.Actions.SetIsPublishing);
local v15 = require(l_Parent_0.Src.Actions.SetScreen);
local v16 = require(l_Parent_0.Src.Actions.SetPublishInfo);
local v17 = require(l_Parent_0.Src.Thunks.LoadGroups);
local v18 = require(l_Parent_0.Src.Thunks.LoadDataSharingDefault);
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
local l_sendAnalyticsToKibana_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).sendAnalyticsToKibana;
local l_game_FastInt_0 = game:GetFastInt("LuobuDevPublishAnalyticsHundredthsPercentage");
local l_TextInputDialog_0 = v3.UI.TextInputDialog;
local v23 = require(l_Parent_0.Src.Util.KeyProvider);
local v24 = v23.getOptInLocationsKeyName();
local v25 = v23.getChinaKeyName();
local v26 = v23.getLuobuStudioDevPublishKeyName();
local v27 = v23.getSelectedKeyName();
local v28 = v23.getCreateNewGameKeyName();
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local v30 = {
    "BasicInfo"
};
local v31 = v1.PureComponent:extend("ScreenCreateNewGame");
v31.init = function(v32) --[[ Line: 60 ]] --[[ Name: init ]]
    -- upvalues: v1 (copy), v25 (copy)
    v32.state = {
        selected = 1, 
        showEmailDialog = false, 
        bottomText = ""
    };
    v32.finishedConnection = nil;
    v32.changeSelection = function(v33) --[[ Line: 69 ]]
        -- upvalues: v32 (copy)
        v32:setState({
            selected = v33
        });
    end;
    v32.scrollingFrameRef = v1.createRef();
    v32.shouldShowEmailDialog = function() --[[ Line: 77 ]]
        -- upvalues: v32 (copy), v25 (ref)
        local l_ChangedOptInLocations_0 = v32.props.ChangedOptInLocations;
        if l_ChangedOptInLocations_0 and l_ChangedOptInLocations_0[v25] ~= nil then
            return l_ChangedOptInLocations_0[v25];
        else
            return false;
        end;
    end;
end;
v31.didMount = function(v35) --[[ Line: 90 ]] --[[ Name: didMount ]]
    -- upvalues: l_StudioPublishService_0 (copy)
    v35.finishedConnection = l_StudioPublishService_0.GamePublishFinished:connect(function(v36, v37) --[[ Line: 91 ]]
        -- upvalues: v35 (copy)
        if v36 and v37 ~= 0 then
            v35.props.OpenPublishSuccessfulPage(v35.props.Changed);
            return;
        else
            v35.props.OpenPublishFailPage(v35.props.Changed);
            return;
        end;
    end);
    v35.props.DispatchLoadGroups();
    v35.props.DispatchDataSharingDefault();
end;
v31.willUnmount = function(v38) --[[ Line: 103 ]] --[[ Name: willUnmount ]]
    if v38.finishedConnection then
        v38.finishedConnection:disconnect();
    end;
end;
v31.render = function(v39) --[[ Line: 109 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v10 (copy), v30 (copy), l_Separator_0 (copy), v11 (copy), l_shouldShowDevPublishLocations_0 (copy), v24 (copy), v25 (copy), v27 (copy), l_sendAnalyticsToKibana_0 (copy), v26 (copy), l_game_FastInt_0 (copy), v28 (copy), v7 (copy), v8 (copy), l_TextInputDialog_0 (copy), l_ScrollingFrame_0 (copy), v12 (copy)
    local l_props_0 = v39.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v43 = l_props_0.API:get();
    local l_OnClose_0 = l_props_0.OnClose;
    local l_ReadyToSave_0 = l_props_0.ReadyToSave;
    local l_IsPublishing_0 = l_props_0.IsPublishing;
    local l_Changed_0 = l_props_0.Changed;
    local l_IsPublish_0 = l_props_0.IsPublish;
    local l_dispatchSetIsPublishing_0 = l_props_0.dispatchSetIsPublishing;
    local l_selected_0 = v39.state.selected;
    local v51 = nil;
    v51 = l_IsPublish_0 and "Create" or "Save";
    local v57 = {
        MenuBar = v1.createElement(v10, {
            Entries = v30, 
            Selected = l_selected_0, 
            SelectionChanged = v39.changeSelection
        }), 
        Separator = v1.createElement(l_Separator_0, {
            Position = UDim2.new(0, l_Stylizer_0.MENU_BAR_WIDTH, 0.5, 0), 
            DominantAxis = Enum.DominantAxis.Height
        }), 
        Footer = v1.createElement(v11, {
            MainButton = {
                Name = v51, 
                Active = l_ReadyToSave_0 and not l_IsPublishing_0, 
                OnActivated = function() --[[ Line: 150 ]] --[[ Name: OnActivated ]]
                    -- upvalues: l_shouldShowDevPublishLocations_0 (ref), v39 (copy), v24 (ref), v25 (ref), v27 (ref), l_sendAnalyticsToKibana_0 (ref), v26 (ref), l_game_FastInt_0 (ref), v28 (ref), l_dispatchSetIsPublishing_0 (copy), v7 (ref), l_Changed_0 (copy), l_Localization_0 (copy), v43 (copy), l_IsPublish_0 (copy), l_props_0 (copy)
                    if l_shouldShowDevPublishLocations_0() and v39.shouldShowEmailDialog() then
                        v39:setState({
                            showEmailDialog = true
                        });
                        return;
                    else
                        if l_shouldShowDevPublishLocations_0() then
                            local v52 = {
                                [v24] = v25, 
                                [v27] = false
                            };
                            l_sendAnalyticsToKibana_0(v26, l_game_FastInt_0, v28, v52);
                        end;
                        l_dispatchSetIsPublishing_0(true);
                        v7.saveAll(l_Changed_0, l_Localization_0, v43, nil, l_IsPublish_0, l_props_0.OwnedGroups);
                        return;
                    end;
                end
            }, 
            OnClose = l_OnClose_0, 
            NextScreen = v8.SCREENS.CHOOSE_GAME, 
            NextScreenText = "UpdateExistingGame", 
            IsPublish = l_IsPublish_0
        }, {
            EmailDialog = v1.createElement(l_TextInputDialog_0, {
                Enabled = v39.state.showEmailDialog, 
                Size = Vector2.new(l_Stylizer_0.emailDialog.Size.X, l_Stylizer_0.emailDialog.Size.Y), 
                Title = l_Localization_0:getText(v24, "EmailDialogHeader"), 
                Header = l_Localization_0:getText(v24, "EmailDialogHeader"), 
                Buttons = {
                    {
                        Key = "Submit", 
                        Text = l_Localization_0:getText("Button", "Submit")
                    }, 
                    {
                        Key = "Cancel", 
                        Text = l_Localization_0:getText("Button", "Cancel")
                    }
                }, 
                Body = l_Localization_0:getText(v24, "EmailDialogBody"), 
                Description = l_Localization_0:getText(v24, "EmailDialogDescription"), 
                TextInput = {
                    {
                        PlaceholderText = l_Localization_0:getText(v24, "EmailAddress")
                    }, 
                    {
                        PlaceholderText = l_Localization_0:getText(v24, "ConfirmEmailAddress"), 
                        BottomText = v39.state.bottomText
                    }
                }, 
                OnClose = function() --[[ Line: 198 ]] --[[ Name: OnClose ]]
                    -- upvalues: v39 (copy)
                    v39:setState({
                        showEmailDialog = false, 
                        bottomText = ""
                    });
                end, 
                OnButtonPressed = function(v53, v54, v55) --[[ Line: 204 ]] --[[ Name: OnButtonPressed ]]
                    -- upvalues: v24 (ref), v25 (ref), v27 (ref), l_sendAnalyticsToKibana_0 (ref), v26 (ref), l_game_FastInt_0 (ref), v28 (ref), v39 (copy), l_dispatchSetIsPublishing_0 (copy), v7 (ref), l_Changed_0 (copy), l_Localization_0 (copy), v43 (copy), l_IsPublish_0 (copy), l_props_0 (copy)
                    if v53 == "Submit" then
                        local v56 = {
                            [v24] = v25, 
                            [v27] = true
                        };
                        l_sendAnalyticsToKibana_0(v26, l_game_FastInt_0, v28, v56);
                        if v54 == v55 then
                            v39:setState({
                                showEmailDialog = false, 
                                bottomText = ""
                            });
                            l_dispatchSetIsPublishing_0(true);
                            v7.saveAll(l_Changed_0, l_Localization_0, v43, v54, l_IsPublish_0, l_props_0.OwnedGroups);
                            return;
                        else
                            v39:setState({
                                bottomText = l_Localization_0:getText(v24, "ErrorEmailNotEqual")
                            });
                            return;
                        end;
                    else
                        v39:setState({
                            showEmailDialog = false, 
                            bottomText = ""
                        });
                        return;
                    end;
                end
            })
        }), 
        Page = v1.createElement(l_ScrollingFrame_0, {
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, l_Stylizer_0.MENU_BAR_WIDTH, 0, 0), 
            Size = UDim2.new(1, -l_Stylizer_0.MENU_BAR_WIDTH, 1, -l_Stylizer_0.FOOTER_HEIGHT), 
            CanvasSize = UDim2.new(1, -l_Stylizer_0.MENU_BAR_WIDTH, 0, 0), 
            AutomaticCanvasSize = Enum.AutomaticSize.Y, 
            [v1.Ref] = v39.scrollingFrameRef
        }, {
            v1.createElement(v12, {
                IsPublish = l_IsPublish_0
            })
        })
    };
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_0.backgroundColor
    }, v57);
end;
v31 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    API = l_ContextServices_0.API
})(v31);
return v2.connect(function(v58, _) --[[ Line: 265 ]] --[[ Name: mapStateToProps ]]
    local l_NewGameSettings_0 = v58.NewGameSettings;
    local l_ownedGroups_0 = v58.GroupsHavePermission.groupInfo.ownedGroups;
    return {
        Changed = l_NewGameSettings_0.changed, 
        ReadyToSave = next(l_NewGameSettings_0.errors) == nil, 
        IsPublishing = v58.PublishedPlace.isPublishing, 
        ChangedOptInLocations = l_NewGameSettings_0.changed.OptInLocations, 
        OwnedGroups = l_ownedGroups_0
    };
end, function(v62) --[[ Line: 277 ]] --[[ Name: useDispatchForProps ]]
    -- upvalues: v16 (copy), v15 (copy), v8 (copy), v17 (copy), v18 (copy), v14 (copy), v13 (copy)
    return {
        OpenPublishSuccessfulPage = function(v63) --[[ Line: 279 ]] --[[ Name: OpenPublishSuccessfulPage ]]
            -- upvalues: v62 (copy), v16 (ref), v15 (ref), v8 (ref)
            v62(v16({
                id = game.GameId, 
                name = v63.name, 
                parentGameName = v63.name
            }));
            v62(v15(v8.SCREENS.PUBLISH_SUCCESSFUL));
        end, 
        OpenPublishFailPage = function(v64) --[[ Line: 283 ]] --[[ Name: OpenPublishFailPage ]]
            -- upvalues: v62 (copy), v16 (ref), v15 (ref), v8 (ref)
            v62(v16({
                id = game.GameId, 
                name = v64.name, 
                parentGameName = v64.name, 
                parentGameId = 0, 
                settings = v64, 
                failed = true
            }));
            v62(v15(v8.SCREENS.PUBLISH_FAIL));
        end, 
        DispatchLoadGroups = function() --[[ Line: 294 ]] --[[ Name: DispatchLoadGroups ]]
            -- upvalues: v62 (copy), v17 (ref)
            v62(v17());
        end, 
        DispatchDataSharingDefault = function() --[[ Line: 297 ]] --[[ Name: DispatchDataSharingDefault ]]
            -- upvalues: v62 (copy), v18 (ref)
            v62(v18());
        end, 
        dispatchSetIsPublishing = function(v65) --[[ Line: 300 ]] --[[ Name: dispatchSetIsPublishing ]]
            -- upvalues: v62 (copy), v14 (ref)
            v62(v14(v65));
        end, 
        dispatchSetExistingUniverseConfiguration = function(v66) --[[ Line: 303 ]] --[[ Name: dispatchSetExistingUniverseConfiguration ]]
            -- upvalues: v62 (copy), v13 (ref)
            v62(v13("name", v66.name));
            if v66.description then
                v62(v13("description", v66.description));
            end;
            if v66.genre then
                v62(v13("genre", v66.genre));
            end;
        end
    };
end)(v31);