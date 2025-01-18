local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_UserInputService_0 = game:GetService("UserInputService");
local v3 = require(script.class);
local v4 = require(script.constants);
local v5 = require(script.Util);
local v6 = require(script.WindhoseSimulation);
local v7 = require(script.Parent.Parent.Util.AnalyticsGlobals);
local v9 = v3(function(v8) --[[ Line: 12 ]]
    v8.cameraCFrame = nil;
    v8.initSucceded = false;
    v8.animStartCFrame = nil;
    v8.animTargetCFrame = nil;
    v8.windhoseSimulation = nil;
    v8.lastTick = nil;
    v8.currentTime = nil;
    v8.windScaleFactor = 10;
    v8.spinX = 0;
    v8.spinY = 1.5707963267948966;
    v8.windSpeed = workspace.GlobalWind.Magnitude;
    v8.lastWind = nil;
end);
v9.init = function(v10, v11, v12, v13, v14, v15, v16, v17) --[[ Line: 27 ]] --[[ Name: init ]]
    v10.worldModel = v11;
    v10.viewportCamera = v12;
    v10.viewport = v13;
    v10.onWindChanged = v14;
    v10.onWindowMoved = v15;
    v10.onisChangingPitchChanged = v16;
    v10.onisChangingYawChanged = v17;
    v10.selectRing = v11:WaitForChild("UnitSelectRingXZ");
    v10.selectStick = v11:WaitForChild("UnitSelectStickDownPositiveZ");
    v10.selectArrow = v11:WaitForChild("ArrowTipDownPositiveZ");
    v10.selectStick.Color = Color3.new(0, 0, 1);
    v10.selectRing.Size = Vector3.new(v10.selectRing.Size.x, 2 * v10.selectRing.Size.y, v10.selectRing.Size.z);
    v10.selectRingOrigSize = v10.selectRing.Size;
    v10.selectStick.Size = Vector3.new(4 * v10.selectStick.Size.x, 4 * v10.selectStick.Size.y, v10.selectStick.Size.z);
    v10.selectStickOrigSize = v10.selectStick.Size;
    v10.selectArrow.Size = Vector3.new(4 * v10.selectArrow.Size.x, 4 * v10.selectArrow.Size.y, 2 * v10.selectArrow.Size.z);
    v10.selectArrowOrigSize = v10.selectArrow.Size;
    v10.ringDragIndicatorPart = Instance.new("Part");
    v10.ringDragIndicatorPart.Parent = v11;
    v10.ringDragIndicatorPart.Material = v10.selectRing.Material;
    v10.ringDragIndicatorPart.Color = Color3.new(0, 1, 0);
    v10.ringDragIndicatorPart.Transparency = 1;
    v10.ringDragIndicatorPart.Size = Vector3.new(0.05, 0.05, v10.selectRing.Size.z / 2);
    v10.ringDragIndicatorPart.CFrame = CFrame.new(v10.selectRing.CFrame.Position + Vector3.new(0, 0, v10.selectRing.Size.z / 2));
    v10.initSucceded = true;
end;
v9.loadValuesFromGlobalWind = function(v18) --[[ Line: 74 ]] --[[ Name: loadValuesFromGlobalWind ]]
    if not v18.windChanged and not v18.isScaling and not v18.isChangingPitch and not v18.isChangingYaw and v18.lastWind ~= workspace.GlobalWind then
        if workspace.GlobalWind:Dot(workspace.GlobalWind) > 0 then
            local v19 = -workspace.GlobalWind.Unit;
            local v20 = 0;
            if v19.z < 0 then
                v20 = 3.141592653589793;
            end;
            if v19.z ~= 0 then
                v18.spinY = v20 + math.atan(v19.x / v19.z);
            elseif v19.x > 0 then
                v18.spinY = v20 + 1.5707963267948966;
            else
                v18.spinY = v20 - 1.5707963267948966;
            end;
            v18.spinX = math.asin((math.clamp(-v19.y, -1, 1)));
        end;
        if v18.lastWind ~= workspace.GlobalWind then
            v18.selectStick.CFrame = CFrame.fromEulerAnglesYXZ(0, v18.spinY, 0) * CFrame.fromEulerAnglesYXZ(v18.spinX, 0, 0);
            v18.selectStick.CFrame = v18.selectStick.CFrame - v18.selectStick.CFrame.LookVector;
            v18.onWindChanged();
        end;
        v18.windSpeed = math.clamp(workspace.GlobalWind.Magnitude, 0, 999.9);
        v18.lastWind = workspace.GlobalWind;
    end;
