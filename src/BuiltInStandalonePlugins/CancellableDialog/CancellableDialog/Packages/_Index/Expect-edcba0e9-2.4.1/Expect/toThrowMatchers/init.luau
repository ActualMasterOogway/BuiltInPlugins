local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_instanceof_0 = v3.instanceof;
local l_Error_0 = v3.Error;
local _ = require(l_Parent_1.RegExp);
local v7 = require(l_Parent_1.JestMatcherUtils);
local l_EXPECTED_COLOR_0 = v7.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v7.RECEIVED_COLOR;
local l_matcherErrorMessage_0 = v7.matcherErrorMessage;
local l_matcherHint_0 = v7.matcherHint;
local l_printDiffOrStringify_0 = v7.printDiffOrStringify;
local l_printExpected_0 = v7.printExpected;
local l_printReceived_0 = v7.printReceived;
local l_printWithType_0 = v7.printWithType;
local l_stringify_0 = v7.stringify;
local l_formatStackTrace_0 = require(l_Parent_1.JestMessageUtil).formatStackTrace;
local v18 = require(l_Parent_0.print);
local l_printExpectedConstructorName_0 = v18.printExpectedConstructorName;
local l_printExpectedConstructorNameNot_0 = v18.printExpectedConstructorNameNot;
local l_printReceivedConstructorName_0 = v18.printReceivedConstructorName;
local l_printReceivedConstructorNameNot_0 = v18.printReceivedConstructorNameNot;
local l_printReceivedStringContainExpectedResult_0 = v18.printReceivedStringContainExpectedResult;
local l_printReceivedStringContainExpectedSubstring_0 = v18.printReceivedStringContainExpectedSubstring;
local _ = require(l_Parent_0.types);
local l_isError_0 = require(l_Parent_0.utils).isError;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local function v38(v36) --[[ Line: 68 ]] --[[ Name: getThrown ]]
    local v37 = false;
    if v36 ~= nil then
        v37 = true;
        if typeof(v36.message) ~= "string" then
            v37 = typeof(v36.message) == "table";
        end;
    end;
    if v37 and typeof(v36.name) == "string" and typeof(v36.stack) == "string" then
        return {
            hasMessage = v37, 
            isError = true, 
            message = v36.message, 
            value = v36
        };
    elseif v37 then
        return {
            hasMessage = v37, 
            isError = false, 
            message = v36.message, 
            value = v36
        };
    else
        return {
            hasMessage = v37, 
            isError = false, 
            message = tostring(v36), 
            value = v36
        };
    end;
