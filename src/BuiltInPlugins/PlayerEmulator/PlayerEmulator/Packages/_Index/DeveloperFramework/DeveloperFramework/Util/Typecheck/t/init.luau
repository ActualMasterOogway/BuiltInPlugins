local v0 = typeof or type;
local function _(v1) --[[ Line: 35 ]] --[[ Name: primitive ]]
    -- upvalues: v0 (copy)
    return function(v2) --[[ Line: 36 ]]
        -- upvalues: v0 (ref), v1 (copy)
        local v3 = v0(v2);
        if v3 == v1 then
            return true;
        else
            return false, string.format("%s expected, got %s", v1, v3);
        end;
    end;
end;
local v6 = {
    any = function(v5) --[[ Line: 55 ]] --[[ Name: any ]]
        if v5 ~= nil then
            return true;
        else
            return false, "any expected, got nil";
        end;
    end
};
local v7 = "boolean";
local l_v7_0 = v7 --[[ copy: 4 -> 5 ]];
v6.boolean = function(v9) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_0 (copy)
    local v10 = v0(v9);
    if v10 == l_v7_0 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_0, v10);
    end;
end;
v7 = "thread";
local l_v7_1 = v7 --[[ copy: 4 -> 6 ]];
v6.thread = function(v12) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_1 (copy)
    local v13 = v0(v12);
    if v13 == l_v7_1 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_1, v13);
    end;
end;
v7 = "function";
local l_v7_2 = v7 --[[ copy: 4 -> 7 ]];
v6.callback = function(v15) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_2 (copy)
    local v16 = v0(v15);
    if v16 == l_v7_2 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_2, v16);
    end;
end;
v7 = "nil";
local l_v7_3 = v7 --[[ copy: 4 -> 8 ]];
v6.none = function(v18) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_3 (copy)
    local v19 = v0(v18);
    if v19 == l_v7_3 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_3, v19);
    end;
end;
v7 = "string";
local l_v7_4 = v7 --[[ copy: 4 -> 9 ]];
v6.string = function(v21) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_4 (copy)
    local v22 = v0(v21);
    if v22 == l_v7_4 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_4, v22);
    end;
end;
v7 = "table";
local l_v7_5 = v7 --[[ copy: 4 -> 10 ]];
v6.table = function(v24) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_5 (copy)
    local v25 = v0(v24);
    if v25 == l_v7_5 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_5, v25);
    end;
end;
v7 = "userdata";
local l_v7_6 = v7 --[[ copy: 4 -> 11 ]];
v6.userdata = function(v27) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_6 (copy)
    local v28 = v0(v27);
    if v28 == l_v7_6 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_6, v28);
    end;
end;
v6.number = function(v29) --[[ Line: 135 ]] --[[ Name: number ]]
    -- upvalues: v0 (copy)
    local v30 = v0(v29);
    if v30 == "number" then
        if v29 == v29 then
            return true;
        else
            return false, "unexpected NaN value";
        end;
    else
        return false, string.format("number expected, got %s", v30);
    end;
end;
v6.nan = function(v31) --[[ Line: 155 ]] --[[ Name: nan ]]
    if v31 ~= v31 then
        return true;
    else
        return false, "unexpected non-NaN value";
    end;
end;
v7 = "Axes";
local l_v7_7 = v7 --[[ copy: 4 -> 12 ]];
v6.Axes = function(v33) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_7 (copy)
    local v34 = v0(v33);
    if v34 == l_v7_7 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_7, v34);
    end;
end;
v7 = "BrickColor";
local l_v7_8 = v7 --[[ copy: 4 -> 13 ]];
v6.BrickColor = function(v36) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_8 (copy)
    local v37 = v0(v36);
    if v37 == l_v7_8 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_8, v37);
    end;
end;
v7 = "CFrame";
local l_v7_9 = v7 --[[ copy: 4 -> 14 ]];
v6.CFrame = function(v39) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_9 (copy)
    local v40 = v0(v39);
    if v40 == l_v7_9 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_9, v40);
    end;
