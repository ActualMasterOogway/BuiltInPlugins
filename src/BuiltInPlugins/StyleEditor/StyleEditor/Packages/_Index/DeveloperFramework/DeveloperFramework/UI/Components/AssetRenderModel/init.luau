local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Parent.Roact);
local v2 = require(l_Parent_0.UI.ContextServices);
local l_withContext_0 = v2.withContext;
local v4 = require(l_Parent_0.Wrappers.withForwardRef);
local l_LOCALIZATION_PROJECT_NAME_0 = require(l_Parent_0.Resources).LOCALIZATION_PROJECT_NAME;
local v6 = require(l_Parent_0.UI.Components.DEPRECATED_Button);
local v7 = require(l_Parent_0.UI.Components.Image);
local v8 = require(l_Parent_0.UI.Components.Pane);
local v9 = require(l_Parent_0.UI.Components.Tooltip);
local v10 = require(l_Parent_0.Util);
local v11 = require(l_Parent_0.Util.Typecheck);
local l_Math_0 = v10.Math;
local v13 = require(script.AxisIndicator);
local v14 = v1.PureComponent:extend("AssetRenderModel");
v11.wrap(v14, script);
local v15 = require(l_Parent_0.SharedFlags.getFFlagForwardRefAssetRenderModel);
local v16 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkEnableSkyForMetalBalls);
local v17 = game:DefineFastFlag("DevFrameworkAssetRenderModelImprovedDragging", false);
local v18 = game:DefineFastFlag("DevFrameworkResetCameraIconColor", false);
v14.defaultProps = {
    RecenterCameraOnUpdate = true, 
    RecenterModelOnUpdate = true, 
    ShouldClone = true, 
    FocusDirection = Vector3.new(1, 1, 1, 0), 
    FocusPosition = Vector3.new(), 
    PanSpeedMultiplier = 1, 
    ShouldMuteModelSounds = false, 
    ImageTransparency = 0
};
local function _(v19) --[[ Line: 87 ]] --[[ Name: isPanInput ]]
    local v20 = true;
    if v19.UserInputType ~= Enum.UserInputType.MouseButton1 then
        v20 = v19.UserInputType == Enum.UserInputType.MouseButton3;
    end;
    return v20;
end;
local function _(v22, v23) --[[ Line: 92 ]] --[[ Name: isOrbitInput ]]
    local v24 = true;
    if v22.UserInputType ~= Enum.UserInputType.MouseButton2 then
        v24 = false;
        if v22.UserInputType == Enum.UserInputType.MouseButton1 then
            v24 = v23;
        end;
    end;
    return v24;
