local l_game_FastInt_0 = game:GetFastInt("LuobuDevPublishAnalyticsHundredthsPercentage");
local l_game_FastString_0 = game:GetFastString("TeamCreateLink");
local l_game_FastString_1 = game:GetFastString("StudioGenreOverhaulExplainationLink");
local l_RemoveNoDevicesError_0 = game:GetFastFlag("RemoveNoDevicesError");
local l_CU1320ExperienceGenre_0 = game:GetFastFlag("CU1320ExperienceGenre");
local l_Parent_0 = script.Parent.Parent.Parent;
local v6 = require(l_Parent_0.Packages.Roact);
local v7 = require(l_Parent_0.Packages.Cryo);
local v8 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v8.UI;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_LinkText_0 = l_UI_0.LinkText;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Separator_0 = v8.UI.Separator;
local l_Image_0 = l_UI_0.Image;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextWithInlineLink_0 = l_UI_0.TextWithInlineLink;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_Dash_0 = v8.Dash;
local v22 = require(l_Parent_0.Src.Components.TeachingCallout);
local v23 = require(l_Parent_0.Src.Components.Header);
local v24 = require(l_Parent_0.Src.Components.PlatformSelect);
local v25 = require(l_Parent_0.Src.Components.CheckBoxSet);
local v26 = require(l_Parent_0.Src.Components.ToggleButtonWithTitle);
local v27 = require(l_Parent_0.Src.Thunks.GetPlayerAcceptances);
local v28 = require(l_Parent_0.Src.Actions.AddChange);
local v29 = require(l_Parent_0.Src.Actions.AddErrors);
local v30 = require(l_Parent_0.Src.Actions.SetSelectedGroup);
local v31 = require(l_Parent_0.Src.Resources.Constants);
local v32 = require(l_Parent_0.Src.Components.createMenuPage);
local l_GuiService_0 = game:GetService("GuiService");
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
local l_getOptInLocationsRequirementsLink_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).getOptInLocationsRequirementsLink;
local l_sendAnalyticsToKibana_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).sendAnalyticsToKibana;
local l_getPlayerAppDownloadLink_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).getPlayerAppDownloadLink;
local l_calculateTextSize_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).calculateTextSize;
local v39 = require(l_Parent_0.Src.Util.KeyProvider);
local v40 = v39.getOptInLocationsKeyName();
local v41 = v39.getChinaKeyName();
local v42 = v39.getLuobuStudioDevPublishKeyName();
local v43 = v39.getCheckboxToggleKeyName();
local v44 = v39.getSelectedKeyName();
local v45 = v39.getTermsOfUseDialogKeyName();
local v46 = v39.getButtonClickedKeyName();
local l_LayoutOrderIterator_0 = v8.Util.LayoutOrderIterator;
local v48 = require(l_Parent_0.Src.Components.DataSharingToggle);
local v49 = false;
local function v114(v50) --[[ Line: 97 ]] --[[ Name: displayContents ]]
    -- upvalues: l_RemoveNoDevicesError_0 (copy), v7 (copy), v31 (copy), v49 (ref), l_LayoutOrderIterator_0 (copy), l_calculateTextSize_0 (copy), v40 (copy), v6 (copy), v23 (copy), l_TitledFrame_0 (copy), l_TextInput_0 (copy), l_Separator_0 (copy), l_SelectInput_0 (copy), l_CU1320ExperienceGenre_0 (copy), l_TextWithInlineLink_0 (copy), l_GuiService_0 (copy), l_game_FastString_1 (copy), l_Dash_0 (copy), v24 (copy), v26 (copy), l_game_FastString_0 (copy), v22 (copy), v48 (copy), l_shouldShowDevPublishLocations_0 (copy), v25 (copy), v41 (copy), l_TextLabel_0 (copy), l_LinkText_0 (copy), l_getOptInLocationsRequirementsLink_0 (copy), v44 (copy), l_sendAnalyticsToKibana_0 (copy), v42 (copy), l_game_FastInt_0 (copy), v43 (copy), l_Image_0 (copy), l_Tooltip_0 (copy), l_HoverArea_0 (copy), l_StyledDialog_0 (copy), v46 (copy), v45 (copy), l_getPlayerAppDownloadLink_0 (copy)
    local l_props_0 = v50.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_Description_0 = l_props_0.Description;
    local l_DescriptionChanged_0 = l_props_0.DescriptionChanged;
    local l_DescriptionError_0 = l_props_0.DescriptionError;
    local l_Devices_0 = l_props_0.Devices;
    local l_DevicesChanged_0 = l_props_0.DevicesChanged;
    local v59 = if l_RemoveNoDevicesError_0 then nil else l_props_0.DevicesError;
    local l_Genre_0 = l_props_0.Genre;
    local l_GenreChanged_0 = l_props_0.GenreChanged;
    local l_Name_0 = l_props_0.Name;
    local l_NameChanged_0 = l_props_0.NameChanged;
    local l_NameError_0 = l_props_0.NameError;
    local l_CreatorId_0 = l_props_0.CreatorId;
    local l_Groups_0 = l_props_0.Groups;
    local l_CreatorChanged_0 = l_props_0.CreatorChanged;
    local l_OptInLocations_0 = l_props_0.OptInLocations;
    local l_OptInLocationsChanged_0 = l_props_0.OptInLocationsChanged;
    local l_PlayerAcceptance_0 = l_props_0.PlayerAcceptance;
    local l_SelectedGroup_0 = l_props_0.SelectedGroup;
    local l_OwnedGroups_0 = l_props_0.OwnedGroups;
    if l_SelectedGroup_0 then
        l_CreatorChanged_0(l_SelectedGroup_0);
    end;
    local v74 = v7.List.map(v31.GENRE_IDS, function(v73) --[[ Line: 126 ]]
        -- upvalues: l_Localization_0 (copy)
        return {
            Key = v73, 
            Text = l_Localization_0:getText("Genre", v73)
        };
    end);
    local v75 = 1;
    local _ = function(_, v77) --[[ Line: 132 ]]
        -- upvalues: v74 (copy), l_GenreChanged_0 (copy)
        local l_Key_0 = v74[v77].Key;
        l_GenreChanged_0(l_Key_0);
    end;
    local v80 = {};
    for v81, v82 in pairs(v74) do
        table.insert(v80, v82.Text);
        if l_Genre_0 == v82.Key then
            v75 = v81;
        end;
    end;
    local v83 = {
        {
            Key = 0, 
            Type = v31.SUBJECT_TYPE.USER, 
            Text = l_Localization_0:getText("GroupDropdown", "Me")
        }
    };
    local v84 = 1;
    local function v88(_, v86) --[[ Line: 149 ]]
        -- upvalues: v83 (copy), l_CreatorChanged_0 (copy), l_props_0 (copy)
        local l_Key_1 = v83[v86].Key;
        l_CreatorChanged_0(l_Key_1);
        l_props_0.DispatchSetSelectedGroup(l_Key_1);
    end;
    if l_Groups_0 and next(l_Groups_0) ~= nil then
        for _, v90 in pairs(l_Groups_0) do
            table.insert(v83, {
                Key = v90.groupId, 
                Type = v31.SUBJECT_TYPE.GROUP, 
                Text = v90.name
            });
        end;
        if not v49 then
            v49 = true;
            for _, v92 in ipairs(v83) do
                if game.CreatorId == v92.Key and game.CreatorType == Enum.CreatorType.Group then
                    l_CreatorChanged_0(v92.Key);
                end;
            end;
        end;
    end;
    local v93 = {};
    for v94, v95 in ipairs(v83) do
        table.insert(v93, v95.Text);
        if l_CreatorId_0 == v95.Key then
            v84 = v94;
        end;
    end;
    local v96 = utf8.len(l_Name_0);
    local v97 = utf8.len(l_Description_0);
    local v98 = l_LayoutOrderIterator_0.new();
    local v99 = l_calculateTextSize_0(l_Localization_0:getText(v40, "RequirementsLinkText"), 14, "SourceSans");
    local v103 = {
        Header = v6.createElement(v23, {
            Title = l_Localization_0:getText("MenuItem", "BasicInfo"), 
            LayoutOrder = v98:getNextOrder()
        }), 
        Name = v6.createElement(l_TitledFrame_0, {
            LayoutOrder = v98:getNextOrder(), 
            Title = l_Localization_0:getText("PageTitle", "Name")
        }, {
            TextBox = v6.createElement(l_TextInput_0, {
                ErrorText = l_NameError_0 and l_Localization_0:getText("Error", l_NameError_0, {
                    tostring(v96), 
                    (tostring(50))
                }), 
                MaxLength = 50, 
                OnTextChanged = l_NameChanged_0, 
                Text = l_Name_0
            })
        }), 
        Description = v6.createElement(l_TitledFrame_0, {
            LayoutOrder = v98:getNextOrder(), 
            Title = l_Localization_0:getText("PageTitle", "Description")
        }, {
            TextBox = v6.createElement(l_TextInput_0, {
                ErrorText = l_DescriptionError_0 and l_Localization_0:getText("Error", l_DescriptionError_0, {
                    tostring(v97), 
                    (tostring(1000))
                }), 
                Height = l_Stylizer_0.descriptionBox.textBoxHeight, 
                MaxLength = 1000, 
                MultiLine = true, 
                OnTextChanged = l_DescriptionChanged_0, 
                Text = l_Description_0
            })
        }), 
        Separator1 = v6.createElement(l_Separator_0, {
            LayoutOrder = v98:getNextOrder()
        }), 
        Creator = v6.createElement(l_TitledFrame_0, {
            LayoutOrder = v98:getNextOrder(), 
            Title = l_Localization_0:getText("PageTitle", "Creator")
        }, {
            Selector = v6.createElement(l_SelectInput_0, {
                Items = v93, 
                SelectedIndex = v84, 
                OnItemActivated = v88, 
                Width = l_Stylizer_0.selectInput.width.creator
            })
        }), 
        Separator2 = v6.createElement(l_Separator_0, {
            LayoutOrder = v98:getNextOrder()
        }), 
        Genre = if l_CU1320ExperienceGenre_0 then nil else v6.createElement(l_TitledFrame_0, {
            LayoutOrder = v98:getNextOrder(), 
            Title = l_Localization_0:getText("PageTitle", "Genre")
        }, {
            Body = v6.createElement(l_TextWithInlineLink_0, {
                OnLinkClicked = function() --[[ Line: 253 ]] --[[ Name: OnLinkClicked ]]
                    -- upvalues: l_GuiService_0 (ref), l_game_FastString_1 (ref)
                    l_GuiService_0:OpenBrowserWindow(l_game_FastString_1);
                end, 
                Text = l_Localization_0:getText("General", "GenreReplacementMessage"), 
                LinkText = l_Localization_0:getText("General", "GenreOverhaulMessageLink"), 
                LinkPlaceholder = "[link]", 
                MaxWidth = l_Stylizer_0.textWithInlineLink.maxWidth, 
                TextProps = l_Dash_0.join(l_Stylizer_0.fontStyle.Subtext, {
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }), 
                TextWrapped = true, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left
            })
        }), 
        Separator4 = if l_CU1320ExperienceGenre_0 then nil else v6.createElement(l_Separator_0, {
            LayoutOrder = v98:getNextOrder()
        }), 
        Devices = v6.createElement(v24, {
            LayoutOrder = v98:getNextOrder(), 
            Devices = l_Devices_0, 
            DevicesError = if l_RemoveNoDevicesError_0 then nil else v59, 
            DeviceSelected = function(v100, v101) --[[ Line: 279 ]] --[[ Name: DeviceSelected ]]
                -- upvalues: v7 (ref), l_Devices_0 (copy), l_DevicesChanged_0 (copy)
                local v102 = v7.Dictionary.join(l_Devices_0, {
                    [v100] = v101
                });
                l_DevicesChanged_0(v102);
            end
        }), 
        Separator3 = v6.createElement(l_Separator_0, {
            LayoutOrder = v98:getNextOrder()
        }), 
        EnableTeamCreate = v6.createElement(v26, {
            Title = l_Localization_0:getText("TeamCreate", "Title"), 
            LayoutOrder = v98:getNextOrder(), 
            Disabled = false, 
            Selected = l_props_0.TeamCreateEnabled, 
            LinkProps = {
                Text = l_Localization_0:getText("TeamCreate", "LinkDescription"), 
                LinkText = l_Localization_0:getText("TeamCreate", "LinkText"), 
                OnLinkClicked = function() --[[ Line: 299 ]] --[[ Name: OnLinkClicked ]]
                    -- upvalues: l_GuiService_0 (ref), l_game_FastString_0 (ref)
                    l_GuiService_0:OpenBrowserWindow(l_game_FastString_0);
                end
            }, 
            OnClick = function() --[[ Line: 303 ]] --[[ Name: OnClick ]]
                -- upvalues: l_props_0 (copy)
                l_props_0.TeamCreateEnabledChanged(not l_props_0.TeamCreateEnabled);
            end
        }, {
            TeachingCallout = v6.createElement(v22, {
                DefinitionId = "PublishPlaceAsTeamCreateToggleCallout", 
                LocationId = "TeamCreateToggle"
            })
        })
    };
    local v105 = l_Dash_0.find(l_OwnedGroups_0, function(v104) --[[ Line: 314 ]]
        -- upvalues: l_CreatorId_0 (copy)
        return v104 == l_CreatorId_0;
    end) ~= nil;
    local v106 = true;
    if l_CreatorId_0 ~= 0 then
        v106 = v105;
    end;
    v103.DataSharing = v6.createElement(v48, {
        DataSharingEnabled = l_props_0.DataSharingEnabled, 
        DataSharingDefault = l_props_0.DataSharingDefault, 
        LayoutOrder = v98:getNextOrder(), 
        isOwningCreator = v106, 
        OnClick = function() --[[ Line: 323 ]] --[[ Name: OnClick ]]
            -- upvalues: l_props_0 (copy)
            l_props_0.DataSharingEnabledChanged(not l_props_0.DataSharingEnabled);
        end
    });
    if l_props_0.IsPublish and l_shouldShowDevPublishLocations_0() then
        v103.Separator5 = v6.createElement(l_Separator_0, {
            LayoutOrder = v98:getNextOrder()
        });
        v103.OptInLocations = v6.createElement(v25, {
            Title = l_Localization_0:getText(v40, "TitleOptInLocations"), 
            LayoutOrder = v98:getNextOrder(), 
            MaxHeight = l_Stylizer_0.optInLocations.height, 
            Boxes = {
                {
                    Id = v41, 
                    Title = l_Localization_0:getText(v40, v41), 
                    Selected = if l_OptInLocations_0 then l_OptInLocations_0.China else false, 
                    LinkTextFrame = v6.createElement("Frame", {
                        BackgroundTransparency = 1, 
                        Size = UDim2.new(0, l_Stylizer_0.requirementsLink.length, 0, l_Stylizer_0.requirementsLink.height), 
                        Position = UDim2.new(0, 0, 0, l_Stylizer_0.requirementsLink.paddingY)
                    }, {
                        LinkTextLabel = v6.createElement(l_TextLabel_0, {
                            Position = UDim2.new(0, v99.X, 0, 0), 
                            Size = UDim2.new(1, -v99.X, 1, 0), 
                            Style = "Body", 
                            Text = l_Localization_0:getText(v40, "ChinaRequirements"), 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top
                        }), 
                        LinkText = v6.createElement(l_LinkText_0, {
                            OnClick = function() --[[ Line: 358 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_getOptInLocationsRequirementsLink_0 (ref), v41 (ref), l_GuiService_0 (ref)
                                local v107 = l_getOptInLocationsRequirementsLink_0(v41);
                                l_GuiService_0:OpenBrowserWindow(v107);
                            end, 
                            Size = UDim2.new(0, v99.X, 0, v99.Y), 
                            Style = "Body", 
                            Text = l_Localization_0:getText(v40, "RequirementsLinkText")
                        })
                    })
                }
            }, 
            Enabled = l_OptInLocations_0 ~= nil, 
            EntryClicked = function(v108) --[[ Line: 370 ]] --[[ Name: EntryClicked ]]
                -- upvalues: l_PlayerAcceptance_0 (copy), v50 (copy), v7 (ref), l_OptInLocations_0 (copy), v40 (ref), v44 (ref), l_sendAnalyticsToKibana_0 (ref), v42 (ref), l_game_FastInt_0 (ref), v43 (ref), l_OptInLocationsChanged_0 (copy)
                if not l_PlayerAcceptance_0 then
                    v50:setState({
                        showDialog = true
                    });
                    return;
                else
                    local v109 = v7.Dictionary.join(l_OptInLocations_0, {
                        [v108.Id] = v108.Selected and v7.None or not v108.Selected
                    });
                    local v110 = {
                        [v40] = v108.Id, 
                        [v44] = not v108.Selected
                    };
                    l_sendAnalyticsToKibana_0(v42, l_game_FastInt_0, v43, v110);
                    l_OptInLocationsChanged_0(v109);
                    return;
                end;
            end, 
            Tooltip = v6.createElement(l_Image_0, {
                Size = UDim2.fromOffset(l_Stylizer_0.tooltipIcon.size, l_Stylizer_0.tooltipIcon.size), 
                Position = UDim2.new(0, 0, 0, l_Stylizer_0.tooltipIcon.paddingY), 
                Style = "TooltipStyle", 
                StyleModifier = v50.state.StyleModifier
            }, {
                v6.createElement(l_Tooltip_0, {
                    Text = l_Localization_0:getText(v40, "Tooltip")
                }), 
                v6.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand", 
                    MouseEnter = v50.onMouseEnter, 
                    MouseLeave = v50.onMouseLeave
                })
            })
        });
        v103.Dialog = v6.createElement(l_StyledDialog_0, {
            Enabled = v50.state.showDialog, 
            Modal = true, 
            Title = "", 
            MinContentSize = Vector2.new(l_Stylizer_0.dialog.minSize.width, l_Stylizer_0.dialog.minSize.height), 
            Buttons = {
                {
                    Key = "OK", 
                    Text = l_Localization_0:getText("General", "ReplyOK")
                }
            }, 
            OnButtonPressed = function() --[[ Line: 417 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: v50 (copy), v46 (ref), l_sendAnalyticsToKibana_0 (ref), v42 (ref), l_game_FastInt_0 (ref), v45 (ref)
                v50:setState({
                    showDialog = false
                });
                local v111 = {
                    [v46] = "OK"
                };
                l_sendAnalyticsToKibana_0(v42, l_game_FastInt_0, v45, v111);
            end, 
            OnClose = function() --[[ Line: 431 ]] --[[ Name: OnClose ]]
                -- upvalues: v50 (copy), v46 (ref), l_sendAnalyticsToKibana_0 (ref), v42 (ref), l_game_FastInt_0 (ref), v45 (ref)
                v50:setState({
                    showDialog = false
                });
                local v112 = {
                    [v46] = "Close"
                };
                l_sendAnalyticsToKibana_0(v42, l_game_FastInt_0, v45, v112);
            end, 
            ButtonHorizontalAlignment = Enum.HorizontalAlignment.Center
        }, {
            Layout = v6.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            Header = v6.createElement("TextLabel", v7.Dictionary.join(l_Stylizer_0.fontStyle.Title, {
                Position = UDim2.new(0.5, 0, 0, 45), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, 0, 0, 60), 
                BackgroundTransparency = 1, 
                Text = l_Localization_0:getText("General", "TermsDialogHeader"), 
                TextWrapped = true
            })), 
            Body = v6.createElement(l_TextWithInlineLink_0, {
                OnLinkClicked = function() --[[ Line: 467 ]] --[[ Name: OnLinkClicked ]]
                    -- upvalues: l_getPlayerAppDownloadLink_0 (ref), l_GuiService_0 (ref)
                    local v113 = l_getPlayerAppDownloadLink_0("China");
                    l_GuiService_0:OpenBrowserWindow(v113);
                end, 
                Text = l_Localization_0:getText("General", "TermsDialogBody"), 
                LinkText = l_Localization_0:getText("General", "TermsDialogBodyLink"), 
                LinkPlaceholder = "[link]", 
                MaxWidth = l_Stylizer_0.textWithInlineLink.maxWidth, 
                TextProps = v7.Dictionary.join(l_Stylizer_0.fontStyle.Normal, {
                    BackgroundTransparency = 1
                })
            })
        });
    end;
    return v103;
end;
local v138 = v32(function(v115, v116) --[[ Line: 487 ]] --[[ Name: loadValuesToProps ]]
    -- upvalues: l_RemoveNoDevicesError_0 (copy), l_shouldShowDevPublishLocations_0 (copy), v40 (copy)
    local l_errors_0 = v116.NewGameSettings.errors;
    local l_groupInfo_0 = v116.GroupsHavePermission.groupInfo;
    local l_selectedGroup_0 = v116.SelectedGroup.selectedGroup;
    local v120 = v115("dataSharingDefault");
    local v121 = v115("dataSharingEnabled");
    local l_ownedGroups_0 = l_groupInfo_0.ownedGroups;
    return {
        NameError = l_errors_0.name, 
        DescriptionError = l_errors_0.description, 
        DevicesError = if l_RemoveNoDevicesError_0 then nil else l_errors_0.playableDevices, 
        IsCurrentlyActive = v116.NewGameSettings.current.isActive, 
        Groups = l_groupInfo_0.groups, 
        SelectedGroup = l_selectedGroup_0, 
        OwnedGroups = l_ownedGroups_0, 
        Name = v115("name"), 
        Description = v115("description"), 
        Genre = v115("genre"), 
        Devices = v115("playableDevices") or {}, 
        RootPlaceId = v115("rootPlaceId"), 
        IsActive = v115("isActive"), 
        IsFriendsOnly = v115("isFriendsOnly"), 
        CreatorId = v115("creatorId"), 
        OptInLocations = l_shouldShowDevPublishLocations_0() and v115(v40) or {}, 
        PlayerAcceptance = v116.Policy.PlayerAcceptance, 
        TeamCreateEnabled = v115("teamCreateEnabled"), 
        DataSharingDefault = v120, 
        DataSharingEnabled = v121
    };
end, function(v123, v124) --[[ Line: 523 ]] --[[ Name: dispatchForProps ]]
    -- upvalues: v28 (copy), v29 (copy), l_RemoveNoDevicesError_0 (copy), l_shouldShowDevPublishLocations_0 (copy), v40 (copy), v27 (copy), v30 (copy)
    return {
        CreatorChanged = v123("creatorId"), 
        GenreChanged = v123("genre"), 
        NameChanged = function(v125) --[[ Line: 529 ]] --[[ Name: NameChanged ]]
            -- upvalues: v124 (copy), v28 (ref), v29 (ref)
            v124(v28("name", v125));
            local v126 = utf8.len(v125);
            local v127, _ = string.gsub(v125, " ", "");
            if v126 == 0 or string.len(v127) == 0 then
                v124(v29({
                    name = "NameEmpty"
                }));
                return;
            else
                if v126 > 50 then
                    v124(v29({
                        name = "NameTooLong"
                    }));
                end;
                return;
            end;
        end, 
        DescriptionChanged = function(v129) --[[ Line: 540 ]] --[[ Name: DescriptionChanged ]]
            -- upvalues: v124 (copy), v28 (ref), v29 (ref)
            v124(v28("description", v129));
            if utf8.len(v129) > 1000 then
                v124(v29({
                    description = "DescriptionTooLong"
                }));
            end;
        end, 
        DevicesChanged = function(v130) --[[ Line: 548 ]] --[[ Name: DevicesChanged ]]
            -- upvalues: v124 (copy), v28 (ref), l_RemoveNoDevicesError_0 (ref), v29 (ref)
            v124(v28("playableDevices", v130));
            for _, v132 in pairs(v130) do
                if v132 then
                    return;
                end;
            end;
            if not l_RemoveNoDevicesError_0 then
                v124(v29({
                    playableDevices = "NoDevices"
                }));
            end;
        end, 
        OptInLocationsChanged = function(v133) --[[ Line: 560 ]] --[[ Name: OptInLocationsChanged ]]
            -- upvalues: l_shouldShowDevPublishLocations_0 (ref), v124 (copy), v28 (ref), v40 (ref)
            if l_shouldShowDevPublishLocations_0() then
                v124(v28(v40, v133));
            end;
        end, 
        IsFriendsOnlyChanged = v123("isFriendsOnly"), 
        IsActiveChanged = v123("isActive"), 
        GetPlayerAcceptances = function(v134) --[[ Line: 569 ]] --[[ Name: GetPlayerAcceptances ]]
            -- upvalues: l_shouldShowDevPublishLocations_0 (ref), v124 (copy), v27 (ref)
            if not l_shouldShowDevPublishLocations_0() then
                return;
            else
                v124(v27(v134));
                return;
            end;
        end, 
        TeamCreateEnabledChanged = function(v135) --[[ Line: 577 ]] --[[ Name: TeamCreateEnabledChanged ]]
            -- upvalues: v124 (copy), v28 (ref)
            v124(v28("teamCreateEnabled", v135));
        end, 
        DataSharingEnabledChanged = function(v136) --[[ Line: 581 ]] --[[ Name: DataSharingEnabledChanged ]]
            -- upvalues: v124 (copy), v28 (ref)
            v124(v28("dataSharingEnabled", v136));
        end, 
        DispatchSetSelectedGroup = function(v137) --[[ Line: 585 ]] --[[ Name: DispatchSetSelectedGroup ]]
            -- upvalues: v124 (copy), v30 (ref)
            v124(v30(v137));
        end
    };
end);
return function(v139) --[[ Line: 593 ]] --[[ Name: BasicInfo ]]
    -- upvalues: v6 (copy), v138 (copy), v114 (copy)
    return v6.createElement(v138, {
        Content = v114, 
        AddLayout = true, 
        IsPublish = v139.IsPublish
    });
end;