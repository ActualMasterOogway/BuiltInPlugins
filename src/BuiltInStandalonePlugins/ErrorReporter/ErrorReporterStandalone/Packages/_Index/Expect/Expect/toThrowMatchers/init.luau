local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_instanceof_0 = v3.instanceof;
local l_Error_0 = v3.Error;
local v6 = require(l_Parent_1.JestMatcherUtils);
local l_EXPECTED_COLOR_0 = v6.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v6.RECEIVED_COLOR;
local l_matcherErrorMessage_0 = v6.matcherErrorMessage;
local l_matcherHint_0 = v6.matcherHint;
local l_printDiffOrStringify_0 = v6.printDiffOrStringify;
local l_printExpected_0 = v6.printExpected;
local l_printReceived_0 = v6.printReceived;
local l_printWithType_0 = v6.printWithType;
local l_stringify_0 = v6.stringify;
local l_formatStackTrace_0 = require(l_Parent_1.JestMessageUtil).formatStackTrace;
local v17 = require(l_Parent_0.print);
local l_printExpectedConstructorName_0 = v17.printExpectedConstructorName;
local l_printExpectedConstructorNameNot_0 = v17.printExpectedConstructorNameNot;
local l_printReceivedConstructorName_0 = v17.printReceivedConstructorName;
local l_printReceivedConstructorNameNot_0 = v17.printReceivedConstructorNameNot;
local l_printReceivedStringContainExpectedResult_0 = v17.printReceivedStringContainExpectedResult;
local l_printReceivedStringContainExpectedSubstring_0 = v17.printReceivedStringContainExpectedSubstring;
local _ = require(l_Parent_0.types);
local l_isError_0 = require(l_Parent_0.utils).isError;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local function v37(v35) --[[ Line: 67 ]] --[[ Name: getThrown ]]
    local v36 = false;
    if v35 ~= nil then
        v36 = true;
        if typeof(v35.message) ~= "string" then
            v36 = typeof(v35.message) == "table";
        end;
    end;
    if v36 and typeof(v35.name) == "string" and typeof(v35.stack) == "string" then
        return {
            hasMessage = v36, 
            isError = true, 
            message = v35.message, 
            value = v35
        };
    elseif v36 then
        return {
            hasMessage = v36, 
            isError = false, 
            message = v35.message, 
            value = v35
        };
    else
        return {
            hasMessage = v36, 
            isError = false, 
            message = tostring(v35), 
            value = v35
        };
    end;
