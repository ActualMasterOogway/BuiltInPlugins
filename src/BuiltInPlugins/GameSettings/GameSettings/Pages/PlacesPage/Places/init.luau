local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.KeyProvider);
local l_getEditKeyName_0 = v1.getEditKeyName;
local l_getVersionHistoryKeyName_0 = v1.getVersionHistoryKeyName;
local l_Parent_1 = script.Parent;
local v5 = require(l_Parent_0.Packages.Roact);
local v6 = require(l_Parent_0.Packages.RoactRodux);
local v7 = require(l_Parent_0.Packages.Cryo);
local v8 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v8.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Util_0 = v8.Util;
local l_deepJoin_0 = l_Util_0.deepJoin;
local l_FitFrameOnAxis_0 = l_Util_0.FitFrame.FitFrameOnAxis;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_UI_0 = v8.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_Separator_0 = l_UI_0.Separator;
local l_LinkText_0 = l_UI_0.LinkText;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v23 = require(l_Parent_0.Src.Components.Header);
local v24 = require(l_Parent_1.Components.ServerFill);
local v25 = require(l_Parent_0.Src.Components.TableWithMenu);
local v26 = require(l_Parent_0.Src.Components.RadioButtonSet);
local v27 = require(l_Parent_0.Src.Components.SettingsPages.SettingsPage);
local v28 = require(l_Parent_0.Src.Actions.AddChange);
local v29 = require(l_Parent_0.Src.Actions.AddErrors);
local v30 = require(l_Parent_0.Src.Actions.DiscardChanges);
local v31 = require(l_Parent_0.Src.Actions.DiscardError);
local v32 = require(l_Parent_0.Src.Actions.DiscardErrors);
local v33 = require(l_Parent_0.Src.Actions.SetEditPlaceId);
local v34 = require(l_Parent_1.Thunks.ReloadPlaces);
local v35 = v5.PureComponent:extend(script.Name);
local l_Name_0 = script.Name;
local v37 = game:DefineFastInt("StudioPlaceConfigurationMaxPlayerCount", 200);
local v38 = 0;
local v39 = nil;
v39 = if v37 > 100 then math.floor(v37 * 0.2) else math.min(20, v37 - 1);
local l_AssetManagerService_0 = game:GetService("AssetManagerService");
local l_StudioService_0 = game:GetService("StudioService");
local l_TextService_0 = game:GetService("TextService");
local l_GuiService_0 = game:GetService("GuiService");
local v44 = {
    Empty = "ErrorNameEmpty"
};
local function v53(v45, v46) --[[ Line: 93 ]] --[[ Name: loadSettings ]]
    local l_gameId_0 = v45:getState().Metadata.gameId;
    local l_placesController_0 = v46.placesController;
    return {
        function(v49) --[[ Line: 99 ]]
            -- upvalues: l_placesController_0 (copy), l_gameId_0 (copy)
            local v50, v51, v52 = l_placesController_0:getPlaces(l_gameId_0):await();
            v49.places = v50;
            v49.placesPageCursor = v51;
            v49.placesIndex = v52;
        end
    };