end;
v9.onMouseEnter = function(v21) --[[ Line: 112 ]] --[[ Name: onMouseEnter ]]
    v21.hover = true;
end;
v9.onMouseLeave = function(v22) --[[ Line: 116 ]] --[[ Name: onMouseLeave ]]
    v22.hover = false;
    v22.isHoveringOverRing = false;
    v22.isHoveringOverStick = false;
end;
v9.processRaycast = function(v23, v24, v25) --[[ Line: 122 ]] --[[ Name: processRaycast ]]
    -- upvalues: v4 (copy)
    v23:updatePickRay(v24, v25);
    local v26 = RaycastParams.new();
    v26.FilterType = Enum.RaycastFilterType.Blacklist;
    v26.FilterDescendantsInstances = {
        v23.windhoseSimulation.cone
    };
    local v27 = v23.worldModel:Raycast(v23.ray.Origin, v23.ray.Direction * v4.planeTestRayLength, v26);
    if v27 then
        if v23.selectRing == v27.Instance then
            v23.isHoveringOverRing = true;
        else
            v23.isHoveringOverRing = false;
        end;
        if v23.selectStick == v27.Instance then
            v23.isHoveringOverStick = true;
            v23.isHoveringOverRing = false;
        else
            v23.isHoveringOverStick = false;
        end;
        if v23.selectArrow == v27.Instance then
            v23.isHoveringOverStick = true;
            return;
        else
            v23.isHoveringOverArrow = false;
            return;
        end;
    else
        v23.isHoveringOverRing = false;
        v23.isHoveringOverArrow = false;
        v23.isHoveringOverStick = false;
        return;
    end;
end;
v9.onMouseMove = function(v28, v29, v30) --[[ Line: 158 ]] --[[ Name: onMouseMove ]]
    -- upvalues: v5 (copy), v4 (copy)
    if not v28.initSucceded then
        return;
    elseif v5.isInvalidCameraType() then
        return;
    else
        v28:processRaycast(v29, v30);
        local l_ray_0 = v28.ray;
        local v32 = nil;
        if v28.isChangingYaw then
            v32 = v5.getRayPlaneHit(l_ray_0.Origin, l_ray_0.Origin + l_ray_0.Direction * v4.planeTestRayLength, Vector3.new(0, 1, 0, 0), v4.selectRingXZDistance);
            if not v28.rayHitLastFrame then
                v28.rayHitLastFrame = v32;
            end;
            local v33 = v32 - Vector3.new(0, 0, 0, 0);
            v33 = Vector3.new(v33.x, 0, v33.z).Unit;
            local l_Unit_0 = (v28.rayHitLastFrame - Vector3.new(0, 0, 0, 0)).Unit;
            l_Unit_0 = Vector3.new(l_Unit_0.x, 0, l_Unit_0.z).Unit;
            local v35 = nil;
            v35 = v33:Cross(l_Unit_0).y >= 0 and -1 or 1;
            v28.spinY = v28.spinY + v35 * math.acos((math.clamp(v33:Dot(l_Unit_0), -1, 1)));
        end;
        if v28.isChangingPitch then
            v32 = v5.getRayPlaneHit(l_ray_0.Origin, l_ray_0.Origin + l_ray_0.Direction * v4.planeTestRayLength, v28.selectStick.CFrame.RightVector, 0);
            if CFrame.fromEulerAnglesYXZ(0, v28.spinY, 0).LookVector:Dot(v32) < 0 then
                if not v28.rayHitLastFrame then
                    v28.rayHitLastFrame = v32;
                end;
                local l_Unit_1 = (v32 - Vector3.new(0, 0, 0, 0)).Unit;
                local _ = Vector3.new(l_Unit_1.x, 0, l_Unit_1.z).Unit;
                v28.spinX = math.asin((math.clamp(-l_Unit_1.y, -1, 1)));
            end;
        end;
        v28.rayHitLastFrame = v32;
        return;
    end;
