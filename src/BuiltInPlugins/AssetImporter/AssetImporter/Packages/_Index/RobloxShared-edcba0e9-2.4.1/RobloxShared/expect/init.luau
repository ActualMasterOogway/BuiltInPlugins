local l_Parent_0 = script.Parent.Parent;
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_toJSBoolean_0 = v2.Boolean.toJSBoolean;
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local function v8(v6, v7) --[[ Line: 20 ]] --[[ Name: hasKey ]]
    return rawget(v6, v7) ~= nil;
end;
local function v11(v9, v10) --[[ Line: 25 ]] --[[ Name: hasDefinedKey ]]
    return rawget(v9, v10) ~= nil;
end;
local function v16(v12, _) --[[ Line: 30 ]] --[[ Name: keys ]]
    local v14 = {};
    for v15 in pairs(v12) do
        if v12[v15] ~= nil then
            table.insert(v14, v15);
        end;
    end;
    return v14;
end;
local function v19(v17, v18) --[[ Line: 48 ]] --[[ Name: isA ]]
    -- upvalues: l_getType_0 (copy)
    return l_getType_0(v18) == v17;
end;
local function v23(v20) --[[ Line: 53 ]] --[[ Name: isAsymmetric ]]
    -- upvalues: l_toJSBoolean_0 (copy), l_getType_0 (copy)
    if l_toJSBoolean_0(v20) and typeof(v20) == "table" then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 55 ]]
            -- upvalues: v20 (copy)
            return v20.asymmetricMatch;
        end);
        if l_status_0 and l_getType_0(l_result_0) == "function" then
            return true;
        end;
    end;
    return false;
end;
local function _(v24, v25) --[[ Line: 66 ]] --[[ Name: asymmetricMatch ]]
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
local function v29(v30, v31, v32, v33, v34, v35) --[[ Line: 88 ]] --[[ Name: eq ]]
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
local function v50(v46, v47, v48, v49) --[[ Line: 207 ]] --[[ Name: equals ]]
    -- upvalues: v29 (copy), v8 (copy), v11 (copy)
    v48 = v48 or {};
    v49 = v49 or false;
    return v29(v46, v47, {}, {}, v48, v49 and v8 or v11);
end;
local function v53(v51, v52) --[[ Line: 214 ]] --[[ Name: hasPropertyInObject ]]
    -- upvalues: l_toJSBoolean_0 (copy)
    if not l_toJSBoolean_0(v51) or typeof(v51) ~= "table" then
        return false;
    else
        return v51[v52] ~= nil;
    end;
end;
local function _(v54) --[[ Line: 228 ]] --[[ Name: isObject ]]
    local v55 = false;
    if v54 ~= nil then
        v55 = typeof(v54) == "table";
    end;
    return v55;
end;
local function v59(v57) --[[ Line: 233 ]] --[[ Name: isObjectWithKeys ]]
    -- upvalues: l_Array_0 (copy)
    local v58 = false;
    if v57 ~= nil then
        v58 = typeof(v57) == "table";
    end;
    if v58 then
        v58 = true;
        if next(v57) ~= nil then
            v58 = not l_Array_0.isArray(v57);
        end;
    end;
    return v58;
end;
local function v60(v61, v62, v63, v64) --[[ Line: 238 ]] --[[ Name: iterableEquality ]]
    -- upvalues: l_getType_0 (copy), v60 (copy), v50 (copy)
    v63 = v63 or {};
    v64 = v64 or {};
    if l_getType_0(v61) ~= "set" or l_getType_0(v62) ~= "set" then
        return nil;
    else
        local v65 = #v63;
        while true do
            if v65 > 0 then
                if v63[v65] == v61 then
                    return v64[v65] == v62;
                else
                    v65 = v65 - 1;
                end;
            else
                table.insert(v63, v61);
                table.insert(v64, v62);
                local function v68(v66, v67) --[[ Line: 269 ]] --[[ Name: iterableEqualityWithStack ]]
                    -- upvalues: v60 (ref), v63 (ref), v64 (ref)
                    return v60(v66, v67, {
                        unpack(v63)
                    }, {
                        unpack(v64)
                    });
                end;
                if v61.size ~= nil then
                    if v61.size ~= v62.size then
                        return false;
                    elseif l_getType_0(v61) == "set" then
                        local v69 = true;
                        for _, v71 in v61:ipairs() do
                            if not v62:has(v71) then
                                local v72 = false;
                                for _, v74 in v62:ipairs() do
                                    if v50(v71, v74, {
                                        v68
                                    }) == true then
                                        v72 = true;
                                    end;
                                end;
                                if v72 == false then
                                    v69 = false;
                                    break;
                                end;
                            end;
                        end;
                        table.remove(v63);
                        table.remove(v64);
                        return v69;
                    end;
                end;
                return nil;
            end;
        end;
    end;
