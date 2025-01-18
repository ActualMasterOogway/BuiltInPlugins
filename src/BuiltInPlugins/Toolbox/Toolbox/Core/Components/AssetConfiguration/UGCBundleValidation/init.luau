local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Core.Localization.getLocalizedAssetTextMap);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v5 = require(l_Util_0.Images);
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.AssetConfigUtil);
local l_UI_0 = v1.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local v13 = require(l_Util_0.SharedFlags.getFFlagEnableUGCMissingPartsMessage);
local v14 = require(l_Util_0.SharedFlags.getFFlagUGCBundleValidationFullBodyErrors);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_AssetConfiguration_0 = l_script_FirstAncestor_0.Core.Components.AssetConfiguration;
local v19 = require(l_AssetConfiguration_0.ValidationStatus);
local v20 = v13() and 22 or 16;
local v21 = v13() and 8 or nil;
local v22 = v13() and 18 or nil;
local function v29(v23) --[[ Line: 45 ]] --[[ Name: modelFromFolder ]]
    assert(#v23:GetChildren() > 0, "Folder from limb validation did not have any instances");
    local l_Model_0 = Instance.new("Model");
    for v25, v26 in v23:GetChildren() do
        local v27 = v26:Clone();
        if v25 == 1 then
            local l_v27_0 = v27;
            if not l_v27_0:IsA("BasePart") then
                l_v27_0 = v27:FindFirstChildWhichIsA("BasePart");
            end;
            l_Model_0.PrimaryPart = l_v27_0;
        end;
        v27.Parent = l_Model_0;
    end;
    return l_Model_0;
end;
local function _(v30) --[[ Line: 70 ]] --[[ Name: modelFromInstance ]]
    local l_Model_1 = Instance.new("Model");
    local v32 = v30:Clone();
    local l_v32_0 = v32;
    if not l_v32_0:IsA("BasePart") then
        l_v32_0 = v32:FindFirstChildWhichIsA("BasePart");
    end;
    l_Model_1.PrimaryPart = l_v32_0;
    v32.Parent = l_Model_1;
    return l_Model_1;
end;
local v35 = v2.PureComponent:extend("UGCBundleValidation");
v35.render = function(v36) --[[ Line: 99 ]] --[[ Name: render ]]
    -- upvalues: l_LayoutOrderIterator_0 (copy), v2 (copy), l_Pane_0 (copy), v13 (copy), v20 (copy), v21 (copy), v5 (copy), v6 (copy), v7 (copy), v29 (copy), v14 (copy), v3 (copy), l_AssetRenderModel_0 (copy), l_Image_0 (copy), l_TextLabel_0 (copy), v19 (copy), v22 (copy)
    local l_props_0 = v36.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_ugcBundleValidation_0 = l_props_0.Stylizer.ugcBundleValidation;
    local v40 = if l_props_0.validationResults then l_props_0.validationResults else {};
    local v41 = l_props_0.Localization:getText("AssetConfig", "UGCPublishWarning");
    local v42 = {};
    local v43 = l_LayoutOrderIterator_0.new();
    table.insert(v42, v2.createElement(l_Pane_0, {
        AutomaticSize = if v13() then Enum.AutomaticSize.Y else nil, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        LayoutOrder = -1, 
        Size = if v13() then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 0, v20), 
        Spacing = if v13() then v21 else nil, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Icon = v2.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v5.WARNING_ICON, 
            ImageColor3 = l_ugcBundleValidation_0.warningColor, 
            LayoutOrder = 1, 
            Size = UDim2.fromOffset(v20, v20)
        }), 
        UGCWarningText = v2.createElement("TextLabel", {
            AutomaticSize = if v13() then Enum.AutomaticSize.Y else Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Font = v6.FONT, 
            LayoutOrder = 2, 
            Size = if v13() then UDim2.fromScale(1, 0) else UDim2.new(1, 0, 1, 0), 
            Text = v41, 
            TextColor3 = l_ugcBundleValidation_0.warningColor, 
            TextSize = v20, 
            TextWrapped = true, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Center
        })
    }));
    for v44, v45 in v40 do
        local v46 = assert(l_ugcBundleValidation_0.validationStyles[v45.type], "No validation style for validation result type");
        local v47 = nil;
        if v7.AssetTypeRequiresFolderForUpload(v45.assetType) then
            v47 = v45.instance and v29(v45.instance);
        else
            local l_instance_0 = v45.instance;
            if l_instance_0 then
                local l_instance_1 = v45.instance;
                local l_Model_2 = Instance.new("Model");
                local v51 = l_instance_1:Clone();
                local l_v51_0 = v51;
                if not l_v51_0:IsA("BasePart") then
                    l_v51_0 = v51:FindFirstChildWhichIsA("BasePart");
                end;
                l_Model_2.PrimaryPart = l_v51_0;
                v51.Parent = l_Model_2;
                l_instance_0 = l_Model_2;
            end;
            v47 = l_instance_0;
        end;
        local v53 = nil;
        v53 = if v14() then if v45.assetType == nil then l_Localization_0:getText("AssetConfig", "ValidationFullBody") else assert(v3(l_props_0.Localization)[v45.assetType], "Couldn't find localized text for asset type") else assert(v3(l_props_0.Localization)[v45.assetType], "Couldn't find localized text for asset type");
        table.insert(v42, v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v44, 
            Size = UDim2.fromScale(1, 0), 
            Spacing = 5
        }, {
            Preview = v2.createElement(l_Pane_0, {
                BackgroundColor = l_ugcBundleValidation_0.previewBackgroundColor, 
                LayoutOrder = v43:getNextOrder(), 
                Size = UDim2.fromOffset(l_ugcBundleValidation_0.previewSize, l_ugcBundleValidation_0.previewSize)
            }, {
                UICorner = v2.createElement("UICorner", {
                    CornerRadius = UDim.new(0, 10)
                }), 
                PreviewModel = if v45.instance and v47.PrimaryPart ~= nil then v2.createElement(l_AssetRenderModel_0, {
                    FocusDirection = v47.PrimaryPart.CFrame.LookVector, 
                    Model = v47, 
                    ShouldMuteModelSounds = true, 
                    Static = true
                }) else v2.createElement(l_Image_0, {
                    Image = v5.PLACEHOLDER_ICON, 
                    ImageColor3 = l_ugcBundleValidation_0.placeholderIconColor
                })
            }), 
            AssetName = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v43:getNextOrder(), 
                Text = if v45.required then v53 .. "*" else v53, 
                TextSize = l_ugcBundleValidation_0.nameTextSize, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                UISizeConstraint = v2.createElement("UISizeConstraint", {
                    MinSize = Vector2.new(l_ugcBundleValidation_0.nameMinWidth, 0)
                })
            }), 
            ValidationArea = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = v43:getNextOrder(), 
                Layout = Enum.FillDirection.Horizontal, 
                OnClick = if v45.type == v19.error then l_props_0.onClickError else nil, 
                Spacing = 5
            }, {
                ValidationIcon = v2.createElement(l_Image_0, {
                    Image = assert(v5.UGCValidationStatus[v45.type], "No icon for validation result type"), 
                    ImageColor3 = v46.iconColor, 
                    LayoutOrder = v43:getNextOrder(), 
                    Size = UDim2.fromOffset(l_ugcBundleValidation_0.validationIconSize, l_ugcBundleValidation_0.validationIconSize)
                }), 
                ValidationText = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v43:getNextOrder(), 
                    Text = if v45.type == v19.success then l_Localization_0:getText("AssetConfig", "ValidationSuccess") else if v45.type == v19.pending then l_Localization_0:getText("AssetConfig", "ValidatingInProgress") else if v45.type == v19.error then l_Localization_0:getText("AssetConfig", #v45.errors == 1 and "ValidationErrorSingular" or "ValidationErrorPlural", {
                        errorCount = #v45.errors
                    }) else error((("Unknown validation result type \"%*\""):format(v45.type))), 
                    TextColor = v46.textColor
                })
            })
        }));
    end;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = UDim2.fromScale(1, 0), 
        Spacing = if v13() then v22 else 5
    }, v42);
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v35));