local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v4 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v5 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v6 = require(l_script_FirstAncestor_0.Src.Components.Background);
local v7 = require(l_script_FirstAncestor_0.Src.Components.DummyPreview_DEPRECATED);
local v8 = require(l_script_FirstAncestor_0.Src.Components.ModelPreview);
local v9 = require(l_script_FirstAncestor_0.Src.Hooks.useSerializedState);
local l_UI_0 = v1.UI;
local l_LoadingIndicator_0 = l_UI_0.LoadingIndicator;
local l_Pane_0 = l_UI_0.Pane;
local v13 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAdjustCameraScale);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerAutoSetup);
local v18 = v17();
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUI);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
return function(v23) --[[ Line: 45 ]] --[[ Name: PrimaryDummyPreview ]]
    -- upvalues: v19 (copy), v2 (copy), v4 (copy), v18 (copy), v5 (copy), l_Stylizer_0 (copy), v16 (copy), v9 (copy), v13 (copy), v17 (copy), v21 (copy), l_Pane_0 (copy), v3 (copy), v6 (copy), v8 (copy), l_LoadingIndicator_0 (copy), v20 (copy), v7 (copy)
    local v24 = if v19() then v2.useContext(v4.Context) else if v18 then v2.useContext(v5) else nil;
    local v25 = if v18 then nil else l_Stylizer_0:use("PrimaryDummyPreview");
    local v30 = v2.useCallback(function(_, v27) --[[ Line: 55 ]]
        if v27.UserInputType ~= Enum.UserInputType.MouseButton2 then
            return;
        else
            local l_Position_0 = v27.Position;
            local v29 = nil;
            v29 = v27:GetPropertyChangedSignal("Position"):Connect(function() --[[ Line: 63 ]]
                -- upvalues: v27 (copy), l_Position_0 (copy), v29 (ref)
                if (v27.Position - l_Position_0).Magnitude >= 4 then
                    v29:Disconnect();
                end;
            end);
            return;
        end;
    end, {
        v23.Dummy, 
        v23.RevertToDefault
    });
    local v31 = nil;
    local v32 = nil;
    if not v16() then
        local v33, v34 = v9(v23.Avatar.WorldModel, "CameraPosition", v13.DEFAULT_CAMERA_ANGLE);
        v31 = v33;
        v32 = v34;
    end;
    if v17() or v19() then
        if v21() and v23.Dummy then
            assert(v23.Dummy.PrimaryPart ~= nil, "PrimaryPart is not set");
        end;
        return v2.createElement(l_Pane_0, {
            ZIndex = -1, 
            [v3.Event.InputBegan] = v30
        }, {
            Background = v2.createElement(v6), 
            DummyPreview = if v23.Dummy then v2.createElement(v8, {
                Model = v23.Dummy, 
                ResetCameraSignal = v23.ResetCameraSignal, 
                DEPRECATED_InitialCameraPosition = v31, 
                DEPRECATED_SetInitialCameraPosition = v32, 
                GetCameraModifications = v24.stage.getPreviewCameraModifications, 
                Static = v24.dummyPreviewLocked
            }) else v2.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = if v20() then nil else UDim2.fromScale(0.5, 0.5)
            })
        });
    else
        return v2.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v25.BackgroundImage, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = -1, 
            [v3.Event.InputBegan] = v30
        }, {
            DummyPreview = if v23.Dummy then v2.createElement(v7, {
                Dummy = v23.Dummy, 
                ResetCameraSignal = v23.ResetCameraSignal
            }) else v2.createElement(l_LoadingIndicator_0, {
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.fromScale(0.5, 0.5), 
                Size = UDim2.fromScale(0.5, 0.5)
            })
        });
    end;
end;