end;
local function v68(v39, v40) --[[ Line: 101 ]] --[[ Name: createMatcher ]]
    -- upvalues: l_isError_0 (copy), v38 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getType_0 (copy), l_stringify_0 (copy), v32 (ref), v28 (ref), v31 (ref), v27 (ref), v30 (ref), v29 (ref), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy)
    return function(v41, v42, v43) --[[ Line: 102 ]]
        -- upvalues: v40 (copy), l_isError_0 (ref), v38 (ref), l_Error_0 (ref), l_matcherErrorMessage_0 (ref), l_matcherHint_0 (ref), v39 (copy), l_RECEIVED_COLOR_0 (ref), l_printWithType_0 (ref), l_printReceived_0 (ref), l_getType_0 (ref), l_stringify_0 (ref), v32 (ref), v28 (ref), v31 (ref), v27 (ref), v30 (ref), v29 (ref), l_EXPECTED_COLOR_0 (ref), l_printExpected_0 (ref)
        local v44 = {
            isNot = v41.isNot, 
            promise = v41.promise
        };
        local v45 = nil;
        if v40 and l_isError_0(v42) then
            v45 = v38(v42);
        elseif typeof(v42) ~= "function" and (typeof(v42) ~= "table" or not getmetatable(v42) or not getmetatable(v42).__call) then
            if not v40 then
                local v46 = nil;
                v46 = v43 == nil and "" or "expected";
                error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v39, nil, v46, v44), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", v42, l_printReceived_0))));
            end;
        else
            local function _(v47) --[[ Line: 149 ]] --[[ Name: getTopStackEntry ]]
                return string.match(v47, "[^\n]+");
            end;
            local function v55(v49, v50) --[[ Line: 155 ]] --[[ Name: diffStack ]]
                local v51 = "";
                local v52 = "";
                local v53 = string.match(v49, "[^\n]+");
                for v54 in string.gmatch(v50, "[^\n]+") do
                    if v54 == v53 then
                        return v52;
                    else
                        v52 = v51;
                        v51 = v51 .. "\n" .. v54;
                    end;
                end;
                return nil;
            end;
            local v56 = nil;
            do
                local l_v56_0 = v56;
                local v66, v67 = xpcall(function() --[[ Line: 174 ]]
                    -- upvalues: l_v56_0 (ref), v42 (copy)
                    l_v56_0 = debug.traceback(nil, 2);
                    v42();
                end, function(v58) --[[ Line: 177 ]]
                    -- upvalues: l_getType_0 (ref), v55 (copy), l_v56_0 (ref), l_stringify_0 (ref), l_Error_0 (ref)
                    if v58 == nil then
                        v58 = "nil";
                    elseif l_getType_0(v58) == "error" or typeof(v58) == "table" and v58.message then
                        if v58.stack == nil then
                            v58.stack = v55(l_v56_0, debug.traceback());
                            return v58;
                        else
                            if not v58.stack:find("ThrowMatchers%-test%.js") then
                                v58.stack = v55(l_v56_0, v58.stack);
                            end;
                            return v58;
                        end;
                    elseif typeof(v58) == "string" then
                        local _, _, v61 = v58:find("[%S+\\.]+:[0-9]+:%s(.*)");
                        if v61 ~= nil then
                            v58 = v61;
                        end;
                    elseif typeof(v58) == "table" then
                        v58 = l_stringify_0(v58);
                    end;
                    local v62 = l_Error_0(v58);
                    local l_find_0 = string.find;
                    local l_stack_0 = v62.stack;
                    local l_stack_1 = v62.stack;
                    l_find_0, l_stack_0 = l_find_0(l_stack_0, string.match(l_stack_1, "[^\n]+"), 1, true);
                    v62.stack = string.sub(v62.stack, l_stack_0 + 1 + 1);
                    v62.stack = v55(l_v56_0, v62.stack);
                    v62["$$robloxInternalJestError"] = true;
                    return v62;
                end);
                if not v66 then
                    v45 = v38(v67);
                end;
            end;
        end;
        if v43 == nil then
            return v32(v39, v44, v45);
        elseif typeof(v43) == "table" and typeof(v43.asymmetricMatch) == "function" then
            return v28(v39, v44, v45, v43);
        elseif typeof(v43) == "string" then
            return v31(v39, v44, v45, v43);
        elseif l_getType_0(v43) == "regexp" then
            return v27(v39, v44, v45, v43);
        elseif typeof(v43) == "table" and not v43.message then
            return v30(v39, v44, v45, v43);
        elseif typeof(v43) == "table" then
            return v29(v39, v44, v45, v43);
        else
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v39, nil, nil, v44), l_EXPECTED_COLOR_0("expected") .. " value must be a string or regular expression or class or error", l_printWithType_0("Expected", v43, l_printExpected_0))));
            return;
        end;
    end;
