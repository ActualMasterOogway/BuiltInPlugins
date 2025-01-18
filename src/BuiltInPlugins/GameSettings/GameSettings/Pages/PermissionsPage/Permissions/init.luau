local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_1.Packages.Framework);
local v5 = require(l_Parent_1.Packages.RoactRodux);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v13 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v14 = require(l_Parent_1.Src.Actions.AddChange);
local v15 = require(l_Parent_1.Src.Actions.AddWarning);
local v16 = require(l_Parent_1.Src.Actions.DiscardWarning);
local v17 = require(l_Parent_1.Src.Actions.SetCreatorId);
local v18 = require(l_Parent_1.Src.Actions.SetCreatorName);
local v19 = require(l_Parent_1.Src.Actions.SetCreatorType);
local v20 = require(l_Parent_0.Actions.SetGroupOwnerId);
local v21 = require(l_Parent_0.Actions.SetGroupOwnerName);
local v22 = require(l_Parent_1.Src.Actions.SetCreatorFriends);
local v23 = require(l_Parent_1.Src.Util.KeyProvider);
local l_getIsFriendOnlyKeyName_0 = v23.getIsFriendOnlyKeyName;
local l_getIsActiveKeyName_0 = v23.getIsActiveKeyName;
local l_getIsForSaleKeyName_0 = v23.getIsForSaleKeyName;
local l_getVipServersIsEnabledKeyName_0 = v23.getVipServersIsEnabledKeyName;
local l_Name_0 = script.Name;
local function v63(v29, v30) --[[ Line: 38 ]] --[[ Name: loadSettings ]]
    -- upvalues: l_getIsActiveKeyName_0 (copy), l_getIsFriendOnlyKeyName_0 (copy), v18 (copy), v17 (copy), v19 (copy), v20 (copy), v21 (copy), v22 (copy), l_getIsForSaleKeyName_0 (copy), l_getVipServersIsEnabledKeyName_0 (copy)
    local v31 = v29:getState();
    local l_gameId_0 = v31.Metadata.gameId;
    local l_gameMetadataController_0 = v30.gameMetadataController;
    local l_groupMetadataController_0 = v30.groupMetadataController;
    local l_gamePermissionsController_0 = v30.gamePermissionsController;
    local l_socialController_0 = v30.socialController;
    local l_monetizationController_0 = v30.monetizationController;
    return {
        function(v38) --[[ Line: 48 ]]
            -- upvalues: l_gamePermissionsController_0 (copy), l_gameId_0 (copy), l_getIsActiveKeyName_0 (ref)
            local v39 = l_gamePermissionsController_0:isActive(l_gameId_0);
            v38[l_getIsActiveKeyName_0()] = v39;
        end, 
        function(v40) --[[ Line: 53 ]]
            -- upvalues: l_gamePermissionsController_0 (copy), l_gameId_0 (copy), l_getIsFriendOnlyKeyName_0 (ref)
            local v41 = l_gamePermissionsController_0:isFriendsOnly(l_gameId_0);
            v40[l_getIsFriendOnlyKeyName_0()] = v41;
        end, 
        function(_) --[[ Line: 58 ]]
            -- upvalues: l_gameMetadataController_0 (copy), l_gameId_0 (copy), v29 (copy), v18 (ref)
            local v43 = l_gameMetadataController_0:getCreatorName(l_gameId_0);
            v29:dispatch(v18(v43));
        end, 
        function(_) --[[ Line: 63 ]]
            -- upvalues: l_gameMetadataController_0 (copy), l_gameId_0 (copy), v29 (copy), v17 (ref)
            local v45 = l_gameMetadataController_0:getCreatorId(l_gameId_0);
            v29:dispatch(v17(v45));
        end, 
        function(_) --[[ Line: 68 ]]
            -- upvalues: l_gameMetadataController_0 (copy), l_gameId_0 (copy), v29 (copy), v19 (ref), l_groupMetadataController_0 (copy), v20 (ref), v21 (ref), l_socialController_0 (copy), v22 (ref)
            local v47 = l_gameMetadataController_0:getCreatorType(l_gameId_0);
            v29:dispatch(v19(v47));
            if v47 == Enum.CreatorType.Group then
                local v48 = l_gameMetadataController_0:getCreatorId(l_gameId_0);
                local v49 = l_groupMetadataController_0:getOwnerId(v48);
                local v50 = l_groupMetadataController_0:getOwnerName(v48);
                v29:dispatch(v20(v49));
                v29:dispatch(v21(v50));
                return;
            else
                if v47 == Enum.CreatorType.User then
                    local v51 = l_gameMetadataController_0:getCreatorId(l_gameId_0);
                    local v52 = l_socialController_0:getUserFriends(v51);
                    v29:dispatch(v22(v52));
                end;
                return;
            end;
        end, 
        function(v53) --[[ Line: 87 ]]
            -- upvalues: l_gameMetadataController_0 (copy), l_gameId_0 (copy), l_gamePermissionsController_0 (copy)
            local v54 = l_gameMetadataController_0:getCreatorName(l_gameId_0);
            local v55 = l_gameMetadataController_0:getCreatorId(l_gameId_0);
            local v56 = l_gameMetadataController_0:getCreatorType(l_gameId_0);
            local v57, v58 = l_gamePermissionsController_0:getPermissions(l_gameId_0, v54, v55, v56);
            v53.permissions = v57;
            v53.groupMetadata = v58;
        end, 
        function(v59) --[[ Line: 98 ]]
            -- upvalues: v31 (copy), l_getIsForSaleKeyName_0 (ref), l_monetizationController_0 (copy), l_gameId_0 (copy)
            if v31.Settings.Current[l_getIsForSaleKeyName_0()] == nil then
                local v60 = l_monetizationController_0:getPaidAccessEnabled(l_gameId_0);
                v59[l_getIsForSaleKeyName_0()] = v60;
            end;
        end, 
        function(v61) --[[ Line: 105 ]]
            -- upvalues: v31 (copy), l_getVipServersIsEnabledKeyName_0 (ref), l_monetizationController_0 (copy), l_gameId_0 (copy)
            if v31.Settings.Current[l_getVipServersIsEnabledKeyName_0()] == nil then
                local v62 = l_monetizationController_0:getVIPServersEnabled(l_gameId_0);
                v61[l_getVipServersIsEnabledKeyName_0()] = v62;
            end;
        end
    };
