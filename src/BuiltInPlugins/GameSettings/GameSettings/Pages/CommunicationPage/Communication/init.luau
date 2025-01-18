local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local v4 = require(l_Parent_0.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.Components.ToggleButtonWithTitle);
local v8 = require(l_Parent_0.Src.ContextServices.Dialog);
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v10 = require(l_Parent_0.Src.Components.SettingsPages.SettingsPage);
local v11 = require(l_Parent_0.Src.Actions.AddChange);
local v12 = require(l_Parent_0.Src.Util.KeyProvider);
local l_GuiService_0 = game:GetService("GuiService");
local v14 = game:DefineFastFlag("AvatarChatMicCameraCouple", false);
local v15 = game:DefineFastString("AvatarChatSettingsAudioLink", "https://developer.roblox.com/articles/chat-with-avatars-audio");
local v16 = game:DefineFastString("AvatarChatSettingsVideoLink", "https://developer.roblox.com/articles/chat-with-avatars-video");
local _ = game:DefineFastString("SpatialVoiceChatLink", "https://create.roblox.com/docs/chat/spatial-voice");
local v18 = v12.getAvatarChatAudioEnabledKeyName();
local v19 = v12.getAvatarChatVideoEnabledKeyName();
local l_Name_0 = script.Name;
local function v27(v21, v22) --[[ Line: 47 ]] --[[ Name: loadSettings ]]
    -- upvalues: v18 (copy), v19 (copy)
    local l_gameId_0 = v21:getState().Metadata.gameId;
    local l_communicationController_0 = v22.communicationController;
    return {
        function(v25) --[[ Line: 53 ]]
            -- upvalues: l_communicationController_0 (copy), l_gameId_0 (copy), v18 (ref), v19 (ref)
            local v26 = l_communicationController_0:getAvatarChatSettings(l_gameId_0);
            v25[v18] = v26.audioEnabled;
            v25[v19] = v26.videoEnabled;
        end
    };
end;
local function v35(v28, v29) --[[ Line: 62 ]] --[[ Name: saveSettings ]]
    local v30 = v28:getState();
    local l_gameId_1 = v30.Metadata.gameId;
    local l_communicationController_1 = v29.communicationController;
    return {
        function() --[[ Line: 68 ]]
            -- upvalues: v30 (copy), l_communicationController_1 (copy), l_gameId_1 (copy)
            local l_AvatarChatAudioEnabled_0 = v30.Settings.Changed.AvatarChatAudioEnabled;
            local l_AvatarChatVideoEnabled_0 = v30.Settings.Changed.AvatarChatVideoEnabled;
            if l_AvatarChatAudioEnabled_0 ~= nil or l_AvatarChatVideoEnabled_0 ~= nil then
                l_communicationController_1:setAvatarChatSettings(l_gameId_1, l_AvatarChatAudioEnabled_0, l_AvatarChatVideoEnabled_0);
            end;
        end
    };
end;
local _ = function(v36, _) --[[ Line: 80 ]] --[[ Name: loadValuesToProps ]]
    -- upvalues: v18 (copy), v19 (copy)
    return {
        AvatarChatAudioEnabled = v36(v18), 
        AvatarChatVideoEnabled = v36(v19)
    };
end;
local _ = function(v39, _) --[[ Line: 88 ]] --[[ Name: dispatchChanges ]]
    -- upvalues: v18 (copy), v19 (copy)
    return {
        AvatarChatAudioEnabledChanged = v39(v18), 
        AvatarChatVideoEnabledChanged = v39(v19)
    };