end;
local v69 = {};
local v70 = nil;
local v71 = "toThrow";
local l_v70_0 = v70 --[[ copy: 41 -> 43 ]];
local l_v71_0 = v71 --[[ copy: 42 -> 44 ]];
v69.toThrow = function(v74, v75, v76) --[[ Line: 102 ]]
    -- upvalues: l_v70_0 (copy), l_isError_0 (copy), v38 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_v71_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getType_0 (copy), l_stringify_0 (copy), v32 (ref), v28 (ref), v31 (ref), v27 (ref), v30 (ref), v29 (ref), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy)
    local v77 = {
        isNot = v74.isNot, 
        promise = v74.promise
    };
    local v78 = nil;
    if l_v70_0 and l_isError_0(v75) then
        v78 = v38(v75);
    elseif typeof(v75) ~= "function" and (typeof(v75) ~= "table" or not getmetatable(v75) or not getmetatable(v75).__call) then
        if not l_v70_0 then
            local v79 = nil;
            v79 = v76 == nil and "" or "expected";
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v71_0, nil, v79, v77), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", v75, l_printReceived_0))));
        end;
    else
        local function _(v80) --[[ Line: 149 ]] --[[ Name: getTopStackEntry ]]
            return string.match(v80, "[^\n]+");
        end;
        local function v88(v82, v83) --[[ Line: 155 ]] --[[ Name: diffStack ]]
            local v84 = "";
            local v85 = "";
            local v86 = string.match(v82, "[^\n]+");
            for v87 in string.gmatch(v83, "[^\n]+") do
                if v87 == v86 then
                    return v85;
                else
                    v85 = v84;
                    v84 = v84 .. "\n" .. v87;
                end;
            end;
            return nil;
        end;
        local v89 = nil;
        do
            local l_v89_0 = v89;
            local v99, v100 = xpcall(function() --[[ Line: 174 ]]
                -- upvalues: l_v89_0 (ref), v75 (copy)
                l_v89_0 = debug.traceback(nil, 2);
                v75();
            end, function(v91) --[[ Line: 177 ]]
                -- upvalues: l_getType_0 (ref), v88 (copy), l_v89_0 (ref), l_stringify_0 (ref), l_Error_0 (ref)
                if v91 == nil then
                    v91 = "nil";
                elseif l_getType_0(v91) == "error" or typeof(v91) == "table" and v91.message then
                    if v91.stack == nil then
                        v91.stack = v88(l_v89_0, debug.traceback());
                        return v91;
                    else
                        if not v91.stack:find("ThrowMatchers%-test%.js") then
                            v91.stack = v88(l_v89_0, v91.stack);
                        end;
                        return v91;
                    end;
                elseif typeof(v91) == "string" then
                    local _, _, v94 = v91:find("[%S+\\.]+:[0-9]+:%s(.*)");
                    if v94 ~= nil then
                        v91 = v94;
                    end;
                elseif typeof(v91) == "table" then
                    v91 = l_stringify_0(v91);
                end;
                local v95 = l_Error_0(v91);
                local l_find_1 = string.find;
                local l_stack_2 = v95.stack;
                local l_stack_3 = v95.stack;
                l_find_1, l_stack_2 = l_find_1(l_stack_2, string.match(l_stack_3, "[^\n]+"), 1, true);
                v95.stack = string.sub(v95.stack, l_stack_2 + 1 + 1);
                v95.stack = v88(l_v89_0, v95.stack);
                v95["$$robloxInternalJestError"] = true;
                return v95;
            end);
            if not v99 then
                v78 = v38(v100);
            end;
        end;
    end;
    if v76 == nil then
        return v32(l_v71_0, v77, v78);
    elseif typeof(v76) == "table" and typeof(v76.asymmetricMatch) == "function" then
        return v28(l_v71_0, v77, v78, v76);
    elseif typeof(v76) == "string" then
        return v31(l_v71_0, v77, v78, v76);
    elseif l_getType_0(v76) == "regexp" then
        return v27(l_v71_0, v77, v78, v76);
    elseif typeof(v76) == "table" and not v76.message then
        return v30(l_v71_0, v77, v78, v76);
    elseif typeof(v76) == "table" then
        return v29(l_v71_0, v77, v78, v76);
    else
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v71_0, nil, nil, v77), l_EXPECTED_COLOR_0("expected") .. " value must be a string or regular expression or class or error", l_printWithType_0("Expected", v76, l_printExpected_0))));
        return;
    end;
