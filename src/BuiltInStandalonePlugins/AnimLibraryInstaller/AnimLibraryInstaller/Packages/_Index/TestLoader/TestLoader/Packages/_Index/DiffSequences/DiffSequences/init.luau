local l_Parent_0 = script.Parent;
local l_Number_0 = require(l_Parent_0.LuauPolyfill).Number;
local function v8(v2, v3, v4, v5, v6) --[[ Line: 118 ]] --[[ Name: countCommonItemsF ]]
    local v7 = 0;
    while v2 < v3 and v4 < v5 and v6(v2, v4) do
        v2 = v2 + 1;
        v4 = v4 + 1;
        v7 = v7 + 1;
    end;
    return v7;
end;
local function v15(v9, v10, v11, v12, v13) --[[ Line: 130 ]] --[[ Name: countCommonItemsR ]]
    local v14 = 0;
    while v9 <= v10 and v11 <= v12 and v13(v10, v12) do
        v10 = v10 - 1;
        v12 = v12 - 1;
        v14 = v14 + 1;
    end;
    return v14;
end;
local function v28(v16, v17, v18, v19, v20, v21, v22) --[[ Line: 148 ]] --[[ Name: extendPathsF ]]
    -- upvalues: v8 (copy)
    local v23 = 0;
    local v24 = -v16;
    local v25 = v21[v23 + 1];
    local l_v25_0 = v25;
    local v27 = v23 + 1;
    v21[v27] = v21[v27] + v8(v25 + 1, v17, v19 + v25 - v24 + 1, v18, v20);
    v27 = v16 < v22 and v16 or v22;
    v23 = v23 + 1;
    v24 = v24 + 2;
    while true do
        if v23 <= v27 then
            if v23 ~= v16 and l_v25_0 < v21[v23 + 1] then
                v25 = v21[v23 + 1];
            else
                v25 = l_v25_0 + 1;
                if v17 <= v25 then
                    return v23 - 1;
                end;
            end;
            l_v25_0 = v21[v23 + 1];
            v21[v23 + 1] = v25 + v8(v25 + 1, v17, v19 + v25 - v24 + 1, v18, v20);
            v23 = v23 + 1;
            v24 = v24 + 2;
        else
            return v22;
        end;
    end;
end;
local function v41(v29, v30, v31, v32, v33, v34, v35) --[[ Line: 201 ]] --[[ Name: extendPathsR ]]
    -- upvalues: v15 (copy)
    local v36 = 0;
    local l_v29_0 = v29;
    local v38 = v34[v36 + 1];
    local l_v38_0 = v38;
    local v40 = v36 + 1;
    v34[v40] = v34[v40] - v15(v30, v38 - 1, v31, v32 + v38 - l_v29_0 - 1, v33);
    v40 = v29 < v35 and v29 or v35;
    v36 = v36 + 1;
    l_v29_0 = l_v29_0 - 2;
    while true do
        if v36 <= v40 then
            if v36 ~= v29 and v34[v36 + 1] < l_v38_0 then
                v38 = v34[v36 + 1];
            else
                v38 = l_v38_0 - 1;
                if v38 < v30 then
                    return v36 - 1;
                end;
            end;
            l_v38_0 = v34[v36 + 1];
            v34[v36 + 1] = v38 - v15(v30, v38 - 1, v31, v32 + v38 - l_v29_0 - 1, v33);
            v36 = v36 + 1;
            l_v29_0 = l_v29_0 - 2;
        else
            return v35;
        end;
    end;
