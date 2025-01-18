local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.Framework);
local v3 = require(l_Parent_1.Roact);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Contexts.PreviewContext);
local _ = require(script.Parent.PreviewAnimationPlayback);
local l_Util_0 = v2.Util;
local l_Typecheck_0 = l_Util_0.Typecheck;
local l_Math_0 = l_Util_0.Math;
local l_DoubleClickDetector_0 = l_Util_0.DoubleClickDetector;
local v12 = v3.PureComponent:extend("PreviewRenderModel");
l_Typecheck_0.wrap(v12, script);
v12.defaultProps = {
    RecenterCameraOnUpdate = true, 
    RecenterModelOnUpdate = true, 
    FocusDirection = Vector3.new(1, 1, 1, 0), 
    Ambient = Color3.new(0.4, 0.4, 0.4), 
    LightColor = Color3.new(1, 1, 1)
};
v12.init = function(v13) --[[ Line: 55 ]] --[[ Name: init ]]
    -- upvalues: l_DoubleClickDetector_0 (copy), v3 (copy), l_Math_0 (copy)
    v13.isOrbitDragging = false;
    v13.isPanDragging = false;
    v13.initialCenter = false;
    v13.doubleClickDetector = l_DoubleClickDetector_0.new();
    v13.previewAvatar = {};
    v13.viewportFrameRef = v3.createRef();
    local l_Camera_0 = v13.props.Camera;
    if not l_Camera_0 then
        l_Camera_0 = Instance.new("Camera");
        l_Camera_0.Name = "PreviewRenderModelCamera";
    end;
    v13.camera = l_Camera_0;
    v13.viewportFrameModel = nil;
    v13.worldModel = nil;
    v13.updateViewportFrameLighting = function() --[[ Line: 74 ]]
        -- upvalues: v13 (copy)
        local l_LookVector_0 = v13.camera.CFrame.LookVector;
        local v16 = v13.viewportFrameRef:getValue();
        if v16 then
            v16.LightDirection = l_LookVector_0;
        end;
    end;
    v13.onInputBegan = function(_, v18) --[[ Line: 82 ]]
        -- upvalues: v13 (copy)
        if v18.UserInputType == Enum.UserInputType.MouseButton1 then
            v13.isOrbitDragging = true;
        end;
        if v18.UserInputType == Enum.UserInputType.MouseButton3 or v18.UserInputType == Enum.UserInputType.MouseButton2 then
            v13.isPanDragging = not v13.props.DisablePan;
        end;
    end;
    v13.onInputEnded = function(_, v20) --[[ Line: 95 ]]
        -- upvalues: v13 (copy)
        if v20.UserInputType == Enum.UserInputType.MouseButton1 then
            v13.isOrbitDragging = false;
            if v13.doubleClickDetector:isDoubleClick() then
                v13.centerCamera();
            end;
        end;
        if v20.UserInputType == Enum.UserInputType.MouseButton3 or v20.UserInputType == Enum.UserInputType.MouseButton2 then
            v13.isPanDragging = false;
        end;
    end;
    v13.onInputChanged = function(_, v22) --[[ Line: 111 ]]
        -- upvalues: v13 (copy), l_Math_0 (ref)
        if v22.UserInputType == Enum.UserInputType.MouseMovement and v13.isOrbitDragging or v13.isPanDragging then
            local l_camera_0 = v13.camera;
            local l_Focus_0 = l_camera_0.Focus;
            local v25 = l_Focus_0:ToObjectSpace(l_camera_0.CFrame);
            if v13.isOrbitDragging then
                v25 = CFrame.fromAxisAngle(v25.RightVector, v22.Delta.y * -0.01) * v25;
                v25 = CFrame.fromAxisAngle(Vector3.new(0, 1, 0, 0), v22.Delta.x * -0.01) * v25;
            elseif v13.isPanDragging then
                local l_magnitude_0 = (v25.p - l_Focus_0.p).magnitude;
                local v27 = 0.1 * ((l_Math_0.isNaN(l_magnitude_0) and 0 or l_magnitude_0) * 0.1);
                local v28 = v25.upVector.Unit * v22.Delta.y * v27;
                local v29 = -v25.rightVector.Unit * v22.Delta.x * v27;
                v25 = v25 + v28 + v29;
                l_Focus_0 = l_Focus_0 + v28 + v29;
            end;
            l_camera_0.CFrame = l_camera_0.Focus:ToWorldSpace(v25);
            l_camera_0.Focus = l_Focus_0;
            v13.updateViewportFrameLighting();
        end;
    end;
    v13.zoomCamera = function(v30) --[[ Line: 136 ]]
        -- upvalues: v13 (copy), l_Math_0 (ref)
        local l_camera_1 = v13.camera;
        local l_CFrame_0 = l_camera_1.CFrame;
        local l_Focus_1 = l_camera_1.Focus;
        local l_magnitude_1 = (l_CFrame_0.p - l_Focus_1.p).magnitude;
        local v35 = math.max((l_Math_0.isNaN(l_magnitude_1) and 0 or l_magnitude_1) * 0.1, 0.1);
        l_camera_1.CFrame = l_CFrame_0 * CFrame.new(0, 0, v30 * v35);
    end;
    v13.onMouseWheelBackward = function() --[[ Line: 150 ]]
        -- upvalues: v13 (copy)
        v13.zoomCamera(-1);
    end;
    v13.onMouseWheelForward = function() --[[ Line: 154 ]]
        -- upvalues: v13 (copy)
        v13.zoomCamera(1);
    end;
    v13.centerModel = function() --[[ Line: 158 ]]
        -- upvalues: v13 (copy)
        local l_viewportFrameModel_0 = v13.viewportFrameModel;
        if l_viewportFrameModel_0:IsA("Model") then
            l_viewportFrameModel_0:TranslateBy(-l_viewportFrameModel_0:GetBoundingBox().Position);
            return;
        else
            l_viewportFrameModel_0.CFrame = l_viewportFrameModel_0.CFrame - l_viewportFrameModel_0.CFrame.Position;
            return;
        end;
    end;
    v13.centerCamera = function() --[[ Line: 169 ]]
        -- upvalues: v13 (copy)
        local l_viewportFrameModel_1 = v13.viewportFrameModel;
        local l_InitialDistance_0 = v13.props.InitialDistance;
        local l_camera_2 = v13.camera;
        local v40 = nil;
        v40 = if l_viewportFrameModel_1:IsA("Model") then l_viewportFrameModel_1:GetExtentsSize() else l_viewportFrameModel_1.Size;
        local v41 = (l_InitialDistance_0 or v40.magnitude) * 0.8;
        local l_Unit_0 = v13.props.FocusDirection.Unit;
        l_camera_2.Focus = CFrame.new();
        l_camera_2.CFrame = CFrame.new(v41 * l_Unit_0, l_camera_2.Focus.Position);
        v13.updateViewportFrameLighting();
    end;
