local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.DiffSequences);
local v3 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_DELETE_0 = v3.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v3.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v3.DIFF_INSERT;
local l_Diff_0 = v3.Diff;
local l_joinAlignedDiffsExpand_0 = require(l_Parent_0.JoinAlignedDiffs).joinAlignedDiffsExpand;
local l_joinAlignedDiffsNoExpand_0 = require(l_Parent_0.JoinAlignedDiffs).joinAlignedDiffsNoExpand;
local l_normalizeDiffOptions_0 = require(l_Parent_0.NormalizeDiffOptions).normalizeDiffOptions;
local _ = require(l_Parent_0.types);
local v12 = nil;
local function _(v13) --[[ Line: 33 ]] --[[ Name: isEmptyString ]]
    local v14 = false;
    if #v13 == 1 then
        v14 = #v13[1] == 0;
    end;
    return v14;
end;
local function v22(v16) --[[ Line: 39 ]] --[[ Name: countChanges ]]
    -- upvalues: l_DIFF_DELETE_0 (copy), l_DIFF_INSERT_0 (copy)
    local v17 = 0;
    local v18 = 0;
    for _, v20 in ipairs(v16) do
        local v21 = v20[1];
        if v21 == l_DIFF_DELETE_0 then
            v17 = v17 + 1;
        elseif v21 == l_DIFF_INSERT_0 then
            v18 = v18 + 1;
        end;
    end;
    return {
        a = v17, 
        b = v18
    };
end;
local function v42(v23, v24) --[[ Line: 55 ]] --[[ Name: printAnnotation ]]
    local l_aAnnotation_0 = v23.aAnnotation;
    local l_aColor_0 = v23.aColor;
    local l_aIndicator_0 = v23.aIndicator;
    local l_bAnnotation_0 = v23.bAnnotation;
    local l_bColor_0 = v23.bColor;
    local l_bIndicator_0 = v23.bIndicator;
    local l_includeChangeCounts_0 = v23.includeChangeCounts;
    if v23.omitAnnotationLines then
        return "";
    else
        local v32 = "";
        local v33 = "";
        if l_includeChangeCounts_0 then
            local v34 = tostring(v24.a);
            local v35 = tostring(v24.b);
            local v36 = #l_bAnnotation_0 - #l_aAnnotation_0;
            local v37 = string.rep(" ", (math.max(0, v36)));
            local v38 = string.rep(" ", (math.max(0, -v36)));
            local v39 = #v35 - #v34;
            local v40 = string.rep(" ", (math.max(0, v39)));
            local v41 = string.rep(" ", (math.max(0, -v39)));
            v32 = v37 .. "  " .. l_aIndicator_0 .. " " .. v40 .. v34;
            v33 = v38 .. "  " .. l_bIndicator_0 .. " " .. v41 .. v35;
        end;
        return l_aColor_0(l_aIndicator_0 .. " " .. l_aAnnotation_0 .. v32) .. "\n" .. l_bColor_0(l_bIndicator_0 .. " " .. l_bAnnotation_0 .. v33) .. "\n\n";
    end;
end;
local function v45(v43, v44) --[[ Line: 101 ]] --[[ Name: printDiffLines ]]
    -- upvalues: v42 (copy), v22 (copy), l_joinAlignedDiffsExpand_0 (copy), l_joinAlignedDiffsNoExpand_0 (copy)
    if v44.expand then
        return v42(v44, (v22(v43))) .. l_joinAlignedDiffsExpand_0(v43, v44);
    else
        return v42(v44, (v22(v43))) .. l_joinAlignedDiffsNoExpand_0(v43, v44);
    end;
end;
local function v51(v46, v47, v48) --[[ Line: 112 ]] --[[ Name: diffLinesUnified ]]
    -- upvalues: v45 (copy), v12 (ref), l_normalizeDiffOptions_0 (copy)
    local l_v46_0 = v46;
    local v50 = false;
    if #l_v46_0 == 1 then
        v50 = #l_v46_0[1] == 0;
    end;
    if v50 then
        v46 = {};
    end;
    l_v46_0 = v47;
    v50 = false;
    if #l_v46_0 == 1 then
        v50 = #l_v46_0[1] == 0;
    end;
    if v50 then
        v47 = {};
    end;
    return (v45(v12(v46, v47), l_normalizeDiffOptions_0(v48)));
