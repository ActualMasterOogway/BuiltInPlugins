local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 14 ]]
    -- upvalues: v1 (copy)
    local l_Adornee_0 = v2.Adornee;
    local l_AlwaysOnTop_0 = v2.AlwaysOnTop;
    local l_Color_0 = v2.Color;
    local l_Size_0 = v2.Size;
    local l_Transform_0 = v2.Transform;
    local l_Transparency_0 = v2.Transparency;
    return v1.createElement("BoxHandleAdornment", {
        Adornee = l_Adornee_0, 
        AlwaysOnTop = l_AlwaysOnTop_0, 
        Color3 = l_Color_0, 
        CFrame = l_Transform_0, 
        Size = l_Size_0, 
        Transparency = if l_AlwaysOnTop_0 then l_Transparency_0 else nil, 
        ZIndex = 0
    });
end;