end;
local v42 = v1.PureComponent:extend(script.Name);
v42.render = function(v43) --[[ Line: 97 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v14 (copy), l_GuiService_0 (copy), v15 (copy), v16 (copy), v1 (copy), v7 (copy), v10 (copy), v27 (copy), v35 (copy), l_Name_0 (copy)
    local l_props_0 = v43.props;
    local l_Localization_0 = l_props_0.Localization;
    local v46 = l_LayoutOrderIterator_0.new();
    local v47 = false;
    if v14 and not l_props_0.AvatarChatAudioEnabled then
        v47 = true;
    end;
    local function v52() --[[ Line: 108 ]] --[[ Name: createChildren ]]
        -- upvalues: v43 (copy), v46 (copy), v14 (ref), l_GuiService_0 (ref), v15 (ref), v47 (ref), v16 (ref), v1 (ref), v7 (ref)
        local l_props_1 = v43.props;
        local l_Localization_1 = l_props_1.Localization;
        local v50 = {
            Title = l_Localization_1:getText("AvatarChat", "AudioTitle"), 
            LayoutOrder = v46:getNextOrder(), 
            Disabled = false, 
            Selected = l_props_1.AvatarChatAudioEnabled, 
            OnClick = function() --[[ Line: 117 ]] --[[ Name: OnClick ]]
                -- upvalues: l_props_1 (copy), v14 (ref)
                l_props_1.AvatarChatAudioEnabledChanged(not l_props_1.AvatarChatAudioEnabled);
                if v14 and l_props_1.AvatarChatVideoEnabled then
                    l_props_1.AvatarChatVideoEnabledChanged(false);
                end;
            end, 
            LinkProps = {
                Text = l_Localization_1:getText("AvatarChat", "AudioBody"), 
                LinkText = l_Localization_1:getText("General", "LearnMoreLink"), 
                OnLinkClicked = function() --[[ Line: 128 ]] --[[ Name: OnLinkClicked ]]
                    -- upvalues: l_GuiService_0 (ref), v15 (ref)
                    l_GuiService_0:OpenBrowserWindow(v15);
                end
            }
        };
        local v51 = {
            Title = l_Localization_1:getText("AvatarChat", "VideoTitle"), 
            LayoutOrder = v46:getNextOrder(), 
            Disabled = v47, 
            Selected = (not v14 or l_props_1.AvatarChatAudioEnabled) and l_props_1.AvatarChatVideoEnabled, 
            OnClick = function() --[[ Line: 139 ]] --[[ Name: OnClick ]]
                -- upvalues: l_props_1 (copy)
                l_props_1.AvatarChatVideoEnabledChanged(not l_props_1.AvatarChatVideoEnabled);
            end, 
            LinkProps = {
                Text = l_Localization_1:getText("AvatarChat", "VideoBody"), 
                LinkText = l_Localization_1:getText("General", "LearnMoreLink"), 
                OnLinkClicked = function() --[[ Line: 147 ]] --[[ Name: OnLinkClicked ]]
                    -- upvalues: l_GuiService_0 (ref), v16 (ref)
                    l_GuiService_0:OpenBrowserWindow(v16);
                end
            }
        };
        return {
            EnableAvatarChatAudio = v1.createElement(v7, v50), 
            EnableAvatarChatVideo = v1.createElement(v7, v51)
        };
    end;
    return v1.createElement(v10, {
        SettingsLoadJobs = v27, 
        SettingsSaveJobs = v35, 
        Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
        PageId = l_Name_0, 
        CreateChildren = v52
    });
end;
v42 = l_withContext_0({
    Stylizer = if v4 then nil else l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Dialog = v8
})(v42);
local v53 = require(l_Parent_0.Src.Networking.settingFromState);
v42 = v2.connect(function(v54, _) --[[ Line: 174 ]]
    -- upvalues: v53 (copy), v18 (copy), v19 (copy)
    if not v54 then
        return;
    else
        local function v57(v56) --[[ Line: 179 ]]
            -- upvalues: v53 (ref), v54 (copy)
            return v53(v54.Settings, v56);
        end;
        return {
            AvatarChatAudioEnabled = v57(v18), 
            AvatarChatVideoEnabled = v57(v19)
        };
    end;
end, function(v58) --[[ Line: 184 ]]
    -- upvalues: v11 (copy), v18 (copy), v19 (copy)
    local function v61(v59) --[[ Line: 185 ]]
        -- upvalues: v58 (copy), v11 (ref)
        return function(v60) --[[ Line: 186 ]]
            -- upvalues: v58 (ref), v11 (ref), v59 (copy)
            v58(v11(v59, v60));
        end;
    end;
    return {
        AvatarChatAudioEnabledChanged = v61(v18), 
        AvatarChatVideoEnabledChanged = v61(v19)
    };
end)(v42);
v42.LocalizationId = l_Name_0;
return v42;