local l_Parent_0 = script.Parent.Parent;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_toJSBoolean_0 = v2.Boolean.toJSBoolean;
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local function v8(v6, v7) --[[ Line: 16 ]] --[[ Name: hasKey ]]
    return rawget(v6, v7) ~= nil;
end;
local function v11(v9, v10) --[[ Line: 21 ]] --[[ Name: hasDefinedKey ]]
    return rawget(v9, v10) ~= nil;
end;
local _ = function(v12, v13, _) --[[ Line: 26 ]] --[[ Name: keys ]]
    local v19 = (function(v15) --[[ Line: 31 ]] --[[ Name: getAllKeys ]]
        local v16 = {};
        for v17, _ in pairs(v15) do
            if v15[v17] ~= nil then
                table.insert(v16, v17);
            end;
        end;
        return v16;
    end)(v12);
    if not v13 then
        return v19;
    else
        return {};
    end;
end;
local function v23(v21, v22) --[[ Line: 58 ]] --[[ Name: isA ]]
    -- upvalues: l_getType_0 (copy)
    return l_getType_0(v22) == v21;
end;
local function v27(v24) --[[ Line: 63 ]] --[[ Name: isAsymmetric ]]
    -- upvalues: l_toJSBoolean_0 (copy), l_getType_0 (copy)
    if l_toJSBoolean_0(v24) and typeof(v24) == "table" then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 65 ]]
            -- upvalues: v24 (copy)
            return v24.asymmetricMatch;
        end);
        if l_status_0 and l_getType_0(l_result_0) == "function" then
            return true;
        end;
    end;
    return false;
