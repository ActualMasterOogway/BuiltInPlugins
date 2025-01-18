local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Number_0 = v2.Number;
local l_String_0 = v2.String;
local l_Symbol_0 = v2.Symbol;
local l_getType_0 = require(l_Parent_1.JestGetType).getType;
local l_isPrimitive_0 = require(l_Parent_1.JestGetType).isPrimitive;
local v10 = require(l_Parent_1.JestMatcherUtils);
local l_DIM_COLOR_0 = v10.DIM_COLOR;
local l_EXPECTED_COLOR_0 = v10.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v10.RECEIVED_COLOR;
local l_diff_0 = v10.diff;
local l_ensureExpectedIsNonNegativeInteger_0 = v10.ensureExpectedIsNonNegativeInteger;
local l_ensureNoExpected_0 = v10.ensureNoExpected;
local l_matcherErrorMessage_0 = v10.matcherErrorMessage;
local l_matcherHint_0 = v10.matcherHint;
local l_printExpected_0 = v10.printExpected;
local l_printReceived_0 = v10.printReceived;
local l_printWithType_0 = v10.printWithType;
local l_stringify_0 = v10.stringify;
local l_equals_0 = require(l_Parent_0.jasmineUtils).equals;
local l_iterableEquality_0 = require(l_Parent_0.utils).iterableEquality;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local v39 = nil;
local v40 = nil;
local v41 = nil;
local v42 = nil;
local v43 = nil;
local v44 = nil;
local v45 = nil;
v25 = function(v46) --[[ Line: 54 ]] --[[ Name: isExpand ]]
    return v46 ~= false;
end;
v26 = function(v47) --[[ Line: 62 ]] --[[ Name: printExpectedArgs ]]
    -- upvalues: l_Array_0 (copy), l_printExpected_0 (copy)
    if #v47 == 0 then
        return "called with 0 arguments";
    else
        return l_Array_0.join(l_Array_0.map(v47, function(v48) --[[ Line: 67 ]]
            -- upvalues: l_printExpected_0 (ref)
            return l_printExpected_0(v48);
        end), ", ");
    end;
end;
v27 = function(v49, v50) --[[ Line: 75 ]] --[[ Name: printReceivedArgs ]]
    -- upvalues: l_Array_0 (copy), v29 (ref), v28 (ref), l_printReceived_0 (copy)
    if #v49 == 0 then
        return "called with 0 arguments";
    else
        return l_Array_0.join(l_Array_0.map(v49, function(v51, v52) --[[ Line: 80 ]]
            -- upvalues: l_Array_0 (ref), v50 (copy), v29 (ref), v28 (ref), l_printReceived_0 (ref)
            if l_Array_0.isArray(v50) and v52 <= #v50 and v29(v50[v52], v51) then
                return v28(v51);
            else
                return l_printReceived_0(v51);
            end;
        end), ", ");
    end;
end;
v28 = function(v53) --[[ Line: 92 ]] --[[ Name: printCommon ]]
    -- upvalues: l_DIM_COLOR_0 (copy), l_stringify_0 (copy)
    return l_DIM_COLOR_0(l_stringify_0(v53));
end;
v29 = function(v54, v55) --[[ Line: 96 ]] --[[ Name: isEqualValue ]]
    -- upvalues: l_equals_0 (copy), l_iterableEquality_0 (copy)
    return l_equals_0(v54, v55, {
        l_iterableEquality_0
    });
end;
v30 = function(v56, v57) --[[ Line: 100 ]] --[[ Name: isEqualCall ]]
    -- upvalues: v29 (ref)
    return v29(v56, v57);
end;
v31 = function(v58, v59) --[[ Line: 104 ]] --[[ Name: isEqualReturn ]]
    -- upvalues: v29 (ref)
    local v60 = false;
    if v59.type == "return" then
        v60 = v29(v58, v59.value);
    end;
    return v60;
end;
v32 = function(v61) --[[ Line: 108 ]] --[[ Name: countReturns ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.reduce(v61, function(v62, v63) --[[ Line: 109 ]]
        if v63.type == "return" then
            return v62 + 1;
        else
            return v62;
        end;
    end, 0);
end;
v33 = function(v64, v65) --[[ Line: 118 ]] --[[ Name: printNumberOfReturns ]]
    -- upvalues: l_printReceived_0 (copy)
    local v66 = string.format("\nNumber of returns: %s", l_printReceived_0(v64));
    if v65 ~= v64 then
        v66 = v66 .. string.format("\nNumber of calls:   %s", l_printReceived_0(v65));
    end;
    return v66;
end;
v34 = function(v67) --[[ Line: 131 ]] --[[ Name: getRightAlignedPrinter ]]
    local v68 = v67:find(":");
    local v69 = v67:sub(v68);
    return function(v70, v71) --[[ Line: 136 ]]
        -- upvalues: v68 (copy), v69 (copy)
        local _ = nil;
        return (if v71 then "->" .. string.rep(" ", (math.max(0, v68 - 3 - #v70))) else string.rep(" ", (math.max(0, v68 - 1 - #v70)))) .. v70 .. v69;
    end;
end;
v35 = function(v73, v74, v75, v76) --[[ Line: 151 ]] --[[ Name: printReceivedCallsNegative ]]
    -- upvalues: v27 (ref), v34 (ref), l_Array_0 (copy)
    if #v74 == 0 then
        return "";
    elseif v75 then
        return "Received:       " .. v27(v74[1], v73) .. "\n";
    else
        local v77 = v34("Received:       ");
        return "Received\n" .. l_Array_0.reduce(v74, function(v78, v79) --[[ Line: 170 ]]
            -- upvalues: v77 (copy), v76 (copy), v27 (ref), v73 (copy)
            local v80 = v79[1];
            local v81 = v79[2];
            return v78 .. v77(tostring(v80), v80 == v76) .. v27(v81, v73) .. "\n";
        end, "");
    end;
end;
v36 = function(v82, v83, v84, v85, v86) --[[ Line: 178 ]] --[[ Name: printExpectedReceivedCallsPositive ]]
    -- upvalues: v26 (ref), v38 (ref), l_EXPECTED_COLOR_0 (copy), l_RECEIVED_COLOR_0 (copy), v29 (ref), v28 (ref), v39 (ref), l_diff_0 (copy), l_Array_0 (copy), l_stringify_0 (copy), v27 (ref), v34 (ref), v37 (ref)
    local v87 = string.format("Expected: %s\n", v26(v82));
    if #v83 == 0 then
        return v87;
    elseif v85 and (v86 == 1 or v86 == nil) then
        local v88 = v83[1][2];
        if v38(v82, v88) then
            local v89 = {
                l_EXPECTED_COLOR_0("- Expected"), 
                l_RECEIVED_COLOR_0("+ Received"), 
                ""
            };
            for v90 = 1, math.max(#v82, #v88) do
                local l_v90_0 = v90;
                local v92 = false;
                if l_v90_0 <= #v82 and l_v90_0 <= #v88 then
                    if v29(v82[l_v90_0], v88[l_v90_0]) then
                        table.insert(v89, "  " .. v28(v88[l_v90_0]) .. ",");
                        v92 = true;
                    end;
                    if not v92 and v39(v82[l_v90_0], v88[l_v90_0]) then
                        local v93 = l_diff_0(v82[l_v90_0], v88[l_v90_0], {
                            v84
                        });
                        if typeof(v93) == "string" and v93:find("%- Expected") and v93:find("%+ Received") then
                            local v94 = {};
                            for v95 in v93:gmatch("[^\n]+") do
                                table.insert(v94, v95);
                            end;
                            v94 = l_Array_0.slice(v94, 3);
                            table.insert(v89, l_Array_0.join(v94, "\n") .. ",");
                            v92 = true;
                        end;
                    end;
                end;
                if not v92 then
                    if l_v90_0 <= #v82 then
                        table.insert(v89, l_EXPECTED_COLOR_0("- " .. l_stringify_0(v82[l_v90_0])) .. ",");
                    end;
                    if l_v90_0 <= #v88 then
                        table.insert(v89, l_RECEIVED_COLOR_0("+ " .. l_stringify_0(v88[l_v90_0])) .. ",");
                    end;
                end;
                l_v90_0 = l_v90_0 + 1;
            end;
            return table.concat(v89, "\n") .. "\n";
        else
            return v87 .. "Received: " .. v27(v88, v82) .. "\n";
        end;
    else
        local v96 = v34("Received: ");
        return v87 .. "Received\n" .. l_Array_0.reduce(v83, function(v97, v98) --[[ Line: 252 ]]
            -- upvalues: v96 (copy), v86 (copy), v38 (ref), v82 (copy), v37 (ref), v84 (copy), v27 (ref)
            local v99 = v98[1];
            local v100 = v98[2];
            local v101 = v96(tostring(v99), v99 == v86);
            if (v99 == v86 or v86 == nil) and v38(v82, v100) then
                return v97 .. v101:sub(1, v101:find(":") - 1) .. "\n" .. v101:sub(v101:find(":") + 1, #v101) .. v37(v82, v100, v84) .. "\n";
            else
                return v97 .. v101 .. v27(v100, v82) .. "\n";
            end;
        end, "");
    end;
end;
local v102 = string.gsub("Received", "[a-zA-Z0-9_]", " ");
v37 = function(v103, v104, v105) --[[ Line: 273 ]] --[[ Name: printDiffCall ]]
    -- upvalues: l_Array_0 (copy), v29 (ref), v102 (copy), v28 (ref), v39 (ref), l_diff_0 (copy), l_printReceived_0 (copy), l_RECEIVED_COLOR_0 (copy), l_stringify_0 (copy)
    return l_Array_0.join(l_Array_0.map(v104, function(v106, v107) --[[ Line: 275 ]]
        -- upvalues: v103 (copy), v29 (ref), v102 (ref), v28 (ref), v39 (ref), l_diff_0 (ref), v105 (copy), l_Array_0 (ref), l_printReceived_0 (ref), l_RECEIVED_COLOR_0 (ref), l_stringify_0 (ref)
        if v107 <= #v103 then
            if v29(v103[v107], v106) then
                return v102 .. "  " .. v28(v106) .. ",";
            elseif v39(v103[v107], v106) then
                local v108 = l_diff_0(v103[v107], v106, {
                    expand = v105
                });
                if typeof(v108) == "string" and v108:find("%- Expected") and v108:find("%+ Received") then
                    local v109 = {};
                    for v110 in v108:gmatch("[^\n]+") do
                        table.insert(v109, v110);
                    end;
                    return l_Array_0.join(l_Array_0.map(l_Array_0.slice(v109, 3), function(v111) --[[ Line: 297 ]]
                        -- upvalues: v102 (ref)
                        return v102 .. v111;
                    end), "\n") .. ",";
                end;
            end;
        end;
        return v102 .. (if v107 <= #v103 then "  " .. l_printReceived_0(v106) else l_RECEIVED_COLOR_0("+ " .. l_stringify_0(v106))) .. ",";
    end), "\n");
end;
v38 = function(v112, v113) --[[ Line: 321 ]] --[[ Name: isLineDiffableCall ]]
    -- upvalues: l_Array_0 (copy), v39 (ref)
    return l_Array_0.some(v112, function(v114, v115) --[[ Line: 322 ]]
        -- upvalues: v113 (copy), v39 (ref)
        local v116 = false;
        if v115 <= #v113 then
            v116 = v39(v114, v113[v115]);
        end;
        return v116;
    end);
end;
v39 = function(v117, v118) --[[ Line: 329 ]] --[[ Name: isLineDiffableArg ]]
    -- upvalues: l_getType_0 (copy), l_isPrimitive_0 (copy)
    local v119 = l_getType_0(v117);
    local v120 = l_getType_0(v118);
    if v119 ~= v120 then
        return false;
    elseif l_isPrimitive_0(v117) then
        return false;
    elseif v119 == "date" or v119 == "function" or v119 == "regexp" or v119 == "error" then
        return false;
    elseif v119 == "table" and typeof(v117.asymmetricMatch) == "function" then
        return false;
    elseif v120 == "table" and typeof(v118.asymmetricMatch) == "function" then
        return false;
    else
        return true;
    end;
end;
v40 = function(v121, v122) --[[ Line: 360 ]] --[[ Name: printResult ]]
    -- upvalues: v29 (ref), v28 (ref), l_printReceived_0 (copy)
    if v121.type == "throw" then
        return "function call threw an error";
    elseif v121.type == "incomplete" then
        return "function call has not returned yet";
    elseif v29(v122, v121.value) then
        return v28(v121.value);
    else
        return l_printReceived_0(v121.value);
    end;
end;
v41 = function(v123, v124, v125, v126, v127) --[[ Line: 378 ]] --[[ Name: printReceivedResults ]]
    -- upvalues: v40 (ref), v34 (ref), l_String_0 (copy), l_Array_0 (copy)
    if #v125 == 0 then
        return "";
    elseif v126 and (v127 == 1 or v127 == nil) then
        return v123 .. v40(v125[1][2], v124) .. "\n";
    else
        local v128 = v34(v123);
        local v129 = v123:find(":") or 1;
        return l_String_0.trim(v123:sub(1, v129 - 1) .. v123:sub(v129 + 1, #v123)) .. "\n" .. l_Array_0.reduce(v125, function(v130, v131) --[[ Line: 401 ]]
            -- upvalues: v128 (copy), v127 (copy), v40 (ref), v124 (copy)
            local v132 = v131[1];
            local v133 = v131[2];
            return v130 .. v128(tostring(v132), v132 == v127) .. v40(v133, v124) .. "\n";
        end, "");
    end;
end;
local _ = function(v134) --[[ Line: 408 ]] --[[ Name: createToBeCalledMatcher ]]
    -- upvalues: l_ensureNoExpected_0 (copy), v44 (ref), v43 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy), v27 (ref)
    return function(v135, v136, v137) --[[ Line: 409 ]]
        -- upvalues: l_ensureNoExpected_0 (ref), v134 (copy), v44 (ref), v43 (ref), l_Array_0 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_printReceived_0 (ref), v27 (ref)
        local v138 = {
            isNot = v135.isNot, 
            promise = v135.promise
        };
        l_ensureNoExpected_0(v137, v134, v138);
        v44(v136, v134, "", v138);
        local v139 = v43(v136);
        local v140 = nil;
        v140 = v139 and "spy" or v136.getMockName();
        local v141 = nil;
        v141 = if v139 then v136.calls.count() else #v136.mock.calls;
        local v142 = nil;
        v142 = if v139 then l_Array_0.map(v136.calls.all(), function(v143) --[[ Line: 436 ]]
            return v143.args;
        end) else v136.mock.calls;
        local v144 = v141 > 0;
        local _ = nil;
        return {
            message = v144 and function() --[[ Line: 446 ]]
                -- upvalues: l_matcherHint_0 (ref), v134 (ref), v140 (ref), v138 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v141 (ref), l_Array_0 (ref), v142 (ref), v27 (ref)
                return l_matcherHint_0(v134, v140, "", v138) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v141)) .. l_Array_0.join(l_Array_0.reduce(v142, function(v146, v147, v148) --[[ Line: 452 ]]
                    -- upvalues: v27 (ref)
                    if #v146 < 3 then
                        table.insert(v146, ("%s: %s"):format(tostring(v148), v27(v147)));
                    end;
                    return v146;
                end, {}), "\n");
            end or function() --[[ Line: 463 ]]
                -- upvalues: l_matcherHint_0 (ref), v134 (ref), v140 (ref), v138 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v141 (ref)
                return l_matcherHint_0(v134, v140, "", v138) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v141));
            end, 
            pass = v144
        };
    end;
end;
local _ = function(v150) --[[ Line: 475 ]] --[[ Name: createToReturnMatcher ]]
    -- upvalues: l_ensureNoExpected_0 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    return function(v151, v152, v153) --[[ Line: 476 ]]
        -- upvalues: l_ensureNoExpected_0 (ref), v150 (copy), v45 (ref), l_Array_0 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_printReceived_0 (ref)
        local v154 = {
            isNot = v151.isNot, 
            promise = v151.promise
        };
        l_ensureNoExpected_0(v153, v150, v154);
        v45(v152, v150, "", v154);
        local v155 = v152.getMockName();
        local v158 = l_Array_0.reduce(v152.mock.results, function(v156, v157) --[[ Line: 489 ]]
            if v157.type == "return" then
                return v156 + 1;
            else
                return v156;
            end;
        end, 0);
        local v159 = v158 > 0;
        local _ = nil;
        return {
            message = v159 and function() --[[ Line: 500 ]]
                -- upvalues: l_matcherHint_0 (ref), v150 (ref), v155 (copy), v154 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v158 (copy), l_Array_0 (ref), v152 (copy)
                local v164 = l_matcherHint_0(v150, v155, "", v154) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v158)) .. l_Array_0.join(l_Array_0.reduce(v152.mock.results, function(v161, v162, v163) --[[ Line: 506 ]]
                    -- upvalues: l_printReceived_0 (ref)
                    if v162.type == "return" and #v161 < 3 then
                        table.insert(v161, ("%s: %s"):format(tostring(v163), l_printReceived_0(v162.value)));
                    end;
                    return v161;
                end, {}), "\n");
                if #v152.mock.calls ~= v158 then
                    v164 = v164 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v152.mock.calls);
                end;
                return v164;
            end or function() --[[ Line: 523 ]]
                -- upvalues: l_matcherHint_0 (ref), v150 (ref), v155 (copy), v154 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v158 (copy), v152 (copy)
                local v165 = l_matcherHint_0(v150, v155, "", v154) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v158));
                if #v152.mock.calls ~= v158 then
                    v165 = v165 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v152.mock.calls));
                end;
                return v165;
            end, 
            pass = v159
        };
    end;
