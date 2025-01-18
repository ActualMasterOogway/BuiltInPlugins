local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Parent_0 = script.Parent.Parent.Parent;
local v8 = require(l_Parent_0.Packages.Roact);
local v9 = require(l_Parent_0.Packages.RoactRodux);
local v10 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v10.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextLabel_0 = v10.UI.TextLabel;
local l_LayoutOrderIterator_0 = v10.Util.LayoutOrderIterator;
local l_game_EngineFeature_0 = game:GetEngineFeature("EditableServiceEnabled");
local v16 = if l_game_EngineFeature_0 then game:GetService("StudioService") else nil;
local v17 = if l_game_EngineFeature_0 then game:GetService("GuiService") else nil;
local l_Parent_1 = script.Parent;
local v19 = if l_game_EngineFeature_0 then require(l_Parent_0.Src.Actions.SetCreatorId) else nil;
local v20 = if l_game_EngineFeature_0 then require(l_Parent_0.Src.Actions.SetCreatorName) else nil;
local v21 = if l_game_EngineFeature_0 then require(l_Parent_0.Src.Actions.SetCreatorType) else nil;
local v22 = if l_game_EngineFeature_0 then require(l_Parent_1.Actions.SetGroupOwnerId) else nil;
local v23 = require(l_Parent_0.Src.Components.ToggleButtonWithTitle);
local v24 = require(l_Parent_0.Src.Actions.AddChange);
local v25 = require(l_Parent_0.Src.Components.SettingsPages.SettingsPage);
local v26 = require(l_Parent_0.Src.Util.Analytics);
local v27 = require(l_Parent_1.Components.Secrets);
local l_Name_0 = script.Name;
local v29 = game:DefineFastString("PolicyLink", "https://help.roblox.com/hc/articles/115004647846-Roblox-Terms-of-Use#creators-restrictions-on-use");
local v30 = game:DefineFastString("IdVerificationLink", "https://www.roblox.com/my/account#!/info");
local v31 = game:DefineFastString("CreatorIdVerificationLink", "https://create.roblox.com/docs/production/publishing/account-verification");
local function v52(v32, v33) --[[ Line: 52 ]] --[[ Name: loadSettings ]]
    -- upvalues: l_game_EngineFeature_0 (copy), v20 (copy), v19 (copy), v21 (copy), v22 (copy)
    local v34 = v32:getState();
    local l_game_0 = v34.Metadata.game;
    local l_gameId_0 = v34.Metadata.gameId;
    local l_universePermissionsController_0 = v33.universePermissionsController;
    local v38 = if l_game_EngineFeature_0 then v33.gameMetadataController else nil;
    local v39 = if l_game_EngineFeature_0 then v33.groupMetadataController else nil;
    return {
        function(v40) --[[ Line: 66 ]]
            -- upvalues: l_universePermissionsController_0 (copy), l_game_0 (copy)
            v40.HttpEnabled = l_universePermissionsController_0:GetHttpEnabled(l_game_0);
        end, 
        function(v41) --[[ Line: 70 ]]
            -- upvalues: l_universePermissionsController_0 (copy), l_gameId_0 (copy)
            v41.StudioAccessToApisAllowed = l_universePermissionsController_0:GetStudioAccessToApisAllowed(l_gameId_0);
        end, 
        function(v42) --[[ Line: 74 ]]
            -- upvalues: l_universePermissionsController_0 (copy), l_gameId_0 (copy)
            v42.ThirdPartyPurchaseAllowed = l_universePermissionsController_0:GetThirdPartyPurchasesAllowed(l_gameId_0);
        end, 
        function(v43) --[[ Line: 78 ]]
            -- upvalues: l_universePermissionsController_0 (copy), l_gameId_0 (copy)
            v43.ThirdPartyTeleportAllowed = l_universePermissionsController_0:GetThirdPartyTeleportsAllowed(l_gameId_0);
        end, 
        function(v44) --[[ Line: 82 ]]
            -- upvalues: l_universePermissionsController_0 (copy)
            v44.Secrets = l_universePermissionsController_0:GetSecrets();
        end, 
        l_game_EngineFeature_0 and function() --[[ Line: 87 ]]
            -- upvalues: v38 (copy), l_gameId_0 (copy), v32 (copy), v20 (ref)
            local v45 = v38:getCreatorName(l_gameId_0);
            v32:dispatch(v20(v45));
        end or nil, 
        l_game_EngineFeature_0 and function() --[[ Line: 93 ]]
            -- upvalues: v38 (copy), l_gameId_0 (copy), v32 (copy), v19 (ref)
            local v46 = v38:getCreatorId(l_gameId_0);
            v32:dispatch(v19(v46));
        end or nil, 
        l_game_EngineFeature_0 and function() --[[ Line: 99 ]]
            -- upvalues: v38 (copy), l_gameId_0 (copy), v32 (copy), v21 (ref), v39 (copy), v22 (ref)
            local v47 = v38:getCreatorType(l_gameId_0);
            v32:dispatch(v21(v47));
            if v47 == Enum.CreatorType.Group then
                local v48 = v38:getCreatorId(l_gameId_0);
                local v49 = v39:getOwnerId(v48);
                v32:dispatch(v22(v49));
            end;
        end or nil, 
        l_game_EngineFeature_0 and function(v50) --[[ Line: 110 ]]
            -- upvalues: l_universePermissionsController_0 (copy)
            v50.MeshTextureApiAmpStatus = l_universePermissionsController_0:GetMeshTextureApiAmpStatus();
        end or nil, 
        l_game_EngineFeature_0 and function(v51) --[[ Line: 116 ]]
            -- upvalues: l_universePermissionsController_0 (copy), l_gameId_0 (copy)
            v51.MeshTextureApisAllowed = l_universePermissionsController_0:GetMeshTextureApisAllowed(l_gameId_0);
        end or nil
    };