end;
local function v67(v38, v39) --[[ Line: 100 ]] --[[ Name: createMatcher ]]
    -- upvalues: l_isError_0 (copy), v37 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getType_0 (copy), l_stringify_0 (copy), v31 (ref), v27 (ref), v30 (ref), v26 (ref), v29 (ref), v28 (ref), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy)
    return function(v40, v41, v42) --[[ Line: 104 ]]
        -- upvalues: v39 (copy), l_isError_0 (ref), v37 (ref), l_Error_0 (ref), l_matcherErrorMessage_0 (ref), l_matcherHint_0 (ref), v38 (copy), l_RECEIVED_COLOR_0 (ref), l_printWithType_0 (ref), l_printReceived_0 (ref), l_getType_0 (ref), l_stringify_0 (ref), v31 (ref), v27 (ref), v30 (ref), v26 (ref), v29 (ref), v28 (ref), l_EXPECTED_COLOR_0 (ref), l_printExpected_0 (ref)
        local v43 = {
            isNot = v40.isNot, 
            promise = v40.promise
        };
        local v44 = nil;
        if v39 and l_isError_0(v41) then
            v44 = v37(v41);
        elseif typeof(v41) ~= "function" and (typeof(v41) ~= "table" or not getmetatable(v41) or not getmetatable(v41).__call) then
            if not v39 then
                local v45 = nil;
                v45 = v42 == nil and "" or "expected";
                error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v38, nil, v45, v43), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", v41, l_printReceived_0))));
            end;
        else
            local function _(v46) --[[ Line: 151 ]] --[[ Name: getTopStackEntry ]]
                return string.match(v46, "[^\n]+");
            end;
            local function v54(v48, v49) --[[ Line: 157 ]] --[[ Name: diffStack ]]
                local v50 = "";
                local v51 = "";
                local v52 = string.match(v48, "[^\n]+");
                for v53 in string.gmatch(v49, "[^\n]+") do
                    if v53 == v52 then
                        return v51;
                    else
                        v51 = v50;
                        v50 = v50 .. "\n" .. v53;
                    end;
                end;
                return nil;
            end;
            local v55 = nil;
            do
                local l_v55_0 = v55;
                local v65, v66 = xpcall(function() --[[ Line: 176 ]]
                    -- upvalues: l_v55_0 (ref), v41 (copy)
                    l_v55_0 = debug.traceback(nil, 2);
                    v41();
                end, function(v57) --[[ Line: 179 ]]
                    -- upvalues: l_getType_0 (ref), v54 (copy), l_v55_0 (ref), l_stringify_0 (ref), l_Error_0 (ref)
                    if v57 == nil then
                        v57 = "nil";
                    elseif l_getType_0(v57) == "error" or typeof(v57) == "table" and v57.message then
                        if v57.stack == nil then
                            v57.stack = v54(l_v55_0, debug.traceback());
                            return v57;
                        else
                            if not v57.stack:find("ThrowMatchers%-test%.js") then
                                v57.stack = v54(l_v55_0, v57.stack);
                            end;
                            return v57;
                        end;
                    elseif typeof(v57) == "string" then
                        local _, _, v60 = v57:find("[%S+\\.]+:[0-9]+:%s(.*)");
                        if v60 ~= nil then
                            v57 = v60;
                        end;
                    elseif typeof(v57) == "table" then
                        v57 = l_stringify_0(v57);
                    end;
                    local v61 = l_Error_0(v57);
                    local l_find_0 = string.find;
                    local l_stack_0 = v61.stack;
                    local l_stack_1 = v61.stack;
                    l_find_0, l_stack_0 = l_find_0(l_stack_0, string.match(l_stack_1, "[^\n]+"), 1, true);
                    v61.stack = string.sub(v61.stack, l_stack_0 + 1 + 1);
                    v61.stack = v54(l_v55_0, v61.stack);
                    v61["$$robloxInternalJestError"] = true;
                    return v61;
                end);
                if not v65 then
                    v44 = v37(v66);
                end;
            end;
        end;
        if v42 == nil then
            return v31(v38, v43, v44);
        elseif typeof(v42) == "table" and typeof(v42.asymmetricMatch) == "function" then
            return v27(v38, v43, v44, v42);
        elseif typeof(v42) == "string" then
            return v30(v38, v43, v44, v42);
        elseif l_getType_0(v42) == "regexp" then
            return v26(v38, v43, v44, v42);
        elseif typeof(v42) == "table" and not v42.message then
            return v29(v38, v43, v44, v42);
        elseif typeof(v42) == "table" then
            return v28(v38, v43, v44, v42);
        else
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v38, nil, nil, v43), l_EXPECTED_COLOR_0("expected") .. " value must be a string or regular expression or class or error", l_printWithType_0("Expected", v42, l_printExpected_0))));
            return;
        end;
    end;
