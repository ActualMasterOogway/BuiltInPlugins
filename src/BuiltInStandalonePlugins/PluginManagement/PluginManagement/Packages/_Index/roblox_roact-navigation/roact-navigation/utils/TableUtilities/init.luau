local v0 = {};
local v1 = {};
local function _(v2) --[[ Line: 8 ]] --[[ Name: makeKeyString ]]
    if type(v2) == "string" then
        return string.format("%s", v2);
    else
        return string.format("[%s]", (tostring(v2)));
    end;
end;
local function v6(v4) --[[ Line: 16 ]] --[[ Name: makeValueString ]]
    local v5 = type(v4);
    if v5 == "string" then
        return string.format("%q", v4);
    elseif v5 == "function" or v5 == "table" then
        return string.format("<%s>", (tostring(v4)));
    else
        return string.format("%s", (tostring(v4)));
    end;
end;
local function v14(v7, v8, v9, v10) --[[ Line: 27 ]] --[[ Name: printKeypair ]]
    -- upvalues: v6 (copy)
    local v11 = if type(v7) == "string" then string.format("%s", v7) else string.format("[%s]", (tostring(v7)));
    local v12 = v6(v8);
    local v13 = v10 and string.format(" -- %s", v10) or "";
    print(string.format("%s%s = %s,%s", v9, v11, v12, v13));
end;
v0.ShallowEqual = function(v15, v16, v17) --[[ Line: 39 ]] --[[ Name: ShallowEqual ]]
    -- upvalues: v1 (copy)
    if not v15 or not v16 then
        return false;
    elseif v15 == v16 then
        return true;
    else
        if not v17 then
            v17 = v1;
        end;
        for v18, v19 in pairs(v15) do
            if v16[v18] ~= v19 and not v17[v18] then
                return false;
            end;
        end;
        for v20, v21 in pairs(v16) do
            if v15[v20] ~= v21 and not v17[v20] then
                return false;
            end;
        end;
        return true;
    end;
end;
v0.EqualKey = function(v22, v23, v24) --[[ Line: 67 ]] --[[ Name: EqualKey ]]
    if v22 and v23 and v24 and v24 ~= "" and v22[v24] and v23[v24] and v22[v24] == v23[v24] then
        return true;
    else
        return false;
    end;
end;
v0.TableDifference = function(v25, v26) --[[ Line: 78 ]] --[[ Name: TableDifference ]]
    local v27 = {};
    for v28, v29 in pairs(v25) do
        if v26[v28] ~= v25[v28] then
            v27[v28] = v29;
        end;
    end;
    return v27;
end;
local function _(v30) --[[ Line: 96 ]] --[[ Name: membershipTable ]]
    local v31 = {};
    for v32 = 1, #v30 do
        v31[v30[v32]] = true;
    end;
    return v31;
end;
local _ = function(v34) --[[ Line: 108 ]] --[[ Name: listOfKeys ]]
    local v35 = {};
    for v36, _ in pairs(v34) do
        table.insert(v35, v36);
    end;
    return v35;
end;
v0.ListDifference = function(v39, v40) --[[ Line: 121 ]] --[[ Name: ListDifference ]]
    -- upvalues: v0 (copy)
    local l_TableDifference_0 = v0.TableDifference;
    local v42 = {};
    for v43 = 1, #v39 do
        v42[v39[v43]] = true;
    end;
    local l_v42_0 = v42;
    local v45 = {};
    for v46 = 1, #v40 do
        v45[v40[v46]] = true;
    end;
    l_TableDifference_0 = l_TableDifference_0(l_v42_0, v45);
    l_v42_0 = {};
    for v47, _ in pairs(l_TableDifference_0) do
        table.insert(l_v42_0, v47);
    end;
    return l_v42_0;
end;
v0.CheckListConsistency = function(v49) --[[ Line: 132 ]] --[[ Name: CheckListConsistency ]]
    local v50 = false;
    local v51 = false;
    local v52 = true;
    local v53 = 1;
    for v54, _ in pairs(v49) do
        if type(v54) == "string" then
            v51 = true;
        elseif type(v54) == "number" then
            if v53 ~= v54 then
                v52 = false;
            end;
            v50 = true;
        else
            return false;
        end;
        if v51 and v50 then
            return false;
        else
            v53 = v53 + 1;
        end;
    end;
    if v50 then
        return v52;
    else
        return true;
    end;
end;
v0.RecursiveToString = function(v56, v57) --[[ Line: 168 ]] --[[ Name: RecursiveToString ]]
    -- upvalues: v0 (copy)
    v57 = v57 or "";
    if type(v56) == "table" then
        local v58 = "";
        if not v0.CheckListConsistency(v56) then
            v58 = v58 .. "-- WARNING: this table fails the list consistency test\n";
        end;
        v58 = v58 .. "{\n";
        for v59, v60 in pairs(v56) do
            if type(v59) == "string" then
                v58 = v58 .. "  " .. v57 .. tostring(v59) .. " = " .. v0.RecursiveToString(v60, "  " .. v57) .. ";\n";
            end;
            if type(v59) == "number" then
                v58 = v58 .. "  " .. v57 .. v0.RecursiveToString(v60, "  " .. v57) .. ",\n";
            end;
        end;
        return v58 .. v57 .. "}";
    else
        return (tostring(v56));
    end;
end;
v0.Print = function(v61, v62) --[[ Line: 202 ]] --[[ Name: Print ]]
    -- upvalues: v6 (copy), v14 (copy)
    v62 = v62 or "  ";
    if type(v61) ~= "table" then
        error("TableUtilities.Print must be passed a table", 2);
    end;
    local v63 = {};
    local function v64(v65, v66, v67) --[[ Line: 212 ]] --[[ Name: recurse ]]
        -- upvalues: v63 (copy), v62 (ref), v6 (ref), v14 (ref), v64 (copy)
        v63[v65] = true;
        local v68 = string.rep(v62, v67);
        local v69 = string.rep(v62, v67 + 1);
        if v66 then
            print(string.format("%s%s = %s {", v68, if type(v66) == "string" then string.format("%s", v66) else string.format("[%s]", (tostring(v66))), v6(v65)));
        else
            print(string.format("%s%s {", v68, v6(v65)));
        end;
        for v70, v71 in pairs(v65) do
            if type(v71) == "table" then
                if v63[v71] then
                    v14(v70, v71, v69, "Possible cycle");
                else
                    v64(v71, v70, v67 + 1);
                end;
            else
                v14(v70, v71, v69);
            end;
        end;
        print(string.format("%s}%s", v68, v67 > 0 and "," or ""));
    end;
    v64(v61, nil, 0);
end;
v0.FieldCount = function(v72) --[[ Line: 246 ]] --[[ Name: FieldCount ]]
    local v73 = 0;
    for _ in pairs(v72) do
        v73 = v73 + 1;
    end;
    return v73;
end;
return v0;