end;
v70 = nil;
v71 = "toThrowError";
v69.toThrowError = function(v101, v102, v103) --[[ Line: 102 ]]
    -- upvalues: v70 (copy), l_isError_0 (copy), v38 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), v71 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getType_0 (copy), l_stringify_0 (copy), v32 (ref), v28 (ref), v31 (ref), v27 (ref), v30 (ref), v29 (ref), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy)
    local v104 = {
        isNot = v101.isNot, 
        promise = v101.promise
    };
    local v105 = nil;
    if v70 and l_isError_0(v102) then
        v105 = v38(v102);
    elseif typeof(v102) ~= "function" and (typeof(v102) ~= "table" or not getmetatable(v102) or not getmetatable(v102).__call) then
        if not v70 then
            local v106 = nil;
            v106 = v103 == nil and "" or "expected";
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v71, nil, v106, v104), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", v102, l_printReceived_0))));
        end;
    else
        local function _(v107) --[[ Line: 149 ]] --[[ Name: getTopStackEntry ]]
            return string.match(v107, "[^\n]+");
        end;
        local function v115(v109, v110) --[[ Line: 155 ]] --[[ Name: diffStack ]]
            local v111 = "";
            local v112 = "";
            local v113 = string.match(v109, "[^\n]+");
            for v114 in string.gmatch(v110, "[^\n]+") do
                if v114 == v113 then
                    return v112;
                else
                    v112 = v111;
                    v111 = v111 .. "\n" .. v114;
                end;
            end;
            return nil;
        end;
        local v116 = nil;
        do
            local l_v116_0 = v116;
            local v126, v127 = xpcall(function() --[[ Line: 174 ]]
                -- upvalues: l_v116_0 (ref), v102 (copy)
                l_v116_0 = debug.traceback(nil, 2);
                v102();
            end, function(v118) --[[ Line: 177 ]]
                -- upvalues: l_getType_0 (ref), v115 (copy), l_v116_0 (ref), l_stringify_0 (ref), l_Error_0 (ref)
                if v118 == nil then
                    v118 = "nil";
                elseif l_getType_0(v118) == "error" or typeof(v118) == "table" and v118.message then
                    if v118.stack == nil then
                        v118.stack = v115(l_v116_0, debug.traceback());
                        return v118;
                    else
                        if not v118.stack:find("ThrowMatchers%-test%.js") then
                            v118.stack = v115(l_v116_0, v118.stack);
                        end;
                        return v118;
                    end;
                elseif typeof(v118) == "string" then
                    local _, _, v121 = v118:find("[%S+\\.]+:[0-9]+:%s(.*)");
                    if v121 ~= nil then
                        v118 = v121;
                    end;
                elseif typeof(v118) == "table" then
                    v118 = l_stringify_0(v118);
                end;
                local v122 = l_Error_0(v118);
                local l_find_2 = string.find;
                local l_stack_4 = v122.stack;
                local l_stack_5 = v122.stack;
                l_find_2, l_stack_4 = l_find_2(l_stack_4, string.match(l_stack_5, "[^\n]+"), 1, true);
                v122.stack = string.sub(v122.stack, l_stack_4 + 1 + 1);
                v122.stack = v115(l_v116_0, v122.stack);
                v122["$$robloxInternalJestError"] = true;
                return v122;
            end);
            if not v126 then
                v105 = v38(v127);
            end;
        end;
    end;
    if v103 == nil then
        return v32(v71, v104, v105);
    elseif typeof(v103) == "table" and typeof(v103.asymmetricMatch) == "function" then
        return v28(v71, v104, v105, v103);
    elseif typeof(v103) == "string" then
        return v31(v71, v104, v105, v103);
    elseif l_getType_0(v103) == "regexp" then
        return v27(v71, v104, v105, v103);
    elseif typeof(v103) == "table" and not v103.message then
        return v30(v71, v104, v105, v103);
    elseif typeof(v103) == "table" then
        return v29(v71, v104, v105, v103);
    else
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v71, nil, nil, v104), l_EXPECTED_COLOR_0("expected") .. " value must be a string or regular expression or class or error", l_printWithType_0("Expected", v103, l_printExpected_0))));
        return;
    end;
end;
v27 = function(v128, v129, v130, v131) --[[ Line: 291 ]] --[[ Name: toThrowExpectedRegExp ]]
    -- upvalues: l_matcherHint_0 (copy), v33 (ref), v34 (ref), v35 (ref)
    local v132 = false;
    if v130 ~= nil then
        v132 = v131:test(v130.message);
    end;
    local _ = nil;
    return {
        message = v132 and function() --[[ Line: 301 ]]
            -- upvalues: l_matcherHint_0 (ref), v128 (copy), v129 (copy), v33 (ref), v131 (copy), v130 (copy), v34 (ref), v35 (ref)
            local v134 = l_matcherHint_0(v128, nil, nil, v129) .. "\n\n" .. v33("Expected pattern: never ", v131);
            if v130 ~= nil and v130.hasMessage and not v130.value["$$robloxInternalJestError"] then
                return v134 .. v34("Received message:       ", v130, "message", v131) .. v35(v130);
            else
                return v134 .. v34("Received value:         ", v130, "message") .. v35(v130);
            end;
        end or function() --[[ Line: 317 ]]
            -- upvalues: l_matcherHint_0 (ref), v128 (copy), v129 (copy), v33 (ref), v131 (copy), v130 (copy), v34 (ref), v35 (ref)
            local v135 = l_matcherHint_0(v128, nil, nil, v129) .. "\n\n" .. v33("Expected pattern: ", v131);
            if v130 == nil then
                return v135 .. "\n" .. "Received function never threw";
            elseif v130.hasMessage and not v130.value["$$robloxInternalJestError"] then
                return v135 .. v34("Received message: ", v130, "message") .. v35(v130);
            else
                return v135 .. v34("Received value:   ", v130, "message") .. v35(v130);
            end;
        end, 
        pass = v132
    };