end;
local function v65(v54, v55) --[[ Line: 109 ]] --[[ Name: saveSettings ]]
    local v56 = v54:getState();
    local l_placesController_1 = v55.placesController;
    local l_editPlaceId_0 = v56.EditAsset.editPlaceId;
    local v59 = v56.Settings.Changed.places or {};
    return {
        function() --[[ Line: 116 ]]
            -- upvalues: v59 (copy), l_editPlaceId_0 (copy), l_placesController_1 (copy)
            local v60 = v59[l_editPlaceId_0];
            if v60 ~= nil and v60.name then
                l_placesController_1:setName(l_editPlaceId_0, v60.name);
            end;
        end, 
        function() --[[ Line: 123 ]]
            -- upvalues: v59 (copy), l_editPlaceId_0 (copy), l_placesController_1 (copy)
            local v61 = v59[l_editPlaceId_0];
            if v61 ~= nil and v61.maxPlayerCount then
                l_placesController_1:setMaxPlayerCount(l_editPlaceId_0, v61.maxPlayerCount);
            end;
        end, 
        function() --[[ Line: 130 ]]
            -- upvalues: v59 (copy), l_editPlaceId_0 (copy), l_placesController_1 (copy)
            local v62 = v59[l_editPlaceId_0];
            if v62 ~= nil and v62.allowCopying ~= nil then
                l_placesController_1:setAllowCopying(l_editPlaceId_0, v62.allowCopying);
            end;
        end, 
        function() --[[ Line: 137 ]]
            -- upvalues: v59 (copy), l_editPlaceId_0 (copy), l_placesController_1 (copy)
            local v63 = v59[l_editPlaceId_0];
            if v63 ~= nil and v63.socialSlotType then
                l_placesController_1:setSocialSlotType(l_editPlaceId_0, v63.socialSlotType);
            end;
        end, 
        function() --[[ Line: 144 ]]
            -- upvalues: v59 (copy), l_editPlaceId_0 (copy), l_placesController_1 (copy)
            local v64 = v59[l_editPlaceId_0];
            if v64 ~= nil and v64.customSocialSlotsCount then
                l_placesController_1:setCustomSocialSlotsCount(l_editPlaceId_0, v64.customSocialSlotsCount);
            end;
        end
    };
end;
local function _(v66, v67) --[[ Line: 155 ]] --[[ Name: loadValuesToProps ]]
    local l_Errors_0 = v67.Settings.Errors;
    return {
        Places = v66("places"), 
        EditPlaceId = v67.EditAsset.editPlaceId, 
        PlaceNameError = l_Errors_0.placeName, 
        PlacePlayerCountError = l_Errors_0.placePlayerCount, 
        PlaceCustomSocialSlotCountError = l_Errors_0.placeCustomSocialSlotsCount
    };
