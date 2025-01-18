local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Array_0 = require(l_Parent_1.LuauPolyfill).Array;
local v3 = require(l_Parent_0.CleanupSemantic);
local l_DIFF_DELETE_0 = v3.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v3.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v3.DIFF_INSERT;
local _ = require(l_Parent_0.types);
local function _(v8, v9) --[[ Line: 26 ]] --[[ Name: formatTrailingSpaces ]]
    return v8:gsub("%s+$", function(v10) --[[ Line: 27 ]]
        -- upvalues: v9 (copy)
        return v9(v10);
    end);
end;
local function v19(v12, v13, v14, v15, v16, v17) --[[ Line: 32 ]] --[[ Name: printDiffLine ]]
    if #v12 ~= 0 then
        return v14(v15 .. " " .. v12:gsub("%s+$", function(v18) --[[ Line: 27 ]]
            -- upvalues: v16 (copy)
            return v16(v18);
        end));
    elseif v15 ~= " " then
        return v14(v15);
    elseif v13 and #v17 ~= 0 then
        return v14(v15 .. " " .. v17);
    else
        return "";
    end;
end;
local function v23(v20, v21, v22) --[[ Line: 50 ]] --[[ Name: printDeleteLine ]]
    -- upvalues: v19 (copy)
    return v19(v20, v21, v22.aColor, v22.aIndicator, v22.changeLineTrailingSpaceColor, v22.emptyFirstOrLastLinePlaceholder);
end;
local function v27(v24, v25, v26) --[[ Line: 61 ]] --[[ Name: printInsertLine ]]
    -- upvalues: v19 (copy)
    return v19(v24, v25, v26.bColor, v26.bIndicator, v26.changeLineTrailingSpaceColor, v26.emptyFirstOrLastLinePlaceholder);
end;
local function v31(v28, v29, v30) --[[ Line: 72 ]] --[[ Name: printCommonLine ]]
    -- upvalues: v19 (copy)
    return v19(v28, v29, v30.commonColor, v30.commonIndicator, v30.commonLineTrailingSpaceColor, v30.emptyFirstOrLastLinePlaceholder);
end;
local function _(v32, v33, v34, v35, v36) --[[ Line: 84 ]] --[[ Name: createPatchMark ]]
    return v36.patchColor(string.format("@@ -%d,%d +%d,%d @@", v32 + 1, v33 - v32, v34 + 1, v35 - v34));