end;
v28 = function(v136, v137, v138, v139) --[[ Line: 343 ]] --[[ Name: toThrowExpectedAsymmetric ]]
    -- upvalues: l_matcherHint_0 (copy), v33 (ref), v34 (ref), v35 (ref)
    local v140 = false;
    if v138 ~= nil then
        v140 = v139:asymmetricMatch(v138.value);
    end;
    local _ = nil;
    return {
        message = v140 and function() --[[ Line: 353 ]]
            -- upvalues: l_matcherHint_0 (ref), v136 (copy), v137 (copy), v33 (ref), v139 (copy), v138 (copy), v34 (ref), v35 (ref)
            local v142 = l_matcherHint_0(v136, nil, nil, v137) .. "\n\n" .. v33("Expected asymmetric matcher: never ", v139) .. "\n";
            if v138 ~= nil and v138.hasMessage and not v138.value["$$robloxInternalJestError"] then
                return v142 .. v34("Received name:    ", v138, "name") .. v34("Received message: ", v138, "message") .. v35(v138);
            else
                return v142 .. v34("Thrown value: ", v138, "message") .. v35(v138);
            end;
        end or function() --[[ Line: 371 ]]
            -- upvalues: l_matcherHint_0 (ref), v136 (copy), v137 (copy), v33 (ref), v139 (copy), v138 (copy), v34 (ref), v35 (ref)
            local v143 = l_matcherHint_0(v136, nil, nil, v137) .. "\n\n" .. v33("Expected asymmetric matcher: ", v139) .. "\n";
            if v138 == nil then
                return v143 .. "Received function never threw";
            elseif v138.hasMessage and not v138.value["$$robloxInternalJestError"] then
                return v143 .. v34("Received name:    ", v138, "name") .. v34("Received message: ", v138, "message") .. v35(v138);
            else
                return v143 .. v34("Thrown value: ", v138, "message") .. v35(v138);
            end;
        end, 
        pass = v140
    };
end;
v29 = function(v144, v145, v146, v147) --[[ Line: 398 ]] --[[ Name: toThrowExpectedObject ]]
    -- upvalues: l_matcherHint_0 (copy), v33 (ref), v35 (ref), v34 (ref), l_printDiffOrStringify_0 (copy)
    local v148 = false;
    if v146 ~= nil then
        v148 = v146.message == v147.message;
    end;
    local _ = nil;
    return {
        message = v148 and function() --[[ Line: 408 ]]
            -- upvalues: l_matcherHint_0 (ref), v144 (copy), v145 (copy), v33 (ref), v147 (copy), v146 (copy), v35 (ref), v34 (ref)
            local v150 = l_matcherHint_0(v144, nil, nil, v145) .. "\n\n" .. v33("Expected message: never ", v147.message);
            if v146 ~= nil and v146.hasMessage and not v146.value["$$robloxInternalJestError"] then
                return v150 .. v35(v146);
            else
                return v150 .. v34("Received value:         ", v146, "message") .. v35(v146);
            end;
        end or function() --[[ Line: 422 ]]
            -- upvalues: l_matcherHint_0 (ref), v144 (copy), v145 (copy), v146 (copy), v33 (ref), v147 (copy), l_printDiffOrStringify_0 (ref), v35 (ref), v34 (ref)
            local v151 = l_matcherHint_0(v144, nil, nil, v145) .. "\n\n";
            if v146 == nil then
                return v151 .. v33("Expected message: ", v147.message) .. "\n" .. "Received function never threw";
            elseif v146.hasMessage and not v146.value["$$robloxInternalJestError"] then
                return v151 .. l_printDiffOrStringify_0(v147.message, v146.message, "Expected message", "Received message", true) .. "\n" .. v35(v146);
            else
                return v151 .. v33("Expected message: ", v147.message) .. v34("Received value:   ", v146, "message") .. v35(v146);
            end;
        end, 
        pass = v148
    };