end;
local v68 = {};
local v69 = nil;
local v70 = "toThrow";
local l_v69_0 = v69 --[[ copy: 40 -> 42 ]];
local l_v70_0 = v70 --[[ copy: 41 -> 43 ]];
v68.toThrow = function(v73, v74, v75) --[[ Line: 104 ]]
    -- upvalues: l_v69_0 (copy), l_isError_0 (copy), v37 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_v70_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getType_0 (copy), l_stringify_0 (copy), v31 (ref), v27 (ref), v30 (ref), v26 (ref), v29 (ref), v28 (ref), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy)
    local v76 = {
        isNot = v73.isNot, 
        promise = v73.promise
    };
    local v77 = nil;
    if l_v69_0 and l_isError_0(v74) then
        v77 = v37(v74);
    elseif typeof(v74) ~= "function" and (typeof(v74) ~= "table" or not getmetatable(v74) or not getmetatable(v74).__call) then
        if not l_v69_0 then
            local v78 = nil;
            v78 = v75 == nil and "" or "expected";
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v70_0, nil, v78, v76), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", v74, l_printReceived_0))));
        end;
    else
        local function _(v79) --[[ Line: 151 ]] --[[ Name: getTopStackEntry ]]
            return string.match(v79, "[^\n]+");
        end;
        local function v87(v81, v82) --[[ Line: 157 ]] --[[ Name: diffStack ]]
            local v83 = "";
            local v84 = "";
            local v85 = string.match(v81, "[^\n]+");
            for v86 in string.gmatch(v82, "[^\n]+") do
                if v86 == v85 then
                    return v84;
                else
                    v84 = v83;
                    v83 = v83 .. "\n" .. v86;
                end;
            end;
            return nil;
        end;
        local v88 = nil;
        do
            local l_v88_0 = v88;
            local v98, v99 = xpcall(function() --[[ Line: 176 ]]
                -- upvalues: l_v88_0 (ref), v74 (copy)
                l_v88_0 = debug.traceback(nil, 2);
                v74();
            end, function(v90) --[[ Line: 179 ]]
                -- upvalues: l_getType_0 (ref), v87 (copy), l_v88_0 (ref), l_stringify_0 (ref), l_Error_0 (ref)
                if v90 == nil then
                    v90 = "nil";
                elseif l_getType_0(v90) == "error" or typeof(v90) == "table" and v90.message then
                    if v90.stack == nil then
                        v90.stack = v87(l_v88_0, debug.traceback());
                        return v90;
                    else
                        if not v90.stack:find("ThrowMatchers%-test%.js") then
                            v90.stack = v87(l_v88_0, v90.stack);
                        end;
                        return v90;
                    end;
                elseif typeof(v90) == "string" then
                    local _, _, v93 = v90:find("[%S+\\.]+:[0-9]+:%s(.*)");
                    if v93 ~= nil then
                        v90 = v93;
                    end;
                elseif typeof(v90) == "table" then
                    v90 = l_stringify_0(v90);
                end;
                local v94 = l_Error_0(v90);
                local l_find_1 = string.find;
                local l_stack_2 = v94.stack;
                local l_stack_3 = v94.stack;
                l_find_1, l_stack_2 = l_find_1(l_stack_2, string.match(l_stack_3, "[^\n]+"), 1, true);
                v94.stack = string.sub(v94.stack, l_stack_2 + 1 + 1);
                v94.stack = v87(l_v88_0, v94.stack);
                v94["$$robloxInternalJestError"] = true;
                return v94;
            end);
            if not v98 then
                v77 = v37(v99);
            end;
        end;
    end;
    if v75 == nil then
        return v31(l_v70_0, v76, v77);
    elseif typeof(v75) == "table" and typeof(v75.asymmetricMatch) == "function" then
        return v27(l_v70_0, v76, v77, v75);
    elseif typeof(v75) == "string" then
        return v30(l_v70_0, v76, v77, v75);
    elseif l_getType_0(v75) == "regexp" then
        return v26(l_v70_0, v76, v77, v75);
    elseif typeof(v75) == "table" and not v75.message then
        return v29(l_v70_0, v76, v77, v75);
    elseif typeof(v75) == "table" then
        return v28(l_v70_0, v76, v77, v75);
    else
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v70_0, nil, nil, v76), l_EXPECTED_COLOR_0("expected") .. " value must be a string or regular expression or class or error", l_printWithType_0("Expected", v75, l_printExpected_0))));
        return;
    end;
