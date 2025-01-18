local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local _ = require(l_script_FirstAncestor_0.Fields.FieldTypes);
local v2 = {};
for _, v4 in script:GetChildren() do
    assert(v4:IsA("ModuleScript"), "All children of AllFields must be a ModuleScript");
    local v5 = require(v4);
    v2[v5.key] = v5;
end;
return v2;