end;
local function _(v28, v29) --[[ Line: 74 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: v27 (copy)
    local v30 = v27(v28);
    local v31 = v27(v29);
    if v30 and v31 then
        return nil;
    elseif v30 then
        return v28:asymmetricMatch(v29);
    elseif v31 then
        return v29:asymmetricMatch(v28);
    else
        return nil;
    end;
end;
local function v33(v34, v35, v36, v37, v38, v39) --[[ Line: 96 ]] --[[ Name: eq ]]
    -- upvalues: v27 (copy), l_Object_0 (copy), l_getType_0 (copy), l_Array_0 (copy), v33 (copy)
    local v40 = true;
    local v41 = v27(v34);
    local v42 = v27(v35);
    local v43 = if v41 and v42 then nil else if v41 then v34:asymmetricMatch(v35) else if v42 then v35:asymmetricMatch(v34) else nil;
    if v43 ~= nil then
        return v43;
    else
        for _, v45 in ipairs(v38) do
            local v46 = v45(v34, v35);
            if v46 ~= nil then
                return v46;
            end;
        end;
        if l_Object_0.is(v34, v35) then
            return true;
        else
            v41 = l_getType_0(v34);
            if v41 ~= l_getType_0(v35) then
                return false;
            elseif l_Array_0.isArray(v34) ~= l_Array_0.isArray(v35) then
                return false;
            elseif v41 == "boolean" or v41 == "string" or v41 == "number" or v41 == "userdata" then
                return l_Object_0.is(v34, v35);
            elseif v41 == "DateTime" then
                return v34 == v35;
            elseif v41 == "regexp" then
                return tostring(v34) == tostring(v35);
            elseif typeof(v34) ~= "table" or typeof(v35) ~= "table" then
                return false;
            else
                v42 = #v36;
                while true do
                    if v42 > 0 then
                        if v36[v42] == v34 then
                            return v37[v42] == v35;
                        elseif v37[v42] == v35 then
                            return false;
                        else
                            v42 = v42 - 1;
                        end;
                    else
                        table.insert(v36, v34);
                        table.insert(v37, v35);
                        local v47 = 0;
                        if l_Array_0.isArray(v34) then
                            v47 = #v34;
                            if v47 ~= #v35 then
                                return false;
                            else
                                while v47 > 0 do
                                    v40 = v33(v34[v47], v35[v47], v36, v37, v38, v39);
                                    if not v40 then
                                        return false;
                                    else
                                        v47 = v47 - 1;
                                    end;
                                end;
                            end;
                        end;
                        local v48 = l_Array_0.isArray(v34);
                        local v53 = (function(v49) --[[ Line: 31 ]] --[[ Name: getAllKeys ]]
                            local v50 = {};
                            for v51, _ in pairs(v49) do
                                if v49[v51] ~= nil then
                                    table.insert(v50, v51);
                                end;
                            end;
                            return v50;
                        end)(v34);
                        local v54 = if not v48 then v53 else {};
                        v47 = #v54;
                        v53 = l_Array_0.isArray(v35);
                        local v59 = (function(v55) --[[ Line: 31 ]] --[[ Name: getAllKeys ]]
                            local v56 = {};
                            for v57, _ in pairs(v55) do
                                if v55[v57] ~= nil then
                                    table.insert(v56, v57);
                                end;
                            end;
                            return v56;
                        end)(v35);
                        if #(if not v53 then v59 else {}) ~= v47 then
                            return false;
                        else
                            while true do
                                if v47 > 0 then
                                    v48 = v54[v47];
                                    v40 = rawget(v35, v48) ~= nil and v33(v34[v48], v35[v48], v36, v37, v38, v39);
                                    if not v40 then
                                        return false;
                                    else
                                        v47 = v47 - 1;
                                    end;
                                else
                                    table.remove(v36);
                                    table.remove(v37);
                                    return v40;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local function v64(v60, v61, v62, v63) --[[ Line: 235 ]] --[[ Name: equals ]]
    -- upvalues: v33 (copy), v8 (copy), v11 (copy)
    v62 = v62 or {};
    v63 = v63 or false;
    return v33(v60, v61, {}, {}, v62, v63 and v8 or v11);
end;
local function v67(v65, v66) --[[ Line: 247 ]] --[[ Name: hasPropertyInObject ]]
    -- upvalues: l_toJSBoolean_0 (copy)
    if not l_toJSBoolean_0(v65) or typeof(v65) ~= "table" then
        return false;
    else
        return v65[v66] ~= nil;
    end;
end;
local function _(v68) --[[ Line: 262 ]] --[[ Name: isObject ]]
    local v69 = false;
    if v68 ~= nil then
        v69 = typeof(v68) == "table";
    end;
    return v69;
end;
local function v73(v71) --[[ Line: 267 ]] --[[ Name: isObjectWithKeys ]]
    -- upvalues: l_Array_0 (copy)
    local v72 = false;
    if v71 ~= nil then
        v72 = typeof(v71) == "table";
    end;
    if v72 then
        v72 = true;
        if next(v71) ~= nil then
            v72 = not l_Array_0.isArray(v71);
        end;
    end;
    return v72;
end;
local function v74(v75, v76, v77, v78) --[[ Line: 272 ]] --[[ Name: iterableEquality ]]
    -- upvalues: l_getType_0 (copy), v74 (copy), v64 (copy)
    v77 = v77 or {};
    v78 = v78 or {};
    if l_getType_0(v75) ~= "set" or l_getType_0(v76) ~= "set" then
        return nil;
    else
        local v79 = #v77;
        while true do
            if v79 > 0 then
                if v77[v79] == v75 then
                    return v78[v79] == v76;
                else
                    v79 = v79 - 1;
                end;
            else
                table.insert(v77, v75);
                table.insert(v78, v76);
                local function v82(v80, v81) --[[ Line: 311 ]] --[[ Name: iterableEqualityWithStack ]]
                    -- upvalues: v74 (ref), v77 (ref), v78 (ref)
                    return v74(v80, v81, {
                        unpack(v77)
                    }, {
                        unpack(v78)
                    });
                end;
                if v75.size ~= nil then
                    if v75.size ~= v76.size then
                        return false;
                    elseif l_getType_0(v75) == "set" then
                        local v83 = true;
                        for _, v85 in v75:ipairs() do
                            if not v76:has(v85) then
                                local v86 = false;
                                for _, v88 in v76:ipairs() do
                                    if v64(v85, v88, {
                                        v82
                                    }) == true then
                                        v86 = true;
                                    end;
                                end;
                                if v86 == false then
                                    v83 = false;
                                    break;
                                end;
                            end;
                        end;
                        table.remove(v77);
                        table.remove(v78);
                        return v83;
                    end;
                end;
                return nil;
            end;
        end;
    end;
end;
local function v111(v89, v90) --[[ Line: 351 ]] --[[ Name: subsetEquality ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v64 (copy), v74 (copy), l_toJSBoolean_0 (copy)
    local function v91(v92) --[[ Line: 362 ]] --[[ Name: subsetEqualityWithContext ]]
        -- upvalues: v90 (copy), l_Array_0 (ref), l_Object_0 (ref), v64 (ref), v74 (ref), l_toJSBoolean_0 (ref), v91 (copy)
        local l_v90_0 = v90;
        local v94 = false;
        if l_v90_0 ~= nil then
            v94 = typeof(l_v90_0) == "table";
        end;
        if v94 then
            v94 = true;
            if next(l_v90_0) ~= nil then
                v94 = not l_Array_0.isArray(l_v90_0);
            end;
        end;
        if not v94 then
            return nil;
        else
            return function(v95, v96) --[[ Line: 369 ]]
                -- upvalues: v92 (ref), l_Array_0 (ref), l_Object_0 (ref), v64 (ref), v74 (ref), l_toJSBoolean_0 (ref), v91 (ref)
                v92 = v92 or {};
                local v97 = false;
                if v96 ~= nil then
                    v97 = typeof(v96) == "table";
                end;
                if v97 then
                    v97 = true;
                    if next(v96) ~= nil then
                        v97 = not l_Array_0.isArray(v96);
                    end;
                end;
                if not v97 then
                    return nil;
                else
                    return l_Array_0.every(l_Object_0.keys(v96), function(v98) --[[ Line: 378 ]]
                        -- upvalues: v96 (copy), l_Array_0 (ref), v92 (ref), v64 (ref), v95 (copy), v74 (ref), l_toJSBoolean_0 (ref), v91 (ref)
                        local v99 = v96[v98];
                        local v100 = false;
                        if v99 ~= nil then
                            v100 = typeof(v99) == "table";
                        end;
                        if v100 then
                            v100 = true;
                            if next(v99) ~= nil then
                                v100 = not l_Array_0.isArray(v99);
                            end;
                        end;
                        if v100 then
                            if v92[v96[v98]] then
                                return v64(v95[v98], v96[v98], {
                                    v74
                                });
                            else
                                v92[v96[v98]] = true;
                            end;
                        end;
                        v100 = false;
                        if v95 ~= nil then
                            v99 = v95;
                            v100 = not (not l_toJSBoolean_0(v99) or typeof(v99) ~= "table") and v99[v98] ~= nil and v64(v95[v98], v96[v98], {
                                v91(v92)
                            });
                        end;
                        v92[v96[v98]] = nil;
                        return v100;
                    end);
                end;
            end;
        end;
    end;
    local v101 = nil;
    local v102 = false;
    if v90 ~= nil then
        v102 = typeof(v90) == "table";
    end;
    if v102 then
        v102 = true;
        if next(v90) ~= nil then
            v102 = not l_Array_0.isArray(v90);
        end;
    end;
    local v103;
    if not v102 then
        v103 = nil;
        --[[ close >= 4 ]]
    else
        do
            local l_v101_0 = v101;
            v103 = function(v105, v106) --[[ Line: 369 ]]
                -- upvalues: l_v101_0 (ref), l_Array_0 (ref), l_Object_0 (ref), v64 (ref), v74 (ref), l_toJSBoolean_0 (ref), v91 (copy)
                l_v101_0 = l_v101_0 or {};
                local v107 = false;
                if v106 ~= nil then
                    v107 = typeof(v106) == "table";
                end;
                if v107 then
                    v107 = true;
                    if next(v106) ~= nil then
                        v107 = not l_Array_0.isArray(v106);
                    end;
                end;
                if not v107 then
                    return nil;
                else
                    return l_Array_0.every(l_Object_0.keys(v106), function(v108) --[[ Line: 378 ]]
                        -- upvalues: v106 (copy), l_Array_0 (ref), l_v101_0 (ref), v64 (ref), v105 (copy), v74 (ref), l_toJSBoolean_0 (ref), v91 (ref)
                        local v109 = v106[v108];
                        local v110 = false;
                        if v109 ~= nil then
                            v110 = typeof(v109) == "table";
                        end;
                        if v110 then
                            v110 = true;
                            if next(v109) ~= nil then
                                v110 = not l_Array_0.isArray(v109);
                            end;
                        end;
                        if v110 then
                            if l_v101_0[v106[v108]] then
                                return v64(v105[v108], v106[v108], {
                                    v74
                                });
                            else
                                l_v101_0[v106[v108]] = true;
                            end;
                        end;
                        v110 = false;
                        if v105 ~= nil then
                            v109 = v105;
                            v110 = not (not l_toJSBoolean_0(v109) or typeof(v109) ~= "table") and v109[v108] ~= nil and v64(v105[v108], v106[v108], {
                                v91(l_v101_0)
                            });
                        end;
                        l_v101_0[v106[v108]] = nil;
                        return v110;
                    end);
                end;
            end;
        end;
    end;
    if v103 then
        return v103(v89, v90);
    else
        return v103;
    end;
end;
local function v112(v113, v114, v115) --[[ Line: 430 ]] --[[ Name: getObjectSubset ]]
    -- upvalues: l_Array_0 (copy), v112 (copy), l_getType_0 (copy), v64 (copy), v74 (copy), v111 (copy), l_Object_0 (copy), l_toJSBoolean_0 (copy)
    v115 = v115 or {};
    if l_Array_0.isArray(v113) then
        if l_Array_0.isArray(v114) and #v114 == #v113 then
            local v116 = {};
            for v117, v118 in ipairs(v114) do
                table.insert(v116, v112(v113[v117], v118));
            end;
            return v116;
        end;
    elseif l_getType_0(v113) == "DateTime" then
        return v113;
    else
        local v119 = false;
        if v113 ~= nil then
            v119 = typeof(v113) == "table";
        end;
        if v119 then
            v119 = false;
            if v114 ~= nil then
                v119 = typeof(v114) == "table";
            end;
            if v119 then
                if v64(v113, v114, {
                    v74, 
                    v111
                }) then
                    return v114;
                else
                    v119 = {};
                    v115[v113] = v119;
                    for _, v123 in ipairs(l_Array_0.filter(l_Object_0.keys(v113), function(v120) --[[ Line: 460 ]]
                        -- upvalues: v114 (copy), l_toJSBoolean_0 (ref)
                        local l_v114_0 = v114;
                        if not l_toJSBoolean_0(l_v114_0) or typeof(l_v114_0) ~= "table" then
                            return false;
                        else
                            return l_v114_0[v120] ~= nil;
                        end;
                    end)) do
                        if v115[v113[v123]] ~= nil then
                            v119[v123] = v115[v113[v123]];
                        else
                            v119[v123] = v112(v113[v123], v114[v123], v115);
                        end;
                    end;
                    if #l_Object_0.keys(v119) > 0 then
                        return v119;
                    end;
                end;
            end;
        end;
    end;
    return v113;
end;
return {
    equals = v64, 
    isA = v23, 
    isAsymmetric = v27, 
    getObjectSubset = v112, 
    iterableEquality = v74, 
    subsetEquality = v111, 
    isObjectWithKeys = v73, 
    hasPropertyInObject = v67
};