end;
local _ = function(v167) --[[ Line: 541 ]] --[[ Name: createToBeCalledTimesMatcher ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), v44 (ref), v43 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    return function(v168, v169, v170) --[[ Line: 542 ]]
        -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (ref), v167 (copy), v44 (ref), v43 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_printReceived_0 (ref)
        local v171 = {
            isNot = v168.isNot, 
            promise = v168.promise
        };
        l_ensureExpectedIsNonNegativeInteger_0(v170, v167, v171);
        v44(v169, v167, "expected", v171);
        local v172 = v43(v169);
        local v173 = nil;
        v173 = v172 and "spy" or v169.getMockName();
        local v174 = nil;
        v174 = if v172 then v169.calls.count() else #v169.mock.calls;
        local v175 = v174 == v170;
        local _ = nil;
        return {
            message = v175 and function() --[[ Line: 571 ]]
                -- upvalues: l_matcherHint_0 (ref), v167 (ref), v173 (ref), v171 (copy), l_printExpected_0 (ref), v170 (copy)
                return l_matcherHint_0(v167, v173, "expected", v171) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v170));
            end or function() --[[ Line: 577 ]]
                -- upvalues: l_matcherHint_0 (ref), v167 (ref), v173 (ref), v171 (copy), l_printExpected_0 (ref), v170 (copy), l_printReceived_0 (ref), v174 (ref)
                return l_matcherHint_0(v167, v173, "expected", v171) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v170)) .. ("Received number of calls: %s"):format(l_printReceived_0(v174));
            end, 
            pass = v175
        };
    end;
end;
local _ = function(v178) --[[ Line: 589 ]] --[[ Name: createToReturnTimesMatcher ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    return function(v179, v180, v181) --[[ Line: 590 ]]
        -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (ref), v178 (copy), v45 (ref), l_Array_0 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_printReceived_0 (ref)
        local v182 = {
            isNot = v179.isNot, 
            promise = v179.promise
        };
        l_ensureExpectedIsNonNegativeInteger_0(v181, v178, v182);
        v45(v180, v178, "expected", v182);
        local v183 = v180.getMockName();
        local v186 = l_Array_0.reduce(v180.mock.results, function(v184, v185) --[[ Line: 603 ]]
            if v185.type == "return" then
                return v184 + 1;
            else
                return v184;
            end;
        end, 0);
        local v187 = v186 == v181;
        local _ = nil;
        return {
            message = v187 and function() --[[ Line: 615 ]]
                -- upvalues: l_matcherHint_0 (ref), v178 (ref), v183 (copy), v182 (copy), l_printExpected_0 (ref), v181 (copy), v180 (copy), v186 (copy), l_printReceived_0 (ref)
                local v189 = l_matcherHint_0(v178, v183, "expected", v182) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v181));
                if #v180.mock.calls ~= v186 then
                    v189 = v189 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v180.mock.calls));
                end;
                return v189;
            end or function() --[[ Line: 628 ]]
                -- upvalues: l_matcherHint_0 (ref), v178 (ref), v183 (copy), v182 (copy), l_printExpected_0 (ref), v181 (copy), l_printReceived_0 (ref), v186 (copy), v180 (copy)
                local v190 = l_matcherHint_0(v178, v183, "expected", v182) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v181)) .. ("Received number of returns: %s"):format(l_printReceived_0(v186));
                if #v180.mock.calls ~= v186 then
                    v190 = v190 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v180.mock.calls));
                end;
                return v190;
            end, 
            pass = v187
        };
    end;
end;
local _ = function(v192) --[[ Line: 646 ]] --[[ Name: createToBeCalledWithMatcher ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    return function(v193, v194, ...) --[[ Line: 647 ]]
        -- upvalues: l_Symbol_0 (ref), v44 (ref), v192 (copy), v43 (ref), l_Array_0 (ref), v30 (ref), l_matcherHint_0 (ref), v26 (ref), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref), v36 (ref), v25 (ref)
        local v195 = {
            ...
        };
        for v196 = 1, select("#", ...) do
            if v195[v196] == nil then
                v195[v196] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v197 = {
            isNot = v193.isNot, 
            promise = v193.promise
        };
        v44(v194, v192, "...expected", v197);
        local v198 = v43(v194);
        local v199 = nil;
        v199 = v198 and "spy" or v194.getMockName();
        local v200 = nil;
        v200 = if v198 then l_Array_0.map(v194.calls.all(), function(v201) --[[ Line: 675 ]]
            return v201.args;
        end) else v194.mock.calls;
        local v203 = l_Array_0.some(v200, function(v202) --[[ Line: 682 ]]
            -- upvalues: v30 (ref), v195 (copy)
            return v30(v195, v202);
        end);
        local _ = nil;
        return {
            message = v203 and function() --[[ Line: 688 ]]
                -- upvalues: v200 (ref), v30 (ref), v195 (copy), l_matcherHint_0 (ref), v192 (ref), v199 (ref), v197 (copy), v26 (ref), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
                local v205 = {};
                local v206 = 1;
                while v206 <= #v200 and #v205 < 3 do
                    if v30(v195, v200[v206]) then
                        table.insert(v205, {
                            v206, 
                            v200[v206]
                        });
                    end;
                    v206 = v206 + 1;
                end;
                local v207 = l_matcherHint_0(v192, v199, "...expected", v197) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v195));
                if #v200 ~= 1 or l_stringify_0(v200[1]) ~= l_stringify_0(v195) then
                    v207 = v207 .. v35(v195, v205, #v200 == 1);
                end;
                return v207 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v200));
            end or function() --[[ Line: 711 ]]
                -- upvalues: v200 (ref), l_matcherHint_0 (ref), v192 (ref), v199 (ref), v197 (copy), v36 (ref), v195 (copy), v25 (ref), v193 (copy), l_printReceived_0 (ref)
                local v208 = {};
                local v209 = 1;
                while v209 <= #v200 and #v208 < 3 do
                    table.insert(v208, {
                        v209, 
                        v200[v209]
                    });
                    v209 = v209 + 1;
                end;
                return l_matcherHint_0(v192, v199, "...expected", v197) .. "\n\n" .. v36(v195, v208, v25(v193.expand), #v200 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v200));
            end, 
            pass = v203
        };
    end;
