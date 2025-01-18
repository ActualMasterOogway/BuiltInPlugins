local v0 = newproxy(true);
local v1 = newproxy(true);
local v2 = newproxy(true);
local v3 = newproxy(true);
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local v6 = require(l_script_FirstAncestor_0.Packages.Roact);
local v7 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnimationData);
local v10 = UDim.new(0, v8.INDENT_PADDING);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v14 = require(l_Actions_0.SetInReviewState);
local v15 = require(l_Actions_0.SetIsDirty);
local v16 = require(l_Actions_0.SetIsLegacyAnimSaves);
local v17 = require(l_Actions_0.SetPlayState);
local v18 = require(l_Actions_0.SetReduceKeyframesDialogMode);
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v20 = require(l_Components_0.Toast.ActionToast);
local v21 = require(l_Components_0.AnimationClipMenu);
local v22 = require(l_Components_0.ContextButton);
local v23 = require(l_Components_0.EditEventsDialog.FocusedPrompt);
local v24 = require(l_Components_0.TextEntryPrompt);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v26 = require(l_Thunks_0.Exporting.CreateFromVideoAndImportFBXAnimationUserMayChooseModel);
local v27 = require(l_Thunks_0.Exporting.ImportFBXAnimationUserMayChooseModel);
local v28 = require(l_Thunks_0.Exporting.ImportKeyframeSequence);
local v29 = require(l_Thunks_0.Exporting.ImportLoadedFBXAnimation);
local v30 = require(l_Thunks_0.Exporting.LoadAnimation);
local v31 = require(l_Thunks_0.LoadAnimationData);
local v32 = require(l_Thunks_0.SanitizeAnimation);
local v33 = require(l_Thunks_0.Exporting.SaveAnimation);
local v34 = require(l_Thunks_0.UpdateMetadata);
local l_UI_0 = v5.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local v38 = require(l_script_FirstAncestor_0.LuaFlags.GetFFlagRenameClip);
local v39 = v6.PureComponent:extend("AnimationClipDropdown");
v39.init = function(v40) --[[ Line: 65 ]] --[[ Name: init ]]
    -- upvalues: v38 (copy), v8 (copy), v6 (copy), v1 (copy), v2 (copy), v3 (copy), v0 (copy), v9 (copy)
    v40.state = {
        showMenu = false, 
        showSaveAsPrompt = false, 
        showCreateNewPrompt = not not v38() and nil, 
        showImportAnimModelChoicePrompt = false, 
        showPromotePrompt = false, 
        overwriteName = nil, 
        loadingName = nil, 
        isActionLegacyAnimSaves = nil, 
        showCreateAnimationFromVideoTutorial = false
    };
    v40.showMenu = function() --[[ Line: 78 ]]
        -- upvalues: v40 (copy), v8 (ref)
        if not v40.props.ReadOnly then
            v40.props.SetPlayState(v8.PLAY_STATE.Pause);
            v40:setState({
                showMenu = true
            });
        end;
    end;
    v40.hideMenu = function() --[[ Line: 87 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            showMenu = false
        });
    end;
    v40.showOverwritePrompt = function(v41, v42) --[[ Line: 93 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            overwriteName = v41, 
            isActionLegacyAnimSaves = v42
        });
    end;
    v40.hideOverwritePrompt = function() --[[ Line: 100 ]]
        -- upvalues: v40 (copy), v6 (ref)
        v40:setState({
            overwriteName = v6.None, 
            isActionLegacyAnimSaves = v6.None
        });
    end;
    v40.showSaveAsPrompt = function() --[[ Line: 107 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            showSaveAsPrompt = true
        });
    end;
    v40.hideSaveAsPrompt = function() --[[ Line: 113 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            showSaveAsPrompt = false
        });
    end;
    v40.showImportAnimModelChoicePrompt = function() --[[ Line: 119 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            showImportAnimModelChoicePrompt = true
        });
    end;
    v40.hideImportAnimModelChoicePrompt = function() --[[ Line: 125 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            showImportAnimModelChoicePrompt = false
        });
    end;
    v40.showReduceKeyframesDialog = function() --[[ Line: 131 ]]
        -- upvalues: v40 (copy), v8 (ref)
        v40.props.SetReduceKeyframesDialogMode(v8.REDUCE_KEYFRAMES_DIALOG_MODE.FromMenu);
    end;
    v40.showCreateNewPrompt = not v38() and function() --[[ Line: 136 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            showCreateNewPrompt = true
        });
    end or nil;
    v40.hideCreateNewPrompt = not v38() and function() --[[ Line: 144 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            showCreateNewPrompt = false
        });
    end or nil;
    v40.showPromotePrompt = function() --[[ Line: 151 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            showPromotePrompt = true
        });
    end;
    v40.hidePromotePrompt = function() --[[ Line: 157 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            showPromotePrompt = false
        });
    end;
    v40.showLoadNewPrompt = function(v43, v44) --[[ Line: 163 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            loadingName = v43, 
            isActionLegacyAnimSaves = v44
        });
    end;
    v40.hideLoadNewPrompt = function() --[[ Line: 170 ]]
        -- upvalues: v40 (copy), v6 (ref)
        v40:setState({
            loadingName = v6.None, 
            isActionLegacyAnimSaves = v6.None
        });
    end;
    v40.setShowCreateAnimationFromVideoTutorial = function(v45) --[[ Line: 177 ]]
        -- upvalues: v40 (copy)
        v40:setState({
            showCreateAnimationFromVideoTutorial = v45
        });
    end;
    v40.continueAfterCreateAnimationFromVideoTutorial = function() --[[ Line: 183 ]]
        -- upvalues: v40 (copy)
        local l_props_0 = v40.props;
        l_props_0.SetInReviewState(false);
        l_props_0.CreateFromVideoAndImportFBXAnimationUserMayChooseModel(l_props_0.Plugin, v40, l_props_0.Analytics);
    end;
    v40.importRequested = function() --[[ Line: 189 ]]
        -- upvalues: v40 (copy), v1 (ref)
        if v40.props.IsDirty then
            v40.showLoadNewPrompt(v1);
            return;
        else
            local l_Plugin_0 = v40.props.Plugin;
            v40.props.SetInReviewState(false);
            v40.props.ImportKeyframeSequence(l_Plugin_0, v40.props.Analytics);
            return;
        end;
    end;
    v40.importFbxRequested = function() --[[ Line: 199 ]]
        -- upvalues: v40 (copy), v2 (ref)
        if v40.props.IsDirty then
            v40.showLoadNewPrompt(v2);
            return;
        else
            local l_Plugin_1 = v40.props.Plugin;
            v40.props.SetInReviewState(false);
            v40.props.ImportFBXAnimationUserMayChooseModel(l_Plugin_1, v40, v40.props.Analytics);
            return;
        end;
    end;
    v40.startAnimationFromVideoFlow = function() --[[ Line: 209 ]]
        -- upvalues: v40 (copy)
        v40.props.Analytics:report("onAnimationEditorImportVideoCreate");
        v40.setShowCreateAnimationFromVideoTutorial(true);
    end;
    v40.createFromVideoRequested = function() --[[ Line: 214 ]]
        -- upvalues: v40 (copy), v3 (ref)
        if v40.props.IsDirty then
            v40.showLoadNewPrompt(v3);
            return;
        else
            v40.props.SetInReviewState(false);
            v40.startAnimationFromVideoFlow();
            return;
        end;
    end;
    v40.createNew = function() --[[ Line: 223 ]]
        -- upvalues: v40 (copy), v0 (ref), v38 (ref)
        if v40.props.IsDirty then
            v40.showLoadNewPrompt(v0);
            return;
        else
            v40.props.SetInReviewState(false);
            if v38() then
                v40.createNewClip();
                return;
            else
                v40.showCreateNewPrompt();
                return;
            end;
        end;
    end;
    v40.createNewClip = function() --[[ Line: 236 ]]
        -- upvalues: v40 (copy), v9 (ref)
        local l_Analytics_0 = v40.props.Analytics;
        local l_Localization_0 = v40.props.Localization;
        local v51 = v9.newRigAnimation(l_Localization_0:getText("Title", "DefaultAnimationName"));
        v40.props.LoadAnimationData(v51, l_Analytics_0);
        v40.props.SetIsDirty(false);
        v40.props.SetIsLegacyAnimSaves(false);
    end;
    v40.loadNew = function(v52, v53) --[[ Line: 245 ]]
        -- upvalues: v40 (copy)
        if v40.props.IsDirty then
            v40.showLoadNewPrompt(v52, v53);
            return;
        else
            v40.props.SetInReviewState(false);
            v40.props.LoadAnimation(v52, v53, v40.props.Analytics);
            return;
        end;
    end;
    v40.handleLoadNewPrompt = function() --[[ Line: 254 ]]
        -- upvalues: v40 (copy), v0 (ref), v38 (ref), v1 (ref), v2 (ref), v3 (ref)
        local l_props_1 = v40.props;
        local l_state_0 = v40.state;
        local l_loadingName_0 = l_state_0.loadingName;
        local l_isActionLegacyAnimSaves_0 = l_state_0.isActionLegacyAnimSaves;
        local l_Plugin_2 = v40.props.Plugin;
        v40.hideLoadNewPrompt();
        v40.props.SetInReviewState(false);
        if l_loadingName_0 == v0 then
            if v38() then
                v40.createNewClip();
                return;
            else
                v40.showCreateNewPrompt();
                return;
            end;
        elseif l_loadingName_0 == v1 then
            l_props_1.ImportKeyframeSequence(l_Plugin_2, l_props_1.Analytics);
            return;
        elseif l_loadingName_0 == v2 then
            l_props_1.ImportFBXAnimationUserMayChooseModel(l_Plugin_2, v40, l_props_1.Analytics);
            return;
        elseif l_loadingName_0 == v3 then
            v40.startAnimationFromVideoFlow();
            return;
        else
            l_props_1.LoadAnimation(l_loadingName_0, l_isActionLegacyAnimSaves_0, l_props_1.Analytics);
            return;
        end;
    end;
    v40.onSanitizeAnimation = function() --[[ Line: 280 ]]
        -- upvalues: v40 (copy)
        local l_props_2 = v40.props;
        l_props_2.SanitizeAnimation(l_props_2.Analytics);
    end;