end;
local function v77(v42, v43, v44, v45, v46, v47, v48, v49, v50, v51, v52) --[[ Line: 251 ]] --[[ Name: extendOverlappablePathsF ]]
    -- upvalues: v8 (copy), v15 (copy)
    local v53 = v45 - v43;
    local v54 = v44 - v43;
    local v55 = v46 - v45 - v54;
    local v56 = -v55 - (v42 - 1);
    local v57 = -v55 + (v42 - 1);
    local v58 = 0;
    local v59 = v42 < v49 and v42 or v49;
    local v60 = 0;
    local v61 = -v42;
    while true do
        if v60 <= v59 then
            local v62 = true;
            if v60 ~= 0 then
                v62 = false;
                if v60 ~= v42 then
                    v62 = v58 < v48[v60 + 1];
                end;
            end;
            local v63 = v62 and v48[v60 + 1] or v58;
            local v64 = v62 and v63 or v63 + 1;
            local v65 = v53 + v64 - v61;
            local v66 = v8(v64 + 1, v44, v65 + 1, v46, v47);
            local v67 = v64 + v66;
            v58 = v48[v60 + 1];
            v48[v60 + 1] = v67;
            if v56 <= v61 and v61 <= v57 then
                local v68 = (v42 - 1 - (v61 + v55)) / 2;
                if v68 <= v51 and v50[v68 + 1] - 1 <= v67 then
                    local v69 = v53 + v63 - (v62 and v61 + 1 or v61 - 1);
                    local v70 = v15(v43, v63, v45, v69, v47);
                    local v71 = v63 - v70;
                    local v72 = v69 - v70;
                    local v73 = v71 + 1;
                    local v74 = v72 + 1;
                    v52.nChangePreceding = v42 - 1;
                    if v42 - 1 == v73 + v74 - v43 - v45 then
                        v52.aEndPreceding = v43;
                        v52.bEndPreceding = v45;
                    else
                        v52.aEndPreceding = v73;
                        v52.bEndPreceding = v74;
                    end;
                    v52.nCommonPreceding = v70;
                    if v70 ~= 0 then
                        v52.aCommonPreceding = v73;
                        v52.bCommonPreceding = v74;
                    end;
                    v52.nCommonFollowing = v66;
                    if v66 ~= 0 then
                        v52.aCommonFollowing = v64 + 1;
                        v52.bCommonFollowing = v65 + 1;
                    end;
                    local v75 = v67 + 1;
                    local v76 = v65 + v66 + 1;
                    v52.nChangeFollowing = v42 - 1;
                    if v42 - 1 == v44 + v46 - v75 - v76 then
                        v52.aStartFollowing = v44;
                        v52.bStartFollowing = v46;
                    else
                        v52.aStartFollowing = v75;
                        v52.bStartFollowing = v76;
                    end;
                    return true;
                end;
            end;
            v60 = v60 + 1;
            v61 = v61 + 2;
        else
            return false;
        end;
    end;
end;
local function v110(v78, v79, v80, v81, v82, v83, v84, v85, v86, v87, v88) --[[ Line: 377 ]] --[[ Name: extendOverlappablePathsR ]]
    -- upvalues: v15 (copy), v8 (copy)
    local v89 = v82 - v80;
    local v90 = v80 - v79;
    local v91 = v82 - v81 - v90;
    local v92 = v91 - v78;
    local v93 = v91 + v78;
    local v94 = 0;
    local v95 = v78 < v87 and v78 or v87;
    local v96 = 0;
    local l_v78_0 = v78;
    while true do
        if v96 <= v95 then
            local v98 = true;
            if v96 ~= 0 then
                v98 = false;
                if v96 ~= v78 then
                    v98 = v86[v96 + 1] < v94;
                end;
            end;
            local v99 = v98 and v86[v96 + 1] or v94;
            local v100 = v98 and v99 or v99 - 1;
            local v101 = v89 + v100 - l_v78_0;
            local v102 = v15(v79, v100 - 1, v81, v101 - 1, v83);
            local v103 = v100 - v102;
            v94 = v86[v96 + 1];
            v86[v96 + 1] = v103;
            if v92 <= l_v78_0 and l_v78_0 <= v93 then
                local v104 = (v78 + (l_v78_0 - v91)) / 2;
                if v104 <= v85 and v103 - 1 <= v84[v104 + 1] then
                    local v105 = v101 - v102;
                    v88.nChangePreceding = v78;
                    if v78 == v103 + v105 - v79 - v81 then
                        v88.aEndPreceding = v79;
                        v88.bEndPreceding = v81;
                    else
                        v88.aEndPreceding = v103;
                        v88.bEndPreceding = v105;
                    end;
                    v88.nCommonPreceding = v102;
                    if v102 ~= 0 then
                        v88.aCommonPreceding = v103;
                        v88.bCommonPreceding = v105;
                    end;
                    v88.nChangeFollowing = v78 - 1;
                    if v78 == 1 then
                        v88.nCommonFollowing = 0;
                        v88.aStartFollowing = v80;
                        v88.bStartFollowing = v82;
                    else
                        local v106 = v89 + v99 - (v98 and l_v78_0 - 1 or l_v78_0 + 1);
                        local v107 = v8(v99, v80, v106, v82, v83);
                        v88.nCommonFollowing = v107;
                        if v107 ~= 0 then
                            v88.aCommonFollowing = v99;
                            v88.bCommonFollowing = v106;
                        end;
                        local v108 = v99 + v107;
                        local v109 = v106 + v107;
                        if v78 - 1 == v80 + v82 - v108 - v109 then
                            v88.aStartFollowing = v80;
                            v88.bStartFollowing = v82;
                        else
                            v88.aStartFollowing = v108;
                            v88.bStartFollowing = v109;
                        end;
                    end;
                    return true;
                end;
            end;
            v96 = v96 + 1;
            l_v78_0 = l_v78_0 - 2;
        else
            return false;
        end;
    end;
