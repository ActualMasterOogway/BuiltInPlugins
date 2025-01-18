local l_InsertService_0 = game:GetService("InsertService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = require(l_script_FirstAncestor_0.Src.Hooks.useAnimationOnAnimateTarget);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v8 = game:DefineFastFlag("AvatarPreviewerAnimateOnlyOnHover", false);
local l_Stylizer_0 = v2.ContextServices.Stylizer;
local l_UI_0 = v2.UI;
local l_AssetRenderModel_0 = l_UI_0.AssetRenderModel;
local l_Pane_0 = l_UI_0.Pane;
return function(v13) --[[ Line: 32 ]] --[[ Name: AnimationPreview ]]
    -- upvalues: l_Stylizer_0 (copy), v3 (copy), l_InsertService_0 (copy), v7 (copy), v6 (copy), l_Pane_0 (copy), v8 (copy), l_AssetRenderModel_0 (copy)
    local v14 = l_Stylizer_0:use("AnimationPreview", v13);
    local v15 = v3.useState(Instance.new("WorldModel"));
    local v17 = v3.useState(function() --[[ Line: 37 ]]
        -- upvalues: v14 (copy)
        local l_Camera_0 = Instance.new("Camera");
        if v14.FieldOfView ~= nil then
            l_Camera_0.FieldOfView = v14.FieldOfView;
        end;
        return l_Camera_0;
    end);
    local v18, v19 = v3.useState(nil);
    v3.useEffect(function() --[[ Line: 50 ]]
        -- upvalues: l_InsertService_0 (ref), v13 (copy), v15 (copy), v19 (copy)
        local v20 = l_InsertService_0:LoadLocalAsset(v13.AnimateTargetAsset):Clone();
        v20.Parent = v15;
        v15.PrimaryPart = v20.PrimaryPart;
        v19(v20);
        return function() --[[ Line: 58 ]]
            -- upvalues: v20 (copy)
            v20:Destroy();
        end;
    end, {});
    local v21 = v7(false);
    v6(v18, v13.AnimationId, nil, if v21.enabled then nil else v14.PausedAnimationAlpha);
    if v18 then
        return (v3.createElement(l_Pane_0, {
            Active = true, 
            [v3.Event.MouseEnter] = v21.enable, 
            [v3.Event.MouseLeave] = if v8 then v21.disable else v21.enable
        }, {
            Model = v3.createElement(l_AssetRenderModel_0, {
                Ambient = Color3.new(1, 1, 1), 
                Camera = v17, 
                FocusDirection = v18.PrimaryPart.CFrame.LookVector:Lerp(v18.PrimaryPart.CFrame.RightVector, v14.FrontRightAngleLerp), 
                InitialDistance = v14.InitialDistance, 
                Model = v15, 
                ShouldClone = false, 
                Static = true, 
                ImageTransparency = v13.Transparency
            })
        }));
    else
        return nil;
    end;
end;