local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Boolean_0 = v2.Boolean;
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local v6 = require(l_Parent_0.Promise);
local v7 = require(l_Parent_0.JestMatcherUtils);
local v8 = require(l_script_0.asymmetricMatchers);
local l_any_0 = v8.any;
local l_anything_0 = v8.anything;
local l_arrayContaining_0 = v8.arrayContaining;
local l_arrayNotContaining_0 = v8.arrayNotContaining;
local l_closeTo_0 = v8.closeTo;
local l_notCloseTo_0 = v8.notCloseTo;
local l_nothing_0 = v8.nothing;
local l_objectContaining_0 = v8.objectContaining;
local l_objectNotContaining_0 = v8.objectNotContaining;
local l_stringContaining_0 = v8.stringContaining;
local l_stringMatching_0 = v8.stringMatching;
local l_stringNotContaining_0 = v8.stringNotContaining;
local l_stringNotMatching_0 = v8.stringNotMatching;
local l_default_0 = require(l_script_0.extractExpectedAssertionsErrors).default;
local l_equals_0 = require(l_script_0.jasmineUtils).equals;
local v24 = require(l_script_0.jestMatchersObject);
local l_getMatchers_0 = v24.getMatchers;
local l_getState_0 = v24.getState;
local l_setMatchers_0 = v24.setMatchers;
local l_setState_0 = v24.setState;
local v29 = require(l_script_0.matchers);
local v30 = require(l_script_0.spyMatchers);
local v31 = require(l_script_0.toThrowMatchers);
local l_matchers_0 = v31.matchers;
local l_createMatcher_0 = v31.createMatcher;
local _ = require(l_script_0.types);
local v35 = require(l_script_0.utils);
local l_iterableEquality_0 = v35.iterableEquality;
local l_subsetEquality_0 = v35.subsetEquality;
local v38 = nil;
local v39 = nil;
local v40 = setmetatable({}, {
    __index = l_Error_0
});
v40.__index = v40;
v40.new = function(v41) --[[ Line: 98 ]] --[[ Name: new ]]
    -- upvalues: l_Error_0 (copy), v40 (copy)
    return (setmetatable(l_Error_0.new(v41), v40));
end;
local function _(v42) --[[ Line: 103 ]] --[[ Name: isPromise ]]
    -- upvalues: l_Boolean_0 (copy)
    return not not l_Boolean_0.toJSBoolean(v42) and (not (typeof(v42) ~= "table") or typeof(v42) == "function") and typeof(v42.andThen) == "function";
end;
local function _(v44) --[[ Line: 111 ]] --[[ Name: createToThrowErrorMatchingSnapshotMatcher ]]
    return function(v45, v46, v47) --[[ Line: 112 ]]
        -- upvalues: v44 (copy)
        return v44(v45, table.unpack({
            v46, 
            v47, 
            true
        }));
    end;
end;
local function _(v49, v50) --[[ Line: 117 ]] --[[ Name: getPromiseMatcher ]]
    -- upvalues: l_createMatcher_0 (copy)
    if v49 == "toThrow" or v49 == "toThrowError" then
        return l_createMatcher_0(v49, true);
    elseif v49 == "toThrowErrorMatchingSnapshot" or v49 == "toThrowErrorMatchingInlineSnapshot" then
        return function(v51, v52, v53) --[[ Line: 112 ]]
            -- upvalues: v50 (copy)
            return v50(v51, table.unpack({
                v52, 
                v53, 
                true
            }));
        end;
    else
        return nil;
    end;
