local v0 = typeof or type;
local function _(v1) --[[ Line: 6 ]] --[[ Name: primitive ]]
    -- upvalues: v0 (copy)
    return function(v2) --[[ Line: 7 ]]
        -- upvalues: v0 (ref), v1 (copy)
        if v0(v2) == v1 then
            return true;
        else
            return false;
        end;
    end;
end;
local v5 = {
    any = function(v4) --[[ Line: 19 ]] --[[ Name: any ]]
        if v4 ~= nil then
            return true;
        else
            return false;
        end;
    end
};
local v6 = "boolean";
local l_v6_0 = v6 --[[ copy: 4 -> 5 ]];
v5.boolean = function(v8) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_0 (copy)
    if v0(v8) == l_v6_0 then
        return true;
    else
        return false;
    end;
end;
v6 = "thread";
local l_v6_1 = v6 --[[ copy: 4 -> 6 ]];
v5.thread = function(v10) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_1 (copy)
    if v0(v10) == l_v6_1 then
        return true;
    else
        return false;
    end;
end;
v6 = "function";
local l_v6_2 = v6 --[[ copy: 4 -> 7 ]];
v5.callback = function(v12) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_2 (copy)
    if v0(v12) == l_v6_2 then
        return true;
    else
        return false;
    end;
end;
v6 = "nil";
local l_v6_3 = v6 --[[ copy: 4 -> 8 ]];
v5.none = function(v14) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_3 (copy)
    if v0(v14) == l_v6_3 then
        return true;
    else
        return false;
    end;
end;
v6 = "string";
local l_v6_4 = v6 --[[ copy: 4 -> 9 ]];
v5.string = function(v16) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_4 (copy)
    if v0(v16) == l_v6_4 then
        return true;
    else
        return false;
    end;
end;
v6 = "table";
local l_v6_5 = v6 --[[ copy: 4 -> 10 ]];
v5.table = function(v18) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_5 (copy)
    if v0(v18) == l_v6_5 then
        return true;
    else
        return false;
    end;
end;
v6 = "userdata";
local l_v6_6 = v6 --[[ copy: 4 -> 11 ]];
v5.userdata = function(v20) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_6 (copy)
    if v0(v20) == l_v6_6 then
        return true;
    else
        return false;
    end;
end;
v5.number = function(v21) --[[ Line: 37 ]] --[[ Name: number ]]
    -- upvalues: v0 (copy)
    if v0(v21) == "number" then
        if v21 == v21 then
            return true;
        else
            return false;
        end;
    else
        return false;
    end;
end;
v5.nan = function(v22) --[[ Line: 50 ]] --[[ Name: nan ]]
    if v22 ~= v22 then
        return true;
    else
        return false;
    end;
end;
v6 = "Axes";
local l_v6_7 = v6 --[[ copy: 4 -> 12 ]];
v5.Axes = function(v24) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_7 (copy)
    if v0(v24) == l_v6_7 then
        return true;
    else
        return false;
    end;
end;
v6 = "BrickColor";
local l_v6_8 = v6 --[[ copy: 4 -> 13 ]];
v5.BrickColor = function(v26) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_8 (copy)
    if v0(v26) == l_v6_8 then
        return true;
    else
        return false;
    end;
end;
v6 = "CFrame";
local l_v6_9 = v6 --[[ copy: 4 -> 14 ]];
v5.CFrame = function(v28) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_9 (copy)
    if v0(v28) == l_v6_9 then
        return true;
    else
        return false;
    end;
end;
v6 = "Color3";
local l_v6_10 = v6 --[[ copy: 4 -> 15 ]];
v5.Color3 = function(v30) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_10 (copy)
    if v0(v30) == l_v6_10 then
        return true;
    else
        return false;
    end;
end;
v6 = "ColorSequence";
local l_v6_11 = v6 --[[ copy: 4 -> 16 ]];
v5.ColorSequence = function(v32) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_11 (copy)
    if v0(v32) == l_v6_11 then
        return true;
    else
        return false;
    end;
end;
v6 = "ColorSequenceKeypoint";
local l_v6_12 = v6 --[[ copy: 4 -> 17 ]];
v5.ColorSequenceKeypoint = function(v34) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_12 (copy)
    if v0(v34) == l_v6_12 then
        return true;
    else
        return false;
    end;
end;
v6 = "DockWidgetPluginGuiInfo";
local l_v6_13 = v6 --[[ copy: 4 -> 18 ]];
v5.DockWidgetPluginGuiInfo = function(v36) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_13 (copy)
    if v0(v36) == l_v6_13 then
        return true;
    else
        return false;
    end;
