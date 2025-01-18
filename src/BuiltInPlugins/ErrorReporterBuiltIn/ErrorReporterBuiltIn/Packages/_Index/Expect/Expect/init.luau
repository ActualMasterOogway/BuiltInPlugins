local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local v5 = require(l_Parent_0.JestMatcherUtils);
local v6 = require(l_script_0.matchers);
local v7 = require(l_script_0.spyMatchers);
local l_matchers_0 = require(l_script_0.toThrowMatchers).matchers;
local _ = require(l_script_0.types);
local l_equals_0 = require(l_script_0.jasmineUtils).equals;
local v11 = require(l_script_0.utils);
local l_iterableEquality_0 = v11.iterableEquality;
local l_subsetEquality_0 = v11.subsetEquality;
local v14 = require(l_script_0.asymmetricMatchers);
local l_any_0 = v14.any;
local l_anything_0 = v14.anything;
local l_arrayContaining_0 = v14.arrayContaining;
local l_arrayNotContaining_0 = v14.arrayNotContaining;
local l_objectContaining_0 = v14.objectContaining;
local l_objectNotContaining_0 = v14.objectNotContaining;
local l_stringContaining_0 = v14.stringContaining;
local l_stringNotContaining_0 = v14.stringNotContaining;
local l_stringMatching_0 = v14.stringMatching;
local l_stringNotMatching_0 = v14.stringNotMatching;
local v25 = require(l_script_0.jestMatchersObject);
local l_getMatchers_0 = v25.getMatchers;
local l_getState_0 = v25.getState;
local l_setMatchers_0 = v25.setMatchers;
local v29 = nil;
local v30 = nil;
local function v37(_, v32, ...) --[[ Line: 71 ]] --[[ Name: expect_ ]]
    -- upvalues: l_getMatchers_0 (copy), v29 (ref)
    if #{
        ...
    } ~= 0 then
        error("Expect takes at most one argument.");
    end;
    local v33 = l_getMatchers_0();
    local v34 = {
        never = {}, 
        rejects = {
            never = {}
        }, 
        resolves = {
            never = {}
        }
    };
    for v35, v36 in pairs(v33) do
        v34[v35] = v29(v36, false, "", v32);
        v34.never[v35] = v29(v36, true, "", v32);
    end;
    return v34;
end;
local function _(v38) --[[ Line: 93 ]] --[[ Name: getMessage ]]
    -- upvalues: v5 (copy)
    if v38 then
        return v38();
    else
        return v5.RECEIVED_COLOR("No message was specified for this matcher.");
    end;