end;
local v55 = nil;
local v56 = nil;
local function v69(_, v58, ...) --[[ Line: 129 ]] --[[ Name: expect_ ]]
    -- upvalues: l_getMatchers_0 (copy), v40 (copy), l_createMatcher_0 (copy), l_Boolean_0 (copy), v38 (ref), v55 (ref), v56 (ref)
    if #{
        ...
    } ~= 0 then
        error("Expect takes at most one argument.");
    end;
    local v59 = l_getMatchers_0();
    local v60 = {
        never = {}, 
        rejects = {
            never = {}
        }, 
        resolves = {
            never = {}
        }
    };
    local v61 = v40.new();
    for v62, v63 in pairs(v59) do
        local v67 = if not (v62 ~= "toThrow") or v62 == "toThrowError" then l_createMatcher_0(v62, true) else (not (v62 ~= "toThrowErrorMatchingSnapshot") or v62 == "toThrowErrorMatchingInlineSnapshot") and function(v64, v65, v66) --[[ Line: 112 ]]
            -- upvalues: v63 (copy)
            return v63(v64, table.unpack({
                v65, 
                v66, 
                true
            }));
        end or nil;
        local v68 = l_Boolean_0.toJSBoolean(v67) and v67 or v63;
        v60[v62] = v38(v63, false, "", v58);
        v60.never[v62] = v38(v63, true, "", v58);
        v60.resolves[v62] = v55(v62, v68, false, v58, v61);
        v60.resolves.never[v62] = v55(v62, v68, true, v58, v61);
        v60.rejects[v62] = v56(v62, v68, false, v58, v61);
        v60.rejects.never[v62] = v56(v62, v68, true, v58, v61);
    end;
    return v60;
end;
local function _(v70) --[[ Line: 160 ]] --[[ Name: getMessage ]]
    -- upvalues: v7 (copy)
    if v70 then
        return (v70());
    else
        return (v7.RECEIVED_COLOR("No message was specified for this matcher."));
    end;
end;
v55 = function(v72, v73, v74, v75, v76) --[[ Line: 164 ]] --[[ Name: makeResolveMatcher ]]
    -- upvalues: l_Boolean_0 (copy), v40 (copy), v7 (copy), v38 (ref), v6 (copy)
    return function(...) --[[ Line: 171 ]]
        -- upvalues: v74 (copy), v75 (copy), l_Boolean_0 (ref), v40 (ref), v7 (ref), v72 (copy), v38 (ref), v73 (copy), v76 (copy), v6 (ref)
        local v77 = {
            ...
        };
        local v78 = {
            isNot = v74, 
            promise = "resolves"
        };
        local l_v75_0 = v75;
        if not (not not l_Boolean_0.toJSBoolean(l_v75_0) and (not (typeof(l_v75_0) ~= "table") or typeof(l_v75_0) == "function") and typeof(l_v75_0.andThen) == "function") then
            error(v40.new(v7.matcherErrorMessage(v7.matcherHint(v72, nil, "", v78), ("%s value must be a promise"):format((tostring(v7.RECEIVED_COLOR("received")))), v7.printWithType("Received", v75, v7.printReceived))));
        end;
        local v80 = v40.new();
        return v75:andThen(function(v81) --[[ Line: 186 ]]
            -- upvalues: v38 (ref), v73 (ref), v74 (ref), v80 (copy), v77 (copy)
            return v38(v73, v74, "resolves", v81, v80)(table.unpack(v77));
        end, function(v82) --[[ Line: 188 ]]
            -- upvalues: v76 (ref), v7 (ref), v72 (ref), v78 (copy), v6 (ref)
            v76.message = tostring(v7.matcherHint(v72, nil, "", v78)) .. "\n\n" .. "Received promise rejected instead of resolved\n" .. ("Rejected to value: %s"):format(v7.printReceived(v82));
            return v6.reject(v76);
        end);
    end;
