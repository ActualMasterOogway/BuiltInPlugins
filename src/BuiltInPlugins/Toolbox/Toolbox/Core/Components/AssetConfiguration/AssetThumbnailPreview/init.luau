local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Util_0 = l_Parent_0.Core.Util;
local v6 = require(l_Util_0.Constants);
local v7 = require(l_Util_0.Images);
local v8 = require(l_Util_0.AssetConfigUtil);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Components_0 = l_Parent_0.Core.Components;
local v16 = require(l_Components_0.RoundFrame);
local v17 = game:DefineFastInt("AssetConfigDescendantsPreviewLimit", 10000);
local l_EnableUGCBundleUnknownMeshPartFiltering_0 = game:GetFastFlag("EnableUGCBundleUnknownMeshPartFiltering");
local v19 = if l_EnableUGCBundleUnknownMeshPartFiltering_0 then require(l_Util_0.AssetThumbnailPreviewUtil) else nil;
local function v23(v20) --[[ Line: 51 ]] --[[ Name: removeAllScripts ]]
    for _, v22 in pairs(v20:GetDescendants()) do
        if v22:IsA("LuaSourceContainer") then
            v22:Destroy();
        end;
    end;
end;
local function v27(v24) --[[ Line: 62 ]] --[[ Name: stopSoundsPlaying ]]
    for _, v26 in pairs(v24:GetDescendants()) do
        if v26:IsA("Sound") and v26.Playing then
            v26.Playing = false;
        end;
    end;
end;
local function v32(v28, v29) --[[ Line: 70 ]] --[[ Name: setDefaultCameraView ]]
    local l_v29_ModelCFrame_0 = v29:GetModelCFrame();
    v28:SetImageServerView(l_v29_ModelCFrame_0);
    local v31 = v29:GetExtentsSize().magnitude / 2 / math.tan(math.rad(v28.FieldOfView) / 2);
    v28.CFrame = v28.CFrame - v28.CFrame.p + l_v29_ModelCFrame_0.p + (v28.CFrame.p - l_v29_ModelCFrame_0.p).unit * v31;
end;
local v33 = v2.PureComponent:extend("AssetThumbnailPreview");
v33.init = function(v34, _) --[[ Line: 87 ]] --[[ Name: init ]]
    -- upvalues: v2 (copy)
    v34.viewportRef = v2.createRef();
    v34.state = {
        shouldShow = v34:shouldShowInstances()
    };
end;
v33.didMount = function(v36) --[[ Line: 95 ]] --[[ Name: didMount ]]
    v36:setView();
end;
if l_EnableUGCBundleUnknownMeshPartFiltering_0 then
    v33.didUpdate = function(v37, v38, _) --[[ Line: 100 ]] --[[ Name: didUpdate ]]
        if v37.props.AssetType ~= v38.AssetType and v37.props.AssetType ~= nil then
            v37:setView();
        end;
    end;
end;
v33.setView = function(v40) --[[ Line: 107 ]] --[[ Name: setView ]]
    -- upvalues: v23 (copy), l_EnableUGCBundleUnknownMeshPartFiltering_0 (copy), v8 (copy), v19 (copy), v27 (copy), v32 (copy)
    if not v40.state.shouldShow then
        return;
    else
        if v40.props.instances then
            local l_current_0 = v40.viewportRef.current;
            l_current_0:ClearAllChildren();
            local l_Camera_0 = Instance.new("Camera");
            l_Camera_0.Name = "Camera";
            l_Camera_0.Parent = l_current_0;
            l_current_0.CurrentCamera = l_Camera_0;
            local l_Model_0 = Instance.new("Model");
            l_Model_0.Parent = l_current_0;
            for _, v45 in pairs(v40.props.instances) do
                if not v45:IsA("LuaSourceContainer") then
                    pcall(function() --[[ Line: 128 ]]
                        -- upvalues: v45 (copy), v23 (ref), l_EnableUGCBundleUnknownMeshPartFiltering_0 (ref), v8 (ref), v40 (copy), v19 (ref), l_Model_0 (copy)
                        local v46 = v45:Clone();
                        v23(v46);
                        if l_EnableUGCBundleUnknownMeshPartFiltering_0 and v8.isUGCBundleType(v40.props.AssetType) then
                            v19.removeAllUGCBUndleUnknownMeshParts(v46, v40.props.AssetType, v40.props.AllowedBundleTypeSettings);
                        end;
                        v46.Parent = l_Model_0;
                    end);
                end;
            end;
            v27(l_Model_0);
            local v47 = #v40.props.instances == 1 and v40.props.instances[1] or l_Model_0;
            local l_ThumbnailConfiguration_0 = v47:FindFirstChild("ThumbnailConfiguration");
            local l_ThumbnailCamera_0 = v47:FindFirstChild("ThumbnailCamera");
            if l_ThumbnailConfiguration_0 and l_ThumbnailConfiguration_0:IsA("Configuration") then
                local l_ThumbnailCameraTarget_0 = l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraTarget");
                local l_ThumbnailCameraValue_0 = l_ThumbnailConfiguration_0:FindFirstChild("ThumbnailCameraValue");
                if l_ThumbnailCameraTarget_0 and l_ThumbnailCameraTarget_0:IsA("ObjectValue") and l_ThumbnailCameraValue_0 and l_ThumbnailCameraValue_0:IsA("CFrameValue") then
                    local l_Value_0 = l_ThumbnailCameraTarget_0.Value;
                    if l_Value_0 and l_Value_0:IsA("BasePart") then
                        l_Camera_0.CFrame = l_Value_0.CFrame:toWorldSpace(l_ThumbnailCameraValue_0.Value);
                        return;
                    end;
                end;
            elseif l_ThumbnailCamera_0 and l_ThumbnailCamera_0:IsA("Camera") then
                l_current_0.CurrentCamera = l_ThumbnailCamera_0;
                return;
            else
                v32(l_Camera_0, l_Model_0);
            end;
        end;
        return;
    end;
