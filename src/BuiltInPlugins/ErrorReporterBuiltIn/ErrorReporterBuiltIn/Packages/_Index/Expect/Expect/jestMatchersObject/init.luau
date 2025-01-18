local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Symbol_0 = v2.Symbol;
local l_Object_0 = v2.Object;
local l_AsymmetricMatcher_0 = require(l_Parent_0.asymmetricMatchers).AsymmetricMatcher;
local _ = require(l_Parent_0.types);
local v7 = l_Symbol_0.for_("$$jest-matchers-object");
local v8 = l_Symbol_0.for_("$$jest-internal-matcher");
if not _G[v7] then
    local v9 = {
        assertionCalls = 0, 
        expectedAssertionsNumber = nil, 
        isExpectingAssertions = false, 
        suppressedErrors = {}
    };
    _G[v7] = {
        matchers = {}, 
        state = v9
    };
end;
return {
    INTERNAL_MATCHER_FLAG = v8, 
    getState = function() --[[ Line: 44 ]] --[[ Name: getState ]]
        -- upvalues: v7 (copy)
        return _G[v7].state;
    end, 
    setState = function(v10) --[[ Line: 48 ]] --[[ Name: setState ]]
        -- upvalues: l_Object_0 (copy), v7 (copy)
        l_Object_0.assign(_G[v7].state, v10);
    end, 
    getMatchers = function() --[[ Line: 52 ]] --[[ Name: getMatchers ]]
        -- upvalues: v7 (copy)
        return _G[v7].matchers;
    end, 
    setMatchers = function(v11, v12, v13) --[[ Line: 58 ]] --[[ Name: setMatchers ]]
        -- upvalues: l_AsymmetricMatcher_0 (copy), l_Object_0 (copy), v7 (copy)
        for v14, v15 in pairs(v11) do
            if not v12 then
                local v16 = {};
                v16.__index = v16;
                setmetatable(v16, l_AsymmetricMatcher_0);
                v16.new = function(v17, ...) --[[ Line: 70 ]]
                    -- upvalues: l_AsymmetricMatcher_0 (ref), v16 (copy)
                    local v18 = l_AsymmetricMatcher_0.new({
                        ...
                    });
                    v18.inverse = v17;
                    setmetatable(v18, v16);
                    return v18;
                end;
                v16.asymmetricMatch = function(v19, v20) --[[ Line: 77 ]]
                    -- upvalues: v15 (copy)
                    local v21 = nil;
                    v21 = v15(nil, v20, unpack(v19.sample));
                    if v19.inverse then
                        return not v21.pass;
                    else
                        return v21.pass;
                    end;
                end;
                v16.toString = function(v22) --[[ Line: 88 ]]
                    -- upvalues: v14 (copy)
                    if v22.inverse then
                        return string.format("never.%s", v14);
                    else
                        return (tostring(v14));
                    end;
                end;
                v16.getExpectedType = function(_) --[[ Line: 95 ]]
                    return "any";
                end;
                v16.toAsymmetricMatcher = function(v24) --[[ Line: 99 ]]
                    local l_sample_0 = v24.sample;
                    local v26 = 1;
                    local v27 = "";
                    while v26 < #l_sample_0 do
                        v27 = v27 .. tostring(l_sample_0[v26]) .. ", ";
                        v26 = v26 + 1;
                    end;
                    v27 = v27 .. tostring(l_sample_0[v26]);
                    return string.format("%s<%s>", v24:toString(), v27);
                end;
                v13[v14] = function(...) --[[ Line: 115 ]]
                    -- upvalues: v16 (copy)
                    return v16.new(false, ...);
                end;
                if not v13.never then
                    v13.never = {};
                end;
                v13.never[v14] = function(...) --[[ Line: 121 ]]
                    -- upvalues: v16 (copy)
                    return v16.new(true, ...);
                end;
            end;
        end;
        l_Object_0.assign(_G[v7].matchers, v11);
    end
};