end;
v56 = function(v83, v84, v85, v86, v87) --[[ Line: 198 ]] --[[ Name: makeRejectMatcher ]]
    -- upvalues: l_Boolean_0 (copy), v40 (copy), v7 (copy), v6 (copy), v38 (ref)
    return function(...) --[[ Line: 205 ]]
        -- upvalues: v85 (copy), v86 (copy), l_Boolean_0 (ref), v40 (ref), v7 (ref), v83 (copy), v87 (copy), v6 (ref), v38 (ref), v84 (copy)
        local v88 = {
            ...
        };
        local v89 = {
            isNot = v85, 
            promise = "rejects"
        };
        local v90 = if typeof(v86) == "function" then v86() else v86;
        if not (not not l_Boolean_0.toJSBoolean(v90) and (not (typeof(v90) ~= "table") or typeof(v90) == "function") and typeof(v90.andThen) == "function") then
            error(v40.new(v7.matcherErrorMessage(v7.matcherHint(v83, nil, "", v89), ("%s value must be a promise or a function returning a promise"):format((tostring(v7.RECEIVED_COLOR("received")))), v7.printWithType("Received", v86, v7.printReceived))));
        end;
        local v91 = v40.new();
        return v90:andThen(function(v92) --[[ Line: 223 ]]
            -- upvalues: v87 (ref), v7 (ref), v83 (ref), v89 (copy), v6 (ref)
            v87.message = tostring(v7.matcherHint(v83, nil, "", v89)) .. "\n\n" .. "Received promise resolved instead of rejected\n" .. ("Resolved to value: %s"):format(v7.printReceived(v92));
            return v6.reject(v87);
        end, function(v93) --[[ Line: 229 ]]
            -- upvalues: v38 (ref), v84 (ref), v85 (ref), v91 (copy), v88 (copy)
            return v38(v84, v85, "rejects", v93, v91)(table.unpack(v88));
        end);
    end;
end;
v38 = function(v94, v95, v96, v97, v98) --[[ Line: 237 ]] --[[ Name: makeThrowingMatcher ]]
    -- upvalues: l_Object_0 (copy), l_iterableEquality_0 (copy), l_subsetEquality_0 (copy), v7 (copy), l_equals_0 (copy), l_getState_0 (copy), v39 (ref), v40 (copy), l_Error_0 (copy)
    local function v99(...) --[[ Line: 244 ]] --[[ Name: throwingMatcher ]]
        -- upvalues: l_Object_0 (ref), l_iterableEquality_0 (ref), l_subsetEquality_0 (ref), v7 (ref), l_equals_0 (ref), v98 (copy), v95 (copy), v96 (copy), l_getState_0 (ref), v39 (ref), v40 (ref), l_Error_0 (ref), v99 (copy), v94 (copy), v97 (copy)
        local v100 = true;
        local v101 = l_Object_0.assign({
            iterableEquality = l_iterableEquality_0, 
            subsetEquality = l_subsetEquality_0
        }, v7);
        local v102 = {
            dontThrow = function() --[[ Line: 259 ]] --[[ Name: dontThrow ]]
                -- upvalues: v100 (ref)
                v100 = false;
            end, 
            equals = l_equals_0, 
            error = v98, 
            isNot = v95, 
            promise = v96, 
            utils = v101
        };
        l_Object_0.assign(v102, l_getState_0());
        local function v107(v103, v104) --[[ Line: 270 ]] --[[ Name: processResult ]]
            -- upvalues: v39 (ref), l_getState_0 (ref), v95 (ref), v7 (ref), v98 (ref), v40 (ref), l_Object_0 (ref), v100 (ref)
            v39(v103);
            l_getState_0().assertionCalls = l_getState_0().assertionCalls + 1;
            if v103.pass and v95 or not v103.pass and not v95 then
                local l_message_0 = v103.message;
                local v106 = if l_message_0 then l_message_0() else v7.RECEIVED_COLOR("No message was specified for this matcher.");
                l_message_0 = nil;
                if v98 then
                    l_message_0 = v98;
                    l_message_0.message = v106;
                elseif v104 then
                    error("Currently async is not implemented");
                else
                    l_message_0 = v40.new(v106);
                end;
                l_message_0.matcherResult = l_Object_0.assign({}, v103, {
                    message = v106
                });
                if v100 then
                    error(l_message_0);
                    return;
                else
                    table.insert(l_getState_0().suppressedErrors, l_message_0);
                end;
            end;
        end;
        local function _(v108) --[[ Line: 309 ]] --[[ Name: handleError ]]
            -- upvalues: l_Error_0 (ref), v99 (ref)
            if l_Error_0.captureStackTrace and typeof(v108) == "table" then
                l_Error_0.captureStackTrace(v108, v99);
            end;
            error(v108);
        end;
        local l_status_0, l_result_0 = pcall(function(...) --[[ Line: 326 ]]
            -- upvalues: v94 (ref), v102 (copy), v97 (ref), v107 (copy)
            local v110 = v94(v102, v97, ...);
            v107(v110);
        end, ...);
        if not l_status_0 then
            if l_Error_0.captureStackTrace and typeof(l_result_0) == "table" then
                l_Error_0.captureStackTrace(l_result_0, v99);
            end;
            error(l_result_0);
        end;
    end;
    return v99;
