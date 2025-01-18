local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Tools.BaseTool);
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local _ = v2.BuildSettings;
local l_Category_0 = v2.Category;
local _ = v2.Gizmo;
local _ = v2.MaterialUnit;
local l_Tab_0 = v2.Tab;
local l_TerrainType_0 = v2.TerrainType;
local v9 = {
    {
        Defaults = {}, 
        Id = l_Category_0.BuildSettings
    }
};
return (v1:new(l_TerrainType_0.None, l_Tab_0.None, v9, {}));