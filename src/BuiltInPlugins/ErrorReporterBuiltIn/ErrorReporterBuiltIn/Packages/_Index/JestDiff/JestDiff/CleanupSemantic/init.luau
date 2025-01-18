local v0 = nil;
local v1 = nil;
local l_sub_0 = string.sub;
local l_byte_0 = string.byte;
local l_match_0 = string.match;
local l_find_0 = string.find;
local l_max_0 = math.max;
local l_min_0 = math.min;
local l_floor_0 = math.floor;
local l_insert_0 = table.insert;
local l_remove_0 = table.remove;
local v11 = {};
v11.__index = v11;
v11.new = function(v12, v13) --[[ Line: 63 ]] --[[ Name: new ]]
    -- upvalues: v11 (copy)
    local v14 = {
        v12, 
        v13
    };
    setmetatable(v14, v11);
    return v14;
end;
local function v21(v15, v16) --[[ Line: 78 ]] --[[ Name: _diff_commonPrefix ]]
    -- upvalues: l_byte_0 (copy), l_min_0 (copy), l_sub_0 (copy), l_floor_0 (copy)
    if #v15 == 0 or #v16 == 0 or l_byte_0(v15, 1, 1) ~= l_byte_0(v16, 1, 1) then
        return 0;
    else
        local v17 = 1;
        local v18 = l_min_0(#v15, #v16);
        local l_v18_0 = v18;
        local v20 = 1;
        while v17 < l_v18_0 do
            if l_sub_0(v15, v20, l_v18_0) == l_sub_0(v16, v20, l_v18_0) then
                v17 = l_v18_0;
                v20 = v17;
            else
                v18 = l_v18_0;
            end;
            l_v18_0 = l_floor_0(v17 + (v18 - v17) / 2);
        end;
        return l_v18_0;
    end;
end;
local function v28(v22, v23) --[[ Line: 111 ]] --[[ Name: _diff_commonSuffix ]]
    -- upvalues: l_byte_0 (copy), l_min_0 (copy), l_sub_0 (copy), l_floor_0 (copy)
    if #v22 == 0 or #v23 == 0 or l_byte_0(v22, -1) ~= l_byte_0(v23, -1) then
        return 0;
    else
        local v24 = 1;
        local v25 = l_min_0(#v22, #v23);
        local l_v25_0 = v25;
        local v27 = 1;
        while v24 < l_v25_0 do
            if l_sub_0(v22, -l_v25_0, -v27) == l_sub_0(v23, -l_v25_0, -v27) then
                v24 = l_v25_0;
                v27 = v24;
            else
                v25 = l_v25_0;
            end;
            l_v25_0 = l_floor_0(v24 + (v25 - v24) / 2);
        end;
        return l_v25_0;
    end;
end;
local function v38(v29, v30) --[[ Line: 145 ]] --[[ Name: _diff_commonOverlap ]]
    -- upvalues: l_sub_0 (copy), l_min_0 (copy), l_find_0 (copy)
    local v31 = #v29;
    local v32 = #v30;
    if v31 == 0 or v32 == 0 then
        return 0;
    else
        if v32 < v31 then
            v29 = l_sub_0(v29, v31 - v32 + 1);
        elseif v31 < v32 then
            v30 = l_sub_0(v30, 1, v31);
        end;
        local v33 = l_min_0(v31, v32);
        if v29 == v30 then
            return v33;
        else
            local v34 = 0;
            local v35 = 1;
            while true do
                local v36 = l_sub_0(v29, v33 - v35 + 1);
                local v37 = l_find_0(v30, v36, 1, true);
                if v37 ~= nil then
                    v35 = v35 + v37 - 1;
                    if v37 == 1 or l_sub_0(v29, v33 - v35 + 1) == l_sub_0(v30, 1, v35) then
                        v34 = v35;
                        v35 = v35 + 1;
                    end;
                else
                    break;
                end;
            end;
            return v34;
        end;
    end;
end;
local function v53(v39) --[[ Line: 191 ]] --[[ Name: diff_cleanupSemantic ]]
    -- upvalues: l_max_0 (copy), v11 (copy), l_insert_0 (copy), v1 (ref), v0 (ref), v38 (copy), l_sub_0 (copy)
    local v40 = false;
    local v41 = {};
    local v42 = 0;
    local v43 = nil;
    local v44 = 1;
    local v45 = 0;
    local v46 = 0;
    local v47 = 0;
    local v48 = 0;
    while v39[v44] do
        if v39[v44][1] == 0 then
            v42 = v42 + 1;
            v41[v42] = v44;
            v45 = v47;
            v46 = v48;
            v47 = 0;
            v48 = 0;
            v43 = v39[v44][2];
        else
            if v39[v44][1] == 1 then
                v47 = v47 + #v39[v44][2];
            else
                v48 = v48 + #v39[v44][2];
            end;
            if v43 and #v43 <= l_max_0(v45, v46) and #v43 <= l_max_0(v47, v48) then
                l_insert_0(v39, v41[v42], v11.new(-1, v43));
                v39[v41[v42] + 1][1] = 1;
                v42 = v42 - 1 - 1;
                v44 = v42 > 0 and v41[v42] or 0;
                v45 = 0;
                v46 = 0;
                v47 = 0;
                v48 = 0;
                v43 = nil;
                v40 = true;
            end;
        end;
        v44 = v44 + 1;
    end;
    if v40 then
        v1(v39);
    end;
    v0(v39);
    v44 = 2;
    while v39[v44] do
        if v39[v44 - 1][1] == -1 and v39[v44][1] == 1 then
            local v49 = v39[v44 - 1][2];
            local v50 = v39[v44][2];
            local v51 = v38(v49, v50);
            local v52 = v38(v50, v49);
            if v52 <= v51 then
                if #v49 / 2 <= v51 or #v50 / 2 <= v51 then
                    l_insert_0(v39, v44, v11.new(0, (l_sub_0(v50, 1, v51))));
                    v39[v44 - 1][2] = l_sub_0(v49, 1, #v49 - v51);
                    v39[v44 + 1][2] = l_sub_0(v50, v51 + 1);
                    v44 = v44 + 1;
                end;
            elseif #v49 / 2 <= v52 or #v50 / 2 <= v52 then
                l_insert_0(v39, v44, v11.new(0, (l_sub_0(v49, 1, v52))));
                v39[v44 - 1] = {
                    1, 
                    (l_sub_0(v50, 1, #v50 - v52))
                };
                v39[v44 + 1] = {
                    -1, 
                    (l_sub_0(v49, v52 + 1))
                };
                v44 = v44 + 1;
            end;
            v44 = v44 + 1;
        end;
        v44 = v44 + 1;
    end;
end;
local function v66(v54, v55) --[[ Line: 305 ]] --[[ Name: _diff_cleanupSemanticScore ]]
    -- upvalues: l_sub_0 (copy), l_match_0 (copy)
    if #v54 == 0 or #v55 == 0 then
        return 6;
    else
        local v56 = l_sub_0(v54, -1);
        local v57 = l_sub_0(v55, 1, 1);
        local v58 = l_match_0(v56, "%W");
        local v59 = l_match_0(v57, "%W");
        local v60 = v58 and l_match_0(v56, "%s");
        local v61 = v59 and l_match_0(v57, "%s");
        local v62 = v60 and l_match_0(v56, "%c");
        local v63 = v61 and l_match_0(v57, "%c");
        local v64 = v62 and l_match_0(v54, "\n\r?\n$");
        local v65 = v63 and l_match_0(v55, "^\r?\n\r?\n");
        if v64 or v65 then
            return 5;
        elseif v62 or v63 then
            return 4;
        elseif v58 and not v60 and v61 then
            return 3;
        elseif v60 or v61 then
            return 2;
        elseif v58 or v59 then
            return 1;
        else
            return 0;
        end;
    end;
end;
v0 = function(v67) --[[ Line: 352 ]]
    -- upvalues: v28 (copy), l_sub_0 (copy), v66 (copy), l_byte_0 (copy), l_remove_0 (copy)
    local v68 = 2;
    while v67[v68 + 1] do
        local v69 = v67[v68 - 1];
        local v70 = v67[v68 + 1];
        if v69[1] == 0 and v70[1] == 0 then
            local v71 = v67[v68];
            local v72 = v69[2];
            local v73 = v71[2];
            local v74 = v70[2];
            local v75 = v28(v72, v73);
            if v75 > 0 then
                local v76 = l_sub_0(v73, -v75);
                v72 = l_sub_0(v72, 1, -v75 - 1);
                v73 = v76 .. l_sub_0(v73, 1, -v75 - 1);
                v74 = v76 .. v74;
            end;
            local l_v72_0 = v72;
            local l_v73_0 = v73;
            local l_v74_0 = v74;
            local v80 = v66(v72, v73) + v66(v73, v74);
            while l_byte_0(v73, 1) == l_byte_0(v74, 1) do
                v72 = v72 .. l_sub_0(v73, 1, 1);
                v73 = l_sub_0(v73, 2) .. l_sub_0(v74, 1, 1);
                v74 = l_sub_0(v74, 2);
                local v81 = v66(v72, v73) + v66(v73, v74);
                if v80 <= v81 then
                    v80 = v81;
                    l_v72_0 = v72;
                    l_v73_0 = v73;
                    l_v74_0 = v74;
                end;
            end;
            if v69[2] ~= l_v72_0 then
                if #l_v72_0 > 0 then
                    v67[v68 - 1][2] = l_v72_0;
                else
                    l_remove_0(v67, v68 - 1);
                    v68 = v68 - 1;
                end;
                v67[v68][2] = l_v73_0;
                if #l_v74_0 > 0 then
                    v67[v68 + 1][2] = l_v74_0;
                else
                    l_remove_0(v67, v68 + 1, 1);
                    v68 = v68 - 1;
                end;
            end;
        end;
        v68 = v68 + 1;
    end;
end;
v1 = function(v82) --[[ Line: 418 ]]
    -- upvalues: v11 (copy), v21 (copy), l_sub_0 (copy), l_insert_0 (copy), v28 (copy), l_remove_0 (copy), v1 (ref)
    v82[#v82 + 1] = v11.new(0, "");
    local v83 = 1;
    local v84 = 0;
    local v85 = 0;
    local v86 = "";
    local v87 = "";
    local v88 = nil;
    while v82[v83] do
        local v89 = v82[v83][1];
        if v89 == 1 then
            v85 = v85 + 1;
            v87 = v87 .. v82[v83][2];
            v83 = v83 + 1;
        elseif v89 == -1 then
            v84 = v84 + 1;
            v86 = v86 .. v82[v83][2];
            v83 = v83 + 1;
        elseif v89 == 0 then
            if v84 + v85 > 1 then
                if v84 > 0 and v85 > 0 then
                    v88 = v21(v87, v86);
                    if v88 > 0 then
                        local v90 = v83 - v84 - v85;
                        if v90 > 1 and v82[v90 - 1][1] == 0 then
                            v82[v90 - 1][2] = v82[v90 - 1][2] .. l_sub_0(v87, 1, v88);
                        else
                            l_insert_0(v82, 1, v11.new(0, (l_sub_0(v87, 1, v88))));
                            v83 = v83 + 1;
                        end;
                        v87 = l_sub_0(v87, v88 + 1);
                        v86 = l_sub_0(v86, v88 + 1);
                    end;
                    v88 = v28(v87, v86);
                    if v88 ~= 0 then
                        v82[v83][2] = l_sub_0(v87, -v88) .. v82[v83][2];
                        v87 = l_sub_0(v87, 1, -v88 - 1);
                        v86 = l_sub_0(v86, 1, -v88 - 1);
                    end;
                end;
                v83 = v83 - v84 - v85;
                for _ = 1, v84 + v85 do
                    l_remove_0(v82, v83);
                end;
                if #v86 > 0 then
                    l_insert_0(v82, v83, v11.new(-1, v86));
                    v83 = v83 + 1;
                end;
                if #v87 > 0 then
                    l_insert_0(v82, v83, v11.new(1, v87));
                    v83 = v83 + 1;
                end;
                v83 = v83 + 1;
            elseif v83 > 1 and v82[v83 - 1][1] == 0 then
                v82[v83 - 1][2] = v82[v83 - 1][2] .. v82[v83][2];
                l_remove_0(v82, v83);
            else
                v83 = v83 + 1;
            end;
            v85 = 0;
            v84 = 0;
            v86 = "";
            v87 = "";
        end;
    end;
    if v82[#v82][2] == "" then
        v82[#v82] = nil;
    end;
    local v92 = false;
    v83 = 2;
    while v83 < #v82 do
        local v93 = v82[v83 - 1];
        local v94 = v82[v83 + 1];
        if v93[1] == 0 and v94[1] == 0 then
            local v95 = v82[v83];
            local v96 = v95[2];
            local v97 = v93[2];
            local v98 = v94[2];
            if #v97 == 0 then
                l_remove_0(v82, v83 - 1);
                v92 = true;
            elseif l_sub_0(v96, -#v97) == v97 then
                v95[2] = v97 .. l_sub_0(v96, 1, -#v97 - 1);
                v94[2] = v97 .. v94[2];
                l_remove_0(v82, v83 - 1);
                v92 = true;
            elseif l_sub_0(v96, 1, #v98) == v98 then
                v93[2] = v97 .. v98;
                v95[2] = l_sub_0(v96, #v98 + 1) .. v98;
                l_remove_0(v82, v83 + 1);
                v92 = true;
            end;
        end;
        v83 = v83 + 1;
    end;
    if v92 then
        return v1(v82);
    else
        return;
    end;
end;
return {
    Diff = v11, 
    DIFF_EQUAL = 0, 
    DIFF_DELETE = -1, 
    DIFF_INSERT = 1, 
    cleanupSemantic = v53, 
    _diff_commonPrefix = v21, 
    _diff_commonSuffix = v28, 
    _diff_commonOverlap = v38, 
    _diff_cleanupMerge = v1, 
    _diff_cleanupSemanticLossless = v0
};