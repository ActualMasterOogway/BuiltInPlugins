local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Src.Components.Properties.Types.PathProperty);
local function v3(v2) --[[ Line: 5 ]] --[[ Name: hideIfNotPbr ]]
    return not v2.IsPbr;
end;
return {
    {
        Section = "ObjectGeneral", 
        Properties = {
            {
                Name = "ImportName", 
                Editable = true
            }, 
            {
                Name = "DiffuseFilePath", 
                Editable = false, 
                AllowPickFile = true, 
                ComponentFactory = v1
            }, 
            {
                Name = "NormalFilePath", 
                Editable = false, 
                AllowPickFile = true, 
                ComponentFactory = v1, 
                ShouldHide = v3
            }, 
            {
                Name = "MetalnessFilePath", 
                Editable = false, 
                AllowPickFile = true, 
                ComponentFactory = v1, 
                ShouldHide = v3
            }, 
            {
                Name = "RoughnessFilePath", 
                Editable = false, 
                AllowPickFile = true, 
                ComponentFactory = v1, 
                ShouldHide = v3
            }
        }
    }
};