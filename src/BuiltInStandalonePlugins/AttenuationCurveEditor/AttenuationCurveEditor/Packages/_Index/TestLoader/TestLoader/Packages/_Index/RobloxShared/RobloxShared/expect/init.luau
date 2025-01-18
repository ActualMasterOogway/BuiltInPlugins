local l_Parent_0 = script.Parent.Parent;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_toJSBoolean_0 = v2.Boolean.toJSBoolean;
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local function v8(v6, v7) --[[ Line: 27 ]] --[[ Name: hasKey ]]
    return rawget(v6, v7) ~= nil;
end;
local function v11(v9, v10) --[[ Line: 32 ]] --[[ Name: hasDefinedKey ]]
    return rawget(v9, v10) ~= nil;
end;
local function v16(v12, _) --[[ Line: 37 ]] --[[ Name: keys ]]
    local v14 = {};
    for v15 in pairs(v12) do
        if v12[v15] ~= nil then
            table.insert(v14, v15);
        end;
    end;
    return v14;
end;
local function v19(v17, v18) --[[ Line: 55 ]] --[[ Name: isA ]]
    -- upvalues: l_getType_0 (copy)
    return l_getType_0(v18) == v17;
end;
local function v23(v20) --[[ Line: 60 ]] --[[ Name: isAsymmetric ]]
    -- upvalues: l_toJSBoolean_0 (copy), l_getType_0 (copy)
    if l_toJSBoolean_0(v20) and typeof(v20) == "table" then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 62 ]]
            -- upvalues: v20 (copy)
            return v20.asymmetricMatch;
        end);
        if l_status_0 and l_getType_0(l_result_0) == "function" then
            return true;
        end;
    end;
    return false;
