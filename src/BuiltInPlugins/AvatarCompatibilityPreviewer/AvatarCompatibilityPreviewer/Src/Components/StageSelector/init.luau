local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Util.TestInExperienceUtil);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useCreatedByAutoSetup);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v8 = require(l_script_FirstAncestor_0.Src.Components.AvatarSettings);
local v9 = require(l_script_FirstAncestor_0.Src.Components.PlacesServiceContext);
local v10 = require(l_script_FirstAncestor_0.Src.Components.SubmitDialog);
local v11 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup)();
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerTestWithAssets);
local l_UI_0 = v1.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Analytics_0 = v1.ContextServices.Analytics;
local l_Localization_0 = v1.ContextServices.Localization;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local function v26(v21) --[[ Line: 52 ]] --[[ Name: StageSelectorButton ]]
    -- upvalues: l_Stylizer_0 (copy), l_Localization_0 (copy), v2 (copy), l_IconButton_0 (copy)
    local v22 = l_Stylizer_0:use("StageSelector");
    local v23 = l_Localization_0:use();
    local v24 = v21.Enabled ~= false;
    local v25 = v2.createElement(l_IconButton_0, {
        AnchorPoint = v21.AnchorPoint, 
        BackgroundColor = if v21.IsSelected then v22.ButtonSelectedBackgroundColor else v22.BackgroundColor, 
        BackgroundStyle = "SubtleBox", 
        IconColor = if v24 then v22.IconColor else v22.IconColorDisabled, 
        IconScaleType = Enum.ScaleType.Stretch, 
        IconSize = v22.IconSize, 
        LeftIcon = v21.Icon, 
        LayoutOrder = v21.LayoutOrder, 
        Size = UDim2.new(1, 0, 0, v22.ButtonHeight), 
        Padding = 0, 
        Position = v21.Position, 
        TooltipStyle = "NoDelay", 
        TooltipText = v21.Tooltip or v23:getText("Stages", v21.StageText), 
        OnClick = if v24 then v21.OnClick else nil
    });
    if not v24 then
        return v2.createElement(v2.Fragment, {}, {
            IconButton = v25, 
            [("%*_Disabled"):format(v21.StageText)] = v2.createElement("Folder")
        });
    else
        return v25;
    end;
end;
return function(v27) --[[ Line: 101 ]] --[[ Name: StageSelector ]]
    -- upvalues: l_Stylizer_0 (copy), l_Localization_0 (copy), l_LayoutOrderIterator_0 (copy), l_Analytics_0 (copy), v2 (copy), v9 (copy), v7 (copy), v12 (copy), v6 (copy), v11 (copy), l_Pane_0 (copy), v26 (copy), v13 (copy), v5 (copy), v8 (copy), v10 (copy)
    local v28 = l_Stylizer_0:use("StageSelector");
    local v29 = l_Localization_0:use();
    local v30 = l_LayoutOrderIterator_0.new();
    local v31 = l_Analytics_0:use();
    local v32 = v2.useContext(v9);
    local v33 = v7(false);
    local v34 = v7(false);
    local v35 = if v12 then v6(v27.Avatar.WorldModel) else false;
    local v36 = v2.useContext(v11.Context);
    local v37 = true;
    if v36.canUploadBundles ~= nil then
        v37 = v36.canUploadBundles.type ~= "notAllowed";
    end;
    return v2.createElement(l_Pane_0, {
        BackgroundColor = v28.BackgroundColor, 
        Size = UDim2.new(0, v28.Width, 1, 0), 
        ZIndex = 2
    }, {
        Contents = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            VerticalAlignment = Enum.VerticalAlignment.Top
        }, {
            CheckBody = v2.createElement(v26, {
                LayoutOrder = v30:getNextOrder(), 
                Icon = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "check_body.png", 
                IsSelected = v27.SelectedStage == "CheckBody", 
                StageText = "CheckBody", 
                OnClick = function() --[[ Line: 137 ]] --[[ Name: OnClick ]]
                    -- upvalues: v31 (copy), v27 (copy)
                    v31:report("setStage", "CheckBody");
                    v27.SetStage("CheckBody");
                end
            }), 
            CheckFace = v2.createElement(v26, {
                LayoutOrder = v30:getNextOrder(), 
                Icon = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "check_face.png", 
                IsSelected = v27.SelectedStage == "CheckFace", 
                StageText = "CheckFace", 
                OnClick = function() --[[ Line: 148 ]] --[[ Name: OnClick ]]
                    -- upvalues: v31 (copy), v27 (copy)
                    v31:report("setStage", "CheckFace");
                    v27.SetStage("CheckFace");
                end
            }), 
            Test = v2.createElement(v26, {
                LayoutOrder = v30:getNextOrder(), 
                Icon = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "test.png", 
                IsSelected = false, 
                StageText = "Test", 
                OnClick = function() --[[ Line: 159 ]] --[[ Name: OnClick ]]
                    -- upvalues: v31 (copy), v13 (ref), v5 (ref), v32 (copy), v27 (copy)
                    v31:report("testInExperience");
                    if v13() then
                        v5.test(v32, v27.PreviewDummy, v27.Avatar);
                        return;
                    else
                        v5.DEPRECATED_test(v32, v27.Avatar);
                        return;
                    end;
                end
            }), 
            Publish = v2.createElement(v26, {
                LayoutOrder = v30:getNextOrder(), 
                Icon = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Large/" .. "publish.png", 
                IsSelected = false, 
                StageText = "Publish", 
                Tooltip = if v36.canUploadBundles ~= nil and v36.canUploadBundles.type == "notAllowed" and (not (v36.canUploadBundles.denyReason ~= "MissingPremiumSubscriptionTier") or v36.canUploadBundles.denyReason == "MissingIdVerification") then v29:getText("StageSelector", (("Publish_Deny_%*"):format(v36.canUploadBundles.denyReason))) else nil, 
                Enabled = not not v37 and nil, 
                OnClick = function() --[[ Line: 187 ]] --[[ Name: OnClick ]]
                    -- upvalues: v12 (ref), v31 (copy), v35 (copy), v33 (copy)
                    if v12 then
                        v31:report("publish", v35);
                    else
                        v31:report("publish");
                    end;
                    v33.enable();
                end
            })
        }), 
        SettingsButton = v2.createElement(v26, {
            Icon = "rbxassetid://6663675885", 
            IsSelected = false, 
            StageText = "Settings", 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.fromScale(0, 1), 
            OnClick = v34.enable
        }), 
        SettingsMenu = v34.enabled and v2.createElement(v8, {
            avatar = v27.Avatar, 
            close = v34.disable
        }), 
        SubmitDialog = v33.enabled and v2.createElement(v10, {
            close = v33.disable, 
            avatar = v27.Avatar
        })
    });
end;