end;
v6 = "Faces";
local l_v6_14 = v6 --[[ copy: 4 -> 19 ]];
v5.Faces = function(v38) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_14 (copy)
    if v0(v38) == l_v6_14 then
        return true;
    else
        return false;
    end;
end;
v6 = "Instance";
local l_v6_15 = v6 --[[ copy: 4 -> 20 ]];
v5.Instance = function(v40) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_15 (copy)
    if v0(v40) == l_v6_15 then
        return true;
    else
        return false;
    end;
end;
v6 = "NumberRange";
local l_v6_16 = v6 --[[ copy: 4 -> 21 ]];
v5.NumberRange = function(v42) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_16 (copy)
    if v0(v42) == l_v6_16 then
        return true;
    else
        return false;
    end;
end;
v6 = "NumberSequence";
local l_v6_17 = v6 --[[ copy: 4 -> 22 ]];
v5.NumberSequence = function(v44) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_17 (copy)
    if v0(v44) == l_v6_17 then
        return true;
    else
        return false;
    end;
end;
v6 = "NumberSequenceKeypoint";
local l_v6_18 = v6 --[[ copy: 4 -> 23 ]];
v5.NumberSequenceKeypoint = function(v46) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_18 (copy)
    if v0(v46) == l_v6_18 then
        return true;
    else
        return false;
    end;
end;
v6 = "PathWaypoint";
local l_v6_19 = v6 --[[ copy: 4 -> 24 ]];
v5.PathWaypoint = function(v48) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_19 (copy)
    if v0(v48) == l_v6_19 then
        return true;
    else
        return false;
    end;
end;
v6 = "PhysicalProperties";
local l_v6_20 = v6 --[[ copy: 4 -> 25 ]];
v5.PhysicalProperties = function(v50) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_20 (copy)
    if v0(v50) == l_v6_20 then
        return true;
    else
        return false;
    end;
end;
v6 = "Random";
local l_v6_21 = v6 --[[ copy: 4 -> 26 ]];
v5.Random = function(v52) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_21 (copy)
    if v0(v52) == l_v6_21 then
        return true;
    else
        return false;
    end;
end;
v6 = "Ray";
local l_v6_22 = v6 --[[ copy: 4 -> 27 ]];
v5.Ray = function(v54) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_22 (copy)
    if v0(v54) == l_v6_22 then
        return true;
    else
        return false;
    end;
end;
v6 = "Rect";
local l_v6_23 = v6 --[[ copy: 4 -> 28 ]];
v5.Rect = function(v56) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_23 (copy)
    if v0(v56) == l_v6_23 then
        return true;
    else
        return false;
    end;
end;
v6 = "Region3";
local l_v6_24 = v6 --[[ copy: 4 -> 29 ]];
v5.Region3 = function(v58) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_24 (copy)
    if v0(v58) == l_v6_24 then
        return true;
    else
        return false;
    end;
end;
v6 = "Region3int16";
local l_v6_25 = v6 --[[ copy: 4 -> 30 ]];
v5.Region3int16 = function(v60) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_25 (copy)
    if v0(v60) == l_v6_25 then
        return true;
    else
        return false;
    end;
end;
v6 = "TweenInfo";
local l_v6_26 = v6 --[[ copy: 4 -> 31 ]];
v5.TweenInfo = function(v62) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_26 (copy)
    if v0(v62) == l_v6_26 then
        return true;
    else
        return false;
    end;
end;
v6 = "UDim";
local l_v6_27 = v6 --[[ copy: 4 -> 32 ]];
v5.UDim = function(v64) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_27 (copy)
    if v0(v64) == l_v6_27 then
        return true;
    else
        return false;
    end;
end;
v6 = "UDim2";
local l_v6_28 = v6 --[[ copy: 4 -> 33 ]];
v5.UDim2 = function(v66) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_28 (copy)
    if v0(v66) == l_v6_28 then
        return true;
    else
        return false;
    end;
end;
v6 = "Vector2";
local l_v6_29 = v6 --[[ copy: 4 -> 34 ]];
v5.Vector2 = function(v68) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_29 (copy)
    if v0(v68) == l_v6_29 then
        return true;
    else
        return false;
    end;
end;
v6 = "Vector3";
local l_v6_30 = v6 --[[ copy: 4 -> 35 ]];
v5.Vector3 = function(v70) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_30 (copy)
    if v0(v70) == l_v6_30 then
        return true;
    else
        return false;
    end;