end;
local _ = function(v211) --[[ Line: 730 ]] --[[ Name: createToReturnWithMatcher ]]
    -- upvalues: v45 (ref), l_Array_0 (copy), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    return function(v212, v213, v214) --[[ Line: 731 ]]
        -- upvalues: v45 (ref), v211 (copy), l_Array_0 (ref), v31 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref)
        local v215 = {
            isNot = v212.isNot, 
            promise = v212.promise
        };
        v45(v213, v211, "expected", v215);
        local v216 = v213.getMockName();
        local l_mock_0 = v213.mock;
        local l_calls_0 = l_mock_0.calls;
        local l_results_0 = l_mock_0.results;
        local v221 = l_Array_0.some(l_results_0, function(v220) --[[ Line: 744 ]]
            -- upvalues: v31 (ref), v214 (copy)
            return v31(v214, v220);
        end);
        local _ = nil;
        return {
            message = v221 and function() --[[ Line: 750 ]]
                -- upvalues: l_results_0 (copy), v31 (ref), v214 (copy), l_matcherHint_0 (ref), v211 (ref), v216 (copy), v215 (copy), l_printExpected_0 (ref), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_0 (copy)
                local v223 = {};
                local v224 = 1;
                while v224 <= #l_results_0 and #v223 < 3 do
                    if v31(v214, l_results_0[v224]) then
                        table.insert(v223, {
                            v224, 
                            l_results_0[v224]
                        });
                    end;
                    v224 = v224 + 1;
                end;
                local v225 = l_matcherHint_0(v211, v216, "expected", v215) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v214));
                if #l_results_0 ~= 1 or l_results_0[1].type ~= "return" or l_stringify_0(l_results_0[1].value) ~= l_stringify_0(v214) then
                    v225 = v225 .. v41("Received:       ", v214, v223, #l_results_0 == 1);
                end;
                return v225 .. v33(v32(l_results_0), #l_calls_0);
            end or function() --[[ Line: 780 ]]
                -- upvalues: l_results_0 (copy), l_matcherHint_0 (ref), v211 (ref), v216 (copy), v215 (copy), l_printExpected_0 (ref), v214 (copy), v41 (ref), v33 (ref), v32 (ref), l_calls_0 (copy)
                local v226 = {};
                local v227 = 1;
                while v227 <= #l_results_0 and #v226 < 3 do
                    table.insert(v226, {
                        v227, 
                        l_results_0[v227]
                    });
                    v227 = v227 + 1;
                end;
                return l_matcherHint_0(v211, v216, "expected", v215) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v214)) .. v41("Received: ", v214, v226, #l_results_0 == 1) .. v33(v32(l_results_0), #l_calls_0);
            end, 
            pass = v221
        };
    end;
end;
local _ = function(v229) --[[ Line: 801 ]] --[[ Name: createLastCalledWithMatcher ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    return function(v230, v231, ...) --[[ Line: 802 ]]
        -- upvalues: l_Symbol_0 (ref), v44 (ref), v229 (copy), v43 (ref), l_Array_0 (ref), v30 (ref), l_matcherHint_0 (ref), v26 (ref), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref), v36 (ref), v25 (ref)
        local v232 = {
            ...
        };
        for v233 = 1, select("#", ...) do
            if v232[v233] == nil then
                v232[v233] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v234 = {
            isNot = v230.isNot, 
            promise = v230.promise
        };
        v44(v231, v229, "...expected", v234);
        local v235 = v43(v231);
        local v236 = nil;
        v236 = v235 and "spy" or v231.getMockName();
        local v237 = nil;
        v237 = if v235 then l_Array_0.map(v231.calls.all(), function(v238) --[[ Line: 830 ]]
            return v238.args;
        end) else v231.mock.calls;
        local v239 = #v237;
        local v240 = false;
        if v239 >= 1 then
            v240 = v30(v232, v237[v239]);
        end;
        local _ = nil;
        return {
            message = v240 and function() --[[ Line: 843 ]]
                -- upvalues: v239 (copy), v237 (ref), l_matcherHint_0 (ref), v229 (ref), v236 (ref), v234 (copy), v26 (ref), v232 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
                local v242 = {};
                if v239 > 1 then
                    table.insert(v242, {
                        v239 - 1, 
                        v237[v239 - 1]
                    });
                end;
                table.insert(v242, {
                    v239, 
                    v237[v239]
                });
                local v243 = l_matcherHint_0(v229, v236, "...expected", v234) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v232));
                if #v237 ~= 1 or l_stringify_0(v237[1]) ~= l_stringify_0(v232) then
                    v243 = v243 .. v35(v232, v242, #v237 == 1, v239);
                end;
                return v243 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v237));
            end or function() --[[ Line: 865 ]]
                -- upvalues: v239 (copy), v30 (ref), v232 (copy), v237 (ref), l_matcherHint_0 (ref), v229 (ref), v236 (ref), v234 (copy), v36 (ref), v25 (ref), v230 (copy), l_printReceived_0 (ref)
                local v244 = {};
                if v239 >= 1 then
                    if v239 > 1 then
                        local v245 = v239 - 1;
                        while v245 >= 1 and not v30(v232, v237[v245]) do
                            v245 = v245 - 1;
                        end;
                        if v245 < 1 then
                            v245 = v239 - 1;
                        end;
                        table.insert(v244, {
                            v245, 
                            v237[v245]
                        });
                    end;
                    table.insert(v244, {
                        v239, 
                        v237[v239]
                    });
                end;
                return l_matcherHint_0(v229, v236, "...expected", v234) .. "\n\n" .. v36(v232, v244, v25(v230.expand), #v237 == 1, v239) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v237));
            end, 
            pass = v240
        };
    end;
end;
local _ = function(v247) --[[ Line: 901 ]] --[[ Name: createLastReturnedMatcher ]]
    -- upvalues: v45 (ref), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    return function(v248, v249, v250) --[[ Line: 902 ]]
        -- upvalues: v45 (ref), v247 (copy), v31 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref)
        local v251 = {
            isNot = v248.isNot, 
            promise = v248.promise
        };
        v45(v249, v247, "expected", v251);
        local v252 = v249.getMockName();
        local l_mock_1 = v249.mock;
        local l_calls_1 = l_mock_1.calls;
        local l_results_1 = l_mock_1.results;
        local v256 = #l_results_1;
        local v257 = false;
        if v256 >= 1 then
            v257 = v31(v250, l_results_1[v256]);
        end;
        local _ = nil;
        return {
            message = v257 and function() --[[ Line: 922 ]]
                -- upvalues: v256 (copy), l_results_1 (copy), l_matcherHint_0 (ref), v247 (ref), v252 (copy), v251 (copy), l_printExpected_0 (ref), v250 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_1 (copy)
                local v259 = {};
                if v256 > 1 then
                    table.insert(v259, {
                        v256 - 1, 
                        l_results_1[v256 - 1]
                    });
                end;
                table.insert(v259, {
                    v256, 
                    l_results_1[v256]
                });
                local v260 = l_matcherHint_0(v247, v252, "expected", v251) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v250));
                if #l_results_1 ~= 1 or l_results_1[1].type ~= "return" or l_stringify_0(l_results_1[1].value) ~= l_stringify_0(v250) then
                    v260 = v260 .. v41("Received:       ", v250, v259, #l_results_1 == 1, v256);
                end;
                return v260 .. v33(v32(l_results_1), #l_calls_1);
            end or function() --[[ Line: 951 ]]
                -- upvalues: v256 (copy), v31 (ref), v250 (copy), l_results_1 (copy), l_matcherHint_0 (ref), v247 (ref), v252 (copy), v251 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_1 (copy)
                local v261 = {};
                if v256 >= 1 then
                    if v256 > 1 then
                        local v262 = v256 - 1;
                        while v262 >= 1 and not v31(v250, l_results_1[v262]) do
                            v262 = v262 - 1;
                        end;
                        if v262 < 1 then
                            v262 = v256 - 1;
                        end;
                        table.insert(v261, {
                            v262, 
                            l_results_1[v262]
                        });
                    end;
                    table.insert(v261, {
                        v256, 
                        l_results_1[v256]
                    });
                end;
                return l_matcherHint_0(v247, v252, "expected", v251) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v250)) .. v41("Received: ", v250, v261, #l_results_1 == 1, v256) .. v33(v32(l_results_1), #l_calls_1);
            end, 
            pass = v257
        };
    end;
end;
local _ = function(v264) --[[ Line: 984 ]] --[[ Name: createNthCalledWithMatcher ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), v26 (ref), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    return function(v265, v266, v267, ...) --[[ Line: 985 ]]
        -- upvalues: l_Symbol_0 (ref), v44 (ref), v264 (copy), l_Number_0 (ref), l_Error_0 (ref), l_matcherErrorMessage_0 (ref), l_matcherHint_0 (ref), l_printWithType_0 (ref), l_stringify_0 (ref), v43 (ref), l_Array_0 (ref), v30 (ref), v26 (ref), v35 (ref), l_printReceived_0 (ref), v36 (ref), v25 (ref)
        local v268 = {
            ...
        };
        for v269 = 1, select("#", ...) do
            if v268[v269] == nil then
                v268[v269] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v271 = {
            expectedColor = function(v270) --[[ Line: 997 ]] --[[ Name: expectedColor ]]
                return v270;
            end, 
            isNot = v265.isNot, 
            promise = v265.promise, 
            secondArgument = "...expected"
        };
        v44(v266, v264, "n", v271);
        if not l_Number_0.isSafeInteger(v267) or v267 < 1 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v264, nil, "n", v271), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v267, l_stringify_0))));
        end;
        local v272 = v43(v266);
        local v273 = nil;
        v273 = v272 and "spy" or v266.getMockName();
        local v274 = nil;
        v274 = if v272 then l_Array_0.map(v266.calls.all(), function(v275) --[[ Line: 1030 ]]
            return v275.args;
        end) else v266.mock.calls;
        local v276 = #v274;
        local v277 = false;
        if v267 <= v276 then
            v277 = v30(v268, v274[v267]);
        end;
        local _ = nil;
        return {
            message = v277 and function() --[[ Line: 1043 ]]
                -- upvalues: v267 (copy), v274 (ref), v276 (copy), l_matcherHint_0 (ref), v264 (ref), v273 (ref), v271 (copy), v267 (copy), v26 (ref), v268 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
                local v279 = {};
                if v267 - 1 >= 1 then
                    table.insert(v279, {
                        v267 - 1, 
                        v274[v267 - 1]
                    });
                end;
                table.insert(v279, {
                    v267, 
                    v274[v267]
                });
                if v267 + 1 <= v276 then
                    table.insert(v279, {
                        v267 + 1, 
                        v274[v267 + 1]
                    });
                end;
                local v280 = l_matcherHint_0(v264, v273, "n", v271) .. "\n\n" .. ("n: %s\n"):format((tostring(v267))) .. ("Expected: never %s\n"):format(v26(v268));
                if #v274 ~= 1 or l_stringify_0(v274[1]) ~= l_stringify_0(v268) then
                    v280 = v280 .. v35(v268, v279, #v274 == 1, v267);
                end;
                return v280 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v274));
            end or function() --[[ Line: 1071 ]]
                -- upvalues: v267 (copy), v276 (copy), v30 (ref), v268 (copy), v274 (ref), l_matcherHint_0 (ref), v264 (ref), v273 (ref), v271 (copy), v267 (copy), v36 (ref), v25 (ref), v265 (copy), l_printReceived_0 (ref)
                local v281 = {};
                if v267 <= v276 then
                    if v267 - 1 >= 1 then
                        local v282 = v267 - 1;
                        while v282 >= 1 and not v30(v268, v274[v282]) do
                            v282 = v282 - 1;
                        end;
                        if v282 < 1 then
                            v282 = v267 - 1;
                        end;
                        table.insert(v281, {
                            v282, 
                            v274[v282]
                        });
                    end;
                    table.insert(v281, {
                        v267, 
                        v274[v267]
                    });
                    if v267 + 1 <= v276 then
                        local v283 = v267 + 1;
                        while v283 <= v276 and not v30(v268, v274[v283]) do
                            v283 = v283 + 1;
                        end;
                        if v276 <= v283 then
                            v283 = v267 + 1;
                        end;
                        table.insert(v281, {
                            v283, 
                            v274[v283]
                        });
                    end;
                elseif v276 > 1 then
                    local v284 = v276 - 1;
                    while v284 >= 1 and not v30(v268, v274[v284]) do
                        v284 = v284 - 1;
                    end;
                    if v284 < 1 then
                        v284 = v276 - 1;
                    end;
                    table.insert(v281, {
                        v284, 
                        v274[v284]
                    });
                end;
                return l_matcherHint_0(v264, v273, "n", v271) .. "\n\n" .. ("n: %s\n"):format((tostring(v267))) .. v36(v268, v281, v25(v265.expand), #v274 == 1, v267) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v274));
            end, 
            pass = v277
        };
    end;