end;
local function v132(v111, v112, v113, v114, v115, v116, v117, v118, v119) --[[ Line: 510 ]] --[[ Name: divide ]]
    -- upvalues: v28 (copy), v41 (copy), v110 (copy), v77 (copy)
    local v120 = v114 - v112;
    local v121 = v115 - v113;
    local v122 = v113 - v112;
    local v123 = v115 - v114;
    local v124 = v123 - v122;
    local l_v122_0 = v122;
    local l_v122_1 = v122;
    v117[1] = v112 - 1;
    v118[1] = v113;
    if v124 % 2 == 0 then
        local v127 = (v111 ~= 0 and v111 or v124) / 2;
        for v128 = 1, (v122 + v123) / 2 do
            l_v122_0 = v28(v128, v113, v115, v120, v116, v117, l_v122_0);
            if v128 < v127 then
                l_v122_1 = v41(v128, v112, v114, v121, v116, v118, l_v122_1);
            elseif v110(v128, v112, v113, v114, v115, v116, v117, l_v122_0, v118, l_v122_1, v119) then
                return;
            end;
        end;
    else
        local v129 = ((v111 ~= 0 and v111 or v124) + 1) / 2;
        local v130 = (v122 + v123 + 1) / 2;
        local v131 = 1;
        l_v122_0 = v28(v131, v113, v115, v120, v116, v117, l_v122_0);
        v131 = v131 + 1;
        while v131 <= v130 do
            l_v122_1 = v41(v131 - 1, v112, v114, v121, v116, v118, l_v122_1);
            if v131 < v129 then
                l_v122_0 = v28(v131, v113, v115, v120, v116, v117, l_v122_0);
            elseif v77(v131, v112, v113, v114, v115, v116, v117, l_v122_0, v118, l_v122_1, v119) then
                return;
            end;
            v131 = v131 + 1;
        end;
    end;
    error(string.format("%s: no overlap aStart=%i aEnd=%i bStart=%i bEnd=%i", "diff-sequences", v112, v113, v114, v115));
