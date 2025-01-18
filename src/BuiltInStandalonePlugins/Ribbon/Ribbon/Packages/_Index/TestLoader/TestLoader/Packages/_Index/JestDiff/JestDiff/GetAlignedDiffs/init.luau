local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_DELETE_0 = v3.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v3.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v3.DIFF_INSERT;
local l_Diff_0 = v3.Diff;
local _ = require(l_Parent_0.types);
local function v14(v9, v10, v11) --[[ Line: 30 ]] --[[ Name: concatenateRelevantDiffs ]]
    -- upvalues: l_Array_0 (copy), l_DIFF_EQUAL_0 (copy)
    return l_Array_0.reduce(v10, function(v12, v13) --[[ Line: 31 ]]
        -- upvalues: l_DIFF_EQUAL_0 (ref), v9 (copy), v11 (copy)
        if v13[1] == l_DIFF_EQUAL_0 then
            return v12 .. v13[2];
        elseif v13[1] == v9 and #v13[2] ~= 0 then
            return v12 .. v11(v13[2]);
        else
            return v12 .. "";
        end;
    end, "");
end;
local v15 = {};
v15.__index = v15;
v15.new = function(v16, v17) --[[ Line: 61 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    local v18 = setmetatable({}, v15);
    v18.op = v16;
    v18.line = {};
    v18.lines = {};
    v18.changeColor = v17;
    return v18;
end;
v15.pushSubstring = function(v19, v20) --[[ Line: 71 ]] --[[ Name: pushSubstring ]]
    -- upvalues: l_Diff_0 (copy)
    v19:pushDiff(l_Diff_0.new(v19.op, v20));
end;
v15.pushLine = function(v21) --[[ Line: 75 ]] --[[ Name: pushLine ]]
    -- upvalues: l_Diff_0 (copy), v14 (copy)
    table.insert(v21.lines, if #v21.line ~= 1 then l_Diff_0.new(v21.op, v14(v21.op, v21.line, v21.changeColor)) else if v21.line[1][1] == v21.op then v21.line[1] else l_Diff_0.new(v21.op, v21.line[1][2]));
    v21.line = {};
end;
v15.isLineEmpty = function(v22) --[[ Line: 93 ]] --[[ Name: isLineEmpty ]]
    return #v22.line == 0;
end;
v15.pushDiff = function(v23, v24) --[[ Line: 98 ]] --[[ Name: pushDiff ]]
    table.insert(v23.line, v24);
end;
v15.align = function(v25, v26) --[[ Line: 103 ]] --[[ Name: align ]]
    local v27 = v26[2];
    if v27:match("\n") then
        local v28 = v27:split("\n");
        local v29 = #v28;
        for v30, v31 in ipairs(v28) do
            if v30 < v29 then
                v25:pushSubstring(v31);
                v25:pushLine();
            elseif #v31 ~= 0 then
                v25:pushSubstring(v31);
            end;
        end;
        return;
    else
        v25:pushDiff(v26);
        return;
    end;
end;
v15.moveLinesTo = function(v32, v33) --[[ Line: 130 ]] --[[ Name: moveLinesTo ]]
    if not v32:isLineEmpty() then
        v32:pushLine();
    end;
    for _, v35 in ipairs(v32.lines) do
        table.insert(v33, v35);
    end;
    v32.lines = {};
end;
local v36 = {};
v36.__index = v36;
v36.new = function(v37, v38) --[[ Line: 144 ]] --[[ Name: new ]]
    -- upvalues: v36 (copy)
    local v39 = {
        deleteBuffer = v37, 
        insertBuffer = v38, 
        lines = {}
    };
    setmetatable(v39, v36);
    return v39;
end;
v36.pushDiffCommonLine = function(v40, v41) --[[ Line: 153 ]] --[[ Name: pushDiffCommonLine ]]
    table.insert(v40.lines, v41);
end;
v36.pushDiffChangeLines = function(v42, v43) --[[ Line: 157 ]] --[[ Name: pushDiffChangeLines ]]
    local v44 = #v43[2] == 0;
    if not v44 or v42.deleteBuffer:isLineEmpty() then
        v42.deleteBuffer:pushDiff(v43);
    end;
    if not v44 or v42.insertBuffer:isLineEmpty() then
        v42.insertBuffer:pushDiff(v43);
    end;
end;
v36.flushChangeLines = function(v45) --[[ Line: 169 ]] --[[ Name: flushChangeLines ]]
    v45.deleteBuffer:moveLinesTo(v45.lines);
    v45.insertBuffer:moveLinesTo(v45.lines);
end;
v36.align = function(v46, v47) --[[ Line: 174 ]] --[[ Name: align ]]
    -- upvalues: l_Diff_0 (copy)
    local v48 = v47[1];
    local v49 = v47[2];
    if v49:match("\n") then
        local v50 = v49:split("\n");
        local v51 = #v50;
        for v52, v53 in ipairs(v50) do
            if v52 == 1 then
                local v54 = l_Diff_0.new(v48, v53);
                if v46.deleteBuffer:isLineEmpty() and v46.insertBuffer:isLineEmpty() then
                    v46:flushChangeLines();
                    v46:pushDiffCommonLine(v54);
                else
                    v46:pushDiffChangeLines(v54);
                    v46:flushChangeLines();
                end;
            elseif v52 < v51 then
                v46:pushDiffCommonLine(l_Diff_0.new(v48, v53));
            elseif #v53 ~= 0 then
                v46:pushDiffChangeLines(l_Diff_0.new(v48, v53));
            end;
        end;
        return;
    else
        v46:pushDiffChangeLines(v47);
        return;
    end;
end;
v36.getLines = function(v55) --[[ Line: 214 ]] --[[ Name: getLines ]]
    v55:flushChangeLines();
    return v55.lines;
end;
return function(v56, v57) --[[ Line: 229 ]]
    -- upvalues: v15 (copy), l_DIFF_DELETE_0 (copy), l_DIFF_INSERT_0 (copy), v36 (copy)
    local v58 = v15.new(l_DIFF_DELETE_0, v57);
    local v59 = v15.new(l_DIFF_INSERT_0, v57);
    local v60 = v36.new(v58, v59);
    for _, v62 in ipairs(v56) do
        local v63 = v62[1];
        if v63 == l_DIFF_DELETE_0 then
            v58:align(v62);
        elseif v63 == l_DIFF_INSERT_0 then
            v59:align(v62);
        else
            v60:align(v62);
        end;
    end;
    return v60:getLines();
end;