end;
v33.getName = function(v53) --[[ Line: 173 ]] --[[ Name: getName ]]
    if v53.props.instances and #v53.props.instances > 0 then
        return v53.props.instances[1].Name;
    else
        return "";
    end;
end;
v33.shouldShowInstances = function(v54) --[[ Line: 180 ]] --[[ Name: shouldShowInstances ]]
    -- upvalues: v17 (copy)
    if v54.props.instances == nil then
        return false;
    else
        local v55 = 0;
        for _, v57 in v54.props.instances do
            v55 = v55 + #v57:GetDescendants();
            if v17 <= v55 then
                return false;
            end;
        end;
        return true;
    end;
end;
v33.render = function(v58) --[[ Line: 198 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy), v16 (copy), l_Pane_0 (copy), l_Image_0 (copy), v7 (copy), l_Tooltip_0 (copy), v6 (copy)
    local l_props_0 = v58.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v62 = l_props_0.title or v58:getName();
    local v63 = true;
    if l_props_0.ShowTitle ~= nil then
        v63 = l_props_0.showTitle;
    end;
    local v64 = l_props_0.Position or UDim2.new(1, 0, 1, 0);
    local v65 = l_props_0.titleHeight or 24;
    local v66 = l_props_0.titlePadding or 12;
    local v67 = l_props_0.LayoutOrder or 1;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = l_props_0.Size, 
        Position = v64, 
        LayoutOrder = v67
    }, {
        PreviewFrame = v2.createElement(v16, {
            BackgroundColor3 = l_Stylizer_0.thumbnailPreview.background, 
            BorderColor3 = l_Stylizer_0.thumbnailPreview.border, 
            Size = v63 and UDim2.new(1, 0, 1, -(v65 + v66)) or UDim2.new(1, 0, 1, 0)
        }, {
            Viewport = if v58.state.shouldShow then v2.createElement("ViewportFrame", {
                [v2.Ref] = v58.viewportRef, 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Stylizer_0.thumbnailPreview.background, 
                BackgroundTransparency = 1
            }) else v2.createElement(l_Pane_0, {}, {
                Image = v2.createElement(l_Image_0, {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    Image = v7.WARNING_ICON, 
                    ImageColor3 = l_Stylizer_0.thumbnailPreview.text, 
                    Position = UDim2.fromScale(0.5, 0.5), 
                    Size = l_Stylizer_0.thumbnailPreview.warningIconSize
                }), 
                Tooltip = v2.createElement(l_Tooltip_0, {
                    Text = l_Localization_0:getText("AssetThumbnailPreview", "PreviewTooBig")
                })
            })
        }), 
        Title = v63 and v2.createElement("TextLabel", {
            Text = v62, 
            Font = v6.FONT, 
            TextSize = v6.FONT_SIZE_MEDIUM, 
            TextColor3 = l_Stylizer_0.thumbnailPreview.text, 
            Position = UDim2.new(0, 0, 1, -v65), 
            Size = UDim2.new(1, 0, 0, v65), 
            BackgroundTransparency = 1
        })
    });
end;
local function v70(v68, _) --[[ Line: 258 ]] --[[ Name: mapStateToProps ]]
    return {
        instances = (v68 or {}).instances
    };
end;
v33 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v33);
return v3.connect(v70)(v33);