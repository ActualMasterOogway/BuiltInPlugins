local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2) --[[ Line: 10 ]] --[[ Name: getMetadata ]]
    return {
        {
            Label = "Filename", 
            Value = if v2.File then v2.File.Name else ""
        }, 
        {
            Label = "Dimensions", 
            Value = ("%*x%*px"):format(v2.Width, v2.Height)
        }
    };
end;