end;
v7 = "Color3";
local l_v7_10 = v7 --[[ copy: 4 -> 15 ]];
v6.Color3 = function(v42) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_10 (copy)
    local v43 = v0(v42);
    if v43 == l_v7_10 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_10, v43);
    end;
end;
v7 = "ColorSequence";
local l_v7_11 = v7 --[[ copy: 4 -> 16 ]];
v6.ColorSequence = function(v45) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_11 (copy)
    local v46 = v0(v45);
    if v46 == l_v7_11 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_11, v46);
    end;
end;
v7 = "ColorSequenceKeypoint";
local l_v7_12 = v7 --[[ copy: 4 -> 17 ]];
v6.ColorSequenceKeypoint = function(v48) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_12 (copy)
    local v49 = v0(v48);
    if v49 == l_v7_12 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_12, v49);
    end;
end;
v7 = "DockWidgetPluginGuiInfo";
local l_v7_13 = v7 --[[ copy: 4 -> 18 ]];
v6.DockWidgetPluginGuiInfo = function(v51) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_13 (copy)
    local v52 = v0(v51);
    if v52 == l_v7_13 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_13, v52);
    end;
end;
v7 = "Faces";
local l_v7_14 = v7 --[[ copy: 4 -> 19 ]];
v6.Faces = function(v54) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_14 (copy)
    local v55 = v0(v54);
    if v55 == l_v7_14 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_14, v55);
    end;
end;
v7 = "Instance";
local l_v7_15 = v7 --[[ copy: 4 -> 20 ]];
v6.Instance = function(v57) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_15 (copy)
    local v58 = v0(v57);
    if v58 == l_v7_15 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_15, v58);
    end;
end;
v7 = "NumberRange";
local l_v7_16 = v7 --[[ copy: 4 -> 21 ]];
v6.NumberRange = function(v60) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_16 (copy)
    local v61 = v0(v60);
    if v61 == l_v7_16 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_16, v61);
    end;
end;
v7 = "NumberSequence";
local l_v7_17 = v7 --[[ copy: 4 -> 22 ]];
v6.NumberSequence = function(v63) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_17 (copy)
    local v64 = v0(v63);
    if v64 == l_v7_17 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_17, v64);
    end;
end;
v7 = "NumberSequenceKeypoint";
local l_v7_18 = v7 --[[ copy: 4 -> 23 ]];
v6.NumberSequenceKeypoint = function(v66) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_18 (copy)
    local v67 = v0(v66);
    if v67 == l_v7_18 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_18, v67);
    end;
end;
v7 = "PathWaypoint";
local l_v7_19 = v7 --[[ copy: 4 -> 24 ]];
v6.PathWaypoint = function(v69) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_19 (copy)
    local v70 = v0(v69);
    if v70 == l_v7_19 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_19, v70);
    end;
end;
v7 = "PhysicalProperties";
local l_v7_20 = v7 --[[ copy: 4 -> 25 ]];
v6.PhysicalProperties = function(v72) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_20 (copy)
    local v73 = v0(v72);
    if v73 == l_v7_20 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_20, v73);
    end;
end;
v7 = "Random";
local l_v7_21 = v7 --[[ copy: 4 -> 26 ]];
v6.Random = function(v75) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_21 (copy)
    local v76 = v0(v75);
    if v76 == l_v7_21 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_21, v76);
    end;
end;
v7 = "Ray";
local l_v7_22 = v7 --[[ copy: 4 -> 27 ]];
v6.Ray = function(v78) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_22 (copy)
    local v79 = v0(v78);
    if v79 == l_v7_22 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_22, v79);
    end;
end;
v7 = "Rect";
local l_v7_23 = v7 --[[ copy: 4 -> 28 ]];
v6.Rect = function(v81) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_23 (copy)
    local v82 = v0(v81);
    if v82 == l_v7_23 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_23, v82);
    end;
end;
v7 = "Region3";
local l_v7_24 = v7 --[[ copy: 4 -> 29 ]];
v6.Region3 = function(v84) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_24 (copy)
    local v85 = v0(v84);
    if v85 == l_v7_24 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_24, v85);
    end;
