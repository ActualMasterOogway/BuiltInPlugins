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
        condition = false, 
        matchers = {}, 
        _boundMatchers = {}
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
v0.checkMatcherNameCollisions = function(v27) --[[ Line: 96 ]] --[[ Name: checkMatcherNameCollisions ]]
    -- upvalues: v1 (copy), v2 (copy), v0 (copy)
    if v1[v27] or v2[v27] or v0[v27] then
        return false;
    else
        return true;
    end;
end;
v0.extend = function(v28, v29) --[[ Line: 104 ]] --[[ Name: extend ]]
    v28.matchers = v29 or {};
    for v30, v31 in pairs(v28.matchers) do
        local l__boundMatchers_0 = v28._boundMatchers;
        local function v38(_, ...) --[[ Line: 108 ]]
            -- upvalues: v31 (copy), v28 (copy)
            local v34 = v31(v28.value, ...);
            local v35 = v34.pass == v28.successCondition;
            local l_message_0 = v34.message;
            local v37 = 3;
            l_message_0 = l_message_0 or "Assertion failed!";
            v37 = v37 or 1;
            if not v35 then
                error(l_message_0, v37 + 1);
            end;
            v28:_resetModifiers();
            return v28;
        end;
        l__boundMatchers_0[v30] = function(v39, ...) --[[ Line: 55 ]]
            -- upvalues: v28 (copy), v38 (copy)
            if v39 == v28 then
                return v38(v28, ...);
            else
                return v38(v28, v39, ...);
            end;
        end;
    end;
    return v28;
end;
v0.__index = function(v40, v41) --[[ Line: 121 ]] --[[ Name: __index ]]
    -- upvalues: v1 (copy), v2 (copy), v0 (copy)
    if v1[v41] then
        return v40;
    elseif v2[v41] then
        local v42 = v0.new(v40.value):extend(v40.matchers);
        v42.successCondition = not v40.successCondition;
        return v42;
    elseif v40._boundMatchers[v41] then
        return v40._boundMatchers[v41];
    else
        return v0[v41];
    end;
end;
v0._resetModifiers = function(v43) --[[ Line: 154 ]] --[[ Name: _resetModifiers ]]
    v43.successCondition = true;
end;
v0.a = function(v44, v45) --[[ Line: 163 ]] --[[ Name: a ]]
    local v46 = type(v44.value) == v45 == v44.successCondition;
    local l_successCondition_0 = v44.successCondition;
    local v48 = ("Expected value of type %q, got value %q of type %s"):format(v45, tostring(v44.value), (type(v44.value)));
    local v49 = ("Expected value not of type %q, got value %q of type %s"):format(v45, tostring(v44.value), (type(v44.value)));
    l_successCondition_0 = if l_successCondition_0 then v48 else v49;
    v48 = 3;
    l_successCondition_0 = l_successCondition_0 or "Assertion failed!";
    v48 = v48 or 1;
    if not v46 then
        error(l_successCondition_0, v48 + 1);
    end;
    v44:_resetModifiers();
    return v44;
end;
v0.an = v0.a;
v0.ok = function(v50) --[[ Line: 188 ]] --[[ Name: ok ]]
    local v51 = v50.value ~= nil == v50.successCondition;
    local l_successCondition_1 = v50.successCondition;
    local v53 = ("Expected value %q to be non-nil"):format((tostring(v50.value)));
    local v54 = ("Expected value %q to be nil"):format((tostring(v50.value)));
    l_successCondition_1 = if l_successCondition_1 then v53 else v54;
    v53 = 3;
    l_successCondition_1 = l_successCondition_1 or "Assertion failed!";
    v53 = v53 or 1;
    if not v51 then
        error(l_successCondition_1, v53 + 1);
    end;
    v50:_resetModifiers();
    return v50;
end;
v0.equal = function(v55, v56) --[[ Line: 206 ]] --[[ Name: equal ]]
    local v57 = v55.value == v56 == v55.successCondition;
    local l_successCondition_2 = v55.successCondition;
    local v59 = ("Expected value %q (%s), got %q (%s) instead"):format(tostring(v56), type(v56), tostring(v55.value), (type(v55.value)));
    local v60 = ("Expected anything but value %q (%s)"):format(tostring(v56), (type(v56)));
    l_successCondition_2 = if l_successCondition_2 then v59 else v60;
    v59 = 3;
    l_successCondition_2 = l_successCondition_2 or "Assertion failed!";
    v59 = v59 or 1;
    if not v57 then
        error(l_successCondition_2, v59 + 1);
    end;
    v55:_resetModifiers();
    return v55;
end;
v0.near = function(v61, v62, v63) --[[ Line: 230 ]] --[[ Name: near ]]
    assert(type(v61.value) == "number", "Expectation value must be a number to use 'near'");
    assert(type(v62) == "number", "otherValue must be a number");
    local v64 = true;
    if type(v63) ~= "number" then
        v64 = v63 == nil;
    end;
    assert(v64, "limit must be a number or nil");
    v63 = v63 or 1.0E-7;
    local v65 = math.abs(v61.value - v62) <= v63 == v61.successCondition;
    local l_successCondition_3 = v61.successCondition;
    local v67 = ("Expected value to be near %f (within %f) but got %f instead"):format(v62, v63, v61.value);
    local v68 = ("Expected value to not be near %f (within %f) but got %f instead"):format(v62, v63, v61.value);
    l_successCondition_3 = if l_successCondition_3 then v67 else v68;
    v67 = 3;
    l_successCondition_3 = l_successCondition_3 or "Assertion failed!";
    v67 = v67 or 1;
    if not v65 then
        error(l_successCondition_3, v67 + 1);
    end;
    v61:_resetModifiers();
    return v61;
end;
v0.throw = function(v69, v70) --[[ Line: 256 ]] --[[ Name: throw ]]
    local l_status_0, l_result_0 = pcall(v69.value);
    local v73 = l_status_0 ~= v69.successCondition;
    if v70 and not l_status_0 then
        v73 = if v69.successCondition then l_result_0:find(v70, 1, true) ~= nil else l_result_0:find(v70, 1, true) == nil;
    end;
    local v74 = nil;
    if v70 then
        local l_successCondition_4 = v69.successCondition;
        local v76 = ("Expected function to throw an error containing %q, but it %s"):format(v70, l_result_0 and ("threw: %s"):format(l_result_0) or "did not throw.");
        local v77 = ("Expected function to never throw an error containing %q, but it threw: %s"):format(v70, (tostring(l_result_0)));
        v74 = if l_successCondition_4 then v76 else v77;
    else
        local l_successCondition_5 = v69.successCondition;
        local v79 = ("Expected function to succeed, but it threw an error: %s"):format((tostring(l_result_0)));
        v74 = l_successCondition_5 and "Expected function to throw an error, but it did not throw." or v79;
    end;
    local l_v73_0 = v73;
    local l_v74_0 = v74;
    local v82 = 3;
    l_v74_0 = l_v74_0 or "Assertion failed!";
    v82 = v82 or 1;
    if not l_v73_0 then
        error(l_v74_0, v82 + 1);
    end;
    v69:_resetModifiers();
    return v69;
end;
return v0;