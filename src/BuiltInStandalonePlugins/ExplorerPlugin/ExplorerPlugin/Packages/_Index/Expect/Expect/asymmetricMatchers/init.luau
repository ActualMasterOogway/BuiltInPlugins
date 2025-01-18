local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Boolean_0 = v2.Boolean;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_Symbol_0 = v2.Symbol;
local l_instanceof_0 = v2.instanceof;
local _ = require(l_Parent_1.RegExp);
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v11 = {};
local l_pluralize_0 = require(l_Parent_1.JestUtil).pluralize;
local v13 = require(l_Parent_0.jasmineUtils);
local l_equals_0 = v13.equals;
local l_hasProperty_0 = v13.hasProperty;
local l_isA_0 = v13.isA;
local l_isUndefined_0 = v13.isUndefined;
local l_getState_0 = require(l_Parent_0.jestMatchersObject_extracted).getState;
local _ = require(l_Parent_0.types);
local v20 = require(l_Parent_0.utils);
local l_iterableEquality_0 = v20.iterableEquality;
local l_subsetEquality_0 = v20.subsetEquality;
local v23 = l_Object_0.freeze(l_Object_0.assign({}, v11, {
    iterableEquality = l_iterableEquality_0, 
    subsetEquality = l_subsetEquality_0
}));
local v24 = {};
v24.__index = v24;
v24.new = function(v25, v26) --[[ Line: 116 ]] --[[ Name: new ]]
    -- upvalues: l_Symbol_0 (copy), v24 (copy)
    local v27 = v26 ~= nil and v26;
    local v28 = {
        sample = v25, 
        inverse = v27 ~= nil and v27, 
        ["$$typeof"] = l_Symbol_0.for_("jest.asymmetricMatcher")
    };
    setmetatable(v28, v24);
    return v28;
end;
v24.getMatcherContext = function(v29) --[[ Line: 138 ]] --[[ Name: getMatcherContext ]]
    -- upvalues: l_Object_0 (copy), l_getState_0 (copy), l_equals_0 (copy), v23 (copy)
    return l_Object_0.assign({}, l_getState_0(), {
        equals = l_equals_0, 
        isNot = v29.inverse, 
        utils = v23
    });
end;
local v30 = {};
v30.__index = v30;
setmetatable(v30, v24);
v30.new = function(v31) --[[ Line: 166 ]] --[[ Name: new ]]
    -- upvalues: v24 (copy), v30 (copy)
    if typeof(v31) ~= "table" and typeof(v31) ~= "string" then
        error("any() expects to be passed a typename string or a prototype class. " .. "Please pass one or use anything() to match any object.");
    end;
    local v32 = v24.new(v31);
    setmetatable(v32, v30);
    return v32;
