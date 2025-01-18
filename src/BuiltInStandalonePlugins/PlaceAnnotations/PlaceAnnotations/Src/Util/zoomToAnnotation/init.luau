local l_script_FirstAncestor_0 = script:FindFirstAncestor("PlaceAnnotations");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_TweenService_0 = game:GetService("TweenService");
local function _(v3, v4) --[[ Line: 8 ]] --[[ Name: signedFuzz ]]
    if v3 == 0 then
        return 0.1;
    elseif math.abs(v3) < v4 then
        return math.sign(v3) * 0.1;
    else
        return v3;
    end;
end;
return function(v6) --[[ Line: 18 ]] --[[ Name: zoomToAnnotation ]]
    -- upvalues: l_TweenService_0 (copy)
    local l_AnnotationsService_0 = game:GetService("AnnotationsService");
    if not v6.Adornee then
        l_AnnotationsService_0.Selected = v6;
        return;
    else
        assert(v6.Adornee, "Can only zoom to annotations with adornees");
        if v6.Adornee:IsA("PVInstance") then
            local _ = v6.Adornee;
            local l_v6_AbsolutePosition_0 = v6:GetAbsolutePosition();
            local v10 = RaycastParams.new();
            v10:AddToFilter({
                v6.Adornee
            });
            v10.FilterType = Enum.RaycastFilterType.Include;
            v10.CollisionGroup = "StudioSelectable";
            v10.BruteForceAllSlow = true;
            local v11 = workspace:Raycast(l_v6_AbsolutePosition_0 + v6.AdorneeOffset.Unit, -v6.AdorneeOffset, v10);
            local l_CameraType_0 = workspace.CurrentCamera.CameraType;
            workspace.CurrentCamera.CameraType = Enum.CameraType.Custom;
            workspace.CurrentCamera.Focus = CFrame.new(l_v6_AbsolutePosition_0);
            local v13 = if v11 then v11.Normal.Unit else -l_v6_AbsolutePosition_0.Unit;
            if math.abs(v13.Y) > 0.9 then
                local l_X_0 = v13.X;
                local v15 = l_X_0 == 0 and 0.1 or if math.abs(l_X_0) < 0.1 then math.sign(l_X_0) * 0.1 else l_X_0;
                l_X_0 = math.sign(v13.Y) * 0.9;
                local l_Z_0 = v13.Z;
                v13 = Vector3.new(v15, l_X_0, l_Z_0 == 0 and 0.1 or if math.abs(l_Z_0) < 0.1 then math.sign(l_Z_0) * 0.1 else l_Z_0);
            end;
            local v17 = l_TweenService_0:Create(workspace.CurrentCamera, TweenInfo.new(0.3, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
                CFrame = CFrame.lookAt(l_v6_AbsolutePosition_0 + v13 * 10, l_v6_AbsolutePosition_0)
            });
            v17:Play();
            v17.Completed:Once(function() --[[ Line: 57 ]]
                -- upvalues: l_CameraType_0 (copy), l_AnnotationsService_0 (copy), v6 (copy)
                workspace.CurrentCamera.CameraType = l_CameraType_0;
                l_AnnotationsService_0.Selected = v6;
            end);
            return;
        else
            error("Adornee type is unsupported.");
            return;
        end;
    end;
end;