end;
v6 = "Vector3int16";
local l_v6_31 = v6 --[[ copy: 4 -> 36 ]];
v5.Vector3int16 = function(v72) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_31 (copy)
    if v0(v72) == l_v6_31 then
        return true;
    else
        return false;
    end;
end;
v6 = "Enum";
local l_v6_32 = v6 --[[ copy: 4 -> 37 ]];
v5.Enum = function(v74) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_32 (copy)
    if v0(v74) == l_v6_32 then
        return true;
    else
        return false;
    end;
end;
v6 = "EnumItem";
local l_v6_33 = v6 --[[ copy: 4 -> 38 ]];
v5.EnumItem = function(v76) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_33 (copy)
    if v0(v76) == l_v6_33 then
        return true;
    else
        return false;
    end;
end;
v6 = "RBXScriptSignal";
local l_v6_34 = v6 --[[ copy: 4 -> 39 ]];
v5.RBXScriptSignal = function(v78) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), l_v6_34 (copy)
    if v0(v78) == l_v6_34 then
        return true;
    else
        return false;
    end;
end;
v6 = "RBXScriptConnection";
v5.RBXScriptConnection = function(v79) --[[ Line: 7 ]]
    -- upvalues: v0 (copy), v6 (copy)
    if v0(v79) == v6 then
        return true;
    else
        return false;
    end;
end;
v5.literal = function(...) --[[ Line: 90 ]] --[[ Name: literal ]]
    -- upvalues: v5 (copy)
    local v80 = select("#", ...);
    if v80 == 1 then
        local v81 = ...;
        return function(v82) --[[ Line: 94 ]]
            -- upvalues: v81 (copy)
            if v82 ~= v81 then
                return false;
            else
                return true;
            end;
        end;
    else
        local v83 = {};
        for v84 = 1, v80 do
            local v85 = select(v84, ...);
            v83[v84] = v5.literal(v85);
        end;
        return v5.union(unpack(v83));
    end;
