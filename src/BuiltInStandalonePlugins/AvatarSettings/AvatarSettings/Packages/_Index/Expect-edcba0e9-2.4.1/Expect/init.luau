local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_AssertionError_0 = v2.AssertionError;
local v5 = require(l_Parent_0.JestMatcherUtils);
local v6 = require(l_script_0.asymmetricMatchers);
local l_any_0 = v6.any;
local l_anything_0 = v6.anything;
local l_arrayContaining_0 = v6.arrayContaining;
local l_arrayNotContaining_0 = v6.arrayNotContaining;
local l_objectContaining_0 = v6.objectContaining;
local l_objectNotContaining_0 = v6.objectNotContaining;
local l_stringContaining_0 = v6.stringContaining;
local l_stringNotContaining_0 = v6.stringNotContaining;
local l_stringMatching_0 = v6.stringMatching;
local l_stringNotMatching_0 = v6.stringNotMatching;
local l_equals_0 = require(l_script_0.jasmineUtils).equals;
local v18 = require(l_script_0.jestMatchersObject);
local l_getMatchers_0 = v18.getMatchers;
local l_getState_0 = v18.getState;
local l_setMatchers_0 = v18.setMatchers;
local l_setState_0 = v18.setState;
local v23 = require(l_script_0.matchers);
local v24 = require(l_script_0.spyMatchers);
local l_matchers_0 = require(l_script_0.toThrowMatchers).matchers;
local _ = require(l_script_0.types);
local v27 = require(l_script_0.utils);
local l_iterableEquality_0 = v27.iterableEquality;
local l_subsetEquality_0 = v27.subsetEquality;
local v30 = nil;
local v31 = nil;
local function v38(_, v33, ...) --[[ Line: 89 ]] --[[ Name: expect_ ]]
    -- upvalues: l_getMatchers_0 (copy), v30 (ref)
    if #{
        ...
    } ~= 0 then
        error("Expect takes at most one argument.");
    end;
    local v34 = l_getMatchers_0();
    local v35 = {
        never = {}, 
        rejects = {
            never = {}
        }, 
        resolves = {
            never = {}
        }
    };
    for v36, v37 in pairs(v34) do
        v35[v36] = v30(v37, false, "", v33);
        v35.never[v36] = v30(v37, true, "", v33);
    end;
    return v35;
end;
local function _(v39) --[[ Line: 121 ]] --[[ Name: getMessage ]]
    -- upvalues: v5 (copy)
    if v39 then
        return (v39());
    else
        return (v5.RECEIVED_COLOR("No message was specified for this matcher."));
    end;