end;
local _ = function(v286) --[[ Line: 1140 ]] --[[ Name: createNthReturnedWithMatcher ]]
    -- upvalues: v45 (ref), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v31 (ref), l_printExpected_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    return function(v287, v288, v289, v290) --[[ Line: 1141 ]]
        -- upvalues: v45 (ref), v286 (copy), l_Number_0 (ref), l_Error_0 (ref), l_matcherErrorMessage_0 (ref), l_matcherHint_0 (ref), l_printWithType_0 (ref), l_stringify_0 (ref), v31 (ref), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref)
        local v292 = {
            expectedColor = function(v291) --[[ Line: 1144 ]] --[[ Name: expectedColor ]]
                return v291;
            end, 
            isNot = v287.isNot, 
            promise = v287.promise, 
            secondArgument = "expected"
        };
        v45(v288, v286, "n", v292);
        if not l_Number_0.isSafeInteger(v289) or v289 < 1 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v286, nil, "n", v292), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v289, l_stringify_0))));
        end;
        local v293 = v288.getMockName();
        local l_mock_2 = v288.mock;
        local l_calls_2 = l_mock_2.calls;
        local l_results_2 = l_mock_2.results;
        local v297 = #l_results_2;
        local v298 = false;
        if v289 <= v297 then
            v298 = v31(v290, l_results_2[v289]);
        end;
        local _ = nil;
        return {
            message = v298 and function() --[[ Line: 1178 ]]
                -- upvalues: v289 (copy), l_results_2 (copy), v297 (copy), l_matcherHint_0 (ref), v286 (ref), v293 (copy), v292 (copy), v289 (copy), l_printExpected_0 (ref), v290 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_2 (copy)
                local v300 = {};
                if v289 - 1 >= 1 then
                    table.insert(v300, {
                        v289 - 1, 
                        l_results_2[v289 - 1]
                    });
                end;
                table.insert(v300, {
                    v289, 
                    l_results_2[v289]
                });
                if v289 + 1 <= v297 then
                    table.insert(v300, {
                        v289 + 1, 
                        l_results_2[v289 + 1]
                    });
                end;
                local v301 = l_matcherHint_0(v286, v293, "n", v292) .. "\n\n" .. ("n: %s\n"):format((tostring(v289))) .. ("Expected: never %s\n"):format(l_printExpected_0(v290));
                if #l_results_2 ~= 1 or l_results_2[1].type ~= "return" or l_stringify_0(l_results_2[1].value) ~= l_stringify_0(v290) then
                    v301 = v301 .. v41("Received:       ", v290, v300, #l_results_2 == 1, v289);
                end;
                return v301 .. v33(v32(l_results_2), #l_calls_2);
            end or function() --[[ Line: 1210 ]]
                -- upvalues: v289 (copy), v297 (copy), v31 (ref), v290 (copy), l_results_2 (copy), l_matcherHint_0 (ref), v286 (ref), v293 (copy), v292 (copy), v289 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_2 (copy)
                local v302 = {};
                if v289 <= v297 then
                    if v289 - 1 >= 1 then
                        local v303 = v289 - 1;
                        while v303 >= 1 and not v31(v290, l_results_2[v303]) do
                            v303 = v303 - 1;
                        end;
                        if v303 < 1 then
                            v303 = v289 - 1;
                        end;
                        table.insert(v302, {
                            v303, 
                            l_results_2[v303]
                        });
                    end;
                    table.insert(v302, {
                        v289, 
                        l_results_2[v289]
                    });
                    if v289 + 1 <= v297 then
                        local v304 = v289 + 1;
                        while v304 <= v297 and not v31(v290, l_results_2[v304]) do
                            v304 = v304 + 1;
                        end;
                        if v297 < v304 then
                            v304 = v289 + 1;
                        end;
                        table.insert(v302, {
                            v304, 
                            l_results_2[v304]
                        });
                    end;
                elseif v297 > 0 then
                    local l_v297_0 = v297;
                    while l_v297_0 >= 1 and not v31(v290, l_results_2[l_v297_0]) do
                        l_v297_0 = l_v297_0 - 1;
                    end;
                    if l_v297_0 < 1 then
                        l_v297_0 = v297 - 1;
                    end;
                    table.insert(v302, {
                        l_v297_0, 
                        l_results_2[l_v297_0]
                    });
                end;
                return l_matcherHint_0(v286, v293, "n", v292) .. "\n\n" .. ("n: %s\n"):format((tostring(v289))) .. ("Expected: %s\n"):format(l_printExpected_0(v290)) .. v41("Received: ", v290, v302, #l_results_2 == 1, v289) .. v33(v32(l_results_2), #l_calls_2);
            end, 
            pass = v298
        };
    end;
end;
local v307 = {};
local v308 = "lastCalledWith";
local l_v308_0 = v308 --[[ copy: 61 -> 62 ]];
v307.lastCalledWith = function(v310, v311, ...) --[[ Line: 802 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v308_0 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v312 = {
        ...
    };
    for v313 = 1, select("#", ...) do
        if v312[v313] == nil then
            v312[v313] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v314 = {
        isNot = v310.isNot, 
        promise = v310.promise
    };
    v44(v311, l_v308_0, "...expected", v314);
    local v315 = v43(v311);
    local v316 = nil;
    v316 = v315 and "spy" or v311.getMockName();
    local v317 = nil;
    v317 = if v315 then l_Array_0.map(v311.calls.all(), function(v318) --[[ Line: 830 ]]
        return v318.args;
    end) else v311.mock.calls;
    local v319 = #v317;
    local v320 = false;
    if v319 >= 1 then
        v320 = v30(v312, v317[v319]);
    end;
    local _ = nil;
    return {
        message = v320 and function() --[[ Line: 843 ]]
            -- upvalues: v319 (copy), v317 (ref), l_matcherHint_0 (ref), l_v308_0 (ref), v316 (ref), v314 (copy), v26 (ref), v312 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v322 = {};
            if v319 > 1 then
                table.insert(v322, {
                    v319 - 1, 
                    v317[v319 - 1]
                });
            end;
            table.insert(v322, {
                v319, 
                v317[v319]
            });
            local v323 = l_matcherHint_0(l_v308_0, v316, "...expected", v314) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v312));
            if #v317 ~= 1 or l_stringify_0(v317[1]) ~= l_stringify_0(v312) then
                v323 = v323 .. v35(v312, v322, #v317 == 1, v319);
            end;
            return v323 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v317));
        end or function() --[[ Line: 865 ]]
            -- upvalues: v319 (copy), v30 (ref), v312 (copy), v317 (ref), l_matcherHint_0 (ref), l_v308_0 (ref), v316 (ref), v314 (copy), v36 (ref), v25 (ref), v310 (copy), l_printReceived_0 (ref)
            local v324 = {};
            if v319 >= 1 then
                if v319 > 1 then
                    local v325 = v319 - 1;
                    while v325 >= 1 and not v30(v312, v317[v325]) do
                        v325 = v325 - 1;
                    end;
                    if v325 < 1 then
                        v325 = v319 - 1;
                    end;
                    table.insert(v324, {
                        v325, 
                        v317[v325]
                    });
                end;
                table.insert(v324, {
                    v319, 
                    v317[v319]
                });
            end;
            return l_matcherHint_0(l_v308_0, v316, "...expected", v314) .. "\n\n" .. v36(v312, v324, v25(v310.expand), #v317 == 1, v319) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v317));
        end, 
        pass = v320
    };
end;
v308 = "lastReturnedWith";
local l_v308_1 = v308 --[[ copy: 61 -> 63 ]];
v307.lastReturnedWith = function(v327, v328, v329) --[[ Line: 902 ]]
    -- upvalues: v45 (ref), l_v308_1 (copy), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v330 = {
        isNot = v327.isNot, 
        promise = v327.promise
    };
    v45(v328, l_v308_1, "expected", v330);
    local v331 = v328.getMockName();
    local l_mock_3 = v328.mock;
    local l_calls_3 = l_mock_3.calls;
    local l_results_3 = l_mock_3.results;
    local v335 = #l_results_3;
    local v336 = false;
    if v335 >= 1 then
        v336 = v31(v329, l_results_3[v335]);
    end;
    local _ = nil;
    return {
        message = v336 and function() --[[ Line: 922 ]]
            -- upvalues: v335 (copy), l_results_3 (copy), l_matcherHint_0 (ref), l_v308_1 (ref), v331 (copy), v330 (copy), l_printExpected_0 (ref), v329 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_3 (copy)
            local v338 = {};
            if v335 > 1 then
                table.insert(v338, {
                    v335 - 1, 
                    l_results_3[v335 - 1]
                });
            end;
            table.insert(v338, {
                v335, 
                l_results_3[v335]
            });
            local v339 = l_matcherHint_0(l_v308_1, v331, "expected", v330) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v329));
            if #l_results_3 ~= 1 or l_results_3[1].type ~= "return" or l_stringify_0(l_results_3[1].value) ~= l_stringify_0(v329) then
                v339 = v339 .. v41("Received:       ", v329, v338, #l_results_3 == 1, v335);
            end;
            return v339 .. v33(v32(l_results_3), #l_calls_3);
        end or function() --[[ Line: 951 ]]
            -- upvalues: v335 (copy), v31 (ref), v329 (copy), l_results_3 (copy), l_matcherHint_0 (ref), l_v308_1 (ref), v331 (copy), v330 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_3 (copy)
            local v340 = {};
            if v335 >= 1 then
                if v335 > 1 then
                    local v341 = v335 - 1;
                    while v341 >= 1 and not v31(v329, l_results_3[v341]) do
                        v341 = v341 - 1;
                    end;
                    if v341 < 1 then
                        v341 = v335 - 1;
                    end;
                    table.insert(v340, {
                        v341, 
                        l_results_3[v341]
                    });
                end;
                table.insert(v340, {
                    v335, 
                    l_results_3[v335]
                });
            end;
            return l_matcherHint_0(l_v308_1, v331, "expected", v330) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v329)) .. v41("Received: ", v329, v340, #l_results_3 == 1, v335) .. v33(v32(l_results_3), #l_calls_3);
        end, 
        pass = v336
    };
end;
v308 = "nthCalledWith";
local l_v308_2 = v308 --[[ copy: 61 -> 64 ]];
v307.nthCalledWith = function(v343, v344, v345, ...) --[[ Line: 985 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v308_2 (copy), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), v26 (ref), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v346 = {
        ...
    };
    for v347 = 1, select("#", ...) do
        if v346[v347] == nil then
            v346[v347] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v349 = {
        expectedColor = function(v348) --[[ Line: 997 ]] --[[ Name: expectedColor ]]
            return v348;
        end, 
        isNot = v343.isNot, 
        promise = v343.promise, 
        secondArgument = "...expected"
    };
    v44(v344, l_v308_2, "n", v349);
    if not l_Number_0.isSafeInteger(v345) or v345 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v308_2, nil, "n", v349), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v345, l_stringify_0))));
    end;
    local v350 = v43(v344);
    local v351 = nil;
    v351 = v350 and "spy" or v344.getMockName();
    local v352 = nil;
    v352 = if v350 then l_Array_0.map(v344.calls.all(), function(v353) --[[ Line: 1030 ]]
        return v353.args;
    end) else v344.mock.calls;
    local v354 = #v352;
    local v355 = false;
    if v345 <= v354 then
        v355 = v30(v346, v352[v345]);
    end;
    local _ = nil;
    return {
        message = v355 and function() --[[ Line: 1043 ]]
            -- upvalues: v345 (copy), v352 (ref), v354 (copy), l_matcherHint_0 (ref), l_v308_2 (ref), v351 (ref), v349 (copy), v345 (copy), v26 (ref), v346 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v357 = {};
            if v345 - 1 >= 1 then
                table.insert(v357, {
                    v345 - 1, 
                    v352[v345 - 1]
                });
            end;
            table.insert(v357, {
                v345, 
                v352[v345]
            });
            if v345 + 1 <= v354 then
                table.insert(v357, {
                    v345 + 1, 
                    v352[v345 + 1]
                });
            end;
            local v358 = l_matcherHint_0(l_v308_2, v351, "n", v349) .. "\n\n" .. ("n: %s\n"):format((tostring(v345))) .. ("Expected: never %s\n"):format(v26(v346));
            if #v352 ~= 1 or l_stringify_0(v352[1]) ~= l_stringify_0(v346) then
                v358 = v358 .. v35(v346, v357, #v352 == 1, v345);
            end;
            return v358 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v352));
        end or function() --[[ Line: 1071 ]]
            -- upvalues: v345 (copy), v354 (copy), v30 (ref), v346 (copy), v352 (ref), l_matcherHint_0 (ref), l_v308_2 (ref), v351 (ref), v349 (copy), v345 (copy), v36 (ref), v25 (ref), v343 (copy), l_printReceived_0 (ref)
            local v359 = {};
            if v345 <= v354 then
                if v345 - 1 >= 1 then
                    local v360 = v345 - 1;
                    while v360 >= 1 and not v30(v346, v352[v360]) do
                        v360 = v360 - 1;
                    end;
                    if v360 < 1 then
                        v360 = v345 - 1;
                    end;
                    table.insert(v359, {
                        v360, 
                        v352[v360]
                    });
                end;
                table.insert(v359, {
                    v345, 
                    v352[v345]
                });
                if v345 + 1 <= v354 then
                    local v361 = v345 + 1;
                    while v361 <= v354 and not v30(v346, v352[v361]) do
                        v361 = v361 + 1;
                    end;
                    if v354 <= v361 then
                        v361 = v345 + 1;
                    end;
                    table.insert(v359, {
                        v361, 
                        v352[v361]
                    });
                end;
            elseif v354 > 1 then
                local v362 = v354 - 1;
                while v362 >= 1 and not v30(v346, v352[v362]) do
                    v362 = v362 - 1;
                end;
                if v362 < 1 then
                    v362 = v354 - 1;
                end;
                table.insert(v359, {
                    v362, 
                    v352[v362]
                });
            end;
            return l_matcherHint_0(l_v308_2, v351, "n", v349) .. "\n\n" .. ("n: %s\n"):format((tostring(v345))) .. v36(v346, v359, v25(v343.expand), #v352 == 1, v345) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v352));
        end, 
        pass = v355
    };