end;
v9.onInputChanged = function(v38, v39) --[[ Line: 232 ]] --[[ Name: onInputChanged ]]
    -- upvalues: v4 (copy)
    if v38.mouseDownPosition == nil then
        return;
    else
        if v39.UserInputType == Enum.UserInputType.MouseMovement then
            local l_x_0 = v39.Position.x;
            local l_y_0 = v39.Position.y;
            if math.abs(v38.mouseDownPosition.x - l_x_0) + math.abs(v38.mouseDownPosition.y - l_y_0) > v4.dragDelta then
                local v42 = v38.mouseDownGuiPosition.X.Offset + l_x_0 - v38.mouseDownPosition.x;
                local v43 = v38.mouseDownGuiPosition.Y.Offset + l_y_0 - v38.mouseDownPosition.y;
                if v38.isChangingYaw or v38.isChangingPitch or v38.isScaling then
                    v38:onMouseMove(l_x_0, l_y_0);
                    v38.windChanged = true;
                end;
                if not v38.isChangingYaw and not v38.isChangingPitch and not v38.isScaling then
                    v38.viewport.Position = UDim2.new(v38.mouseDownGuiPosition.X.Scale, v42, v38.mouseDownGuiPosition.Y.Scale, v43);
                end;
            end;
        end;
        return;
    end;
end;
v9.onInputEnded = function(v44, v45) --[[ Line: 258 ]] --[[ Name: onInputEnded ]]
    if v45.UserInputType == Enum.UserInputType.MouseButton1 then
        v44.isChangingYaw = false;
        v44.isChangingPitch = false;
        v44.isScaling = false;
        v44.ringDragIndicatorPart.Transparency = 1;
    end;
    if v45.UserInputType == Enum.UserInputType.MouseButton1 and v44.mouseDownPosition then
        v44.mouseDownPosition = nil;
    end;
end;
v9.screenPointToViewport = function(v46, v47, v48) --[[ Line: 270 ]] --[[ Name: screenPointToViewport ]]
    -- upvalues: l_GuiService_0 (copy)
    local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
    return v47 - v46.viewport.AbsolutePosition.x - l_l_GuiService_0_GuiInset_0.x, v48 - v46.viewport.AbsolutePosition.y - l_l_GuiService_0_GuiInset_0.y;
end;
v9.updatePickRay = function(v50, v51, v52) --[[ Line: 277 ]] --[[ Name: updatePickRay ]]
    local v53, v54 = v50:screenPointToViewport(v51, v52);
    local v55 = v53 / v50.viewport.AbsoluteSize.x;
    local v56 = v54 / v50.viewport.AbsoluteSize.y;
    v50.ray = v50.viewportCamera:ViewportPointToRay(v55, v56, 0);
    if v50.cameraCFrame == nil then
        return;
    else
        v50.direction = v50.cameraCFrame:VectorToWorldSpace(v50.ray.Direction);
        return;
    end;
end;
v9.onMouseButton1Down = function(v57, v58, v59) --[[ Line: 291 ]] --[[ Name: onMouseButton1Down ]]
    -- upvalues: v7 (copy)
    if not v57.initSucceded then
        return;
    else
        v57:processRaycast(v58, v59);
        v57.mouseDownPosition = Vector2.new(v58, v59);
        v57.mouseDownGuiPosition = v57.viewport.Position;
        v57.isChangingPitch = v57.isHoveringOverStick or v57.isHoveringOverArrow;
        v57.isChangingYaw = not v57.isChangingPitch and not v57.isScaling and v57.isHoveringOverRing;
        v57.ringDragIndicatorPart.Transparency = v57.isChangingYaw and 0 or 1;
        if v57.isChangingYaw then
            v57.onisChangingYawChanged();
            local l_v7_0 = v7;
            l_v7_0.greenCircleCount = l_v7_0.greenCircleCount + 1;
            return;
        else
            if v57.isChangingPitch then
                v57.onisChangingPitchChanged();
            end;
            return;
        end;
    end;