end;
local function v73(v64, v65) --[[ Line: 114 ]] --[[ Name: saveSettings ]]
    local v66 = v64:getState();
    local l_gameId_1 = v66.Metadata.gameId;
    local l_gamePermissionsController_1 = v65.gamePermissionsController;
    return {
        function() --[[ Line: 120 ]]
            -- upvalues: v66 (copy), l_gamePermissionsController_1 (copy), l_gameId_1 (copy)
            local l_isActive_0 = v66.Settings.Changed.isActive;
            if l_isActive_0 ~= nil then
                l_gamePermissionsController_1:setActive(l_gameId_1, l_isActive_0);
            end;
        end, 
        function() --[[ Line: 127 ]]
            -- upvalues: v66 (copy), l_gamePermissionsController_1 (copy), l_gameId_1 (copy)
            local l_isFriendsOnly_0 = v66.Settings.Changed.isFriendsOnly;
            if l_isFriendsOnly_0 ~= nil then
                l_gamePermissionsController_1:setFriendsOnly(l_gameId_1, l_isFriendsOnly_0);
            end;
        end, 
        function() --[[ Line: 134 ]]
            -- upvalues: v66 (copy), l_gamePermissionsController_1 (copy), l_gameId_1 (copy)
            local l_permissions_0 = v66.Settings.Current.permissions;
            local l_permissions_1 = v66.Settings.Changed.permissions;
            if l_permissions_1 ~= nil then
                l_gamePermissionsController_1:setPermissions(l_gameId_1, l_permissions_0, l_permissions_1);
            end;
        end
    };
