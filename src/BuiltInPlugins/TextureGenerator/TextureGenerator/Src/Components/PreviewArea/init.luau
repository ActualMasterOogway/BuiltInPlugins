local l_script_FirstAncestor_0 = script:FindFirstAncestor("TextureGenerator");
local l_TextureGenerationService_0 = game:GetService("TextureGenerationService");
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local _ = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local _ = l_ContextServices_0.Stylizer;
local l_UI_0 = v4.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Button_0 = l_UI_0.Button;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Image_0 = l_UI_0.Image;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_Pane_0 = l_UI_0.Pane;
local l_TextInput_0 = l_UI_0.TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Hooks_0 = l_script_FirstAncestor_0.Src.Hooks;
local v21 = require(l_Hooks_0.useSelectedMeshParts);
local l_Stylizer_1 = v4.Style.Stylizer;
local l_StyleModifier_0 = v4.Util.StyleModifier;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v26 = require(l_Util_0.cloneIgnoreArchivable);
local v27 = require(l_Util_0.Constants);
local v28 = require(l_Util_0.createHashFromMeshParts);
local v29 = require(l_Util_0.fetchAndSetQuotas);
local v30 = require(l_Util_0.GenerationsContext);
local v31 = require(l_Util_0.PreviewsContext);
local v32 = require(l_Util_0.OptionsContext);
local v33 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorMuteSounds);
local v34 = require(l_script_FirstAncestor_0.Src.Flags.getFIntTextureGeneratorMaxConcurrentGenerations);
local v35 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetry);
local v36 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorPreviewAreaEnableSky);
local v37 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorTelemetryIncludeLocalId);
local v38 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTextureGeneratorFixNilIndexBug);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v41(v40) --[[ Line: 59 ]] --[[ Name: TextInputToolbar ]]
    -- upvalues: v3 (copy), l_Pane_0 (copy), l_Button_0 (copy), l_Image_0 (copy), l_StyleModifier_0 (copy), l_Tooltip_0 (copy)
    return v3.createElement(l_Pane_0, {
        Size = v40.Size, 
        LayoutOrder = v40.LayoutOrder
    }, {
        BackButton = v3.createElement(l_Button_0, {
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(32, 32), 
            OnClick = v40.OnBackButtonClick, 
            Style = "Round"
        }, {
            Icon = v3.createElement(l_Image_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Image = "rbxasset://textures/StudioSharedUI/Undo.png", 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromOffset(16, 16), 
                Style = "Colored"
            })
        }), 
        SaveButton = v3.createElement(l_Button_0, {
            LayoutOrder = 2, 
            AnchorPoint = Vector2.new(1, 0.5), 
            OnClick = v40.OnGenerateButtonClick, 
            Position = UDim2.fromScale(1, 0.5), 
            Size = v40.Style.GenerateButtonSize, 
            Style = v40.Style.GenerateButtonStyle, 
            StyleModifier = if not v40.Enabled then l_StyleModifier_0.Disabled else nil, 
            Text = v40.GenerateButtonText
        }, {
            QuotaTooltip = v3.createElement(l_Tooltip_0, {
                Text = v40.QuotaTooltipText, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
end;
return function(v42) --[[ Line: 97 ]] --[[ Name: PreviewArea ]]
    -- upvalues: l_Analytics_0 (copy), l_Localization_0 (copy), v21 (copy), v3 (copy), v30 (copy), v31 (copy), v32 (copy), v2 (copy), v27 (copy), v38 (copy), v26 (copy), v34 (copy), v28 (copy), l_TextureGenerationService_0 (copy), v35 (copy), v37 (copy), v29 (copy), l_LayoutOrderIterator_0 (copy), l_Stylizer_1 (copy), l_Pane_0 (copy), l_TextLabel_0 (copy), l_Image_0 (copy), l_AssetRenderModel_0 (copy), v33 (copy), v36 (copy), l_LoadingIndicator_0 (copy), l_IconButton_0 (copy), l_TextInput_0 (copy), v41 (copy)
    local v43 = l_Analytics_0:use();
    local v44 = l_Localization_0:use();
    local v45 = v21();
    local v46 = v3.useContext(v30);
    local v47 = v3.useContext(v31);
    local v48 = v3.useContext(v32);
    local v49 = v44:getText("PreviewArea", "SaveApply");
    local v50 = string.format(v44:getText("General", "QuotaTooltip"), v46.quota, v46.total, v46.total);
    local l_prompt_0 = v42.PreviewData.prompt;
    local v52, v53 = v3.useState(1);
    local v54 = v42.PreviewData.allPreviews[v52];
    local v55 = #v42.PreviewData.allPreviews;
    local v57 = v3.useCallback(function() --[[ Line: 119 ]]
        -- upvalues: v53 (copy), v55 (copy)
        v53(function(v56) --[[ Line: 120 ]]
            -- upvalues: v55 (ref)
            return v56 % v55 + 1;
        end);
    end, {
        v55
    });
    local v60 = v3.useCallback(function() --[[ Line: 125 ]]
        -- upvalues: v53 (copy), v55 (copy)
        v53(function(v58) --[[ Line: 126 ]]
            -- upvalues: v55 (ref)
            local v59 = v58 - 1;
            if v59 == 0 then
                return v55;
            else
                return v59;
            end;
        end);
    end, {
        v55
    });
    v3.useEffect(function() --[[ Line: 132 ]]
        -- upvalues: v53 (copy)
        v53(1);
    end, {
        v42.PreviewData.uuid
    });
    local v62 = v2.find(v42.PreviewData.allPreviews, function(v61) --[[ Line: 136 ]]
        -- upvalues: v27 (ref)
        return v61.status == v27.STATUS.COMPLETED;
    end) ~= nil;
    local v63 = false;
    if v54 ~= nil then
        v63 = v54.status == v27.STATUS.COMPLETED;
    end;
    local v69 = v3.useMemo(function() --[[ Line: 142 ]]
        -- upvalues: v42 (copy), v38 (ref), v26 (ref)
        local l_meshParts_0 = v42.PreviewData.meshParts;
        if l_meshParts_0 then
            local l_Model_0 = Instance.new("Model");
            for _, v67 in l_meshParts_0 do
                local v68 = nil;
                if v38() then
                    v68 = v26(v67);
                    if not v68 then
                        continue;
                    end;
                else
                    v68 = v67:Clone();
                end;
                v68.Parent = l_Model_0;
            end;
            return l_Model_0;
        else
            return nil;
        end;
    end, {
        v42.PreviewData.meshParts
    });
    local v71 = v3.useMemo(function() --[[ Line: 165 ]]
        -- upvalues: v42 (copy), v27 (ref)
        local l_rotation_0 = v42.PreviewData.rotation;
        return CFrame.fromEulerAnglesYXZ(-math.rad(l_rotation_0.X), -math.rad(l_rotation_0.Y), -math.rad(l_rotation_0.Z)) * v27.INITIAL_FOCUS_DIRECTION;
    end, {
        v42.PreviewData.rotation
    });
    local v75 = v3.useMemo(function() --[[ Line: 171 ]]
        -- upvalues: v46 (copy), v27 (ref), v34 (ref)
        local v72 = 0;
        for _, v74 in v46.generations do
            if v74.status == v27.STATUS.PENDING then
                v72 = v72 + 1;
            end;
        end;
        if v34() <= v72 then
            return true;
        else
            return false;
        end;
    end, {
        v46.generations
    });
    local v76, v77 = v3.useState(false);
    v3.useEffect(function() --[[ Line: 186 ]]
        -- upvalues: v77 (copy), v62 (copy), v75 (copy)
        v77(v62 and not v75);
    end, {
        v62, 
        v75
    });
    v3.useEffect(function() --[[ Line: 193 ]]
        -- upvalues: v42 (copy), v47 (copy), v28 (ref), v45 (copy), v44 (copy)
        if v42.PreviewData.previewUrlCount == 4 and v42.PreviewData.imageFailed >= 2 or v42.PreviewData.previewUrlCount == 3 and v42.PreviewData.imageFailed >= 1 then
            v47.addError(v28(v45), "ImageFailed", v44:getText("EntryArea", "ErrorAlertTitle"), v44:getText("PreviewArea", "ImageFailed"), "error");
            v47.removePreview(v42.PreviewData.uuid);
        end;
    end, {
        v42.PreviewData.imageFailed, 
        v42.PreviewData.previewUrlCount
    });
    local v78 = v3.useCallback(function() --[[ Line: 212 ]]
        -- upvalues: v47 (copy), v42 (copy), l_TextureGenerationService_0 (ref)
        v47.removePreview(v42.PreviewData.uuid);
        l_TextureGenerationService_0:CancelGenerationRequest(v42.PreviewData.uuid);
    end, {
        v42.PreviewData.uuid, 
        v47.removePreview
    });
    local v83 = v3.useCallback(function() --[[ Line: 221 ]]
        -- upvalues: v35 (ref), v37 (ref), v43 (copy), v42 (copy), v45 (copy), v48 (copy), v77 (copy), l_TextureGenerationService_0 (ref), v27 (ref), v47 (copy), v28 (ref), v46 (copy), v29 (ref)
        if v35() and not v37() then
            v43:report("GeneratedTexture", v42.PreviewData.serverId, v45, v42.PreviewData.prompt, v42.PreviewData.seed, v42.PreviewData.rotation, v48.smartUVUnwrap, v48.promptMasking, nil);
        end;
        v77(false);
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 238 ]]
            -- upvalues: l_TextureGenerationService_0 (ref), v42 (ref)
            return l_TextureGenerationService_0:GenerateTexture(v42.PreviewData.uuid);
        end);
        if typeof(l_result_0) ~= "string" or l_result_0 ~= v27.MAX_GENERATIONS_MESSAGE then
            v47.removePreview(v42.PreviewData.uuid);
        end;
        v77(true);
        local v81 = nil;
        if l_status_0 then
            v81 = l_result_0;
            v81.startTime = tick();
        else
            v81 = {
                uuid = v42.PreviewData.uuid, 
                status = v27.STATUS.FAILED, 
                errors = {
                    l_result_0
                }
            };
        end;
        v81.previewImage = v42.PreviewData.allPreviews[1];
        v81.meshParts = v45;
        v81.partGroup = l_TextureGenerationService_0:CreatePartGroup(v45);
        v81.rotation = v42.PreviewData.rotation;
        v81.seed = v42.PreviewData.seed;
        v81.prompt = v42.PreviewData.prompt;
        v81.smartUVUnwrap = v48.smartUVUnwrap;
        v81.promptMasking = v48.promptMasking;
        local v82 = v28(v45);
        v46.updateGeneration({
            action = v27.GENERATION_ACTIONS.UPDATE, 
            uuid = v81.uuid, 
            data = v81
        });
        v46.updateModelToGenerations({
            action = v27.GENERATION_ACTIONS.ADD, 
            hash = v82, 
            uuid = v81.uuid
        });
        if v35() and v37() then
            v43:report("GeneratedTexture", v42.PreviewData.serverId, v45, v81.prompt, v81.seed, v81.rotation, v81.smartUVUnwrap, v81.promptMasking, v81.uuid);
        end;
        v29(v46, v47);
    end, {
        v45, 
        v46.updateGeneration, 
        v46.updateModelToGenerations, 
        v47.removePreview, 
        v48.smartUVUnwrap, 
        v42.PreviewData
    });
    local v84 = l_LayoutOrderIterator_0.new();
    local v85 = l_Stylizer_1:use("PreviewArea");
    return v3.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        LayoutOrder = v42.LayoutOrder, 
        Padding = v85.Padding, 
        Size = v85.Size, 
        Style = "Box"
    }, {
        PreviewLabel = v3.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = 1, 
            RichText = true, 
            Size = v85.PreviewLabelSize, 
            Text = v44:getText("General", "Preview"), 
            Style = v85.PreviewLabelStyle, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        }), 
        Display = v3.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            LayoutOrder = 2, 
            Position = UDim2.fromScale(0.5, 0.5), 
            Size = v85.Size
        }, {
            UIPadding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8), 
                PaddingRight = UDim.new(0, 8)
            }), 
            ImageContainer = v3.createElement(l_Pane_0, {
                BackgroundColor3 = Color3.new(0, 0, 0), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                ZIndex = v84:getNextOrder()
            }, {
                Corner = v3.createElement("UICorner"), 
                Image = if v63 then v3.createElement(l_Image_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Image = v54.previewId
                }, {
                    UIAspectRatioConstraint = v3.createElement("UIAspectRatioConstraint")
                }) else nil, 
                AssetRenderModel = if not v63 then v3.createElement(l_AssetRenderModel_0, {
                    BackgroundColor3 = v85.BackgroundColor, 
                    DisablePan = v85.DisablePan, 
                    DisableZoom = v85.DisableZoom, 
                    LayoutOrder = v84:getNextOrder(), 
                    Model = v69, 
                    ShouldMuteModelSounds = v33() and true or nil, 
                    Static = true, 
                    FocusDirection = v71, 
                    LightColor = Color3.new(0, 0, 0), 
                    LightDirection = Vector3.new(1, 1, 1, 0), 
                    EnableSky = v36() and true or nil
                }) else nil, 
                LoadingIndicator = if not v63 then v3.createElement(l_LoadingIndicator_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Position = UDim2.fromScale(0.5, 0.5)
                }) else nil
            }), 
            Controls = v62 and v3.createElement(l_Pane_0, {
                ZIndex = v84:getNextOrder()
            }, {
                PreviousButton = v3.createElement(l_IconButton_0, {
                    AnchorPoint = Vector2.new(0, 0.5), 
                    LeftIcon = v85.LeftIcon, 
                    Position = UDim2.new(0, 8, 0.5, 0), 
                    Style = "PreviewAreaImageRotateButton", 
                    OnClick = v60
                }), 
                NextButton = v3.createElement(l_IconButton_0, {
                    AnchorPoint = Vector2.new(1, 0.5), 
                    LeftIcon = v85.RightIcon, 
                    Position = UDim2.new(1, -8, 0.5, 0), 
                    Style = "PreviewAreaImageRotateButton", 
                    OnClick = v57
                })
            })
        }), 
        PreviewActionArea = v3.createElement(l_Pane_0, {
            LayoutOrder = 4, 
            Padding = 10, 
            Size = UDim2.new(1, 0, 0, 140)
        }, {
            TextInput = v3.createElement(l_TextInput_0, {
                BottomComponent = v41, 
                BottomComponentProps = {
                    Enabled = v76, 
                    OnBackButtonClick = v78, 
                    GenerateButtonText = v49, 
                    OnGenerateButtonClick = v83, 
                    QuotaTooltipText = v50, 
                    Size = UDim2.new(1, 0, 0, 32), 
                    Style = v85
                }, 
                Disabled = true, 
                MultiLine = true, 
                Text = l_prompt_0, 
                Size = UDim2.new(1, 0, 0, 120)
            })
        })
    });
end;