end;
v9.afterCamera = function(v61, _) --[[ Line: 310 ]] --[[ Name: afterCamera ]]
    -- upvalues: v4 (copy)
    local l_viewportCamera_0 = v61.viewportCamera;
    local l_selectStick_0 = v61.selectStick;
    local l_selectRing_0 = v61.selectRing;
    local l_selectArrow_0 = v61.selectArrow;
    local l_isHoveringOverStick_0 = v61.isHoveringOverStick;
    local l_isHoveringOverRing_0 = v61.isHoveringOverRing;
    local l_isHoveringOverArrow_0 = v61.isHoveringOverArrow;
    local l_isChangingPitch_0 = v61.isChangingPitch;
    local l_isChangingYaw_0 = v61.isChangingYaw;
    local l_isScaling_0 = v61.isScaling;
    if l_viewportCamera_0 == nil then
        return;
    else
        v61:loadValuesFromGlobalWind();
        if v61.windChanged then
            workspace.GlobalWind = v61.selectStick.CFrame.LookVector * workspace.GlobalWind.Magnitude;
            v61.onWindChanged();
            v61.windChanged = false;
        end;
        v61.windhoseSimulation.windSpeed = v61.windSpeed;
        v61.windhoseSimulation.windDir = l_selectArrow_0.CFrame.LookVector;
        v61.windhoseSimulation.spinY = v61.spinY;
        v61.windhoseSimulation.spinX = v61.spinX;
        local v73 = tick() - v61.lastTick;
        l_viewportCamera_0.CFrame = CFrame.new(l_viewportCamera_0.CFrame.Position.X, l_viewportCamera_0.CFrame.Position.Y, l_viewportCamera_0.CFrame.Position.Z + 0.001 * v73);
        l_selectStick_0.CFrame = CFrame.fromEulerAnglesYXZ(0, v61.spinY, 0) * CFrame.fromEulerAnglesYXZ(v61.spinX, 0, 0);
        l_selectStick_0.CFrame = l_selectStick_0.CFrame - l_selectStick_0.CFrame.LookVector;
        v61.ringDragIndicatorPart.CFrame = CFrame.fromEulerAnglesYXZ(0, v61.spinY, 0);
        v61.ringDragIndicatorPart.CFrame = v61.ringDragIndicatorPart.CFrame - v61.ringDragIndicatorPart.CFrame.LookVector / 2;
        v61.ringDragIndicatorPart.CFrame = v61.ringDragIndicatorPart.CFrame - Vector3.yAxis / 2;
        l_selectArrow_0.CFrame = l_selectStick_0.CFrame + 0.5 * (l_selectArrow_0.Size.z + l_selectStick_0.Size.z) * l_selectStick_0.CFrame.LookVector;
        v61.windhoseSimulation.cone.CFrame = CFrame.fromEulerAnglesYXZ(0, v61.spinY, 0) * CFrame.fromEulerAnglesYXZ(v61.spinX, 0, 0);
        if v61.windhoseSimulation.physicallyAnimate then
            v61.windhoseSimulation.cone.CFrame = CFrame.lookAt(-5 * l_selectArrow_0.CFrame.LookVector, -10 * l_selectArrow_0.Position);
        end;
        local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
        if not l_isChangingPitch_0 and not l_isScaling_0 and not l_isHoveringOverArrow_0 and not l_isHoveringOverStick_0 and (l_isHoveringOverRing_0 or l_isChangingYaw_0) then
            l_selectRing_0.Size = v61.selectRingOrigSize + Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
            l_selectRing_0.Transparency = 0;
        else
            l_selectRing_0.Size = v61.selectRingOrigSize;
            l_selectRing_0.Transparency = 0.2;
        end;
        if not l_isChangingYaw_0 and not l_isScaling_0 and (l_isHoveringOverStick_0 or l_isChangingPitch_0) then
            l_selectStick_0.Size = v61.selectStickOrigSize + Vector3.new(0.10000000149011612, 0.10000000149011612, -0.75, 0);
            l_selectStick_0.Transparency = 0;
        else
            l_selectStick_0.Size = v61.selectStickOrigSize + Vector3.new(0.05000000074505806, 0.05000000074505806, -0.75, 0);
            l_selectStick_0.Transparency = 0.2;
        end;
        l_selectStick_0.Size = Vector3.new(l_selectStick_0.Size.x, l_selectStick_0.Size.y, l_selectStick_0.Size.z * v61.windScaleFactor);
        if not l_isChangingYaw_0 and not l_isScaling_0 and (l_isHoveringOverStick_0 or l_isChangingPitch_0) then
            l_selectArrow_0.Size = v61.selectArrowOrigSize + Vector3.new(0.05000000074505806, 0.05000000074505806, 0.05000000074505806, 0);
            l_selectArrow_0.Transparency = 0;
        else
            l_selectArrow_0.Size = v61.selectArrowOrigSize;
            l_selectArrow_0.Transparency = 0.2;
            v61.windScaleFactor = 1;
        end;
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        l_viewportCamera_0.CFrame = CFrame.fromMatrix(-l_CFrame_0.LookVector * v4.cameraDistance + Vector3.new(0, -0.5, 0, 0), l_CFrame_0.RightVector, l_CFrame_0.UpVector, -l_CFrame_0.LookVector);
        if l_viewportCamera_0.CFrame ~= v61.cameraCFrame then
            v61.cameraCFrame = l_viewportCamera_0.CFrame;
            v61.viewport.LightDirection = (v61.cameraCFrame - v61.cameraCFrame.Position):ToWorldSpace(CFrame.new(-1, -1, -1)).Position;
        end;
        return;
    end;
