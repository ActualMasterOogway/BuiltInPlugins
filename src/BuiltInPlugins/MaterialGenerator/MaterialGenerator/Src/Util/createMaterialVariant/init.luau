local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
return function(v2) --[[ Line: 5 ]]
    local l_MaterialVariant_0 = Instance.new("MaterialVariant");
    l_MaterialVariant_0.Name = v2.Name;
    l_MaterialVariant_0.Archivable = false;
    local l_Textures_0 = v2.Textures;
    l_MaterialVariant_0.ColorMap = l_Textures_0.ColorMap;
    if l_Textures_0.NormalMap then
        l_MaterialVariant_0.NormalMap = l_Textures_0.NormalMap;
    end;
    if l_Textures_0.MetalnessMap then
        l_MaterialVariant_0.MetalnessMap = l_Textures_0.MetalnessMap;
    end;
    if l_Textures_0.RoughnessMap then
        l_MaterialVariant_0.RoughnessMap = l_Textures_0.RoughnessMap;
    end;
    return l_MaterialVariant_0;
end;