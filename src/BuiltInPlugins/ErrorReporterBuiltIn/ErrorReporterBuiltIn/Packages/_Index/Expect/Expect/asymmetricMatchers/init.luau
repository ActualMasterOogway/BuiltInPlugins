local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Symbol_0 = v2.Symbol;
local l_instanceof_0 = v2.instanceof;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v7 = require(l_Parent_0.jasmineUtils);
local l_equals_0 = v7.equals;
local l_hasProperty_0 = v7.hasProperty;
local l_isA_0 = v7.isA;
local l_isUndefined_0 = v7.isUndefined;
local l_emptyObject_0 = require(l_Parent_0.utils).emptyObject;
local v13 = {};
v13.__index = v13;
v13.new = function(v14) --[[ Line: 33 ]] --[[ Name: new ]]
    -- upvalues: l_Symbol_0 (copy), v13 (copy)
    local v15 = {
        sample = v14, 
        ["$$typeof"] = l_Symbol_0.for_("jest.asymmetricMatcher")
    };
    setmetatable(v15, v13);
    return v15;
end;
local v16 = {};
v16.__index = v16;
setmetatable(v16, v13);
v16.new = function(v17) --[[ Line: 52 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v16 (copy)
    if typeof(v17) ~= "table" and typeof(v17) ~= "string" then
        error("any() expects to be passed a typename string or a prototype class. " .. "Please pass one or use anything() to match any object.");
    end;
    local v18 = v13.new(v17);
    setmetatable(v18, v16);
    return v18;
end;
v16.asymmetricMatch = function(v19, v20) --[[ Line: 64 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_getType_0 (copy), l_instanceof_0 (copy)
    local v21 = l_getType_0(v19.sample);
    local v22 = l_getType_0(v20);
    if v21 == "table" and v22 == "table" or v21 == "error" and v22 == "error" then
        return l_instanceof_0(v20, v19.sample);
    elseif v21 == "string" and v19.sample == v22 then
        return true;
    else
        return false;
    end;
end;
v16.toString = function(_) --[[ Line: 84 ]] --[[ Name: toString ]]
    return "Any";
end;
v16.getExpectedType = function(v24) --[[ Line: 88 ]] --[[ Name: getExpectedType ]]
    return (tostring(v24.sample));
end;
v16.toAsymmetricMatcher = function(v25) --[[ Line: 93 ]] --[[ Name: toAsymmetricMatcher ]]
    return "Any<" .. tostring(v25.sample) .. ">";
end;
local v26 = {};
v26.__index = v26;
setmetatable(v26, v13);
v26.new = function(v27) --[[ Line: 100 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v26 (copy)
    local v28 = v13.new(v27);
    setmetatable(v28, v26);
    return v28;
end;
v26.asymmetricMatch = function(_, v30) --[[ Line: 106 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_isUndefined_0 (copy)
    return not l_isUndefined_0(v30);
end;
v26.toString = function(_) --[[ Line: 111 ]] --[[ Name: toString ]]
    return "Anything";
end;
v26.toAsymmetricMatcher = function(_) --[[ Line: 117 ]] --[[ Name: toAsymmetricMatcher ]]
    return "Anything";
end;
local v33 = {};
v33.__index = v33;
setmetatable(v33, v13);
v33.new = function(v34, v35) --[[ Line: 124 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v33 (copy)
    local v36 = v13.new(v34);
    v36.inverse = v35 or false;
    setmetatable(v36, v33);
    return v36;
end;
v33.asymmetricMatch = function(v37, v38) --[[ Line: 131 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_Array_0 (copy), l_equals_0 (copy)
    if not l_Array_0.isArray(v37.sample) then
        error(string.format("You must provide an array to %s, not '%s'.", v37:toString(), (typeof(v37.sample))));
    end;
    local v39 = false;
    if #v37.sample == 0 then
        v39 = true;
    elseif l_Array_0.isArray(v38) and l_Array_0.every(v37.sample, function(v40) --[[ Line: 145 ]]
        -- upvalues: l_Array_0 (ref), v38 (copy), l_equals_0 (ref)
        return l_Array_0.some(v38, function(v41) --[[ Line: 148 ]]
            -- upvalues: l_equals_0 (ref), v40 (copy)
            return l_equals_0(v40, v41);
        end);
    end) then
        v39 = true;
    end;
    if v37.inverse then
        return not v39;
    else
        return v39;
    end;
end;
v33.toString = function(v42) --[[ Line: 164 ]] --[[ Name: toString ]]
    if v42.inverse then
        return "ArrayNotContaining";
    else
        return "ArrayContaining";
    end;
end;
v33.getExpectedType = function(_) --[[ Line: 171 ]] --[[ Name: getExpectedType ]]
    return "array";
end;
local v44 = {};
v44.__index = v44;
setmetatable(v44, v13);
v44.new = function(v45, v46) --[[ Line: 178 ]] --[[ Name: new ]]
    -- upvalues: v13 (copy), v44 (copy)
    local v47 = v13.new(v45);
    v47.inverse = v46 or false;
    setmetatable(v47, v44);
    return v47;
end;
v44.asymmetricMatch = function(v48, v49) --[[ Line: 185 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_hasProperty_0 (copy), l_equals_0 (copy), l_emptyObject_0 (copy)
    if typeof(v48.sample) ~= "table" then
        error(string.format("You must provide an object to %s, not '%s'.", v48:toString(), (typeof(v48.sample))));
    end;
    if v48.inverse then
        for v50, v51 in pairs(v48.sample) do
            if l_hasProperty_0(v49, v50) and l_equals_0(v51, v49[v50]) and not l_emptyObject_0(v51) and not l_emptyObject_0(v49[v50]) then
                return false;
            end;
        end;
        return true;
    else
        for v52, v53 in pairs(v48.sample) do
            if not l_hasProperty_0(v49, v52) or not l_equals_0(v53, v49[v52]) then
                return false;
            end;
        end;
        return true;
    end;
end;
v44.toString = function(v54) --[[ Line: 220 ]] --[[ Name: toString ]]
    if v54.inverse then
        return "ObjectNotContaining";
    else
        return "ObjectContaining";
    end;
end;
v44.getExpectedType = function(_) --[[ Line: 227 ]] --[[ Name: getExpectedType ]]
    return "object";
end;
local v56 = {};
v56.__index = v56;
setmetatable(v56, v13);
v56.new = function(v57, v58) --[[ Line: 234 ]] --[[ Name: new ]]
    -- upvalues: l_isA_0 (copy), v13 (copy), v56 (copy)
    if not l_isA_0("string", v57) then
        error("Expected is not a String");
    end;
    local v59 = v13.new(v57);
    v59.inverse = v58 or false;
    setmetatable(v59, v56);
    return v59;
end;
v56.asymmetricMatch = function(v60, v61) --[[ Line: 244 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_isA_0 (copy)
    local v62 = l_isA_0("string", v61) and v61:find(v60.sample, 1, true);
    if v60.inverse then
        return not v62;
    else
        return not not v62;
    end;
end;
v56.toString = function(v63) --[[ Line: 253 ]] --[[ Name: toString ]]
    if v63.inverse then
        return "StringNotContaining";
    else
        return "StringContaining";
    end;
end;
v56.getExpectedType = function(_) --[[ Line: 260 ]] --[[ Name: getExpectedType ]]
    return "string";
end;
local v65 = {};
v65.__index = v65;
setmetatable(v65, v13);
v65.new = function(v66, v67) --[[ Line: 267 ]] --[[ Name: new ]]
    -- upvalues: l_isA_0 (copy), v13 (copy), v65 (copy)
    if not l_isA_0("string", v66) and not l_isA_0("regexp", v66) then
        error("Expected is not a String");
    end;
    local v68 = v13.new(v66);
    v68.inverse = v67 or false;
    setmetatable(v68, v65);
    return v68;
end;
v65.asymmetricMatch = function(v69, v70) --[[ Line: 278 ]] --[[ Name: asymmetricMatch ]]
    -- upvalues: l_isA_0 (copy)
    local v71 = false;
    if l_isA_0("string", v70) then
        if l_isA_0("string", v69.sample) then
            v69.sample = string.gsub(v69.sample, string.char(27) .. "%[", string.char(27) .. "%%[");
            v71 = v70:find(v69.sample);
        else
            v71 = v69.sample:test(v70);
        end;
    end;
    if v69.inverse then
        return not v71;
    else
        return not not v71;
    end;
end;
v65.toString = function(v72) --[[ Line: 298 ]] --[[ Name: toString ]]
    if v72.inverse then
        return "StringNotMatching";
    else
        return "StringMatching";
    end;
end;
v65.getExpectedType = function(_) --[[ Line: 305 ]] --[[ Name: getExpectedType ]]
    return "string";
end;
return {
    AsymmetricMatcher = v13, 
    any = function(v74) --[[ Line: 311 ]] --[[ Name: any ]]
        -- upvalues: v16 (copy)
        return v16.new(v74);
    end, 
    anything = function() --[[ Line: 312 ]] --[[ Name: anything ]]
        -- upvalues: v26 (copy)
        return v26.new();
    end, 
    arrayContaining = function(v75) --[[ Line: 313 ]] --[[ Name: arrayContaining ]]
        -- upvalues: v33 (copy)
        return v33.new(v75);
    end, 
    arrayNotContaining = function(v76) --[[ Line: 314 ]] --[[ Name: arrayNotContaining ]]
        -- upvalues: v33 (copy)
        return v33.new(v76, true);
    end, 
    objectContaining = function(v77) --[[ Line: 315 ]] --[[ Name: objectContaining ]]
        -- upvalues: v44 (copy)
        return v44.new(v77);
    end, 
    objectNotContaining = function(v78) --[[ Line: 316 ]] --[[ Name: objectNotContaining ]]
        -- upvalues: v44 (copy)
        return v44.new(v78, true);
    end, 
    stringContaining = function(v79) --[[ Line: 317 ]] --[[ Name: stringContaining ]]
        -- upvalues: v56 (copy)
        return v56.new(v79);
    end, 
    stringNotContaining = function(v80) --[[ Line: 318 ]] --[[ Name: stringNotContaining ]]
        -- upvalues: v56 (copy)
        return v56.new(v80, true);
    end, 
    stringMatching = function(v81) --[[ Line: 319 ]] --[[ Name: stringMatching ]]
        -- upvalues: v65 (copy)
        return v65.new(v81);
    end, 
    stringNotMatching = function(v82) --[[ Line: 320 ]] --[[ Name: stringNotMatching ]]
        -- upvalues: v65 (copy)
        return v65.new(v82, true);
    end
};