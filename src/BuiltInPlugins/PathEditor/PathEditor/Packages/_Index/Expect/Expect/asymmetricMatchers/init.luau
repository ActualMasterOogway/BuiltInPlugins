local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Object_0 = v2.Object;
local l_Symbol_0 = v2.Symbol;
local l_instanceof_0 = v2.instanceof;
local _ = require(l_Parent_1.RegExp);
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v9 = {};
local v10 = require(l_Parent_0.jasmineUtils);
local l_equals_0 = v10.equals;
local l_hasProperty_0 = v10.hasProperty;
local l_isA_0 = v10.isA;
local l_isUndefined_0 = v10.isUndefined;
local l_getState_0 = require(l_Parent_0.jestMatchersObject_extracted).getState;
local _ = require(l_Parent_0.types);
local v17 = require(l_Parent_0.utils);
local l_iterableEquality_0 = v17.iterableEquality;
local l_subsetEquality_0 = v17.subsetEquality;
local v20 = l_Object_0.freeze(l_Object_0.assign({}, v9, {
    iterableEquality = l_iterableEquality_0, 
    subsetEquality = l_subsetEquality_0
}));
local v21 = {};
v21.__index = v21;
v21.new = function(v22, v23) --[[ Line: 51 ]] --[[ Name: new ]]
    -- upvalues: l_Symbol_0 (copy), v21 (copy)
    local v24 = {
        sample = v22, 
        inverse = v23 ~= nil and v23, 
        ["$$typeof"] = l_Symbol_0.for_("jest.asymmetricMatcher")
    };
    setmetatable(v24, v21);
    return v24;
end;
v21.getMatcherContext = function(v25) --[[ Line: 63 ]] --[[ Name: getMatcherContext ]]
    -- upvalues: l_Object_0 (copy), l_getState_0 (copy), l_equals_0 (copy), v20 (copy)
    return l_Object_0.assign({}, l_getState_0(), {
        equals = l_equals_0, 
        isNot = v25.inverse, 
        utils = v20
    });
