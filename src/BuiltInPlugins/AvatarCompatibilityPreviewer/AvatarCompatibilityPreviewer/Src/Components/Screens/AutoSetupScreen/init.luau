local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Screens.AutoSetupScreen.AutoSetupAlert);
local v5 = require(l_script_FirstAncestor_0.Src.Components.Background);
local v6 = require(l_script_FirstAncestor_0.Src.Components.Screens.AutoSetupScreen.GenerationCard);
local v7 = require(l_script_FirstAncestor_0.Src.Components.ModelPreview);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(l_script_FirstAncestor_0.Src.Util.exhaustiveMatch);
local v12 = require(l_script_FirstAncestor_0.Src.Util.filterDescendants);
local v13 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local l_UI_0 = v2.UI;
local l_Alert_0 = l_UI_0.Alert;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Localization_0 = v2.ContextServices.Localization;
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAdjustCameraScale);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v25 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagStudioAvatarAutosetupReportsProgress);
local v26 = game:DefineFastFlag("AvatarPreviewerAutoSetupBetterPivot", false);
local function v27() --[[ Line: 39 ]] --[[ Name: getCameraModifications ]]
    return {
        fov = 70
    };
end;
local function _(v28) --[[ Line: 45 ]] --[[ Name: shouldShowControls ]]
    -- upvalues: v11 (copy)
    if v28 == "DEPRECATED_ErrorMultipleBodies" then
        return false;
    elseif v28 == "ErrorSourceFail" then
        return true;
    else
        return v11(v28);
    end;