end;
v30 = function(v152, v153, v154, v155) --[[ Line: 455 ]] --[[ Name: toThrowExpectedClass ]]
    -- upvalues: l_instanceof_0 (copy), l_matcherHint_0 (copy), l_printExpectedConstructorNameNot_0 (copy), l_printReceivedConstructorNameNot_0 (copy), v34 (ref), v35 (ref), l_printExpectedConstructorName_0 (copy), l_printReceivedConstructorName_0 (copy)
    local function _(v156) --[[ Line: 461 ]] --[[ Name: isClass ]]
        return v156 and getmetatable(v156) and getmetatable(v156).__index;
    end;
    local v158 = false;
    if v154 ~= nil then
        v158 = false;
        if v154.value ~= nil then
            v158 = l_instanceof_0(v154.value, v155);
        end;
    end;
    local _ = nil;
    return {
        message = v158 and function() --[[ Line: 469 ]]
            -- upvalues: l_matcherHint_0 (ref), v152 (copy), v153 (copy), l_printExpectedConstructorNameNot_0 (ref), v155 (copy), v154 (copy), l_printReceivedConstructorNameNot_0 (ref), v34 (ref), v35 (ref)
            local v160 = l_matcherHint_0(v152, nil, nil, v153) .. "\n\n" .. l_printExpectedConstructorNameNot_0("Expected constructor", v155);
            if v154 ~= nil then
                local l_value_0 = v154.value;
                if l_value_0 and getmetatable(l_value_0) and getmetatable(l_value_0).__index then
                    l_value_0 = v155;
                    if l_value_0 and getmetatable(l_value_0) and getmetatable(l_value_0).__index and getmetatable(v154.value).__index ~= v155 and not v154.value["$$robloxInternalJestError"] then
                        v160 = v160 .. l_printReceivedConstructorNameNot_0("Received constructor", getmetatable(v154.value), v155);
                    end;
                end;
            end;
            v160 = v160 .. "\n";
            if v154 ~= nil and v154.hasMessage and not v154.value["$$robloxInternalJestError"] then
                return v160 .. v34("Received message: ", v154, "message") .. v35(v154);
            else
                return v160 .. v34("Received value: ", v154, "message") .. v35(v154);
            end;
        end or function() --[[ Line: 495 ]]
            -- upvalues: l_matcherHint_0 (ref), v152 (copy), v153 (copy), l_printExpectedConstructorName_0 (ref), v155 (copy), v154 (copy), l_printReceivedConstructorName_0 (ref), v34 (ref), v35 (ref)
            local v162 = l_matcherHint_0(v152, nil, nil, v153) .. "\n\n" .. l_printExpectedConstructorName_0("Expected constructor", v155);
            if v154 == nil then
                return v162 .. "\n" .. "Received function never threw";
            else
                if v154.value ~= nil then
                    local l_value_1 = v154.value;
                    if l_value_1 and getmetatable(l_value_1) and getmetatable(l_value_1).__index and not v154.value["$$robloxInternalJestError"] then
                        v162 = v162 .. l_printReceivedConstructorName_0("Received constructor", (getmetatable(v154.value)));
                    end;
                end;
                v162 = v162 .. "\n";
                if v154.hasMessage and not v154.value["$$robloxInternalJestError"] then
                    return v162 .. v34("Received message: ", v154, "message") .. v35(v154);
                else
                    return v162 .. v34("Received value: ", v154, "message") .. v35(v154);
                end;
            end;
        end, 
        pass = v158
    };