end;
v7 = "Region3int16";
local l_v7_25 = v7 --[[ copy: 4 -> 30 ]];
v6.Region3int16 = function(v87) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_25 (copy)
    local v88 = v0(v87);
    if v88 == l_v7_25 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_25, v88);
    end;
end;
v7 = "TweenInfo";
local l_v7_26 = v7 --[[ copy: 4 -> 31 ]];
v6.TweenInfo = function(v90) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_26 (copy)
    local v91 = v0(v90);
    if v91 == l_v7_26 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_26, v91);
    end;
end;
v7 = "UDim";
local l_v7_27 = v7 --[[ copy: 4 -> 32 ]];
v6.UDim = function(v93) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_27 (copy)
    local v94 = v0(v93);
    if v94 == l_v7_27 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_27, v94);
    end;
end;
v7 = "UDim2";
local l_v7_28 = v7 --[[ copy: 4 -> 33 ]];
v6.UDim2 = function(v96) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_28 (copy)
    local v97 = v0(v96);
    if v97 == l_v7_28 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_28, v97);
    end;
end;
v7 = "Vector2";
local l_v7_29 = v7 --[[ copy: 4 -> 34 ]];
v6.Vector2 = function(v99) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_29 (copy)
    local v100 = v0(v99);
    if v100 == l_v7_29 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_29, v100);
    end;
end;
v7 = "Vector3";
local l_v7_30 = v7 --[[ copy: 4 -> 35 ]];
v6.Vector3 = function(v102) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_30 (copy)
    local v103 = v0(v102);
    if v103 == l_v7_30 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_30, v103);
    end;
end;
v7 = "Vector3int16";
local l_v7_31 = v7 --[[ copy: 4 -> 36 ]];
v6.Vector3int16 = function(v105) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_31 (copy)
    local v106 = v0(v105);
    if v106 == l_v7_31 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_31, v106);
    end;
end;
v7 = "Enum";
local l_v7_32 = v7 --[[ copy: 4 -> 37 ]];
v6.Enum = function(v108) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_32 (copy)
    local v109 = v0(v108);
    if v109 == l_v7_32 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_32, v109);
    end;
end;
v7 = "EnumItem";
local l_v7_33 = v7 --[[ copy: 4 -> 38 ]];
v6.EnumItem = function(v111) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_33 (copy)
    local v112 = v0(v111);
    if v112 == l_v7_33 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_33, v112);
    end;
end;
v7 = "RBXScriptSignal";
local l_v7_34 = v7 --[[ copy: 4 -> 39 ]];
v6.RBXScriptSignal = function(v114) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), l_v7_34 (copy)
    local v115 = v0(v114);
    if v115 == l_v7_34 then
        return true;
    else
        return false, string.format("%s expected, got %s", l_v7_34, v115);
    end;
end;
v7 = "RBXScriptConnection";
v6.RBXScriptConnection = function(v116) --[[ Line: 36 ]]
    -- upvalues: v0 (copy), v7 (copy)
    local v117 = v0(v116);
    if v117 == v7 then
        return true;
    else
        return false, string.format("%s expected, got %s", v7, v117);
    end;
end;
v6.literal = function(...) --[[ Line: 435 ]] --[[ Name: literal ]]
    -- upvalues: v6 (copy)
    local v118 = select("#", ...);
    if v118 == 1 then
        local v119 = ...;
        return function(v120) --[[ Line: 439 ]]
            -- upvalues: v119 (copy)
            if v120 ~= v119 then
                return false, string.format("expected %s, got %s", tostring(v119), (tostring(v120)));
            else
                return true;
            end;
        end;
    else
        local v121 = {};
        for v122 = 1, v118 do
            local v123 = select(v122, ...);
            v121[v122] = v6.literal(v123);
        end;
        return v6.union(unpack(v121));
    end;
