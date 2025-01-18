local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
mapNumberRange = function(v4, v5, v6, v7, v8) --[[ Line: 18 ]] --[[ Name: mapNumberRange ]]
    if v6 == v5 then
        error("Range of zero");
    end;
    return (v4 - v5) * (v8 - v7) / (v6 - v5) + v7;
end;
return function(v9) --[[ Line: 26 ]] --[[ Name: AvatarSizingBoundingBox ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v10 = v2.ContextServices.Stylizer:use("AvatarSizingBoundingBox");
    local v11, v12 = v1.useState(nil);
    local v14 = v1.useCallback(function(v13) --[[ Line: 32 ]]
        -- upvalues: v12 (copy)
        v12(v13);
    end, {});
    local v15 = (v9.BoundingBoxCFrame * CFrame.new(v9.BoundingBoxSize * Vector3.new(0, -0.5, 0, 0))):ToWorldSpace(CFrame.new(v9.Size * Vector3.new(0, 0.5, 0, 0)));
    local v16 = v1.useMemo(function() --[[ Line: 39 ]]
        -- upvalues: v9 (copy), v10 (copy)
        if v9.IsValid then
            if v9.AllValid then
                return v10.NeutralColor;
            else
                return v10.ValidColor;
            end;
        else
            return v10.InvalidColor;
        end;
    end, {
        v9.IsValid, 
        v9.AllValid
    });
    local v17 = 0;
    if v9.IsValid then
        v17 = if v9.AllValid then v10.NeutralTransparency else v10.ValidTransparency;
    end;
    if v9.Inside then
        v17 = 0.5 * v17;
    end;
    return v1.createElement("Part", {
        Size = v9.Size, 
        CFrame = v15, 
        Color = v16, 
        ref = v14, 
        Archivable = false, 
        CanCollide = false, 
        CanQuery = false, 
        Anchored = true, 
        Locked = true, 
        TopSurface = Enum.SurfaceType.Smooth, 
        BottomSurface = Enum.SurfaceType.Smooth, 
        Transparency = 1
    }, {
        TopAdornment = v1.createElement("BoxHandleAdornment", {
            Size = v9.Size, 
            Archivable = false, 
            AlwaysOnTop = true, 
            CFrame = CFrame.new(0, 0, 0), 
            Transparency = mapNumberRange(v17, 0, 1, 0.9, 1), 
            Color3 = v16, 
            Adornee = v11
        }), 
        BottomAdornment = v1.createElement("BoxHandleAdornment", {
            Size = v9.Size, 
            Archivable = false, 
            AlwaysOnTop = false, 
            CFrame = CFrame.new(0, 0, 0), 
            Transparency = mapNumberRange(v17, 0, 1, 0.9, 1), 
            Color3 = v16, 
            Adornee = v11
        }), 
        SelectionBox = v1.createElement("SelectionBox", {
            Archivable = false, 
            Color3 = v16, 
            SurfaceColor3 = v16, 
            Adornee = v11, 
            LineThickness = 0.01, 
            Transparency = mapNumberRange(v17, 0, 1, 0.5, 1)
        })
    });
end;