end;
v69 = nil;
v70 = "toThrowError";
v68.toThrowError = function(v100, v101, v102) --[[ Line: 104 ]]
    -- upvalues: v69 (copy), l_isError_0 (copy), v37 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), v70 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getType_0 (copy), l_stringify_0 (copy), v31 (ref), v27 (ref), v30 (ref), v26 (ref), v29 (ref), v28 (ref), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy)
    local v103 = {
        isNot = v100.isNot, 
        promise = v100.promise
    };
    local v104 = nil;
    if v69 and l_isError_0(v101) then
        v104 = v37(v101);
    elseif typeof(v101) ~= "function" and (typeof(v101) ~= "table" or not getmetatable(v101) or not getmetatable(v101).__call) then
        if not v69 then
            local v105 = nil;
            v105 = v102 == nil and "" or "expected";
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v70, nil, v105, v103), l_RECEIVED_COLOR_0("received") .. " value must be a function", l_printWithType_0("Received", v101, l_printReceived_0))));
        end;
    else
        local function _(v106) --[[ Line: 151 ]] --[[ Name: getTopStackEntry ]]
            return string.match(v106, "[^\n]+");
        end;
        local function v114(v108, v109) --[[ Line: 157 ]] --[[ Name: diffStack ]]
            local v110 = "";
            local v111 = "";
            local v112 = string.match(v108, "[^\n]+");
            for v113 in string.gmatch(v109, "[^\n]+") do
                if v113 == v112 then
                    return v111;
                else
                    v111 = v110;
                    v110 = v110 .. "\n" .. v113;
                end;
            end;
            return nil;
        end;
        local v115 = nil;
        do
            local l_v115_0 = v115;
            local v125, v126 = xpcall(function() --[[ Line: 176 ]]
                -- upvalues: l_v115_0 (ref), v101 (copy)
                l_v115_0 = debug.traceback(nil, 2);
                v101();
            end, function(v117) --[[ Line: 179 ]]
                -- upvalues: l_getType_0 (ref), v114 (copy), l_v115_0 (ref), l_stringify_0 (ref), l_Error_0 (ref)
                if v117 == nil then
                    v117 = "nil";
                elseif l_getType_0(v117) == "error" or typeof(v117) == "table" and v117.message then
                    if v117.stack == nil then
                        v117.stack = v114(l_v115_0, debug.traceback());
                        return v117;
                    else
                        if not v117.stack:find("ThrowMatchers%-test%.js") then
                            v117.stack = v114(l_v115_0, v117.stack);
                        end;
                        return v117;
                    end;
                elseif typeof(v117) == "string" then
                    local _, _, v120 = v117:find("[%S+\\.]+:[0-9]+:%s(.*)");
                    if v120 ~= nil then
                        v117 = v120;
                    end;
                elseif typeof(v117) == "table" then
                    v117 = l_stringify_0(v117);
                end;
                local v121 = l_Error_0(v117);
                local l_find_2 = string.find;
                local l_stack_4 = v121.stack;
                local l_stack_5 = v121.stack;
                l_find_2, l_stack_4 = l_find_2(l_stack_4, string.match(l_stack_5, "[^\n]+"), 1, true);
                v121.stack = string.sub(v121.stack, l_stack_4 + 1 + 1);
                v121.stack = v114(l_v115_0, v121.stack);
                v121["$$robloxInternalJestError"] = true;
                return v121;
            end);
            if not v125 then
                v104 = v37(v126);
            end;
        end;
    end;
    if v102 == nil then
        return v31(v70, v103, v104);
    elseif typeof(v102) == "table" and typeof(v102.asymmetricMatch) == "function" then
        return v27(v70, v103, v104, v102);
    elseif typeof(v102) == "string" then
        return v30(v70, v103, v104, v102);
    elseif l_getType_0(v102) == "regexp" then
        return v26(v70, v103, v104, v102);
    elseif typeof(v102) == "table" and not v102.message then
        return v29(v70, v103, v104, v102);
    elseif typeof(v102) == "table" then
        return v28(v70, v103, v104, v102);
    else
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v70, nil, nil, v103), l_EXPECTED_COLOR_0("expected") .. " value must be a string or regular expression or class or error", l_printWithType_0("Expected", v102, l_printExpected_0))));
        return;
    end;
end;
v26 = function(v127, v128, v129, v130) --[[ Line: 292 ]] --[[ Name: toThrowExpectedRegExp ]]
    -- upvalues: l_matcherHint_0 (copy), v32 (ref), v33 (ref), v34 (ref)
    local v131 = false;
    if v129 ~= nil then
        v131 = v130:test(v129.message);
    end;
    local _ = nil;
    return {
        message = v131 and function() --[[ Line: 302 ]]
            -- upvalues: l_matcherHint_0 (ref), v127 (copy), v128 (copy), v32 (ref), v130 (copy), v129 (copy), v33 (ref), v34 (ref)
            local v133 = l_matcherHint_0(v127, nil, nil, v128) .. "\n\n" .. v32("Expected pattern: never ", v130);
            if v129 ~= nil and v129.hasMessage and not v129.value["$$robloxInternalJestError"] then
                return v133 .. v33("Received message:       ", v129, "message", v130) .. v34(v129);
            else
                return v133 .. v33("Received value:         ", v129, "message") .. v34(v129);
            end;
        end or function() --[[ Line: 323 ]]
            -- upvalues: l_matcherHint_0 (ref), v127 (copy), v128 (copy), v32 (ref), v130 (copy), v129 (copy), v33 (ref), v34 (ref)
            local v134 = l_matcherHint_0(v127, nil, nil, v128) .. "\n\n" .. v32("Expected pattern: ", v130);
            if v129 == nil then
                return v134 .. "\n" .. "Received function never threw";
            elseif v129.hasMessage and not v129.value["$$robloxInternalJestError"] then
                return v134 .. v33("Received message: ", v129, "message") .. v34(v129);
            else
                return v134 .. v33("Received value:   ", v129, "message") .. v34(v129);
            end;
        end, 
        pass = v131
    };