end;
v30 = function(v41, v42, v43, v44, v45) --[[ Line: 132 ]] --[[ Name: makeThrowingMatcher ]]
    -- upvalues: l_Object_0 (copy), l_iterableEquality_0 (copy), l_subsetEquality_0 (copy), v5 (copy), l_equals_0 (copy), l_getState_0 (copy), v31 (ref), l_AssertionError_0 (copy)
    return function(...) --[[ Line: 139 ]]
        -- upvalues: l_Object_0 (ref), l_iterableEquality_0 (ref), l_subsetEquality_0 (ref), v5 (ref), l_equals_0 (ref), v45 (copy), v42 (copy), v43 (copy), l_getState_0 (ref), v31 (ref), l_AssertionError_0 (ref), v41 (copy), v44 (copy)
        local v46 = true;
        local v47 = l_Object_0.assign({
            iterableEquality = l_iterableEquality_0, 
            subsetEquality = l_subsetEquality_0
        }, v5);
        local v48 = {
            dontThrow = function() --[[ Line: 154 ]] --[[ Name: dontThrow ]]
                -- upvalues: v46 (ref)
                v46 = false;
            end, 
            equals = l_equals_0, 
            error = v45, 
            isNot = v42, 
            promise = v43, 
            utils = v47
        };
        l_Object_0.assign(v48, l_getState_0());
        local function v53(v49, v50) --[[ Line: 165 ]] --[[ Name: processResult ]]
            -- upvalues: v31 (ref), l_getState_0 (ref), v42 (ref), v5 (ref), v45 (ref), l_Object_0 (ref), v46 (ref), l_AssertionError_0 (ref)
            v31(v49);
            l_getState_0().assertionCalls = l_getState_0().assertionCalls + 1;
            if v49.pass and v42 or not v49.pass and not v42 then
                local l_message_0 = v49.message;
                local v52 = if l_message_0 then l_message_0() else v5.RECEIVED_COLOR("No message was specified for this matcher.");
                l_message_0 = nil;
                if v45 then
                    l_message_0 = v45;
                    l_message_0.message = v52;
                elseif v50 then
                    error("Currently async is not implemented");
                else
                    l_message_0 = {
                        message = v52
                    };
                end;
                l_message_0.matcherResult = l_Object_0.assign({}, v49, {
                    message = v52
                });
                if v46 then
                    error(l_AssertionError_0.new({
                        message = v52
                    }));
                    return;
                else
                    table.insert(l_getState_0().suppressedErrors, error);
                end;
            end;
        end;
        local v54 = nil;
        local v55 = nil;
        local v56 = nil;
        if not xpcall(function(...) --[[ Line: 200 ]]
            -- upvalues: v54 (ref), v41 (ref), v48 (copy), v44 (ref), v53 (copy)
            v54 = v41(v48, v44, ...);
            return v53(v54);
        end, function(v57) --[[ Line: 207 ]]
            -- upvalues: v55 (ref), v56 (ref)
            v55 = debug.traceback(nil, 7);
            v56 = v57;
        end, ...) then
            if typeof(v56) == "table" and typeof(v56.message) == "string" then
                local v58 = l_AssertionError_0.new({
                    message = v56.message
                });
                v58.stack = v55;
                error(v58);
            else
                local v59 = l_AssertionError_0.new({
                    message = v56
                });
                v59.stack = v55;
                error(v59);
            end;
        end;
    end;
end;
v31 = function(v60) --[[ Line: 226 ]] --[[ Name: _validateResult ]]
    -- upvalues: v5 (copy)
    if typeof(v60) ~= "table" or typeof(v60.pass) ~= "boolean" or v60.message and typeof(v60.message) ~= "string" and typeof(v60.message) ~= "function" then
        error("Unexpected return from a matcher function.\n" .. "Matcher functions should " .. "return an object in the following format:\n" .. "  {message?: string | function, pass: boolean}\n" .. v5.stringify(v60) .. " was returned");
    end;
end;
local v61 = {};
v61.extend = function(v62) --[[ Line: 250 ]]
    -- upvalues: l_setMatchers_0 (copy), v61 (copy)
    l_setMatchers_0(v62, false, v61);
end;
v61.anything = l_anything_0;
v61.any = l_any_0;
v61.never = {
    arrayContaining = l_arrayNotContaining_0, 
    objectContaining = l_objectNotContaining_0, 
    stringContaining = l_stringNotContaining_0, 
    stringMatching = l_stringNotMatching_0
};
v61.objectContaining = l_objectContaining_0;
v61.arrayContaining = l_arrayContaining_0;
v61.stringContaining = l_stringContaining_0;
v61.stringMatching = l_stringMatching_0;
l_setMatchers_0(v23, true, v61);
l_setMatchers_0(v24, true, v61);
l_setMatchers_0(l_matchers_0, true, v61);
local l_plugins_0 = require(l_Parent_0.JestSnapshot).plugins;
v61.addSnapshotSerializer = l_plugins_0.addSerializer;
v61.resetSnapshotSerializers = l_plugins_0.resetSerializers;
v61.getState = l_getState_0;
v61.setState = l_setState_0;
local v64 = require(l_Parent_0.JestSnapshot);
local l_toMatchSnapshot_0 = v64.toMatchSnapshot;
local l_toThrowErrorMatchingSnapshot_0 = v64.toThrowErrorMatchingSnapshot;
l_setMatchers_0({
    toMatchSnapshot = l_toMatchSnapshot_0, 
    toThrowErrorMatchingSnapshot = l_toThrowErrorMatchingSnapshot_0
}, false, v61);
setmetatable(v61, {
    __call = v38
});
return v61;