end;
v9.setEnabled = function(v76, v77) --[[ Line: 418 ]] --[[ Name: setEnabled ]]
    -- upvalues: v6 (copy), l_RunService_0 (copy), l_UserInputService_0 (copy)
    local function v79(v78) --[[ Line: 419 ]] --[[ Name: onInputChanged ]]
        -- upvalues: v76 (copy)
        v76:onInputChanged(v78);
    end;
    local function v81(v80) --[[ Line: 422 ]] --[[ Name: onInputEnded ]]
        -- upvalues: v76 (copy)
        v76:onInputEnded(v80);
    end;
    if v76.inputChangedConnection ~= nil then
        v76.inputChangedConnection:Disconnect();
    end;
    if v76.inputEndedConnection ~= nil then
        v76.inputEndedConnection:Disconnect();
    end;
    if v77 and v76.initSucceded then
        v76.windhoseSimulation = v6();
        v76.windhoseSimulation:init(v76.worldModel);
        v76.lastTick = tick();
        l_RunService_0:BindToRenderStep("WindControlAfterCamera", Enum.RenderPriority.Camera.Value + 1, function(v82) --[[ Line: 438 ]] --[[ Name: afterCameraRenderStep ]]
            -- upvalues: v76 (copy)
            v76:afterCamera(v82);
        end);
        v76.inputChangedConnection = l_UserInputService_0.InputChanged:connect(v79);
        v76.inputEndedConnection = l_UserInputService_0.InputEnded:connect(v81);
        return;
    else
        l_RunService_0:UnbindFromRenderStep("WindControlAfterCamera");
        if v76.windhoseSimulation ~= nil then
            v76.windhoseSimulation:destroy();
            v76.windhoseSimulation = nil;
        end;
        return;
    end;
end;
return v9;