end;
v29 = function(v40, v41, v42, v43, v44) --[[ Line: 103 ]] --[[ Name: makeThrowingMatcher ]]
    -- upvalues: l_Object_0 (copy), l_iterableEquality_0 (copy), l_subsetEquality_0 (copy), v5 (copy), l_equals_0 (copy), l_getState_0 (copy), v30 (ref), l_Error_0 (copy)
    return function(...) --[[ Line: 110 ]]
        -- upvalues: l_Object_0 (ref), l_iterableEquality_0 (ref), l_subsetEquality_0 (ref), v5 (ref), l_equals_0 (ref), v44 (copy), v41 (copy), v42 (copy), l_getState_0 (ref), v30 (ref), l_Error_0 (ref), v40 (copy), v43 (copy)
        local v45 = true;
        local v46 = l_Object_0.assign({
            iterableEquality = l_iterableEquality_0, 
            subsetEquality = l_subsetEquality_0
        }, v5);
        local v47 = {
            dontThrow = function() --[[ Line: 125 ]] --[[ Name: dontThrow ]]
                -- upvalues: v45 (ref)
                v45 = false;
            end, 
            equals = l_equals_0, 
            error = v44, 
            isNot = v41, 
            promise = v42, 
            utils = v46
        };
        l_Object_0.assign(v47, l_getState_0());
        local function v52(v48, v49) --[[ Line: 134 ]] --[[ Name: processResult ]]
            -- upvalues: v30 (ref), l_getState_0 (ref), v41 (ref), v5 (ref), v44 (ref), v45 (ref), l_Error_0 (ref)
            v30(v48);
            l_getState_0().assertionCalls = l_getState_0().assertionCalls + 1;
            if v48.pass and v41 or not v48.pass and not v41 then
                local l_message_0 = v48.message;
                local v51 = if l_message_0 then l_message_0() else v5.RECEIVED_COLOR("No message was specified for this matcher.");
                l_message_0 = nil;
                if v44 then
                    l_message_0 = v44;
                    l_message_0.message = v51;
                elseif v49 then
                    error("Currently async is not implemented");
                else
                    l_message_0 = {
                        message = v51
                    };
                end;
                l_message_0.matcherResult = v48;
                if v45 then
                    error(l_Error_0(v51));
                    return;
                else
                    table.insert(l_getState_0().suppressedErrors, error);
                end;
            end;
        end;
        local v53 = nil;
        local v54 = nil;
        local v55 = nil;
        if not xpcall(function(...) --[[ Line: 172 ]]
            -- upvalues: v53 (ref), v40 (ref), v47 (copy), v43 (ref), v52 (copy)
            v53 = v40(v47, v43, ...);
            return v52(v53);
        end, function(v56) --[[ Line: 179 ]]
            -- upvalues: v54 (ref), v55 (ref)
            v54 = debug.traceback(nil, 7);
            v55 = v56;
        end, ...) then
            if typeof(v55) == "table" and typeof(v55.message) == "string" then
                local v57 = l_Error_0(v55.message);
                v57.stack = v54;
                error(v57);
            else
                local v58 = l_Error_0(v55);
                v58.stack = v54;
                error(v58);
            end;
        end;
    end;
end;
v30 = function(v59) --[[ Line: 198 ]] --[[ Name: _validateResult ]]
    -- upvalues: v5 (copy)
    if typeof(v59) ~= "table" or typeof(v59.pass) ~= "boolean" or v59.message and typeof(v59.message) ~= "string" and typeof(v59.message) ~= "function" then
        error("Unexpected return from a matcher function.\n" .. "Matcher functions should " .. "return an object in the following format:\n" .. "  {message?: string | function, pass: boolean}\n" .. v5.stringify(v59) .. " was returned");
    end;
end;
local v60 = {};
v60.extend = function(v61) --[[ Line: 217 ]]
    -- upvalues: l_setMatchers_0 (copy), v60 (copy)
    l_setMatchers_0(v61, false, v60);
end;
v60.anything = l_anything_0;
v60.any = l_any_0;
v60.never = {
    arrayContaining = l_arrayNotContaining_0, 
    objectContaining = l_objectNotContaining_0, 
    stringContaining = l_stringNotContaining_0, 
    stringMatching = l_stringNotMatching_0
};
v60.objectContaining = l_objectContaining_0;
v60.arrayContaining = l_arrayContaining_0;
v60.stringContaining = l_stringContaining_0;
v60.stringMatching = l_stringMatching_0;
l_setMatchers_0(v6, true, v60);
l_setMatchers_0(v7, true, v60);
l_setMatchers_0(l_matchers_0, true, v60);
local v62 = require(l_Parent_0.JestSnapshot);
local l_toMatchSnapshot_0 = v62.toMatchSnapshot;
local l_toThrowErrorMatchingSnapshot_0 = v62.toThrowErrorMatchingSnapshot;
l_setMatchers_0({
    toMatchSnapshot = l_toMatchSnapshot_0, 
    toThrowErrorMatchingSnapshot = l_toThrowErrorMatchingSnapshot_0
}, false, v60);
setmetatable(v60, {
    __call = v37
});
local l_plugins_0 = require(l_Parent_0.JestSnapshot).plugins;
v60.addSnapshotSerializer = l_plugins_0.addSerializer;
v60.resetSnapshotSerializers = l_plugins_0.resetSerializers;
return v60;