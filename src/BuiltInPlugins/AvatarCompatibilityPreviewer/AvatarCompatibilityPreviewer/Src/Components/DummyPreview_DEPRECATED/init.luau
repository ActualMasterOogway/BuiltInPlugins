local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v4 = require(l_script_FirstAncestor_0.Src.Util.addPlatform);
local l_AssetRenderModel_0 = v1.UI.AssetRenderModel;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return v2.memo(function(v10) --[[ Line: 25 ]] --[[ Name: DummyPreview ]]
    -- upvalues: l_Stylizer_0 (copy), v2 (copy), v3 (copy), v7 (copy), v4 (copy), l_AssetRenderModel_0 (copy)
    local v11 = l_Stylizer_0:use("DummyPreview");
    local v12 = v2.useContext(v3);
    local v13, v14 = v2.useState(nil);
    v2.useEffect(function() --[[ Line: 31 ]]
        -- upvalues: v13 (copy), v14 (copy), v10 (copy), v7 (ref), v4 (ref), v11 (copy)
        if v13 ~= nil then
            v13:Destroy();
            v14(nil);
        end;
        if v10.Dummy == nil then
            return;
        else
            assert(v10.Dummy ~= nil, v7.LUAU_ANALYZE_ERROR);
            local l_WorldModel_0 = Instance.new("WorldModel");
            v10.Dummy.Name = "Dummy";
            v10.Dummy.Parent = l_WorldModel_0;
            l_WorldModel_0.PrimaryPart = v10.Dummy.PrimaryPart;
            l_WorldModel_0:PivotTo(CFrame.new());
            v14(l_WorldModel_0);
            return v4(l_WorldModel_0, v10.Dummy, v11.PlatformHeight, v11.PlatformSize);
        end;
    end, {
        v10.Dummy
    });
    local v16 = v2.useState(Instance.new("Camera"));
    local v17 = v2.useRef({
        cframe = CFrame.new(), 
        focus = CFrame.new(), 
        model = nil
    });
    assert(v17.current ~= nil, v7.LUAU_ANALYZE_ERROR);
    local v20 = v2.useCallback(function() --[[ Line: 64 ]]
        -- upvalues: v17 (copy), v12 (copy), v16 (copy)
        local l_current_0 = v17.current;
        assert(l_current_0.model ~= nil, "Model hasn't been set before resetCamera");
        local v19 = v12.stage.getPreviewCameraModifications and v12.stage.getPreviewCameraModifications(l_current_0.model.Dummy);
        v16.CFrame = v19.cframe or l_current_0.cframe;
        v16.Focus = v19.focus or l_current_0.focus;
        v16.FieldOfView = v19.fov;
    end, {
        v12.stage
    });
    v2.useEffect(function() --[[ Line: 76 ]]
        -- upvalues: v17 (copy), v20 (copy)
        if v17.current.model == nil then
            return;
        else
            v20();
            return;
        end;
    end, {
        v12.stage
    });
    local v22 = v2.useCallback(function(v21) --[[ Line: 84 ]]
        -- upvalues: v17 (copy), v16 (copy), v20 (copy)
        task.defer(function() --[[ Line: 86 ]]
            -- upvalues: v21 (copy), v17 (ref), v16 (ref), v20 (ref)
            if not v21:IsDescendantOf(game) then
                return;
            else
                assert(v21:FindFirstChild("Dummy"), "View model does not have a dummy");
                v17.current = {
                    cframe = v16.CFrame, 
                    focus = v16.Focus, 
                    model = v21
                };
                v20();
                return;
            end;
        end);
    end, {});
    v2.useEffect(function() --[[ Line: 103 ]]
        -- upvalues: v10 (copy), v20 (copy)
        local v23 = v10.ResetCameraSignal:Connect(v20);
        return function() --[[ Line: 105 ]]
            -- upvalues: v23 (copy)
            v23:Disconnect();
        end;
    end, {
        v20, 
        v10.ResetCameraSignal
    });
    if v13 then
        return (v2.createElement(l_AssetRenderModel_0, {
            Camera = v16, 
            Model = v13, 
            FocusPosition = v10.Dummy.PrimaryPart.CFrame.Position, 
            FocusDirection = v10.Dummy.PrimaryPart.CFrame.LookVector, 
            Size = UDim2.fromScale(1, 1), 
            Ambient = v11.Ambient, 
            LightColor = v11.LightColor, 
            LightDirection = v11.LightDirection, 
            PanSpeedMultiplier = v11.PanSpeedMultiplier, 
            ShouldClone = false, 
            RecenterModelOnUpdate = true, 
            RecenterCameraOnUpdate = true, 
            Static = v12.dummyPreviewLocked, 
            OnViewModelLoaded = v22
        }));
    else
        return nil;
    end;
end);