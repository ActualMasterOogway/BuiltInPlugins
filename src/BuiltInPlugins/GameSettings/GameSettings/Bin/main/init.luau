return function(v0, v1) --[[ Line: 1 ]]
    if not v0 then
        return;
    else
        local l_DebugBuiltInPluginModalsNotBlocking_0 = game:GetFastFlag("DebugBuiltInPluginModalsNotBlocking");
        local l_DeveloperSubscriptionsEnabled_0 = game:GetFastFlag("DeveloperSubscriptionsEnabled");
        local v4 = game:DefineFastFlag("GameSettingsRoactInspector", false);
        local v5 = game:DefineFastFlag("TranslateGameModeratedErrors", false);
        local l_GameSettingsEvictIfLostPerms_0 = game:GetFastFlag("GameSettingsEvictIfLostPerms");
        local v7 = game:DefineFastFlag("GameSettingsSupportMultiplePopups", false);
        local l_RunService_0 = game:GetService("RunService");
        local l_HttpService_0 = game:GetService("HttpService");
        local l_Parent_0 = script.Parent.Parent;
        local v11 = require(l_Parent_0.Packages.Roact);
        local v12 = require(l_Parent_0.Packages.Rodux);
        local v13 = require(l_Parent_0.Packages.Cryo);
        local v14 = require(l_Parent_0.Packages.Framework);
        local l_ContextServices_0 = v14.ContextServices;
        local l_Util_0 = v14.Util;
        local l_Promise_0 = l_Util_0.Promise;
        local v18 = require(l_Parent_0.Src.Components.MainView);
        local v19 = require(l_Parent_0.Src.Components.Dialog.SimpleDialog);
        local v20 = require(l_Parent_0.Src.Reducers.MainReducer);
        local v21 = require(l_Parent_0.Src.Components.ExternalServicesWrapper);
        local v22 = require(l_Parent_0.Src.Util.MakeTheme);
        local v23 = require(l_Parent_0.Src.ContextServices.Networking);
        local v24 = require(l_Parent_0.Pages.WorldPage.ContextServices.WorldRootPhysics);
        local v25 = require(l_Parent_0.Src.Controllers.GameInfoController);
        local v26 = require(l_Parent_0.Src.Controllers.GameMetadataController);
        local v27 = require(l_Parent_0.Src.Controllers.GroupMetadataController);
        local v28 = require(l_Parent_0.Pages.PermissionsPage.Controllers.GamePermissionsController);
        local v29 = require(l_Parent_0.Pages.OptionsPage.Controllers.GameOptionsController);
        local v30 = require(l_Parent_0.Pages.CommunicationPage.Controllers.CommunicationController);
        local v31 = require(l_Parent_0.Pages.MonetizationPage.Controllers.MonetizationController);
        local v32 = require(l_Parent_0.Pages.MonetizationPage.Controllers.DevSubsController);
        local v33 = require(l_Parent_0.Pages.PlacesPage.Controllers.PlacesController);
        local v34 = require(l_Parent_0.Src.Controllers.PolicyInfoController);
        local v35 = require(l_Parent_0.Pages.SecurityPage.Controllers.SecurityController);
        local v36 = require(l_Parent_0.Pages.PermissionsPage.Controllers.SocialController);
        local v37 = require(l_Parent_0.Pages.AvatarPage.Controllers.UniverseAvatarController);
        local v38 = require(l_Parent_0.Pages.LocalizationPage.Controllers.LocalizationPageController);
        local v39 = require(l_Parent_0.Src.Util.CurrentStatus);
        local v40 = require(l_Parent_0.Src.Actions.ResetStore);
        local v41 = require(l_Parent_0.Src.Actions.SetCurrentStatus);
        local v42 = require(l_Parent_0.Src.Actions.DiscardChanges);
        local v43 = require(l_Parent_0.Src.Actions.SetGameId);
        local v44 = require(l_Parent_0.Src.Actions.SetGame);
        local v45 = require(l_Parent_0.Src.Util.isEmpty);
        local v46 = require(l_Parent_0.Src.Util.Analytics);
        local v47 = nil;
        local v48 = nil;
        local v49 = nil;
        local v50 = nil;
        local v51 = v24.new();
        local v52 = {};
        local v53 = v23.new();
        local v54 = v25.new(v53:get());
        local v55 = v26.new(v53:get());
        local v56 = v27.new(v53:get());
        local v57 = v28.new(v53:get());
        local v58 = v31.new(v53:get());
        local v59 = l_DeveloperSubscriptionsEnabled_0 and v32.new(v53:get()) or nil;
        local v60 = v29.new(v53:get());
        local v61 = v30.new(v53:get());
        local v62 = v35.new(v53:get());
        local v63 = v36.new(v53:get());
        local v64 = v37.new(v53:get());
        local v65 = v33.new(v53:get());
        local v66 = v38.new(v53:get());
        local v67 = v34.new(v53:get());
        v52.networking = v53:get();
        v52.worldRootPhysicsController = v51:get();
        v52.gameInfoController = v54;
        v52.gameMetadataController = v55;
        v52.groupMetadataController = v56;
        v52.gamePermissionsController = v57;
        v52.gameOptionsController = v60;
        v52.communicationController = v61;
        v52.monetizationController = v58;
        v52.devSubsController = v59;
        v52.universePermissionsController = v62;
        v52.socialController = v63;
        v52.universeAvatarController = v64;
        v52.placesController = v65;
        v52.localizationPageController = v66;
        v52.policyInfoController = v67;
        local v68 = {
            (l_Util_0.ThunkWithArgsMiddleware(v52))
        };
        local v69 = v12.Store.new(v20, nil, v68);
        local l_Open_0 = v39.Open;
        local l_SourceStrings_0 = l_Parent_0.Src.Resources.SourceStrings;
        local l_LocalizedStrings_0 = l_Parent_0.Src.Resources.LocalizedStrings;
        local v73 = l_ContextServices_0.Localization.new({
            pluginName = l_Parent_0.Name, 
            stringResourceTable = l_SourceStrings_0, 
            translationResourceTable = l_LocalizedStrings_0, 
            libraries = {
                [v14.Resources.LOCALIZATION_PROJECT_NAME] = {
                    stringResourceTable = v14.Resources.SourceStrings, 
                    translationResourceTable = v14.Resources.LocalizedStrings
                }
            }
        });
        if v5 then
            v52.localization = v73;
        end;
        local function v77(v74) --[[ Line: 136 ]] --[[ Name: setMainWidgetInteractable ]]
            -- upvalues: v48 (ref)
            if v48 then
                for _, v76 in pairs(v48:GetDescendants()) do
                    if v76:IsA("GuiObject") then
                        v76.Active = v74;
                    end;
                end;
            end;
        end;
        local function v87(v78, v79) --[[ Line: 146 ]] --[[ Name: showDialog ]]
            -- upvalues: l_Promise_0 (copy), v77 (copy), v0 (copy), v7 (copy), l_HttpService_0 (copy), l_DebugBuiltInPluginModalsNotBlocking_0 (copy), v11 (copy), v21 (copy), v22 (copy), v73 (copy), v48 (ref), v13 (copy)
            return l_Promise_0.new(function(v80, _) --[[ Line: 147 ]]
                -- upvalues: v77 (ref), v79 (copy), v0 (ref), v7 (ref), l_HttpService_0 (ref), l_DebugBuiltInPluginModalsNotBlocking_0 (ref), v11 (ref), v21 (ref), v22 (ref), v73 (ref), v48 (ref), v78 (copy), v13 (ref)
                spawn(function() --[[ Line: 148 ]]
                    -- upvalues: v77 (ref), v79 (ref), v0 (ref), v7 (ref), l_HttpService_0 (ref), l_DebugBuiltInPluginModalsNotBlocking_0 (ref), v11 (ref), v21 (ref), v22 (ref), v73 (ref), v48 (ref), v78 (ref), v13 (ref), v80 (copy)
                    v77(false);
                    local v82 = nil;
                    local v83 = v79.Size or Vector2.new(473, 197);
                    local v84 = nil;
                    v84 = v0:CreateQWidgetPluginGui(if v7 then v79.Title .. l_HttpService_0:GenerateGUID() else v79.Title, {
                        Size = v83, 
                        Modal = not l_DebugBuiltInPluginModalsNotBlocking_0
                    });
                    v84.Enabled = true;
                    v84.Title = v79.Title;
                    local v86 = v11.createElement(v21, {
                        theme = v22(), 
                        mouse = v0:GetMouse(), 
                        localization = v73, 
                        pluginGui = v48, 
                        plugin = v0
                    }, {
                        Content = v11.createElement(v78, v13.Dictionary.join(v79, {
                            OnResult = function(v85) --[[ Line: 174 ]] --[[ Name: OnResult ]]
                                -- upvalues: v11 (ref), v82 (ref), v84 (ref), v77 (ref), v80 (ref)
                                v11.unmount(v82);
                                v84:Destroy();
                                v77(true);
                                v80(v85);
                            end
                        }))
                    });
                    v84:BindToClose(function() --[[ Line: 184 ]]
                        -- upvalues: v11 (ref), v82 (ref), v84 (ref), v77 (ref), v80 (ref)
                        v11.unmount(v82);
                        v84:Destroy();
                        v77(true);
                        v80(false);
                    end);
                    v82 = v11.mount(v86, v84);
                end);
            end);
        end;
        local function _(v88) --[[ Line: 196 ]] --[[ Name: closeAnalytics ]]
            -- upvalues: v49 (ref), v46 (copy)
            if v49 then
                local v89 = tick() - v49;
                v49 = nil;
                v46.onCloseEvent(v88 and "Save" or "Cancel", v89);
            end;
        end;
        local function v110(v91) --[[ Line: 205 ]] --[[ Name: closeGameSettings ]]
            -- upvalues: v69 (copy), v42 (copy), v41 (copy), v39 (copy), v48 (ref), v11 (copy), v47 (ref), v4 (copy), v50 (ref), v49 (ref), v46 (copy), v45 (copy), v73 (copy), v19 (copy), l_Promise_0 (copy), v77 (copy), v0 (copy), v7 (copy), l_HttpService_0 (copy), l_DebugBuiltInPluginModalsNotBlocking_0 (copy), v21 (copy), v22 (copy), v13 (copy)
            local v92 = v69:getState();
            local l_Status_0 = v92.Status;
            local function v96() --[[ Line: 209 ]] --[[ Name: close ]]
                -- upvalues: v69 (ref), v42 (ref), v41 (ref), v39 (ref), v48 (ref), v11 (ref), v47 (ref), v4 (ref), v50 (ref), v91 (copy), v49 (ref), v46 (ref)
                v69:dispatch(v42());
                v69:dispatch(v41(v39.Closed));
                v48.Enabled = false;
                v11.unmount(v47);
                if v4 and v50 then
                    v50:destroy();
                end;
                local l_v91_0 = v91;
                if v49 then
                    local v95 = tick() - v49;
                    v49 = nil;
                    v46.onCloseEvent(l_v91_0 and "Save" or "Cancel", v95);
                end;
            end;
            if l_Status_0 == v39.Working and not v91 then
                v96();
                return;
            else
                if l_Status_0 ~= v39.Closed then
                    if l_Status_0 == v39.Error and v91 then
                        v69:dispatch(v41(v39.Open));
                        return;
                    else
                        local l_Changed_0 = v92.Settings.Changed;
                        if l_Changed_0 and not v45(l_Changed_0) and not v91 then
                            local v98 = nil;
                            v98 = {
                                Size = Vector2.new(343, 145), 
                                Title = v73:getText("General", "CancelDialogHeader"), 
                                Header = v73:getText("General", "CancelDialogBody"), 
                                Buttons = {
                                    v73:getText("General", "ReplyNo"), 
                                    v73:getText("General", "ReplyYes")
                                }
                            };
                            local l_v19_0 = v19;
                            local l_v98_0 = v98;
                            l_Promise_0.new(function(v101, _) --[[ Line: 147 ]]
                                -- upvalues: v77 (ref), l_v98_0 (copy), v0 (ref), v7 (ref), l_HttpService_0 (ref), l_DebugBuiltInPluginModalsNotBlocking_0 (ref), v11 (ref), v21 (ref), v22 (ref), v73 (ref), v48 (ref), l_v19_0 (copy), v13 (ref)
                                spawn(function() --[[ Line: 148 ]]
                                    -- upvalues: v77 (ref), l_v98_0 (ref), v0 (ref), v7 (ref), l_HttpService_0 (ref), l_DebugBuiltInPluginModalsNotBlocking_0 (ref), v11 (ref), v21 (ref), v22 (ref), v73 (ref), v48 (ref), l_v19_0 (ref), v13 (ref), v101 (copy)
                                    v77(false);
                                    local v103 = nil;
                                    local v104 = l_v98_0.Size or Vector2.new(473, 197);
                                    local v105 = nil;
                                    v105 = v0:CreateQWidgetPluginGui(if v7 then l_v98_0.Title .. l_HttpService_0:GenerateGUID() else l_v98_0.Title, {
                                        Size = v104, 
                                        Modal = not l_DebugBuiltInPluginModalsNotBlocking_0
                                    });
                                    v105.Enabled = true;
                                    v105.Title = l_v98_0.Title;
                                    local v107 = v11.createElement(v21, {
                                        theme = v22(), 
                                        mouse = v0:GetMouse(), 
                                        localization = v73, 
                                        pluginGui = v48, 
                                        plugin = v0
                                    }, {
                                        Content = v11.createElement(l_v19_0, v13.Dictionary.join(l_v98_0, {
                                            OnResult = function(v106) --[[ Line: 174 ]] --[[ Name: OnResult ]]
                                                -- upvalues: v11 (ref), v103 (ref), v105 (ref), v77 (ref), v101 (ref)
                                                v11.unmount(v103);
                                                v105:Destroy();
                                                v77(true);
                                                v101(v106);
                                            end
                                        }))
                                    });
                                    v105:BindToClose(function() --[[ Line: 184 ]]
                                        -- upvalues: v11 (ref), v103 (ref), v105 (ref), v77 (ref), v101 (ref)
                                        v11.unmount(v103);
                                        v105:Destroy();
                                        v77(true);
                                        v101(false);
                                    end);
                                    v103 = v11.mount(v107, v105);
                                end);
                            end):andThen(function(v108) --[[ Line: 246 ]]
                                -- upvalues: v96 (copy), v69 (ref), v41 (ref), v39 (ref), v48 (ref)
                                if v108 then
                                    v96();
                                    return;
                                else
                                    v69:dispatch(v41(v39.Open));
                                    if not v48.Enabled then
                                        v48.Enabled = true;
                                    end;
                                    return;
                                end;
                            end);
                            return;
                        else
                            v69:dispatch(v41(v39.Closed));
                            v48.Enabled = false;
                            v11.unmount(v47);
                            if v4 and v50 then
                                v50:destroy();
                            end;
                            if v49 then
                                local v109 = tick() - v49;
                                v49 = nil;
                                v46.onCloseEvent(v91 and "Save" or "Cancel", v109);
                            end;
                        end;
                    end;
                end;
                return;
            end;
        end;
        local function v113() --[[ Line: 273 ]] --[[ Name: makePluginGui ]]
            -- upvalues: l_Parent_0 (copy), v48 (ref), v0 (copy), l_DebugBuiltInPluginModalsNotBlocking_0 (copy), v73 (copy), v110 (copy)
            local l_Name_0 = l_Parent_0.Name;
            local v112 = Vector2.new(960, 600);
            v48 = v0:CreateQWidgetPluginGui(l_Name_0, {
                Size = v112, 
                MinSize = v112, 
                Resizable = true, 
                Modal = not l_DebugBuiltInPluginModalsNotBlocking_0, 
                InitialEnabled = false
            });
            v48.Name = l_Parent_0.Name;
            v48.Title = v73:getText("General", "PluginName");
            v48.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            v48:BindToClose(function() --[[ Line: 287 ]]
                -- upvalues: v110 (ref)
                v110(false);
            end);
        end;
        local function v118(v114, v115, v116) --[[ Line: 293 ]] --[[ Name: openGameSettings ]]
            -- upvalues: l_GameSettingsEvictIfLostPerms_0 (copy), v69 (copy), v39 (copy), v11 (copy), v21 (copy), v87 (copy), v22 (copy), v0 (copy), v73 (copy), v48 (ref), v51 (copy), v18 (copy), v110 (copy), v40 (copy), v43 (copy), v44 (copy), v41 (copy), v47 (ref), v4 (copy), v50 (ref), v14 (copy), v46 (copy), v49 (ref)
            if l_GameSettingsEvictIfLostPerms_0 then
                game:GetService("TeamCreateService"):CloseGameIfUserDoesntHavePerms();
            end;
            if v69 and v69:getState().Status ~= v39.Closed then
                return;
            else
                local v117 = v11.createElement(v21, {
                    store = v69, 
                    showDialog = v87, 
                    theme = v22(), 
                    mouse = v0:GetMouse(), 
                    localization = v73, 
                    pluginGui = v48, 
                    plugin = v0, 
                    worldRootPhysics = v51
                }, {
                    mainView = v11.createElement(v18, {
                        OnClose = v110, 
                        FirstSelectedId = v116
                    })
                });
                v69:dispatch(v40());
                v69:dispatch(v43(v114));
                v69:dispatch(v44(v115));
                v69:dispatch(v41(v39.Open));
                v47 = v11.mount(v117, v48);
                v48.Enabled = true;
                if v4 and game:GetService("StudioService"):HasInternalPermission() then
                    v50 = v14.DeveloperTools.forPlugin("Game Settings", v0);
                    v50:addRoactTree("Roact tree", v47, v11);
                end;
                v46.onOpenEvent(v0:GetStudioUserId(), v114);
                v49 = tick();
                return;
            end;
        end;
        (function() --[[ Line: 343 ]] --[[ Name: main ]]
            -- upvalues: v0 (copy), l_Parent_0 (copy), v1 (copy), l_RunService_0 (copy), v113 (copy), v118 (copy), v69 (copy), l_Open_0 (ref), v39 (copy), v77 (copy)
            v0.Name = l_Parent_0.Name;
            local l_mainButton_0 = v1.mainButton;
            if l_RunService_0:IsEdit() then
                v113();
                l_mainButton_0.ClickableWhenViewportHidden = true;
                l_mainButton_0.Enabled = true;
                v1.mainButtonClickedSignal:Connect(function() --[[ Line: 355 ]]
                    -- upvalues: v118 (ref)
                    v118(game.GameId, game);
                end);
                v69.changed:connect(function(v120) --[[ Line: 358 ]]
                    -- upvalues: l_Open_0 (ref), l_mainButton_0 (copy), v39 (ref), v77 (ref)
                    if v120.Status ~= l_Open_0 then
                        l_mainButton_0:SetActive(v120.Status ~= v39.Closed);
                        v77(v120.Status ~= v39.Working);
                        l_Open_0 = v120.Status;
                    end;
                end);
                v1.signals["StudioService.OnOpenGameSettings"]:Connect(function(v121) --[[ Line: 367 ]]
                    -- upvalues: v118 (ref)
                    v118(game.GameId, game, v121);
                end);
                return;
            else
                l_mainButton_0.Enabled = false;
                return;
            end;
        end)();
        return;
    end;
end;