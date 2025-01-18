local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Symbol_0 = v2.Symbol;
local l_Object_0 = v2.Object;
local l_Error_0 = v2.Error;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local l_AsymmetricMatcher_0 = require(l_Parent_0.asymmetricMatchers).AsymmetricMatcher;
local _ = require(l_Parent_0.types);
local v9 = require(l_Parent_0.jestMatchersObject_extracted);
local l_JEST_MATCHERS_OBJECT_0 = v9.JEST_MATCHERS_OBJECT;
local v11 = l_Symbol_0.for_("$$jest-internal-matcher");
if not _G[l_JEST_MATCHERS_OBJECT_0] then
    local v12 = {
        assertionCalls = 0, 
        expectedAssertionsNumber = nil, 
        isExpectingAssertions = false, 
        suppressedErrors = {}
    };
    _G[l_JEST_MATCHERS_OBJECT_0] = {
        matchers = {}, 
        state = v12
    };
end;
local l_getState_0 = v9.getState;
return {
    INTERNAL_MATCHER_FLAG = v11, 
    getState = l_getState_0, 
    setState = function(v14) --[[ Line: 62 ]] --[[ Name: setState ]]
        -- upvalues: l_Object_0 (copy), l_JEST_MATCHERS_OBJECT_0 (copy)
        l_Object_0.assign(_G[l_JEST_MATCHERS_OBJECT_0].state, v14);
    end, 
    getMatchers = function() --[[ Line: 73 ]] --[[ Name: getMatchers ]]
        -- upvalues: l_JEST_MATCHERS_OBJECT_0 (copy)
        return _G[l_JEST_MATCHERS_OBJECT_0].matchers;
    end, 
    setMatchers = function(v15, v16, v17) --[[ Line: 84 ]] --[[ Name: setMatchers ]]
        -- upvalues: l_Error_0 (copy), l_getType_0 (copy), l_AsymmetricMatcher_0 (copy), l_Object_0 (copy), l_JEST_MATCHERS_OBJECT_0 (copy)
        for v18, v19 in pairs(v15) do
            if not v16 then
                if typeof(v19) ~= "function" then
                    error(l_Error_0.new(("expect.extend: `%s` is not a valid matcher. Must be a function, is \"%s\""):format(tostring(v18), (tostring(l_getType_0(v19))))));
                end;
                local v20 = {};
                v20.__index = v20;
                setmetatable(v20, l_AsymmetricMatcher_0);
                v20.new = function(v21, ...) --[[ Line: 103 ]]
                    -- upvalues: l_AsymmetricMatcher_0 (ref), v20 (copy)
                    if v21 == nil then
                        v21 = false;
                    end;
                    local v22 = l_AsymmetricMatcher_0.new({
                        ...
                    }, v21);
                    setmetatable(v22, v20);
                    return v22;
                end;
                v20.asymmetricMatch = function(v23, v24) --[[ Line: 110 ]]
                    -- upvalues: v19 (copy)
                    local l_pass_0 = v19(v23:getMatcherContext(), v24, unpack(v23.sample)).pass;
                    if v23.inverse then
                        return not l_pass_0;
                    else
                        return l_pass_0;
                    end;
                end;
                v20.toString = function(v26) --[[ Line: 116 ]]
                    -- upvalues: v18 (copy)
                    if v26.inverse then
                        return string.format("never.%s", v18);
                    else
                        return (tostring(v18));
                    end;
                end;
                v20.getExpectedType = function(_) --[[ Line: 123 ]]
                    return "any";
                end;
                v20.toAsymmetricMatcher = function(v28) --[[ Line: 127 ]]
                    local l_sample_0 = v28.sample;
                    local v30 = 1;
                    local v31 = "";
                    while v30 < #l_sample_0 do
                        v31 = v31 .. tostring(l_sample_0[v30]) .. ", ";
                        v30 = v30 + 1;
                    end;
                    v31 = v31 .. tostring(l_sample_0[v30]);
                    return string.format("%s<%s>", v28:toString(), v31);
                end;
                v17[v18] = function(...) --[[ Line: 140 ]]
                    -- upvalues: v20 (copy)
                    return v20.new(false, ...);
                end;
                if not v17.never then
                    v17.never = {};
                end;
                v17.never[v18] = function(...) --[[ Line: 146 ]]
                    -- upvalues: v20 (copy)
                    return v20.new(true, ...);
                end;
            end;
        end;
        l_Object_0.assign(_G[l_JEST_MATCHERS_OBJECT_0].matchers, v15);
    end
};