end;
local function _(v53, v54, v55) --[[ Line: 124 ]] --[[ Name: createSaveSettingIfChangedHandler ]]
    -- upvalues: v26 (copy)
    return function() --[[ Line: 125 ]]
        -- upvalues: v53 (copy), v54 (copy), v26 (ref), v55 (copy)
        local v56 = v53.Settings.Changed[v54];
        if v56 ~= nil then
            v26.onSecuritySettingChange(v54, v56);
            v55(v56);
        end;
    end;
end;
local function v94(v58, v59) --[[ Line: 134 ]] --[[ Name: saveSettings ]]
    -- upvalues: v26 (copy), l_game_EngineFeature_0 (copy)
    local v60 = v58:getState();
    local l_gameId_1 = v60.Metadata.gameId;
    local l_universePermissionsController_1 = v59.universePermissionsController;
    local v63 = {};
    local function v65(v64) --[[ Line: 140 ]]
        -- upvalues: l_universePermissionsController_1 (copy)
        l_universePermissionsController_1:SetHttpEnabled(game, v64);
    end;
    local v66 = "HttpEnabled";
    local l_v66_0 = v66 --[[ copy: 8 -> 14 ]];
    local l_v65_0 = v65 --[[ copy: 7 -> 15 ]];
    local function v70() --[[ Line: 125 ]]
        -- upvalues: v60 (copy), l_v66_0 (copy), v26 (ref), l_v65_0 (copy)
        local v69 = v60.Settings.Changed[l_v66_0];
        if v69 ~= nil then
            v26.onSecuritySettingChange(l_v66_0, v69);
            l_v65_0(v69);
        end;
    end;
    local function v72(v71) --[[ Line: 143 ]]
        -- upvalues: l_universePermissionsController_1 (copy)
        l_universePermissionsController_1:SetSecrets(v71);
    end;
    local v73 = "Secrets";
    local l_v73_0 = v73 --[[ copy: 10 -> 16 ]];
    local l_v72_0 = v72 --[[ copy: 9 -> 17 ]];
    v65 = function() --[[ Line: 125 ]]
        -- upvalues: v60 (copy), l_v73_0 (copy), v26 (ref), l_v72_0 (copy)
        local v76 = v60.Settings.Changed[l_v73_0];
        if v76 ~= nil then
            v26.onSecuritySettingChange(l_v73_0, v76);
            l_v72_0(v76);
        end;
    end or nil;
    v72 = function(v77) --[[ Line: 146 ]]
        -- upvalues: l_universePermissionsController_1 (copy), l_gameId_1 (copy)
        l_universePermissionsController_1:SetStudioAccessToApisAllowed(l_gameId_1, v77);
    end;
    v73 = "StudioAccessToApisAllowed";
    local l_v73_1 = v73 --[[ copy: 10 -> 18 ]];
    local l_v72_1 = v72 --[[ copy: 9 -> 19 ]];
    v66 = function() --[[ Line: 125 ]]
        -- upvalues: v60 (copy), l_v73_1 (copy), v26 (ref), l_v72_1 (copy)
        local v80 = v60.Settings.Changed[l_v73_1];
        if v80 ~= nil then
            v26.onSecuritySettingChange(l_v73_1, v80);
            l_v72_1(v80);
        end;
    end;
    v73 = function(v81) --[[ Line: 149 ]]
        -- upvalues: l_universePermissionsController_1 (copy), l_gameId_1 (copy)
        l_universePermissionsController_1:SetThirdPartyPurchasesAllowed(l_gameId_1, v81);
    end;
    local v82 = "ThirdPartyPurchaseAllowed";
    local l_v82_0 = v82 --[[ copy: 11 -> 20 ]];
    local l_v73_2 = v73 --[[ copy: 10 -> 21 ]];
    v72 = function() --[[ Line: 125 ]]
        -- upvalues: v60 (copy), l_v82_0 (copy), v26 (ref), l_v73_2 (copy)
        local v85 = v60.Settings.Changed[l_v82_0];
        if v85 ~= nil then
            v26.onSecuritySettingChange(l_v82_0, v85);
            l_v73_2(v85);
        end;
    end;
    v82 = function(v86) --[[ Line: 152 ]]
        -- upvalues: l_universePermissionsController_1 (copy), l_gameId_1 (copy)
        l_universePermissionsController_1:SetThirdPartyTeleportsAllowed(l_gameId_1, v86);
    end;
    local v87 = "ThirdPartyTeleportAllowed";
    local l_v87_0 = v87 --[[ copy: 12 -> 22 ]];
    local l_v82_1 = v82 --[[ copy: 11 -> 23 ]];
    v73 = function() --[[ Line: 125 ]]
        -- upvalues: v60 (copy), l_v87_0 (copy), v26 (ref), l_v82_1 (copy)
        local v90 = v60.Settings.Changed[l_v87_0];
        if v90 ~= nil then
            v26.onSecuritySettingChange(l_v87_0, v90);
            l_v82_1(v90);
        end;
    end;
    if l_game_EngineFeature_0 then
        v87 = function(v91) --[[ Line: 156 ]]
            -- upvalues: l_universePermissionsController_1 (copy), l_gameId_1 (copy)
            l_universePermissionsController_1:SetMeshTextureApisAllowed(l_gameId_1, v91);
        end;
        local v92 = "MeshTextureApisAllowed";
        v82 = function() --[[ Line: 125 ]]
            -- upvalues: v60 (copy), v92 (copy), v26 (ref), v87 (copy)
            local v93 = v60.Settings.Changed[v92];
            if v93 ~= nil then
                v26.onSecuritySettingChange(v92, v93);
                v87(v93);
            end;
        end;
    else
        v82 = nil;
    end;
    v6(v63, 1, v70, v65, v66, v72, v73, v82);
    return v63;
