local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
return function(v2) --[[ Line: 13 ]] --[[ Name: Box ]]
    -- upvalues: v1 (copy)
    local l_Adornee_0 = v2.Adornee;
    local l_CFrame_0 = v2.CFrame;
    local l_Color_0 = v2.Color;
    local l_Size_0 = v2.Size;
    local l_Transparency_0 = v2.Transparency;
    return v1.createElement(v1.Fragment, {}, {
        OnTop = v1.createElement("BoxHandleAdornment", {
            Adornee = l_Adornee_0, 
            AlwaysOnTop = true, 
            CFrame = l_CFrame_0, 
            Color = l_Color_0, 
            Size = l_Size_0, 
            Transparency = l_Transparency_0, 
            ZIndex = 0
        }), 
        Outline = v1.createElement("BoxHandleAdornment", {
            Adornee = l_Adornee_0, 
            CFrame = l_CFrame_0, 
            Color = l_Color_0, 
            Size = l_Size_0, 
            Transparency = l_Transparency_0
        })
    });
end;