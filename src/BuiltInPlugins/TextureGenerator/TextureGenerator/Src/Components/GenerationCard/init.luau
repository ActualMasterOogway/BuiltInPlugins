local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_TextureGenerationService_0 = game:GetService("TextureGenerationService");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v2.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Button_0 = l_UI_0.Button;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_Dialog_0 = l_UI_0.Dialog;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Separator_0 = l_UI_0.Separator;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TimeProgressBar_0 = l_UI_0.TimeProgressBar;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local _ = v2.Util.StyleModifier;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v25 = require(l_Hooks_0.useSelectedMeshParts);
local v26 = require(l_script_FirstAncestor_0.Src.Util.cloneIgnoreArchivable);
local v27 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v28 = require(l_script_FirstAncestor_0.Src.Util.formatFeedbackTable);
local v29 = require(l_script_FirstAncestor_0.Src.Util.GenerationsContext);
local v30 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v31 = require(l_script_FirstAncestor_0.Src.Util.setTexture);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_GuiService_0 = game:GetService("GuiService");
local l_Workspace_0 = game:GetService("Workspace");
local v36 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorMuteSounds);
local v37 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetry);
local v38 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetryIncludeLocalId);
local v39 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorAddFeedback);
local v40 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorFixNilIndexBug);
local v41 = game:DefineFastFlag("FormatTextureGeneratorFeedbackTable", false);
local function v44(v42, v43) --[[ Line: 58 ]] --[[ Name: getDropdownMenuOptions ]]
    -- upvalues: v27 (copy)
    return {
        {
            Id = v27.DROPDOWN_ACTIONS.INSERT, 
            Text = v42:getText("DropdownOptions", "Insert"), 
            OnItemClicked = v43
        }, 
        {
            Id = v27.DROPDOWN_ACTIONS.INVENTORY, 
            Text = v42:getText("DropdownOptions", "Inventory"), 
            OnItemClicked = v43
        }, 
        {
            Id = v27.DROPDOWN_ACTIONS.EXPORT, 
            Text = v42:getText("DropdownOptions", "Export"), 
            OnItemClicked = v43
        }, 
        {
            Id = v27.DROPDOWN_ACTIONS.REMOVE, 
            Text = v42:getText("DropdownOptions", "Remove"), 
            OnItemClicked = v43
        }
    };
end;
local _ = function(v45, v46) --[[ Line: 84 ]] --[[ Name: useCloneInstanceModel ]]
    -- upvalues: v3 (copy), v40 (copy), v26 (copy), v31 (copy)
    return v3.useMemo(function() --[[ Line: 85 ]]
        -- upvalues: v45 (copy), v40 (ref), v26 (ref), v46 (copy), v31 (ref)
        if v45 then
            local l_Model_0 = Instance.new("Model");
            for _, v49 in v45 do
                local v50 = nil;
                if v40() then
                    v50 = v26(v49);
                    if not v50 then
                        continue;
                    end;
                else
                    v50 = v49:Clone();
                end;
                if v46 then
                    v31(v50, v46);
                end;
                v50.Parent = l_Model_0;
            end;
            return l_Model_0;
        else
            return nil;
        end;
    end, {
        v45, 
        v46
    });
end;
local function _(v52, v53) --[[ Line: 109 ]] --[[ Name: getCameraOffset ]]
    local l_ViewportSize_0 = v53.ViewportSize;
    local v55 = math.min(1, l_ViewportSize_0.X / l_ViewportSize_0.Y);
    local v56 = math.atan(math.tan((math.rad(v53.FieldOfView / 2))) * v55);
    return v52.Magnitude / 2 / math.sin(v56);
