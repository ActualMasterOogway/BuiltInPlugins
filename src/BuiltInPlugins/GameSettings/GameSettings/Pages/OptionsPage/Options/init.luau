local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Cryo);
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_1.Packages.RoactRodux);
local v5 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Parent_1.Src.Components.ToggleButtonWithTitle);
local v9 = require(l_Parent_1.Src.ContextServices.Dialog);
local l_Util_0 = v5.Util;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_UI_0 = v5.UI;
local l_Button_0 = l_UI_0.Button;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v17 = require(l_Parent_1.Src.Components.Dialog.SimpleDialog);
local v18 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v19 = require(l_Parent_1.Src.Actions.AddChange);
local v20 = require(l_Parent_0.Thunks.ShutdownAllServers);
local v21 = require(l_Parent_1.Src.Util.KeyProvider);
local _ = game:DefineFastString("SpatialVoiceChatLink", "https://create.roblox.com/docs/chat/spatial-voice");
local _ = game:GetService("GuiService");
local _ = v21.getVoiceChatEnabledKeyName();
local v25 = v21.getScriptCollaborationEnabledOnServerKeyName();
local v26 = v21.getTeamCreateEnabledKeyName();
local _ = game:GetFastFlag("MoveSpatialVoice");
game:GetFastFlag("GameSettingsRenameOptions");
local v28 = game:GetFastFlag("GameSettingsRenameOptions") and "Other" or script.Name;
local function v40(v29, v30) --[[ Line: 51 ]] --[[ Name: loadSettings ]]
    -- upvalues: v25 (copy), v26 (copy)
    local v31 = v29:getState();
    local l_game_0 = v31.Metadata.game;
    local _ = v31.Metadata.gameId;
    local l_gameOptionsController_0 = v30.gameOptionsController;
    return {
        function(v35) --[[ Line: 58 ]]
            -- upvalues: l_gameOptionsController_0 (copy), l_game_0 (copy)
            v35.ScriptCollabEnabled = l_gameOptionsController_0:getScriptCollaborationEnabled(l_game_0);
        end, 
        function(v36) --[[ Line: 64 ]]
            -- upvalues: l_gameOptionsController_0 (copy), l_game_0 (copy), v25 (ref)
            local v37 = l_gameOptionsController_0:getScriptCollaborationEnabledOnServer(l_game_0);
            v36[v25] = v37;
        end, 
        function(v38) --[[ Line: 70 ]]
            -- upvalues: l_gameOptionsController_0 (copy), v26 (ref)
            local v39 = l_gameOptionsController_0:getIsTeamCreateEnabled();
            v38[v26] = v39;
        end
    };
end;
local function v47(v41, v42) --[[ Line: 80 ]] --[[ Name: saveSettings ]]
    local v43 = v41:getState();
    local l_game_1 = v43.Metadata.game;
    local l_gameOptionsController_1 = v42.gameOptionsController;
    return {
        function() --[[ Line: 86 ]]
            -- upvalues: v43 (copy), l_gameOptionsController_1 (copy), l_game_1 (copy)
            local l_ScriptCollabEnabled_0 = v43.Settings.Changed.ScriptCollabEnabled;
            if l_ScriptCollabEnabled_0 ~= nil then
                l_gameOptionsController_1:setScriptCollaborationEnabled(l_game_1, l_ScriptCollabEnabled_0);
            end;
        end
    };
end;
local function v51(v48, v49) --[[ Line: 99 ]] --[[ Name: loadValuesToProps ]]
    local l_ScriptCollaborationEnabledOnServer_0 = v49.Settings.Current.ScriptCollaborationEnabledOnServer;
    return {
        ScriptCollabEnabled = v48("ScriptCollabEnabled"), 
        CurrentScriptCollabEnabled = v49.Settings.Current.ScriptCollabEnabled, 
        TeamCreateEnabled = v49.Settings.Current.TeamCreateEnabled or nil, 
        ScriptCollabEnabledOnServer = l_ScriptCollaborationEnabledOnServer_0
    };
end;
local function _(v52, v53) --[[ Line: 114 ]] --[[ Name: dispatchChanges ]]
    -- upvalues: v20 (copy)
    return {
        ScriptCollabEnabledChanged = v52("ScriptCollabEnabled"), 
        dispatchShutdownAllServers = function() --[[ Line: 117 ]] --[[ Name: dispatchShutdownAllServers ]]
            -- upvalues: v53 (copy), v20 (ref)
            v53(v20());
        end
    };
