local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = {
    GeneralSettings = "GeneralSettings", 
    TextureSettings = "TextureSettings", 
    OverrideSettings = "OverrideSettings", 
    TilingSettings = "TilingSettings", 
    PhysicalSettings = "PhysicalSettings", 
    TerrainDetailsSettings = "TerrainDetailsSettings", 
    TerrainDetailsEditor = {
        Top = "TerrainDetailsTop", 
        Side = "TerrainDetailsSide", 
        Bottom = "TerrainDetailsBottom"
    }
};
return function() --[[ Line: 20 ]]
    -- upvalues: v2 (copy)
    return v2;
end;