end;
local function v65(v58) --[[ Line: 126 ]] --[[ Name: GenerationInProgress ]]
    -- upvalues: l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), l_Stylizer_0 (copy), v3 (copy), l_Pane_0 (copy), l_Image_0 (copy), l_TimeProgressBar_0 (copy), l_TextLabel_0 (copy), l_Button_0 (copy)
    local v59 = l_Localization_0:use();
    local v60 = l_LayoutOrderIterator_0.new();
    local l_startTime_0 = v58.Generation.startTime;
    local v62 = tonumber(v58.Generation.estimatedWaitDurationSeconds);
    local l_previewImage_0 = v58.Generation.previewImage;
    local v64 = l_Stylizer_0:use("GenerationCard");
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = v64.Padding, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        Size = UDim2.fromScale(1, 0)
    }, {
        PreviewImage = if l_previewImage_0 then v3.createElement(l_Image_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = v60:getNextOrder(), 
            Size = v64.PreviewImageSize, 
            Image = l_previewImage_0.previewId, 
            Position = UDim2.fromScale(0.5, 0.5)
        }) else nil, 
        Content = if v62 then v3.createElement(l_TimeProgressBar_0, {
            LayoutOrder = v60:getNextOrder(), 
            StartTime = l_startTime_0, 
            TotalTime = v62, 
            Width = v64.ProgressBarWidth
        }) else v3.createElement(l_TextLabel_0, {
            LayoutOrder = v60:getNextOrder(), 
            Size = v64.PromptLabelProgressSize, 
            Text = v58.Generation.prompt, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        }), 
        CancelButton = v3.createElement(l_Button_0, {
            LayoutOrder = v60:getNextOrder(), 
            Size = v64.CancelButtonSize, 
            OnClick = v58.OnCancel, 
            Style = v64.CancelButtonStyle, 
            Text = v59:getText("GenerationCard", "Cancel")
        })
    });