end;
v27 = function(v135, v136, v137, v138) --[[ Line: 353 ]] --[[ Name: toThrowExpectedAsymmetric ]]
    -- upvalues: l_matcherHint_0 (copy), v32 (ref), v33 (ref), v34 (ref)
    local v139 = false;
    if v137 ~= nil then
        v139 = v138:asymmetricMatch(v137.value);
    end;
    local _ = nil;
    return {
        message = v139 and function() --[[ Line: 363 ]]
            -- upvalues: l_matcherHint_0 (ref), v135 (copy), v136 (copy), v32 (ref), v138 (copy), v137 (copy), v33 (ref), v34 (ref)
            local v141 = l_matcherHint_0(v135, nil, nil, v136) .. "\n\n" .. v32("Expected asymmetric matcher: never ", v138) .. "\n";
            if v137 ~= nil and v137.hasMessage and not v137.value["$$robloxInternalJestError"] then
                return v141 .. v33("Received name:    ", v137, "name") .. v33("Received message: ", v137, "message") .. v34(v137);
            else
                return v141 .. v33("Thrown value: ", v137, "message") .. v34(v137);
            end;
        end or function() --[[ Line: 383 ]]
            -- upvalues: l_matcherHint_0 (ref), v135 (copy), v136 (copy), v32 (ref), v138 (copy), v137 (copy), v33 (ref), v34 (ref)
            local v142 = l_matcherHint_0(v135, nil, nil, v136) .. "\n\n" .. v32("Expected asymmetric matcher: ", v138) .. "\n";
            if v137 == nil then
                return v142 .. "Received function never threw";
            elseif v137.hasMessage and not v137.value["$$robloxInternalJestError"] then
                return v142 .. v33("Received name:    ", v137, "name") .. v33("Received message: ", v137, "message") .. v34(v137);
            else
                return v142 .. v33("Thrown value: ", v137, "message") .. v34(v137);
            end;
        end, 
        pass = v139
    };
end;
v28 = function(v143, v144, v145, v146) --[[ Line: 412 ]] --[[ Name: toThrowExpectedObject ]]
    -- upvalues: l_matcherHint_0 (copy), v32 (ref), v34 (ref), v33 (ref), l_printDiffOrStringify_0 (copy)
    local v147 = false;
    if v145 ~= nil then
        v147 = v145.message == v146.message;
    end;
    local _ = nil;
    return {
        message = v147 and function() --[[ Line: 422 ]]
            -- upvalues: l_matcherHint_0 (ref), v143 (copy), v144 (copy), v32 (ref), v146 (copy), v145 (copy), v34 (ref), v33 (ref)
            local v149 = l_matcherHint_0(v143, nil, nil, v144) .. "\n\n" .. v32("Expected message: never ", v146.message);
            if v145 ~= nil and v145.hasMessage and not v145.value["$$robloxInternalJestError"] then
                return v149 .. v34(v145);
            else
                return v149 .. v33("Received value:         ", v145, "message") .. v34(v145);
            end;
        end or function() --[[ Line: 439 ]]
            -- upvalues: l_matcherHint_0 (ref), v143 (copy), v144 (copy), v145 (copy), v32 (ref), v146 (copy), l_printDiffOrStringify_0 (ref), v34 (ref), v33 (ref)
            local v150 = l_matcherHint_0(v143, nil, nil, v144) .. "\n\n";
            if v145 == nil then
                return v150 .. v32("Expected message: ", v146.message) .. "\n" .. "Received function never threw";
            elseif v145.hasMessage and not v145.value["$$robloxInternalJestError"] then
                return v150 .. l_printDiffOrStringify_0(v146.message, v145.message, "Expected message", "Received message", true) .. "\n" .. v34(v145);
            else
                return v150 .. v32("Expected message: ", v146.message) .. v33("Received value:   ", v145, "message") .. v34(v145);
            end;
        end, 
        pass = v147
    };
