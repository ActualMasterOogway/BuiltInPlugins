local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_EQUAL_0 = v3.DIFF_EQUAL;
local l_cleanupSemantic_0 = v3.cleanupSemantic;
local v6 = require(l_Parent_0.DiffLines);
local l_diffLinesUnified_0 = v6.diffLinesUnified;
local l_printDiffLines_0 = v6.printDiffLines;
local v9 = require(l_Parent_0.DiffStrings);
local v10 = require(l_Parent_0.GetAlignedDiffs);
local l_normalizeDiffOptions_0 = require(l_Parent_0.NormalizeDiffOptions).normalizeDiffOptions;
local _ = require(l_Parent_0.types);
local v13 = nil;
local function v21(v14, v15) --[[ Line: 36 ]] --[[ Name: hasCommonDiff ]]
    -- upvalues: l_Array_0 (copy), l_DIFF_EQUAL_0 (copy)
    if v15 then
        local v16 = #v14;
        return l_Array_0.some(v14, function(v17, v18) --[[ Line: 40 ]]
            -- upvalues: l_DIFF_EQUAL_0 (ref), v16 (copy)
            local v19 = false;
            if v17[1] == l_DIFF_EQUAL_0 then
                v19 = true;
                if v18 == v16 then
                    v19 = v17[2] ~= "\n";
                end;
            end;
            return v19;
        end);
    else
        return l_Array_0.some(v14, function(v20) --[[ Line: 45 ]]
            -- upvalues: l_DIFF_EQUAL_0 (ref)
            return v20[1] == l_DIFF_EQUAL_0;
        end);
    end;
end;
local function v29(v22, v23, v24) --[[ Line: 52 ]] --[[ Name: diffStringsUnified ]]
    -- upvalues: v13 (ref), v21 (copy), l_normalizeDiffOptions_0 (copy), v10 (copy), l_printDiffLines_0 (copy), l_diffLinesUnified_0 (copy)
    if v22 ~= v23 and #v22 ~= 0 and #v23 ~= 0 then
        local v25 = true;
        if v22:find("\n") == nil then
            v25 = v23:find("\n") ~= nil;
        end;
        local v26 = v13(v25 and v22 .. "\n" or v22, v25 and v23 .. "\n" or v23, true);
        if v21(v26, v25) then
            local v27 = l_normalizeDiffOptions_0(v24);
            local v28 = v10(v26, v27.changeColor);
            return l_printDiffLines_0(v28, v27);
        end;
    end;
    return l_diffLinesUnified_0(v22:split("\n"), v23:split("\n"), v24);
end;
v13 = function(v30, v31, v32) --[[ Line: 76 ]] --[[ Name: diffStringsRaw ]]
    -- upvalues: v9 (copy), l_cleanupSemantic_0 (copy)
    local v33 = v9(v30, v31);
    if v32 then
        l_cleanupSemantic_0(v33);
    end;
    return v33;
end;
return {
    diffStringsUnified = v29, 
    diffStringsRaw = v13
};