end;
return {
    joinAlignedDiffsNoExpand = function(v38, v39) --[[ Line: 100 ]] --[[ Name: joinAlignedDiffsNoExpand ]]
        -- upvalues: l_DIFF_EQUAL_0 (copy), v31 (copy), v23 (copy), v27 (copy), l_DIFF_DELETE_0 (copy), l_DIFF_INSERT_0 (copy)
        local v40 = #v38;
        local l_contextLines_0 = v39.contextLines;
        local v42 = l_contextLines_0 + l_contextLines_0;
        local l_v40_0 = v40;
        local v44 = false;
        local v45 = 0;
        local v46 = 0;
        while v46 ~= v40 do
            local l_v46_0 = v46;
            while v46 ~= v40 and v38[v46 + 1][1] == l_DIFF_EQUAL_0 do
                v46 = v46 + 1;
            end;
            if l_v46_0 ~= v46 then
                if l_v46_0 == 0 then
                    if l_contextLines_0 < v46 then
                        l_v40_0 = l_v40_0 - (v46 - l_contextLines_0);
                        v44 = true;
                    end;
                elseif v46 == v40 then
                    local v48 = v46 - l_v46_0;
                    if l_contextLines_0 < v48 then
                        l_v40_0 = l_v40_0 - (v48 - l_contextLines_0);
                        v44 = true;
                    end;
                else
                    local v49 = v46 - l_v46_0;
                    if v42 < v49 then
                        l_v40_0 = l_v40_0 - (v49 - v42);
                        v45 = v45 + 1;
                    end;
                end;
            end;
            while v46 ~= v40 and v38[v46 + 1][1] ~= l_DIFF_EQUAL_0 do
                v46 = v46 + 1;
            end;
        end;
        local v50 = true;
        if v45 == 0 then
            v50 = v44;
        end;
        if v45 ~= 0 then
            l_v40_0 = l_v40_0 + (v45 + 1);
        elseif v44 then
            l_v40_0 = l_v40_0 + 1;
        end;
        local v51 = l_v40_0 - 1;
        local v52 = {};
        local v53 = 0;
        if v50 then
            table.insert(v52, "");
        end;
        local v54 = 0;
        local v55 = 0;
        local v56 = 0;
        local v57 = 0;
        local function _(v58) --[[ Line: 166 ]]
            -- upvalues: v52 (copy), v31 (ref), v51 (copy), v39 (copy), v56 (ref), v57 (ref)
            local v59 = #v52;
            local l_v52_0 = v52;
            local l_v31_0 = v31;
            local l_v58_0 = v58;
            local v63 = true;
            if v59 ~= 0 then
                v63 = v59 == v51;
            end;
            table.insert(l_v52_0, l_v31_0(l_v58_0, v63, v39));
            v56 = v56 + 1;
            v57 = v57 + 1;
        end;
        local function _(v65) --[[ Line: 173 ]]
            -- upvalues: v52 (copy), v23 (ref), v51 (copy), v39 (copy), v56 (ref)
            local v66 = #v52;
            local l_v52_1 = v52;
            local l_v23_0 = v23;
            local l_v65_0 = v65;
            local v70 = true;
            if v66 ~= 0 then
                v70 = v66 == v51;
            end;
            table.insert(l_v52_1, l_v23_0(l_v65_0, v70, v39));
            v56 = v56 + 1;
        end;
        local function _(v72) --[[ Line: 179 ]]
            -- upvalues: v52 (copy), v27 (ref), v51 (copy), v39 (copy), v57 (ref)
            local v73 = #v52;
            local l_v52_2 = v52;
            local l_v27_0 = v27;
            local l_v72_0 = v72;
            local v77 = true;
            if v73 ~= 0 then
                v77 = v73 == v51;
            end;
            table.insert(l_v52_2, l_v27_0(l_v72_0, v77, v39));
            v57 = v57 + 1;
        end;
        v46 = 0;
        while v46 ~= v40 do
            local l_v46_1 = v46;
            while v46 ~= v40 and v38[v46 + 1][1] == l_DIFF_EQUAL_0 do
                v46 = v46 + 1;
            end;
            if l_v46_1 ~= v46 then
                if l_v46_1 == 0 then
                    if l_contextLines_0 < v46 then
                        l_v46_1 = v46 - l_contextLines_0;
                        v54 = l_v46_1;
                        v55 = l_v46_1;
                        v56 = v54;
                        v57 = v55;
                    end;
                    local l_l_v46_1_0 = l_v46_1;
                    while l_l_v46_1_0 ~= v46 do
                        local v81 = v38[l_l_v46_1_0 + 1][2];
                        local v82 = #v52;
                        local l_v52_3 = v52;
                        local l_v31_1 = v31;
                        local l_v81_0 = v81;
                        local v86 = true;
                        if v82 ~= 0 then
                            v86 = v82 == v51;
                        end;
                        table.insert(l_v52_3, l_v31_1(l_v81_0, v86, v39));
                        v56 = v56 + 1;
                        v57 = v57 + 1;
                        l_l_v46_1_0 = l_l_v46_1_0 + 1;
                    end;
                elseif v46 == v40 then
                    local l_v46_2 = v46;
                    if l_contextLines_0 < v46 - l_v46_1 then
                        l_v46_2 = l_v46_1 + l_contextLines_0;
                    end;
                    local l_l_v46_1_1 = l_v46_1;
                    while l_l_v46_1_1 ~= l_v46_2 do
                        local v89 = v38[l_l_v46_1_1 + 1][2];
                        local v90 = #v52;
                        local l_v52_4 = v52;
                        local l_v31_2 = v31;
                        local l_v89_0 = v89;
                        local v94 = true;
                        if v90 ~= 0 then
                            v94 = v90 == v51;
                        end;
                        table.insert(l_v52_4, l_v31_2(l_v89_0, v94, v39));
                        v56 = v56 + 1;
                        v57 = v57 + 1;
                        l_l_v46_1_1 = l_l_v46_1_1 + 1;
                    end;
                else
                    local v95 = v46 - l_v46_1;
                    if v42 < v95 then
                        local v96 = l_v46_1 + l_contextLines_0;
                        local l_l_v46_1_2 = l_v46_1;
                        while l_l_v46_1_2 ~= v96 do
                            local v98 = v38[l_l_v46_1_2 + 1][2];
                            local v99 = #v52;
                            local l_v52_5 = v52;
                            local l_v31_3 = v31;
                            local l_v98_0 = v98;
                            local v103 = true;
                            if v99 ~= 0 then
                                v103 = v99 == v51;
                            end;
                            table.insert(l_v52_5, l_v31_3(l_v98_0, v103, v39));
                            v56 = v56 + 1;
                            v57 = v57 + 1;
                            l_l_v46_1_2 = l_l_v46_1_2 + 1;
                        end;
                        local v104 = v53 + 1;
                        local l_v54_0 = v54;
                        local l_v56_0 = v56;
                        local l_v55_0 = v55;
                        local l_v57_0 = v57;
                        v52[v104] = v39.patchColor(string.format("@@ -%d,%d +%d,%d @@", l_v54_0 + 1, l_v56_0 - l_v54_0, l_v55_0 + 1, l_v57_0 - l_v55_0));
                        v53 = #v52;
                        table.insert(v52, "");
                        v104 = v95 - v42;
                        v54 = v56 + v104;
                        v55 = v57 + v104;
                        v56 = v54;
                        v57 = v55;
                        l_l_v46_1_2 = v46 - l_contextLines_0;
                        while l_l_v46_1_2 ~= v46 do
                            local v109 = v38[l_l_v46_1_2 + 1][2];
                            l_v54_0 = #v52;
                            l_v55_0 = v52;
                            l_v57_0 = v31;
                            local l_v109_0 = v109;
                            local v111 = true;
                            if l_v54_0 ~= 0 then
                                v111 = l_v54_0 == v51;
                            end;
                            table.insert(l_v55_0, l_v57_0(l_v109_0, v111, v39));
                            v56 = v56 + 1;
                            v57 = v57 + 1;
                            l_l_v46_1_2 = l_l_v46_1_2 + 1;
                        end;
                    else
                        local l_l_v46_1_3 = l_v46_1;
                        while l_l_v46_1_3 ~= v46 do
                            local v113 = v38[l_l_v46_1_3 + 1][2];
                            local v114 = #v52;
                            local l_v52_6 = v52;
                            local l_v31_4 = v31;
                            local l_v113_0 = v113;
                            local v118 = true;
                            if v114 ~= 0 then
                                v118 = v114 == v51;
                            end;
                            table.insert(l_v52_6, l_v31_4(l_v113_0, v118, v39));
                            v56 = v56 + 1;
                            v57 = v57 + 1;
                            l_l_v46_1_3 = l_l_v46_1_3 + 1;
                        end;
                    end;
                end;
            end;
            while v46 ~= v40 and v38[v46 + 1][1] == l_DIFF_DELETE_0 do
                local v119 = v38[v46 + 1][2];
                local v120 = #v52;
                local l_v52_7 = v52;
                local l_v23_1 = v23;
                local l_v119_0 = v119;
                local v124 = true;
                if v120 ~= 0 then
                    v124 = v120 == v51;
                end;
                table.insert(l_v52_7, l_v23_1(l_v119_0, v124, v39));
                v56 = v56 + 1;
                v46 = v46 + 1;
            end;
            while v46 ~= v40 and v38[v46 + 1][1] == l_DIFF_INSERT_0 do
                local v125 = v38[v46 + 1][2];
                local v126 = #v52;
                local l_v52_8 = v52;
                local l_v27_1 = v27;
                local l_v125_0 = v125;
                local v130 = true;
                if v126 ~= 0 then
                    v130 = v126 == v51;
                end;
                table.insert(l_v52_8, l_v27_1(l_v125_0, v130, v39));
                v57 = v57 + 1;
                v46 = v46 + 1;
            end;
        end;
        if v50 then
            local v131 = v53 + 1;
            local l_v54_1 = v54;
            local l_v56_1 = v56;
            local l_v55_1 = v55;
            local l_v57_1 = v57;
            v52[v131] = v39.patchColor(string.format("@@ -%d,%d +%d,%d @@", l_v54_1 + 1, l_v56_1 - l_v54_1, l_v55_1 + 1, l_v57_1 - l_v55_1));
        end;
        return table.concat(v52, "\n");
    end, 
    joinAlignedDiffsExpand = function(v136, v137) --[[ Line: 281 ]] --[[ Name: joinAlignedDiffsExpand ]]
        -- upvalues: l_Array_0 (copy), l_DIFF_DELETE_0 (copy), v23 (copy), l_DIFF_INSERT_0 (copy), v27 (copy), v31 (copy)
        return table.concat(l_Array_0.map(v136, function(v138, v139, v140) --[[ Line: 283 ]]
            -- upvalues: l_DIFF_DELETE_0 (ref), v23 (ref), v137 (copy), l_DIFF_INSERT_0 (ref), v27 (ref), v31 (ref)
            local v141 = v138[2];
            local v142 = true;
            if v139 ~= 1 then
                v142 = v139 == #v140;
            end;
            local v143 = v138[1];
            if v143 == l_DIFF_DELETE_0 then
                return v23(v141, v142, v137);
            elseif v143 == l_DIFF_INSERT_0 then
                return v27(v141, v142, v137);
            else
                return v31(v141, v142, v137);
            end;
        end), "\n");
    end
};