end;
v308 = "nthReturnedWith";
local l_v308_3 = v308 --[[ copy: 61 -> 65 ]];
v307.nthReturnedWith = function(v364, v365, v366, v367) --[[ Line: 1141 ]]
    -- upvalues: v45 (ref), l_v308_3 (copy), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v31 (ref), l_printExpected_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v369 = {
        expectedColor = function(v368) --[[ Line: 1144 ]] --[[ Name: expectedColor ]]
            return v368;
        end, 
        isNot = v364.isNot, 
        promise = v364.promise, 
        secondArgument = "expected"
    };
    v45(v365, l_v308_3, "n", v369);
    if not l_Number_0.isSafeInteger(v366) or v366 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v308_3, nil, "n", v369), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v366, l_stringify_0))));
    end;
    local v370 = v365.getMockName();
    local l_mock_4 = v365.mock;
    local l_calls_4 = l_mock_4.calls;
    local l_results_4 = l_mock_4.results;
    local v374 = #l_results_4;
    local v375 = false;
    if v366 <= v374 then
        v375 = v31(v367, l_results_4[v366]);
    end;
    local _ = nil;
    return {
        message = v375 and function() --[[ Line: 1178 ]]
            -- upvalues: v366 (copy), l_results_4 (copy), v374 (copy), l_matcherHint_0 (ref), l_v308_3 (ref), v370 (copy), v369 (copy), v366 (copy), l_printExpected_0 (ref), v367 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_4 (copy)
            local v377 = {};
            if v366 - 1 >= 1 then
                table.insert(v377, {
                    v366 - 1, 
                    l_results_4[v366 - 1]
                });
            end;
            table.insert(v377, {
                v366, 
                l_results_4[v366]
            });
            if v366 + 1 <= v374 then
                table.insert(v377, {
                    v366 + 1, 
                    l_results_4[v366 + 1]
                });
            end;
            local v378 = l_matcherHint_0(l_v308_3, v370, "n", v369) .. "\n\n" .. ("n: %s\n"):format((tostring(v366))) .. ("Expected: never %s\n"):format(l_printExpected_0(v367));
            if #l_results_4 ~= 1 or l_results_4[1].type ~= "return" or l_stringify_0(l_results_4[1].value) ~= l_stringify_0(v367) then
                v378 = v378 .. v41("Received:       ", v367, v377, #l_results_4 == 1, v366);
            end;
            return v378 .. v33(v32(l_results_4), #l_calls_4);
        end or function() --[[ Line: 1210 ]]
            -- upvalues: v366 (copy), v374 (copy), v31 (ref), v367 (copy), l_results_4 (copy), l_matcherHint_0 (ref), l_v308_3 (ref), v370 (copy), v369 (copy), v366 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_4 (copy)
            local v379 = {};
            if v366 <= v374 then
                if v366 - 1 >= 1 then
                    local v380 = v366 - 1;
                    while v380 >= 1 and not v31(v367, l_results_4[v380]) do
                        v380 = v380 - 1;
                    end;
                    if v380 < 1 then
                        v380 = v366 - 1;
                    end;
                    table.insert(v379, {
                        v380, 
                        l_results_4[v380]
                    });
                end;
                table.insert(v379, {
                    v366, 
                    l_results_4[v366]
                });
                if v366 + 1 <= v374 then
                    local v381 = v366 + 1;
                    while v381 <= v374 and not v31(v367, l_results_4[v381]) do
                        v381 = v381 + 1;
                    end;
                    if v374 < v381 then
                        v381 = v366 + 1;
                    end;
                    table.insert(v379, {
                        v381, 
                        l_results_4[v381]
                    });
                end;
            elseif v374 > 0 then
                local l_v374_0 = v374;
                while l_v374_0 >= 1 and not v31(v367, l_results_4[l_v374_0]) do
                    l_v374_0 = l_v374_0 - 1;
                end;
                if l_v374_0 < 1 then
                    l_v374_0 = v374 - 1;
                end;
                table.insert(v379, {
                    l_v374_0, 
                    l_results_4[l_v374_0]
                });
            end;
            return l_matcherHint_0(l_v308_3, v370, "n", v369) .. "\n\n" .. ("n: %s\n"):format((tostring(v366))) .. ("Expected: %s\n"):format(l_printExpected_0(v367)) .. v41("Received: ", v367, v379, #l_results_4 == 1, v366) .. v33(v32(l_results_4), #l_calls_4);
        end, 
        pass = v375
    };
end;
v308 = "toBeCalled";
local l_v308_4 = v308 --[[ copy: 61 -> 66 ]];
v307.toBeCalled = function(v384, v385, v386) --[[ Line: 409 ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_v308_4 (copy), v44 (ref), v43 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy), v27 (ref)
    local v387 = {
        isNot = v384.isNot, 
        promise = v384.promise
    };
    l_ensureNoExpected_0(v386, l_v308_4, v387);
    v44(v385, l_v308_4, "", v387);
    local v388 = v43(v385);
    local v389 = nil;
    v389 = v388 and "spy" or v385.getMockName();
    local v390 = nil;
    v390 = if v388 then v385.calls.count() else #v385.mock.calls;
    local v391 = nil;
    v391 = if v388 then l_Array_0.map(v385.calls.all(), function(v392) --[[ Line: 436 ]]
        return v392.args;
    end) else v385.mock.calls;
    local v393 = v390 > 0;
    local _ = nil;
    return {
        message = v393 and function() --[[ Line: 446 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_4 (ref), v389 (ref), v387 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v390 (ref), l_Array_0 (ref), v391 (ref), v27 (ref)
            return l_matcherHint_0(l_v308_4, v389, "", v387) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v390)) .. l_Array_0.join(l_Array_0.reduce(v391, function(v395, v396, v397) --[[ Line: 452 ]]
                -- upvalues: v27 (ref)
                if #v395 < 3 then
                    table.insert(v395, ("%s: %s"):format(tostring(v397), v27(v396)));
                end;
                return v395;
            end, {}), "\n");
        end or function() --[[ Line: 463 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_4 (ref), v389 (ref), v387 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v390 (ref)
            return l_matcherHint_0(l_v308_4, v389, "", v387) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v390));
        end, 
        pass = v393
    };
end;
v308 = "toBeCalledTimes";
local l_v308_5 = v308 --[[ copy: 61 -> 67 ]];
v307.toBeCalledTimes = function(v399, v400, v401) --[[ Line: 542 ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), l_v308_5 (copy), v44 (ref), v43 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v402 = {
        isNot = v399.isNot, 
        promise = v399.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v401, l_v308_5, v402);
    v44(v400, l_v308_5, "expected", v402);
    local v403 = v43(v400);
    local v404 = nil;
    v404 = v403 and "spy" or v400.getMockName();
    local v405 = nil;
    v405 = if v403 then v400.calls.count() else #v400.mock.calls;
    local v406 = v405 == v401;
    local _ = nil;
    return {
        message = v406 and function() --[[ Line: 571 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_5 (ref), v404 (ref), v402 (copy), l_printExpected_0 (ref), v401 (copy)
            return l_matcherHint_0(l_v308_5, v404, "expected", v402) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v401));
        end or function() --[[ Line: 577 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_5 (ref), v404 (ref), v402 (copy), l_printExpected_0 (ref), v401 (copy), l_printReceived_0 (ref), v405 (ref)
            return l_matcherHint_0(l_v308_5, v404, "expected", v402) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v401)) .. ("Received number of calls: %s"):format(l_printReceived_0(v405));
        end, 
        pass = v406
    };
end;
v308 = "toBeCalledWith";
local l_v308_6 = v308 --[[ copy: 61 -> 68 ]];
v307.toBeCalledWith = function(v409, v410, ...) --[[ Line: 647 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v308_6 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v411 = {
        ...
    };
    for v412 = 1, select("#", ...) do
        if v411[v412] == nil then
            v411[v412] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v413 = {
        isNot = v409.isNot, 
        promise = v409.promise
    };
    v44(v410, l_v308_6, "...expected", v413);
    local v414 = v43(v410);
    local v415 = nil;
    v415 = v414 and "spy" or v410.getMockName();
    local v416 = nil;
    v416 = if v414 then l_Array_0.map(v410.calls.all(), function(v417) --[[ Line: 675 ]]
        return v417.args;
    end) else v410.mock.calls;
    local v419 = l_Array_0.some(v416, function(v418) --[[ Line: 682 ]]
        -- upvalues: v30 (ref), v411 (copy)
        return v30(v411, v418);
    end);
    local _ = nil;
    return {
        message = v419 and function() --[[ Line: 688 ]]
            -- upvalues: v416 (ref), v30 (ref), v411 (copy), l_matcherHint_0 (ref), l_v308_6 (ref), v415 (ref), v413 (copy), v26 (ref), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v421 = {};
            local v422 = 1;
            while v422 <= #v416 and #v421 < 3 do
                if v30(v411, v416[v422]) then
                    table.insert(v421, {
                        v422, 
                        v416[v422]
                    });
                end;
                v422 = v422 + 1;
            end;
            local v423 = l_matcherHint_0(l_v308_6, v415, "...expected", v413) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v411));
            if #v416 ~= 1 or l_stringify_0(v416[1]) ~= l_stringify_0(v411) then
                v423 = v423 .. v35(v411, v421, #v416 == 1);
            end;
            return v423 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v416));
        end or function() --[[ Line: 711 ]]
            -- upvalues: v416 (ref), l_matcherHint_0 (ref), l_v308_6 (ref), v415 (ref), v413 (copy), v36 (ref), v411 (copy), v25 (ref), v409 (copy), l_printReceived_0 (ref)
            local v424 = {};
            local v425 = 1;
            while v425 <= #v416 and #v424 < 3 do
                table.insert(v424, {
                    v425, 
                    v416[v425]
                });
                v425 = v425 + 1;
            end;
            return l_matcherHint_0(l_v308_6, v415, "...expected", v413) .. "\n\n" .. v36(v411, v424, v25(v409.expand), #v416 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v416));
        end, 
        pass = v419
    };
end;
v308 = "toHaveBeenCalled";
local l_v308_7 = v308 --[[ copy: 61 -> 69 ]];
v307.toHaveBeenCalled = function(v427, v428, v429) --[[ Line: 409 ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_v308_7 (copy), v44 (ref), v43 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy), v27 (ref)
    local v430 = {
        isNot = v427.isNot, 
        promise = v427.promise
    };
    l_ensureNoExpected_0(v429, l_v308_7, v430);
    v44(v428, l_v308_7, "", v430);
    local v431 = v43(v428);
    local v432 = nil;
    v432 = v431 and "spy" or v428.getMockName();
    local v433 = nil;
    v433 = if v431 then v428.calls.count() else #v428.mock.calls;
    local v434 = nil;
    v434 = if v431 then l_Array_0.map(v428.calls.all(), function(v435) --[[ Line: 436 ]]
        return v435.args;
    end) else v428.mock.calls;
    local v436 = v433 > 0;
    local _ = nil;
    return {
        message = v436 and function() --[[ Line: 446 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_7 (ref), v432 (ref), v430 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v433 (ref), l_Array_0 (ref), v434 (ref), v27 (ref)
            return l_matcherHint_0(l_v308_7, v432, "", v430) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v433)) .. l_Array_0.join(l_Array_0.reduce(v434, function(v438, v439, v440) --[[ Line: 452 ]]
                -- upvalues: v27 (ref)
                if #v438 < 3 then
                    table.insert(v438, ("%s: %s"):format(tostring(v440), v27(v439)));
                end;
                return v438;
            end, {}), "\n");
        end or function() --[[ Line: 463 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_7 (ref), v432 (ref), v430 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v433 (ref)
            return l_matcherHint_0(l_v308_7, v432, "", v430) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v433));
        end, 
        pass = v436
    };
end;
v308 = "toHaveBeenCalledTimes";
local l_v308_8 = v308 --[[ copy: 61 -> 70 ]];
v307.toHaveBeenCalledTimes = function(v442, v443, v444) --[[ Line: 542 ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), l_v308_8 (copy), v44 (ref), v43 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v445 = {
        isNot = v442.isNot, 
        promise = v442.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v444, l_v308_8, v445);
    v44(v443, l_v308_8, "expected", v445);
    local v446 = v43(v443);
    local v447 = nil;
    v447 = v446 and "spy" or v443.getMockName();
    local v448 = nil;
    v448 = if v446 then v443.calls.count() else #v443.mock.calls;
    local v449 = v448 == v444;
    local _ = nil;
    return {
        message = v449 and function() --[[ Line: 571 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_8 (ref), v447 (ref), v445 (copy), l_printExpected_0 (ref), v444 (copy)
            return l_matcherHint_0(l_v308_8, v447, "expected", v445) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v444));
        end or function() --[[ Line: 577 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_8 (ref), v447 (ref), v445 (copy), l_printExpected_0 (ref), v444 (copy), l_printReceived_0 (ref), v448 (ref)
            return l_matcherHint_0(l_v308_8, v447, "expected", v445) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v444)) .. ("Received number of calls: %s"):format(l_printReceived_0(v448));
        end, 
        pass = v449
    };
end;
v308 = "toHaveBeenCalledWith";
local l_v308_9 = v308 --[[ copy: 61 -> 71 ]];
v307.toHaveBeenCalledWith = function(v452, v453, ...) --[[ Line: 647 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v308_9 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v454 = {
        ...
    };
    for v455 = 1, select("#", ...) do
        if v454[v455] == nil then
            v454[v455] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v456 = {
        isNot = v452.isNot, 
        promise = v452.promise
    };
    v44(v453, l_v308_9, "...expected", v456);
    local v457 = v43(v453);
    local v458 = nil;
    v458 = v457 and "spy" or v453.getMockName();
    local v459 = nil;
    v459 = if v457 then l_Array_0.map(v453.calls.all(), function(v460) --[[ Line: 675 ]]
        return v460.args;
    end) else v453.mock.calls;
    local v462 = l_Array_0.some(v459, function(v461) --[[ Line: 682 ]]
        -- upvalues: v30 (ref), v454 (copy)
        return v30(v454, v461);
    end);
    local _ = nil;
    return {
        message = v462 and function() --[[ Line: 688 ]]
            -- upvalues: v459 (ref), v30 (ref), v454 (copy), l_matcherHint_0 (ref), l_v308_9 (ref), v458 (ref), v456 (copy), v26 (ref), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v464 = {};
            local v465 = 1;
            while v465 <= #v459 and #v464 < 3 do
                if v30(v454, v459[v465]) then
                    table.insert(v464, {
                        v465, 
                        v459[v465]
                    });
                end;
                v465 = v465 + 1;
            end;
            local v466 = l_matcherHint_0(l_v308_9, v458, "...expected", v456) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v454));
            if #v459 ~= 1 or l_stringify_0(v459[1]) ~= l_stringify_0(v454) then
                v466 = v466 .. v35(v454, v464, #v459 == 1);
            end;
            return v466 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v459));
        end or function() --[[ Line: 711 ]]
            -- upvalues: v459 (ref), l_matcherHint_0 (ref), l_v308_9 (ref), v458 (ref), v456 (copy), v36 (ref), v454 (copy), v25 (ref), v452 (copy), l_printReceived_0 (ref)
            local v467 = {};
            local v468 = 1;
            while v468 <= #v459 and #v467 < 3 do
                table.insert(v467, {
                    v468, 
                    v459[v468]
                });
                v468 = v468 + 1;
            end;
            return l_matcherHint_0(l_v308_9, v458, "...expected", v456) .. "\n\n" .. v36(v454, v467, v25(v452.expand), #v459 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v459));
        end, 
        pass = v462
    };
end;
v308 = "toHaveBeenLastCalledWith";
local l_v308_10 = v308 --[[ copy: 61 -> 72 ]];
v307.toHaveBeenLastCalledWith = function(v470, v471, ...) --[[ Line: 802 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v308_10 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v472 = {
        ...
    };
    for v473 = 1, select("#", ...) do
        if v472[v473] == nil then
            v472[v473] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v474 = {
        isNot = v470.isNot, 
        promise = v470.promise
    };
    v44(v471, l_v308_10, "...expected", v474);
    local v475 = v43(v471);
    local v476 = nil;
    v476 = v475 and "spy" or v471.getMockName();
    local v477 = nil;
    v477 = if v475 then l_Array_0.map(v471.calls.all(), function(v478) --[[ Line: 830 ]]
        return v478.args;
    end) else v471.mock.calls;
    local v479 = #v477;
    local v480 = false;
    if v479 >= 1 then
        v480 = v30(v472, v477[v479]);
    end;
    local _ = nil;
    return {
        message = v480 and function() --[[ Line: 843 ]]
            -- upvalues: v479 (copy), v477 (ref), l_matcherHint_0 (ref), l_v308_10 (ref), v476 (ref), v474 (copy), v26 (ref), v472 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v482 = {};
            if v479 > 1 then
                table.insert(v482, {
                    v479 - 1, 
                    v477[v479 - 1]
                });
            end;
            table.insert(v482, {
                v479, 
                v477[v479]
            });
            local v483 = l_matcherHint_0(l_v308_10, v476, "...expected", v474) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v472));
            if #v477 ~= 1 or l_stringify_0(v477[1]) ~= l_stringify_0(v472) then
                v483 = v483 .. v35(v472, v482, #v477 == 1, v479);
            end;
            return v483 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v477));
        end or function() --[[ Line: 865 ]]
            -- upvalues: v479 (copy), v30 (ref), v472 (copy), v477 (ref), l_matcherHint_0 (ref), l_v308_10 (ref), v476 (ref), v474 (copy), v36 (ref), v25 (ref), v470 (copy), l_printReceived_0 (ref)
            local v484 = {};
            if v479 >= 1 then
                if v479 > 1 then
                    local v485 = v479 - 1;
                    while v485 >= 1 and not v30(v472, v477[v485]) do
                        v485 = v485 - 1;
                    end;
                    if v485 < 1 then
                        v485 = v479 - 1;
                    end;
                    table.insert(v484, {
                        v485, 
                        v477[v485]
                    });
                end;
                table.insert(v484, {
                    v479, 
                    v477[v479]
                });
            end;
            return l_matcherHint_0(l_v308_10, v476, "...expected", v474) .. "\n\n" .. v36(v472, v484, v25(v470.expand), #v477 == 1, v479) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v477));
        end, 
        pass = v480
    };
end;
v308 = "toHaveBeenNthCalledWith";
local l_v308_11 = v308 --[[ copy: 61 -> 73 ]];
v307.toHaveBeenNthCalledWith = function(v487, v488, v489, ...) --[[ Line: 985 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v308_11 (copy), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), v26 (ref), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v490 = {
        ...
    };
    for v491 = 1, select("#", ...) do
        if v490[v491] == nil then
            v490[v491] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v493 = {
        expectedColor = function(v492) --[[ Line: 997 ]] --[[ Name: expectedColor ]]
            return v492;
        end, 
        isNot = v487.isNot, 
        promise = v487.promise, 
        secondArgument = "...expected"
    };
    v44(v488, l_v308_11, "n", v493);
    if not l_Number_0.isSafeInteger(v489) or v489 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v308_11, nil, "n", v493), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v489, l_stringify_0))));
    end;
    local v494 = v43(v488);
    local v495 = nil;
    v495 = v494 and "spy" or v488.getMockName();
    local v496 = nil;
    v496 = if v494 then l_Array_0.map(v488.calls.all(), function(v497) --[[ Line: 1030 ]]
        return v497.args;
    end) else v488.mock.calls;
    local v498 = #v496;
    local v499 = false;
    if v489 <= v498 then
        v499 = v30(v490, v496[v489]);
    end;
    local _ = nil;
    return {
        message = v499 and function() --[[ Line: 1043 ]]
            -- upvalues: v489 (copy), v496 (ref), v498 (copy), l_matcherHint_0 (ref), l_v308_11 (ref), v495 (ref), v493 (copy), v489 (copy), v26 (ref), v490 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v501 = {};
            if v489 - 1 >= 1 then
                table.insert(v501, {
                    v489 - 1, 
                    v496[v489 - 1]
                });
            end;
            table.insert(v501, {
                v489, 
                v496[v489]
            });
            if v489 + 1 <= v498 then
                table.insert(v501, {
                    v489 + 1, 
                    v496[v489 + 1]
                });
            end;
            local v502 = l_matcherHint_0(l_v308_11, v495, "n", v493) .. "\n\n" .. ("n: %s\n"):format((tostring(v489))) .. ("Expected: never %s\n"):format(v26(v490));
            if #v496 ~= 1 or l_stringify_0(v496[1]) ~= l_stringify_0(v490) then
                v502 = v502 .. v35(v490, v501, #v496 == 1, v489);
            end;
            return v502 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v496));
        end or function() --[[ Line: 1071 ]]
            -- upvalues: v489 (copy), v498 (copy), v30 (ref), v490 (copy), v496 (ref), l_matcherHint_0 (ref), l_v308_11 (ref), v495 (ref), v493 (copy), v489 (copy), v36 (ref), v25 (ref), v487 (copy), l_printReceived_0 (ref)
            local v503 = {};
            if v489 <= v498 then
                if v489 - 1 >= 1 then
                    local v504 = v489 - 1;
                    while v504 >= 1 and not v30(v490, v496[v504]) do
                        v504 = v504 - 1;
                    end;
                    if v504 < 1 then
                        v504 = v489 - 1;
                    end;
                    table.insert(v503, {
                        v504, 
                        v496[v504]
                    });
                end;
                table.insert(v503, {
                    v489, 
                    v496[v489]
                });
                if v489 + 1 <= v498 then
                    local v505 = v489 + 1;
                    while v505 <= v498 and not v30(v490, v496[v505]) do
                        v505 = v505 + 1;
                    end;
                    if v498 <= v505 then
                        v505 = v489 + 1;
                    end;
                    table.insert(v503, {
                        v505, 
                        v496[v505]
                    });
                end;
            elseif v498 > 1 then
                local v506 = v498 - 1;
                while v506 >= 1 and not v30(v490, v496[v506]) do
                    v506 = v506 - 1;
                end;
                if v506 < 1 then
                    v506 = v498 - 1;
                end;
                table.insert(v503, {
                    v506, 
                    v496[v506]
                });
            end;
            return l_matcherHint_0(l_v308_11, v495, "n", v493) .. "\n\n" .. ("n: %s\n"):format((tostring(v489))) .. v36(v490, v503, v25(v487.expand), #v496 == 1, v489) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v496));
        end, 
        pass = v499
    };
end;
v308 = "toHaveLastReturnedWith";
local l_v308_12 = v308 --[[ copy: 61 -> 74 ]];
v307.toHaveLastReturnedWith = function(v508, v509, v510) --[[ Line: 902 ]]
    -- upvalues: v45 (ref), l_v308_12 (copy), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v511 = {
        isNot = v508.isNot, 
        promise = v508.promise
    };
    v45(v509, l_v308_12, "expected", v511);
    local v512 = v509.getMockName();
    local l_mock_5 = v509.mock;
    local l_calls_5 = l_mock_5.calls;
    local l_results_5 = l_mock_5.results;
    local v516 = #l_results_5;
    local v517 = false;
    if v516 >= 1 then
        v517 = v31(v510, l_results_5[v516]);
    end;
    local _ = nil;
    return {
        message = v517 and function() --[[ Line: 922 ]]
            -- upvalues: v516 (copy), l_results_5 (copy), l_matcherHint_0 (ref), l_v308_12 (ref), v512 (copy), v511 (copy), l_printExpected_0 (ref), v510 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_5 (copy)
            local v519 = {};
            if v516 > 1 then
                table.insert(v519, {
                    v516 - 1, 
                    l_results_5[v516 - 1]
                });
            end;
            table.insert(v519, {
                v516, 
                l_results_5[v516]
            });
            local v520 = l_matcherHint_0(l_v308_12, v512, "expected", v511) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v510));
            if #l_results_5 ~= 1 or l_results_5[1].type ~= "return" or l_stringify_0(l_results_5[1].value) ~= l_stringify_0(v510) then
                v520 = v520 .. v41("Received:       ", v510, v519, #l_results_5 == 1, v516);
            end;
            return v520 .. v33(v32(l_results_5), #l_calls_5);
        end or function() --[[ Line: 951 ]]
            -- upvalues: v516 (copy), v31 (ref), v510 (copy), l_results_5 (copy), l_matcherHint_0 (ref), l_v308_12 (ref), v512 (copy), v511 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_5 (copy)
            local v521 = {};
            if v516 >= 1 then
                if v516 > 1 then
                    local v522 = v516 - 1;
                    while v522 >= 1 and not v31(v510, l_results_5[v522]) do
                        v522 = v522 - 1;
                    end;
                    if v522 < 1 then
                        v522 = v516 - 1;
                    end;
                    table.insert(v521, {
                        v522, 
                        l_results_5[v522]
                    });
                end;
                table.insert(v521, {
                    v516, 
                    l_results_5[v516]
                });
            end;
            return l_matcherHint_0(l_v308_12, v512, "expected", v511) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v510)) .. v41("Received: ", v510, v521, #l_results_5 == 1, v516) .. v33(v32(l_results_5), #l_calls_5);
        end, 
        pass = v517
    };
end;
v308 = "toHaveNthReturnedWith";
local l_v308_13 = v308 --[[ copy: 61 -> 75 ]];
v307.toHaveNthReturnedWith = function(v524, v525, v526, v527) --[[ Line: 1141 ]]
    -- upvalues: v45 (ref), l_v308_13 (copy), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v31 (ref), l_printExpected_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v529 = {
        expectedColor = function(v528) --[[ Line: 1144 ]] --[[ Name: expectedColor ]]
            return v528;
        end, 
        isNot = v524.isNot, 
        promise = v524.promise, 
        secondArgument = "expected"
    };
    v45(v525, l_v308_13, "n", v529);
    if not l_Number_0.isSafeInteger(v526) or v526 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v308_13, nil, "n", v529), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v526, l_stringify_0))));
    end;
    local v530 = v525.getMockName();
    local l_mock_6 = v525.mock;
    local l_calls_6 = l_mock_6.calls;
    local l_results_6 = l_mock_6.results;
    local v534 = #l_results_6;
    local v535 = false;
    if v526 <= v534 then
        v535 = v31(v527, l_results_6[v526]);
    end;
    local _ = nil;
    return {
        message = v535 and function() --[[ Line: 1178 ]]
            -- upvalues: v526 (copy), l_results_6 (copy), v534 (copy), l_matcherHint_0 (ref), l_v308_13 (ref), v530 (copy), v529 (copy), v526 (copy), l_printExpected_0 (ref), v527 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_6 (copy)
            local v537 = {};
            if v526 - 1 >= 1 then
                table.insert(v537, {
                    v526 - 1, 
                    l_results_6[v526 - 1]
                });
            end;
            table.insert(v537, {
                v526, 
                l_results_6[v526]
            });
            if v526 + 1 <= v534 then
                table.insert(v537, {
                    v526 + 1, 
                    l_results_6[v526 + 1]
                });
            end;
            local v538 = l_matcherHint_0(l_v308_13, v530, "n", v529) .. "\n\n" .. ("n: %s\n"):format((tostring(v526))) .. ("Expected: never %s\n"):format(l_printExpected_0(v527));
            if #l_results_6 ~= 1 or l_results_6[1].type ~= "return" or l_stringify_0(l_results_6[1].value) ~= l_stringify_0(v527) then
                v538 = v538 .. v41("Received:       ", v527, v537, #l_results_6 == 1, v526);
            end;
            return v538 .. v33(v32(l_results_6), #l_calls_6);
        end or function() --[[ Line: 1210 ]]
            -- upvalues: v526 (copy), v534 (copy), v31 (ref), v527 (copy), l_results_6 (copy), l_matcherHint_0 (ref), l_v308_13 (ref), v530 (copy), v529 (copy), v526 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_6 (copy)
            local v539 = {};
            if v526 <= v534 then
                if v526 - 1 >= 1 then
                    local v540 = v526 - 1;
                    while v540 >= 1 and not v31(v527, l_results_6[v540]) do
                        v540 = v540 - 1;
                    end;
                    if v540 < 1 then
                        v540 = v526 - 1;
                    end;
                    table.insert(v539, {
                        v540, 
                        l_results_6[v540]
                    });
                end;
                table.insert(v539, {
                    v526, 
                    l_results_6[v526]
                });
                if v526 + 1 <= v534 then
                    local v541 = v526 + 1;
                    while v541 <= v534 and not v31(v527, l_results_6[v541]) do
                        v541 = v541 + 1;
                    end;
                    if v534 < v541 then
                        v541 = v526 + 1;
                    end;
                    table.insert(v539, {
                        v541, 
                        l_results_6[v541]
                    });
                end;
            elseif v534 > 0 then
                local l_v534_0 = v534;
                while l_v534_0 >= 1 and not v31(v527, l_results_6[l_v534_0]) do
                    l_v534_0 = l_v534_0 - 1;
                end;
                if l_v534_0 < 1 then
                    l_v534_0 = v534 - 1;
                end;
                table.insert(v539, {
                    l_v534_0, 
                    l_results_6[l_v534_0]
                });
            end;
            return l_matcherHint_0(l_v308_13, v530, "n", v529) .. "\n\n" .. ("n: %s\n"):format((tostring(v526))) .. ("Expected: %s\n"):format(l_printExpected_0(v527)) .. v41("Received: ", v527, v539, #l_results_6 == 1, v526) .. v33(v32(l_results_6), #l_calls_6);
        end, 
        pass = v535
    };
end;
v308 = "toHaveReturned";
local l_v308_14 = v308 --[[ copy: 61 -> 76 ]];
v307.toHaveReturned = function(v544, v545, v546) --[[ Line: 476 ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_v308_14 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v547 = {
        isNot = v544.isNot, 
        promise = v544.promise
    };
    l_ensureNoExpected_0(v546, l_v308_14, v547);
    v45(v545, l_v308_14, "", v547);
    local v548 = v545.getMockName();
    local v551 = l_Array_0.reduce(v545.mock.results, function(v549, v550) --[[ Line: 489 ]]
        if v550.type == "return" then
            return v549 + 1;
        else
            return v549;
        end;
    end, 0);
    local v552 = v551 > 0;
    local _ = nil;
    return {
        message = v552 and function() --[[ Line: 500 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_14 (ref), v548 (copy), v547 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v551 (copy), l_Array_0 (ref), v545 (copy)
            local v557 = l_matcherHint_0(l_v308_14, v548, "", v547) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v551)) .. l_Array_0.join(l_Array_0.reduce(v545.mock.results, function(v554, v555, v556) --[[ Line: 506 ]]
                -- upvalues: l_printReceived_0 (ref)
                if v555.type == "return" and #v554 < 3 then
                    table.insert(v554, ("%s: %s"):format(tostring(v556), l_printReceived_0(v555.value)));
                end;
                return v554;
            end, {}), "\n");
            if #v545.mock.calls ~= v551 then
                v557 = v557 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v545.mock.calls);
            end;
            return v557;
        end or function() --[[ Line: 523 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_14 (ref), v548 (copy), v547 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v551 (copy), v545 (copy)
            local v558 = l_matcherHint_0(l_v308_14, v548, "", v547) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v551));
            if #v545.mock.calls ~= v551 then
                v558 = v558 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v545.mock.calls));
            end;
            return v558;
        end, 
        pass = v552
    };
end;
v308 = "toHaveReturnedTimes";
local l_v308_15 = v308 --[[ copy: 61 -> 77 ]];
v307.toHaveReturnedTimes = function(v560, v561, v562) --[[ Line: 590 ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), l_v308_15 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v563 = {
        isNot = v560.isNot, 
        promise = v560.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v562, l_v308_15, v563);
    v45(v561, l_v308_15, "expected", v563);
    local v564 = v561.getMockName();
    local v567 = l_Array_0.reduce(v561.mock.results, function(v565, v566) --[[ Line: 603 ]]
        if v566.type == "return" then
            return v565 + 1;
        else
            return v565;
        end;
    end, 0);
    local v568 = v567 == v562;
    local _ = nil;
    return {
        message = v568 and function() --[[ Line: 615 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_15 (ref), v564 (copy), v563 (copy), l_printExpected_0 (ref), v562 (copy), v561 (copy), v567 (copy), l_printReceived_0 (ref)
            local v570 = l_matcherHint_0(l_v308_15, v564, "expected", v563) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v562));
            if #v561.mock.calls ~= v567 then
                v570 = v570 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v561.mock.calls));
            end;
            return v570;
        end or function() --[[ Line: 628 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_15 (ref), v564 (copy), v563 (copy), l_printExpected_0 (ref), v562 (copy), l_printReceived_0 (ref), v567 (copy), v561 (copy)
            local v571 = l_matcherHint_0(l_v308_15, v564, "expected", v563) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v562)) .. ("Received number of returns: %s"):format(l_printReceived_0(v567));
            if #v561.mock.calls ~= v567 then
                v571 = v571 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v561.mock.calls));
            end;
            return v571;
        end, 
        pass = v568
    };