end;
local function v97(v95, v96) --[[ Line: 164 ]] --[[ Name: loadValuesToProps ]]
    return {
        HttpEnabled = v95("HttpEnabled"), 
        Secrets = v95("Secrets"), 
        StudioAccessToApisAllowed = v95("StudioAccessToApisAllowed"), 
        ThirdPartyPurchaseAllowed = v95("ThirdPartyPurchaseAllowed"), 
        ThirdPartyTeleportAllowed = v95("ThirdPartyTeleportAllowed"), 
        HttpEnabledValueChanged = v96("HttpEnabled"), 
        ThirdPartyPurchaseAllowedValueChanged = v96("ThirdPartyPurchaseAllowed"), 
        ThirdPartyTeleportAllowedValueChanged = v96("ThirdPartyTeleportAllowed")
    };
end;
local function v101(v98, v99, v100) --[[ Line: 178 ]] --[[ Name: loadValuesToPropsWithState ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    return {
        HttpEnabled = v98("HttpEnabled"), 
        Secrets = v98("Secrets"), 
        StudioAccessToApisAllowed = v98("StudioAccessToApisAllowed"), 
        ThirdPartyPurchaseAllowed = v98("ThirdPartyPurchaseAllowed"), 
        ThirdPartyTeleportAllowed = v98("ThirdPartyTeleportAllowed"), 
        HttpEnabledValueChanged = v99("HttpEnabled"), 
        ThirdPartyPurchaseAllowedValueChanged = v99("ThirdPartyPurchaseAllowed"), 
        ThirdPartyTeleportAllowedValueChanged = v99("ThirdPartyTeleportAllowed"), 
        MeshTextureApisAllowed = v98("MeshTextureApisAllowed"), 
        MeshTextureApisAllowedValueChanged = v99("MeshTextureApisAllowed"), 
        MeshTextureApiAmpStatus = v98("MeshTextureApiAmpStatus"), 
        OwnerId = v100.GameOwnerMetadata.creatorId, 
        OwnerType = v100.GameOwnerMetadata.creatorType, 
        GroupOwnerUserId = if l_game_EngineFeature_0 then v100.GameOwnerMetadata.groupOwnerId else nil
    };
end;
local function v104(v102, _) --[[ Line: 199 ]] --[[ Name: dispatchChanges ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    return {
        HttpEnabledChanged = v102("HttpEnabled"), 
        SecretsChanged = v102("Secrets"), 
        StudioApiServicesChanged = v102("StudioAccessToApisAllowed"), 
        ThirdPartyPurchaseChanged = v102("ThirdPartyPurchaseAllowed"), 
        ThirdPartyTeleportAllowedChanged = v102("ThirdPartyTeleportAllowed"), 
        MeshTextureApisAllowedChanged = if l_game_EngineFeature_0 then v102("MeshTextureApisAllowed") else nil
    };
end;
local v105 = v8.PureComponent:extend(script.Name);
if l_game_EngineFeature_0 then
    v105.isGroupGame = function(v106) --[[ Line: 216 ]] --[[ Name: isGroupGame ]]
        return v106.props.OwnerType == Enum.CreatorType.Group;
    end;
    v105.isLoggedInUserGameOwner = function(v107) --[[ Line: 223 ]] --[[ Name: isLoggedInUserGameOwner ]]
        -- upvalues: v16 (copy)
        local l_v16_UserId_0 = v16:GetUserId();
        local l_props_0 = v107.props;
        local l_OwnerId_0 = l_props_0.OwnerId;
        local l_GroupOwnerUserId_0 = l_props_0.GroupOwnerUserId;
        if v107:isGroupGame() then
            return l_v16_UserId_0 == l_GroupOwnerUserId_0;
        else
            return l_v16_UserId_0 == l_OwnerId_0;
        end;
    end;
end;
v105.render = function(v112) --[[ Line: 238 ]] --[[ Name: render ]]
    -- upvalues: l_game_EngineFeature_0 (copy), l_LayoutOrderIterator_0 (copy), v8 (copy), l_TextLabel_0 (copy), v23 (copy), v27 (copy), v17 (copy), v29 (copy), v30 (copy), v31 (copy), v25 (copy), v52 (copy), v94 (copy), l_Name_0 (copy)
    local l_Localization_0 = v112.props.Localization;
    local function v123() --[[ Line: 241 ]] --[[ Name: createChildren ]]
        -- upvalues: v112 (copy), l_game_EngineFeature_0 (ref), l_LayoutOrderIterator_0 (ref), v8 (ref), l_TextLabel_0 (ref), v23 (ref), v27 (ref), v17 (ref), v29 (ref), v30 (ref), v31 (ref)
        local l_props_1 = v112.props;
        local l_Localization_1 = l_props_1.Localization;
        local v116 = l_props_1.HttpEnabledValueChanged and l_props_1.HttpEnabled or l_props_1.ThirdPartyPurchaseAllowedValueChanged and l_props_1.ThirdPartyPurchaseAllowed or l_props_1.ThirdPartyTeleportAllowedValueChanged and l_props_1.ThirdPartyTeleportAllowed;
        local v117 = nil;
        local v118 = nil;
        local v119 = nil;
        if l_game_EngineFeature_0 then
            v117 = v112:isLoggedInUserGameOwner();
            v118 = v117 and l_props_1.MeshTextureApiAmpStatus == "Granted" or false;
            v119 = v117 and l_props_1.MeshTextureApiAmpStatus == "Denied" or false;
        end;
        local l_Stylizer_0 = l_props_1.Stylizer;
        local v121 = l_LayoutOrderIterator_0.new(1);
        return {
            InsecureWarning = v116 and v8.createElement("Frame", {
                AutomaticSize = Enum.AutomaticSize.XY, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = v121:getNextOrder()
            }, {
                UILayout = v8.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Horizontal, 
                    Padding = UDim.new(0, l_Stylizer_0.dialog.spacing), 
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    VerticalAlignment = Enum.VerticalAlignment.Center
                }), 
                Warning = v8.createElement("ImageLabel", {
                    Image = l_Stylizer_0.warningIcon, 
                    LayoutOrder = v121:getNextOrder(), 
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, l_Stylizer_0.warningDialog.icon.size, 0, l_Stylizer_0.warningDialog.icon.size)
                }), 
                Description = v8.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v121:getNextOrder(), 
                    Style = "SubText", 
                    Text = l_Localization_1:getText("Security", "InsecureWarning"), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextColor = l_Stylizer_0.warningColor, 
                    TextSize = l_Stylizer_0.fontStyle.Subtitle.TextSize
                })
            }), 
            HttpEnabled = v8.createElement(v23, {
                Description = l_Localization_1:getText("General", "HttpDesc"), 
                Disabled = l_props_1.HttpEnabled == nil, 
                LayoutOrder = v121:getNextOrder(), 
                OnClick = function() --[[ Line: 297 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_props_1 (copy)
                    l_props_1.HttpEnabledChanged(not l_props_1.HttpEnabled);
                end, 
                Selected = l_props_1.HttpEnabled, 
                Title = l_Localization_1:getText("General", "TitleHttp")
            }), 
            Secrets = l_props_1.HttpEnabled and v8.createElement(v27, {
                LayoutOrder = v121:getNextOrder(), 
                Secrets = l_props_1.Secrets, 
                OnChanged = function(v122) --[[ Line: 307 ]] --[[ Name: OnChanged ]]
                    -- upvalues: l_props_1 (copy)
                    l_props_1.SecretsChanged(v122);
                end
            }), 
            StudioApiServicesEnabled = v8.createElement(v23, {
                Description = l_Localization_1:getText("General", "StudioApiServicesDesc"), 
                Disabled = l_props_1.StudioAccessToApisAllowed == nil, 
                LayoutOrder = v121:getNextOrder(), 
                OnClick = function() --[[ Line: 316 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_props_1 (copy)
                    l_props_1.StudioApiServicesChanged(not l_props_1.StudioAccessToApisAllowed);
                end, 
                Selected = l_props_1.StudioAccessToApisAllowed, 
                Title = l_Localization_1:getText("General", "TitleStudioApiServices")
            }), 
            ThirdPartyPurchasesEnabled = v8.createElement(v23, {
                Description = l_Localization_1:getText("Security", "EnableThirdPartyPurchasesDescription"), 
                Disabled = l_props_1.ThirdPartyPurchaseAllowed == nil, 
                LayoutOrder = v121:getNextOrder(), 
                OnClick = function() --[[ Line: 327 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_props_1 (copy)
                    l_props_1.ThirdPartyPurchaseChanged(not l_props_1.ThirdPartyPurchaseAllowed);
                end, 
                Selected = l_props_1.ThirdPartyPurchaseAllowed, 
                Title = l_Localization_1:getText("Security", "EnableThirdPartyPurchases")
            }), 
            ThirdPartyTeleportsEnabled = v8.createElement(v23, {
                Description = l_Localization_1:getText("Security", "EnableThirdPartyTeleportsDescription"), 
                Disabled = l_props_1.ThirdPartyTeleportAllowed == nil, 
                LayoutOrder = v121:getNextOrder(), 
                OnClick = function() --[[ Line: 338 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_props_1 (copy)
                    l_props_1.ThirdPartyTeleportAllowedChanged(not l_props_1.ThirdPartyTeleportAllowed);
                end, 
                Selected = l_props_1.ThirdPartyTeleportAllowed, 
                Title = l_Localization_1:getText("Security", "EnableThirdPartyTeleports")
            }), 
            MeshTextureApisEnabled = if l_game_EngineFeature_0 then v8.createElement(v23, {
                Description = not v117 and l_Localization_1:getText("Security", "EnableMeshTextureApisNotOwnerDescription") or nil, 
                Disabled = not v118 or not v117 or l_props_1.MeshTextureApisAllowed == nil, 
                LayoutOrder = v121:getNextOrder(), 
                OnClick = function() --[[ Line: 352 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_props_1 (copy)
                    l_props_1.MeshTextureApisAllowedChanged(not l_props_1.MeshTextureApisAllowed);
                end, 
                Selected = l_props_1.MeshTextureApisAllowed, 
                Title = l_Localization_1:getText("Security", "EnableMeshTextureApis"), 
                LinkProps = v118 and {
                    Text = l_Localization_1:getText("Security", "EnableMeshTextureApisDescription", {
                        EditableMesh = "EditableMesh", 
                        EditableImage = "EditableImage"
                    }), 
                    LinkText = l_Localization_1:getText("Security", "MeshTextureApisPolicyLinkText"), 
                    OnLinkClicked = function() --[[ Line: 363 ]] --[[ Name: OnLinkClicked ]]
                        -- upvalues: v17 (ref), v29 (ref)
                        v17:OpenBrowserWindow(v29);
                    end
                } or not (not v117 or v119) and {
                    Text = l_Localization_1:getText("Security", "EnableMeshTextureApisIdActionableDescription"), 
                    LinkText = l_Localization_1:getText("Security", "AccountIdVerificationLinkText"), 
                    OnLinkClicked = function() --[[ Line: 369 ]] --[[ Name: OnLinkClicked ]]
                        -- upvalues: v17 (ref), v30 (ref)
                        v17:OpenBrowserWindow(v30);
                    end
                } or v119 and {
                    Text = l_Localization_1:getText("Security", "EnableMeshTextureApisIdDeniedDescription"), 
                    LinkText = l_Localization_1:getText("General", "GuidelinesLearnMoreLink"), 
                    OnLinkClicked = function() --[[ Line: 375 ]] --[[ Name: OnLinkClicked ]]
                        -- upvalues: v17 (ref), v31 (ref)
                        v17:OpenBrowserWindow(v31);
                    end
                }
            }) else nil
        };
    end;
    return v8.createElement(v25, {
        SettingsLoadJobs = v52, 
        SettingsSaveJobs = v94, 
        Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = v123
    });
end;
v105 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v105);
local v124 = require(l_Parent_0.Src.Networking.settingFromState);
v105 = v9.connect(function(v125, _) --[[ Line: 399 ]]
    -- upvalues: v124 (copy), l_game_EngineFeature_0 (copy), v101 (copy), v97 (copy)
    if not v125 then
        return;
    else
        local function v128(v127) --[[ Line: 404 ]]
            -- upvalues: v124 (ref), v125 (copy)
            return v124(v125.Settings, v127);
        end;
        local function v130(v129) --[[ Line: 408 ]]
            -- upvalues: v125 (copy)
            return v125.Settings.Changed[v129] ~= nil;
        end;
        if l_game_EngineFeature_0 then
            return (v101(v128, v130, v125));
        else
            return (v97(v128, v130));
        end;
    end;
end, function(v131) --[[ Line: 417 ]]
    -- upvalues: v24 (copy), v104 (copy)
    return (v104(function(v132) --[[ Line: 418 ]]
        -- upvalues: v131 (copy), v24 (ref)
        return function(v133) --[[ Line: 419 ]]
            -- upvalues: v131 (ref), v24 (ref), v132 (copy)
            v131(v24(v132, v133));
        end;
    end, v131));
end)(v105);
v105.LocalizationId = l_Name_0;
return v105;