end;
return function(v30) --[[ Line: 62 ]] --[[ Name: AutoSetupScreen ]]
    -- upvalues: l_Localization_0 (copy), l_Stylizer_0 (copy), v8 (copy), v24 (copy), v3 (copy), v23 (copy), v26 (copy), v12 (copy), v13 (copy), l_RunService_0 (copy), l_LayoutOrderIterator_0 (copy), l_Pane_0 (copy), v5 (copy), v7 (copy), v27 (copy), l_StyledDialog_0 (copy), l_TextLabel_0 (copy), v4 (copy), v25 (copy), l_Alert_0 (copy), v6 (copy), v11 (copy), l_IconButton_0 (copy)
    local v31 = false;
    local v32 = l_Localization_0:use();
    local v33 = l_Stylizer_0:use("AutoSetupScreen");
    assert(v30.autoSetupState.type ~= "none", v8.LUAU_ANALYZE_ERROR);
    local v34 = nil;
    if v24() then
        v34 = v3.useMemo(function() --[[ Line: 71 ]]
            -- upvalues: v30 (copy), v23 (ref)
            local v35 = v30.autoSetupState.target.model:Clone();
            if v23() then
                v35.PrimaryPart.PivotOffset = CFrame.new();
            end;
            return v35;
        end, {
            v30.autoSetupState.target and v30.autoSetupState.target.model
        });
    else
        local v37 = v3.useMemo(function() --[[ Line: 81 ]]
            -- upvalues: v30 (copy)
            local l_target_0 = v30.autoSetupState.target;
            assert(#l_target_0.DEPRECATED_bodies > 0, "Received empty bodies list from auto setup state");
            return l_target_0.DEPRECATED_bodies[1];
        end, {
            v30.autoSetupState.target
        });
        local l_v37_0 = v37 --[[ copy: 4 -> 13 ]];
        v34 = v3.useMemo(function() --[[ Line: 87 ]]
            -- upvalues: l_v37_0 (copy), v26 (ref), v12 (ref)
            local l_Model_0 = Instance.new("Model");
            local v40 = l_v37_0:Clone();
            if v26 then
                v40.PivotOffset = CFrame.new();
            end;
            v40.Parent = l_Model_0;
            l_Model_0.PrimaryPart = v40;
            v12(v40);
            return l_Model_0;
        end, {
            v37
        });
    end;
    local v41 = v13(false);
    v3.useEffect(function() --[[ Line: 105 ]]
        -- upvalues: v30 (copy), v41 (copy)
        if v30.autoSetupState.type == "error" then
            v41.enable();
        end;
    end, {
        v30.autoSetupState
    });
    if v24() then
        v3.useEffect(function() --[[ Line: 112 ]]
            -- upvalues: v30 (copy), v34 (ref), l_RunService_0 (ref), v33 (copy)
            if v30.autoSetupState.type ~= "inAutoSetup" then
                return;
            else
                local v42 = os.clock();
                local v43 = CFrame.new(v34:GetBoundingBox().Position);
                local v44 = {};
                for _, v46 in v34:GetDescendants() do
                    if v46:IsA("BasePart") then
                        v44[v46] = v43:ToObjectSpace(v46.CFrame);
                    end;
                end;
                local function _(v47) --[[ Line: 127 ]] --[[ Name: setModelCFrame ]]
                    -- upvalues: v44 (copy)
                    for v48, v49 in v44 do
                        v48.CFrame = v47 * v49;
                    end;
                end;
                local v55 = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 133 ]]
                    -- upvalues: v42 (copy), v33 (ref), v43 (copy), v44 (copy)
                    local v51 = (os.clock() - v42) * v33.SpinRate * 6.283185307179586 % 6.283185307179586;
                    local v52 = v43 * CFrame.Angles(0, v51, 0);
                    for v53, v54 in v44 do
                        v53.CFrame = v52 * v54;
                    end;
                end);
                return function() --[[ Line: 141 ]]
                    -- upvalues: v55 (copy), v43 (copy), v44 (copy)
                    v55:Disconnect();
                    local l_v43_0 = v43;
                    for v57, v58 in v44 do
                        v57.CFrame = l_v43_0 * v58;
                    end;
                end;
            end;
        end, {
            v30.autoSetupState.type, 
            v34
        });
    else
        local v60 = v3.useMemo(function() --[[ Line: 147 ]]
            -- upvalues: v30 (copy)
            local l_target_1 = v30.autoSetupState.target;
            assert(#l_target_1.DEPRECATED_bodies > 0, "Received empty bodies list from auto setup state");
            return l_target_1.DEPRECATED_bodies[1];
        end, {
            v30.autoSetupState.target
        });
        local l_v60_0 = v60 --[[ copy: 5 -> 14 ]];
        v3.useEffect(function() --[[ Line: 153 ]]
            -- upvalues: v30 (copy), v34 (ref), l_v60_0 (copy), v33 (copy)
            if v30.autoSetupState.type ~= "inAutoSetup" then
                v34.PrimaryPart.CFrame = CFrame.new(v34.PrimaryPart.Position) * l_v60_0.CFrame.Rotation;
                return;
            else
                local v63 = task.spawn(function() --[[ Line: 161 ]]
                    -- upvalues: v34 (ref), v33 (ref)
                    while true do
                        local v62 = task.wait();
                        v34.PrimaryPart.CFrame = v34.PrimaryPart.CFrame * CFrame.Angles(0, v62 * v33.SpinRate * 2 * 3.141592653589793, 0);
                    end;
                end);
                return function() --[[ Line: 169 ]]
                    -- upvalues: v63 (copy)
                    task.cancel(v63);
                end;
            end;
        end, {
            v30.autoSetupState, 
            v34
        });
    end;
    local v64 = v13(false);
    local v65 = l_LayoutOrderIterator_0.new();
    local l_createElement_0 = v3.createElement;
    local l_l_Pane_0_0 = l_Pane_0;
    local v68 = {};
    local v70 = {
        Background = v3.createElement(v5), 
        ModelPreview = v3.createElement(l_Pane_0, {
            ZIndex = v65:getNextOrder()
        }, v3.createElement(v7, {
            Model = v34, 
            GetCameraModifications = v27, 
            ShowResetCameraButton = true
        })), 
        CancelDialog = v3.createElement(l_StyledDialog_0, {
            Style = "AcceptCancel", 
            Enabled = v64.enabled, 
            Modal = true, 
            Resizable = false, 
            Title = v32:getText("AvatarScreen", "CancelPromptTitle"), 
            MinContentSize = Vector2.new(300, 50), 
            Buttons = {
                {
                    Key = "yes", 
                    Text = v32:getText("AvatarScreen", "CancelPromptYes")
                }, 
                {
                    Key = "no", 
                    Text = v32:getText("AvatarScreen", "CancelPromptNo")
                }
            }, 
            OnButtonPressed = function(v69) --[[ Line: 213 ]] --[[ Name: OnButtonPressed ]]
                -- upvalues: v30 (copy), v64 (copy)
                if v69 == "yes" then
                    v30.cancelAutoSetup();
                end;
                v64.disable();
            end, 
            OnClose = v64.disable
        }, {
            Text = v3.createElement(l_TextLabel_0, {
                Text = v32:getText("AvatarScreen", "CancelPromptConfirmText"), 
                TextWrapped = true
            })
        }), 
        ErrorAlert = v3.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            Size = UDim2.fromScale(1, 0), 
            ZIndex = v65:getNextOrder()
        }, {
            Padding = v3.createElement("UIPadding", {
                PaddingLeft = v33.AlertPaddingHorizontal, 
                PaddingRight = v33.AlertPaddingHorizontal, 
                PaddingTop = v33.AlertPaddingVertical
            }), 
            Alert = if v24() then v3.createElement(v4, {
                autoSetupState = v30.autoSetupState, 
                clearError = v30.clearError, 
                cancelDialogOpen = v64
            }) else nil, 
            DEPRECATED_Alert = if not (v30.autoSetupState.type == "error" and v41.enabled) or v24() or v25() then v30.autoSetupState.type == "inAutoSetup" and not v24() and not v25() and v3.createElement(l_Alert_0, {
                Title = v32:getText("AvatarScreen", "AutoSetupInProgressTitle"), 
                Description = v32:getText("AvatarScreen", "AutoSetupInProgressDescription") .. (v30.autoSetupState.DEPRECATED_eta == nil and "" or "\n" .. v32:getText("AvatarScreen", "AutoSetupETA", {
                    eta = math.ceil(v30.autoSetupState.DEPRECATED_eta)
                })), 
                PrimaryAction = {
                    Text = v32:getText("AvatarScreen", "AutoSetupInProgressActionText"), 
                    OnClick = v64.enable
                }
            }) else v3.createElement(l_Alert_0, {
                Title = v32:getText("AvatarScreen", "AutoSetupErrorTitle"), 
                Description = v32:getText("AvatarScreen", v30.autoSetupState.error), 
                Style = "Error", 
                OnClose = v41.disable
            })
        }), 
        GenerationCard = if v25() and v30.autoSetupState.type == "inAutoSetup" then v3.createElement(v6, {
            autoSetupState = v30.autoSetupState, 
            cancelDialogOpen = v64
        }) else nil
    };
    local v71;
    if v30.autoSetupState.type ~= "hasSelection" then
        v71 = false;
        if v30.autoSetupState.type == "error" then
            local l_error_0 = v30.autoSetupState.error;
            v71 = l_error_0 ~= "DEPRECATED_ErrorMultipleBodies" and (l_error_0 == "ErrorSourceFail" or v11(l_error_0));
            v31 = not v71;
        else
            v31 = true;
        end;
    end;
    if not v31 then
        if not v31 then
            v71 = v3.createElement(l_Pane_0, {
                AnchorPoint = Vector2.new(1, 1), 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Position = v33.ControlsPosition, 
                ZIndex = v65:getNextOrder()
            }, {
                Start = v3.createElement(l_IconButton_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    OnClick = v30.startAutoSetup, 
                    Style = "PrimaryBrand", 
                    Text = v32:getText("AvatarScreen", "StartAutoSetup"), 
                    ZIndex = 2
                })
            });
        end;
    end;
    v31 = false;
    v70.Controls = v71;
    return l_createElement_0(l_l_Pane_0_0, v68, v70);
end;