end;
v308 = "toHaveReturnedWith";
local l_v308_16 = v308 --[[ copy: 61 -> 78 ]];
v307.toHaveReturnedWith = function(v573, v574, v575) --[[ Line: 731 ]]
    -- upvalues: v45 (ref), l_v308_16 (copy), l_Array_0 (copy), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v576 = {
        isNot = v573.isNot, 
        promise = v573.promise
    };
    v45(v574, l_v308_16, "expected", v576);
    local v577 = v574.getMockName();
    local l_mock_7 = v574.mock;
    local l_calls_7 = l_mock_7.calls;
    local l_results_7 = l_mock_7.results;
    local v582 = l_Array_0.some(l_results_7, function(v581) --[[ Line: 744 ]]
        -- upvalues: v31 (ref), v575 (copy)
        return v31(v575, v581);
    end);
    local _ = nil;
    return {
        message = v582 and function() --[[ Line: 750 ]]
            -- upvalues: l_results_7 (copy), v31 (ref), v575 (copy), l_matcherHint_0 (ref), l_v308_16 (ref), v577 (copy), v576 (copy), l_printExpected_0 (ref), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_7 (copy)
            local v584 = {};
            local v585 = 1;
            while v585 <= #l_results_7 and #v584 < 3 do
                if v31(v575, l_results_7[v585]) then
                    table.insert(v584, {
                        v585, 
                        l_results_7[v585]
                    });
                end;
                v585 = v585 + 1;
            end;
            local v586 = l_matcherHint_0(l_v308_16, v577, "expected", v576) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v575));
            if #l_results_7 ~= 1 or l_results_7[1].type ~= "return" or l_stringify_0(l_results_7[1].value) ~= l_stringify_0(v575) then
                v586 = v586 .. v41("Received:       ", v575, v584, #l_results_7 == 1);
            end;
            return v586 .. v33(v32(l_results_7), #l_calls_7);
        end or function() --[[ Line: 780 ]]
            -- upvalues: l_results_7 (copy), l_matcherHint_0 (ref), l_v308_16 (ref), v577 (copy), v576 (copy), l_printExpected_0 (ref), v575 (copy), v41 (ref), v33 (ref), v32 (ref), l_calls_7 (copy)
            local v587 = {};
            local v588 = 1;
            while v588 <= #l_results_7 and #v587 < 3 do
                table.insert(v587, {
                    v588, 
                    l_results_7[v588]
                });
                v588 = v588 + 1;
            end;
            return l_matcherHint_0(l_v308_16, v577, "expected", v576) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v575)) .. v41("Received: ", v575, v587, #l_results_7 == 1) .. v33(v32(l_results_7), #l_calls_7);
        end, 
        pass = v582
    };