end;
v29 = function(v151, v152, v153, v154) --[[ Line: 476 ]] --[[ Name: toThrowExpectedClass ]]
    -- upvalues: l_instanceof_0 (copy), l_matcherHint_0 (copy), l_printExpectedConstructorNameNot_0 (copy), l_printReceivedConstructorNameNot_0 (copy), v33 (ref), v34 (ref), l_printExpectedConstructorName_0 (copy), l_printReceivedConstructorName_0 (copy)
    local function _(v155) --[[ Line: 482 ]] --[[ Name: isClass ]]
        return v155 and getmetatable(v155) and getmetatable(v155).__index;
    end;
    local v157 = false;
    if v153 ~= nil then
        v157 = false;
        if v153.value ~= nil then
            v157 = l_instanceof_0(v153.value, v154);
        end;
    end;
    local _ = nil;
    return {
        message = v157 and function() --[[ Line: 490 ]]
            -- upvalues: l_matcherHint_0 (ref), v151 (copy), v152 (copy), l_printExpectedConstructorNameNot_0 (ref), v154 (copy), v153 (copy), l_printReceivedConstructorNameNot_0 (ref), v33 (ref), v34 (ref)
            local v159 = l_matcherHint_0(v151, nil, nil, v152) .. "\n\n" .. l_printExpectedConstructorNameNot_0("Expected constructor", v154);
            if v153 ~= nil then
                local l_value_0 = v153.value;
                if l_value_0 and getmetatable(l_value_0) and getmetatable(l_value_0).__index then
                    l_value_0 = v154;
                    if l_value_0 and getmetatable(l_value_0) and getmetatable(l_value_0).__index and getmetatable(v153.value).__index ~= v154 and not v153.value["$$robloxInternalJestError"] then
                        v159 = v159 .. l_printReceivedConstructorNameNot_0("Received constructor", getmetatable(v153.value), v154);
                    end;
                end;
            end;
            v159 = v159 .. "\n";
            if v153 ~= nil and v153.hasMessage and not v153.value["$$robloxInternalJestError"] then
                return v159 .. v33("Received message: ", v153, "message") .. v34(v153);
            else
                return v159 .. v33("Received value: ", v153, "message") .. v34(v153);
            end;
        end or function() --[[ Line: 523 ]]
            -- upvalues: l_matcherHint_0 (ref), v151 (copy), v152 (copy), l_printExpectedConstructorName_0 (ref), v154 (copy), v153 (copy), l_printReceivedConstructorName_0 (ref), v33 (ref), v34 (ref)
            local v161 = l_matcherHint_0(v151, nil, nil, v152) .. "\n\n" .. l_printExpectedConstructorName_0("Expected constructor", v154);
            if v153 == nil then
                return v161 .. "\n" .. "Received function never threw";
            else
                if v153.value ~= nil then
                    local l_value_1 = v153.value;
                    if l_value_1 and getmetatable(l_value_1) and getmetatable(l_value_1).__index and not v153.value["$$robloxInternalJestError"] then
                        v161 = v161 .. l_printReceivedConstructorName_0("Received constructor", (getmetatable(v153.value)));
                    end;
                end;
                v161 = v161 .. "\n";
                if v153.hasMessage and not v153.value["$$robloxInternalJestError"] then
                    return v161 .. v33("Received message: ", v153, "message") .. v34(v153);
                else
                    return v161 .. v33("Received value: ", v153, "message") .. v34(v153);
                end;
            end;
        end, 
        pass = v157
    };