end;
local function v76(v74, v75) --[[ Line: 146 ]] --[[ Name: loadValuesToProps ]]
    -- upvalues: l_getIsActiveKeyName_0 (copy), l_getIsFriendOnlyKeyName_0 (copy), l_getIsForSaleKeyName_0 (copy), l_getVipServersIsEnabledKeyName_0 (copy)
    return {
        IsActive = v74(l_getIsActiveKeyName_0()), 
        IsFriendsOnly = v74(l_getIsFriendOnlyKeyName_0()), 
        IsCurrentlyActive = v75.Settings.Current.isActive, 
        IsMonetized = v74(l_getIsForSaleKeyName_0()) or v74(l_getVipServersIsEnabledKeyName_0()), 
        IsInitiallyEnabled = (not v75.Settings.Current[l_getIsActiveKeyName_0()] or v75.Settings.Current[l_getIsFriendOnlyKeyName_0()]) and (v75.Settings.Current[l_getIsForSaleKeyName_0()] or v75.Settings.Current[l_getVipServersIsEnabledKeyName_0()]), 
        OwnerId = v75.GameOwnerMetadata.creatorId, 
        OwnerType = v75.GameOwnerMetadata.creatorType, 
        GroupOwnerUserId = v75.GameOwnerMetadata.groupOwnerId
    };
end;
local function v81(v77, v78) --[[ Line: 175 ]] --[[ Name: dispatchChanges ]]
    -- upvalues: l_getIsFriendOnlyKeyName_0 (copy), v15 (copy), l_getIsActiveKeyName_0 (copy), v16 (copy), v14 (copy)
    return {
        IsFriendsOnlyChanged = v77(l_getIsFriendOnlyKeyName_0()), 
        IsActiveChanged = function(v79, v80) --[[ Line: 179 ]] --[[ Name: IsActiveChanged ]]
            -- upvalues: v78 (copy), v15 (ref), l_getIsActiveKeyName_0 (ref), v16 (ref), v14 (ref)
            if v80 then
                v78(v15(l_getIsActiveKeyName_0()));
            else
                v78(v16(l_getIsActiveKeyName_0()));
            end;
            v78(v14(l_getIsActiveKeyName_0(), v79));
        end
    };
end;
local v82 = v3.PureComponent:extend(script.Name);
v82.isGroupGame = function(v83) --[[ Line: 194 ]] --[[ Name: isGroupGame ]]
    return v83.props.OwnerType == Enum.CreatorType.Group;
end;
v82.isLoggedInUserGameOwner = function(v84) --[[ Line: 201 ]] --[[ Name: isLoggedInUserGameOwner ]]
    -- upvalues: l_StudioService_0 (copy)
    local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
    local l_props_0 = v84.props;
    local l_OwnerId_0 = l_props_0.OwnerId;
    local l_GroupOwnerUserId_0 = l_props_0.GroupOwnerUserId;
    if v84:isGroupGame() then
        return l_l_StudioService_0_UserId_0 == l_GroupOwnerUserId_0;
    else
        return l_l_StudioService_0_UserId_0 == l_OwnerId_0;
    end;