end;
v14.init = function(v26) --[[ Line: 98 ]] --[[ Name: init ]]
    -- upvalues: v15 (copy), v1 (copy), l_Math_0 (copy), v17 (copy)
    v26.isOrbitDragging = false;
    v26.isPanDragging = false;
    v26.lastClickTime = 0;
    v26.initialCenter = false;
    if not v15() or not v26.props.ForwardRef then
        v26.viewportFrameRef = v1.createRef();
    end;
    local v27 = nil;
    if v26.props.Camera then
        v27 = v26.props.Camera;
    else
        v27 = Instance.new("Camera");
        v27.Name = "AssetRenderModelCamera";
    end;
    v26.camera = v27;
    v26.viewportFrameModel = nil;
    v26.onInputBegan = function(_, v29) --[[ Line: 120 ]]
        -- upvalues: v26 (copy)
        local l_DisablePan_0 = v26.props.DisablePan;
        local v31 = true;
        if v29.UserInputType ~= Enum.UserInputType.MouseButton2 then
            v31 = false;
            if v29.UserInputType == Enum.UserInputType.MouseButton1 then
                v31 = l_DisablePan_0;
            end;
        end;
        if v31 then
            v26.isOrbitDragging = true;
        end;
        v31 = true;
        if v29.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v31 = v29.UserInputType == Enum.UserInputType.MouseButton3;
        end;
        if v31 then
            v26.isPanDragging = not v26.props.DisablePan;
        end;
    end;
    v26.onInputEnded = function(_, v33) --[[ Line: 130 ]]
        -- upvalues: v26 (copy)
        local l_DisablePan_1 = v26.props.DisablePan;
        local v35 = true;
        if v33.UserInputType ~= Enum.UserInputType.MouseButton2 then
            v35 = false;
            if v33.UserInputType == Enum.UserInputType.MouseButton1 then
                v35 = l_DisablePan_1;
            end;
        end;
        if v35 then
            v26.isOrbitDragging = false;
            if tick() < v26.lastClickTime + 0.25 then
                v26.centerCamera();
            end;
            v26.lastClickTime = tick();
        end;
        v35 = true;
        if v33.UserInputType ~= Enum.UserInputType.MouseButton1 then
            v35 = v33.UserInputType == Enum.UserInputType.MouseButton3;
        end;
        if v35 then
            v26.isPanDragging = false;
        end;
    end;
    v26.getCameraMovementDistance = function(v36, v37) --[[ Line: 145 ]]
        -- upvalues: v26 (copy)
        local v38 = v36 * math.tan((math.rad(v26.camera.FieldOfView / 2))) * 2;
        local l_AbsoluteSize_0 = v26.viewportFrameRef:getValue().AbsoluteSize;
        local v40 = l_AbsoluteSize_0.X / l_AbsoluteSize_0.Y;
        return v38 * v37.X / l_AbsoluteSize_0.X * v40, v38 * v37.Y / l_AbsoluteSize_0.Y;
    end;
    v26.onInputChanged = function(_, v42) --[[ Line: 158 ]]
        -- upvalues: v26 (copy), l_Math_0 (ref), v17 (ref)
        if v42.UserInputType == Enum.UserInputType.MouseMovement and v26.isOrbitDragging or v26.isPanDragging then
            local l_camera_0 = v26.camera;
            local l_Focus_0 = l_camera_0.Focus;
            local v45 = l_Focus_0:ToObjectSpace(l_camera_0.CFrame);
            if v26.isOrbitDragging then
                v45 = CFrame.fromAxisAngle(v45.RightVector, v42.Delta.y * -0.01) * v45;
                v45 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v42.Delta.x * -0.01) * v45;
            elseif v26.isPanDragging then
                local l_magnitude_0 = (v45.p - l_Focus_0.p).magnitude;
                l_magnitude_0 = l_Math_0.isNaN(l_magnitude_0) and 0 or l_magnitude_0;
                if v17 then
                    local v47, v48 = v26.getCameraMovementDistance(l_magnitude_0, v42.Delta);
                    local v49 = v45.rightVector.Unit * v47 * v26.props.PanSpeedMultiplier;
                    local v50 = v45.upVector.Unit * v48 * v26.props.PanSpeedMultiplier;
                    v45 = v45 + v50 - v49;
                    l_Focus_0 = l_Focus_0 + v50 - v49;
                else
                    local v51 = 0.1 * (l_magnitude_0 * 0.1) * v26.props.PanSpeedMultiplier;
                    local v52 = v45.upVector.Unit * v42.Delta.y * v51;
                    local v53 = -v45.rightVector.Unit * v42.Delta.x * v51;
                    v45 = v45 + v52 + v53;
                    l_Focus_0 = l_Focus_0 + v52 + v53;
                end;
            end;
            l_camera_0.CFrame = l_camera_0.Focus:ToWorldSpace(v45);
            l_camera_0.Focus = l_Focus_0;
        end;
    end;
    v26.zoomCamera = function(v54) --[[ Line: 191 ]]
        -- upvalues: v26 (copy), l_Math_0 (ref)
        local l_camera_1 = v26.camera;
        local l_CFrame_0 = l_camera_1.CFrame;
        local l_Focus_1 = l_camera_1.Focus;
        local l_magnitude_1 = (l_CFrame_0.p - l_Focus_1.p).magnitude;
        local v59 = math.max((l_Math_0.isNaN(l_magnitude_1) and 0 or l_magnitude_1) * 0.1, 0.1);
        l_camera_1.CFrame = l_CFrame_0 * CFrame.new(0, 0, v54 * v59);
    end;
    v26.onMouseWheelBackward = function() --[[ Line: 205 ]]
        -- upvalues: v26 (copy)
        v26.zoomCamera(1);
    end;
    v26.onMouseWheelForward = function() --[[ Line: 209 ]]
        -- upvalues: v26 (copy)
        v26.zoomCamera(-1);
    end;
    v26.centerModel = function() --[[ Line: 213 ]]
        -- upvalues: v26 (copy)
        local l_viewportFrameModel_0 = v26.viewportFrameModel;
        if l_viewportFrameModel_0:IsA("Model") then
            l_viewportFrameModel_0:TranslateBy(-l_viewportFrameModel_0:GetBoundingBox().Position);
            return;
        else
            l_viewportFrameModel_0.CFrame = l_viewportFrameModel_0.CFrame - l_viewportFrameModel_0.CFrame.Position;
            return;
        end;
    end;
    v26.centerCamera = function() --[[ Line: 225 ]]
        -- upvalues: v26 (copy), v27 (ref)
        if v26.props.ResetCameraPosition ~= nil then
            v27.Focus = CFrame.new(v26.props.FocusPosition);
            v27.CFrame = v26.props.ResetCameraPosition;
            return;
        else
            local l_viewportFrameModel_1 = v26.viewportFrameModel;
            local l_InitialDistance_0 = v26.props.InitialDistance;
            local v63 = nil;
            v63 = if l_viewportFrameModel_1:IsA("Model") then l_viewportFrameModel_1:GetExtentsSize() else l_viewportFrameModel_1.Size;
            local v64 = (l_InitialDistance_0 or v63.magnitude) * 0.8;
            local l_Unit_0 = v26.props.FocusDirection.Unit;
            v27.Focus = CFrame.new(v26.props.FocusPosition);
            v27.CFrame = CFrame.new(v27.Focus.Position + v64 * l_Unit_0, v27.Focus.Position);
            return;
        end;
    end;
