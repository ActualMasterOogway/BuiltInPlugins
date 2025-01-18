local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Src.Components.Dialogs.TeachingCallout);
return function(v3, v4, v5) --[[ Line: 9 ]]
    -- upvalues: v1 (copy), v2 (copy)
    local v6 = {};
    for _, v8 in v3 do
        if v8.ShouldShow(v5) then
            v6[v8.Name] = v1.createElement(v2, {
                DefinitionId = v8.Name, 
                LocationId = v4
            });
        end;
    end;
    return v6;
end;