end;
v30 = function(v163, v164, v165, v166) --[[ Line: 558 ]] --[[ Name: toThrowExpectedString ]]
    -- upvalues: l_matcherHint_0 (copy), v32 (ref), v33 (ref), v34 (ref)
    local v167 = false;
    if v165 ~= nil and typeof(v165.message) == "string" and v165.message:find(v166, 1, true) then
        v167 = true;
    end;
    local _ = nil;
    return {
        message = v167 and function() --[[ Line: 572 ]]
            -- upvalues: l_matcherHint_0 (ref), v163 (copy), v164 (copy), v32 (ref), v166 (copy), v165 (copy), v33 (ref), v34 (ref)
            local v169 = l_matcherHint_0(v163, nil, nil, v164) .. "\n\n" .. v32("Expected substring: never ", v166);
            if v165 ~= nil and v165.hasMessage and not v165.value["$$robloxInternalJestError"] then
                return v169 .. v33("Received message:         ", v165, "message", v166) .. v34(v165);
            else
                return v169 .. v33("Received value:           ", v165, "message") .. v34(v165);
            end;
        end or function() --[[ Line: 588 ]]
            -- upvalues: l_matcherHint_0 (ref), v163 (copy), v164 (copy), v32 (ref), v166 (copy), v165 (copy), v33 (ref), v34 (ref)
            local v170 = l_matcherHint_0(v163, nil, nil, v164) .. "\n\n" .. v32("Expected substring: ", v166);
            if v165 == nil then
                return v170 .. "\n" .. "Received function never threw";
            elseif v165.hasMessage and not v165.value["$$robloxInternalJestError"] then
                return v170 .. v33("Received message:   ", v165, "message") .. v34(v165);
            else
                return v170 .. v33("Received value:     ", v165, "message") .. v34(v165);
            end;
        end, 
        pass = v167
    };
end;
v31 = function(v171, v172, v173) --[[ Line: 612 ]] --[[ Name: toThrow ]]
    -- upvalues: l_matcherHint_0 (copy), v33 (ref), v34 (ref)
    local v174 = v173 ~= nil;
    local _ = nil;
    return {
        message = v174 and function() --[[ Line: 622 ]]
            -- upvalues: l_matcherHint_0 (ref), v171 (copy), v172 (copy), v173 (copy), v33 (ref), v34 (ref)
            local v176 = l_matcherHint_0(v171, nil, "", v172) .. "\n\n";
            if v173 ~= nil and v173.hasMessage and not v173.value["$$robloxInternalJestError"] then
                return v176 .. v33("Error name:    ", v173, "name") .. v33("Error message: ", v173, "message") .. v34(v173);
            else
                return v176 .. v33("Thrown value: ", v173, "message") .. v34(v173);
            end;
        end or function() --[[ Line: 640 ]]
            -- upvalues: l_matcherHint_0 (ref), v171 (copy), v172 (copy)
            return l_matcherHint_0(v171, nil, "", v172) .. "\n\n" .. "Received function never threw";
        end, 
        pass = v174
    };
end;
v32 = function(v177, v178) --[[ Line: 650 ]] --[[ Name: formatExpected ]]
    -- upvalues: l_printExpected_0 (copy)
    return v177 .. l_printExpected_0(v178) .. "\n";
end;
v33 = function(v179, v180, v181, v182) --[[ Line: 655 ]] --[[ Name: formatReceived ]]
    -- upvalues: l_printReceivedStringContainExpectedSubstring_0 (copy), l_getType_0 (copy), l_printReceivedStringContainExpectedResult_0 (copy), l_printReceived_0 (copy)
    if v180 == nil then
        return "";
    elseif v181 == "message" then
        local l_message_0 = v180.message;
        if typeof(v182) == "string" then
            local v184 = l_message_0:find(v182);
            if v184 then
                return v179 .. l_printReceivedStringContainExpectedSubstring_0(l_message_0, v184, #v182) .. "\n";
            end;
        elseif l_getType_0(v182) == "regexp" then
            return v179 .. l_printReceivedStringContainExpectedResult_0(l_message_0, v182:exec(l_message_0)) .. "\n";
        end;
        return v179 .. l_printReceived_0(l_message_0) .. "\n";
    elseif v181 == "name" then
        if v180.isError then
            return v179 .. l_printReceived_0(v180.value.name) .. "\n";
        else
            return "";
        end;
    elseif v181 == "value" then
        if v180.isError then
            return "";
        else
            return v179 .. l_printReceived_0(v180.value) .. "\n";
        end;
    else
        return "";
    end;
end;
v34 = function(v185) --[[ Line: 715 ]] --[[ Name: formatStack ]]
    -- upvalues: l_formatStackTrace_0 (copy)
    if v185 == nil or not v185.isError then
        return "";
    else
        return l_formatStackTrace_0(v185.value.stack);
    end;
end;
return {
    createMatcher = v67, 
    matchers = v68
};