end;
local function v133(v134, v135, v136, v137, v138, v139, v140, v141, v142, v143) --[[ Line: 625 ]] --[[ Name: findSubsequences ]]
    -- upvalues: v132 (copy), v133 (copy)
    if v138 - v137 < v136 - v135 then
        v139 = not v139;
        if v139 and #v140 == 1 then
            local v144, v145 = unpack(v140[1]);
            local l_v144_0 = v144 --[[ copy: 10 -> 24 ]];
            local l_v145_0 = v145 --[[ copy: 11 -> 25 ]];
            v140[2] = {
                function(v148, v149, v150) --[[ Line: 645 ]]
                    -- upvalues: l_v144_0 (copy)
                    return l_v144_0(v148, v150, v149);
                end, 
                function(v151, v152) --[[ Line: 648 ]]
                    -- upvalues: l_v145_0 (copy)
                    return l_v145_0(v152, v151);
                end
            };
        end;
        local l_v135_0 = v135;
        local l_v136_0 = v136;
        v135 = v137;
        v136 = v138;
        v137 = l_v135_0;
        v138 = l_v136_0;
    end;
    local v155, v156 = unpack(v140[v139 and 2 or 1]);
    v132(v134, v135, v136, v137, v138, v156, v141, v142, v143);
    local l_nChangePreceding_0 = v143.nChangePreceding;
    local l_aEndPreceding_0 = v143.aEndPreceding;
    local l_bEndPreceding_0 = v143.bEndPreceding;
    local l_nCommonPreceding_0 = v143.nCommonPreceding;
    local l_aCommonPreceding_0 = v143.aCommonPreceding;
    local l_bCommonPreceding_0 = v143.bCommonPreceding;
    local l_nCommonFollowing_0 = v143.nCommonFollowing;
    local l_aCommonFollowing_0 = v143.aCommonFollowing;
    local l_bCommonFollowing_0 = v143.bCommonFollowing;
    local l_nChangeFollowing_0 = v143.nChangeFollowing;
    local l_aStartFollowing_0 = v143.aStartFollowing;
    local l_bStartFollowing_0 = v143.bStartFollowing;
    if v135 < l_aEndPreceding_0 and v137 < l_bEndPreceding_0 then
        v133(l_nChangePreceding_0, v135, l_aEndPreceding_0, v137, l_bEndPreceding_0, v139, v140, v141, v142, v143);
    end;
    if l_nCommonPreceding_0 ~= 0 then
        v155(l_nCommonPreceding_0, l_aCommonPreceding_0, l_bCommonPreceding_0);
    end;
    if l_nCommonFollowing_0 ~= 0 then
        v155(l_nCommonFollowing_0, l_aCommonFollowing_0, l_bCommonFollowing_0);
    end;
    if l_aStartFollowing_0 < v136 and l_bStartFollowing_0 < v138 then
        v133(l_nChangeFollowing_0, l_aStartFollowing_0, v136, l_bStartFollowing_0, v138, v139, v140, v141, v142, v143);
    end;
end;
local function v171(v169, v170) --[[ Line: 721 ]] --[[ Name: validateLength ]]
    -- upvalues: l_Number_0 (copy)
    if typeof(v170) ~= "number" then
        error(string.format("%s: %s type %s is not a number", "diff-sequences", v169, (type(v170))));
    end;
    if not l_Number_0.isSafeInteger(v170) then
        error(string.format("%s: %s type %s is not a safe integer", "diff-sequences", v169, (type(v170))));
    end;
    if v170 < 0 then
        error(string.format("%s: %s type %s is a negative integer", "diff-sequences", v169, (type(v170))));
    end;
end;
local function _(v172, v173) --[[ Line: 733 ]] --[[ Name: validateCallback ]]
    if typeof(v173) ~= "function" then
        error(string.format("%s: %s type %s is not a function", "diff-sequences", v172, (type(v173))));
    end;
end;
return function(v175, v176, v177, v178) --[[ Line: 743 ]]
    -- upvalues: v171 (copy), v8 (copy), v15 (copy), v133 (copy)
    v171("aLength", v175);
    v171("bLength", v176);
    if typeof(v177) ~= "function" then
        error(string.format("%s: %s type %s is not a function", "diff-sequences", "isCommon", (type(v177))));
    end;
    if typeof(v178) ~= "function" then
        error(string.format("%s: %s type %s is not a function", "diff-sequences", "foundSubsequence", (type(v178))));
    end;
    local v179 = v8(0, v175, 0, v176, v177);
    if v179 ~= 0 then
        v178(v179, 0, 0);
    end;
    if v175 ~= v179 or v176 ~= v179 then
        local v180 = v15(v179, v175 - 1, v179, v176 - 1, v177);
        local v181 = v175 - v180;
        local v182 = v176 - v180;
        local v183 = v179 + v180;
        if v175 ~= v183 and v176 ~= v183 then
            local v184 = {
                {
                    v178, 
                    v177
                }
            };
            local v185 = {
                0
            };
            local v186 = {
                0
            };
            local v187 = {
                aCommonFollowing = 0, 
                aCommonPreceding = 0, 
                aEndPreceding = 0, 
                aStartFollowing = 0, 
                bCommonFollowing = 0, 
                bCommonPreceding = 0, 
                bEndPreceding = 0, 
                bStartFollowing = 0, 
                nChangeFollowing = 0, 
                nChangePreceding = 0, 
                nCommonFollowing = 0, 
                nCommonPreceding = 0
            };
            v133(0, v179, v181, v179, v182, false, v184, v185, v186, v187);
        end;
        if v180 ~= 0 then
            v178(v180, v181, v182);
        end;
    end;
end;