end;
v12.updateViewportModel = function(v43) --[[ Line: 190 ]] --[[ Name: updateViewportModel ]]
    local l_model_0 = v43.props.PreviewAvatar.model;
    if v43.viewportFrameModel ~= nil then
        v43.viewportFrameModel.Parent = nil;
    end;
    if l_model_0:IsA("Model") or l_model_0:IsA("BasePart") then
        v43.viewportFrameModel = l_model_0;
    else
        v43.viewportFrameModel = Instance.new("Model");
        l_model_0.Parent = v43.viewportFrameModel;
    end;
    v43.previewAvatar = {
        v43.props.PreviewAvatar
    };
    local v45 = v43.viewportFrameRef:getValue();
    if v45 then
        if not v43.worldModel then
            v43.worldModel = Instance.new("WorldModel");
        end;
        v43.worldModel.Parent = v45;
        v43.viewportFrameModel.Parent = v43.worldModel;
        if not v43.initialCenter then
            v43.centerModel();
            v43.centerCamera();
            v43.initialCenter = true;
        else
            if v43.props.RecenterModelOnUpdate then
                v43.centerModel();
            end;
            if v43.props.RecenterCameraOnUpdate then
                v43.centerCamera();
            end;
        end;
    end;
    v43.props.PreviewContext:getAnimationTargetChangedSignal():Fire();
end;
v12.didMount = function(v46) --[[ Line: 231 ]] --[[ Name: didMount ]]
    v46:updateViewportModel();
end;
v12.didUpdate = function(v47, v48) --[[ Line: 235 ]] --[[ Name: didUpdate ]]
    if v48.PreviewAvatar ~= v47.props.PreviewAvatar then
        v47:updateViewportModel();
    end;
end;
v12.willUnmount = function(v49) --[[ Line: 241 ]] --[[ Name: willUnmount ]]
    if v49.viewportFrameModel then
        v49.viewportFrameModel.Parent = nil;
    end;
    if v49.worldModel then
        v49.worldModel:Destroy();
    end;
    if v49.camera then
        v49.camera:Destroy();
    end;
end;
v12.render = function(v50) --[[ Line: 255 ]] --[[ Name: render ]]
    -- upvalues: v3 (copy)
    local l_props_0 = v50.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Position_0 = l_props_0.Position;
    local l_Size_0 = l_props_0.Size;
    local l_Ambient_0 = l_props_0.Ambient;
    local l_LightColor_0 = l_props_0.LightColor;
    local l_camera_3 = v50.camera;
    return v3.createElement("ViewportFrame", {
        LayoutOrder = l_LayoutOrder_0, 
        Position = l_Position_0, 
        Size = l_Size_0, 
        BackgroundTransparency = 1, 
        Ambient = l_Ambient_0, 
        LightColor = l_LightColor_0, 
        CurrentCamera = l_camera_3, 
        [v3.Ref] = v50.viewportFrameRef, 
        [v3.Event.MouseEnter] = l_props_0.OnMouseEnter, 
        [v3.Event.MouseLeave] = l_props_0.OnMouseLeave, 
        [v3.Event.MouseWheelForward] = v50.onMouseWheelForward, 
        [v3.Event.MouseWheelBackward] = v50.onMouseWheelBackward, 
        [v3.Event.InputBegan] = v50.onInputBegan, 
        [v3.Event.InputEnded] = v50.onInputEnded, 
        [v3.Event.InputChanged] = v50.onInputChanged
    });
end;
return (l_withContext_0({
    PreviewContext = v6, 
    Stylizer = l_ContextServices_0.Stylizer
})(v12));