end;
v30.asymmetricMatch = function(v33, v34) --[[ Line: 178 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_getType_0 (copy), l_instanceof_0 (copy)
    local v35 = l_getType_0(v33.sample);
    local v36 = l_getType_0(v34);
    if v35 == "table" and v36 == "table" or v35 == "error" and v36 == "error" then
        return l_instanceof_0(v34, v33.sample);
    elseif v35 == "string" and v33.sample == v36 then
        return true;
    else
        return false;
    end;
end;
v30.toString = function(_) --[[ Line: 192 ]] --[[ Name: toString ]]
    return "Any";
end;
v30.getExpectedType = function(v38) --[[ Line: 196 ]] --[[ Name: getExpectedType ]]
    return (tostring(v38.sample));
end;
v30.toAsymmetricMatcher = function(v39) --[[ Line: 201 ]] --[[ Name: toAsymmetricMatcher ]]
    return "Any<" .. tostring(v39.sample) .. ">";
end;
local v40 = {};
v40.__index = v40;
setmetatable(v40, v24);
v40.new = function(v41) --[[ Line: 208 ]] --[[ Name: new ]]
    -- upvalues: v24 (copy), v40 (copy)
    local v42 = v24.new(v41);
    setmetatable(v42, v40);
    return v42;
end;
v40.asymmetricMatch = function(_, v44) --[[ Line: 214 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_isUndefined_0 (copy)
    return not l_isUndefined_0(v44);
end;
v40.toString = function(_) --[[ Line: 219 ]] --[[ Name: toString ]]
    return "Anything";
end;
v40.toAsymmetricMatcher = function(_) --[[ Line: 225 ]] --[[ Name: toAsymmetricMatcher ]]
    return "Anything";
end;
local v47 = {};
v47.__index = v47;
setmetatable(v47, v24);
v47.new = function(v48) --[[ Line: 233 ]] --[[ Name: new ]]
    -- upvalues: v24 (copy), v47 (copy)
    local v49 = v24.new(v48);
    setmetatable(v49, v47);
    return v49;
end;
v47.asymmetricMatch = function(_, v51) --[[ Line: 239 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_isUndefined_0 (copy)
    return l_isUndefined_0(v51);
end;
v47.toString = function(_) --[[ Line: 243 ]] --[[ Name: toString ]]
    return "Nothing";
end;
v47.getExpectedType = function(_) --[[ Line: 247 ]] --[[ Name: getExpectedType ]]
    return "nil";
end;
v47.toAsymmetricMatcher = function(_) --[[ Line: 251 ]] --[[ Name: toAsymmetricMatcher ]]
    return "Nothing";
end;
local v55 = {};
v55.__index = v55;
setmetatable(v55, v24);
v55.new = function(v56, v57) --[[ Line: 259 ]] --[[ Name: new ]]
    -- upvalues: v24 (copy), v55 (copy)
    if v57 == nil then
        v57 = false;
    end;
    local v58 = v24.new(v56, v57);
    setmetatable(v58, v55);
    return v58;
end;
v55.asymmetricMatch = function(v59, v60) --[[ Line: 266 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_Array_0 (copy), l_equals_0 (copy)
    if not l_Array_0.isArray(v59.sample) then
        error(string.format("You must provide an array to %s, not '%s'.", v59:toString(), (typeof(v59.sample))));
    end;
    local v61 = false;
    if #v59.sample == 0 then
        v61 = true;
    elseif l_Array_0.isArray(v60) and l_Array_0.every(v59.sample, function(v62) --[[ Line: 276 ]]
        -- upvalues: l_Array_0 (ref), v60 (copy), l_equals_0 (ref)
        return l_Array_0.some(v60, function(v63) --[[ Line: 277 ]]
            -- upvalues: l_equals_0 (ref), v62 (copy)
            return l_equals_0(v62, v63);
        end);
    end) then
        v61 = true;
    end;
    if v59.inverse then
        return not v61;
    else
        return v61;
    end;
end;
v55.toString = function(v64) --[[ Line: 291 ]] --[[ Name: toString ]]
    if v64.inverse then
        return "ArrayNotContaining";
    else
        return "ArrayContaining";
    end;
end;
v55.getExpectedType = function(_) --[[ Line: 298 ]] --[[ Name: getExpectedType ]]
    return "array";
end;
local v66 = {};
v66.__index = v66;
setmetatable(v66, v24);
v66.new = function(v67, v68) --[[ Line: 305 ]] --[[ Name: new ]]
    -- upvalues: v24 (copy), v66 (copy)
    if v68 == nil then
        v68 = false;
    end;
    local v69 = v24.new(v67, v68);
    setmetatable(v69, v66);
    return v69;
end;
v66.asymmetricMatch = function(v70, v71) --[[ Line: 312 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_hasProperty_0 (copy), l_equals_0 (copy)
    if typeof(v70.sample) ~= "table" then
        error(string.format("You must provide an object to %s, not '%s'.", v70:toString(), (typeof(v70.sample))));
    end;
    local v72 = true;
    for v73, v74 in pairs(v70.sample) do
        if not l_hasProperty_0(v71, v73) or not l_equals_0(v74, v71[v73]) then
            v72 = false;
            break;
        end;
    end;
    if v70.inverse then
        return not v72;
    else
        return v72;
    end;
end;
v66.toString = function(v75) --[[ Line: 330 ]] --[[ Name: toString ]]
    if v75.inverse then
        return "ObjectNotContaining";
    else
        return "ObjectContaining";
    end;
end;
v66.getExpectedType = function(_) --[[ Line: 337 ]] --[[ Name: getExpectedType ]]
    return "object";
end;
local v77 = {};
v77.__index = v77;
setmetatable(v77, v24);
v77.new = function(v78, v79) --[[ Line: 344 ]] --[[ Name: new ]]
    -- upvalues: l_isA_0 (copy), v24 (copy), v77 (copy)
    if v79 == nil then
        v79 = false;
    end;
    if not l_isA_0("string", v78) then
        error("Expected is not a String");
    end;
    local v80 = v24.new(v78, v79);
    setmetatable(v80, v77);
    return v80;
end;
v77.asymmetricMatch = function(v81, v82) --[[ Line: 354 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_isA_0 (copy)
    local v83 = l_isA_0("string", v82) and v82:find(v81.sample, 1, true);
    if v81.inverse then
        return not v83;
    else
        return not not v83;
    end;
end;
v77.toString = function(v84) --[[ Line: 363 ]] --[[ Name: toString ]]
    if v84.inverse then
        return "StringNotContaining";
    else
        return "StringContaining";
    end;
end;
v77.getExpectedType = function(_) --[[ Line: 370 ]] --[[ Name: getExpectedType ]]
    return "string";
end;
local v86 = {};
v86.__index = v86;
setmetatable(v86, v24);
v86.new = function(v87, v88) --[[ Line: 377 ]] --[[ Name: new ]]
    -- upvalues: l_isA_0 (copy), v24 (copy), v86 (copy)
    if v88 == nil then
        v88 = false;
    end;
    if not l_isA_0("string", v87) and not l_isA_0("regexp", v87) then
        error("Expected is not a String");
    end;
    local v89 = v24.new(v87, v88);
    setmetatable(v89, v86);
    return v89;
end;
v86.asymmetricMatch = function(v90, v91) --[[ Line: 388 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_isA_0 (copy)
    local v92 = false;
    if l_isA_0("string", v91) then
        if l_isA_0("string", v90.sample) then
            v90.sample = string.gsub(v90.sample, string.char(27) .. "%[", string.char(27) .. "%%[");
            v92 = v91:find(v90.sample);
        else
            v92 = v90.sample:test(v91);
        end;
    end;
    if v90.inverse then
        return not v92;
    else
        return not not v92;
    end;
end;
v86.toString = function(v93) --[[ Line: 408 ]] --[[ Name: toString ]]
    if v93.inverse then
        return "StringNotMatching";
    else
        return "StringMatching";
    end;
end;
v86.getExpectedType = function(_) --[[ Line: 415 ]] --[[ Name: getExpectedType ]]
    return "string";
end;
local v95 = setmetatable({}, {
    __index = v24
});
v95.__index = v95;
v95.new = function(v96, v97, v98) --[[ Line: 445 ]] --[[ Name: new ]]
    -- upvalues: l_Boolean_0 (copy), l_isA_0 (copy), l_Error_0 (copy), v24 (copy), v95 (copy)
    local v99 = if v97 ~= nil then v97 else 2;
    local v100 = v98 ~= nil and v98;
    if not l_Boolean_0.toJSBoolean(l_isA_0("number", v96)) then
        error(l_Error_0.new("Expected is not a Number"));
    end;
    if not l_Boolean_0.toJSBoolean(l_isA_0("number", v99)) then
        error(l_Error_0.new("Precision is not a Number"));
    end;
    local v101 = v24.new(v96);
    setmetatable(v101, v95);
    v101.inverse = v100;
    v101.precision = v99;
    return v101;
end;
v95.asymmetricMatch = function(v102, v103) --[[ Line: 463 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_Boolean_0 (copy), l_isA_0 (copy)
    if not l_Boolean_0.toJSBoolean(l_isA_0("number", v103)) then
        return false;
    else
        local v104 = false;
        v104 = v103 == 1e999 and v102.sample == 1e999 or v103 == -1e999 and v102.sample == -1e999 or math.abs(v102.sample - v103) < math.pow(10, -v102.precision) / 2;
        if l_Boolean_0.toJSBoolean(v102.inverse) then
            return not l_Boolean_0.toJSBoolean(v104);
        else
            return v104;
        end;
    end;
end;
v95.toString = function(v105) --[[ Line: 478 ]] --[[ Name: toString ]]
    -- upvalues: l_Boolean_0 (copy)
    return ("Number%sCloseTo"):format(l_Boolean_0.toJSBoolean(v105.inverse) and "Not" or "");
end;
v95.getExpectedType = function(_) --[[ Line: 482 ]] --[[ Name: getExpectedType ]]
    return "number";
end;
v95.toAsymmetricMatcher = function(v107) --[[ Line: 486 ]] --[[ Name: toAsymmetricMatcher ]]
    -- upvalues: l_Array_0 (copy), l_pluralize_0 (copy)
    return l_Array_0.join({
        v107:toString(), 
        v107.sample, 
        ("(%s)"):format((tostring(l_pluralize_0("digit", v107.precision))))
    }, " ");
end;
return {
    AsymmetricMatcher = v24, 
    any = function(v108) --[[ Line: 496 ]] --[[ Name: any ]]
        -- upvalues: v30 (copy)
        return v30.new(v108);
    end, 
    anything = function() --[[ Line: 499 ]] --[[ Name: anything ]]
        -- upvalues: v40 (copy)
        return v40.new();
    end, 
    nothing = function() --[[ Line: 502 ]] --[[ Name: nothing ]]
        -- upvalues: v47 (copy)
        return v47.new();
    end, 
    arrayContaining = function(v109) --[[ Line: 505 ]] --[[ Name: arrayContaining ]]
        -- upvalues: v55 (copy)
        return v55.new(v109);
    end, 
    arrayNotContaining = function(v110) --[[ Line: 508 ]] --[[ Name: arrayNotContaining ]]
        -- upvalues: v55 (copy)
        return v55.new(v110, true);
    end, 
    objectContaining = function(v111) --[[ Line: 511 ]] --[[ Name: objectContaining ]]
        -- upvalues: v66 (copy)
        return v66.new(v111);
    end, 
    objectNotContaining = function(v112) --[[ Line: 514 ]] --[[ Name: objectNotContaining ]]
        -- upvalues: v66 (copy)
        return v66.new(v112, true);
    end, 
    stringContaining = function(v113) --[[ Line: 517 ]] --[[ Name: stringContaining ]]
        -- upvalues: v77 (copy)
        return v77.new(v113);
    end, 
    stringNotContaining = function(v114) --[[ Line: 520 ]] --[[ Name: stringNotContaining ]]
        -- upvalues: v77 (copy)
        return v77.new(v114, true);
    end, 
    stringMatching = function(v115) --[[ Line: 523 ]] --[[ Name: stringMatching ]]
        -- upvalues: v86 (copy)
        return v86.new(v115);
    end, 
    stringNotMatching = function(v116) --[[ Line: 526 ]] --[[ Name: stringNotMatching ]]
        -- upvalues: v86 (copy)
        return v86.new(v116, true);
    end, 
    closeTo = function(v117, v118) --[[ Line: 529 ]] --[[ Name: closeTo ]]
        -- upvalues: v95 (copy)
        return v95.new(v117, v118);
    end, 
    notCloseTo = function(v119, v120) --[[ Line: 532 ]] --[[ Name: notCloseTo ]]
        -- upvalues: v95 (copy)
        return v95.new(v119, v120, true);
    end
};