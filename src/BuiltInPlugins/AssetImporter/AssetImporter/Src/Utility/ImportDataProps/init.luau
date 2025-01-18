local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local l_strict_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.strict;
local v2 = require(script.GroupProps);
local v3 = require(script.MeshProps);
local v4 = require(script.RootProps);
local v5 = require(script.MaterialProps);
local v6 = require(script.JointProps);
local v7 = require(script.BaseProps);
return (l_strict_0({
    GroupProps = v2, 
    MeshProps = v3, 
    RootProps = v4, 
    MaterialProps = v5, 
    JointProps = v6, 
    BaseProps = v7
}));