end;
v39 = function(v113) --[[ Line: 342 ]] --[[ Name: _validateResult ]]
    -- upvalues: v7 (copy)
    if typeof(v113) ~= "table" or typeof(v113.pass) ~= "boolean" or v113.message and typeof(v113.message) ~= "string" and typeof(v113.message) ~= "function" then
        error("Unexpected return from a matcher function.\n" .. "Matcher functions should " .. "return an object in the following format:\n" .. "  {message?: string | function, pass: boolean}\n" .. v7.stringify(v113) .. " was returned");
    end;
end;
local v114 = {};
v114.extend = function(v115) --[[ Line: 366 ]]
    -- upvalues: l_setMatchers_0 (copy), v114 (copy)
    l_setMatchers_0(v115, false, v114);
end;
v114.anything = l_anything_0;
v114.any = l_any_0;
v114.nothing = l_nothing_0;
v114.never = {
    arrayContaining = l_arrayNotContaining_0, 
    closeTo = l_notCloseTo_0, 
    objectContaining = l_objectNotContaining_0, 
    stringContaining = l_stringNotContaining_0, 
    stringMatching = l_stringNotMatching_0
};
v114.objectContaining = l_objectContaining_0;
v114.arrayContaining = l_arrayContaining_0;
v114.closeTo = l_closeTo_0;
v114.stringContaining = l_stringContaining_0;
v114.stringMatching = l_stringMatching_0;
local function v116(v117) --[[ Line: 394 ]] --[[ Name: assertions ]]
    -- upvalues: l_Error_0 (copy), v116 (copy), l_setState_0 (copy)
    local v118 = l_Error_0.new();
    if l_Error_0.captureStackTrace then
        l_Error_0.captureStackTrace(v118, v116);
    end;
    l_setState_0({
        expectedAssertionsNumber = v117, 
        expectedAssertionsNumberError = v118
    });
end;
local function v119(...) --[[ Line: 401 ]] --[[ Name: hasAssertions ]]
    -- upvalues: l_Error_0 (copy), v119 (copy), v7 (copy), l_setState_0 (copy)
    local v120 = {
        ...
    };
    local v121 = l_Error_0.new();
    if l_Error_0.captureStackTrace then
        l_Error_0.captureStackTrace(v121, v119);
    end;
    v7.ensureNoExpected(v120[1], ".hasAssertions");
    l_setState_0({
        isExpectingAssertions = true, 
        isExpectingAssertionsError = v121
    });
end;
l_setMatchers_0(v29, true, v114);
l_setMatchers_0(v30, true, v114);
l_setMatchers_0(l_matchers_0, true, v114);
v114.addSnapshotSerializer = require(l_Parent_0.JestSnapshot).plugins.addSerializer;
v114.assertions = v116;
v114.hasAssertions = v119;
v114.getState = l_getState_0;
v114.setState = l_setState_0;
v114.extractExpectedAssertionsErrors = l_default_0;
local v122 = require(l_Parent_0.JestSnapshot);
local l_toMatchSnapshot_0 = v122.toMatchSnapshot;
local l_toThrowErrorMatchingSnapshot_0 = v122.toThrowErrorMatchingSnapshot;
l_setMatchers_0({
    toMatchSnapshot = l_toMatchSnapshot_0, 
    toThrowErrorMatchingSnapshot = l_toThrowErrorMatchingSnapshot_0
}, false, v114);
setmetatable(v114, {
    __call = v69
});
return v114;