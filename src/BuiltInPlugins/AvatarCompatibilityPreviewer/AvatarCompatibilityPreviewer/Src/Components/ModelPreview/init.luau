local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.CameraUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.addPlatform);
local _ = require(l_script_FirstAncestor_0.Src.Components.Screens.AvatarScreen.Stages.StageType);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAdjustCameraScale);
local v7 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local l_UI_0 = v1.UI;
local v11 = if v1.SharedFlags.getFFlagDevFrameworkBetterInit() then l_UI_0.AssetRenderModel else v1.StudioUI.AssetRenderModel;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local v13 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return (v2.memo(function(v16) --[[ Line: 46 ]] --[[ Name: ModelPreview ]]
    -- upvalues: v7 (copy), v8 (copy), l_Stylizer_0 (copy), v2 (copy), v13 (copy), v9 (copy), v4 (copy), v6 (copy), v3 (copy), v11 (copy)
    assert(v7() or v8(), "ModelPreview requires FFlagAvatarPreviewerSkinToneAlphaDetection");
    assert(v16.Model.PrimaryPart ~= nil, "PrimaryPart is not set");
    local v17 = l_Stylizer_0:use("ModelPreview");
    local v18, v19 = v2.useState(nil);
    v2.useEffect(function() --[[ Line: 57 ]]
        -- upvalues: v18 (copy), v19 (copy), v16 (copy), v13 (ref), v9 (ref), v4 (ref), v17 (copy)
        if v18 ~= nil then
            v18:Destroy();
            v19(nil);
        end;
        if v16.Model == nil then
            return;
        else
            assert(v16.Model ~= nil, v13.LUAU_ANALYZE_ERROR);
            local l_WorldModel_0 = Instance.new("WorldModel");
            v16.Model.Name = "Dummy";
            v16.Model.Parent = l_WorldModel_0;
            l_WorldModel_0.PrimaryPart = v16.Model.PrimaryPart;
            if v9() then
                if v16.Model:FindFirstChildWhichIsA("Humanoid") then
                    l_WorldModel_0:PivotTo(CFrame.new());
                else
                    l_WorldModel_0:PivotTo(l_WorldModel_0:GetPivot().Rotation);
                end;
            else
                l_WorldModel_0:PivotTo(CFrame.new());
            end;
            v19(l_WorldModel_0);
            return v4(l_WorldModel_0, v16.Model, v17.PlatformHeight, v17.PlatformSize);
        end;
    end, {
        v16.Model
    });
    local v21 = v2.useState(Instance.new("Camera"));
    local v22, v23 = v2.useState(CFrame.new());
    local v24 = v2.useRef({
        cframe = CFrame.new(), 
        focus = CFrame.new(), 
        model = nil
    });
    assert(v24.current ~= nil, v13.LUAU_ANALYZE_ERROR);
    local v30 = v2.useCallback(function() --[[ Line: 104 ]]
        -- upvalues: v9 (ref), v6 (ref), v24 (copy), v16 (copy), v21 (copy), v23 (copy)
        if v9() or v6() then
            local l_current_0 = v24.current;
            if l_current_0 == nil or l_current_0.model == nil then
                return;
            else
                local l_Dummy_0 = l_current_0.model:FindFirstChild("Dummy");
                if l_Dummy_0 == nil or l_Dummy_0.PrimaryPart == nil then
                    return;
                else
                    local v27 = v16.GetCameraModifications(l_Dummy_0);
                    v21.CFrame = v27.cframe or l_current_0.cframe;
                    v21.Focus = v27.focus or l_current_0.focus;
                    v21.FieldOfView = v27.fov;
                    if v6() then
                        v23(v27.cframe or l_current_0.cframe);
                        return;
                    end;
                end;
            end;
        else
            local l_current_1 = v24.current;
            assert(l_current_1.model ~= nil, "Model hasn't been set before resetCamera");
            local v29 = v16.GetCameraModifications(l_current_1.model.Dummy);
            v21.CFrame = v29.cframe or l_current_1.cframe;
            v21.Focus = v29.focus or l_current_1.focus;
            v21.FieldOfView = v29.fov;
        end;
    end, {
        v16.GetCameraModifications
    });
    local v33 = if v6() then v2.useCallback(function(v31) --[[ Line: 139 ]]
        -- upvalues: v16 (copy), v21 (copy), v24 (copy), v3 (ref)
        local v32 = v16.GetCameraModifications(v31.Dummy);
        v21.FieldOfView = v32.fov;
        v24.current = {
            cframe = v3.getAngledAndZoomedCFrame(v21, v31, 1), 
            focus = v32.focus or v16.Model:GetBoundingBox(), 
            model = v31
        };
    end, {
        v16.GetCameraModifications
    }) else nil;
    v2.useEffect(function() --[[ Line: 151 ]]
        -- upvalues: v24 (copy), v6 (ref), v33 (copy), v30 (copy)
        if v24.current.model == nil then
            return;
        else
            if v6() then
                v33(v24.current.model);
            end;
            v30();
            return;
        end;
    end, {
        v16.GetCameraModifications
    });
    local v36 = v2.useCallback(function(v34) --[[ Line: 163 ]]
        -- upvalues: v6 (ref), v33 (copy), v24 (copy), v13 (ref), v21 (copy), v30 (copy), v16 (copy)
        local v35 = nil;
        task.defer(function() --[[ Line: 167 ]]
            -- upvalues: v34 (copy), v6 (ref), v33 (ref), v24 (ref), v13 (ref), v21 (ref), v30 (ref), v16 (ref), v35 (ref)
            if not v34:IsDescendantOf(game) then
                return;
            else
                assert(v34:FindFirstChild("Dummy"), "View model does not have a dummy");
                if v6() then
                    v33(v34);
                else
                    v24.current = {
                        cframe = v13.DEFAULT_CAMERA_ANGLE, 
                        focus = v21.Focus, 
                        model = v34
                    };
                end;
                v30();
                if not v6() then
                    if v16.DEPRECATED_InitialCameraPosition == nil then
                        return;
                    else
                        assert(v16.DEPRECATED_SetInitialCameraPosition ~= nil, "InitialCameraPosition should always some with a SetInitialCameraPosition");
                        v21.CFrame = v16.DEPRECATED_InitialCameraPosition;
                        v35 = v21:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 197 ]]
                            -- upvalues: v16 (ref), v21 (ref)
                            v16.DEPRECATED_SetInitialCameraPosition(v21.CFrame);
                        end);
                    end;
                end;
                return;
            end;
        end);
        return function() --[[ Line: 202 ]]
            -- upvalues: v6 (ref), v35 (ref)
            if not v6() and v35 ~= nil then
                v35:Disconnect();
            end;
        end;
    end, {
        if not v6() then v16.DEPRECATED_InitialCameraPosition else nil
    });
    v2.useEffect(function() --[[ Line: 211 ]]
        -- upvalues: v16 (copy), v13 (ref), v30 (copy)
        if v16.ResetCameraSignal == nil then
            return;
        else
            assert(v16.ResetCameraSignal ~= nil, v13.LUAU_ANALYZE_ERROR);
            local v37 = v16.ResetCameraSignal:Connect(v30);
            return function() --[[ Line: 218 ]]
                -- upvalues: v37 (copy)
                v37:Disconnect();
            end;
        end;
    end, {
        v30, 
        v16.ResetCameraSignal
    });
    v2.useEffect(function() --[[ Line: 225 ]]
        -- upvalues: v18 (copy)
        local function v40() --[[ Line: 226 ]]
            -- upvalues: v18 (ref)
            if v18 ~= nil then
                for _, v39 in v18:GetDescendants() do
                    if v39:IsA("WrapLayer") then
                        v39.Order = v39.Order + 1;
                        v39.Order = v39.Order - 1;
                    end;
                end;
            end;
        end;
        task.defer(v40);
        task.delay(0.05, v40);
    end, {
        v18
    });
    local v41 = if v6() then v24.current.focus else v16.Model.PrimaryPart.CFrame;
    if v18 then
        return (v2.createElement(v11, {
            Camera = v21, 
            Model = v18, 
            FocusPosition = v41.Position, 
            FocusDirection = v41.LookVector, 
            Size = UDim2.fromScale(1, 1), 
            Ambient = v17.Ambient, 
            EnableSky = v17.EnableSky, 
            LightColor = v17.LightColor, 
            LightDirection = v17.LightDirection, 
            PanSpeedMultiplier = v17.PanSpeedMultiplier, 
            ShouldClone = false, 
            RecenterModelOnUpdate = true, 
            RecenterCameraOnUpdate = true, 
            Static = v16.Static, 
            ResetCameraPosition = if v6() then v22 else v13.DEFAULT_CAMERA_ANGLE, 
            OnViewModelLoaded = v36, 
            ShowResetCamera = v16.ShowResetCameraButton
        }));
    else
        return nil;
    end;
end));