end;
v6.exactly = v6.literal;
v6.keyOf = function(v124) --[[ Line: 470 ]] --[[ Name: keyOf ]]
    -- upvalues: v6 (copy)
    local v125 = {};
    local v126 = 0;
    for v127 in pairs(v124) do
        v126 = v126 + 1;
        v125[v126] = v127;
    end;
    return v6.literal(unpack(v125, 1, v126));
end;
v6.valueOf = function(v128) --[[ Line: 488 ]] --[[ Name: valueOf ]]
    -- upvalues: v6 (copy)
    local v129 = {};
    local v130 = 0;
    for _, v132 in pairs(v128) do
        v130 = v130 + 1;
        v129[v130] = v132;
    end;
    return v6.literal(unpack(v129, 1, v130));
end;
v6.integer = function(v133) --[[ Line: 506 ]] --[[ Name: integer ]]
    -- upvalues: v6 (copy)
    local v134, v135 = v6.number(v133);
    if not v134 then
        return false, v135 or "";
    elseif v133 % 1 == 0 then
        return true;
    else
        return false, string.format("integer expected, got %s", v133);
    end;
end;
v6.numberMin = function(v136) --[[ Line: 526 ]] --[[ Name: numberMin ]]
    -- upvalues: v6 (copy)
    return function(v137) --[[ Line: 527 ]]
        -- upvalues: v6 (ref), v136 (copy)
        local v138, v139 = v6.number(v137);
        if not v138 then
            return false, v139 or "";
        elseif v136 <= v137 then
            return true;
        else
            return false, string.format("number >= %s expected, got %s", v136, v137);
        end;
    end;
end;
v6.numberMax = function(v140) --[[ Line: 548 ]] --[[ Name: numberMax ]]
    -- upvalues: v6 (copy)
    return function(v141) --[[ Line: 549 ]]
        -- upvalues: v6 (ref), v140 (copy)
        local v142, v143 = v6.number(v141);
        if not v142 then
            return false, v143;
        elseif v141 <= v140 then
            return true;
        else
            return false, string.format("number <= %s expected, got %s", v140, v141);
        end;
    end;
end;
v6.numberMinExclusive = function(v144) --[[ Line: 570 ]] --[[ Name: numberMinExclusive ]]
    -- upvalues: v6 (copy)
    return function(v145) --[[ Line: 571 ]]
        -- upvalues: v6 (ref), v144 (copy)
        local v146, v147 = v6.number(v145);
        if not v146 then
            return false, v147 or "";
        elseif v144 < v145 then
            return true;
        else
            return false, string.format("number > %s expected, got %s", v144, v145);
        end;
    end;
end;
v6.numberMaxExclusive = function(v148) --[[ Line: 592 ]] --[[ Name: numberMaxExclusive ]]
    -- upvalues: v6 (copy)
    return function(v149) --[[ Line: 593 ]]
        -- upvalues: v6 (ref), v148 (copy)
        local v150, v151 = v6.number(v149);
        if not v150 then
            return false, v151 or "";
        elseif v149 < v148 then
            return true;
        else
            return false, string.format("number < %s expected, got %s", v148, v149);
        end;
    end;
end;
v6.numberPositive = v6.numberMinExclusive(0);
v6.numberNegative = v6.numberMaxExclusive(0);
v6.numberConstrained = function(v152, v153) --[[ Line: 629 ]] --[[ Name: numberConstrained ]]
    -- upvalues: v6 (copy)
    assert(v6.number(v152) and v6.number(v153), "TypeError");
    local v154 = v6.numberMin(v152);
    local v155 = v6.numberMax(v153);
    return function(v156) --[[ Line: 634 ]]
        -- upvalues: v154 (copy), v155 (copy)
        local v157, v158 = v154(v156);
        if not v157 then
            return false, v158 or "";
        else
            local v159, v160 = v155(v156);
            if not v159 then
                return false, v160 or "";
            else
                return true;
            end;
        end;
    end;
