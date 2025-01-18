local v0 = {};
local v1 = {
    to = true, 
    be = true, 
    been = true, 
    have = true, 
    was = true, 
    at = true
};
local v2 = {
    never = true
};
local function _(v3, v4, v5) --[[ Line: 42 ]] --[[ Name: assertLevel ]]
    v4 = v4 or "Assertion failed!";
    v5 = v5 or 1;
    if not v3 then
        error(v4, v5 + 1);
    end;
end;
local function _(v7, v8) --[[ Line: 54 ]] --[[ Name: bindSelf ]]
    return function(v9, ...) --[[ Line: 55 ]]
        -- upvalues: v7 (copy), v8 (copy)
        if v9 == v7 then
            return v8(v7, ...);
        else
            return v8(v7, v9, ...);
        end;
    end;
end;
local function _(v11, v12, v13) --[[ Line: 64 ]] --[[ Name: formatMessage ]]
    if v11 then
        return v12;
    else
        return v13;
    end;
end;
v0.new = function(v15) --[[ Line: 75 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v16 = {
        value = v15, 
        successCondition = true, 
        condition = false
    };
    setmetatable(v16, v0);
    local l_a_0 = v16.a;
    local l_l_a_0_0 = l_a_0 --[[ copy: 3 -> 4 ]];
    v16.a = function(v19, ...) --[[ Line: 55 ]]
        -- upvalues: v16 (copy), l_l_a_0_0 (copy)
        if v19 == v16 then
            return l_l_a_0_0(v16, ...);
        else
            return l_l_a_0_0(v16, v19, ...);
        end;
    end;
    v16.an = v16.a;
    l_a_0 = v16.ok;
    local l_l_a_0_1 = l_a_0 --[[ copy: 3 -> 5 ]];
    v16.ok = function(v21, ...) --[[ Line: 55 ]]
        -- upvalues: v16 (copy), l_l_a_0_1 (copy)
        if v21 == v16 then
            return l_l_a_0_1(v16, ...);
        else
            return l_l_a_0_1(v16, v21, ...);
        end;
    end;
    l_a_0 = v16.equal;
    local l_l_a_0_2 = l_a_0 --[[ copy: 3 -> 6 ]];
    v16.equal = function(v23, ...) --[[ Line: 55 ]]
        -- upvalues: v16 (copy), l_l_a_0_2 (copy)
        if v23 == v16 then
            return l_l_a_0_2(v16, ...);
        else
            return l_l_a_0_2(v16, v23, ...);
        end;
    end;
    l_a_0 = v16.throw;
    local l_l_a_0_3 = l_a_0 --[[ copy: 3 -> 7 ]];
    v16.throw = function(v25, ...) --[[ Line: 55 ]]
        -- upvalues: v16 (copy), l_l_a_0_3 (copy)
        if v25 == v16 then
            return l_l_a_0_3(v16, ...);
        else
            return l_l_a_0_3(v16, v25, ...);
        end;
    end;
    l_a_0 = v16.near;
    v16.near = function(v26, ...) --[[ Line: 55 ]]
        -- upvalues: v16 (copy), l_a_0 (copy)
        if v26 == v16 then
            return l_a_0(v16, ...);
        else
            return l_a_0(v16, v26, ...);
        end;
    end;
    return v16;
end;
v0.__index = function(v27, v28) --[[ Line: 94 ]] --[[ Name: __index ]]
    -- upvalues: v1 (copy), v2 (copy), v0 (copy)
    if v1[v28] then
        return v27;
    elseif v2[v28] then
        local v29 = v0.new(v27.value);
        v29.successCondition = not v27.successCondition;
        return v29;
    else
        return v0[v28];
    end;
end;
v0._resetModifiers = function(v30) --[[ Line: 123 ]] --[[ Name: _resetModifiers ]]
    v30.successCondition = true;
end;
v0.a = function(v31, v32) --[[ Line: 132 ]] --[[ Name: a ]]
    local v33 = type(v31.value) == v32 == v31.successCondition;
    local l_successCondition_0 = v31.successCondition;
    local v35 = ("Expected value of type %q, got value %q of type %s"):format(v32, tostring(v31.value), (type(v31.value)));
    local v36 = ("Expected value not of type %q, got value %q of type %s"):format(v32, tostring(v31.value), (type(v31.value)));
    l_successCondition_0 = if l_successCondition_0 then v35 else v36;
    v35 = 3;
    l_successCondition_0 = l_successCondition_0 or "Assertion failed!";
    v35 = v35 or 1;
    if not v33 then
        error(l_successCondition_0, v35 + 1);
    end;
    v31:_resetModifiers();
    return v31;
end;
v0.ok = function(v37) --[[ Line: 157 ]] --[[ Name: ok ]]
    local v38 = v37.value ~= nil == v37.successCondition;
    local l_successCondition_1 = v37.successCondition;
    local v40 = ("Expected value %q to be non-nil"):format((tostring(v37.value)));
    local v41 = ("Expected value %q to be nil"):format((tostring(v37.value)));
    l_successCondition_1 = if l_successCondition_1 then v40 else v41;
    v40 = 3;
    l_successCondition_1 = l_successCondition_1 or "Assertion failed!";
    v40 = v40 or 1;
    if not v38 then
        error(l_successCondition_1, v40 + 1);
    end;
    v37:_resetModifiers();
    return v37;
end;
v0.equal = function(v42, v43) --[[ Line: 178 ]] --[[ Name: equal ]]
    local v44 = v42.value == v43 == v42.successCondition;
    local l_successCondition_2 = v42.successCondition;
    local v46 = ("Expected value %q (%s), got %q (%s) instead"):format(tostring(v43), type(v43), tostring(v42.value), (type(v42.value)));
    local v47 = ("Expected anything but value %q (%s)"):format(tostring(v43), (type(v43)));
    l_successCondition_2 = if l_successCondition_2 then v46 else v47;
    v46 = 3;
    l_successCondition_2 = l_successCondition_2 or "Assertion failed!";
    v46 = v46 or 1;
    if not v44 then
        error(l_successCondition_2, v46 + 1);
    end;
    v42:_resetModifiers();
    return v42;
end;
v0.near = function(v48, v49, v50) --[[ Line: 204 ]] --[[ Name: near ]]
    assert(type(v48.value) == "number", "Expectation value must be a number to use 'near'");
    assert(type(v49) == "number", "otherValue must be a number");
    local v51 = true;
    if type(v50) ~= "number" then
        v51 = v50 == nil;
    end;
    assert(v51, "limit must be a number or nil");
    v50 = v50 or 1.0E-7;
    local v52 = math.abs(v48.value - v49) <= v50 == v48.successCondition;
    local l_successCondition_3 = v48.successCondition;
    local v54 = ("Expected value to be near %f (within %f) but got %f instead"):format(v49, v50, v48.value);
    local v55 = ("Expected value to not be near %f (within %f) but got %f instead"):format(v49, v50, v48.value);
    l_successCondition_3 = if l_successCondition_3 then v54 else v55;
    v54 = 3;
    l_successCondition_3 = l_successCondition_3 or "Assertion failed!";
    v54 = v54 or 1;
    if not v52 then
        error(l_successCondition_3, v54 + 1);
    end;
    v48:_resetModifiers();
    return v48;
end;
v0.throw = function(v56) --[[ Line: 235 ]] --[[ Name: throw ]]
    local l_status_0, l_result_0 = pcall(v56.value);
    local v59 = l_status_0 ~= v56.successCondition;
    local l_successCondition_4 = v56.successCondition;
    local v61 = ("Expected function to succeed, but it threw an error: %s"):format((tostring(l_result_0)));
    l_successCondition_4 = l_successCondition_4 and "Expected function to throw an error, but it did not." or v61;
    v61 = 3;
    l_successCondition_4 = l_successCondition_4 or "Assertion failed!";
    v61 = v61 or 1;
    if not v59 then
        error(l_successCondition_4, v61 + 1);
    end;
    v56:_resetModifiers();
    return v56;
end;
return v0;