end;
local v55 = v3.PureComponent:extend(script.Name);
v55.render = function(v56) --[[ Line: 131 ]] --[[ Name: render ]]
    -- upvalues: l_GetTextSize_0 (copy), l_LayoutOrderIterator_0 (copy), v3 (copy), v8 (copy), l_TitledFrame_0 (copy), l_Button_0 (copy), v17 (copy), l_HoverArea_0 (copy), v2 (copy), v18 (copy), v40 (copy), v47 (copy), v28 (copy)
    local l_props_0 = v56.props;
    local l_Dialog_0 = l_props_0.Dialog;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local v61 = l_Localization_0:getText("General", "ButtonShutdownAllServers");
    local v62 = Vector2.new(1e999, l_Stylizer_0.button.height);
    local v63 = l_GetTextSize_0(v61, l_Stylizer_0.fontStyle.Header.TextSize, l_Stylizer_0.fontStyle.Header.Font, v62);
    local v64 = math.max(v63.X, l_Stylizer_0.button.width);
    local v65 = l_Stylizer_0.button.height - v63.Y;
    local v66 = UDim2.new(0, v64, 0, v63.Y + v65);
    local l_dispatchShutdownAllServers_0 = l_props_0.dispatchShutdownAllServers;
    local v68 = l_props_0.TeamCreateEnabled or false;
    local v69 = l_LayoutOrderIterator_0.new();
    local v70 = v68 and l_props_0.ScriptCollabEnabledOnServer ~= l_props_0.ScriptCollabEnabled;
    local v71 = nil;
    v71 = if not v68 then l_Localization_0:getText("General", "EnableTeamCreateForDraftsMode") else if v70 then l_Localization_0:getText("General", "ServerRestartWarning") else l_Localization_0:getText("General", "ScriptDraftsMode");
    local function v75() --[[ Line: 169 ]] --[[ Name: createChildren ]]
        -- upvalues: v56 (copy), v3 (ref), v8 (ref), v71 (ref), v69 (copy), v68 (copy), v70 (copy), l_TitledFrame_0 (ref), l_Button_0 (ref), v61 (copy), v66 (copy), l_Dialog_0 (copy), v17 (ref), l_dispatchShutdownAllServers_0 (copy), l_HoverArea_0 (ref), v2 (ref), l_Stylizer_0 (copy), v63 (copy)
        local l_props_1 = v56.props;
        local l_Localization_1 = l_props_1.Localization;
        return {
            EnableScriptCollab = v3.createElement(v8, {
                Title = l_Localization_1:getText("General", "TitleScriptDraftsMode"), 
                Description = v71, 
                LayoutOrder = v69:getNextOrder(), 
                Disabled = not v68, 
                Selected = l_props_1.ScriptCollabEnabled, 
                ShowWarning = v70, 
                OnClick = function() --[[ Line: 182 ]] --[[ Name: OnClick ]]
                    -- upvalues: l_props_1 (copy)
                    l_props_1.ScriptCollabEnabledChanged(not l_props_1.ScriptCollabEnabled);
                end
            }), 
            ShutdownAllServers = v3.createElement(l_TitledFrame_0, {
                LayoutOrder = v69:getNextOrder(), 
                Title = l_Localization_1:getText("General", "TitleShutdownAllServers")
            }, {
                VerticalLayout = v3.createElement("UIListLayout", {
                    FillDirection = Enum.FillDirection.Vertical, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                ShutdownButton = v3.createElement(l_Button_0, {
                    Style = "GameSettingsButton", 
                    Text = v61, 
                    Size = v66, 
                    LayoutOrder = 1, 
                    OnClick = function() --[[ Line: 201 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_Localization_1 (copy), l_Dialog_0 (ref), v17 (ref), l_dispatchShutdownAllServers_0 (ref)
                        local v74 = {
                            Size = Vector2.new(343, 145), 
                            Title = l_Localization_1:getText("General", "ShutdownDialogHeader"), 
                            Header = l_Localization_1:getText("General", "ShutdownDialogBody"), 
                            Buttons = {
                                l_Localization_1:getText("General", "ReplyNo"), 
                                l_Localization_1:getText("General", "ReplyYes")
                            }
                        };
                        if l_Dialog_0.showDialog(v17, v74):await() then
                            l_dispatchShutdownAllServers_0();
                        end;
                    end
                }, {
                    v3.createElement(l_HoverArea_0, {
                        Cursor = "PointingHand"
                    })
                }), 
                ShutdownButtonDescription = v3.createElement("TextLabel", v2.Dictionary.join(l_Stylizer_0.fontStyle.Subtext, {
                    Size = UDim2.new(1, 0, 0, v63.Y + l_Stylizer_0.shutdownButton.PaddingY), 
                    LayoutOrder = 2, 
                    BackgroundTransparency = 1, 
                    Text = l_Localization_1:getText("General", "StudioShutdownAllServicesDesc"), 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true
                }))
            })
        };
    end;
    return v3.createElement(v18, {
        SettingsLoadJobs = v40, 
        SettingsSaveJobs = v47, 
        Title = l_Localization_0:getText("General", "Category" .. v28), 
        PageId = v28, 
        CreateChildren = v75
    });
end;
v55 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Dialog = v9
})(v55);
local v76 = require(l_Parent_1.Src.Networking.settingFromState);
v55 = v4.connect(function(v77, _) --[[ Line: 255 ]]
    -- upvalues: v76 (copy), v51 (copy)
    if not v77 then
        return;
    else
        return (v51(function(v79) --[[ Line: 260 ]]
            -- upvalues: v76 (ref), v77 (copy)
            return v76(v77.Settings, v79);
        end, v77));
    end;
end, function(v80) --[[ Line: 265 ]]
    -- upvalues: v19 (copy), v20 (copy)
    return {
        ScriptCollabEnabledChanged = (function(v81) --[[ Line: 266 ]]
            -- upvalues: v80 (copy), v19 (ref)
            return function(v82) --[[ Line: 267 ]]
                -- upvalues: v80 (ref), v19 (ref), v81 (copy)
                v80(v19(v81, v82));
            end;
        end)("ScriptCollabEnabled"), 
        dispatchShutdownAllServers = function() --[[ Line: 117 ]] --[[ Name: dispatchShutdownAllServers ]]
            -- upvalues: v80 (copy), v20 (ref)
            v80(v20());
        end
    };
end)(v55);
v55.LocalizationId = v28;
return v55;