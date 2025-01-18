local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = nil;
local v3 = nil;
local l_sub_0 = string.sub;
local l_byte_0 = string.byte;
local l_match_0 = string.match;
local l_find_0 = string.find;
local l_max_0 = math.max;
local l_min_0 = math.min;
local l_floor_0 = math.floor;
local l_insert_0 = table.insert;
local l_remove_0 = table.remove;
local v13 = {};
v13.__index = v13;
v13.new = function(v14, v15) --[[ Line: 70 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy)
    return (setmetatable({
        v14, 
        v15
    }, v13));
end;
local function v22(v16, v17) --[[ Line: 81 ]] --[[ Name: _diff_commonPrefix ]]
    -- upvalues: l_byte_0 (copy), l_min_0 (copy), l_sub_0 (copy), l_floor_0 (copy)
    if #v16 == 0 or #v17 == 0 or l_byte_0(v16, 1, 1) ~= l_byte_0(v17, 1, 1) then
        return 0;
    else
        local v18 = 1;
        local v19 = l_min_0(#v16, #v17);
        local l_v19_0 = v19;
        local v21 = 1;
        while v18 < l_v19_0 do
            if l_sub_0(v16, v21, l_v19_0) == l_sub_0(v17, v21, l_v19_0) then
                v18 = l_v19_0;
                v21 = v18;
            else
                v19 = l_v19_0;
            end;
            l_v19_0 = l_floor_0(v18 + (v19 - v18) / 2);
        end;
        return l_v19_0;
    end;
end;
local function v29(v23, v24) --[[ Line: 110 ]] --[[ Name: _diff_commonSuffix ]]
    -- upvalues: l_byte_0 (copy), l_min_0 (copy), l_sub_0 (copy), l_floor_0 (copy)
    if #v23 == 0 or #v24 == 0 or l_byte_0(v23, -1) ~= l_byte_0(v24, -1) then
        return 0;
    else
        local v25 = 1;
        local v26 = l_min_0(#v23, #v24);
        local l_v26_0 = v26;
        local v28 = 1;
        while v25 < l_v26_0 do
            if l_sub_0(v23, -l_v26_0, -v28) == l_sub_0(v24, -l_v26_0, -v28) then
                v25 = l_v26_0;
                v28 = v25;
            else
                v26 = l_v26_0;
            end;
            l_v26_0 = l_floor_0(v25 + (v26 - v25) / 2);
        end;
        return l_v26_0;
    end;
end;
local function v39(v30, v31) --[[ Line: 141 ]] --[[ Name: _diff_commonOverlap ]]
    -- upvalues: l_sub_0 (copy), l_min_0 (copy), l_find_0 (copy)
    local v32 = #v30;
    local v33 = #v31;
    if v32 == 0 or v33 == 0 then
        return 0;
    else
        if v33 < v32 then
            v30 = l_sub_0(v30, v32 - v33 + 1);
        elseif v32 < v33 then
            v31 = l_sub_0(v31, 1, v32);
        end;
        local v34 = l_min_0(v32, v33);
        if v30 == v31 then
            return v34;
        else
            local v35 = 0;
            local v36 = 1;
            while true do
                local v37 = l_sub_0(v30, v34 - v36 + 1);
                local v38 = l_find_0(v31, v37, 1, true);
                if v38 ~= nil then
                    v36 = v36 + (v38 - 1);
                    if v38 == 1 or l_sub_0(v30, v34 - v36 + 1) == l_sub_0(v31, 1, v36) then
                        v35 = v36;
                        v36 = v36 + 1;
                    end;
                else
                    break;
                end;
            end;
            return v35;
        end;
    end;
end;
local function v54(v40) --[[ Line: 186 ]] --[[ Name: diff_cleanupSemantic ]]
    -- upvalues: l_max_0 (copy), v13 (copy), l_insert_0 (copy), v3 (ref), v2 (ref), v39 (copy), l_sub_0 (copy)
    local v41 = false;
    local v42 = {};
    local v43 = 0;
    local v44 = nil;
    local v45 = 1;
    local v46 = 0;
    local v47 = 0;
    local v48 = 0;
    local v49 = 0;
    while v40[v45] do
        if v40[v45][1] == 0 then
            v43 = v43 + 1;
            v42[v43] = v45;
            v46 = v48;
            v47 = v49;
            v48 = 0;
            v49 = 0;
            v44 = v40[v45][2];
        else
            if v40[v45][1] == 1 then
                v48 = v48 + #v40[v45][2];
            else
                v49 = v49 + #v40[v45][2];
            end;
            if v44 and #v44 <= l_max_0(v46, v47) and #v44 <= l_max_0(v48, v49) then
                l_insert_0(v40, v42[v43], v13.new(-1, v44));
                v40[v42[v43] + 1][1] = 1;
                v43 = v43 - 1 - 1;
                v45 = v43 > 0 and v42[v43] or 0;
                v46 = 0;
                v47 = 0;
                v48 = 0;
                v49 = 0;
                v44 = nil;
                v41 = true;
            end;
        end;
        v45 = v45 + 1;
    end;
    if v41 then
        v3(v40);
    end;
    v2(v40);
    v45 = 2;
    while v40[v45] do
        if v40[v45 - 1][1] == -1 and v40[v45][1] == 1 then
            local v50 = v40[v45 - 1][2];
            local v51 = v40[v45][2];
            local v52 = v39(v50, v51);
            local v53 = v39(v51, v50);
            if v53 <= v52 then
                if #v50 / 2 <= v52 or #v51 / 2 <= v52 then
                    l_insert_0(v40, v45, v13.new(0, (l_sub_0(v51, 1, v52))));
                    v40[v45 - 1][2] = l_sub_0(v50, 1, #v50 - v52);
                    v40[v45 + 1][2] = l_sub_0(v51, v52 + 1);
                    v45 = v45 + 1;
                end;
            elseif #v50 / 2 <= v53 or #v51 / 2 <= v53 then
                l_insert_0(v40, v45, v13.new(0, (l_sub_0(v50, 1, v53))));
                v40[v45 - 1] = {
                    1, 
                    (l_sub_0(v51, 1, #v51 - v53))
                };
                v40[v45 + 1] = {
                    -1, 
                    (l_sub_0(v50, v53 + 1))
                };
                v45 = v45 + 1;
            end;
            v45 = v45 + 1;
        end;
        v45 = v45 + 1;
    end;
end;
local function v67(v55, v56) --[[ Line: 292 ]] --[[ Name: _diff_cleanupSemanticScore ]]
    -- upvalues: l_sub_0 (copy), l_match_0 (copy)
    if #v55 == 0 or #v56 == 0 then
        return 6;
    else
        local v57 = l_sub_0(v55, -1);
        local v58 = l_sub_0(v56, 1, 1);
        local v59 = l_match_0(v57, "%W");
        local v60 = l_match_0(v58, "%W");
        local v61 = v59 and l_match_0(v57, "%s");
        local v62 = v60 and l_match_0(v58, "%s");
        local v63 = v61 and l_match_0(v57, "%c");
        local v64 = v62 and l_match_0(v58, "%c");
        local v65 = v63 and l_match_0(v55, "\n\r?\n$");
        local v66 = v64 and l_match_0(v56, "^\r?\n\r?\n");
        if v65 or v66 then
            return 5;
        elseif v63 or v64 then
            return 4;
        elseif v59 and not v61 and v62 then
            return 3;
        elseif v61 or v62 then
            return 2;
        elseif v59 or v60 then
            return 1;
        else
            return 0;
        end;
    end;
end;
v2 = function(v68) --[[ Line: 339 ]]
    -- upvalues: v29 (copy), l_sub_0 (copy), v67 (copy), l_byte_0 (copy), l_remove_0 (copy)
    local v69 = 2;
    while v68[v69 + 1] do
        local v70 = v68[v69 - 1];
        local v71 = v68[v69 + 1];
        if v70[1] == 0 and v71[1] == 0 then
            local v72 = v68[v69];
            local v73 = v70[2];
            local v74 = v72[2];
            local v75 = v71[2];
            local v76 = v29(v73, v74);
            if v76 > 0 then
                local v77 = l_sub_0(v74, -v76);
                v73 = l_sub_0(v73, 1, -v76 - 1);
                v74 = v77 .. l_sub_0(v74, 1, -v76 - 1);
                v75 = v77 .. v75;
            end;
            local l_v73_0 = v73;
            local l_v74_0 = v74;
            local l_v75_0 = v75;
            local v81 = v67(v73, v74) + v67(v74, v75);
            while l_byte_0(v74, 1) == l_byte_0(v75, 1) do
                v73 = v73 .. l_sub_0(v74, 1, 1);
                v74 = l_sub_0(v74, 2) .. l_sub_0(v75, 1, 1);
                v75 = l_sub_0(v75, 2);
                local v82 = v67(v73, v74) + v67(v74, v75);
                if v81 <= v82 then
                    v81 = v82;
                    l_v73_0 = v73;
                    l_v74_0 = v74;
                    l_v75_0 = v75;
                end;
            end;
            if v70[2] ~= l_v73_0 then
                if #l_v73_0 > 0 then
                    v68[v69 - 1][2] = l_v73_0;
                else
                    l_remove_0(v68, v69 - 1);
                    v69 = v69 - 1;
                end;
                v68[v69][2] = l_v74_0;
                if #l_v75_0 > 0 then
                    v68[v69 + 1][2] = l_v75_0;
                else
                    l_remove_0(v68, v69 + 1);
                    v69 = v69 - 1;
                end;
            end;
        end;
        v69 = v69 + 1;
    end;
end;
v3 = function(v83) --[[ Line: 403 ]]
    -- upvalues: v13 (copy), v22 (copy), l_sub_0 (copy), l_insert_0 (copy), v29 (copy), l_remove_0 (copy), v3 (ref)
    v83[#v83 + 1] = v13.new(0, "");
    local v84 = 1;
    local v85 = 0;
    local v86 = 0;
    local v87 = "";
    local v88 = "";
    local v89 = nil;
    while v83[v84] do
        local v90 = v83[v84][1];
        if v90 == 1 then
            v86 = v86 + 1;
            v88 = v88 .. v83[v84][2];
            v84 = v84 + 1;
        elseif v90 == -1 then
            v85 = v85 + 1;
            v87 = v87 .. v83[v84][2];
            v84 = v84 + 1;
        elseif v90 == 0 then
            if v85 + v86 > 1 then
                if v85 > 0 and v86 > 0 then
                    v89 = v22(v88, v87);
                    if v89 > 0 then
                        local v91 = v84 - v85 - v86;
                        if v91 > 1 and v83[v91 - 1][1] == 0 then
                            v83[v91 - 1][2] = v83[v91 - 1][2] .. l_sub_0(v88, 1, v89);
                        else
                            l_insert_0(v83, 1, v13.new(0, (l_sub_0(v88, 1, v89))));
                            v84 = v84 + 1;
                        end;
                        v88 = l_sub_0(v88, v89 + 1);
                        v87 = l_sub_0(v87, v89 + 1);
                    end;
                    v89 = v29(v88, v87);
                    if v89 ~= 0 then
                        v83[v84][2] = l_sub_0(v88, -v89) .. v83[v84][2];
                        v88 = l_sub_0(v88, 1, -v89 - 1);
                        v87 = l_sub_0(v87, 1, -v89 - 1);
                    end;
                end;
                v84 = v84 - v85 - v86;
                for _ = 1, v85 + v86 do
                    l_remove_0(v83, v84);
                end;
                if #v87 > 0 then
                    l_insert_0(v83, v84, v13.new(-1, v87));
                    v84 = v84 + 1;
                end;
                if #v88 > 0 then
                    l_insert_0(v83, v84, v13.new(1, v88));
                    v84 = v84 + 1;
                end;
                v84 = v84 + 1;
            elseif v84 > 1 and v83[v84 - 1][1] == 0 then
                v83[v84 - 1][2] = v83[v84 - 1][2] .. v83[v84][2];
                l_remove_0(v83, v84);
            else
                v84 = v84 + 1;
            end;
            v86 = 0;
            v85 = 0;
            v87 = "";
            v88 = "";
        end;
    end;
    if v83[#v83][2] == "" then
        v83[#v83] = nil;
    end;
    local v93 = false;
    v84 = 2;
    while v84 < #v83 do
        local v94 = v83[v84 - 1];
        local v95 = v83[v84 + 1];
        if v94[1] == 0 and v95[1] == 0 then
            local v96 = v83[v84];
            local v97 = v96[2];
            local v98 = v94[2];
            local v99 = v95[2];
            if #v98 == 0 then
                l_remove_0(v83, v84 - 1);
                v93 = true;
            elseif l_sub_0(v97, -#v98) == v98 then
                v96[2] = v98 .. l_sub_0(v97, 1, -#v98 - 1);
                v95[2] = v98 .. v95[2];
                l_remove_0(v83, v84 - 1);
                v93 = true;
            elseif l_sub_0(v97, 1, #v99) == v99 then
                v94[2] = v98 .. v99;
                v96[2] = l_sub_0(v97, #v99 + 1) .. v99;
                l_remove_0(v83, v84 + 1);
                v93 = true;
            end;
        end;
        v84 = v84 + 1;
    end;
    if v93 then
        return v3(v83);
    else
        return;
    end;
end;
return {
    Diff = v13, 
    DIFF_EQUAL = 0, 
    DIFF_DELETE = -1, 
    DIFF_INSERT = 1, 
    cleanupSemantic = v54, 
    _diff_commonPrefix = v22, 
    _diff_commonSuffix = v29, 
    _diff_commonOverlap = v39, 
    _diff_cleanupMerge = v3, 
    _diff_cleanupSemanticLossless = v2
};