end;
v82.render = function(v89) --[[ Line: 215 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy), l_Pane_0 (copy), l_TitledFrame_0 (copy), l_RadioButtonList_0 (copy), l_TextLabel_0 (copy), v13 (copy), v63 (copy), v73 (copy), l_Name_0 (copy)
    local l_Localization_0 = v89.props.Localization;
    local function v106() --[[ Line: 218 ]] --[[ Name: createChildren ]]
        -- upvalues: v89 (copy), l_Localization_0 (copy), v3 (ref), l_Pane_0 (ref), l_TitledFrame_0 (ref), l_RadioButtonList_0 (ref), l_TextLabel_0 (ref)
        local l_props_1 = v89.props;
        local l_IsFriendsOnly_0 = l_props_1.IsFriendsOnly;
        local l_IsActive_0 = l_props_1.IsActive;
        local l_IsCurrentlyActive_0 = l_props_1.IsCurrentlyActive;
        local l_IsActiveChanged_0 = l_props_1.IsActiveChanged;
        local l_IsFriendsOnlyChanged_0 = l_props_1.IsFriendsOnlyChanged;
        local v97 = l_IsActive_0 and not l_IsFriendsOnly_0;
        local l_IsMonetized_0 = l_props_1.IsMonetized;
        local l_IsInitiallyEnabled_0 = l_props_1.IsInitiallyEnabled;
        local l_Stylizer_0 = l_props_1.Stylizer;
        local v101 = (not not v89:isLoggedInUserGameOwner() or v89:isGroupGame()) and (not v97 and l_IsInitiallyEnabled_0 or not l_IsMonetized_0);
        local v102 = {
            {
                Description = l_Localization_0:getText("General", "PlayabilityPublicDesc"), 
                Disabled = not v101, 
                Key = true, 
                Text = l_Localization_0:getText("General", "PlayabilityPublic")
            }, 
            {
                Description = l_Localization_0:getText("General", "PlayabilityPrivateDesc"), 
                Disabled = not v101, 
                Key = false, 
                Text = l_Localization_0:getText("General", "PlayabilityPrivate")
            }
        };
        if not v89:isGroupGame() then
            table.insert(v102, 1, {
                Description = l_Localization_0:getText("General", "PlayabilityFriendsDesc"), 
                Disabled = not v101, 
                Key = "Friends", 
                Text = l_Localization_0:getText("General", "PlayabilityFriends")
            });
        end;
        local v103 = not v101;
        return {
            PlayabilityWidget = v3.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                Spacing = l_Stylizer_0.playabilityWidget.spacing
            }, {
                TitlePane = v3.createElement(l_TitledFrame_0, {
                    LayoutOrder = 1, 
                    Title = l_Localization_0:getText("General", "TitlePlayability")
                }, {
                    v3.createElement(l_TitledFrame_0, {
                        Title = l_Localization_0:getText("General", "PlayabilityHeader"), 
                        Style = "Subtitle"
                    }, {
                        List = v3.createElement(l_RadioButtonList_0, {
                            Buttons = v102, 
                            OnClick = function(v104) --[[ Line: 278 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_IsFriendsOnlyChanged_0 (copy), l_IsActiveChanged_0 (copy), l_IsCurrentlyActive_0 (copy)
                                if v104 == "Friends" then
                                    l_IsFriendsOnlyChanged_0(true);
                                    l_IsActiveChanged_0(true, false);
                                    return;
                                else
                                    l_IsFriendsOnlyChanged_0(false);
                                    local v105 = l_IsCurrentlyActive_0 and not v104;
                                    l_IsActiveChanged_0(v104, v105);
                                    return;
                                end;
                            end, 
                            SelectedKey = nil, 
                            CurrentSelectedKey = l_IsFriendsOnly_0 and "Friends" or l_IsActive_0, 
                            TextSize = {
                                Description = l_Stylizer_0.fontStyle.Subtext.TextSize, 
                                MainText = l_Stylizer_0.fontStyle.Normal.TextSize
                            }
                        })
                    })
                }), 
                PlayabilityWarning = v103 and v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 15, 
                    Style = "SubText", 
                    Text = l_Localization_0:getText("AccessPermissions", "PlayabilityWarning"), 
                    TextColor = l_Stylizer_0.warningColor, 
                    TextSize = l_Stylizer_0.fontStyle.Subtitle.TextSize, 
                    TextXAlignment = Enum.TextXAlignment.Left
                })
            })
        };
    end;
    return v3.createElement(v13, {
        SettingsLoadJobs = v63, 
        SettingsSaveJobs = v73, 
        Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = v106
    });
end;
v82 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v82);
local v107 = require(l_Parent_1.Src.Networking.settingFromState);
v82 = v5.connect(function(v108, _) --[[ Line: 327 ]]
    -- upvalues: v107 (copy), v76 (copy)
    if not v108 then
        return;
    else
        return (v76(function(v110) --[[ Line: 332 ]]
            -- upvalues: v107 (ref), v108 (copy)
            return v107(v108.Settings, v110);
        end, v108));
    end;
end, function(v111) --[[ Line: 337 ]]
    -- upvalues: v14 (copy), v81 (copy)
    return (v81(function(v112) --[[ Line: 338 ]]
        -- upvalues: v111 (copy), v14 (ref)
        return function(v113) --[[ Line: 339 ]]
            -- upvalues: v111 (ref), v14 (ref), v112 (copy)
            v111(v14(v112, v113));
        end;
    end, v111));
end)(v82);
v82.LocalizationId = l_Name_0;
return v82;