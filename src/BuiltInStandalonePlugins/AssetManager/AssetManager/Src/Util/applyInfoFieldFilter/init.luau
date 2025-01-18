local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Src.Types);
local l_AssetInfoField_0 = v1.AssetInfoField;
local v3 = {};
local function _(v4, v5, v6) --[[ Line: 19 ]] --[[ Name: defaultApplyFilter ]]
    return v6[v4[v5]];
end;
v3[l_AssetInfoField_0.Creator] = function(v8, v9) --[[ Line: 27 ]]
    return v9[v8.Creator.Name];
end;
for _, v11 in v1.getEnumAsList(l_AssetInfoField_0) do
    if not v3[v11] then
        v3[v11] = function(v12, v13) --[[ Line: 34 ]]
            -- upvalues: v11 (copy)
            return v13[v12[v11]];
        end;
    end;
end;
return v3;