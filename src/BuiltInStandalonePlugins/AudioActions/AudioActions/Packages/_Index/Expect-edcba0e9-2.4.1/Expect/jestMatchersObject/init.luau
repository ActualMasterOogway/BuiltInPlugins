local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Symbol_0 = v2.Symbol;
local l_Object_0 = v2.Object;
local l_AsymmetricMatcher_0 = require(l_Parent_0.asymmetricMatchers).AsymmetricMatcher;
local _ = require(l_Parent_0.types);
local v7 = require(l_Parent_0.jestMatchersObject_extracted);
local l_JEST_MATCHERS_OBJECT_0 = v7.JEST_MATCHERS_OBJECT;
local v9 = l_Symbol_0.for_("$$jest-internal-matcher");
if not _G[l_JEST_MATCHERS_OBJECT_0] then
    local v10 = {
        assertionCalls = 0, 
        expectedAssertionsNumber = nil, 
        isExpectingAssertions = false, 
        suppressedErrors = {}
    };
    _G[l_JEST_MATCHERS_OBJECT_0] = {
        matchers = {}, 
        state = v10
    };
end;
local l_getState_0 = v7.getState;
return {
    INTERNAL_MATCHER_FLAG = v9, 
    getState = l_getState_0, 
    setState = function(v12) --[[ Line: 55 ]] --[[ Name: setState ]]
        -- upvalues: l_Object_0 (copy), l_JEST_MATCHERS_OBJECT_0 (copy)
        l_Object_0.assign(_G[l_JEST_MATCHERS_OBJECT_0].state, v12);
    end, 
    getMatchers = function() --[[ Line: 66 ]] --[[ Name: getMatchers ]]
        -- upvalues: l_JEST_MATCHERS_OBJECT_0 (copy)
        return _G[l_JEST_MATCHERS_OBJECT_0].matchers;
    end, 
    setMatchers = function(v13, v14, v15) --[[ Line: 77 ]] --[[ Name: setMatchers ]]
        -- upvalues: l_AsymmetricMatcher_0 (copy), l_Object_0 (copy), l_JEST_MATCHERS_OBJECT_0 (copy)
        for v16, v17 in pairs(v13) do
            if not v14 then
                local v18 = {};
                v18.__index = v18;
                setmetatable(v18, l_AsymmetricMatcher_0);
                v18.new = function(v19, ...) --[[ Line: 85 ]]
                    -- upvalues: l_AsymmetricMatcher_0 (ref), v18 (copy)
                    if v19 == nil then
                        v19 = false;
                    end;
                    local v20 = l_AsymmetricMatcher_0.new({
                        ...
                    }, v19);
                    setmetatable(v20, v18);
                    return v20;
                end;
                v18.asymmetricMatch = function(v21, v22) --[[ Line: 92 ]]
                    -- upvalues: v17 (copy)
                    local l_pass_0 = v17(v21:getMatcherContext(), v22, unpack(v21.sample)).pass;
                    if v21.inverse then
                        return not l_pass_0;
                    else
                        return l_pass_0;
                    end;
                end;
                v18.toString = function(v24) --[[ Line: 98 ]]
                    -- upvalues: v16 (copy)
                    if v24.inverse then
                        return string.format("never.%s", v16);
                    else
                        return (tostring(v16));
                    end;
                end;
                v18.getExpectedType = function(_) --[[ Line: 105 ]]
                    return "any";
                end;
                v18.toAsymmetricMatcher = function(v26) --[[ Line: 109 ]]
                    local l_sample_0 = v26.sample;
                    local v28 = 1;
                    local v29 = "";
                    while v28 < #l_sample_0 do
                        v29 = v29 .. tostring(l_sample_0[v28]) .. ", ";
                        v28 = v28 + 1;
                    end;
                    v29 = v29 .. tostring(l_sample_0[v28]);
                    return string.format("%s<%s>", v26:toString(), v29);
                end;
                v15[v16] = function(...) --[[ Line: 122 ]]
                    -- upvalues: v18 (copy)
                    return v18.new(false, ...);
                end;
                if not v15.never then
                    v15.never = {};
                end;
                v15.never[v16] = function(...) --[[ Line: 128 ]]
                    -- upvalues: v18 (copy)
                    return v18.new(true, ...);
                end;
            end;
        end;
        l_Object_0.assign(_G[l_JEST_MATCHERS_OBJECT_0].matchers, v13);
    end
};