end;
v5.exactly = v5.literal;
v5.keyOf = function(v86) --[[ Line: 112 ]] --[[ Name: keyOf ]]
    -- upvalues: v5 (copy)
    local v87 = {};
    for v88 in pairs(v86) do
        v87[#v87 + 1] = v88;
    end;
    return v5.literal(unpack(v87));
end;
v5.valueOf = function(v89) --[[ Line: 120 ]] --[[ Name: valueOf ]]
    -- upvalues: v5 (copy)
    local v90 = {};
    for _, v92 in pairs(v89) do
        v90[#v90 + 1] = v92;
    end;
    return v5.literal(unpack(v90));
end;
v5.integer = function(v93) --[[ Line: 128 ]] --[[ Name: integer ]]
    -- upvalues: v5 (copy)
    if not v5.number(v93) then
        return false;
    elseif v93 % 1 == 0 then
        return true;
    else
        return false;
    end;
end;
v5.numberMin = function(v94) --[[ Line: 140 ]] --[[ Name: numberMin ]]
    -- upvalues: v5 (copy)
    return function(v95) --[[ Line: 141 ]]
        -- upvalues: v5 (ref), v94 (copy)
        if not v5.number(v95) then
            return false;
        elseif v94 <= v95 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberMax = function(v96) --[[ Line: 154 ]] --[[ Name: numberMax ]]
    -- upvalues: v5 (copy)
    return function(v97) --[[ Line: 155 ]]
        -- upvalues: v5 (ref), v96 (copy)
        if not v5.number(v97) then
            return false;
        elseif v97 <= v96 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberMinExclusive = function(v98) --[[ Line: 168 ]] --[[ Name: numberMinExclusive ]]
    -- upvalues: v5 (copy)
    return function(v99) --[[ Line: 169 ]]
        -- upvalues: v5 (ref), v98 (copy)
        if not v5.number(v99) then
            return false;
        elseif v98 < v99 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberMaxExclusive = function(v100) --[[ Line: 182 ]] --[[ Name: numberMaxExclusive ]]
    -- upvalues: v5 (copy)
    return function(v101) --[[ Line: 183 ]]
        -- upvalues: v5 (ref), v100 (copy)
        if not v5.number(v101) then
            return false;
        elseif v101 < v100 then
            return true;
        else
            return false;
        end;
    end;
end;
v5.numberPositive = v5.numberMinExclusive(0);
v5.numberNegative = v5.numberMaxExclusive(0);
v5.numberConstrained = function(v102, v103) --[[ Line: 199 ]] --[[ Name: numberConstrained ]]
    -- upvalues: v5 (copy)
    assert(v5.number(v102) and v5.number(v103));
    local v104 = v5.numberMin(v102);
    local v105 = v5.numberMax(v103);
    return function(v106) --[[ Line: 203 ]]
        -- upvalues: v104 (copy), v105 (copy)
        if not v104(v106) then
            return false;
        elseif not v105(v106) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.numberConstrainedExclusive = function(v107, v108) --[[ Line: 218 ]] --[[ Name: numberConstrainedExclusive ]]
    -- upvalues: v5 (copy)
    assert(v5.number(v107) and v5.number(v108));
    local v109 = v5.numberMinExclusive(v107);
    local v110 = v5.numberMaxExclusive(v108);
    return function(v111) --[[ Line: 222 ]]
        -- upvalues: v109 (copy), v110 (copy)
        if not v109(v111) then
            return false;
        elseif not v110(v111) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.match = function(v112) --[[ Line: 237 ]] --[[ Name: match ]]
    -- upvalues: v5 (copy)
    assert(v5.string(v112));
    return function(v113) --[[ Line: 239 ]]
        -- upvalues: v5 (ref), v112 (copy)
        if not v5.string(v113) then
            return false;
        elseif string.match(v113, v112) == nil then
            return false;
        else
            return true;
        end;
    end;
end;
v5.optional = function(v114) --[[ Line: 253 ]] --[[ Name: optional ]]
    -- upvalues: v5 (copy)
    assert(v5.callback(v114));
    return function(v115) --[[ Line: 255 ]]
        -- upvalues: v114 (copy)
        if v115 == nil then
            return true;
        elseif v114(v115) then
            return true;
        else
            return false;
        end;
    end;
end;
v5.tuple = function(...) --[[ Line: 268 ]] --[[ Name: tuple ]]
    local v116 = {
        ...
    };
    return function(...) --[[ Line: 270 ]]
        -- upvalues: v116 (copy)
        local v117 = {
            ...
        };
        for v118 = 1, #v116 do
            if v116[v118](v117[v118]) == false then
                return false;
            end;
        end;
        return true;
    end;
end;
v5.keys = function(v119) --[[ Line: 282 ]] --[[ Name: keys ]]
    -- upvalues: v5 (copy)
    assert(v5.callback(v119));
    return function(v120) --[[ Line: 284 ]]
        -- upvalues: v5 (ref), v119 (copy)
        if v5.table(v120) == false then
            return false;
        else
            for v121 in pairs(v120) do
                if v119(v121) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.values = function(v122) --[[ Line: 301 ]] --[[ Name: values ]]
    -- upvalues: v5 (copy)
    assert(v5.callback(v122));
    return function(v123) --[[ Line: 303 ]]
        -- upvalues: v5 (ref), v122 (copy)
        if v5.table(v123) == false then
            return false;
        else
            for _, v125 in pairs(v123) do
                if v122(v125) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.map = function(v126, v127) --[[ Line: 320 ]] --[[ Name: map ]]
    -- upvalues: v5 (copy)
    assert(v5.callback(v126), v5.callback(v127));
    local v128 = v5.keys(v126);
    local v129 = v5.values(v127);
    return function(v130) --[[ Line: 324 ]]
        -- upvalues: v128 (copy), v129 (copy)
        if not v128(v130) then
            return false;
        elseif not v129(v130) then
            return false;
        else
            return true;
        end;
    end;
end;
local v131 = v5.keys(v5.integer);
local l_v131_0 = v131 --[[ copy: 3 -> 40 ]];
v5.array = function(v133) --[[ Line: 342 ]] --[[ Name: array ]]
    -- upvalues: v5 (copy), l_v131_0 (copy)
    assert(v5.callback(v133));
    local v134 = v5.values(v133);
    return function(v135) --[[ Line: 345 ]]
        -- upvalues: l_v131_0 (ref), v134 (copy)
        if l_v131_0(v135) == false then
            return false;
        else
            local v136 = 0;
            for _, _ in ipairs(v135) do
                v136 = v136 + 1;
            end;
            for v139 in pairs(v135) do
                if v139 < 1 or v136 < v139 then
                    return false;
                end;
            end;
            if not v134(v135) then
                return false;
            else
                return true;
            end;
        end;
    end;
end;
v131 = v5.array(v5.callback);
local l_v131_1 = v131 --[[ copy: 3 -> 41 ]];
v5.union = function(...) --[[ Line: 378 ]] --[[ Name: union ]]
    -- upvalues: l_v131_1 (copy)
    local v141 = {
        ...
    };
    assert(l_v131_1(v141));
    return function(v142) --[[ Line: 381 ]]
        -- upvalues: v141 (copy)
        for _, v144 in pairs(v141) do
            if v144(v142) then
                return true;
            end;
        end;
        return false;
    end;
end;
v5.intersection = function(...) --[[ Line: 391 ]] --[[ Name: intersection ]]
    -- upvalues: l_v131_1 (copy)
    local v145 = {
        ...
    };
    assert(l_v131_1(v145));
    return function(v146) --[[ Line: 394 ]]
        -- upvalues: v145 (copy)
        for _, v148 in pairs(v145) do
            if not v148(v146) then
                return false;
            end;
        end;
        return true;
    end;
end;
v131 = v5.map(v5.any, v5.callback);
local l_v131_2 = v131 --[[ copy: 3 -> 42 ]];
v5.interface = function(v150) --[[ Line: 409 ]] --[[ Name: interface ]]
    -- upvalues: l_v131_2 (copy), v5 (copy)
    assert(l_v131_2(v150));
    return function(v151) --[[ Line: 411 ]]
        -- upvalues: v5 (ref), v150 (copy)
        if v5.table(v151) == false then
            return false;
        else
            for v152, v153 in pairs(v150) do
                if v153(v151[v152]) == false then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.strictInterface = function(v154) --[[ Line: 427 ]] --[[ Name: strictInterface ]]
    -- upvalues: l_v131_2 (copy), v5 (copy)
    assert(l_v131_2(v154));
    return function(v155) --[[ Line: 429 ]]
        -- upvalues: v5 (ref), v154 (copy)
        if v5.table(v155) == false then
            return false;
        else
            for v156, v157 in pairs(v154) do
                if v157(v155[v156]) == false then
                    return false;
                end;
            end;
            for v158 in pairs(v155) do
                if not v154[v158] then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v5.instanceOf = function(v159) --[[ Line: 453 ]] --[[ Name: instanceOf ]]
    -- upvalues: v5 (copy)
    assert(v5.string(v159));
    return function(v160) --[[ Line: 455 ]]
        -- upvalues: v5 (ref), v159 (copy)
        if not v5.Instance(v160) then
            return false;
        elseif v160.ClassName ~= v159 then
            return false;
        else
            return true;
        end;
    end;
end;
v5.instance = v5.instanceOf;
v5.instanceIsA = function(v161) --[[ Line: 470 ]] --[[ Name: instanceIsA ]]
    -- upvalues: v5 (copy)
    assert(v5.string(v161));
    return function(v162) --[[ Line: 472 ]]
        -- upvalues: v5 (ref), v161 (copy)
        if not v5.Instance(v162) then
            return false;
        elseif not v162:IsA(v161) then
            return false;
        else
            return true;
        end;
    end;
end;
v5.enum = function(v163) --[[ Line: 486 ]] --[[ Name: enum ]]
    -- upvalues: v5 (copy)
    assert(v5.Enum(v163));
    return function(v164) --[[ Line: 488 ]]
        -- upvalues: v5 (ref), v163 (copy)
        if not v5.EnumItem(v164) then
            return false;
        elseif v164.EnumType == v163 then
            return true;
        else
            return false;
        end;
    end;
end;
v131 = v5.tuple(v5.callback, v5.callback);
local l_v131_3 = v131 --[[ copy: 3 -> 43 ]];
v5.wrap = function(v166, v167) --[[ Line: 505 ]] --[[ Name: wrap ]]
    -- upvalues: l_v131_3 (copy)
    assert(l_v131_3(v166, v167));
    return function(...) --[[ Line: 507 ]]
        -- upvalues: v167 (copy), v166 (copy)
        assert(v167(...));
        return v166(...);
    end;
end;
v5.strict = function(v168) --[[ Line: 514 ]] --[[ Name: strict ]]
    return function(...) --[[ Line: 515 ]]
        -- upvalues: v168 (copy)
        assert(v168(...));
    end;
end;
v131 = v5.map(v5.string, v5.callback);
v5.children = function(v169) --[[ Line: 522 ]] --[[ Name: children ]]
    -- upvalues: v131 (copy), v5 (copy)
    assert(v131(v169));
    return function(v170) --[[ Line: 525 ]]
        -- upvalues: v5 (ref), v169 (copy)
        if not v5.Instance(v170) then
            return false;
        else
            local v171 = {};
            for _, v173 in pairs(v170:GetChildren()) do
                local l_Name_0 = v173.Name;
                if v169[l_Name_0] then
                    if v171[l_Name_0] then
                        return false;
                    else
                        v171[l_Name_0] = v173;
                    end;
                end;
            end;
            for v175, v176 in pairs(v169) do
                if not v176(v171[v175]) then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
return v5;