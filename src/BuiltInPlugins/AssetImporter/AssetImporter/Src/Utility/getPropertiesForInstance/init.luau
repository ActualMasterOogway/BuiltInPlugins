local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(script.Parent.ImportDataProps);
local l_RootProps_0 = v2.RootProps;
local l_MeshProps_0 = v2.MeshProps;
local l_MaterialProps_0 = v2.MaterialProps;
local l_GroupProps_0 = v2.GroupProps;
local l_JointProps_0 = v2.JointProps;
local l_BaseProps_0 = v2.BaseProps;
local v9 = {
    RootImportData = l_RootProps_0, 
    MeshImportData = l_MeshProps_0, 
    MaterialImportData = l_MaterialProps_0, 
    GroupImportData = l_GroupProps_0, 
    JointImportData = l_JointProps_0, 
    AnimationImportData = l_BaseProps_0, 
    FacsImportData = l_BaseProps_0
};
return function(v10) --[[ Line: 25 ]] --[[ Name: getPropertiesForInstance ]]
    -- upvalues: v9 (copy), l_BaseProps_0 (copy)
    if v10:IsA("BaseImportData") then
        local v11 = v9[v10.ClassName];
        if not v11 then
            warn("Unexpected instance type deriving from BaseImportData: ", v10.ClassName);
            return l_BaseProps_0;
        else
            return v11;
        end;
    else
        error("Unexpected instance type: ", v10.ClassName);
        return;
    end;
end;