end;
local v26 = {};
v26.__index = v26;
setmetatable(v26, v21);
v26.new = function(v27) --[[ Line: 89 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy), v26 (copy)
    if typeof(v27) ~= "table" and typeof(v27) ~= "string" then
        error("any() expects to be passed a typename string or a prototype class. " .. "Please pass one or use anything() to match any object.");
    end;
    local v28 = v21.new(v27);
    setmetatable(v28, v26);
    return v28;
end;
v26.asymmetricMatch = function(v29, v30) --[[ Line: 101 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_getType_0 (copy), l_instanceof_0 (copy)
    local v31 = l_getType_0(v29.sample);
    local v32 = l_getType_0(v30);
    if v31 == "table" and v32 == "table" or v31 == "error" and v32 == "error" then
        return l_instanceof_0(v30, v29.sample);
    elseif v31 == "string" and v29.sample == v32 then
        return true;
    else
        return false;
    end;
end;
v26.toString = function(_) --[[ Line: 115 ]] --[[ Name: toString ]]
    return "Any";
end;
v26.getExpectedType = function(v34) --[[ Line: 119 ]] --[[ Name: getExpectedType ]]
    return (tostring(v34.sample));
end;
v26.toAsymmetricMatcher = function(v35) --[[ Line: 124 ]] --[[ Name: toAsymmetricMatcher ]]
    return "Any<" .. tostring(v35.sample) .. ">";
end;
local v36 = {};
v36.__index = v36;
setmetatable(v36, v21);
v36.new = function(v37) --[[ Line: 131 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy), v36 (copy)
    local v38 = v21.new(v37);
    setmetatable(v38, v36);
    return v38;
end;
v36.asymmetricMatch = function(_, v40) --[[ Line: 137 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_isUndefined_0 (copy)
    return not l_isUndefined_0(v40);
end;
v36.toString = function(_) --[[ Line: 142 ]] --[[ Name: toString ]]
    return "Anything";
end;
v36.toAsymmetricMatcher = function(_) --[[ Line: 148 ]] --[[ Name: toAsymmetricMatcher ]]
    return "Anything";
end;
local v43 = {};
v43.__index = v43;
setmetatable(v43, v21);
v43.new = function(v44, v45) --[[ Line: 155 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy), v43 (copy)
    if v45 == nil then
        v45 = false;
    end;
    local v46 = v21.new(v44, v45);
    setmetatable(v46, v43);
    return v46;
end;
v43.asymmetricMatch = function(v47, v48) --[[ Line: 162 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_Array_0 (copy), l_equals_0 (copy)
    if not l_Array_0.isArray(v47.sample) then
        error(string.format("You must provide an array to %s, not '%s'.", v47:toString(), (typeof(v47.sample))));
    end;
    local v49 = false;
    if #v47.sample == 0 then
        v49 = true;
    elseif l_Array_0.isArray(v48) and l_Array_0.every(v47.sample, function(v50) --[[ Line: 172 ]]
        -- upvalues: l_Array_0 (ref), v48 (copy), l_equals_0 (ref)
        return l_Array_0.some(v48, function(v51) --[[ Line: 173 ]]
            -- upvalues: l_equals_0 (ref), v50 (copy)
            return l_equals_0(v50, v51);
        end);
    end) then
        v49 = true;
    end;
    if v47.inverse then
        return not v49;
    else
        return v49;
    end;
end;
v43.toString = function(v52) --[[ Line: 187 ]] --[[ Name: toString ]]
    if v52.inverse then
        return "ArrayNotContaining";
    else
        return "ArrayContaining";
    end;
end;
v43.getExpectedType = function(_) --[[ Line: 194 ]] --[[ Name: getExpectedType ]]
    return "array";
end;
local v54 = {};
v54.__index = v54;
setmetatable(v54, v21);
v54.new = function(v55, v56) --[[ Line: 201 ]] --[[ Name: new ]]
    -- upvalues: v21 (copy), v54 (copy)
    if v56 == nil then
        v56 = false;
    end;
    local v57 = v21.new(v55, v56);
    setmetatable(v57, v54);
    return v57;
end;
v54.asymmetricMatch = function(v58, v59) --[[ Line: 208 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_hasProperty_0 (copy), l_equals_0 (copy)
    if typeof(v58.sample) ~= "table" then
        error(string.format("You must provide an object to %s, not '%s'.", v58:toString(), (typeof(v58.sample))));
    end;
    local v60 = true;
    for v61, v62 in pairs(v58.sample) do
        if not l_hasProperty_0(v59, v61) or not l_equals_0(v62, v59[v61]) then
            v60 = false;
            break;
        end;
    end;
    if v58.inverse then
        return not v60;
    else
        return v60;
    end;
end;
v54.toString = function(v63) --[[ Line: 226 ]] --[[ Name: toString ]]
    if v63.inverse then
        return "ObjectNotContaining";
    else
        return "ObjectContaining";
    end;
end;
v54.getExpectedType = function(_) --[[ Line: 233 ]] --[[ Name: getExpectedType ]]
    return "object";
end;
local v65 = {};
v65.__index = v65;
setmetatable(v65, v21);
v65.new = function(v66, v67) --[[ Line: 240 ]] --[[ Name: new ]]
    -- upvalues: l_isA_0 (copy), v21 (copy), v65 (copy)
    if v67 == nil then
        v67 = false;
    end;
    if not l_isA_0("string", v66) then
        error("Expected is not a String");
    end;
    local v68 = v21.new(v66, v67);
    setmetatable(v68, v65);
    return v68;
end;
v65.asymmetricMatch = function(v69, v70) --[[ Line: 250 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_isA_0 (copy)
    local v71 = l_isA_0("string", v70) and v70:find(v69.sample, 1, true);
    if v69.inverse then
        return not v71;
    else
        return not not v71;
    end;
end;
v65.toString = function(v72) --[[ Line: 259 ]] --[[ Name: toString ]]
    if v72.inverse then
        return "StringNotContaining";
    else
        return "StringContaining";
    end;
end;
v65.getExpectedType = function(_) --[[ Line: 266 ]] --[[ Name: getExpectedType ]]
    return "string";
end;
local v74 = {};
v74.__index = v74;
setmetatable(v74, v21);
v74.new = function(v75, v76) --[[ Line: 273 ]] --[[ Name: new ]]
    -- upvalues: l_isA_0 (copy), v21 (copy), v74 (copy)
    if v76 == nil then
        v76 = false;
    end;
    if not l_isA_0("string", v75) and not l_isA_0("regexp", v75) then
        error("Expected is not a String");
    end;
    local v77 = v21.new(v75, v76);
    setmetatable(v77, v74);
    return v77;
end;
v74.asymmetricMatch = function(v78, v79) --[[ Line: 284 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_isA_0 (copy)
    local v80 = false;
    if l_isA_0("string", v79) then
        if l_isA_0("string", v78.sample) then
            v78.sample = string.gsub(v78.sample, string.char(27) .. "%[", string.char(27) .. "%%[");
            v80 = v79:find(v78.sample);
        else
            v80 = v78.sample:test(v79);
        end;
    end;
    if v78.inverse then
        return not v80;
    else
        return not not v80;
    end;
end;
v74.toString = function(v81) --[[ Line: 304 ]] --[[ Name: toString ]]
    if v81.inverse then
        return "StringNotMatching";
    else
        return "StringMatching";
    end;
end;
v74.getExpectedType = function(_) --[[ Line: 311 ]] --[[ Name: getExpectedType ]]
    return "string";
end;
return {
    AsymmetricMatcher = v21, 
    any = function(v83) --[[ Line: 317 ]] --[[ Name: any ]]
        -- upvalues: v26 (copy)
        return v26.new(v83);
    end, 
    anything = function() --[[ Line: 320 ]] --[[ Name: anything ]]
        -- upvalues: v36 (copy)
        return v36.new();
    end, 
    arrayContaining = function(v84) --[[ Line: 323 ]] --[[ Name: arrayContaining ]]
        -- upvalues: v43 (copy)
        return v43.new(v84);
    end, 
    arrayNotContaining = function(v85) --[[ Line: 326 ]] --[[ Name: arrayNotContaining ]]
        -- upvalues: v43 (copy)
        return v43.new(v85, true);
    end, 
    objectContaining = function(v86) --[[ Line: 329 ]] --[[ Name: objectContaining ]]
        -- upvalues: v54 (copy)
        return v54.new(v86);
    end, 
    objectNotContaining = function(v87) --[[ Line: 332 ]] --[[ Name: objectNotContaining ]]
        -- upvalues: v54 (copy)
        return v54.new(v87, true);
    end, 
    stringContaining = function(v88) --[[ Line: 335 ]] --[[ Name: stringContaining ]]
        -- upvalues: v65 (copy)
        return v65.new(v88);
    end, 
    stringNotContaining = function(v89) --[[ Line: 338 ]] --[[ Name: stringNotContaining ]]
        -- upvalues: v65 (copy)
        return v65.new(v89, true);
    end, 
    stringMatching = function(v90) --[[ Line: 341 ]] --[[ Name: stringMatching ]]
        -- upvalues: v74 (copy)
        return v74.new(v90);
    end, 
    stringNotMatching = function(v91) --[[ Line: 344 ]] --[[ Name: stringNotMatching ]]
        -- upvalues: v74 (copy)
        return v74.new(v91, true);
    end
};