end;
local function v93(v75, v76) --[[ Line: 309 ]] --[[ Name: subsetEquality ]]
    -- upvalues: l_Array_0 (copy), l_Object_0 (copy), v50 (copy), v60 (copy), l_toJSBoolean_0 (copy)
    local function v77(v78) --[[ Line: 313 ]] --[[ Name: subsetEqualityWithContext ]]
        -- upvalues: l_Array_0 (ref), l_Object_0 (ref), v50 (ref), v60 (ref), l_toJSBoolean_0 (ref), v77 (copy)
        local v79 = v78 or {};
        return function(v80, v81) --[[ Line: 316 ]]
            -- upvalues: l_Array_0 (ref), l_Object_0 (ref), v79 (copy), v50 (ref), v60 (ref), l_toJSBoolean_0 (ref), v77 (ref)
            local v82 = false;
            if v81 ~= nil then
                v82 = typeof(v81) == "table";
            end;
            if v82 then
                v82 = true;
                if next(v81) ~= nil then
                    v82 = not l_Array_0.isArray(v81);
                end;
            end;
            if not v82 then
                return nil;
            else
                return l_Array_0.every(l_Object_0.keys(v81), function(v83) --[[ Line: 321 ]]
                    -- upvalues: v81 (copy), l_Array_0 (ref), v79 (ref), v50 (ref), v80 (copy), v60 (ref), l_toJSBoolean_0 (ref), v77 (ref)
                    local v84 = v81[v83];
                    local v85 = false;
                    if v84 ~= nil then
                        v85 = typeof(v84) == "table";
                    end;
                    if v85 then
                        v85 = true;
                        if next(v84) ~= nil then
                            v85 = not l_Array_0.isArray(v84);
                        end;
                    end;
                    if v85 then
                        if v79[v81[v83]] then
                            return v50(v80[v83], v81[v83], {
                                v60
                            });
                        else
                            v79[v81[v83]] = true;
                        end;
                    end;
                    v85 = false;
                    if v80 ~= nil then
                        v84 = v80;
                        v85 = not (not l_toJSBoolean_0(v84) or typeof(v84) ~= "table") and v84[v83] ~= nil and v50(v80[v83], v81[v83], {
                            v77(v79)
                        });
                    end;
                    v79[v81[v83]] = nil;
                    return v85;
                end);
            end;
        end;
    end;
    local v86 = {};
    return (function(v87, v88) --[[ Line: 316 ]]
        -- upvalues: l_Array_0 (ref), l_Object_0 (ref), v86 (copy), v50 (ref), v60 (ref), l_toJSBoolean_0 (ref), v77 (copy)
        local v89 = false;
        if v88 ~= nil then
            v89 = typeof(v88) == "table";
        end;
        if v89 then
            v89 = true;
            if next(v88) ~= nil then
                v89 = not l_Array_0.isArray(v88);
            end;
        end;
        if not v89 then
            return nil;
        else
            return l_Array_0.every(l_Object_0.keys(v88), function(v90) --[[ Line: 321 ]]
                -- upvalues: v88 (copy), l_Array_0 (ref), v86 (ref), v50 (ref), v87 (copy), v60 (ref), l_toJSBoolean_0 (ref), v77 (ref)
                local v91 = v88[v90];
                local v92 = false;
                if v91 ~= nil then
                    v92 = typeof(v91) == "table";
                end;
                if v92 then
                    v92 = true;
                    if next(v91) ~= nil then
                        v92 = not l_Array_0.isArray(v91);
                    end;
                end;
                if v92 then
                    if v86[v88[v90]] then
                        return v50(v87[v90], v88[v90], {
                            v60
                        });
                    else
                        v86[v88[v90]] = true;
                    end;
                end;
                v92 = false;
                if v87 ~= nil then
                    v91 = v87;
                    v92 = not (not l_toJSBoolean_0(v91) or typeof(v91) ~= "table") and v91[v90] ~= nil and v50(v87[v90], v88[v90], {
                        v77(v86)
                    });
                end;
                v86[v88[v90]] = nil;
                return v92;
            end);
        end;
    end)(v75, v76);
end;
local function v94(v95, v96, v97) --[[ Line: 365 ]] --[[ Name: getObjectSubset ]]
    -- upvalues: l_Array_0 (copy), v94 (copy), l_getType_0 (copy), v50 (copy), v60 (copy), v93 (copy), l_Object_0 (copy), l_toJSBoolean_0 (copy)
    local v98 = v97 or {};
    if l_Array_0.isArray(v95) then
        if l_Array_0.isArray(v96) and #v96 == #v95 then
            local v99 = {};
            for v100, v101 in ipairs(v96) do
                table.insert(v99, v94(v95[v100], v101));
            end;
            return v99;
        end;
    elseif l_getType_0(v95) == "DateTime" then
        return v95;
    else
        local v102 = false;
        if v95 ~= nil then
            v102 = typeof(v95) == "table";
        end;
        if v102 then
            v102 = false;
            if v96 ~= nil then
                v102 = typeof(v96) == "table";
            end;
            if v102 then
                if v50(v95, v96, {
                    v60, 
                    v93
                }) then
                    return v96;
                else
                    v102 = {};
                    v98[v95] = v102;
                    for _, v106 in ipairs(l_Array_0.filter(l_Object_0.keys(v95), function(v103) --[[ Line: 389 ]]
                        -- upvalues: v96 (copy), l_toJSBoolean_0 (ref)
                        local l_v96_0 = v96;
                        if not l_toJSBoolean_0(l_v96_0) or typeof(l_v96_0) ~= "table" then
                            return false;
                        else
                            return l_v96_0[v103] ~= nil;
                        end;
                    end)) do
                        if v98[v95[v106]] ~= nil then
                            v102[v106] = v98[v95[v106]];
                        else
                            v102[v106] = v94(v95[v106], v96[v106], v98);
                        end;
                    end;
                    if #l_Object_0.keys(v102) > 0 then
                        return v102;
                    end;
                end;
            end;
        end;
    end;
    return v95;
end;
return {
    equals = v50, 
    isA = v19, 
    isAsymmetric = v23, 
    getObjectSubset = v94, 
    iterableEquality = v60, 
    subsetEquality = v93, 
    isObjectWithKeys = v59, 
    hasPropertyInObject = v53
};