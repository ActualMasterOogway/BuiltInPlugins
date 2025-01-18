local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_DraggerSchemaTemplate_0 = l_script_FirstAncestor_0.Packages.DraggerSchemaTemplate;
local v3 = require(l_DraggerSchemaTemplate_0.DraggerSchema);
return v1.join(v3, {
    dispatchWorldClick = require(script.dispatchWorldClick), 
    getMouseTarget = require(script.getMouseTarget), 
    getNextSelectables = require(script.getNextSelectables), 
    isExclusiveSelectable = require(script.isExclusiveSelectable), 
    Selection = require(script.Selection), 
    SelectionInfo = require(script.SelectionInfo), 
    TransformHandlesImplementation = require(script.TransformHandlesImplementation)
});