end;
v308 = "toReturn";
local l_v308_17 = v308 --[[ copy: 61 -> 79 ]];
v307.toReturn = function(v590, v591, v592) --[[ Line: 476 ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_v308_17 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v593 = {
        isNot = v590.isNot, 
        promise = v590.promise
    };
    l_ensureNoExpected_0(v592, l_v308_17, v593);
    v45(v591, l_v308_17, "", v593);
    local v594 = v591.getMockName();
    local v597 = l_Array_0.reduce(v591.mock.results, function(v595, v596) --[[ Line: 489 ]]
        if v596.type == "return" then
            return v595 + 1;
        else
            return v595;
        end;
    end, 0);
    local v598 = v597 > 0;
    local _ = nil;
    return {
        message = v598 and function() --[[ Line: 500 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_17 (ref), v594 (copy), v593 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v597 (copy), l_Array_0 (ref), v591 (copy)
            local v603 = l_matcherHint_0(l_v308_17, v594, "", v593) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v597)) .. l_Array_0.join(l_Array_0.reduce(v591.mock.results, function(v600, v601, v602) --[[ Line: 506 ]]
                -- upvalues: l_printReceived_0 (ref)
                if v601.type == "return" and #v600 < 3 then
                    table.insert(v600, ("%s: %s"):format(tostring(v602), l_printReceived_0(v601.value)));
                end;
                return v600;
            end, {}), "\n");
            if #v591.mock.calls ~= v597 then
                v603 = v603 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v591.mock.calls);
            end;
            return v603;
        end or function() --[[ Line: 523 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_17 (ref), v594 (copy), v593 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v597 (copy), v591 (copy)
            local v604 = l_matcherHint_0(l_v308_17, v594, "", v593) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v597));
            if #v591.mock.calls ~= v597 then
                v604 = v604 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v591.mock.calls));
            end;
            return v604;
        end, 
        pass = v598
    };
