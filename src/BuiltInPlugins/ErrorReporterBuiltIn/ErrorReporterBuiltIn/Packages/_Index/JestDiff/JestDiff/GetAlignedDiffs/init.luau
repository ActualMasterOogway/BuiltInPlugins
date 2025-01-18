local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_DELETE_0 = v3.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v3.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v3.DIFF_INSERT;
local l_Diff_0 = v3.Diff;
local _ = require(l_Parent_0.types);
local function v14(v9, v10, v11) --[[ Line: 29 ]] --[[ Name: concatenateRelevantDiffs ]]
    -- upvalues: l_Array_0 (copy), l_DIFF_EQUAL_0 (copy)
    return l_Array_0.reduce(v10, function(v12, v13) --[[ Line: 36 ]]
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
v15.new = function(v16, v17) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: v15 (copy)
    local v18 = {
        op = v16, 
        line = {}, 
        lines = {}, 
        changeColor = v17
    };
    setmetatable(v18, v15);
    return v18;
end;
v15.pushSubstring = function(v19, v20) --[[ Line: 61 ]] --[[ Name: pushSubstring ]]
    -- upvalues: l_Diff_0 (copy)
    v19:pushDiff(l_Diff_0.new(v19.op, v20));
end;
v15.pushLine = function(v21) --[[ Line: 65 ]] --[[ Name: pushLine ]]
    -- upvalues: l_Diff_0 (copy), v14 (copy)
    local v22 = nil;
    v22 = if #v21.line ~= 1 then l_Diff_0.new(v21.op, v14(v21.op, v21.line, v21.changeColor)) else if v21.line[1][1] == v21.op then v21.line[1] else l_Diff_0.new(v21.op, v21.line[1][2]);
    table.insert(v21.lines, v22);
    v21.line = {};
end;
v15.isLineEmpty = function(v23) --[[ Line: 90 ]] --[[ Name: isLineEmpty ]]
    return #v23.line == 0;
end;
v15.pushDiff = function(v24, v25) --[[ Line: 95 ]] --[[ Name: pushDiff ]]
    table.insert(v24.line, v25);
end;
v15.align = function(v26, v27) --[[ Line: 100 ]] --[[ Name: align ]]
    local v28 = v27[2];
    if v28:match("\n") then
        local v29 = v28:split("\n");
        local v30 = #v29;
        for v31, v32 in ipairs(v29) do
            if v31 < v30 then
                v26:pushSubstring(v32);
                v26:pushLine();
            elseif #v32 ~= 0 then
                v26:pushSubstring(v32);
            end;
        end;
        return;
    else
        v26:pushDiff(v27);
        return;
    end;
end;
v15.moveLinesTo = function(v33, v34) --[[ Line: 127 ]] --[[ Name: moveLinesTo ]]
    if not v33:isLineEmpty() then
        v33:pushLine();
    end;
    for _, v36 in ipairs(v33.lines) do
        table.insert(v34, v36);
    end;
    v33.lines = {};
end;
local v37 = {};
v37.__index = v37;
v37.new = function(v38, v39) --[[ Line: 141 ]] --[[ Name: new ]]
    -- upvalues: v37 (copy)
    local v40 = {
        deleteBuffer = v38, 
        insertBuffer = v39, 
        lines = {}
    };
    setmetatable(v40, v37);
    return v40;
end;
v37.pushDiffCommonLine = function(v41, v42) --[[ Line: 150 ]] --[[ Name: pushDiffCommonLine ]]
    table.insert(v41.lines, v42);
end;
v37.pushDiffChangeLines = function(v43, v44) --[[ Line: 154 ]] --[[ Name: pushDiffChangeLines ]]
    local v45 = #v44[2] == 0;
    if not v45 or v43.deleteBuffer:isLineEmpty() then
        v43.deleteBuffer:pushDiff(v44);
    end;
    if not v45 or v43.insertBuffer:isLineEmpty() then
        v43.insertBuffer:pushDiff(v44);
    end;
end;
v37.flushChangeLines = function(v46) --[[ Line: 166 ]] --[[ Name: flushChangeLines ]]
    v46.deleteBuffer:moveLinesTo(v46.lines);
    v46.insertBuffer:moveLinesTo(v46.lines);
end;
v37.align = function(v47, v48) --[[ Line: 171 ]] --[[ Name: align ]]
    -- upvalues: l_Diff_0 (copy)
    local v49 = v48[1];
    local v50 = v48[2];
    if v50:match("\n") then
        local v51 = v50:split("\n");
        local v52 = #v51;
        for v53, v54 in ipairs(v51) do
            if v53 == 1 then
                local v55 = l_Diff_0.new(v49, v54);
                if v47.deleteBuffer:isLineEmpty() and v47.insertBuffer:isLineEmpty() then
                    v47:flushChangeLines();
                    v47:pushDiffCommonLine(v55);
                else
                    v47:pushDiffChangeLines(v55);
                    v47:flushChangeLines();
                end;
            elseif v53 < v52 then
                v47:pushDiffCommonLine(l_Diff_0.new(v49, v54));
            elseif #v54 ~= 0 then
                v47:pushDiffChangeLines(l_Diff_0.new(v49, v54));
            end;
        end;
        return;
    else
        v47:pushDiffChangeLines(v48);
        return;
    end;
end;
v37.getLines = function(v56) --[[ Line: 214 ]] --[[ Name: getLines ]]
    v56:flushChangeLines();
    return v56.lines;
end;
return function(v57, v58) --[[ Line: 229 ]]
    -- upvalues: v15 (copy), l_DIFF_DELETE_0 (copy), l_DIFF_INSERT_0 (copy), v37 (copy)
    local v59 = v15.new(l_DIFF_DELETE_0, v58);
    local v60 = v15.new(l_DIFF_INSERT_0, v58);
    local v61 = v37.new(v59, v60);
    for _, v63 in ipairs(v57) do
        local v64 = v63[1];
        if v64 == l_DIFF_DELETE_0 then
            v59:align(v63);
        elseif v64 == l_DIFF_INSERT_0 then
            v60:align(v63);
        else
            v61:align(v63);
        end;
    end;
    return v61:getLines();
end;