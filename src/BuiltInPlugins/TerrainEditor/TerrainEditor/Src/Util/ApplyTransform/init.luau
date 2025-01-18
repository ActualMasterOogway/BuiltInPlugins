local l_Util_0 = script:FindFirstAncestor("TerrainEditor").Src.Util;
local v1 = require(l_Util_0.ConvertTransformToRegion);
return function(v2, v3, v4, v5, v6) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    if not v6 then
        v3:ApplyTransform(v4.Rotation, v5);
    end;
    v2:PasteRegion(v3, v1(v4, v5).Min, false);
end;