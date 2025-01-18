local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.DiffSequences);
local v3 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_DELETE_0 = v3.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v3.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v3.DIFF_INSERT;
local l_Diff_0 = v3.Diff;
return function(v8, v9) --[[ Line: 22 ]]
    -- upvalues: l_Diff_0 (copy), l_DIFF_DELETE_0 (copy), l_DIFF_INSERT_0 (copy), l_DIFF_EQUAL_0 (copy), v2 (copy)
    local function v12(v10, v11) --[[ Line: 23 ]]
        -- upvalues: v8 (copy), v9 (copy)
        return v8:sub(v10 + 1, v10 + 1) == v9:sub(v11 + 1, v11 + 1);
    end;
    local v13 = 0;
    local v14 = 0;
    local v15 = {};
    local function v19(v16, v17, v18) --[[ Line: 31 ]]
        -- upvalues: v13 (ref), v15 (copy), l_Diff_0 (ref), l_DIFF_DELETE_0 (ref), v8 (copy), v14 (ref), l_DIFF_INSERT_0 (ref), v9 (copy), l_DIFF_EQUAL_0 (ref)
        if v13 ~= v17 then
            table.insert(v15, l_Diff_0.new(l_DIFF_DELETE_0, v8:sub(v13 + 1, v17)));
        end;
        if v14 ~= v18 then
            table.insert(v15, l_Diff_0.new(l_DIFF_INSERT_0, v9:sub(v14 + 1, v18)));
        end;
        v13 = v17 + v16;
        v14 = v18 + v16;
        table.insert(v15, l_Diff_0.new(l_DIFF_EQUAL_0, v9:sub(v18 + 1, v14)));
    end;
    v2(#v8, #v9, v12, v19);
    if v13 ~= #v8 then
        table.insert(v15, l_Diff_0.new(l_DIFF_DELETE_0, v8:sub(v13 + 1)));
    end;
    if v14 ~= #v9 then
        table.insert(v15, l_Diff_0.new(l_DIFF_INSERT_0, v9:sub(v14 + 1)));
    end;
    return v15;
end;