local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_Util_0 = l_Parent_0.Src.Util;
local v3 = require(l_Util_0.CopyPath);
local function v4(v5, v6, v7) --[[ Line: 7 ]] --[[ Name: recurseCategories ]]
    -- upvalues: v3 (copy), v4 (copy)
    local v8 = {};
    for _, v10 in ipairs(v5.CategoryNames) do
        local v11 = v5.Categories[v10];
        local v12 = if v11.Builtin then v7:getText("Categories", v10) else v10;
        local v13 = v3(v6);
        table.insert(v13, v10);
        if #v11.CategoryNames > 0 then
            table.insert(v8, {
                children = v4(v11, v13, v7), 
                path = v13, 
                text = v12
            });
        else
            table.insert(v8, {
                path = v13, 
                text = v12
            });
        end;
    end;
    return v8;
end;
return function(v14, v15) --[[ Line: 33 ]]
    -- upvalues: v4 (copy)
    return (v4(v14, {}, v15));
end;