end;
v6.numberConstrainedExclusive = function(v161, v162) --[[ Line: 657 ]] --[[ Name: numberConstrainedExclusive ]]
    -- upvalues: v6 (copy)
    assert(v6.number(v161) and v6.number(v162), "TypeError");
    local v163 = v6.numberMinExclusive(v161);
    local v164 = v6.numberMaxExclusive(v162);
    return function(v165) --[[ Line: 662 ]]
        -- upvalues: v163 (copy), v164 (copy)
        local v166, v167 = v163(v165);
        if not v166 then
            return false, v167 or "";
        else
            local v168, v169 = v164(v165);
            if not v168 then
                return false, v169 or "";
            else
                return true;
            end;
        end;
    end;
end;
v6.match = function(v170) --[[ Line: 684 ]] --[[ Name: match ]]
    -- upvalues: v6 (copy)
    assert(v6.string(v170), "TypeError");
    return function(v171) --[[ Line: 686 ]]
        -- upvalues: v6 (ref), v170 (copy)
        local v172, v173 = v6.string(v171);
        if not v172 then
            return false, v173;
        elseif string.match(v171, v170) == nil then
            return false, string.format("%q failed to match pattern %q", v171, v170);
        else
            return true;
        end;
    end;
end;
v6.optional = function(v174) --[[ Line: 707 ]] --[[ Name: optional ]]
    -- upvalues: v6 (copy)
    assert(v6.callback(v174), "TypeError");
    return function(v175) --[[ Line: 709 ]]
        -- upvalues: v174 (copy)
        if v175 == nil then
            return true;
        else
            local v176, v177 = v174(v175);
            if v176 then
                return true;
            else
                return false, string.format("(optional) %s", v177 or "");
            end;
        end;
    end;
end;
v6.tuple = function(...) --[[ Line: 730 ]] --[[ Name: tuple ]]
    local v178 = {
        ...
    };
    return function(...) --[[ Line: 732 ]]
        -- upvalues: v178 (copy)
        local v179 = {
            ...
        };
        for v180, v181 in ipairs(v178) do
            local v182, v183 = v181(v179[v180]);
            if v182 == false then
                return false, string.format("Bad tuple index #%s:\n\t%s", v180, v183 or "");
            end;
        end;
        return true;
    end;
