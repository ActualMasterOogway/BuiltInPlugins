local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.Screens.AutoSetupScreen.FakeLoadingBarSegment);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v7 = game:DefineFastFlag("DebugAvatarAutosetupProgressPercentLabel", false);
local v8 = game:DefineFastFlag("AvatarPreviewerDisableAutosetupEstimatedTime", false);
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_Colors_0 = v1.Style.Colors;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local function _(v16) --[[ Line: 35 ]] --[[ Name: formatSecondsTimeString ]]
    return string.format("%01i:%02i", v16 / 60 % 60, v16 % 60);
end;
return function(v18) --[[ Line: 39 ]] --[[ Name: GenerationCard ]]
    -- upvalues: l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), l_Stylizer_0 (copy), v6 (copy), v2 (copy), l_Pane_0 (copy), l_Colors_0 (copy), l_TextLabel_0 (copy), v3 (copy), v7 (copy), v8 (copy)
    local v19 = l_Localization_0:use();
    local v20 = l_LayoutOrderIterator_0.new();
    local v21 = l_Stylizer_0:use("GenerationCard");
    local v22 = v6(false);
    local v23 = v6(false);
    local l_progressState_0 = v18.autoSetupState.progressState;
    local v25 = if l_progressState_0 ~= nil and l_progressState_0.progressName ~= nil and #l_progressState_0.progressName > 0 then v19:getText("ProgressBar", l_progressState_0.progressName) else nil;
    local v26, v27 = v2.useState(0);
    local v28, v29 = v2.useState(0);
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: l_progressState_0 (copy), v28 (copy), v27 (copy), v26 (copy), v29 (copy)
        if l_progressState_0 ~= nil then
            local l_completionStart_0 = l_progressState_0.completionStart;
            local l_completionEnd_0 = l_progressState_0.completionEnd;
            local l_progressPercentage_0 = l_progressState_0.progressPercentage;
            local v33 = math.max(l_completionStart_0, v28);
            v27((math.max(v26, v33)));
            v29((math.max(v28, l_completionStart_0 + l_progressPercentage_0 * (l_completionEnd_0 - l_completionStart_0))));
        end;
    end, {
        l_progressState_0
    });
    return v2.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, 0), 
        AnchorPoint = Vector2.new(0.5, 0), 
        Position = UDim2.new(0.5, 0, 1, -120), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = if not v22.enabled or v23.enabled then v21.BackgroundColor else l_Colors_0.darker(v21.BackgroundColor, v21.BackgroundColorHoverDarkerMultiplier), 
        [v2.Event.MouseEnter] = v22.enable, 
        [v2.Event.MouseLeave] = v22.disable, 
        OnClick = v18.cancelDialogOpen.enable, 
        Spacing = 2, 
        Padding = v21.InnerPadding
    }, {
        TitlePane = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v20:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = 2
        }, {
            Title = v2.createElement(l_TextLabel_0, {
                Size = UDim2.fromScale(0, 0), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v20:getNextOrder(), 
                Font = v21.TitleFont, 
                Text = v19:getText("AvatarScreen", "AutoSetupInProgressTitle"), 
                TextColor = v21.TextColor, 
                TextWrapped = true, 
                TextSize = v21.TextSize, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }, {
                UIFlexItem = v2.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Fill
                })
            }), 
            PrimaryAction = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = v21.PrimaryActionFont, 
                LayoutOrder = v20:getNextOrder(), 
                RichText = true, 
                Text = ("<u>%*</u>"):format((v19:getText("AvatarScreen", "AutoSetupInProgressActionText"))), 
                TextColor = v21.TextColor
            }, {
                UIFlexItem = v2.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Shrink
                })
            })
        }), 
        UISizeConstraint = v2.createElement("UISizeConstraint", {
            MaxSize = Vector2.new(v21.MaxWidth, 1e999)
        }), 
        ProgressBar = v2.createElement(v3, {
            LayoutOrder = v20:getNextOrder(), 
            estimatedTotalTime = 150, 
            startProgress = v26, 
            holdProgress = v28, 
            displayPercentLabel = v7
        }), 
        ProgressPane = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = v20:getNextOrder(), 
            Layout = Enum.FillDirection.Horizontal, 
            Spacing = 2
        }, {
            CurrentStage = if v18.autoSetupState.progressState and v25 ~= nil then v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v20:getNextOrder(), 
                Size = UDim2.fromScale(v8 and 1 or 0.5, 0), 
                Text = v25, 
                TextColor = v21.TextColor, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                UIFlexItem = v2.createElement("UIFlexItem", {})
            }) else nil, 
            EstimatedTime = not v8 and v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Font = v21.PrimaryActionFont, 
                LayoutOrder = v20:getNextOrder(), 
                RichText = true, 
                Size = UDim2.fromScale(0.5, 0), 
                Text = v19:getText("AvatarScreen", "AutoSetupEstimatedTime") .. "\t" .. string.format("%01i:%02i", 2.5, 30), 
                TextXAlignment = Enum.TextXAlignment.Right, 
                TextColor = v21.TextColor
            }, {
                UIFlexItem = v2.createElement("UIFlexItem", {
                    FlexMode = Enum.UIFlexMode.Shrink
                })
            })
        }), 
        UICorner = v2.createElement("UICorner", {
            CornerRadius = v21.CornerRadius
        }), 
        UIStroke = v2.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v21.StrokeColor, 
            Thickness = v21.StrokeThickness
        })
    });
end;