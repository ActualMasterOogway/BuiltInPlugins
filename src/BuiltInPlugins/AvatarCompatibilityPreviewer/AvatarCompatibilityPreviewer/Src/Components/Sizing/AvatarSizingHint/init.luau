local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local l_CoreGui_0 = game:GetService("CoreGui");
local v2 = require(l_script_FirstAncestor_0.Src.Components.Sizing.AvatarSizeRulerRender);
local v3 = require(l_script_FirstAncestor_0.Src.Components.Sizing.AvatarSizeSpecificationUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Components.Sizing.AvatarSizingBoundingBox);
local v5 = require(l_script_FirstAncestor_0.Src.Util.DataModelUtils);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local v7 = require(l_script_FirstAncestor_0.Src.Components.Sizing.InvalidPartsHint);
local v8 = require(l_script_FirstAncestor_0.Packages.React);
local v9 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v11 = require(l_script_FirstAncestor_0.Src.Components.UGCValidationContext);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagUGCValidateUseDataCache);
local v13 = require(l_script_FirstAncestor_0.Src.Components.Sizing.useAvatarSizeState);
local v14 = require(l_script_FirstAncestor_0.Src.Components.Sizing.useResetAvatarValuesToScale);
local v15 = require(l_script_FirstAncestor_0.Src.Components.Sizing.useSelectedRibbonTool);
return function(v16) --[[ Line: 32 ]] --[[ Name: AvatarSizingHint ]]
    -- upvalues: v6 (copy), v8 (copy), v11 (copy), v12 (copy), v13 (copy), v5 (copy), v3 (copy), v14 (copy), v15 (copy), v9 (copy), v4 (copy), v2 (copy), v7 (copy), l_CoreGui_0 (copy)
    local v17 = v6.ContextServices.Localization:use();
    local v18 = v8.useContext(v11.Context);
    local v21 = v8.useCallback(function() --[[ Line: 36 ]]
        -- upvalues: v16 (copy)
        local l_BoundingBox_0, v20 = v16.Avatar.WorldModel:GetBoundingBox();
        return {
            CFrame = l_BoundingBox_0, 
            Size = v20
        };
    end, {
        v16.Avatar.WorldModel, 
        v16.Avatar.WorldModelScale, 
        v16.Avatar.LatestWorldModelHash
    });
    local v22 = v8.useRef(nil);
    local v23 = v8.useRef(0);
    local v29 = v8.useCallback(function(v24) --[[ Line: 49 ]]
        -- upvalues: v16 (copy), v12 (ref), v18 (copy), v22 (copy), v23 (copy)
        local v25 = {};
        for _, v27 in v16.Avatar.WorldModel:GetChildren() do
            if v27:IsA("MeshPart") then
                v25[v27.Name] = v27;
            end;
        end;
        if not v12() then
            return v18.calculateScaleToValidateBoundsAsync(v25);
        else
            if v22.current == nil or not v18.isPreprocessDataCached(v25, v22.current) then
                local v28 = v18.preprocessDataAsync(v25);
                if v23.current ~= v24 then
                    return nil;
                elseif v28.ok then
                    v22.current = v28.cache;
                else
                    v22.current = nil;
                end;
            end;
            return (v18.calculateScaleToValidateBoundsAsync(v25, nil, nil, nil, nil, v22.current));
        end;
    end, {
        v16.Avatar.WorldModel, 
        v16.Avatar.WorldModelScale, 
        v16.Avatar.LatestWorldModelHash
    });
    local v30, v31 = v8.useState(nil);
    local v32, v33 = v8.useState(v21);
    local v34 = v13({
        Avatar = v16.Avatar, 
        ValidationResults = v30
    });
    v8.useEffect(function() --[[ Line: 107 ]]
        -- upvalues: v5 (ref), v16 (copy), v33 (copy), v21 (copy)
        return v5.watchForChanges(v16.Avatar.WorldModel, function(v35, v36) --[[ Line: 108 ]]
            -- upvalues: v33 (ref), v21 (ref)
            if v35:IsA("BasePart") and v36 == "Size" or v36 == "CFrame" then
                v33(v21());
            end;
        end);
    end, {
        v16.Avatar.WorldModel, 
        v21
    });
    v8.useEffect(function() --[[ Line: 115 ]]
        -- upvalues: v31 (copy), v12 (ref), v23 (copy), v29 (copy)
        v31(nil);
        local v37 = nil;
        if v12() then
            v37 = v23.current + 1;
            v23.current = v37;
        end;
        local v38 = true;
        local v40 = task.spawn(function() --[[ Line: 127 ]]
            -- upvalues: v29 (ref), v37 (ref), v38 (ref), v31 (ref)
            local v39 = v29(v37);
            if v38 then
                v31(v39);
            end;
        end);
        return function() --[[ Line: 135 ]]
            -- upvalues: v38 (ref), v12 (ref), v40 (copy)
            v38 = false;
            if not v12() then
                task.cancel(v40);
            end;
        end;
    end, {
        v29
    });
    local v41 = v8.useMemo(function() --[[ Line: 144 ]]
        -- upvalues: v3 (ref), v32 (copy), v34 (copy)
        return v3.coversMin(v32.Size, v34.sizeBounds.minSize);
    end, {
        v34.sizeBounds.minSize, 
        v32.Size
    });
    local v42 = v8.useMemo(function() --[[ Line: 148 ]]
        -- upvalues: v3 (ref), v32 (copy), v34 (copy)
        return v3.containsMax(v32.Size, v34.sizeBounds.maxSize);
    end, {
        v34.sizeBounds.maxSize, 
        v32.Size
    });
    local v43 = v41 and v42;
    v14({
        Avatar = v16.Avatar, 
        Enabled = v43
    });
    if v15() ~= Enum.RibbonTool.Scale then
        return nil;
    else
        local v44 = v30 ~= nil;
        return v9.createPortal(v8.createElement(v8.Fragment, {}, {
            MinBoundingBox = if not v44 or v43 then nil else v8.createElement(v4, {
                BoundingBoxCFrame = v32.CFrame, 
                BoundingBoxSize = v32.Size, 
                IsValid = v41, 
                Inside = true, 
                AllValid = v43, 
                Size = v34.sizeBounds.minSize
            }), 
            MaxBoundingBox = if not v44 or v43 then nil else v8.createElement(v4, {
                BoundingBoxCFrame = v32.CFrame, 
                BoundingBoxSize = v32.Size, 
                IsValid = v42, 
                Inside = false, 
                AllValid = v43, 
                Size = v34.sizeBounds.maxSize
            }), 
            Ruler = if not v44 or v43 then nil else v8.createElement(v2, {
                ItemName = v17:getText("AvatarSizeRuler", "AvatarLabel"), 
                Size = v32.Size, 
                CFrame = v32.CFrame, 
                SizeBounds = v34.sizeBounds
            }), 
            InvalidPartsHint = if v44 and v43 and next(v34.invalidBodyParts) then v8.createElement(v7, {
                invalidBodyParts = v34.invalidBodyParts
            }) else nil
        }), v16.Container or l_CoreGui_0, "AvatarSizingHint");
    end;
end;