end;
local function v117(v66) --[[ Line: 187 ]] --[[ Name: GenerationFinished ]]
    -- upvalues: v3 (copy), v29 (copy), l_Localization_0 (copy), l_ContextServices_0 (copy), l_LayoutOrderIterator_0 (copy), l_Analytics_0 (copy), l_Stylizer_0 (copy), v27 (copy), v40 (copy), v26 (copy), v31 (copy), v39 (copy), l_Workspace_0 (copy), l_GuiService_0 (copy), v37 (copy), v38 (copy), v44 (copy), l_Pane_0 (copy), l_AssetRenderModel_0 (copy), v36 (copy), l_TextLabel_0 (copy), l_Button_0 (copy), l_Image_0 (copy), l_showContextMenu_0 (copy), l_Dialog_0 (copy), l_ExpandablePane_0 (copy), l_TitledFrame_0 (copy), l_Checkbox_0 (copy), l_TextInput_0 (copy), l_Separator_0 (copy), v41 (copy), v28 (copy)
    local v67 = v3.useContext(v29);
    local v68 = l_Localization_0:use();
    local v69 = l_ContextServices_0.Plugin:use():get();
    local v70 = l_LayoutOrderIterator_0.new();
    local v71 = l_LayoutOrderIterator_0.new();
    local v72 = l_Analytics_0:use();
    local v73 = l_Stylizer_0:use("GenerationCard");
    local l_Generation_0 = v66.Generation;
    local l_status_0 = l_Generation_0.status;
    local v76 = nil;
    if l_status_0 == v27.STATUS.COMPLETED then
        v76 = l_Generation_0.prompt or "";
    elseif l_Generation_0.message then
        v76 = l_Generation_0.message;
    elseif l_Generation_0.errors then
        v76 = l_Generation_0.errors[1];
    end;
    local l_textureIds_0 = l_Generation_0.textureIds;
    local l_meshParts_0 = l_Generation_0.meshParts;
    local v83 = v3.useMemo(function() --[[ Line: 85 ]]
        -- upvalues: l_meshParts_0 (copy), v40 (ref), v26 (ref), l_textureIds_0 (copy), v31 (ref)
        if l_meshParts_0 then
            local l_Model_1 = Instance.new("Model");
            for _, v81 in l_meshParts_0 do
                local v82 = nil;
                if v40() then
                    v82 = v26(v81);
                    if not v82 then
                        continue;
                    end;
                else
                    v82 = v81:Clone();
                end;
                if l_textureIds_0 then
                    v31(v82, l_textureIds_0);
                end;
                v82.Parent = l_Model_1;
            end;
            return l_Model_1;
        else
            return nil;
        end;
    end, {
        l_meshParts_0, 
        l_textureIds_0
    });
    local v84 = if v39() and l_status_0 == v27.STATUS.COMPLETED then v73.PromptLabelCompletedSize else v73.PromptLabelSize;
    local v100 = v44(v68, function(v85) --[[ Line: 215 ]] --[[ Name: dropdownItemClicked ]]
        -- upvalues: v27 (ref), l_meshParts_0 (copy), v40 (ref), v26 (ref), l_Generation_0 (copy), v31 (ref), l_Workspace_0 (ref), l_GuiService_0 (ref), v37 (ref), v38 (ref), v72 (copy), v67 (copy), v66 (copy)
        if v85.Id == v27.DROPDOWN_ACTIONS.INSERT then
            local l_Model_2 = Instance.new("Model");
            local v87 = CFrame.new();
            local v88 = Vector3.new();
            for _, v90 in l_meshParts_0 do
                local v91 = nil;
                if v40() then
                    v91 = v26(v90);
                    if not v91 then
                        continue;
                    end;
                else
                    v91 = v90:Clone();
                end;
                v91.Parent = l_Model_2;
                if l_Generation_0.textureIds then
                    v31(v91, l_Generation_0.textureIds);
                end;
                if v90.Size.Magnitude > v88.Magnitude then
                    v88 = v90.Size;
                    v87 = v90.CFrame;
                end;
            end;
            l_Model_2.Parent = l_Workspace_0;
            local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
            l_CurrentCamera_0.CameraType = Enum.CameraType.Fixed;
            local l_v88_0 = v88;
            local l_ViewportSize_1 = l_CurrentCamera_0.ViewportSize;
            local v95 = math.min(1, l_ViewportSize_1.X / l_ViewportSize_1.Y);
            local v96 = math.atan(math.tan((math.rad(l_CurrentCamera_0.FieldOfView / 2))) * v95);
            local v97 = l_v88_0.Magnitude / 2 / math.sin(v96);
            l_v88_0 = l_CurrentCamera_0.CFrame;
            l_CurrentCamera_0.CFrame = l_v88_0 - l_v88_0.Position + v87.Position - l_v88_0.LookVector * v97;
            l_CurrentCamera_0.Focus = v87;
            return;
        elseif v85.Id == v27.DROPDOWN_ACTIONS.INVENTORY then
            l_GuiService_0:OpenBrowserWindow(v27.INVENTORY_URL);
            return;
        else
            if v85.Id == v27.DROPDOWN_ACTIONS.EXPORT then
                PluginManager():ExportSelection();
                if v37() then
                    local v98 = nil;
                    if v38() then
                        v98 = l_Generation_0.uuid;
                    end;
                    v72:report("ExportGeneratedTexture", l_Generation_0.serverId, l_Generation_0.meshParts, l_Generation_0.prompt, l_Generation_0.seed, l_Generation_0.rotation, l_Generation_0.smartUVUnwrap, l_Generation_0.promptMasking, l_Generation_0.textureIds, v98);
                    return;
                end;
            elseif v85.Id == v27.DROPDOWN_ACTIONS.REMOVE then
                v67.updateGeneration({
                    action = v27.GENERATION_ACTIONS.REMOVE, 
                    uuid = v66.Generation.uuid
                });
                if v37() then
                    local v99 = nil;
                    if v38() then
                        v99 = l_Generation_0.uuid;
                    end;
                    v72:report("RemoveGeneratedTexture", l_Generation_0.serverId, l_Generation_0.meshParts, l_Generation_0.prompt, l_Generation_0.seed, l_Generation_0.rotation, l_Generation_0.smartUVUnwrap, l_Generation_0.promptMasking, l_Generation_0.textureIds, v99);
                end;
            end;
            return;
        end;
    end);
    local l_rotation_0 = l_Generation_0.rotation;
    local v102 = v3.useMemo(function() --[[ Line: 301 ]]
        -- upvalues: l_rotation_0 (copy), v27 (ref)
        if l_rotation_0 then
            return CFrame.fromEulerAnglesYXZ(-math.rad(l_rotation_0.X), -math.rad(l_rotation_0.Y), -math.rad(l_rotation_0.Z)) * v27.INITIAL_FOCUS_DIRECTION;
        else
            return v27.INITIAL_FOCUS_DIRECTION;
        end;
    end, {
        l_rotation_0
    });
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Padding = v73.Padding, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        InstanceView = if v83 then v3.createElement(l_AssetRenderModel_0, {
            LayoutOrder = v70:getNextOrder(), 
            Model = v83, 
            ShouldMuteModelSounds = v36() and true or nil, 
            Size = v73.InstanceViewSize, 
            Static = true, 
            BackgroundColor3 = v73.BackgroundColor, 
            FocusDirection = v102, 
            LightColor = Color3.new(1, 1, 1), 
            LightDirection = -Vector3.new(1, 1, 1, 0)
        }) else nil, 
        PromptLabel = v3.createElement(l_TextLabel_0, {
            LayoutOrder = v70:getNextOrder(), 
            Size = v84, 
            Style = l_status_0 == v27.STATUS.FAILED and "Warning" or nil, 
            Text = v76, 
            TextTruncate = Enum.TextTruncate.AtEnd, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            TextWrapped = true
        }), 
        ThumbsUpButton = if v39() and l_status_0 == v27.STATUS.COMPLETED then v3.createElement(l_Button_0, {
            DisableHover = l_Generation_0.accepted ~= nil, 
            LayoutOrder = v70:getNextOrder(), 
            Size = v73.MenuButtonSize, 
            Style = "RoundSubtle", 
            OnClick = function() --[[ Line: 349 ]] --[[ Name: OnClick ]]
                -- upvalues: l_Generation_0 (copy), v67 (copy), v27 (ref), v66 (copy), v37 (ref), v38 (ref), v72 (copy)
                if l_Generation_0.accepted ~= nil then
                    return;
                else
                    local v103 = table.clone(l_Generation_0);
                    v103.accepted = true;
                    v67.updateGeneration({
                        action = v27.GENERATION_ACTIONS.UPDATE, 
                        uuid = v66.Generation.uuid, 
                        data = v103
                    });
                    if v37() then
                        local v104 = nil;
                        if v38() then
                            v104 = l_Generation_0.uuid;
                        end;
                        v72:report("SendFeedback", l_Generation_0.serverId, l_Generation_0.meshParts, l_Generation_0.prompt, l_Generation_0.seed, l_Generation_0.rotation, l_Generation_0.smartUVUnwrap, l_Generation_0.promptMasking, l_Generation_0.textureIds, v104, true);
                    end;
                    return;
                end;
            end
        }, {
            Icon = v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = if l_Generation_0.accepted then v73.ThumbsUpIcon else v73.ThumbsUpOutlineIcon, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(16, 16)
            })
        }) else nil, 
        ThumbsDownButton = if v39() and l_status_0 == v27.STATUS.COMPLETED then v3.createElement(l_Button_0, {
            DisableHover = l_Generation_0.accepted ~= nil, 
            LayoutOrder = v70:getNextOrder(), 
            Size = v73.MenuButtonSize, 
            Style = "RoundSubtle", 
            OnClick = function() --[[ Line: 398 ]] --[[ Name: OnClick ]]
                -- upvalues: l_Generation_0 (copy), v67 (copy), v27 (ref), v66 (copy)
                if l_Generation_0.accepted ~= nil then
                    return;
                else
                    local v105 = table.clone(l_Generation_0);
                    v105.showFeedbackDialog = true;
                    v105.feedbackTable = {
                        promptCheckbox = false, 
                        qualityCheckbox = false, 
                        resolutionCheckbox = false, 
                        looksCheckbox = false, 
                        otherNotes = ""
                    };
                    v67.updateGeneration({
                        action = v27.GENERATION_ACTIONS.UPDATE, 
                        uuid = v66.Generation.uuid, 
                        data = v105
                    });
                    return;
                end;
            end
        }, {
            Icon = v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = if not (l_Generation_0.accepted ~= nil) or l_Generation_0.accepted then v73.ThumbsDownOutlineIcon else v73.ThumbsDownIcon, 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(16, 16)
            })
        }) else nil, 
        Button = v3.createElement(l_Button_0, {
            LayoutOrder = v70:getNextOrder(), 
            Size = v73.MenuButtonSize, 
            Style = "RoundSubtle", 
            OnClick = function() --[[ Line: 433 ]] --[[ Name: OnClick ]]
                -- upvalues: l_status_0 (copy), v27 (ref), v67 (copy), v66 (copy), l_showContextMenu_0 (ref), v69 (copy), v100 (copy)
                if l_status_0 == v27.STATUS.FAILED then
                    v67.updateGeneration({
                        action = v27.GENERATION_ACTIONS.REMOVE, 
                        uuid = v66.Generation.uuid
                    });
                    return;
                else
                    l_showContextMenu_0(v69, v100);
                    return;
                end;
            end
        }, {
            Icon = if l_status_0 == v27.STATUS.FAILED then v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/DeveloperFramework/close.png", 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(16, 16), 
                Style = "ColoredWarning"
            }) else v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/StudioSharedUI/MeatballMenu.png", 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(24, 24)
            })
        }), 
        FeedbackFrom = if v39() and l_Generation_0.showFeedbackDialog then v3.createElement(l_Dialog_0, {
            Enabled = l_Generation_0.showFeedbackDialog, 
            Size = Vector2.new(600, 400), 
            Title = v68:getText("FeedbackDialog", "Title"), 
            OnClose = function() --[[ Line: 465 ]] --[[ Name: OnClose ]]
                -- upvalues: l_Generation_0 (copy), v67 (copy), v27 (ref), v66 (copy)
                local v106 = table.clone(l_Generation_0);
                v106.showFeedbackDialog = false;
                v67.updateGeneration({
                    action = v27.GENERATION_ACTIONS.UPDATE, 
                    uuid = v66.Generation.uuid, 
                    data = v106
                });
            end
        }, {
            Frame = v3.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                Padding = 16
            }, {
                Title = v3.createElement(l_ExpandablePane_0, {
                    AlwaysExpanded = true, 
                    ContentPadding = 10, 
                    ContentSpacing = 15, 
                    Style = "Title", 
                    Text = v68:getText("FeedbackDialog", "Title"), 
                    VerticalAlignment = Enum.VerticalAlignment.Top
                }, {
                    Checkboxes = v3.createElement(l_TitledFrame_0, {
                        Title = v68:getText("FeedbackDialog", "CheckboxTitle"), 
                        LayoutOrder = v71:getNextOrder()
                    }, {
                        PromptCheckbox = v3.createElement(l_Checkbox_0, {
                            Checked = l_Generation_0.feedbackTable.promptCheckbox, 
                            LayoutOrder = v71:getNextOrder(), 
                            Text = v68:getText("FeedbackDialog", "PromptCheckbox"), 
                            OnClick = function() --[[ Line: 496 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_Generation_0 (copy), v67 (copy), v27 (ref), v66 (copy)
                                local v107 = table.clone(l_Generation_0);
                                l_Generation_0.feedbackTable.promptCheckbox = not l_Generation_0.feedbackTable.promptCheckbox;
                                v67.updateGeneration({
                                    action = v27.GENERATION_ACTIONS.UPDATE, 
                                    uuid = v66.Generation.uuid, 
                                    data = v107
                                });
                            end
                        }), 
                        QualityCheckbox = v3.createElement(l_Checkbox_0, {
                            Checked = l_Generation_0.feedbackTable.qualityCheckbox, 
                            LayoutOrder = v71:getNextOrder(), 
                            Text = v68:getText("FeedbackDialog", "QualityCheckbox"), 
                            OnClick = function() --[[ Line: 511 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_Generation_0 (copy), v67 (copy), v27 (ref), v66 (copy)
                                local v108 = table.clone(l_Generation_0);
                                l_Generation_0.feedbackTable.qualityCheckbox = not l_Generation_0.feedbackTable.qualityCheckbox;
                                v67.updateGeneration({
                                    action = v27.GENERATION_ACTIONS.UPDATE, 
                                    uuid = v66.Generation.uuid, 
                                    data = v108
                                });
                            end
                        }), 
                        ResolutionCheckbox = v3.createElement(l_Checkbox_0, {
                            Checked = l_Generation_0.feedbackTable.resolutionCheckbox, 
                            LayoutOrder = v71:getNextOrder(), 
                            Text = v68:getText("FeedbackDialog", "ResolutionCheckbox"), 
                            OnClick = function() --[[ Line: 526 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_Generation_0 (copy), v67 (copy), v27 (ref), v66 (copy)
                                local v109 = table.clone(l_Generation_0);
                                l_Generation_0.feedbackTable.resolutionCheckbox = not l_Generation_0.feedbackTable.resolutionCheckbox;
                                v67.updateGeneration({
                                    action = v27.GENERATION_ACTIONS.UPDATE, 
                                    uuid = v66.Generation.uuid, 
                                    data = v109
                                });
                            end
                        }), 
                        LooksCheckbox = v3.createElement(l_Checkbox_0, {
                            Checked = l_Generation_0.feedbackTable.looksCheckbox, 
                            LayoutOrder = v71:getNextOrder(), 
                            Text = v68:getText("FeedbackDialog", "LooksCheckbox"), 
                            OnClick = function() --[[ Line: 541 ]] --[[ Name: OnClick ]]
                                -- upvalues: l_Generation_0 (copy), v67 (copy), v27 (ref), v66 (copy)
                                local v110 = table.clone(l_Generation_0);
                                l_Generation_0.feedbackTable.looksCheckbox = not l_Generation_0.feedbackTable.looksCheckbox;
                                v67.updateGeneration({
                                    action = v27.GENERATION_ACTIONS.UPDATE, 
                                    uuid = v66.Generation.uuid, 
                                    data = v110
                                });
                            end
                        })
                    }), 
                    FreeformText = v3.createElement(l_TitledFrame_0, {
                        Title = v68:getText("FeedbackDialog", "OtherNotesTitle"), 
                        LayoutOrder = v71:getNextOrder()
                    }, {
                        TextInput = v3.createElement(l_TextInput_0, {
                            Size = UDim2.new(1, 0, 0, 120), 
                            MultiLine = true, 
                            MaxLength = 1000, 
                            Text = l_Generation_0.feedbackTable.otherNotes, 
                            OnTextChanged = function(v111) --[[ Line: 562 ]] --[[ Name: OnTextChanged ]]
                                -- upvalues: l_Generation_0 (copy), v67 (copy), v27 (ref), v66 (copy)
                                local v112 = table.clone(l_Generation_0);
                                v112.feedbackTable.otherNotes = v111;
                                v67.updateGeneration({
                                    action = v27.GENERATION_ACTIONS.UPDATE, 
                                    uuid = v66.Generation.uuid, 
                                    data = v112
                                });
                            end
                        })
                    })
                }), 
                Separator = v3.createElement(l_Separator_0, {
                    LayoutOrder = 2, 
                    Weight = 5
                }), 
                ButtonPane = v3.createElement(l_Pane_0, {
                    Size = UDim2.new(1, 0, 0, 70), 
                    HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                    Layout = Enum.FillDirection.Horizontal, 
                    Spacing = 10, 
                    LayoutOrder = 3
                }, {
                    CancelButton = v3.createElement(l_Button_0, {
                        LayoutOrder = 1, 
                        Size = UDim2.fromOffset(70, 40), 
                        Style = "Round", 
                        Text = v68:getText("GenerationCard", "Cancel"), 
                        OnClick = function() --[[ Line: 592 ]] --[[ Name: OnClick ]]
                            -- upvalues: l_Generation_0 (copy), v67 (copy), v27 (ref), v66 (copy)
                            local v113 = table.clone(l_Generation_0);
                            v113.showFeedbackDialog = false;
                            v67.updateGeneration({
                                action = v27.GENERATION_ACTIONS.UPDATE, 
                                uuid = v66.Generation.uuid, 
                                data = v113
                            });
                        end
                    }), 
                    SubmitButton = v3.createElement(l_Button_0, {
                        LayoutOrder = 2, 
                        Size = UDim2.fromOffset(150, 40), 
                        Style = "RoundPrimary", 
                        Text = v68:getText("FeedbackDialog", "SubmitButton"), 
                        OnClick = function() --[[ Line: 607 ]] --[[ Name: OnClick ]]
                            -- upvalues: l_Generation_0 (copy), v67 (copy), v27 (ref), v66 (copy), v37 (ref), v38 (ref), v41 (ref), v28 (ref), v72 (copy)
                            local v114 = table.clone(l_Generation_0);
                            v114.accepted = false;
                            v114.showFeedbackDialog = false;
                            v67.updateGeneration({
                                action = v27.GENERATION_ACTIONS.UPDATE, 
                                uuid = v66.Generation.uuid, 
                                data = v114
                            });
                            if v37() then
                                local v115 = nil;
                                if v38() then
                                    v115 = l_Generation_0.uuid;
                                end;
                                local v116 = nil;
                                v116 = if v41 then v28(l_Generation_0.feedbackTable) else l_Generation_0.feedbackTable;
                                v72:report("SendFeedback", l_Generation_0.serverId, l_Generation_0.meshParts, l_Generation_0.prompt, l_Generation_0.seed, l_Generation_0.rotation, l_Generation_0.smartUVUnwrap, l_Generation_0.promptMasking, l_Generation_0.textureIds, v115, false, v116);
                            end;
                        end
                    })
                })
            })
        }) else nil
    });
end;
return function(v118) --[[ Line: 658 ]] --[[ Name: GenerationCard ]]
    -- upvalues: l_Stylizer_0 (copy), v3 (copy), v29 (copy), v30 (copy), l_Analytics_0 (copy), l_TextureGenerationService_0 (copy), v27 (copy), v37 (copy), v38 (copy), v25 (copy), v31 (copy), l_Workspace_0 (copy), l_Pane_0 (copy), v65 (copy), v117 (copy)
    local v119 = l_Stylizer_0:use("GenerationCard");
    local v120 = v3.useContext(v29);
    local v121 = v30:use():get();
    local v122 = l_Analytics_0:use();
    local l_status_1 = v118.Generation.status;
    local v125 = v3.useCallback(function() --[[ Line: 667 ]]
        -- upvalues: l_TextureGenerationService_0 (ref), v118 (copy), v120 (copy), v27 (ref), v37 (ref), v38 (ref), v122 (copy)
        l_TextureGenerationService_0:CancelGenerationRequest(v118.Generation.uuid);
        v120.updateGeneration({
            action = v27.GENERATION_ACTIONS.REMOVE, 
            uuid = v118.Generation.uuid
        });
        if v37() then
            local v124 = nil;
            if v38() then
                v124 = v118.Generation.uuid;
            end;
            v122:report("CancelTextureGeneration", v118.Generation.serverId or "", v118.Generation.meshParts, v118.Generation.prompt, v118.Generation.seed, v118.Generation.rotation, v118.Generation.smartUVUnwrap, v118.Generation.promptMasking, v124);
        end;
    end, {
        v118.Generation, 
        v120.updateGeneration
    });
    local v126 = v25();
    local v144 = v3.useCallback(function() --[[ Line: 698 ]]
        -- upvalues: l_status_1 (copy), v27 (ref), v126 (copy), v120 (copy), v118 (copy), v31 (ref), l_Workspace_0 (ref), v121 (copy)
        if l_status_1 ~= v27.STATUS.COMPLETED then
            return;
        elseif next(v126) ~= nil and v120.selected ~= v118.Generation.uuid then
            v120.setSelected(v118.Generation.uuid);
            for _, v128 in v126 do
                v31(v128, v118.Generation.textureIds);
            end;
            return;
        elseif next(v126) ~= nil and v120.selected == v118.Generation.uuid then
            v120.setSelected(nil);
            for _, v130 in v126 do
                v31(v130, "");
            end;
            return;
        else
            if next(v126) == nil and v120.selected ~= v118.Generation.uuid then
                local v131 = nil;
                local v132 = CFrame.new();
                local v133 = Vector3.new();
                local v134 = false;
                for _, v136 in v118.Generation.meshParts do
                    local l_SurfaceAppearance_0 = v136:FindFirstChildOfClass("SurfaceAppearance");
                    if l_SurfaceAppearance_0 then
                        v131 = l_SurfaceAppearance_0.ColorMap;
                    end;
                    if v136.Size.Magnitude > v133.Magnitude then
                        v133 = v136.Size;
                        v132 = v136.CFrame;
                    end;
                    if v136:IsDescendantOf(l_Workspace_0) then
                        v134 = true;
                    end;
                end;
                if v134 and v131 == v118.Generation.textureIds then
                    assert(v131, "No texture ID found");
                    v120.setSelected(v118.Generation.uuid);
                    v121:Set(v118.Generation.meshParts);
                    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
                    l_CurrentCamera_1.CameraType = Enum.CameraType.Fixed;
                    local l_v133_0 = v133;
                    local l_ViewportSize_2 = l_CurrentCamera_1.ViewportSize;
                    local v141 = math.min(1, l_ViewportSize_2.X / l_ViewportSize_2.Y);
                    local v142 = math.atan(math.tan((math.rad(l_CurrentCamera_1.FieldOfView / 2))) * v141);
                    local v143 = l_v133_0.Magnitude / 2 / math.sin(v142);
                    l_v133_0 = l_CurrentCamera_1.CFrame;
                    l_CurrentCamera_1.CFrame = l_v133_0 - l_v133_0.Position + v132.Position - l_v133_0.LookVector * v143;
                    l_CurrentCamera_1.Focus = v132;
                end;
            end;
            return;
        end;
    end, {
        l_status_1, 
        v126, 
        v120.selected, 
        v120.setSelected
    });
    local v145, v146 = v3.useState(0);
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        LayoutOrder = v118.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, (math.max(v145, 46))), 
        Style = "CornerBox", 
        OnClick = v144
    }, {
        UIPadding = v3.createElement("UIPadding", {
            PaddingTop = UDim.new(0, 3)
        }), 
        Contents = v3.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Style = "CornerBox", 
            Size = UDim2.new(1, -2, 0, 0)
        }, {
            UIStroke = v3.createElement("UIStroke", {
                Thickness = 1, 
                ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
                Color = if l_status_1 == v27.STATUS.FAILED then v119.ErrorStrokeColor else if v120.selected == v118.Generation.uuid then v119.SelectedStrokeColor else v119.StrokeColor
            }, {
                Corner = v3.createElement("UICorner")
            }), 
            Generation = if l_status_1 == v27.STATUS.PENDING then v3.createElement(v65, {
                Generation = v118.Generation, 
                OnCancel = v125, 
                SetHeight = v146
            }) else v3.createElement(v117, {
                Generation = v118.Generation, 
                SetHeight = v146
            })
        })
    });
end;