end;
v308 = "toReturnTimes";
local l_v308_18 = v308 --[[ copy: 61 -> 80 ]];
v307.toReturnTimes = function(v606, v607, v608) --[[ Line: 590 ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), l_v308_18 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v609 = {
        isNot = v606.isNot, 
        promise = v606.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v608, l_v308_18, v609);
    v45(v607, l_v308_18, "expected", v609);
    local v610 = v607.getMockName();
    local v613 = l_Array_0.reduce(v607.mock.results, function(v611, v612) --[[ Line: 603 ]]
        if v612.type == "return" then
            return v611 + 1;
        else
            return v611;
        end;
    end, 0);
    local v614 = v613 == v608;
    local _ = nil;
    return {
        message = v614 and function() --[[ Line: 615 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_18 (ref), v610 (copy), v609 (copy), l_printExpected_0 (ref), v608 (copy), v607 (copy), v613 (copy), l_printReceived_0 (ref)
            local v616 = l_matcherHint_0(l_v308_18, v610, "expected", v609) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v608));
            if #v607.mock.calls ~= v613 then
                v616 = v616 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v607.mock.calls));
            end;
            return v616;
        end or function() --[[ Line: 628 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v308_18 (ref), v610 (copy), v609 (copy), l_printExpected_0 (ref), v608 (copy), l_printReceived_0 (ref), v613 (copy), v607 (copy)
            local v617 = l_matcherHint_0(l_v308_18, v610, "expected", v609) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v608)) .. ("Received number of returns: %s"):format(l_printReceived_0(v613));
            if #v607.mock.calls ~= v613 then
                v617 = v617 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v607.mock.calls));
            end;
            return v617;
        end, 
        pass = v614
    };
end;
v308 = "toReturnWith";
v307.toReturnWith = function(v618, v619, v620) --[[ Line: 731 ]]
    -- upvalues: v45 (ref), v308 (copy), l_Array_0 (copy), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v621 = {
        isNot = v618.isNot, 
        promise = v618.promise
    };
    v45(v619, v308, "expected", v621);
    local v622 = v619.getMockName();
    local l_mock_8 = v619.mock;
    local l_calls_8 = l_mock_8.calls;
    local l_results_8 = l_mock_8.results;
    local v627 = l_Array_0.some(l_results_8, function(v626) --[[ Line: 744 ]]
        -- upvalues: v31 (ref), v620 (copy)
        return v31(v620, v626);
    end);
    local _ = nil;
    return {
        message = v627 and function() --[[ Line: 750 ]]
            -- upvalues: l_results_8 (copy), v31 (ref), v620 (copy), l_matcherHint_0 (ref), v308 (ref), v622 (copy), v621 (copy), l_printExpected_0 (ref), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_8 (copy)
            local v629 = {};
            local v630 = 1;
            while v630 <= #l_results_8 and #v629 < 3 do
                if v31(v620, l_results_8[v630]) then
                    table.insert(v629, {
                        v630, 
                        l_results_8[v630]
                    });
                end;
                v630 = v630 + 1;
            end;
            local v631 = l_matcherHint_0(v308, v622, "expected", v621) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v620));
            if #l_results_8 ~= 1 or l_results_8[1].type ~= "return" or l_stringify_0(l_results_8[1].value) ~= l_stringify_0(v620) then
                v631 = v631 .. v41("Received:       ", v620, v629, #l_results_8 == 1);
            end;
            return v631 .. v33(v32(l_results_8), #l_calls_8);
        end or function() --[[ Line: 780 ]]
            -- upvalues: l_results_8 (copy), l_matcherHint_0 (ref), v308 (ref), v622 (copy), v621 (copy), l_printExpected_0 (ref), v620 (copy), v41 (ref), v33 (ref), v32 (ref), l_calls_8 (copy)
            local v632 = {};
            local v633 = 1;
            while v633 <= #l_results_8 and #v632 < 3 do
                table.insert(v632, {
                    v633, 
                    l_results_8[v633]
                });
                v633 = v633 + 1;
            end;
            return l_matcherHint_0(v308, v622, "expected", v621) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v620)) .. v41("Received: ", v620, v632, #l_results_8 == 1) .. v33(v32(l_results_8), #l_calls_8);
        end, 
        pass = v627
    };
end;
v42 = function(v634) --[[ Line: 1301 ]] --[[ Name: isMock ]]
    local v635 = false;
    if v634 ~= nil then
        v635 = false;
        if typeof(v634) == "table" then
            v635 = v634._isMockFunction == true;
        end;
    end;
    return v635;
end;
v43 = function(v636) --[[ Line: 1305 ]] --[[ Name: isSpy ]]
    local v637 = false;
    if v636 ~= nil then
        v637 = false;
        if typeof(v636) == "table" then
            v637 = false;
            if v636.calls ~= nil then
                v637 = false;
                if typeof(v636.calls.all) == "function" then
                    v637 = typeof(v636.calls.count) == "function";
                end;
            end;
        end;
    end;
    return v637;
end;
v44 = function(v638, v639, v640, v641) --[[ Line: 1314 ]] --[[ Name: ensureMockOrSpy ]]
    -- upvalues: v42 (ref), v43 (ref), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy)
    if not v42(v638) and not v43(v638) then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v639, nil, v640, v641), ("%s value must be a mock or spy function"):format(l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v638, l_printReceived_0))));
    end;
end;
v45 = function(v642, v643, v644, v645) --[[ Line: 1334 ]] --[[ Name: ensureMock ]]
    -- upvalues: v42 (ref), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy)
    if not v42(v642) then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v643, nil, v644, v645), ("%s value must be a mock function"):format(l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v642, l_printReceived_0))));
    end;
end;
return v307;