end;
local function v63(v52, v53, v54, v55, v56) --[[ Line: 136 ]] --[[ Name: diffLinesUnified2 ]]
    -- upvalues: v51 (copy), v12 (ref), l_DIFF_DELETE_0 (copy), l_DIFF_INSERT_0 (copy), v45 (copy), l_normalizeDiffOptions_0 (copy)
    local l_v52_0 = v52;
    local v58 = false;
    if #l_v52_0 == 1 then
        v58 = #l_v52_0[1] == 0;
    end;
    if v58 then
        l_v52_0 = v54;
        v58 = false;
        if #l_v52_0 == 1 then
            v58 = #l_v52_0[1] == 0;
        end;
        if v58 then
            v52 = {};
            v54 = {};
        end;
    end;
    l_v52_0 = v53;
    v58 = false;
    if #l_v52_0 == 1 then
        v58 = #l_v52_0[1] == 0;
    end;
    if v58 then
        l_v52_0 = v55;
        v58 = false;
        if #l_v52_0 == 1 then
            v58 = #l_v52_0[1] == 0;
        end;
        if v58 then
            v53 = {};
            v55 = {};
        end;
    end;
    if #v52 ~= #v54 or #v53 ~= #v55 then
        return (v51(v52, v53, v56));
    else
        v58 = v12(v54, v55);
        l_v52_0 = 0;
        local v59 = 0;
        for _, v61 in ipairs(v58) do
            local v62 = v61[1];
            if v62 == l_DIFF_DELETE_0 then
                v61[2] = v52[l_v52_0 + 1];
                l_v52_0 = l_v52_0 + 1;
            elseif v62 == l_DIFF_INSERT_0 then
                v61[2] = v53[v59 + 1];
                v59 = v59 + 1;
            else
                v61[2] = v53[v59 + 1];
                l_v52_0 = l_v52_0 + 1;
                v59 = v59 + 1;
            end;
        end;
        return (v45(v58, l_normalizeDiffOptions_0(v56)));
    end;
end;
v12 = function(v64, v65) --[[ Line: 184 ]] --[[ Name: diffLinesRaw ]]
    -- upvalues: l_Diff_0 (copy), l_DIFF_DELETE_0 (copy), l_DIFF_INSERT_0 (copy), l_DIFF_EQUAL_0 (copy), v2 (copy)
    local v66 = #v64;
    local v67 = #v65;
    local function v70(v68, v69) --[[ Line: 191 ]]
        -- upvalues: v64 (copy), v65 (copy)
        return v64[v68 + 1] == v65[v69 + 1];
    end;
    local v71 = {};
    local v72 = 0;
    local v73 = 0;
    v2(v66, v67, v70, function(v74, v75, v76) --[[ Line: 199 ]]
        -- upvalues: v72 (ref), v71 (copy), l_Diff_0 (ref), l_DIFF_DELETE_0 (ref), v64 (copy), v73 (ref), l_DIFF_INSERT_0 (ref), v65 (copy), l_DIFF_EQUAL_0 (ref)
        while v72 ~= v75 do
            table.insert(v71, l_Diff_0.new(l_DIFF_DELETE_0, v64[v72 + 1]));
            v72 = v72 + 1;
        end;
        while v73 ~= v76 do
            table.insert(v71, l_Diff_0.new(l_DIFF_INSERT_0, v65[v73 + 1]));
            v73 = v73 + 1;
        end;
        while v74 ~= 0 do
            table.insert(v71, l_Diff_0.new(l_DIFF_EQUAL_0, v65[v73 + 1]));
            v74 = v74 - 1;
            v72 = v72 + 1;
            v73 = v73 + 1;
        end;
    end);
    while v72 ~= v66 do
        table.insert(v71, l_Diff_0.new(l_DIFF_DELETE_0, v64[v72 + 1]));
        v72 = v72 + 1;
    end;
    while v73 ~= v67 do
        table.insert(v71, l_Diff_0.new(l_DIFF_INSERT_0, v65[v73 + 1]));
        v73 = v73 + 1;
    end;
    return v71;
end;
return {
    printDiffLines = v45, 
    diffLinesUnified = v51, 
    diffLinesUnified2 = v63, 
    diffLinesRaw = v12
};