end;
v14.updateViewportModel = function(v66) --[[ Line: 250 ]] --[[ Name: updateViewportModel ]]
    -- upvalues: v15 (copy)
    local l_Model_0 = v66.props.Model;
    if not v66.props.ShouldClone and v66.viewportFrameModel ~= nil then
        v66.viewportFrameModel.Parent = nil;
    end;
    if l_Model_0:IsA("Model") or l_Model_0:IsA("BasePart") then
        v66.viewportFrameModel = if v66.props.ShouldClone then l_Model_0:Clone() else l_Model_0;
        if v66.props.ShouldMuteModelSounds then
            for _, v69 in pairs(v66.viewportFrameModel:GetDescendants()) do
                if v69:IsA("Sound") then
                    v69.Volume = 0;
                end;
            end;
        end;
    else
        v66.viewportFrameModel = Instance.new("Model");
        l_Model_0:Clone().Parent = v66.viewportFrameModel;
    end;
    local v70 = if v15() and v66.props.ForwardRef then v66.props.ForwardRef:getValue() else v66.viewportFrameRef:getValue();
    if v70 then
        if v66.props.ShouldClone then
            v70:ClearAllChildren();
        else
            for _, v72 in v70:GetChildren() do
                v72.Parent = nil;
            end;
        end;
        if v66.props.OnViewModelLoaded then
            v66.props.OnViewModelLoaded(v66.viewportFrameModel);
        end;
        v66.viewportFrameModel.Parent = v70;
        if v66.props.EnableSky then
            local l_Stylizer_0 = v66.props.Stylizer;
            local l_Sky_0 = Instance.new("Sky");
            l_Sky_0.SkyboxBk = l_Stylizer_0.Sky.SkyboxBk;
            l_Sky_0.SkyboxDn = l_Stylizer_0.Sky.SkyboxDn;
            l_Sky_0.SkyboxFt = l_Stylizer_0.Sky.SkyboxFt;
            l_Sky_0.SkyboxLf = l_Stylizer_0.Sky.SkyboxLf;
            l_Sky_0.SkyboxRt = l_Stylizer_0.Sky.SkyboxRt;
            l_Sky_0.SkyboxUp = l_Stylizer_0.Sky.SkyboxUp;
            l_Sky_0.Parent = v70;
        end;
        if v66.props.CornerRadius then
            local l_UICorner_0 = Instance.new("UICorner");
            l_UICorner_0.CornerRadius = v66.props.CornerRadius;
            assert(not v70:FindFirstChild("UICorner"), "ViewportFrame already has a UICorner child");
            l_UICorner_0.Parent = v70;
        end;
        if not v66.initialCenter then
            v66.centerModel();
            v66.centerCamera();
            v66.initialCenter = true;
        else
            if v66.props.RecenterModelOnUpdate then
                v66.centerModel();
            end;
            if v66.props.RecenterCameraOnUpdate then
                v66.centerCamera();
            end;
        end;
        v70.ImageTransparency = v66.props.ImageTransparency;
    end;
end;
v14.didMount = function(v76) --[[ Line: 330 ]] --[[ Name: didMount ]]
    v76:updateViewportModel();
end;
v14.didUpdate = function(v77, v78) --[[ Line: 334 ]] --[[ Name: didUpdate ]]
    -- upvalues: v16 (copy)
    if v16() then
        if v78.Model ~= v77.props.Model or v78.EnableSky ~= v77.props.EnableSky then
            v77:updateViewportModel();
            return;
        end;
    elseif v78.Model ~= v77.props.Model then
        v77:updateViewportModel();
    end;