end;
v39.render = function(v60) --[[ Line: 286 ]] --[[ Name: render ]]
    -- upvalues: v6 (copy), v8 (copy), v10 (copy), v38 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), v22 (copy), v21 (copy), v24 (copy), v9 (copy), v20 (copy), v23 (copy)
    local l_Localization_1 = v60.props.Localization;
    local l_props_3 = v60.props;
    local l_state_1 = v60.state;
    local l_Stylizer_0 = l_props_3.Stylizer;
    local l_AnimationName_0 = l_props_3.AnimationName;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_IsChannelAnimation_0 = l_props_3.IsChannelAnimation;
    local l_dropdownTheme_0 = l_Stylizer_0.dropdownTheme;
    local l_showMenu_0 = l_state_1.showMenu;
    local l_showSaveAsPrompt_0 = l_state_1.showSaveAsPrompt;
    local l_showCreateNewPrompt_0 = l_state_1.showCreateNewPrompt;
    local l_showImportAnimModelChoicePrompt_0 = l_state_1.showImportAnimModelChoicePrompt;
    local l_overwriteName_0 = l_state_1.overwriteName;
    local l_loadingName_1 = l_state_1.loadingName;
    local l_showPromotePrompt_0 = l_state_1.showPromotePrompt;
    local l_IsLegacyAnimSaves_0 = l_props_3.IsLegacyAnimSaves;
    local l_isActionLegacyAnimSaves_1 = l_state_1.isActionLegacyAnimSaves;
    local l_showCreateAnimationFromVideoTutorial_0 = l_state_1.showCreateAnimationFromVideoTutorial;
    local v79 = false;
    if l_showCreateAnimationFromVideoTutorial_0 then
        v79 = game:GetService("AnimationFromVideoCreatorStudioService"):IsAgeRestricted();
        if v79 then
            l_showCreateAnimationFromVideoTutorial_0 = false;
        end;
    end;
    return v6.createElement("ImageButton", {
        Size = UDim2.new(1, -v8.CONTROLS_WIDTH - v8.TIME_DISPLAY_WIDTH, 1, 0), 
        BackgroundTransparency = 1, 
        ImageTransparency = 1, 
        AutoButtonColor = false, 
        LayoutOrder = l_LayoutOrder_0, 
        [v6.Event.Activated] = v60.showMenu
    }, {
        Padding = v6.createElement("UIPadding", {
            PaddingLeft = v10, 
            PaddingRight = v10
        }), 
        AnimationClipLabel = if v38() then v6.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            Size = UDim2.new(1, -v8.TRACKLIST_BUTTON_SIZE - v8.INDENT_PADDING, 1, -6), 
            Position = UDim2.fromScale(0, 0.5)
        }, {
            v6.createElement(l_TextInput_0, {
                Size = UDim2.fromScale(1, 1), 
                Text = l_AnimationName_0, 
                OnValidateText = function(v80) --[[ Line: 348 ]] --[[ Name: OnValidateText ]]
                    return v80 ~= "";
                end, 
                OnFocusLost = v60.props.SetAnimationName
            })
        }) else v6.createElement("TextLabel", {
            Size = UDim2.new(1, -v8.TRACKLIST_BUTTON_SIZE - v8.INDENT_PADDING, 1, 0), 
            BackgroundTransparency = 1, 
            Text = l_AnimationName_0, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextSize = l_dropdownTheme_0.textSize, 
            Font = l_Stylizer_0.font, 
            TextColor3 = l_dropdownTheme_0.textColor, 
            TextXAlignment = Enum.TextXAlignment.Left
        }), 
        ContextButton = v6.createElement(v22, {
            AnchorPoint = Vector2.new(1, 0.5), 
            Position = UDim2.new(1, 0, 0.5, 0), 
            OnActivated = v60.showMenu
        }), 
        AnimationClipMenu = v6.createElement(v21, {
            ShowMenu = l_showMenu_0, 
            CurrentAnimation = l_AnimationName_0, 
            IsLegacyAnimSaves = l_IsLegacyAnimSaves_0, 
            IsChannelAnimation = l_IsChannelAnimation_0, 
            OnMenuOpened = v60.hideMenu, 
            OnOverwriteRequested = v60.showOverwritePrompt, 
            OnSaveAsRequested = v60.showSaveAsPrompt, 
            OnCreateNewRequested = v60.createNew, 
            OnLoadRequested = v60.loadNew, 
            OnImportRequested = v60.importRequested, 
            OnImportFbxRequested = v60.importFbxRequested, 
            OnCreateFromVideoRequested = v60.createFromVideoRequested, 
            OnPromoteRequested = v60.showPromotePrompt, 
            OnReduceKeyframesRequested = v60.showReduceKeyframesDialog, 
            OnSanitizeAnimation = v60.onSanitizeAnimation
        }), 
        CreateNewPrompt = if not v38() then l_showCreateNewPrompt_0 and v6.createElement(v24, {
            PromptText = l_Localization_1:getText("Title", "CreateNew"), 
            InputText = l_Localization_1:getText("Dialog", "AnimationName"), 
            Text = l_Localization_1:getText("Title", "DefaultAnimationName"), 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_1:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_1:getText("Dialog", "Create"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnTextSubmitted = function(v81) --[[ Line: 399 ]] --[[ Name: OnTextSubmitted ]]
                -- upvalues: v60 (copy), v9 (ref), l_props_3 (copy)
                v60.hideCreateNewPrompt();
                local v82 = v9.newRigAnimation(v81);
                l_props_3.LoadAnimationData(v82, v60.props.Analytics);
                l_props_3.SetIsDirty(false);
                l_props_3.SetIsLegacyAnimSaves(false);
                l_props_3.Analytics:report("onCreateNewAnimation", v81, if v82.Metadata then v82.Metadata.Guid else nil);
            end, 
            OnClose = v60.hideCreateNewPrompt
        }) else nil, 
        SaveAsPrompt = l_showSaveAsPrompt_0 and v6.createElement(v24, {
            PromptText = l_Localization_1:getText("Title", "SaveAsNew"), 
            InputText = l_Localization_1:getText("Dialog", "AnimationName"), 
            NoticeText = l_Localization_1:getText("Dialog", "SaveLocation"), 
            Text = l_AnimationName_0, 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_1:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_1:getText("Dialog", "Save"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnTextSubmitted = function(v83) --[[ Line: 424 ]] --[[ Name: OnTextSubmitted ]]
                -- upvalues: v60 (copy), l_props_3 (copy)
                v60.hideSaveAsPrompt();
                l_props_3.SetIsLegacyAnimSaves(false);
                l_props_3.SaveAnimation(v83, l_props_3.Analytics);
            end, 
            OnClose = v60.hideSaveAsPrompt
        }), 
        ImportAnimModelChoicePrompt = l_showImportAnimModelChoicePrompt_0 and v6.createElement(v20, {
            Text = l_Localization_1:getText("Toast", "AnimationImportModelsDiffer"), 
            ButtonWidth = v8.PROMPT_BUTTON_SIZE.X * 1.5, 
            Buttons = {
                {
                    Key = true, 
                    Text = l_Localization_1:getText("Toast", "AnimationImportUseFBX"), 
                    Style = "Round"
                }, 
                {
                    Key = false, 
                    Text = l_Localization_1:getText("Toast", "AnimationImportUseSelected"), 
                    Style = "Round"
                }
            }, 
            OnButtonClicked = function(v84) --[[ Line: 439 ]] --[[ Name: OnButtonClicked ]]
                -- upvalues: v60 (copy)
                v60.hideImportAnimModelChoicePrompt();
                v60.props.ImportLoadedFBXAnimation(plugin, v84, v60.props.Analytics);
            end
        }), 
        OverwritePrompt = l_overwriteName_0 and v6.createElement(v23, {
            PromptText = l_Localization_1:getText("Menu", "Overwrite_Migrated", {
                overwriteName = l_overwriteName_0
            }), 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_1:getText("Dialog", "No"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_1:getText("Dialog", "Yes"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnButtonClicked = function(v85) --[[ Line: 451 ]] --[[ Name: OnButtonClicked ]]
                -- upvalues: v60 (copy), l_props_3 (copy), l_isActionLegacyAnimSaves_1 (copy), l_overwriteName_0 (copy)
                v60.hideOverwritePrompt();
                if v85 then
                    l_props_3.SetIsLegacyAnimSaves(l_isActionLegacyAnimSaves_1);
                    l_props_3.SaveAnimation(l_overwriteName_0, l_props_3.Analytics);
                end;
            end, 
            OnClose = v60.hideOverwritePrompt
        }), 
        PromotePrompt = l_showPromotePrompt_0 and v6.createElement(v23, {
            PromptText = l_Localization_1:getText("Dialog", "PromotePrompt"), 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_1:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_1:getText("Dialog", "Confirm"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnButtonClicked = function(v86) --[[ Line: 470 ]] --[[ Name: OnButtonClicked ]]
                -- upvalues: v60 (copy), l_props_3 (copy)
                v60.hidePromotePrompt();
                if v86 then
                    l_props_3.PromoteKeyframeSequence(l_props_3.Analytics);
                end;
            end, 
            OnClose = v60.hidePromotePrompt
        }) or nil, 
        LoadNewPrompt = l_loadingName_1 and v6.createElement(v24, {
            PromptText = l_Localization_1:getText("Title", "ConfirmSave"), 
            InputText = l_Localization_1:getText("Dialog", "AnimationName"), 
            NoticeText = l_Localization_1:getText("Dialog", "SaveLocation"), 
            Text = l_AnimationName_0, 
            Buttons = {
                {
                    Key = "Delete", 
                    Text = l_Localization_1:getText("Dialog", "Delete"), 
                    Style = "Round"
                }, 
                {
                    Key = false, 
                    Text = l_Localization_1:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_1:getText("Dialog", "Save"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnButtonClicked = function(v87) --[[ Line: 489 ]] --[[ Name: OnButtonClicked ]]
                -- upvalues: v60 (copy)
                if v87 == "Delete" then
                    v60.handleLoadNewPrompt();
                end;
            end, 
            OnTextSubmitted = function(v88) --[[ Line: 494 ]] --[[ Name: OnTextSubmitted ]]
                -- upvalues: l_props_3 (copy), v60 (copy)
                l_props_3.SaveAnimation(v88, l_props_3.Analytics);
                v60.handleLoadNewPrompt();
            end, 
            OnClose = v60.hideLoadNewPrompt
        }), 
        CreateAnimationFromVideoTutorial = l_showCreateAnimationFromVideoTutorial_0 and v6.createElement(v23, {
            PromptText = l_Localization_1:getText("AnimationFromVideo", "TutorialText"), 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_1:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }, 
                {
                    Key = true, 
                    Text = l_Localization_1:getText("AnimationFromVideo", "ChooseVideo"), 
                    Style = "RoundPrimary"
                }
            }, 
            OnButtonClicked = function(v89) --[[ Line: 512 ]] --[[ Name: OnButtonClicked ]]
                -- upvalues: v60 (copy)
                v60.setShowCreateAnimationFromVideoTutorial(false);
                if v89 then
                    v60.continueAfterCreateAnimationFromVideoTutorial();
                end;
            end, 
            OnClose = function() --[[ Line: 518 ]] --[[ Name: OnClose ]]
                -- upvalues: v60 (copy)
                v60.setShowCreateAnimationFromVideoTutorial(false);
            end
        }), 
        CreateAnimationFromVideoAgeGate = v79 and v6.createElement(v23, {
            Size = UDim2.new(0, v8.PROMPT_SIZE.Width.Offset, 0, 180), 
            PromptText = l_Localization_1:getText("AnimationFromVideo", "AgeRestricted"), 
            Buttons = {
                {
                    Key = false, 
                    Text = l_Localization_1:getText("Dialog", "Cancel"), 
                    Style = "Round"
                }
            }, 
            OnButtonClicked = function() --[[ Line: 530 ]] --[[ Name: OnButtonClicked ]]
                -- upvalues: v60 (copy)
                v60.setShowCreateAnimationFromVideoTutorial(false);
            end, 
            OnClose = function() --[[ Line: 533 ]] --[[ Name: OnClose ]]
                -- upvalues: v60 (copy)
                v60.setShowCreateAnimationFromVideoTutorial(false);
            end
        })
    });
end;
v39 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Analytics = l_ContextServices_0.Analytics
})(v39);
return v7.connect(function(v90, _) --[[ Line: 547 ]] --[[ Name: mapStateToProps ]]
    return {
        Analytics = v90.Analytics, 
        IsDirty = v90.Status.IsDirty, 
        ReadOnly = v90.Status.ReadOnly
    };
end, function(v92) --[[ Line: 555 ]] --[[ Name: mapDispatchToProps ]]
    -- upvalues: v31 (copy), v30 (copy), v33 (copy), v28 (copy), v27 (copy), v26 (copy), v29 (copy), v32 (copy), v34 (copy), v14 (copy), v15 (copy), v16 (copy), v17 (copy), v18 (copy)
    return {
        LoadAnimationData = function(v93, v94) --[[ Line: 557 ]] --[[ Name: LoadAnimationData ]]
            -- upvalues: v92 (copy), v31 (ref)
            v92(v31(v93, v94));
        end, 
        LoadAnimation = function(v95, v96, v97) --[[ Line: 561 ]] --[[ Name: LoadAnimation ]]
            -- upvalues: v92 (copy), v30 (ref)
            v92(v30(v95, v96, v97));
        end, 
        SaveAnimation = function(v98, v99) --[[ Line: 565 ]] --[[ Name: SaveAnimation ]]
            -- upvalues: v92 (copy), v33 (ref)
            v92(v33(v98, v99));
        end, 
        ImportKeyframeSequence = function(v100, v101) --[[ Line: 569 ]] --[[ Name: ImportKeyframeSequence ]]
            -- upvalues: v92 (copy), v28 (ref)
            v92(v28(v100, v101));
        end, 
        ImportFBXAnimationUserMayChooseModel = function(v102, v103, v104) --[[ Line: 573 ]] --[[ Name: ImportFBXAnimationUserMayChooseModel ]]
            -- upvalues: v92 (copy), v27 (ref)
            v92(v27(v102, v103, v104));
        end, 
        CreateFromVideoAndImportFBXAnimationUserMayChooseModel = function(v105, v106, v107) --[[ Line: 577 ]] --[[ Name: CreateFromVideoAndImportFBXAnimationUserMayChooseModel ]]
            -- upvalues: v92 (copy), v26 (ref)
            v92(v26(v105, v106, v107));
        end, 
        ImportLoadedFBXAnimation = function(v108, v109, v110) --[[ Line: 581 ]] --[[ Name: ImportLoadedFBXAnimation ]]
            -- upvalues: v92 (copy), v29 (ref)
            v92(v29(v108, v109, v110));
        end, 
        SanitizeAnimation = function(v111) --[[ Line: 585 ]] --[[ Name: SanitizeAnimation ]]
            -- upvalues: v92 (copy), v32 (ref)
            v92(v32(v111));
        end, 
        SetAnimationName = function(v112) --[[ Line: 589 ]] --[[ Name: SetAnimationName ]]
            -- upvalues: v92 (copy), v34 (ref)
            v92(v34({
                Name = v112
            }));
        end, 
        SetInReviewState = function(v113) --[[ Line: 593 ]] --[[ Name: SetInReviewState ]]
            -- upvalues: v92 (copy), v14 (ref)
            v92(v14(v113));
        end, 
        SetIsDirty = function(v114) --[[ Line: 597 ]] --[[ Name: SetIsDirty ]]
            -- upvalues: v92 (copy), v15 (ref)
            v92(v15(v114));
        end, 
        SetIsLegacyAnimSaves = function(v115) --[[ Line: 601 ]] --[[ Name: SetIsLegacyAnimSaves ]]
            -- upvalues: v92 (copy), v16 (ref)
            v92(v16(v115));
        end, 
        SetPlayState = function(v116) --[[ Line: 605 ]] --[[ Name: SetPlayState ]]
            -- upvalues: v92 (copy), v17 (ref)
            v92(v17(v116));
        end, 
        SetReduceKeyframesDialogMode = function(v117) --[[ Line: 609 ]] --[[ Name: SetReduceKeyframesDialogMode ]]
            -- upvalues: v92 (copy), v18 (ref)
            v92(v18(v117));
        end
    };
end)(v39);