end;
v6.keys = function(v184) --[[ Line: 752 ]] --[[ Name: keys ]]
    -- upvalues: v6 (copy)
    assert(v6.callback(v184), "TypeError");
    return function(v185) --[[ Line: 754 ]]
        -- upvalues: v6 (ref), v184 (copy)
        local v186, v187 = v6.table(v185);
        if v186 == false then
            return false, v187 or "";
        else
            for v188 in pairs(v185) do
                local v189, v190 = v184(v188);
                if v189 == false then
                    return false, string.format("bad key %s:\n\t%s", tostring(v188), v190 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.values = function(v191) --[[ Line: 778 ]] --[[ Name: values ]]
    -- upvalues: v6 (copy)
    assert(v6.callback(v191), "TypeError");
    return function(v192) --[[ Line: 780 ]]
        -- upvalues: v6 (ref), v191 (copy)
        local v193, v194 = v6.table(v192);
        if v193 == false then
            return false, v194 or "";
        else
            for v195, v196 in pairs(v192) do
                local v197, v198 = v191(v196);
                if v197 == false then
                    return false, string.format("bad value for key %s:\n\t%s", tostring(v195), v198 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.map = function(v199, v200) --[[ Line: 805 ]] --[[ Name: map ]]
    -- upvalues: v6 (copy)
    assert(v6.callback(v199), v6.callback(v200));
    local v201 = v6.keys(v199);
    local v202 = v6.values(v200);
    return function(v203) --[[ Line: 810 ]]
        -- upvalues: v201 (copy), v202 (copy)
        local v204, v205 = v201(v203);
        if not v204 then
            return false, v205 or "";
        else
            local v206, v207 = v202(v203);
            if not v206 then
                return false, v207 or "";
            else
                return true;
            end;
        end;
    end;
end;
local v208 = v6.keys(v6.integer);
local l_v208_0 = v208 --[[ copy: 3 -> 40 ]];
v6.array = function(v210) --[[ Line: 834 ]] --[[ Name: array ]]
    -- upvalues: v6 (copy), l_v208_0 (copy)
    assert(v6.callback(v210), "TypeError");
    local v211 = v6.values(v210);
    return function(v212) --[[ Line: 838 ]]
        -- upvalues: l_v208_0 (ref), v211 (copy)
        local v213, v214 = l_v208_0(v212);
        if v213 == false then
            return false, string.format("[array] %s", v214 or "");
        else
            local v215 = 0;
            for _ in ipairs(v212) do
                v215 = v215 + 1;
            end;
            for v217 in pairs(v212) do
                if v217 < 1 or v215 < v217 then
                    return false, string.format("[array] key %s must be sequential", (tostring(v217)));
                end;
            end;
            local v218, v219 = v211(v212);
            if not v218 then
                return false, string.format("[array] %s", v219 or "");
            else
                return true;
            end;
        end;
    end;
end;
v208 = v6.array(v6.callback);
local l_v208_1 = v208 --[[ copy: 3 -> 41 ]];
v6.union = function(...) --[[ Line: 877 ]] --[[ Name: union ]]
    -- upvalues: l_v208_1 (copy)
    local v221 = {
        ...
    };
    assert(l_v208_1(v221), "TypeError");
    return function(v222) --[[ Line: 881 ]]
        -- upvalues: v221 (copy)
        for _, v224 in ipairs(v221) do
            if v224(v222) then
                return true;
            end;
        end;
        return false, "bad type for union";
    end;
end;
v6.some = v6.union;
v6.intersection = function(...) --[[ Line: 904 ]] --[[ Name: intersection ]]
    -- upvalues: l_v208_1 (copy)
    local v225 = {
        ...
    };
    assert(l_v208_1(v225), "TypeError");
    return function(v226) --[[ Line: 908 ]]
        -- upvalues: v225 (copy)
        for _, v228 in ipairs(v225) do
            local v229, v230 = v228(v226);
            if not v229 then
                return false, v230 or "";
            end;
        end;
        return true;
    end;
end;
v6.every = v6.intersection;
v208 = v6.map(v6.any, v6.callback);
local l_v208_2 = v208 --[[ copy: 3 -> 42 ]];
v6.interface = function(v232) --[[ Line: 935 ]] --[[ Name: interface ]]
    -- upvalues: l_v208_2 (copy), v6 (copy)
    assert(l_v208_2(v232), "TypeError");
    return function(v233) --[[ Line: 937 ]]
        -- upvalues: v6 (ref), v232 (copy)
        local v234, v235 = v6.table(v233);
        if v234 == false then
            return false, v235 or "";
        else
            for v236, v237 in pairs(v232) do
                local v238, v239 = v237(v233[v236]);
                if v238 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v236), v239 or "");
                end;
            end;
            return true;
        end;
    end;
end;
v6.strictInterface = function(v240) --[[ Line: 961 ]] --[[ Name: strictInterface ]]
    -- upvalues: l_v208_2 (copy), v6 (copy)
    assert(l_v208_2(v240), "TypeError");
    return function(v241) --[[ Line: 963 ]]
        -- upvalues: v6 (ref), v240 (copy)
        local v242, v243 = v6.table(v241);
        if v242 == false then
            return false, v243 or "";
        else
            for v244, v245 in pairs(v240) do
                local v246, v247 = v245(v241[v244]);
                if v246 == false then
                    return false, string.format("[interface] bad value for %s:\n\t%s", tostring(v244), v247 or "");
                end;
            end;
            for v248 in pairs(v241) do
                if not v240[v248] then
                    return false, string.format("[interface] unexpected field %q", (tostring(v248)));
                end;
            end;
            return true;
        end;
    end;