end;
local function v91(_, v71) --[[ Line: 169 ]] --[[ Name: dispatchChanges ]]
    -- upvalues: v34 (copy), v33 (copy), v29 (copy), l_deepJoin_0 (copy), v28 (copy), v31 (copy), v38 (ref), v39 (ref), v37 (copy), v30 (copy), v32 (copy)
    return {
        dispatchReloadPlaces = function(v72) --[[ Line: 171 ]] --[[ Name: dispatchReloadPlaces ]]
            -- upvalues: v71 (copy), v34 (ref)
            v71(v34(v72));
        end, 
        dispatchSetEditPlaceId = function(v73) --[[ Line: 175 ]] --[[ Name: dispatchSetEditPlaceId ]]
            -- upvalues: v71 (copy), v33 (ref)
            v71(v33(v73));
        end, 
        dispatchSetPlaceName = function(v74, v75, v76) --[[ Line: 179 ]] --[[ Name: dispatchSetPlaceName ]]
            -- upvalues: v71 (copy), v29 (ref), l_deepJoin_0 (ref), v28 (ref), v31 (ref)
            local v77 = utf8.len(v76);
            if v77 == 0 then
                v71(v29({
                    placeName = "Empty"
                }));
                return;
            else
                local v78 = l_deepJoin_0(v74, {
                    [v75] = {
                        name = v76
                    }
                });
                v71(v28("places", v78));
                v71(v31("placeName"));
                if v77 > 50 then
                    v71(v29({
                        placeName = "TooLong"
                    }));
                end;
                return;
            end;
        end, 
        dispatchUpdateServerSizeAndServerSlots = function(v79, v80, v81, v82, v83) --[[ Line: 197 ]] --[[ Name: dispatchUpdateServerSizeAndServerSlots ]]
            -- upvalues: v71 (copy), v31 (ref), l_deepJoin_0 (ref), v28 (ref), v29 (ref), v38 (ref), v39 (ref), v37 (ref)
            v71(v31("placePlayerCount"));
            v71(v31("placeCustomSocialSlotsCount"));
            local v84 = tonumber(v81);
            local v85 = tonumber(v82);
            local v86 = l_deepJoin_0(v79, {
                [v80] = {
                    maxPlayerCount = v84 or "", 
                    customSocialSlotsCount = v85 or "", 
                    socialSlotType = v83
                }
            });
            v71(v28("places", v86));
            if not v84 or not v85 then
                if not v84 then
                    v71(v29({
                        placePlayerCount = "Error"
                    }));
                elseif v84 == 1 then
                    v38 = 0;
                    v39 = 0;
                elseif v84 > 1 and v84 <= 100 then
                    v38 = 1;
                    v39 = math.min(v84 - 1, 20);
                else
                    v38 = 1;
                    v39 = math.floor(v84 * 0.2);
                end;
                if v83 == "Custom" and not v85 then
                    v71(v29({
                        placeCustomSocialSlotsCount = "Error"
                    }));
                    return;
                end;
            else
                if v84 == 1 then
                    v38 = 0;
                    v39 = 0;
                elseif v84 > 1 and v84 <= 100 then
                    v38 = 1;
                    v39 = math.min(v84 - 1, 20);
                else
                    v38 = 1;
                    v39 = math.floor(v84 * 0.2);
                end;
                if v84 < 1 or v37 < v84 then
                    v71(v29({
                        placePlayerCount = "Error"
                    }));
                else
                    v71(v31("placePlayerCount"));
                end;
                if v84 and (v84 <= 100 and math.min(v84 - 1, 20) < v85 or v84 > 100 and math.floor(v84 * 0.2) < v85 or v84 > 1 and v85 < 1) then
                    if v83 == "Custom" then
                        v71(v29({
                            placeCustomSocialSlotsCount = "Error"
                        }));
                        return;
                    end;
                else
                    v71(v31("placeCustomSocialSlotsCount"));
                end;
            end;
        end, 
        dispatchSetAllowCopyingEnabled = function(v87, v88, v89) --[[ Line: 272 ]] --[[ Name: dispatchSetAllowCopyingEnabled ]]
            -- upvalues: l_deepJoin_0 (ref), v71 (copy), v28 (ref)
            local v90 = l_deepJoin_0(v87, {
                [v88] = {
                    allowCopying = v89
                }
            });
            v71(v28("places", v90));
        end, 
        dispatchDiscardChanges = function() --[[ Line: 281 ]] --[[ Name: dispatchDiscardChanges ]]
            -- upvalues: v71 (copy), v30 (ref)
            v71(v30());
        end, 
        dispatchDiscardErrors = function() --[[ Line: 285 ]] --[[ Name: dispatchDiscardErrors ]]
            -- upvalues: v71 (copy), v32 (ref)
            v71(v32());
        end
    };
end;
local function v97(v92) --[[ Line: 293 ]] --[[ Name: createPlaceTableData ]]
    local v93 = {};
    for _, v95 in pairs(v92) do
        local v96 = {
            index = v95.index + 1, 
            row = {
                v95.currentSavedVersion, 
                v95.name, 
                v95.maxPlayerCount
            }
        };
        v93[v95.id] = v96;
    end;
    return v93;