end;
v31 = function(v164, v165, v166, v167) --[[ Line: 523 ]] --[[ Name: toThrowExpectedString ]]
    -- upvalues: l_matcherHint_0 (copy), v33 (ref), v34 (ref), v35 (ref)
    local v168 = false;
    if v166 ~= nil and typeof(v166.message) == "string" and v166.message:find(v167, 1, true) then
        v168 = true;
    end;
    local _ = nil;
    return {
        message = v168 and function() --[[ Line: 537 ]]
            -- upvalues: l_matcherHint_0 (ref), v164 (copy), v165 (copy), v33 (ref), v167 (copy), v166 (copy), v34 (ref), v35 (ref)
            local v170 = l_matcherHint_0(v164, nil, nil, v165) .. "\n\n" .. v33("Expected substring: never ", v167);
            if v166 ~= nil and v166.hasMessage and not v166.value["$$robloxInternalJestError"] then
                return v170 .. v34("Received message:         ", v166, "message", v167) .. v35(v166);
            else
                return v170 .. v34("Received value:           ", v166, "message") .. v35(v166);
            end;
        end or function() --[[ Line: 555 ]]
            -- upvalues: l_matcherHint_0 (ref), v164 (copy), v165 (copy), v33 (ref), v167 (copy), v166 (copy), v34 (ref), v35 (ref)
            local v171 = l_matcherHint_0(v164, nil, nil, v165) .. "\n\n" .. v33("Expected substring: ", v167);
            if v166 == nil then
                return v171 .. "\n" .. "Received function never threw";
            elseif v166.hasMessage and not v166.value["$$robloxInternalJestError"] then
                return v171 .. v34("Received message:   ", v166, "message") .. v35(v166);
            else
                return v171 .. v34("Received value:     ", v166, "message") .. v35(v166);
            end;
        end, 
        pass = v168
    };
end;
v32 = function(v172, v173, v174) --[[ Line: 577 ]] --[[ Name: toThrow ]]
    -- upvalues: l_matcherHint_0 (copy), v34 (ref), v35 (ref)
    local v175 = v174 ~= nil;
    local _ = nil;
    return {
        message = v175 and function() --[[ Line: 583 ]]
            -- upvalues: l_matcherHint_0 (ref), v172 (copy), v173 (copy), v174 (copy), v34 (ref), v35 (ref)
            local v177 = l_matcherHint_0(v172, nil, "", v173) .. "\n\n";
            if v174 ~= nil and v174.hasMessage and not v174.value["$$robloxInternalJestError"] then
                return v177 .. v34("Error name:    ", v174, "name") .. v34("Error message: ", v174, "message") .. v35(v174);
            else
                return v177 .. v34("Thrown value: ", v174, "message") .. v35(v174);
            end;
        end or function() --[[ Line: 598 ]]
            -- upvalues: l_matcherHint_0 (ref), v172 (copy), v173 (copy)
            return l_matcherHint_0(v172, nil, "", v173) .. "\n\n" .. "Received function never threw";
        end, 
        pass = v175
    };
end;
v33 = function(v178, v179) --[[ Line: 606 ]] --[[ Name: formatExpected ]]
    -- upvalues: l_printExpected_0 (copy)
    return v178 .. l_printExpected_0(v179) .. "\n";
end;
v34 = function(v180, v181, v182, v183) --[[ Line: 611 ]] --[[ Name: formatReceived ]]
    -- upvalues: l_printReceivedStringContainExpectedSubstring_0 (copy), l_getType_0 (copy), l_printReceivedStringContainExpectedResult_0 (copy), l_printReceived_0 (copy)
    if v181 == nil then
        return "";
    elseif v182 == "message" then
        local l_message_0 = v181.message;
        if typeof(v183) == "string" then
            local v185 = l_message_0:find(v183);
            if v185 then
                return v180 .. l_printReceivedStringContainExpectedSubstring_0(l_message_0, v185, #v183) .. "\n";
            end;
        elseif l_getType_0(v183) == "regexp" then
            return v180 .. l_printReceivedStringContainExpectedResult_0(l_message_0, v183:exec(l_message_0)) .. "\n";
        end;
        return v180 .. l_printReceived_0(l_message_0) .. "\n";
    elseif v182 == "name" then
        if v181.isError then
            return v180 .. l_printReceived_0(v181.value.name) .. "\n";
        else
            return "";
        end;
    elseif v182 == "value" then
        if v181.isError then
            return "";
        else
            return v180 .. l_printReceived_0(v181.value) .. "\n";
        end;
    else
        return "";
    end;
end;
v35 = function(v186) --[[ Line: 658 ]] --[[ Name: formatStack ]]
    -- upvalues: l_formatStackTrace_0 (copy)
    if v186 == nil or not v186.isError then
        return "";
    else
        return l_formatStackTrace_0(v186.value.stack);
    end;
end;
return {
    createMatcher = v68, 
    matchers = v69
};