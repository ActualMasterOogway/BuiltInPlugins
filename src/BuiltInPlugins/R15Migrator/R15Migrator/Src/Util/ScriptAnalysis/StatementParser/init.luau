local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.Constants);
local v2 = require(l_Parent_0.StringUtil);
local v3 = {};
local v4 = {
    "\").", 
    "').", 
    "\"].", 
    "'].", 
    ".", 
    "[\"", 
    ":FindFirstChild(\"", 
    ":FindFirstChild\"", 
    ":WaitForChild(\"", 
    ":WaitForChild\""
};
local _ = function(v5) --[[ Line: 20 ]] --[[ Name: isChildAccessed ]]
    -- upvalues: v4 (copy)
    for _, v7 in v4 do
        if v5 == v7 then
            return true;
        end;
    end;
    return false;
end;
local function _(v9, v10) --[[ Line: 30 ]] --[[ Name: findNameInStatement ]]
    -- upvalues: v2 (copy)
    local v11, v12 = string.find(v9, v10, nil, true);
    if v11 and v12 and v2.MatchBefore(v9, v11, "[[%s.,(=+-*/\"']", true) then
        return v11, v12;
    else
        return nil;
    end;
end;
local function v26(v14) --[[ Line: 38 ]] --[[ Name: getStatementsFromLine ]]
    -- upvalues: v2 (copy), v1 (copy)
    local v15 = {};
    local v16 = nil;
    local v17 = nil;
    local v18 = nil;
    local v19 = nil;
    local v20 = nil;
    local v21 = false;
    local v22 = false;
    local v23 = {};
    for v24 = 1, string.len(v14) do
        local v25 = v2.CharAt(v14, v24);
        if string.match(v25, "%S") then
            if v22 then
                if v17 and v18 then
                    v23.Left = {
                        [v1.StartKey] = v17, 
                        [v1.EndKey] = v18
                    };
                end;
                if v19 and v20 then
                    v23.Right = {
                        [v1.StartKey] = v19, 
                        [v1.EndKey] = v20
                    };
                end;
                table.insert(v15, v23);
                v23 = {};
                v17 = nil;
                v18 = nil;
                v19 = nil;
                v20 = nil;
                v22 = false;
            end;
            if not v17 then
                v17 = v24;
            end;
            if not v21 then
                if v25 == "=" and v16 ~= "~" then
                    v18 = v24 - 1;
                    v21 = true;
                end;
            else
                if v25 ~= "=" then
                    v19 = v24;
                    if v17 and v18 then
                        v23.Left = {
                            [v1.StartKey] = v17, 
                            [v1.EndKey] = v18
                        };
                    end;
                else
                    v18 = nil;
                end;
                v21 = false;
            end;
        elseif v16 and string.match(v16, "%p") and v16 ~= "=" and v16 ~= "," and not v22 then
            v22 = true;
            if v19 then
                v20 = v24 - 1;
            elseif v17 then
                v18 = v24 - 1;
            end;
        end;
        v16 = v25;
    end;
    v23 = {};
    if v17 then
        v23.Left = {
            [v1.StartKey] = v17, 
            [v1.EndKey] = v18 or string.len(v14)
        };
    end;
    if v19 then
        v23.Right = {
            [v1.StartKey] = v19, 
            [v1.EndKey] = v20 or string.len(v14)
        };
    end;
    if next(v23) then
        table.insert(v15, v23);
    end;
    return v15;
end;
local function _(v27, v28) --[[ Line: 133 ]] --[[ Name: isInLeft ]]
    -- upvalues: v1 (copy)
    return v27 and v27.Left and v27.Left[v1.StartKey] <= v28 and v28 <= v27.Left[v1.EndKey];
end;
local function _(v30, v31) --[[ Line: 140 ]] --[[ Name: isInRight ]]
    -- upvalues: v1 (copy)
    return v30 and v30.Right and v30.Right[v1.StartKey] <= v31 and v31 <= v30.Right[v1.EndKey];