end;
local function v112(v98, v99) --[[ Line: 311 ]] --[[ Name: displayPlaceListPage ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_GetTextSize_0 (copy), v97 (copy), v5 (copy), l_Button_0 (copy), l_AssetManagerService_0 (copy), l_HoverArea_0 (copy), v25 (copy), l_getEditKeyName_0 (copy), l_getVersionHistoryKeyName_0 (copy), l_StudioService_0 (copy)
    local l_Stylizer_0 = v98.Stylizer;
    local v101 = l_LayoutOrderIterator_0.new();
    local v102 = v99:getText("General", "ButtonCreate");
    local v103 = l_GetTextSize_0(v102, l_Stylizer_0.fontStyle.Header.TextSize, l_Stylizer_0.fontStyle.Header.Font);
    local l_dispatchReloadPlaces_0 = v98.dispatchReloadPlaces;
    local v105 = {
        v99:getText("Places", "PlaceVersion"), 
        v99:getText("Places", "PlaceName"), 
        v99:getText("Places", "MaxPlayers")
    };
    local v106 = v98.Places and v98.Places or {};
    local v107 = v97(v106);
    return {
        CreateButton = v5.createElement(l_Button_0, {
            Style = "GameSettingsPrimaryButton", 
            Text = v102, 
            Size = UDim2.new(0, v103.X + l_Stylizer_0.createButton.PaddingX, 0, v103.Y + l_Stylizer_0.createButton.PaddingY), 
            LayoutOrder = v101:getNextOrder(), 
            OnClick = function() --[[ Line: 341 ]] --[[ Name: OnClick ]]
                -- upvalues: l_AssetManagerService_0 (ref), l_dispatchReloadPlaces_0 (copy)
                local l_status_0, _ = pcall(function() --[[ Line: 343 ]]
                    -- upvalues: l_AssetManagerService_0 (ref)
                    l_AssetManagerService_0:AddNewPlace();
                end);
                if l_status_0 then
                    l_dispatchReloadPlaces_0(true);
                end;
            end
        }, {
            v5.createElement(l_HoverArea_0, {
                Cursor = "PointingHand"
            })
        }), 
        PlacesTable = v5.createElement(v25, {
            LayoutOrder = v101:getNextOrder(), 
            Headers = v105, 
            Data = v107, 
            MenuItems = {
                {
                    Key = l_getEditKeyName_0(), 
                    Text = v99:getText("Places", "ConfigurePlace")
                }, 
                {
                    Key = l_getVersionHistoryKeyName_0(), 
                    Text = v99:getText("Places", "VersionHistory")
                }
            }, 
            OnItemClicked = function(v110, v111) --[[ Line: 362 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: l_getEditKeyName_0 (ref), v98 (copy), l_getVersionHistoryKeyName_0 (ref), l_StudioService_0 (ref)
                if v110 == l_getEditKeyName_0() then
                    v98.dispatchSetEditPlaceId(v111);
                    return;
                else
                    if v110 == l_getVersionHistoryKeyName_0() then
                        l_StudioService_0:ShowPlaceVersionHistoryDialog(v111);
                    end;
                    return;
                end;
            end, 
            NextPageFunc = function() --[[ Line: 369 ]] --[[ Name: NextPageFunc ]]
                -- upvalues: l_dispatchReloadPlaces_0 (copy)
                l_dispatchReloadPlaces_0();
            end
        })
    };
end;
local function v146(v113, v114) --[[ Line: 376 ]] --[[ Name: displayEditPlacePage ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), l_GetTextSize_0 (copy), v44 (copy), v37 (copy), v39 (ref), v38 (ref), l_TextService_0 (copy), v5 (copy), l_FitFrameOnAxis_0 (copy), l_HoverArea_0 (copy), l_Separator_0 (copy), v23 (copy), l_TitledFrame_0 (copy), l_TextInput_0 (copy), v7 (copy), v24 (copy), v26 (copy), l_LinkText_0 (copy), l_GuiService_0 (copy), l_StudioService_0 (copy), l_Button_0 (copy)
    local l_Stylizer_1 = v113.Stylizer;
    local v116 = l_LayoutOrderIterator_0.new();
    local v117 = v114:getText("Places", "MaxPlayersSubText");
    local v118 = l_GetTextSize_0(v117, l_Stylizer_1.fontStyle.Subtext.TextSize, l_Stylizer_1.fontStyle.Subtext.Font);
    local v119 = v114:getText("General", "ButtonView");
    local v120 = Vector2.new(1e999, l_Stylizer_1.button.height);
    local v121 = l_GetTextSize_0(v119, l_Stylizer_1.fontStyle.Header.TextSize, l_Stylizer_1.fontStyle.Header.Font, v120);
    local v122 = math.max(v121.X, l_Stylizer_1.button.width);
    local v123 = l_Stylizer_1.button.height - v121.Y;
    local v124 = UDim2.new(0, v122, 0, v121.Y + v123);
    local v125 = v113.Places or {};
    local l_EditPlaceId_0 = v113.EditPlaceId;
    local v127 = v125[l_EditPlaceId_0] or {};
    local l_name_0 = v127.name;
    local v129 = nil;
    if v113.PlaceNameError and v44[v113.PlaceNameError] then
        v129 = v114:getText("General", v44[v113.PlaceNameError]);
    end;
    local l_maxPlayerCount_0 = v127.maxPlayerCount;
    local v131 = nil;
    if v113.PlacePlayerCountError then
        v131 = v114:getText("Places", "NumberError", {
            minRange = 1, 
            maxRange = v37
        });
    end;
    local l_allowCopying_0 = v127.allowCopying;
    local l_socialSlotType_0 = v127.socialSlotType;
    local l_customSocialSlotsCount_0 = v127.customSocialSlotsCount;
    local v135 = nil;
    if v113.PlaceCustomSocialSlotCountError then
        v135 = if not not tonumber(l_customSocialSlotsCount_0) or tonumber(l_maxPlayerCount_0) then if l_maxPlayerCount_0 > 0 and l_maxPlayerCount_0 <= 2 then v114:getText("Places", "SocialSlotAllowedError", {
            socialSlot = v39
        }) else v114:getText("Places", "SocialSlotError", {
            minRange = v38, 
            maxRange = v39
        }) else v114:getText("Places", "SocialSlotInvalidError");
    end;
    local l_dispatchUpdateServerSizeAndServerSlots_0 = v113.dispatchUpdateServerSizeAndServerSlots;
    local l_dispatchSetPlaceName_0 = v113.dispatchSetPlaceName;
    local l_dispatchSetAllowCopyingEnabled_0 = v113.dispatchSetAllowCopyingEnabled;
    local v139 = v114:getText("General", "AllowCopyingDesc");
    local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v139, l_Stylizer_1.fontStyle.Subtext.TextSize, l_Stylizer_1.fontStyle.Subtext.Font, Vector2.new(l_Stylizer_1.radioButton.descriptionWidth, 1e999));
    return {
        HeaderFrame = v5.createElement(l_FitFrameOnAxis_0, {
            LayoutOrder = v116:getNextOrder(), 
            BackgroundTransparency = 1, 
            axis = l_FitFrameOnAxis_0.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            contentPadding = UDim.new(0, l_Stylizer_1.settingsPage.headerPadding)
        }, {
            BackButton = v5.createElement("ImageButton", {
                Size = UDim2.new(0, l_Stylizer_1.backButton.size, 0, l_Stylizer_1.backButton.size), 
                LayoutOrder = 0, 
                Image = l_Stylizer_1.backButton.image, 
                BackgroundTransparency = 1, 
                [v5.Event.Activated] = function() --[[ Line: 458 ]]
                    -- upvalues: v113 (copy)
                    v113.dispatchDiscardChanges();
                    v113.dispatchDiscardErrors();
                    v113.dispatchSetEditPlaceId(0);
                end
            }, {
                v5.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            }), 
            v5.createElement(l_Separator_0, {
                LayoutOrder = 1
            }), 
            Header = v5.createElement(v23, {
                Title = v114:getText("Places", "ConfigurePlace"), 
                LayoutOrder = 2
            })
        }), 
        Name = v5.createElement(l_TitledFrame_0, {
            LayoutOrder = v116:getNextOrder(), 
            Title = v114:getText("General", "TitleName")
        }, {
            TextBox = v5.createElement(l_TextInput_0, {
                ErrorText = v129, 
                MaxLength = 50, 
                OnTextChanged = function(v141) --[[ Line: 484 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: l_dispatchSetPlaceName_0 (copy), v125 (copy), l_EditPlaceId_0 (copy)
                    l_dispatchSetPlaceName_0(v125, l_EditPlaceId_0, v141);
                end, 
                Text = l_name_0
            })
        }), 
        MaxPlayers = v5.createElement(l_TitledFrame_0, {
            LayoutOrder = v116:getNextOrder(), 
            Title = v114:getText("Places", "MaxPlayers")
        }, {
            HeaderLayout = v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            TextBox = v5.createElement(l_TextInput_0, {
                LayoutOrder = 1, 
                Text = l_maxPlayerCount_0, 
                ErrorText = v131, 
                OnTextChanged = function(v142) --[[ Line: 505 ]] --[[ Name: OnTextChanged ]]
                    -- upvalues: l_dispatchUpdateServerSizeAndServerSlots_0 (copy), v125 (copy), l_EditPlaceId_0 (copy), l_customSocialSlotsCount_0 (copy), l_socialSlotType_0 (copy)
                    l_dispatchUpdateServerSizeAndServerSlots_0(v125, l_EditPlaceId_0, v142, l_customSocialSlotsCount_0, l_socialSlotType_0);
                end, 
                Width = l_Stylizer_1.placePage.textBox.length
            }), 
            MaxPlayersSubText = not v131 and v5.createElement("TextLabel", v7.Dictionary.join(l_Stylizer_1.fontStyle.Subtext, {
                Size = UDim2.new(1, 0, 0, v118.Y), 
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                Text = v117, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextWrapped = true
            }))
        }), 
        ServerFill = v5.createElement(v24, {
            LayoutOrder = v116:getNextOrder(), 
            Enabled = true, 
            CustomSocialSlotsCount = l_customSocialSlotsCount_0, 
            Selected = l_socialSlotType_0, 
            ErrorMessage = v135, 
            OnSocialSlotTypeChanged = function(v143) --[[ Line: 543 ]] --[[ Name: OnSocialSlotTypeChanged ]]
                -- upvalues: l_dispatchUpdateServerSizeAndServerSlots_0 (copy), v125 (copy), l_EditPlaceId_0 (copy), l_maxPlayerCount_0 (copy), l_customSocialSlotsCount_0 (copy)
                l_dispatchUpdateServerSizeAndServerSlots_0(v125, l_EditPlaceId_0, l_maxPlayerCount_0, l_customSocialSlotsCount_0, v143.Id);
            end, 
            OnCustomSocialSlotsCountChanged = function(v144) --[[ Line: 552 ]] --[[ Name: OnCustomSocialSlotsCountChanged ]]
                -- upvalues: l_dispatchUpdateServerSizeAndServerSlots_0 (copy), v125 (copy), l_EditPlaceId_0 (copy), l_maxPlayerCount_0 (copy), l_socialSlotType_0 (copy)
                l_dispatchUpdateServerSizeAndServerSlots_0(v125, l_EditPlaceId_0, l_maxPlayerCount_0, v144, l_socialSlotType_0);
            end
        }), 
        AllowCopying = v5.createElement(v26, {
            Title = v114:getText("General", "TitleAllowCopying"), 
            Buttons = {
                {
                    Id = true, 
                    Title = v114:getText("General", "SettingOn"), 
                    Children = {
                        LinkText = v5.createElement(l_LinkText_0, {
                            Text = v139, 
                            Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y), 
                            TextWrapped = true, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            TextYAlignment = Enum.TextYAlignment.Top, 
                            OnClick = function() --[[ Line: 576 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_GuiService_0 (ref), l_StudioService_0 (ref)
                                l_GuiService_0:OpenBrowserWindow(l_StudioService_0:GetTermsOfUseUrl());
                            end
                        })
                    }
                }, 
                {
                    Id = false, 
                    Title = v114:getText("General", "SettingOff")
                }
            }, 
            Enabled = true, 
            LayoutOrder = v116:getNextOrder(), 
            Selected = l_allowCopying_0, 
            SelectionChanged = function(v145) --[[ Line: 590 ]] --[[ Name: SelectionChanged ]]
                -- upvalues: l_dispatchSetAllowCopyingEnabled_0 (copy), v125 (copy), l_EditPlaceId_0 (copy)
                l_dispatchSetAllowCopyingEnabled_0(v125, l_EditPlaceId_0, v145.Id);
            end
        }), 
        VersionHistory = v5.createElement(l_TitledFrame_0, {
            LayoutOrder = v116:getNextOrder(), 
            Title = v114:getText("Places", "VersionHistory")
        }, {
            ViewButton = v5.createElement(l_Button_0, {
                Style = "GameSettingsButton", 
                Text = v119, 
                Size = v124, 
                LayoutOrder = v116:getNextOrder(), 
                OnClick = function() --[[ Line: 604 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_StudioService_0 (ref), l_EditPlaceId_0 (copy)
                    l_StudioService_0:ShowPlaceVersionHistoryDialog(l_EditPlaceId_0);
                end
            }, {
                v5.createElement(l_HoverArea_0, {
                    Cursor = "PointingHand"
                })
            })
        })
    };
end;
v35.render = function(v147) --[[ Line: 614 ]] --[[ Name: render ]]
    -- upvalues: v112 (copy), v146 (copy), v5 (copy), v27 (copy), v53 (copy), v65 (copy), l_Name_0 (copy)
    local l_props_0 = v147.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_EditPlaceId_1 = l_props_0.EditPlaceId;
    local v151 = nil;
    v151 = l_EditPlaceId_1 == 0 and function() --[[ Line: 622 ]]
        -- upvalues: v112 (ref), l_props_0 (copy), l_Localization_0 (copy)
        return (v112(l_props_0, l_Localization_0));
    end or function() --[[ Line: 626 ]]
        -- upvalues: v146 (ref), l_props_0 (copy), l_Localization_0 (copy)
        return (v146(l_props_0, l_Localization_0));
    end;
    return v5.createElement(v27, {
        SettingsLoadJobs = v53, 
        SettingsSaveJobs = v65, 
        Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = v151, 
        ShowHeader = l_EditPlaceId_1 == 0
    });
end;
v35 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v35);
local v152 = require(l_Parent_0.Src.Networking.settingFromState);
v35 = v6.connect(function(v153, _) --[[ Line: 647 ]]
    -- upvalues: v152 (copy)
    if not v153 then
        return;
    else
        local function v156(v155) --[[ Line: 652 ]]
            -- upvalues: v152 (ref), v153 (copy)
            return v152(v153.Settings, v155);
        end;
        local l_Errors_1 = v153.Settings.Errors;
        return {
            Places = v156("places"), 
            EditPlaceId = v153.EditAsset.editPlaceId, 
            PlaceNameError = l_Errors_1.placeName, 
            PlacePlayerCountError = l_Errors_1.placePlayerCount, 
            PlaceCustomSocialSlotCountError = l_Errors_1.placeCustomSocialSlotsCount
        };
    end;
end, function(v158) --[[ Line: 657 ]]
    -- upvalues: v28 (copy), v91 (copy)
    return (v91(function(v159) --[[ Line: 658 ]]
        -- upvalues: v158 (copy), v28 (ref)
        return function(v160) --[[ Line: 659 ]]
            -- upvalues: v158 (ref), v28 (ref), v159 (copy)
            v158(v28(v159, v160));
        end;
    end, v158));
end)(v35);
v35.LocalizationId = l_Name_0;
return v35;