end;
v6.instanceOf = function(v249, v250) --[[ Line: 994 ]] --[[ Name: instanceOf ]]
    -- upvalues: v6 (copy)
    assert(v6.string(v249), "TypeError");
    local v251 = nil;
    if v250 ~= nil then
        v251 = v6.children(v250);
    end;
    return function(v252) --[[ Line: 1002 ]]
        -- upvalues: v6 (ref), v249 (copy), v251 (ref)
        local v253, v254 = v6.Instance(v252);
        if not v253 then
            return false, v254 or "";
        elseif v252.ClassName ~= v249 then
            return false, string.format("%s expected, got %s", v249, v252.ClassName);
        else
            if v251 then
                local v255, v256 = v251(v252);
                if not v255 then
                    return false, v256;
                end;
            end;
            return true;
        end;
    end;
end;
v6.instance = v6.instanceOf;
v6.instanceIsA = function(v257, v258) --[[ Line: 1032 ]] --[[ Name: instanceIsA ]]
    -- upvalues: v6 (copy)
    assert(v6.string(v257), "TypeError");
    local v259 = nil;
    if v258 ~= nil then
        v259 = v6.children(v258);
    end;
    return function(v260) --[[ Line: 1040 ]]
        -- upvalues: v6 (ref), v257 (copy), v259 (ref)
        local v261, v262 = v6.Instance(v260);
        if not v261 then
            return false, v262 or "";
        elseif not v260:IsA(v257) then
            return false, string.format("%s expected, got %s", v257, v260.ClassName);
        else
            if v259 then
                local v263, v264 = v259(v260);
                if not v263 then
                    return false, v264;
                end;
            end;
            return true;
        end;
    end;
end;
v6.enum = function(v265) --[[ Line: 1068 ]] --[[ Name: enum ]]
    -- upvalues: v6 (copy)
    assert(v6.Enum(v265), "TypeError");
    return function(v266) --[[ Line: 1070 ]]
        -- upvalues: v6 (ref), v265 (copy)
        local v267, v268 = v6.EnumItem(v266);
        if not v267 then
            return false, v268;
        elseif v266.EnumType == v265 then
            return true;
        else
            return false, string.format("enum of %s expected, got enum of %s", tostring(v265), (tostring(v266.EnumType)));
        end;
    end;
end;
v208 = v6.tuple(v6.callback, v6.callback);
local l_v208_3 = v208 --[[ copy: 3 -> 43 ]];
v6.wrap = function(v270, v271) --[[ Line: 1095 ]] --[[ Name: wrap ]]
    -- upvalues: l_v208_3 (copy)
    assert(l_v208_3(v270, v271), "TypeError");
    return function(...) --[[ Line: 1097 ]]
        -- upvalues: v271 (copy), v270 (copy)
        assert(v271(...), "TypeError");
        return v270(...);
    end;
end;
v6.strict = function(v272) --[[ Line: 1111 ]] --[[ Name: strict ]]
    return function(...) --[[ Line: 1112 ]]
        -- upvalues: v272 (copy)
        assert(v272(...), "TypeError");
    end;
end;
v208 = v6.map(v6.string, v6.callback);
v6.children = function(v273) --[[ Line: 1131 ]] --[[ Name: children ]]
    -- upvalues: v208 (copy), v6 (copy)
    assert(v208(v273), "TypeError");
    return function(v274) --[[ Line: 1134 ]]
        -- upvalues: v6 (ref), v273 (copy)
        local v275, v276 = v6.Instance(v274);
        if not v275 then
            return false, v276 or "";
        else
            local v277 = {};
            for _, v279 in ipairs(v274:GetChildren()) do
                local l_Name_0 = v279.Name;
                if v273[l_Name_0] then
                    if v277[l_Name_0] then
                        return false, string.format("Cannot process multiple children with the same name %q", l_Name_0);
                    else
                        v277[l_Name_0] = v279;
                    end;
                end;
            end;
            for v281, v282 in pairs(v273) do
                local v283, v284 = v282(v277[v281]);
                if not v283 then
                    return false, string.format("[%s.%s] %s", v274:GetFullName(), v281, v284 or "");
                end;
            end;
            return true;
        end;
    end;
end;
return v6;