end;
v14.willUnmount = function(v79) --[[ Line: 346 ]] --[[ Name: willUnmount ]]
    if v79.viewportFrameModel then
        if v79.props.ShouldClone then
            v79.viewportFrameModel:Destroy();
        else
            v79.viewportFrameModel.Parent = nil;
        end;
    end;
    if v79.camera then
        v79.camera:Destroy();
    end;
end;
v14.render = function(v80) --[[ Line: 360 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v15 (copy), v8 (copy), v13 (copy), v6 (copy), v7 (copy), v18 (copy), v9 (copy), l_LOCALIZATION_PROJECT_NAME_0 (copy)
    local l_props_0 = v80.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Position_0 = l_props_0.Position;
    local v84 = l_props_0.Size or UDim2.new(1, 0, 1, 0);
    local l_Static_0 = l_props_0.Static;
    local l_DisableZoom_0 = l_props_0.DisableZoom;
    local l_camera_2 = v80.camera;
    local v88 = l_props_0.ShowAxisIndicator or l_props_0.ShowResetCamera;
    local v89 = v1.createElement("ViewportFrame", {
        Ambient = l_props_0.Ambient, 
        BackgroundColor3 = l_props_0.BackgroundColor3, 
        LightColor = l_props_0.LightColor, 
        LayoutOrder = if v88 then nil else l_LayoutOrder_0, 
        LightDirection = l_props_0.LightDirection, 
        Position = if v88 then nil else l_Position_0, 
        Size = if v88 then UDim2.fromScale(1, 1) else v84, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ImageTransparency = l_props_0.ImageTransparency, 
        CurrentCamera = l_camera_2, 
        [v1.Ref] = if v15() and l_props_0.ForwardRef then l_props_0.ForwardRef else v80.viewportFrameRef, 
        [v1.Event.MouseEnter] = l_props_0.OnMouseEnter, 
        [v1.Event.MouseLeave] = l_props_0.OnMouseLeave, 
        [v1.Event.MouseWheelForward] = if not not l_Static_0 or l_DisableZoom_0 then nil else v80.onMouseWheelForward, 
        [v1.Event.MouseWheelBackward] = if not not l_Static_0 or l_DisableZoom_0 then nil else v80.onMouseWheelBackward, 
        [v1.Event.InputBegan] = if not l_Static_0 then v80.onInputBegan else nil, 
        [v1.Event.InputEnded] = if not l_Static_0 then v80.onInputEnded else nil, 
        [v1.Event.InputChanged] = if not l_Static_0 then v80.onInputChanged else nil
    }, nil);
    if l_props_0.ShowAxisIndicator or l_props_0.ShowResetCamera then
        local l_Localization_0 = v80.props.Localization;
        local l_Stylizer_1 = v80.props.Stylizer;
        return v1.createElement(v8, {
            LayoutOrder = l_LayoutOrder_0, 
            Position = l_Position_0, 
            Size = v84
        }, {
            ViewportFrame = v89, 
            AxisIndicator = if l_props_0.ShowAxisIndicator then v1.createElement(v13, {
                BackgroundColor = l_props_0.BackgroundColor3, 
                ReferenceCamera = l_camera_2, 
                ZIndex = 2
            }) else nil, 
            ResetCameraButton = if l_props_0.ShowResetCamera then v1.createElement(v6, {
                AnchorPoint = Vector2.new(1, 0), 
                OnClick = v80.centerCamera, 
                Position = l_Stylizer_1.ResetCameraButton.Position, 
                Size = l_Stylizer_1.ResetCameraButton.Size, 
                Style = "RoundSubtle", 
                ZIndex = 2
            }, {
                Icon = v1.createElement(v7, {
                    Image = l_Stylizer_1.ResetCameraButton.Image, 
                    Style = if v18 then {
                        Color = l_Stylizer_1.ResetCameraButton.Color
                    } else nil
                }, {
                    Tooltip = v1.createElement(v9, {
                        Text = l_Localization_0:getProjectText(l_LOCALIZATION_PROJECT_NAME_0, "AssetRenderModel", "ResetCamera")
                    })
                })
            }) else nil
        });
    else
        return v89;
    end;
end;
v14 = l_withContext_0({
    Localization = v2.Localization, 
    Stylizer = v2.Stylizer
})(v14);
if v15() then
    v14 = v4(v14);
end;
return v14;