end;
v3.GetStatement = function(_, v34, v35) --[[ Line: 147 ]] --[[ Name: GetStatement ]]
    -- upvalues: v26 (copy), v1 (copy)
    local v36 = v26(v34);
    for _, v38 in ipairs(v36) do
        if v38 and v38.Left and v38.Left[v1.StartKey] <= v35 and v35 <= v38.Left[v1.EndKey] or v38 and v38.Right and v38.Right[v1.StartKey] <= v35 and v35 <= v38.Right[v1.EndKey] then
            return v38;
        end;
    end;
    return nil;
end;
v3.GetLeftSide = function(v39, v40, v41) --[[ Line: 158 ]] --[[ Name: GetLeftSide ]]
    local l_v39_Statement_0 = v39:GetStatement(v40, v41);
    if l_v39_Statement_0 then
        return l_v39_Statement_0.Left;
    else
        return nil;
    end;
end;
v3.GetRightSide = function(v43, v44, v45) --[[ Line: 167 ]] --[[ Name: GetRightSide ]]
    -- upvalues: v1 (copy)
    local l_v43_Statement_0 = v43:GetStatement(v44, v45);
    if l_v43_Statement_0 and l_v43_Statement_0 and l_v43_Statement_0.Right and l_v43_Statement_0.Right[v1.StartKey] <= v45 and v45 <= l_v43_Statement_0.Right[v1.EndKey] then
        return l_v43_Statement_0.Right;
    else
        return nil;
    end;
end;
v3.FindVariableAssignment = function(v47, v48, v49, v50) --[[ Line: 176 ]] --[[ Name: FindVariableAssignment ]]
    -- upvalues: v1 (copy), v2 (copy)
    local l_v47_LeftSide_0 = v47:GetLeftSide(v49, v50);
    if not l_v47_LeftSide_0 then
        return nil;
    else
        local v52 = string.sub(v49, l_v47_LeftSide_0.start, l_v47_LeftSide_0[v1.EndKey]);
        for v53, v54 in pairs(v48) do
            local v55, v56 = string.find(v52, v53, nil, true);
            if (if v55 and v56 and v2.MatchBefore(v52, v55, "[[%s.,(=+-*/\"']", true) then v55 else nil) ~= nil then
                return v53, v54;
            end;
        end;
        return nil;
    end;
end;
v3.FindVariableAccess = function(v57, v58, v59, v60) --[[ Line: 192 ]] --[[ Name: FindVariableAccess ]]
    -- upvalues: v2 (copy), v4 (copy)
    local v61 = false;
    local v62 = v57:GetRightSide(v58, v59) or v57:GetLeftSide(v58, v59);
    if v62 then
        local v63 = string.sub(v58, v62.start, v59 - 1);
        local l_v63_0 = v63;
        local v65, v66 = string.find(l_v63_0, v60, nil, true);
        local v67, v68;
        if v65 and v66 and v2.MatchBefore(l_v63_0, v65, "[[%s.,(=+-*/\"']", true) then
            v67 = v65;
            v68 = v66;
        else
            v67 = nil;
            v68 = nil;
        end;
        while v67 ~= nil and v68 ~= nil do
            l_v63_0 = string.sub(v63, v68 + 1, v59);
            v66 = v2.RemoveWhitespace(l_v63_0);
            for _, v70 in v4 do
                if v66 == v70 then
                    v65 = true;
                    v61 = true;
                end;
                if v61 then
                    break;
                end;
            end;
            if not v61 then
                v65 = false;
            end;
            v61 = false;
            if v65 then
                return v60;
            else
                v63 = string.sub(v63, v68 + 1, (string.len(v63)));
                local l_v63_1 = v63;
                local v72, v73 = string.find(l_v63_1, v60, nil, true);
                if v72 and v73 and v2.MatchBefore(l_v63_1, v72, "[[%s.,(=+-*/\"']", true) then
                    v65 = v72;
                    v66 = v73;
                else
                    v65 = nil;
                    v66 = nil;
                end;
                v67 = v65;
                v68 = v66;
            end;
        end;
    end;
    return nil;
end;
return v3;