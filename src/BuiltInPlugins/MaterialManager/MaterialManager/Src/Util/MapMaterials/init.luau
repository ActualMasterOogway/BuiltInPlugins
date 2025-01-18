local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local function v2(v3, v4, v5) --[[ Line: 6 ]] --[[ Name: mapMaterials ]]
    -- upvalues: v2 (copy)
    for _, v7 in ipairs(v3.Materials) do
        table.insert(v4, if v5 then v5(v7) else v7);
    end;
    for _, v9 in ipairs(v3.CategoryNames) do
        v2(v3.Categories[v9], v4, v5);
    end;
end;
return v2;