end;
local function _(v24, v25) --[[ Line: 73 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: v23 (copy)
    local v26 = v23(v24);
    local v27 = v23(v25);
    if v26 and v27 then
        return nil;
    elseif v26 then
        return v24:asymmetricMatch(v25);
    elseif v27 then
        return v25:asymmetricMatch(v24);
    else
        return nil;
    end;
end;
local function v29(v30, v31, v32, v33, v34, v35) --[[ Line: 95 ]] --[[ Name: eq ]]
    -- upvalues: v23 (copy), l_Object_0 (copy), l_getType_0 (copy), l_Array_0 (copy), v16 (copy), v29 (copy)
    local v36 = true;
    local v37 = v23(v30);
    local v38 = v23(v31);
    local v39 = if v37 and v38 then nil else if v37 then v30:asymmetricMatch(v31) else if v38 then v31:asymmetricMatch(v30) else nil;
    if v39 ~= nil then
        return v39;
    else
        for _, v41 in ipairs(v34) do
            local v42 = v41(v30, v31);
            if v42 ~= nil then
                return v42;
            end;
        end;
        if l_Object_0.is(v30, v31) then
            return true;
        else
            v37 = l_getType_0(v30);
            if v37 ~= l_getType_0(v31) then
                return false;
            elseif l_Array_0.isArray(v30) ~= l_Array_0.isArray(v31) then
                return false;
            elseif v37 == "boolean" or v37 == "string" or v37 == "number" or v37 == "userdata" then
                return l_Object_0.is(v30, v31);
            elseif v37 == "DateTime" then
                return v30 == v31;
            elseif v37 == "regexp" then
                return tostring(v30) == tostring(v31);
            elseif typeof(v30) ~= "table" or typeof(v31) ~= "table" then
                return false;
            else
                v38 = #v32;
                while true do
                    if v38 > 0 then
                        if v32[v38] == v30 then
                            return v33[v38] == v31;
                        elseif v33[v38] == v31 then
                            return false;
                        else
                            v38 = v38 - 1;
                        end;
                    else
                        table.insert(v32, v30);
                        table.insert(v33, v31);
                        if l_Array_0.isArray(v30) and #v30 ~= #v31 then
                            return false;
                        else
                            local v43 = v16(v30, v35);
                            local v44 = #v43;
                            if #v16(v31, v35) ~= v44 then
                                return false;
                            else
                                while true do
                                    if v44 > 0 then
                                        local v45 = v43[v44];
                                        v36 = rawget(v31, v45) ~= nil and v29(v30[v45], v31[v45], v32, v33, v34, v35);
                                        if not v36 then
                                            return false;
                                        else
                                            v44 = v44 - 1;
                                        end;
                                    else
                                        table.remove(v32);
                                        table.remove(v33);
                                        return v36;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
local function v50(v46, v47, v48, v49) --[[ Line: 214 ]] --[[ Name: equals ]]
    -- upvalues: v29 (copy), v8 (copy), v11 (copy)
    v48 = v48 or {};
    v49 = v49 or false;
    return v29(v46, v47, {}, {}, v48, v49 and v8 or v11);
end;
local function v53(v51, v52) --[[ Line: 221 ]] --[[ Name: hasPropertyInObject ]]
    -- upvalues: l_toJSBoolean_0 (copy)
    if not l_toJSBoolean_0(v51) or typeof(v51) ~= "table" then
        return false;
    else
        return v51[v52] ~= nil;
    end;
end;
local function _(v54) --[[ Line: 235 ]] --[[ Name: isObject ]]
    -- upvalues: l_getType_0 (copy)
    local v55 = false;
    if v54 ~= nil then
        v55 = l_getType_0(v54) == "table";
    end;
    return v55;
end;
local function v59(v57) --[[ Line: 240 ]] --[[ Name: isObjectWithKeys ]]
    -- upvalues: l_getType_0 (copy), l_Array_0 (copy)
    local v58 = false;
    if v57 ~= nil then
        v58 = l_getType_0(v57) == "table";
    end;
    if v58 then
        v58 = true;
        if next(v57) ~= nil then
            v58 = not l_Array_0.isArray(v57);
        end;
    end;
    return v58;
end;
local function v60(v61, v62, v63, v64) --[[ Line: 245 ]] --[[ Name: iterableEquality ]]
    -- upvalues: l_getType_0 (copy), v60 (copy), v50 (copy)
    local v65 = v63 or {};
    local v66 = v64 or {};
    if l_getType_0(v61) ~= "set" or l_getType_0(v62) ~= "set" then
        return nil;
    else
        local v67 = #v65;
        while true do
            if v67 > 0 then
                if v65[v67] == v61 then
                    return v66[v67] == v62;
                else
                    v67 = v67 - 1;
                end;
            else
                table.insert(v65, v61);
                table.insert(v66, v62);
                local function v70(v68, v69) --[[ Line: 276 ]] --[[ Name: iterableEqualityWithStack ]]
                    -- upvalues: v60 (ref), v65 (copy), v66 (copy)
                    return v60(v68, v69, {
                        unpack(v65)
                    }, {
                        unpack(v66)
                    });
                end;
                if v61.size ~= nil then
                    if v61.size ~= v62.size then
                        return false;
                    elseif l_getType_0(v61) == "set" then
                        local v71 = true;
                        for _, v73 in v61:ipairs() do
                            if not v62:has(v73) then
                                local v74 = false;
                                for _, v76 in v62:ipairs() do
                                    if v50(v73, v76, {
                                        v70
                                    }) == true then
                                        v74 = true;
                                    end;
                                end;
                                if v74 == false then
                                    v71 = false;
                                    break;
                                end;
                            end;
                        end;
                        table.remove(v65);
                        table.remove(v66);
                        return v71;
                    end;
                end;
                return nil;
            end;
        end;
    end;
end;
local function v95(v77, v78) --[[ Line: 316 ]] --[[ Name: subsetEquality ]]
    -- upvalues: l_getType_0 (copy), l_Array_0 (copy), l_Object_0 (copy), v50 (copy), v60 (copy), l_toJSBoolean_0 (copy)
    local function v79(v80) --[[ Line: 320 ]] --[[ Name: subsetEqualityWithContext ]]
        -- upvalues: l_getType_0 (ref), l_Array_0 (ref), l_Object_0 (ref), v50 (ref), v60 (ref), l_toJSBoolean_0 (ref), v79 (copy)
        local v81 = v80 or {};
        return function(v82, v83) --[[ Line: 323 ]]
            -- upvalues: l_getType_0 (ref), l_Array_0 (ref), l_Object_0 (ref), v81 (copy), v50 (ref), v60 (ref), l_toJSBoolean_0 (ref), v79 (ref)
            local v84 = false;
            if v83 ~= nil then
                v84 = l_getType_0(v83) == "table";
            end;
            if v84 then
                v84 = true;
                if next(v83) ~= nil then
                    v84 = not l_Array_0.isArray(v83);
                end;
            end;
            if not v84 then
                return nil;
            else
                return l_Array_0.every(l_Object_0.keys(v83), function(v85) --[[ Line: 328 ]]
                    -- upvalues: v83 (copy), l_getType_0 (ref), l_Array_0 (ref), v81 (ref), v50 (ref), v82 (copy), v60 (ref), l_toJSBoolean_0 (ref), v79 (ref)
                    local v86 = v83[v85];
                    local v87 = false;
                    if v86 ~= nil then
                        v87 = l_getType_0(v86) == "table";
                    end;
                    if v87 then
                        v87 = true;
                        if next(v86) ~= nil then
                            v87 = not l_Array_0.isArray(v86);
                        end;
                    end;
                    if v87 then
                        if v81[v83[v85]] then
                            return v50(v82[v85], v83[v85], {
                                v60
                            });
                        else
                            v81[v83[v85]] = true;
                        end;
                    end;
                    v87 = false;
                    if v82 ~= nil then
                        v86 = v82;
                        v87 = not (not l_toJSBoolean_0(v86) or typeof(v86) ~= "table") and v86[v85] ~= nil and v50(v82[v85], v83[v85], {
                            v79(v81)
                        });
                    end;
                    v81[v83[v85]] = nil;
                    return v87;
                end);
            end;
        end;
    end;
    local v88 = {};
    return (function(v89, v90) --[[ Line: 323 ]]
        -- upvalues: l_getType_0 (ref), l_Array_0 (ref), l_Object_0 (ref), v88 (copy), v50 (ref), v60 (ref), l_toJSBoolean_0 (ref), v79 (copy)
        local v91 = false;
        if v90 ~= nil then
            v91 = l_getType_0(v90) == "table";
        end;
        if v91 then
            v91 = true;
            if next(v90) ~= nil then
                v91 = not l_Array_0.isArray(v90);
            end;
        end;
        if not v91 then
            return nil;
        else
            return l_Array_0.every(l_Object_0.keys(v90), function(v92) --[[ Line: 328 ]]
                -- upvalues: v90 (copy), l_getType_0 (ref), l_Array_0 (ref), v88 (ref), v50 (ref), v89 (copy), v60 (ref), l_toJSBoolean_0 (ref), v79 (ref)
                local v93 = v90[v92];
                local v94 = false;
                if v93 ~= nil then
                    v94 = l_getType_0(v93) == "table";
                end;
                if v94 then
                    v94 = true;
                    if next(v93) ~= nil then
                        v94 = not l_Array_0.isArray(v93);
                    end;
                end;
                if v94 then
                    if v88[v90[v92]] then
                        return v50(v89[v92], v90[v92], {
                            v60
                        });
                    else
                        v88[v90[v92]] = true;
                    end;
                end;
                v94 = false;
                if v89 ~= nil then
                    v93 = v89;
                    v94 = not (not l_toJSBoolean_0(v93) or typeof(v93) ~= "table") and v93[v92] ~= nil and v50(v89[v92], v90[v92], {
                        v79(v88)
                    });
                end;
                v88[v90[v92]] = nil;
                return v94;
            end);
        end;
    end)(v77, v78);
end;
local function v96(v97, v98, v99) --[[ Line: 372 ]] --[[ Name: getObjectSubset ]]
    -- upvalues: l_Array_0 (copy), v96 (copy), l_getType_0 (copy), v50 (copy), v60 (copy), v95 (copy), l_Object_0 (copy), l_toJSBoolean_0 (copy)
    local v100 = v99 or {};
    if l_Array_0.isArray(v97) then
        if l_Array_0.isArray(v98) and #v98 == #v97 then
            local v101 = {};
            for v102, v103 in ipairs(v98) do
                table.insert(v101, v96(v97[v102], v103));
            end;
            return v101;
        end;
    elseif l_getType_0(v97) == "DateTime" then
        return v97;
    else
        local v104 = false;
        if v97 ~= nil then
            v104 = l_getType_0(v97) == "table";
        end;
        if v104 then
            v104 = false;
            if v98 ~= nil then
                v104 = l_getType_0(v98) == "table";
            end;
            if v104 then
                if v50(v97, v98, {
                    v60, 
                    v95
                }) then
                    return v98;
                else
                    v104 = {};
                    v100[v97] = v104;
                    for _, v108 in ipairs(l_Array_0.filter(l_Object_0.keys(v97), function(v105) --[[ Line: 396 ]]
                        -- upvalues: v98 (copy), l_toJSBoolean_0 (ref)
                        local l_v98_0 = v98;
                        if not l_toJSBoolean_0(l_v98_0) or typeof(l_v98_0) ~= "table" then
                            return false;
                        else
                            return l_v98_0[v105] ~= nil;
                        end;
                    end)) do
                        if v100[v97[v108]] ~= nil then
                            v104[v108] = v100[v97[v108]];
                        else
                            v104[v108] = v96(v97[v108], v98[v108], v100);
                        end;
                    end;
                    if #l_Object_0.keys(v104) > 0 then
                        return v104;
                    end;
                end;
            end;
        end;
    end;
    return v97;
end;
return {
    equals = v50, 
    isA = v19, 
    isAsymmetric = v23, 
    getObjectSubset = v96, 
    iterableEquality = v60, 
    subsetEquality = v95, 
    isObjectWithKeys = v59, 
    hasPropertyInObject = v53
};