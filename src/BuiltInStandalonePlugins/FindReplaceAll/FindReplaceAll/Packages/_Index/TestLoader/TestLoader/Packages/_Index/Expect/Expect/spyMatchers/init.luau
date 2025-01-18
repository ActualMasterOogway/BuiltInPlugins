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
v25 = function(v46) --[[ Line: 55 ]] --[[ Name: isExpand ]]
    return v46 ~= false;
end;
v26 = function(v47) --[[ Line: 63 ]] --[[ Name: printExpectedArgs ]]
    -- upvalues: l_Array_0 (copy), l_printExpected_0 (copy)
    if #v47 == 0 then
        return "called with 0 arguments";
    else
        return l_Array_0.join(l_Array_0.map(v47, function(v48) --[[ Line: 68 ]]
            -- upvalues: l_printExpected_0 (ref)
            return l_printExpected_0(v48);
        end), ", ");
    end;
end;
v27 = function(v49, v50) --[[ Line: 76 ]] --[[ Name: printReceivedArgs ]]
    -- upvalues: l_Array_0 (copy), v29 (ref), v28 (ref), l_printReceived_0 (copy)
    local v51 = v50 or {};
    if #v49 == 0 then
        return "called with 0 arguments";
    else
        return l_Array_0.join(l_Array_0.map(v49, function(v52, v53) --[[ Line: 82 ]]
            -- upvalues: l_Array_0 (ref), v51 (copy), v29 (ref), v28 (ref), l_printReceived_0 (ref)
            if l_Array_0.isArray(v51) and v53 <= #v51 and v29(v51[v53], v52) then
                return v28(v52);
            else
                return l_printReceived_0(v52);
            end;
        end), ", ");
    end;
end;
v28 = function(v54) --[[ Line: 94 ]] --[[ Name: printCommon ]]
    -- upvalues: l_DIM_COLOR_0 (copy), l_stringify_0 (copy)
    return l_DIM_COLOR_0(l_stringify_0(v54));
end;
v29 = function(v55, v56) --[[ Line: 98 ]] --[[ Name: isEqualValue ]]
    -- upvalues: l_equals_0 (copy), l_iterableEquality_0 (copy)
    return l_equals_0(v55, v56, {
        l_iterableEquality_0
    });
end;
v30 = function(v57, v58) --[[ Line: 102 ]] --[[ Name: isEqualCall ]]
    -- upvalues: v29 (ref)
    return v29(v57, v58);
end;
v31 = function(v59, v60) --[[ Line: 106 ]] --[[ Name: isEqualReturn ]]
    -- upvalues: v29 (ref)
    local v61 = false;
    if v60.type == "return" then
        v61 = v29(v59, v60.value);
    end;
    return v61;
end;
v32 = function(v62) --[[ Line: 110 ]] --[[ Name: countReturns ]]
    -- upvalues: l_Array_0 (copy)
    return l_Array_0.reduce(v62, function(v63, v64) --[[ Line: 111 ]]
        if v64.type == "return" then
            return v63 + 1;
        else
            return v63;
        end;
    end, 0);
end;
v33 = function(v65, v66) --[[ Line: 120 ]] --[[ Name: printNumberOfReturns ]]
    -- upvalues: l_printReceived_0 (copy)
    local v67 = string.format("\nNumber of returns: %s", l_printReceived_0(v65));
    if v66 ~= v65 then
        v67 = v67 .. string.format("\nNumber of calls:   %s", l_printReceived_0(v66));
    end;
    return v67;
end;
v34 = function(v68) --[[ Line: 133 ]] --[[ Name: getRightAlignedPrinter ]]
    local v69 = v68:find(":");
    local v70 = v68:sub(v69);
    return function(v71, v72) --[[ Line: 138 ]]
        -- upvalues: v69 (copy), v70 (copy)
        local _ = nil;
        return (if v72 then "->" .. string.rep(" ", (math.max(0, v69 - 3 - #v71))) else string.rep(" ", (math.max(0, v69 - 1 - #v71)))) .. v71 .. v70;
    end;
end;
v35 = function(v74, v75, v76, v77) --[[ Line: 153 ]] --[[ Name: printReceivedCallsNegative ]]
    -- upvalues: v27 (ref), v34 (ref), l_Array_0 (copy)
    if #v75 == 0 then
        return "";
    elseif v76 then
        return "Received:       " .. v27(v75[1], v74) .. "\n";
    else
        local v78 = v34("Received:       ");
        return "Received\n" .. l_Array_0.reduce(v75, function(v79, v80) --[[ Line: 172 ]]
            -- upvalues: v78 (copy), v77 (copy), v27 (ref), v74 (copy)
            local v81 = v80[1];
            local v82 = v80[2];
            return v79 .. v78(tostring(v81), v81 == v77) .. v27(v82, v74) .. "\n";
        end, "");
    end;
end;
v36 = function(v83, v84, v85, v86, v87) --[[ Line: 180 ]] --[[ Name: printExpectedReceivedCallsPositive ]]
    -- upvalues: v26 (ref), v38 (ref), l_EXPECTED_COLOR_0 (copy), l_RECEIVED_COLOR_0 (copy), v29 (ref), v28 (ref), v39 (ref), l_diff_0 (copy), l_Array_0 (copy), l_stringify_0 (copy), v27 (ref), v34 (ref), v37 (ref)
    local v88 = string.format("Expected: %s\n", v26(v83));
    if #v84 == 0 then
        return v88;
    elseif v86 and (v87 == 1 or v87 == nil) then
        local v89 = v84[1][2];
        if v38(v83, v89) then
            local v90 = {
                l_EXPECTED_COLOR_0("- Expected"), 
                l_RECEIVED_COLOR_0("+ Received"), 
                ""
            };
            for v91 = 1, math.max(#v83, #v89) do
                local l_v91_0 = v91;
                local v93 = false;
                if l_v91_0 <= #v83 and l_v91_0 <= #v89 then
                    if v29(v83[l_v91_0], v89[l_v91_0]) then
                        table.insert(v90, "  " .. v28(v89[l_v91_0]) .. ",");
                        v93 = true;
                    end;
                    if not v93 and v39(v83[l_v91_0], v89[l_v91_0]) then
                        local v94 = l_diff_0(v83[l_v91_0], v89[l_v91_0], {
                            v85
                        });
                        if typeof(v94) == "string" and v94:find("%- Expected") and v94:find("%+ Received") then
                            local v95 = {};
                            for v96 in v94:gmatch("[^\n]+") do
                                table.insert(v95, v96);
                            end;
                            v95 = l_Array_0.slice(v95, 3);
                            table.insert(v90, l_Array_0.join(v95, "\n") .. ",");
                            v93 = true;
                        end;
                    end;
                end;
                if not v93 then
                    if l_v91_0 <= #v83 then
                        table.insert(v90, l_EXPECTED_COLOR_0("- " .. l_stringify_0(v83[l_v91_0])) .. ",");
                    end;
                    if l_v91_0 <= #v89 then
                        table.insert(v90, l_RECEIVED_COLOR_0("+ " .. l_stringify_0(v89[l_v91_0])) .. ",");
                    end;
                end;
                l_v91_0 = l_v91_0 + 1;
            end;
            return table.concat(v90, "\n") .. "\n";
        else
            return v88 .. "Received: " .. v27(v89, v83) .. "\n";
        end;
    else
        local v97 = v34("Received: ");
        return v88 .. "Received\n" .. l_Array_0.reduce(v84, function(v98, v99) --[[ Line: 254 ]]
            -- upvalues: v97 (copy), v87 (copy), v38 (ref), v83 (copy), v37 (ref), v85 (copy), v27 (ref)
            local v100 = v99[1];
            local v101 = v99[2];
            local v102 = v97(tostring(v100), v100 == v87);
            if (v100 == v87 or v87 == nil) and v38(v83, v101) then
                return v98 .. v102:sub(1, v102:find(":") - 1) .. "\n" .. v102:sub(v102:find(":") + 1, #v102) .. v37(v83, v101, v85) .. "\n";
            else
                return v98 .. v102 .. v27(v101, v83) .. "\n";
            end;
        end, "");
    end;
end;
local v103 = string.gsub("Received", "[a-zA-Z0-9_]", " ");
v37 = function(v104, v105, v106) --[[ Line: 275 ]] --[[ Name: printDiffCall ]]
    -- upvalues: l_Array_0 (copy), v29 (ref), v103 (copy), v28 (ref), v39 (ref), l_diff_0 (copy), l_printReceived_0 (copy), l_RECEIVED_COLOR_0 (copy), l_stringify_0 (copy)
    return l_Array_0.join(l_Array_0.map(v105, function(v107, v108) --[[ Line: 277 ]]
        -- upvalues: v104 (copy), v29 (ref), v103 (ref), v28 (ref), v39 (ref), l_diff_0 (ref), v106 (copy), l_Array_0 (ref), l_printReceived_0 (ref), l_RECEIVED_COLOR_0 (ref), l_stringify_0 (ref)
        if v108 <= #v104 then
            if v29(v104[v108], v107) then
                return v103 .. "  " .. v28(v107) .. ",";
            elseif v39(v104[v108], v107) then
                local v109 = l_diff_0(v104[v108], v107, {
                    expand = v106
                });
                if typeof(v109) == "string" and v109:find("%- Expected") and v109:find("%+ Received") then
                    local v110 = {};
                    for v111 in v109:gmatch("[^\n]+") do
                        table.insert(v110, v111);
                    end;
                    return l_Array_0.join(l_Array_0.map(l_Array_0.slice(v110, 3), function(v112) --[[ Line: 299 ]]
                        -- upvalues: v103 (ref)
                        return v103 .. v112;
                    end), "\n") .. ",";
                end;
            end;
        end;
        return v103 .. (if v108 <= #v104 then "  " .. l_printReceived_0(v107) else l_RECEIVED_COLOR_0("+ " .. l_stringify_0(v107))) .. ",";
    end), "\n");
end;
v38 = function(v113, v114) --[[ Line: 323 ]] --[[ Name: isLineDiffableCall ]]
    -- upvalues: l_Array_0 (copy), v39 (ref)
    return l_Array_0.some(v113, function(v115, v116) --[[ Line: 324 ]]
        -- upvalues: v114 (copy), v39 (ref)
        local v117 = false;
        if v116 <= #v114 then
            v117 = v39(v115, v114[v116]);
        end;
        return v117;
    end);
end;
v39 = function(v118, v119) --[[ Line: 331 ]] --[[ Name: isLineDiffableArg ]]
    -- upvalues: l_getType_0 (copy), l_isPrimitive_0 (copy)
    local v120 = l_getType_0(v118);
    local v121 = l_getType_0(v119);
    if v120 ~= v121 then
        return false;
    elseif l_isPrimitive_0(v118) then
        return false;
    elseif v120 == "date" or v120 == "function" or v120 == "regexp" or v120 == "error" then
        return false;
    elseif v120 == "table" and typeof(v118.asymmetricMatch) == "function" then
        return false;
    elseif v121 == "table" and typeof(v119.asymmetricMatch) == "function" then
        return false;
    else
        return true;
    end;
end;
v40 = function(v122, v123) --[[ Line: 362 ]] --[[ Name: printResult ]]
    -- upvalues: v29 (ref), v28 (ref), l_printReceived_0 (copy)
    if v122.type == "throw" then
        return "function call threw an error";
    elseif v122.type == "incomplete" then
        return "function call has not returned yet";
    elseif v29(v123, v122.value) then
        return v28(v122.value);
    else
        return l_printReceived_0(v122.value);
    end;
end;
v41 = function(v124, v125, v126, v127, v128) --[[ Line: 380 ]] --[[ Name: printReceivedResults ]]
    -- upvalues: v40 (ref), v34 (ref), l_String_0 (copy), l_Array_0 (copy)
    if #v126 == 0 then
        return "";
    elseif v127 and (v128 == 1 or v128 == nil) then
        return v124 .. v40(v126[1][2], v125) .. "\n";
    else
        local v129 = v34(v124);
        local v130 = v124:find(":") or 1;
        return l_String_0.trim(v124:sub(1, v130 - 1) .. v124:sub(v130 + 1, #v124)) .. "\n" .. l_Array_0.reduce(v126, function(v131, v132) --[[ Line: 403 ]]
            -- upvalues: v129 (copy), v128 (copy), v40 (ref), v125 (copy)
            local v133 = v132[1];
            local v134 = v132[2];
            return v131 .. v129(tostring(v133), v133 == v128) .. v40(v134, v125) .. "\n";
        end, "");
    end;
end;
local _ = function(v135) --[[ Line: 410 ]] --[[ Name: createToBeCalledMatcher ]]
    -- upvalues: l_ensureNoExpected_0 (copy), v44 (ref), v43 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy), v27 (ref)
    return function(v136, v137, v138) --[[ Line: 411 ]]
        -- upvalues: l_ensureNoExpected_0 (ref), v135 (copy), v44 (ref), v43 (ref), l_Array_0 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_printReceived_0 (ref), v27 (ref)
        local v139 = {
            isNot = v136.isNot, 
            promise = v136.promise
        };
        l_ensureNoExpected_0(v138, v135, v139);
        v44(v137, v135, "", v139);
        local v140 = v43(v137);
        local v141 = nil;
        v141 = v140 and "spy" or v137.getMockName();
        local v142 = nil;
        v142 = if v140 then v137.calls:count() else #v137.mock.calls;
        local v143 = nil;
        v143 = if v140 then l_Array_0.map(v137.calls:all(), function(v144) --[[ Line: 438 ]]
            return v144.args;
        end) else v137.mock.calls;
        local v145 = v142 > 0;
        local _ = nil;
        return {
            message = v145 and function() --[[ Line: 448 ]]
                -- upvalues: l_matcherHint_0 (ref), v135 (ref), v141 (ref), v139 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v142 (ref), l_Array_0 (ref), v143 (ref), v27 (ref)
                return l_matcherHint_0(v135, v141, "", v139) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v142)) .. l_Array_0.join(l_Array_0.reduce(v143, function(v147, v148, v149) --[[ Line: 454 ]]
                    -- upvalues: v27 (ref)
                    if #v147 < 3 then
                        table.insert(v147, ("%s: %s"):format(tostring(v149), v27(v148)));
                    end;
                    return v147;
                end, {}), "\n");
            end or function() --[[ Line: 465 ]]
                -- upvalues: l_matcherHint_0 (ref), v135 (ref), v141 (ref), v139 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v142 (ref)
                return l_matcherHint_0(v135, v141, "", v139) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v142));
            end, 
            pass = v145
        };
    end;
end;
local _ = function(v151) --[[ Line: 477 ]] --[[ Name: createToReturnMatcher ]]
    -- upvalues: l_ensureNoExpected_0 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    return function(v152, v153, v154) --[[ Line: 478 ]]
        -- upvalues: l_ensureNoExpected_0 (ref), v151 (copy), v45 (ref), l_Array_0 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_printReceived_0 (ref)
        local v155 = {
            isNot = v152.isNot, 
            promise = v152.promise
        };
        l_ensureNoExpected_0(v154, v151, v155);
        v45(v153, v151, "", v155);
        local v156 = v153.getMockName();
        local v159 = l_Array_0.reduce(v153.mock.results, function(v157, v158) --[[ Line: 491 ]]
            if v158.type == "return" then
                return v157 + 1;
            else
                return v157;
            end;
        end, 0);
        local v160 = v159 > 0;
        local _ = nil;
        return {
            message = v160 and function() --[[ Line: 502 ]]
                -- upvalues: l_matcherHint_0 (ref), v151 (ref), v156 (copy), v155 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v159 (copy), l_Array_0 (ref), v153 (copy)
                local v165 = l_matcherHint_0(v151, v156, "", v155) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v159)) .. l_Array_0.join(l_Array_0.reduce(v153.mock.results, function(v162, v163, v164) --[[ Line: 508 ]]
                    -- upvalues: l_printReceived_0 (ref)
                    if v163.type == "return" and #v162 < 3 then
                        table.insert(v162, ("%s: %s"):format(tostring(v164), l_printReceived_0(v163.value)));
                    end;
                    return v162;
                end, {}), "\n");
                if #v153.mock.calls ~= v159 then
                    v165 = v165 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v153.mock.calls);
                end;
                return v165;
            end or function() --[[ Line: 525 ]]
                -- upvalues: l_matcherHint_0 (ref), v151 (ref), v156 (copy), v155 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v159 (copy), v153 (copy)
                local v166 = l_matcherHint_0(v151, v156, "", v155) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v159));
                if #v153.mock.calls ~= v159 then
                    v166 = v166 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v153.mock.calls));
                end;
                return v166;
            end, 
            pass = v160
        };
    end;
end;
local _ = function(v168) --[[ Line: 543 ]] --[[ Name: createToBeCalledTimesMatcher ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), v44 (ref), v43 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    return function(v169, v170, v171) --[[ Line: 544 ]]
        -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (ref), v168 (copy), v44 (ref), v43 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_printReceived_0 (ref)
        local v172 = {
            isNot = v169.isNot, 
            promise = v169.promise
        };
        l_ensureExpectedIsNonNegativeInteger_0(v171, v168, v172);
        v44(v170, v168, "expected", v172);
        local v173 = v43(v170);
        local v174 = nil;
        v174 = v173 and "spy" or v170.getMockName();
        local v175 = nil;
        v175 = if v173 then v170.calls:count() else #v170.mock.calls;
        local v176 = v175 == v171;
        local _ = nil;
        return {
            message = v176 and function() --[[ Line: 573 ]]
                -- upvalues: l_matcherHint_0 (ref), v168 (ref), v174 (ref), v172 (copy), l_printExpected_0 (ref), v171 (copy)
                return l_matcherHint_0(v168, v174, "expected", v172) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v171));
            end or function() --[[ Line: 579 ]]
                -- upvalues: l_matcherHint_0 (ref), v168 (ref), v174 (ref), v172 (copy), l_printExpected_0 (ref), v171 (copy), l_printReceived_0 (ref), v175 (ref)
                return l_matcherHint_0(v168, v174, "expected", v172) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v171)) .. ("Received number of calls: %s"):format(l_printReceived_0(v175));
            end, 
            pass = v176
        };
    end;
end;
local _ = function(v179) --[[ Line: 591 ]] --[[ Name: createToReturnTimesMatcher ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    return function(v180, v181, v182) --[[ Line: 592 ]]
        -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (ref), v179 (copy), v45 (ref), l_Array_0 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_printReceived_0 (ref)
        local v183 = {
            isNot = v180.isNot, 
            promise = v180.promise
        };
        l_ensureExpectedIsNonNegativeInteger_0(v182, v179, v183);
        v45(v181, v179, "expected", v183);
        local v184 = v181.getMockName();
        local v187 = l_Array_0.reduce(v181.mock.results, function(v185, v186) --[[ Line: 605 ]]
            if v186.type == "return" then
                return v185 + 1;
            else
                return v185;
            end;
        end, 0);
        local v188 = v187 == v182;
        local _ = nil;
        return {
            message = v188 and function() --[[ Line: 617 ]]
                -- upvalues: l_matcherHint_0 (ref), v179 (ref), v184 (copy), v183 (copy), l_printExpected_0 (ref), v182 (copy), v181 (copy), v187 (copy), l_printReceived_0 (ref)
                local v190 = l_matcherHint_0(v179, v184, "expected", v183) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v182));
                if #v181.mock.calls ~= v187 then
                    v190 = v190 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v181.mock.calls));
                end;
                return v190;
            end or function() --[[ Line: 630 ]]
                -- upvalues: l_matcherHint_0 (ref), v179 (ref), v184 (copy), v183 (copy), l_printExpected_0 (ref), v182 (copy), l_printReceived_0 (ref), v187 (copy), v181 (copy)
                local v191 = l_matcherHint_0(v179, v184, "expected", v183) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v182)) .. ("Received number of returns: %s"):format(l_printReceived_0(v187));
                if #v181.mock.calls ~= v187 then
                    v191 = v191 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v181.mock.calls));
                end;
                return v191;
            end, 
            pass = v188
        };
    end;
end;
local _ = function(v193) --[[ Line: 648 ]] --[[ Name: createToBeCalledWithMatcher ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    return function(v194, v195, ...) --[[ Line: 649 ]]
        -- upvalues: l_Symbol_0 (ref), v44 (ref), v193 (copy), v43 (ref), l_Array_0 (ref), v30 (ref), l_matcherHint_0 (ref), v26 (ref), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref), v36 (ref), v25 (ref)
        local v196 = {
            ...
        };
        for v197 = 1, select("#", ...) do
            if v196[v197] == nil then
                v196[v197] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v198 = {
            isNot = v194.isNot, 
            promise = v194.promise
        };
        v44(v195, v193, "...expected", v198);
        local v199 = v43(v195);
        local v200 = nil;
        v200 = v199 and "spy" or v195.getMockName();
        local v201 = nil;
        v201 = if v199 then l_Array_0.map(v195.calls:all(), function(v202) --[[ Line: 677 ]]
            return v202.args;
        end) else v195.mock.calls;
        local v204 = l_Array_0.some(v201, function(v203) --[[ Line: 684 ]]
            -- upvalues: v30 (ref), v196 (copy)
            return v30(v196, v203);
        end);
        local _ = nil;
        return {
            message = v204 and function() --[[ Line: 690 ]]
                -- upvalues: v201 (ref), v30 (ref), v196 (copy), l_matcherHint_0 (ref), v193 (ref), v200 (ref), v198 (copy), v26 (ref), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
                local v206 = {};
                local v207 = 1;
                while v207 <= #v201 and #v206 < 3 do
                    if v30(v196, v201[v207]) then
                        table.insert(v206, {
                            v207, 
                            v201[v207]
                        });
                    end;
                    v207 = v207 + 1;
                end;
                local v208 = l_matcherHint_0(v193, v200, "...expected", v198) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v196));
                if #v201 ~= 1 or l_stringify_0(v201[1]) ~= l_stringify_0(v196) then
                    v208 = v208 .. v35(v196, v206, #v201 == 1);
                end;
                return v208 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v201));
            end or function() --[[ Line: 713 ]]
                -- upvalues: v201 (ref), l_matcherHint_0 (ref), v193 (ref), v200 (ref), v198 (copy), v36 (ref), v196 (copy), v25 (ref), v194 (copy), l_printReceived_0 (ref)
                local v209 = {};
                local v210 = 1;
                while v210 <= #v201 and #v209 < 3 do
                    table.insert(v209, {
                        v210, 
                        v201[v210]
                    });
                    v210 = v210 + 1;
                end;
                return l_matcherHint_0(v193, v200, "...expected", v198) .. "\n\n" .. v36(v196, v209, v25(v194.expand), #v201 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v201));
            end, 
            pass = v204
        };
    end;
end;
local _ = function(v212) --[[ Line: 732 ]] --[[ Name: createToReturnWithMatcher ]]
    -- upvalues: v45 (ref), l_Array_0 (copy), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    return function(v213, v214, v215) --[[ Line: 733 ]]
        -- upvalues: v45 (ref), v212 (copy), l_Array_0 (ref), v31 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref)
        local v216 = {
            isNot = v213.isNot, 
            promise = v213.promise
        };
        v45(v214, v212, "expected", v216);
        local v217 = v214.getMockName();
        local l_mock_0 = v214.mock;
        local l_calls_0 = l_mock_0.calls;
        local l_results_0 = l_mock_0.results;
        local v222 = l_Array_0.some(l_results_0, function(v221) --[[ Line: 746 ]]
            -- upvalues: v31 (ref), v215 (copy)
            return v31(v215, v221);
        end);
        local _ = nil;
        return {
            message = v222 and function() --[[ Line: 752 ]]
                -- upvalues: l_results_0 (copy), v31 (ref), v215 (copy), l_matcherHint_0 (ref), v212 (ref), v217 (copy), v216 (copy), l_printExpected_0 (ref), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_0 (copy)
                local v224 = {};
                local v225 = 1;
                while v225 <= #l_results_0 and #v224 < 3 do
                    if v31(v215, l_results_0[v225]) then
                        table.insert(v224, {
                            v225, 
                            l_results_0[v225]
                        });
                    end;
                    v225 = v225 + 1;
                end;
                local v226 = l_matcherHint_0(v212, v217, "expected", v216) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v215));
                if #l_results_0 ~= 1 or l_results_0[1].type ~= "return" or l_stringify_0(l_results_0[1].value) ~= l_stringify_0(v215) then
                    v226 = v226 .. v41("Received:       ", v215, v224, #l_results_0 == 1);
                end;
                return v226 .. v33(v32(l_results_0), #l_calls_0);
            end or function() --[[ Line: 782 ]]
                -- upvalues: l_results_0 (copy), l_matcherHint_0 (ref), v212 (ref), v217 (copy), v216 (copy), l_printExpected_0 (ref), v215 (copy), v41 (ref), v33 (ref), v32 (ref), l_calls_0 (copy)
                local v227 = {};
                local v228 = 1;
                while v228 <= #l_results_0 and #v227 < 3 do
                    table.insert(v227, {
                        v228, 
                        l_results_0[v228]
                    });
                    v228 = v228 + 1;
                end;
                return l_matcherHint_0(v212, v217, "expected", v216) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v215)) .. v41("Received: ", v215, v227, #l_results_0 == 1) .. v33(v32(l_results_0), #l_calls_0);
            end, 
            pass = v222
        };
    end;
end;
local _ = function(v230) --[[ Line: 803 ]] --[[ Name: createLastCalledWithMatcher ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    return function(v231, v232, ...) --[[ Line: 804 ]]
        -- upvalues: l_Symbol_0 (ref), v44 (ref), v230 (copy), v43 (ref), l_Array_0 (ref), v30 (ref), l_matcherHint_0 (ref), v26 (ref), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref), v36 (ref), v25 (ref)
        local v233 = {
            ...
        };
        for v234 = 1, select("#", ...) do
            if v233[v234] == nil then
                v233[v234] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v235 = {
            isNot = v231.isNot, 
            promise = v231.promise
        };
        v44(v232, v230, "...expected", v235);
        local v236 = v43(v232);
        local v237 = nil;
        v237 = v236 and "spy" or v232.getMockName();
        local v238 = nil;
        v238 = if v236 then l_Array_0.map(v232.calls:all(), function(v239) --[[ Line: 832 ]]
            return v239.args;
        end) else v232.mock.calls;
        local v240 = #v238;
        local v241 = false;
        if v240 >= 1 then
            v241 = v30(v233, v238[v240]);
        end;
        local _ = nil;
        return {
            message = v241 and function() --[[ Line: 845 ]]
                -- upvalues: v240 (copy), v238 (ref), l_matcherHint_0 (ref), v230 (ref), v237 (ref), v235 (copy), v26 (ref), v233 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
                local v243 = {};
                if v240 > 1 then
                    table.insert(v243, {
                        v240 - 1, 
                        v238[v240 - 1]
                    });
                end;
                table.insert(v243, {
                    v240, 
                    v238[v240]
                });
                local v244 = l_matcherHint_0(v230, v237, "...expected", v235) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v233));
                if #v238 ~= 1 or l_stringify_0(v238[1]) ~= l_stringify_0(v233) then
                    v244 = v244 .. v35(v233, v243, #v238 == 1, v240);
                end;
                return v244 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v238));
            end or function() --[[ Line: 867 ]]
                -- upvalues: v240 (copy), v30 (ref), v233 (copy), v238 (ref), l_matcherHint_0 (ref), v230 (ref), v237 (ref), v235 (copy), v36 (ref), v25 (ref), v231 (copy), l_printReceived_0 (ref)
                local v245 = {};
                if v240 >= 1 then
                    if v240 > 1 then
                        local v246 = v240 - 1;
                        while v246 >= 1 and not v30(v233, v238[v246]) do
                            v246 = v246 - 1;
                        end;
                        if v246 < 1 then
                            v246 = v240 - 1;
                        end;
                        table.insert(v245, {
                            v246, 
                            v238[v246]
                        });
                    end;
                    table.insert(v245, {
                        v240, 
                        v238[v240]
                    });
                end;
                return l_matcherHint_0(v230, v237, "...expected", v235) .. "\n\n" .. v36(v233, v245, v25(v231.expand), #v238 == 1, v240) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v238));
            end, 
            pass = v241
        };
    end;
end;
local _ = function(v248) --[[ Line: 903 ]] --[[ Name: createLastReturnedMatcher ]]
    -- upvalues: v45 (ref), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    return function(v249, v250, v251) --[[ Line: 904 ]]
        -- upvalues: v45 (ref), v248 (copy), v31 (ref), l_matcherHint_0 (ref), l_printExpected_0 (ref), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref)
        local v252 = {
            isNot = v249.isNot, 
            promise = v249.promise
        };
        v45(v250, v248, "expected", v252);
        local v253 = v250.getMockName();
        local l_mock_1 = v250.mock;
        local l_calls_1 = l_mock_1.calls;
        local l_results_1 = l_mock_1.results;
        local v257 = #l_results_1;
        local v258 = false;
        if v257 >= 1 then
            v258 = v31(v251, l_results_1[v257]);
        end;
        local _ = nil;
        return {
            message = v258 and function() --[[ Line: 924 ]]
                -- upvalues: v257 (copy), l_results_1 (copy), l_matcherHint_0 (ref), v248 (ref), v253 (copy), v252 (copy), l_printExpected_0 (ref), v251 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_1 (copy)
                local v260 = {};
                if v257 > 1 then
                    table.insert(v260, {
                        v257 - 1, 
                        l_results_1[v257 - 1]
                    });
                end;
                table.insert(v260, {
                    v257, 
                    l_results_1[v257]
                });
                local v261 = l_matcherHint_0(v248, v253, "expected", v252) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v251));
                if #l_results_1 ~= 1 or l_results_1[1].type ~= "return" or l_stringify_0(l_results_1[1].value) ~= l_stringify_0(v251) then
                    v261 = v261 .. v41("Received:       ", v251, v260, #l_results_1 == 1, v257);
                end;
                return v261 .. v33(v32(l_results_1), #l_calls_1);
            end or function() --[[ Line: 953 ]]
                -- upvalues: v257 (copy), v31 (ref), v251 (copy), l_results_1 (copy), l_matcherHint_0 (ref), v248 (ref), v253 (copy), v252 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_1 (copy)
                local v262 = {};
                if v257 >= 1 then
                    if v257 > 1 then
                        local v263 = v257 - 1;
                        while v263 >= 1 and not v31(v251, l_results_1[v263]) do
                            v263 = v263 - 1;
                        end;
                        if v263 < 1 then
                            v263 = v257 - 1;
                        end;
                        table.insert(v262, {
                            v263, 
                            l_results_1[v263]
                        });
                    end;
                    table.insert(v262, {
                        v257, 
                        l_results_1[v257]
                    });
                end;
                return l_matcherHint_0(v248, v253, "expected", v252) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v251)) .. v41("Received: ", v251, v262, #l_results_1 == 1, v257) .. v33(v32(l_results_1), #l_calls_1);
            end, 
            pass = v258
        };
    end;
end;
local _ = function(v265) --[[ Line: 986 ]] --[[ Name: createNthCalledWithMatcher ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), v26 (ref), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    return function(v266, v267, v268, ...) --[[ Line: 987 ]]
        -- upvalues: l_Symbol_0 (ref), v44 (ref), v265 (copy), l_Number_0 (ref), l_Error_0 (ref), l_matcherErrorMessage_0 (ref), l_matcherHint_0 (ref), l_printWithType_0 (ref), l_stringify_0 (ref), v43 (ref), l_Array_0 (ref), v30 (ref), v26 (ref), v35 (ref), l_printReceived_0 (ref), v36 (ref), v25 (ref)
        local v269 = {
            ...
        };
        for v270 = 1, select("#", ...) do
            if v269[v270] == nil then
                v269[v270] = l_Symbol_0.for_("$$nil");
            end;
        end;
        local v272 = {
            expectedColor = function(v271) --[[ Line: 999 ]] --[[ Name: expectedColor ]]
                return v271;
            end, 
            isNot = v266.isNot, 
            promise = v266.promise, 
            secondArgument = "...expected"
        };
        v44(v267, v265, "n", v272);
        if not l_Number_0.isSafeInteger(v268) or v268 < 1 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v265, nil, "n", v272), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v268, l_stringify_0))));
        end;
        local v273 = v43(v267);
        local v274 = nil;
        v274 = v273 and "spy" or v267.getMockName();
        local v275 = nil;
        v275 = if v273 then l_Array_0.map(v267.calls:all(), function(v276) --[[ Line: 1032 ]]
            return v276.args;
        end) else v267.mock.calls;
        local v277 = #v275;
        local v278 = false;
        if v268 <= v277 then
            v278 = v30(v269, v275[v268]);
        end;
        local _ = nil;
        return {
            message = v278 and function() --[[ Line: 1045 ]]
                -- upvalues: v268 (copy), v275 (ref), v277 (copy), l_matcherHint_0 (ref), v265 (ref), v274 (ref), v272 (copy), v268 (copy), v26 (ref), v269 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
                local v280 = {};
                if v268 - 1 >= 1 then
                    table.insert(v280, {
                        v268 - 1, 
                        v275[v268 - 1]
                    });
                end;
                table.insert(v280, {
                    v268, 
                    v275[v268]
                });
                if v268 + 1 <= v277 then
                    table.insert(v280, {
                        v268 + 1, 
                        v275[v268 + 1]
                    });
                end;
                local v281 = l_matcherHint_0(v265, v274, "n", v272) .. "\n\n" .. ("n: %s\n"):format((tostring(v268))) .. ("Expected: never %s\n"):format(v26(v269));
                if #v275 ~= 1 or l_stringify_0(v275[1]) ~= l_stringify_0(v269) then
                    v281 = v281 .. v35(v269, v280, #v275 == 1, v268);
                end;
                return v281 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v275));
            end or function() --[[ Line: 1073 ]]
                -- upvalues: v268 (copy), v277 (copy), v30 (ref), v269 (copy), v275 (ref), l_matcherHint_0 (ref), v265 (ref), v274 (ref), v272 (copy), v268 (copy), v36 (ref), v25 (ref), v266 (copy), l_printReceived_0 (ref)
                local v282 = {};
                if v268 <= v277 then
                    if v268 - 1 >= 1 then
                        local v283 = v268 - 1;
                        while v283 >= 1 and not v30(v269, v275[v283]) do
                            v283 = v283 - 1;
                        end;
                        if v283 < 1 then
                            v283 = v268 - 1;
                        end;
                        table.insert(v282, {
                            v283, 
                            v275[v283]
                        });
                    end;
                    table.insert(v282, {
                        v268, 
                        v275[v268]
                    });
                    if v268 + 1 <= v277 then
                        local v284 = v268 + 1;
                        while v284 <= v277 and not v30(v269, v275[v284]) do
                            v284 = v284 + 1;
                        end;
                        if v277 <= v284 then
                            v284 = v268 + 1;
                        end;
                        table.insert(v282, {
                            v284, 
                            v275[v284]
                        });
                    end;
                elseif v277 > 1 then
                    local v285 = v277 - 1;
                    while v285 >= 1 and not v30(v269, v275[v285]) do
                        v285 = v285 - 1;
                    end;
                    if v285 < 1 then
                        v285 = v277 - 1;
                    end;
                    table.insert(v282, {
                        v285, 
                        v275[v285]
                    });
                end;
                return l_matcherHint_0(v265, v274, "n", v272) .. "\n\n" .. ("n: %s\n"):format((tostring(v268))) .. v36(v269, v282, v25(v266.expand), #v275 == 1, v268) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v275));
            end, 
            pass = v278
        };
    end;
end;
local _ = function(v287) --[[ Line: 1142 ]] --[[ Name: createNthReturnedWithMatcher ]]
    -- upvalues: v45 (ref), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v31 (ref), l_printExpected_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    return function(v288, v289, v290, v291) --[[ Line: 1143 ]]
        -- upvalues: v45 (ref), v287 (copy), l_Number_0 (ref), l_Error_0 (ref), l_matcherErrorMessage_0 (ref), l_matcherHint_0 (ref), l_printWithType_0 (ref), l_stringify_0 (ref), v31 (ref), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref)
        local v293 = {
            expectedColor = function(v292) --[[ Line: 1146 ]] --[[ Name: expectedColor ]]
                return v292;
            end, 
            isNot = v288.isNot, 
            promise = v288.promise, 
            secondArgument = "expected"
        };
        v45(v289, v287, "n", v293);
        if not l_Number_0.isSafeInteger(v290) or v290 < 1 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v287, nil, "n", v293), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v290, l_stringify_0))));
        end;
        local v294 = v289.getMockName();
        local l_mock_2 = v289.mock;
        local l_calls_2 = l_mock_2.calls;
        local l_results_2 = l_mock_2.results;
        local v298 = #l_results_2;
        local v299 = false;
        if v290 <= v298 then
            v299 = v31(v291, l_results_2[v290]);
        end;
        local _ = nil;
        return {
            message = v299 and function() --[[ Line: 1180 ]]
                -- upvalues: v290 (copy), l_results_2 (copy), v298 (copy), l_matcherHint_0 (ref), v287 (ref), v294 (copy), v293 (copy), v290 (copy), l_printExpected_0 (ref), v291 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_2 (copy)
                local v301 = {};
                if v290 - 1 >= 1 then
                    table.insert(v301, {
                        v290 - 1, 
                        l_results_2[v290 - 1]
                    });
                end;
                table.insert(v301, {
                    v290, 
                    l_results_2[v290]
                });
                if v290 + 1 <= v298 then
                    table.insert(v301, {
                        v290 + 1, 
                        l_results_2[v290 + 1]
                    });
                end;
                local v302 = l_matcherHint_0(v287, v294, "n", v293) .. "\n\n" .. ("n: %s\n"):format((tostring(v290))) .. ("Expected: never %s\n"):format(l_printExpected_0(v291));
                if #l_results_2 ~= 1 or l_results_2[1].type ~= "return" or l_stringify_0(l_results_2[1].value) ~= l_stringify_0(v291) then
                    v302 = v302 .. v41("Received:       ", v291, v301, #l_results_2 == 1, v290);
                end;
                return v302 .. v33(v32(l_results_2), #l_calls_2);
            end or function() --[[ Line: 1212 ]]
                -- upvalues: v290 (copy), v298 (copy), v31 (ref), v291 (copy), l_results_2 (copy), l_matcherHint_0 (ref), v287 (ref), v294 (copy), v293 (copy), v290 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_2 (copy)
                local v303 = {};
                if v290 <= v298 then
                    if v290 - 1 >= 1 then
                        local v304 = v290 - 1;
                        while v304 >= 1 and not v31(v291, l_results_2[v304]) do
                            v304 = v304 - 1;
                        end;
                        if v304 < 1 then
                            v304 = v290 - 1;
                        end;
                        table.insert(v303, {
                            v304, 
                            l_results_2[v304]
                        });
                    end;
                    table.insert(v303, {
                        v290, 
                        l_results_2[v290]
                    });
                    if v290 + 1 <= v298 then
                        local v305 = v290 + 1;
                        while v305 <= v298 and not v31(v291, l_results_2[v305]) do
                            v305 = v305 + 1;
                        end;
                        if v298 < v305 then
                            v305 = v290 + 1;
                        end;
                        table.insert(v303, {
                            v305, 
                            l_results_2[v305]
                        });
                    end;
                elseif v298 > 0 then
                    local l_v298_0 = v298;
                    while l_v298_0 >= 1 and not v31(v291, l_results_2[l_v298_0]) do
                        l_v298_0 = l_v298_0 - 1;
                    end;
                    if l_v298_0 < 1 then
                        l_v298_0 = v298 - 1;
                    end;
                    table.insert(v303, {
                        l_v298_0, 
                        l_results_2[l_v298_0]
                    });
                end;
                return l_matcherHint_0(v287, v294, "n", v293) .. "\n\n" .. ("n: %s\n"):format((tostring(v290))) .. ("Expected: %s\n"):format(l_printExpected_0(v291)) .. v41("Received: ", v291, v303, #l_results_2 == 1, v290) .. v33(v32(l_results_2), #l_calls_2);
            end, 
            pass = v299
        };
    end;
end;
local v308 = {};
local v309 = "lastCalledWith";
local l_v309_0 = v309 --[[ copy: 61 -> 62 ]];
v308.lastCalledWith = function(v311, v312, ...) --[[ Line: 804 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v309_0 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v313 = {
        ...
    };
    for v314 = 1, select("#", ...) do
        if v313[v314] == nil then
            v313[v314] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v315 = {
        isNot = v311.isNot, 
        promise = v311.promise
    };
    v44(v312, l_v309_0, "...expected", v315);
    local v316 = v43(v312);
    local v317 = nil;
    v317 = v316 and "spy" or v312.getMockName();
    local v318 = nil;
    v318 = if v316 then l_Array_0.map(v312.calls:all(), function(v319) --[[ Line: 832 ]]
        return v319.args;
    end) else v312.mock.calls;
    local v320 = #v318;
    local v321 = false;
    if v320 >= 1 then
        v321 = v30(v313, v318[v320]);
    end;
    local _ = nil;
    return {
        message = v321 and function() --[[ Line: 845 ]]
            -- upvalues: v320 (copy), v318 (ref), l_matcherHint_0 (ref), l_v309_0 (ref), v317 (ref), v315 (copy), v26 (ref), v313 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v323 = {};
            if v320 > 1 then
                table.insert(v323, {
                    v320 - 1, 
                    v318[v320 - 1]
                });
            end;
            table.insert(v323, {
                v320, 
                v318[v320]
            });
            local v324 = l_matcherHint_0(l_v309_0, v317, "...expected", v315) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v313));
            if #v318 ~= 1 or l_stringify_0(v318[1]) ~= l_stringify_0(v313) then
                v324 = v324 .. v35(v313, v323, #v318 == 1, v320);
            end;
            return v324 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v318));
        end or function() --[[ Line: 867 ]]
            -- upvalues: v320 (copy), v30 (ref), v313 (copy), v318 (ref), l_matcherHint_0 (ref), l_v309_0 (ref), v317 (ref), v315 (copy), v36 (ref), v25 (ref), v311 (copy), l_printReceived_0 (ref)
            local v325 = {};
            if v320 >= 1 then
                if v320 > 1 then
                    local v326 = v320 - 1;
                    while v326 >= 1 and not v30(v313, v318[v326]) do
                        v326 = v326 - 1;
                    end;
                    if v326 < 1 then
                        v326 = v320 - 1;
                    end;
                    table.insert(v325, {
                        v326, 
                        v318[v326]
                    });
                end;
                table.insert(v325, {
                    v320, 
                    v318[v320]
                });
            end;
            return l_matcherHint_0(l_v309_0, v317, "...expected", v315) .. "\n\n" .. v36(v313, v325, v25(v311.expand), #v318 == 1, v320) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v318));
        end, 
        pass = v321
    };
end;
v309 = "lastReturnedWith";
local l_v309_1 = v309 --[[ copy: 61 -> 63 ]];
v308.lastReturnedWith = function(v328, v329, v330) --[[ Line: 904 ]]
    -- upvalues: v45 (ref), l_v309_1 (copy), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v331 = {
        isNot = v328.isNot, 
        promise = v328.promise
    };
    v45(v329, l_v309_1, "expected", v331);
    local v332 = v329.getMockName();
    local l_mock_3 = v329.mock;
    local l_calls_3 = l_mock_3.calls;
    local l_results_3 = l_mock_3.results;
    local v336 = #l_results_3;
    local v337 = false;
    if v336 >= 1 then
        v337 = v31(v330, l_results_3[v336]);
    end;
    local _ = nil;
    return {
        message = v337 and function() --[[ Line: 924 ]]
            -- upvalues: v336 (copy), l_results_3 (copy), l_matcherHint_0 (ref), l_v309_1 (ref), v332 (copy), v331 (copy), l_printExpected_0 (ref), v330 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_3 (copy)
            local v339 = {};
            if v336 > 1 then
                table.insert(v339, {
                    v336 - 1, 
                    l_results_3[v336 - 1]
                });
            end;
            table.insert(v339, {
                v336, 
                l_results_3[v336]
            });
            local v340 = l_matcherHint_0(l_v309_1, v332, "expected", v331) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v330));
            if #l_results_3 ~= 1 or l_results_3[1].type ~= "return" or l_stringify_0(l_results_3[1].value) ~= l_stringify_0(v330) then
                v340 = v340 .. v41("Received:       ", v330, v339, #l_results_3 == 1, v336);
            end;
            return v340 .. v33(v32(l_results_3), #l_calls_3);
        end or function() --[[ Line: 953 ]]
            -- upvalues: v336 (copy), v31 (ref), v330 (copy), l_results_3 (copy), l_matcherHint_0 (ref), l_v309_1 (ref), v332 (copy), v331 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_3 (copy)
            local v341 = {};
            if v336 >= 1 then
                if v336 > 1 then
                    local v342 = v336 - 1;
                    while v342 >= 1 and not v31(v330, l_results_3[v342]) do
                        v342 = v342 - 1;
                    end;
                    if v342 < 1 then
                        v342 = v336 - 1;
                    end;
                    table.insert(v341, {
                        v342, 
                        l_results_3[v342]
                    });
                end;
                table.insert(v341, {
                    v336, 
                    l_results_3[v336]
                });
            end;
            return l_matcherHint_0(l_v309_1, v332, "expected", v331) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v330)) .. v41("Received: ", v330, v341, #l_results_3 == 1, v336) .. v33(v32(l_results_3), #l_calls_3);
        end, 
        pass = v337
    };
end;
v309 = "nthCalledWith";
local l_v309_2 = v309 --[[ copy: 61 -> 64 ]];
v308.nthCalledWith = function(v344, v345, v346, ...) --[[ Line: 987 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v309_2 (copy), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), v26 (ref), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v347 = {
        ...
    };
    for v348 = 1, select("#", ...) do
        if v347[v348] == nil then
            v347[v348] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v350 = {
        expectedColor = function(v349) --[[ Line: 999 ]] --[[ Name: expectedColor ]]
            return v349;
        end, 
        isNot = v344.isNot, 
        promise = v344.promise, 
        secondArgument = "...expected"
    };
    v44(v345, l_v309_2, "n", v350);
    if not l_Number_0.isSafeInteger(v346) or v346 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v309_2, nil, "n", v350), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v346, l_stringify_0))));
    end;
    local v351 = v43(v345);
    local v352 = nil;
    v352 = v351 and "spy" or v345.getMockName();
    local v353 = nil;
    v353 = if v351 then l_Array_0.map(v345.calls:all(), function(v354) --[[ Line: 1032 ]]
        return v354.args;
    end) else v345.mock.calls;
    local v355 = #v353;
    local v356 = false;
    if v346 <= v355 then
        v356 = v30(v347, v353[v346]);
    end;
    local _ = nil;
    return {
        message = v356 and function() --[[ Line: 1045 ]]
            -- upvalues: v346 (copy), v353 (ref), v355 (copy), l_matcherHint_0 (ref), l_v309_2 (ref), v352 (ref), v350 (copy), v346 (copy), v26 (ref), v347 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v358 = {};
            if v346 - 1 >= 1 then
                table.insert(v358, {
                    v346 - 1, 
                    v353[v346 - 1]
                });
            end;
            table.insert(v358, {
                v346, 
                v353[v346]
            });
            if v346 + 1 <= v355 then
                table.insert(v358, {
                    v346 + 1, 
                    v353[v346 + 1]
                });
            end;
            local v359 = l_matcherHint_0(l_v309_2, v352, "n", v350) .. "\n\n" .. ("n: %s\n"):format((tostring(v346))) .. ("Expected: never %s\n"):format(v26(v347));
            if #v353 ~= 1 or l_stringify_0(v353[1]) ~= l_stringify_0(v347) then
                v359 = v359 .. v35(v347, v358, #v353 == 1, v346);
            end;
            return v359 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v353));
        end or function() --[[ Line: 1073 ]]
            -- upvalues: v346 (copy), v355 (copy), v30 (ref), v347 (copy), v353 (ref), l_matcherHint_0 (ref), l_v309_2 (ref), v352 (ref), v350 (copy), v346 (copy), v36 (ref), v25 (ref), v344 (copy), l_printReceived_0 (ref)
            local v360 = {};
            if v346 <= v355 then
                if v346 - 1 >= 1 then
                    local v361 = v346 - 1;
                    while v361 >= 1 and not v30(v347, v353[v361]) do
                        v361 = v361 - 1;
                    end;
                    if v361 < 1 then
                        v361 = v346 - 1;
                    end;
                    table.insert(v360, {
                        v361, 
                        v353[v361]
                    });
                end;
                table.insert(v360, {
                    v346, 
                    v353[v346]
                });
                if v346 + 1 <= v355 then
                    local v362 = v346 + 1;
                    while v362 <= v355 and not v30(v347, v353[v362]) do
                        v362 = v362 + 1;
                    end;
                    if v355 <= v362 then
                        v362 = v346 + 1;
                    end;
                    table.insert(v360, {
                        v362, 
                        v353[v362]
                    });
                end;
            elseif v355 > 1 then
                local v363 = v355 - 1;
                while v363 >= 1 and not v30(v347, v353[v363]) do
                    v363 = v363 - 1;
                end;
                if v363 < 1 then
                    v363 = v355 - 1;
                end;
                table.insert(v360, {
                    v363, 
                    v353[v363]
                });
            end;
            return l_matcherHint_0(l_v309_2, v352, "n", v350) .. "\n\n" .. ("n: %s\n"):format((tostring(v346))) .. v36(v347, v360, v25(v344.expand), #v353 == 1, v346) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v353));
        end, 
        pass = v356
    };
end;
v309 = "nthReturnedWith";
local l_v309_3 = v309 --[[ copy: 61 -> 65 ]];
v308.nthReturnedWith = function(v365, v366, v367, v368) --[[ Line: 1143 ]]
    -- upvalues: v45 (ref), l_v309_3 (copy), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v31 (ref), l_printExpected_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v370 = {
        expectedColor = function(v369) --[[ Line: 1146 ]] --[[ Name: expectedColor ]]
            return v369;
        end, 
        isNot = v365.isNot, 
        promise = v365.promise, 
        secondArgument = "expected"
    };
    v45(v366, l_v309_3, "n", v370);
    if not l_Number_0.isSafeInteger(v367) or v367 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v309_3, nil, "n", v370), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v367, l_stringify_0))));
    end;
    local v371 = v366.getMockName();
    local l_mock_4 = v366.mock;
    local l_calls_4 = l_mock_4.calls;
    local l_results_4 = l_mock_4.results;
    local v375 = #l_results_4;
    local v376 = false;
    if v367 <= v375 then
        v376 = v31(v368, l_results_4[v367]);
    end;
    local _ = nil;
    return {
        message = v376 and function() --[[ Line: 1180 ]]
            -- upvalues: v367 (copy), l_results_4 (copy), v375 (copy), l_matcherHint_0 (ref), l_v309_3 (ref), v371 (copy), v370 (copy), v367 (copy), l_printExpected_0 (ref), v368 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_4 (copy)
            local v378 = {};
            if v367 - 1 >= 1 then
                table.insert(v378, {
                    v367 - 1, 
                    l_results_4[v367 - 1]
                });
            end;
            table.insert(v378, {
                v367, 
                l_results_4[v367]
            });
            if v367 + 1 <= v375 then
                table.insert(v378, {
                    v367 + 1, 
                    l_results_4[v367 + 1]
                });
            end;
            local v379 = l_matcherHint_0(l_v309_3, v371, "n", v370) .. "\n\n" .. ("n: %s\n"):format((tostring(v367))) .. ("Expected: never %s\n"):format(l_printExpected_0(v368));
            if #l_results_4 ~= 1 or l_results_4[1].type ~= "return" or l_stringify_0(l_results_4[1].value) ~= l_stringify_0(v368) then
                v379 = v379 .. v41("Received:       ", v368, v378, #l_results_4 == 1, v367);
            end;
            return v379 .. v33(v32(l_results_4), #l_calls_4);
        end or function() --[[ Line: 1212 ]]
            -- upvalues: v367 (copy), v375 (copy), v31 (ref), v368 (copy), l_results_4 (copy), l_matcherHint_0 (ref), l_v309_3 (ref), v371 (copy), v370 (copy), v367 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_4 (copy)
            local v380 = {};
            if v367 <= v375 then
                if v367 - 1 >= 1 then
                    local v381 = v367 - 1;
                    while v381 >= 1 and not v31(v368, l_results_4[v381]) do
                        v381 = v381 - 1;
                    end;
                    if v381 < 1 then
                        v381 = v367 - 1;
                    end;
                    table.insert(v380, {
                        v381, 
                        l_results_4[v381]
                    });
                end;
                table.insert(v380, {
                    v367, 
                    l_results_4[v367]
                });
                if v367 + 1 <= v375 then
                    local v382 = v367 + 1;
                    while v382 <= v375 and not v31(v368, l_results_4[v382]) do
                        v382 = v382 + 1;
                    end;
                    if v375 < v382 then
                        v382 = v367 + 1;
                    end;
                    table.insert(v380, {
                        v382, 
                        l_results_4[v382]
                    });
                end;
            elseif v375 > 0 then
                local l_v375_0 = v375;
                while l_v375_0 >= 1 and not v31(v368, l_results_4[l_v375_0]) do
                    l_v375_0 = l_v375_0 - 1;
                end;
                if l_v375_0 < 1 then
                    l_v375_0 = v375 - 1;
                end;
                table.insert(v380, {
                    l_v375_0, 
                    l_results_4[l_v375_0]
                });
            end;
            return l_matcherHint_0(l_v309_3, v371, "n", v370) .. "\n\n" .. ("n: %s\n"):format((tostring(v367))) .. ("Expected: %s\n"):format(l_printExpected_0(v368)) .. v41("Received: ", v368, v380, #l_results_4 == 1, v367) .. v33(v32(l_results_4), #l_calls_4);
        end, 
        pass = v376
    };
end;
v309 = "toBeCalled";
local l_v309_4 = v309 --[[ copy: 61 -> 66 ]];
v308.toBeCalled = function(v385, v386, v387) --[[ Line: 411 ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_v309_4 (copy), v44 (ref), v43 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy), v27 (ref)
    local v388 = {
        isNot = v385.isNot, 
        promise = v385.promise
    };
    l_ensureNoExpected_0(v387, l_v309_4, v388);
    v44(v386, l_v309_4, "", v388);
    local v389 = v43(v386);
    local v390 = nil;
    v390 = v389 and "spy" or v386.getMockName();
    local v391 = nil;
    v391 = if v389 then v386.calls:count() else #v386.mock.calls;
    local v392 = nil;
    v392 = if v389 then l_Array_0.map(v386.calls:all(), function(v393) --[[ Line: 438 ]]
        return v393.args;
    end) else v386.mock.calls;
    local v394 = v391 > 0;
    local _ = nil;
    return {
        message = v394 and function() --[[ Line: 448 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_4 (ref), v390 (ref), v388 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v391 (ref), l_Array_0 (ref), v392 (ref), v27 (ref)
            return l_matcherHint_0(l_v309_4, v390, "", v388) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v391)) .. l_Array_0.join(l_Array_0.reduce(v392, function(v396, v397, v398) --[[ Line: 454 ]]
                -- upvalues: v27 (ref)
                if #v396 < 3 then
                    table.insert(v396, ("%s: %s"):format(tostring(v398), v27(v397)));
                end;
                return v396;
            end, {}), "\n");
        end or function() --[[ Line: 465 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_4 (ref), v390 (ref), v388 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v391 (ref)
            return l_matcherHint_0(l_v309_4, v390, "", v388) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v391));
        end, 
        pass = v394
    };
end;
v309 = "toBeCalledTimes";
local l_v309_5 = v309 --[[ copy: 61 -> 67 ]];
v308.toBeCalledTimes = function(v400, v401, v402) --[[ Line: 544 ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), l_v309_5 (copy), v44 (ref), v43 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v403 = {
        isNot = v400.isNot, 
        promise = v400.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v402, l_v309_5, v403);
    v44(v401, l_v309_5, "expected", v403);
    local v404 = v43(v401);
    local v405 = nil;
    v405 = v404 and "spy" or v401.getMockName();
    local v406 = nil;
    v406 = if v404 then v401.calls:count() else #v401.mock.calls;
    local v407 = v406 == v402;
    local _ = nil;
    return {
        message = v407 and function() --[[ Line: 573 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_5 (ref), v405 (ref), v403 (copy), l_printExpected_0 (ref), v402 (copy)
            return l_matcherHint_0(l_v309_5, v405, "expected", v403) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v402));
        end or function() --[[ Line: 579 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_5 (ref), v405 (ref), v403 (copy), l_printExpected_0 (ref), v402 (copy), l_printReceived_0 (ref), v406 (ref)
            return l_matcherHint_0(l_v309_5, v405, "expected", v403) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v402)) .. ("Received number of calls: %s"):format(l_printReceived_0(v406));
        end, 
        pass = v407
    };
end;
v309 = "toBeCalledWith";
local l_v309_6 = v309 --[[ copy: 61 -> 68 ]];
v308.toBeCalledWith = function(v410, v411, ...) --[[ Line: 649 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v309_6 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v412 = {
        ...
    };
    for v413 = 1, select("#", ...) do
        if v412[v413] == nil then
            v412[v413] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v414 = {
        isNot = v410.isNot, 
        promise = v410.promise
    };
    v44(v411, l_v309_6, "...expected", v414);
    local v415 = v43(v411);
    local v416 = nil;
    v416 = v415 and "spy" or v411.getMockName();
    local v417 = nil;
    v417 = if v415 then l_Array_0.map(v411.calls:all(), function(v418) --[[ Line: 677 ]]
        return v418.args;
    end) else v411.mock.calls;
    local v420 = l_Array_0.some(v417, function(v419) --[[ Line: 684 ]]
        -- upvalues: v30 (ref), v412 (copy)
        return v30(v412, v419);
    end);
    local _ = nil;
    return {
        message = v420 and function() --[[ Line: 690 ]]
            -- upvalues: v417 (ref), v30 (ref), v412 (copy), l_matcherHint_0 (ref), l_v309_6 (ref), v416 (ref), v414 (copy), v26 (ref), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v422 = {};
            local v423 = 1;
            while v423 <= #v417 and #v422 < 3 do
                if v30(v412, v417[v423]) then
                    table.insert(v422, {
                        v423, 
                        v417[v423]
                    });
                end;
                v423 = v423 + 1;
            end;
            local v424 = l_matcherHint_0(l_v309_6, v416, "...expected", v414) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v412));
            if #v417 ~= 1 or l_stringify_0(v417[1]) ~= l_stringify_0(v412) then
                v424 = v424 .. v35(v412, v422, #v417 == 1);
            end;
            return v424 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v417));
        end or function() --[[ Line: 713 ]]
            -- upvalues: v417 (ref), l_matcherHint_0 (ref), l_v309_6 (ref), v416 (ref), v414 (copy), v36 (ref), v412 (copy), v25 (ref), v410 (copy), l_printReceived_0 (ref)
            local v425 = {};
            local v426 = 1;
            while v426 <= #v417 and #v425 < 3 do
                table.insert(v425, {
                    v426, 
                    v417[v426]
                });
                v426 = v426 + 1;
            end;
            return l_matcherHint_0(l_v309_6, v416, "...expected", v414) .. "\n\n" .. v36(v412, v425, v25(v410.expand), #v417 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v417));
        end, 
        pass = v420
    };
end;
v309 = "toHaveBeenCalled";
local l_v309_7 = v309 --[[ copy: 61 -> 69 ]];
v308.toHaveBeenCalled = function(v428, v429, v430) --[[ Line: 411 ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_v309_7 (copy), v44 (ref), v43 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy), v27 (ref)
    local v431 = {
        isNot = v428.isNot, 
        promise = v428.promise
    };
    l_ensureNoExpected_0(v430, l_v309_7, v431);
    v44(v429, l_v309_7, "", v431);
    local v432 = v43(v429);
    local v433 = nil;
    v433 = v432 and "spy" or v429.getMockName();
    local v434 = nil;
    v434 = if v432 then v429.calls:count() else #v429.mock.calls;
    local v435 = nil;
    v435 = if v432 then l_Array_0.map(v429.calls:all(), function(v436) --[[ Line: 438 ]]
        return v436.args;
    end) else v429.mock.calls;
    local v437 = v434 > 0;
    local _ = nil;
    return {
        message = v437 and function() --[[ Line: 448 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_7 (ref), v433 (ref), v431 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v434 (ref), l_Array_0 (ref), v435 (ref), v27 (ref)
            return l_matcherHint_0(l_v309_7, v433, "", v431) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(0)) .. ("Received number of calls: %s\n\n"):format(l_printReceived_0(v434)) .. l_Array_0.join(l_Array_0.reduce(v435, function(v439, v440, v441) --[[ Line: 454 ]]
                -- upvalues: v27 (ref)
                if #v439 < 3 then
                    table.insert(v439, ("%s: %s"):format(tostring(v441), v27(v440)));
                end;
                return v439;
            end, {}), "\n");
        end or function() --[[ Line: 465 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_7 (ref), v433 (ref), v431 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v434 (ref)
            return l_matcherHint_0(l_v309_7, v433, "", v431) .. "\n\n" .. ("Expected number of calls: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of calls:    %s"):format(l_printReceived_0(v434));
        end, 
        pass = v437
    };
end;
v309 = "toHaveBeenCalledTimes";
local l_v309_8 = v309 --[[ copy: 61 -> 70 ]];
v308.toHaveBeenCalledTimes = function(v443, v444, v445) --[[ Line: 544 ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), l_v309_8 (copy), v44 (ref), v43 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v446 = {
        isNot = v443.isNot, 
        promise = v443.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v445, l_v309_8, v446);
    v44(v444, l_v309_8, "expected", v446);
    local v447 = v43(v444);
    local v448 = nil;
    v448 = v447 and "spy" or v444.getMockName();
    local v449 = nil;
    v449 = if v447 then v444.calls:count() else #v444.mock.calls;
    local v450 = v449 == v445;
    local _ = nil;
    return {
        message = v450 and function() --[[ Line: 573 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_8 (ref), v448 (ref), v446 (copy), l_printExpected_0 (ref), v445 (copy)
            return l_matcherHint_0(l_v309_8, v448, "expected", v446) .. "\n\n" .. ("Expected number of calls: never %s"):format(l_printExpected_0(v445));
        end or function() --[[ Line: 579 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_8 (ref), v448 (ref), v446 (copy), l_printExpected_0 (ref), v445 (copy), l_printReceived_0 (ref), v449 (ref)
            return l_matcherHint_0(l_v309_8, v448, "expected", v446) .. "\n\n" .. ("Expected number of calls: %s\n"):format(l_printExpected_0(v445)) .. ("Received number of calls: %s"):format(l_printReceived_0(v449));
        end, 
        pass = v450
    };
end;
v309 = "toHaveBeenCalledWith";
local l_v309_9 = v309 --[[ copy: 61 -> 71 ]];
v308.toHaveBeenCalledWith = function(v453, v454, ...) --[[ Line: 649 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v309_9 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v455 = {
        ...
    };
    for v456 = 1, select("#", ...) do
        if v455[v456] == nil then
            v455[v456] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v457 = {
        isNot = v453.isNot, 
        promise = v453.promise
    };
    v44(v454, l_v309_9, "...expected", v457);
    local v458 = v43(v454);
    local v459 = nil;
    v459 = v458 and "spy" or v454.getMockName();
    local v460 = nil;
    v460 = if v458 then l_Array_0.map(v454.calls:all(), function(v461) --[[ Line: 677 ]]
        return v461.args;
    end) else v454.mock.calls;
    local v463 = l_Array_0.some(v460, function(v462) --[[ Line: 684 ]]
        -- upvalues: v30 (ref), v455 (copy)
        return v30(v455, v462);
    end);
    local _ = nil;
    return {
        message = v463 and function() --[[ Line: 690 ]]
            -- upvalues: v460 (ref), v30 (ref), v455 (copy), l_matcherHint_0 (ref), l_v309_9 (ref), v459 (ref), v457 (copy), v26 (ref), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v465 = {};
            local v466 = 1;
            while v466 <= #v460 and #v465 < 3 do
                if v30(v455, v460[v466]) then
                    table.insert(v465, {
                        v466, 
                        v460[v466]
                    });
                end;
                v466 = v466 + 1;
            end;
            local v467 = l_matcherHint_0(l_v309_9, v459, "...expected", v457) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v455));
            if #v460 ~= 1 or l_stringify_0(v460[1]) ~= l_stringify_0(v455) then
                v467 = v467 .. v35(v455, v465, #v460 == 1);
            end;
            return v467 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v460));
        end or function() --[[ Line: 713 ]]
            -- upvalues: v460 (ref), l_matcherHint_0 (ref), l_v309_9 (ref), v459 (ref), v457 (copy), v36 (ref), v455 (copy), v25 (ref), v453 (copy), l_printReceived_0 (ref)
            local v468 = {};
            local v469 = 1;
            while v469 <= #v460 and #v468 < 3 do
                table.insert(v468, {
                    v469, 
                    v460[v469]
                });
                v469 = v469 + 1;
            end;
            return l_matcherHint_0(l_v309_9, v459, "...expected", v457) .. "\n\n" .. v36(v455, v468, v25(v453.expand), #v460 == 1) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v460));
        end, 
        pass = v463
    };
end;
v309 = "toHaveBeenLastCalledWith";
local l_v309_10 = v309 --[[ copy: 61 -> 72 ]];
v308.toHaveBeenLastCalledWith = function(v471, v472, ...) --[[ Line: 804 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v309_10 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), l_matcherHint_0 (copy), v26 (ref), l_stringify_0 (copy), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v473 = {
        ...
    };
    for v474 = 1, select("#", ...) do
        if v473[v474] == nil then
            v473[v474] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v475 = {
        isNot = v471.isNot, 
        promise = v471.promise
    };
    v44(v472, l_v309_10, "...expected", v475);
    local v476 = v43(v472);
    local v477 = nil;
    v477 = v476 and "spy" or v472.getMockName();
    local v478 = nil;
    v478 = if v476 then l_Array_0.map(v472.calls:all(), function(v479) --[[ Line: 832 ]]
        return v479.args;
    end) else v472.mock.calls;
    local v480 = #v478;
    local v481 = false;
    if v480 >= 1 then
        v481 = v30(v473, v478[v480]);
    end;
    local _ = nil;
    return {
        message = v481 and function() --[[ Line: 845 ]]
            -- upvalues: v480 (copy), v478 (ref), l_matcherHint_0 (ref), l_v309_10 (ref), v477 (ref), v475 (copy), v26 (ref), v473 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v483 = {};
            if v480 > 1 then
                table.insert(v483, {
                    v480 - 1, 
                    v478[v480 - 1]
                });
            end;
            table.insert(v483, {
                v480, 
                v478[v480]
            });
            local v484 = l_matcherHint_0(l_v309_10, v477, "...expected", v475) .. "\n\n" .. ("Expected: never %s\n"):format(v26(v473));
            if #v478 ~= 1 or l_stringify_0(v478[1]) ~= l_stringify_0(v473) then
                v484 = v484 .. v35(v473, v483, #v478 == 1, v480);
            end;
            return v484 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v478));
        end or function() --[[ Line: 867 ]]
            -- upvalues: v480 (copy), v30 (ref), v473 (copy), v478 (ref), l_matcherHint_0 (ref), l_v309_10 (ref), v477 (ref), v475 (copy), v36 (ref), v25 (ref), v471 (copy), l_printReceived_0 (ref)
            local v485 = {};
            if v480 >= 1 then
                if v480 > 1 then
                    local v486 = v480 - 1;
                    while v486 >= 1 and not v30(v473, v478[v486]) do
                        v486 = v486 - 1;
                    end;
                    if v486 < 1 then
                        v486 = v480 - 1;
                    end;
                    table.insert(v485, {
                        v486, 
                        v478[v486]
                    });
                end;
                table.insert(v485, {
                    v480, 
                    v478[v480]
                });
            end;
            return l_matcherHint_0(l_v309_10, v477, "...expected", v475) .. "\n\n" .. v36(v473, v485, v25(v471.expand), #v478 == 1, v480) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v478));
        end, 
        pass = v481
    };
end;
v309 = "toHaveBeenNthCalledWith";
local l_v309_11 = v309 --[[ copy: 61 -> 73 ]];
v308.toHaveBeenNthCalledWith = function(v488, v489, v490, ...) --[[ Line: 987 ]]
    -- upvalues: l_Symbol_0 (copy), v44 (ref), l_v309_11 (copy), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v43 (ref), l_Array_0 (copy), v30 (ref), v26 (ref), v35 (ref), l_printReceived_0 (copy), v36 (ref), v25 (ref)
    local v491 = {
        ...
    };
    for v492 = 1, select("#", ...) do
        if v491[v492] == nil then
            v491[v492] = l_Symbol_0.for_("$$nil");
        end;
    end;
    local v494 = {
        expectedColor = function(v493) --[[ Line: 999 ]] --[[ Name: expectedColor ]]
            return v493;
        end, 
        isNot = v488.isNot, 
        promise = v488.promise, 
        secondArgument = "...expected"
    };
    v44(v489, l_v309_11, "n", v494);
    if not l_Number_0.isSafeInteger(v490) or v490 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v309_11, nil, "n", v494), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v490, l_stringify_0))));
    end;
    local v495 = v43(v489);
    local v496 = nil;
    v496 = v495 and "spy" or v489.getMockName();
    local v497 = nil;
    v497 = if v495 then l_Array_0.map(v489.calls:all(), function(v498) --[[ Line: 1032 ]]
        return v498.args;
    end) else v489.mock.calls;
    local v499 = #v497;
    local v500 = false;
    if v490 <= v499 then
        v500 = v30(v491, v497[v490]);
    end;
    local _ = nil;
    return {
        message = v500 and function() --[[ Line: 1045 ]]
            -- upvalues: v490 (copy), v497 (ref), v499 (copy), l_matcherHint_0 (ref), l_v309_11 (ref), v496 (ref), v494 (copy), v490 (copy), v26 (ref), v491 (copy), l_stringify_0 (ref), v35 (ref), l_printReceived_0 (ref)
            local v502 = {};
            if v490 - 1 >= 1 then
                table.insert(v502, {
                    v490 - 1, 
                    v497[v490 - 1]
                });
            end;
            table.insert(v502, {
                v490, 
                v497[v490]
            });
            if v490 + 1 <= v499 then
                table.insert(v502, {
                    v490 + 1, 
                    v497[v490 + 1]
                });
            end;
            local v503 = l_matcherHint_0(l_v309_11, v496, "n", v494) .. "\n\n" .. ("n: %s\n"):format((tostring(v490))) .. ("Expected: never %s\n"):format(v26(v491));
            if #v497 ~= 1 or l_stringify_0(v497[1]) ~= l_stringify_0(v491) then
                v503 = v503 .. v35(v491, v502, #v497 == 1, v490);
            end;
            return v503 .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v497));
        end or function() --[[ Line: 1073 ]]
            -- upvalues: v490 (copy), v499 (copy), v30 (ref), v491 (copy), v497 (ref), l_matcherHint_0 (ref), l_v309_11 (ref), v496 (ref), v494 (copy), v490 (copy), v36 (ref), v25 (ref), v488 (copy), l_printReceived_0 (ref)
            local v504 = {};
            if v490 <= v499 then
                if v490 - 1 >= 1 then
                    local v505 = v490 - 1;
                    while v505 >= 1 and not v30(v491, v497[v505]) do
                        v505 = v505 - 1;
                    end;
                    if v505 < 1 then
                        v505 = v490 - 1;
                    end;
                    table.insert(v504, {
                        v505, 
                        v497[v505]
                    });
                end;
                table.insert(v504, {
                    v490, 
                    v497[v490]
                });
                if v490 + 1 <= v499 then
                    local v506 = v490 + 1;
                    while v506 <= v499 and not v30(v491, v497[v506]) do
                        v506 = v506 + 1;
                    end;
                    if v499 <= v506 then
                        v506 = v490 + 1;
                    end;
                    table.insert(v504, {
                        v506, 
                        v497[v506]
                    });
                end;
            elseif v499 > 1 then
                local v507 = v499 - 1;
                while v507 >= 1 and not v30(v491, v497[v507]) do
                    v507 = v507 - 1;
                end;
                if v507 < 1 then
                    v507 = v499 - 1;
                end;
                table.insert(v504, {
                    v507, 
                    v497[v507]
                });
            end;
            return l_matcherHint_0(l_v309_11, v496, "n", v494) .. "\n\n" .. ("n: %s\n"):format((tostring(v490))) .. v36(v491, v504, v25(v488.expand), #v497 == 1, v490) .. ("\nNumber of calls: %s"):format(l_printReceived_0(#v497));
        end, 
        pass = v500
    };
end;
v309 = "toHaveLastReturnedWith";
local l_v309_12 = v309 --[[ copy: 61 -> 74 ]];
v308.toHaveLastReturnedWith = function(v509, v510, v511) --[[ Line: 904 ]]
    -- upvalues: v45 (ref), l_v309_12 (copy), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v512 = {
        isNot = v509.isNot, 
        promise = v509.promise
    };
    v45(v510, l_v309_12, "expected", v512);
    local v513 = v510.getMockName();
    local l_mock_5 = v510.mock;
    local l_calls_5 = l_mock_5.calls;
    local l_results_5 = l_mock_5.results;
    local v517 = #l_results_5;
    local v518 = false;
    if v517 >= 1 then
        v518 = v31(v511, l_results_5[v517]);
    end;
    local _ = nil;
    return {
        message = v518 and function() --[[ Line: 924 ]]
            -- upvalues: v517 (copy), l_results_5 (copy), l_matcherHint_0 (ref), l_v309_12 (ref), v513 (copy), v512 (copy), l_printExpected_0 (ref), v511 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_5 (copy)
            local v520 = {};
            if v517 > 1 then
                table.insert(v520, {
                    v517 - 1, 
                    l_results_5[v517 - 1]
                });
            end;
            table.insert(v520, {
                v517, 
                l_results_5[v517]
            });
            local v521 = l_matcherHint_0(l_v309_12, v513, "expected", v512) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v511));
            if #l_results_5 ~= 1 or l_results_5[1].type ~= "return" or l_stringify_0(l_results_5[1].value) ~= l_stringify_0(v511) then
                v521 = v521 .. v41("Received:       ", v511, v520, #l_results_5 == 1, v517);
            end;
            return v521 .. v33(v32(l_results_5), #l_calls_5);
        end or function() --[[ Line: 953 ]]
            -- upvalues: v517 (copy), v31 (ref), v511 (copy), l_results_5 (copy), l_matcherHint_0 (ref), l_v309_12 (ref), v513 (copy), v512 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_5 (copy)
            local v522 = {};
            if v517 >= 1 then
                if v517 > 1 then
                    local v523 = v517 - 1;
                    while v523 >= 1 and not v31(v511, l_results_5[v523]) do
                        v523 = v523 - 1;
                    end;
                    if v523 < 1 then
                        v523 = v517 - 1;
                    end;
                    table.insert(v522, {
                        v523, 
                        l_results_5[v523]
                    });
                end;
                table.insert(v522, {
                    v517, 
                    l_results_5[v517]
                });
            end;
            return l_matcherHint_0(l_v309_12, v513, "expected", v512) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v511)) .. v41("Received: ", v511, v522, #l_results_5 == 1, v517) .. v33(v32(l_results_5), #l_calls_5);
        end, 
        pass = v518
    };
end;
v309 = "toHaveNthReturnedWith";
local l_v309_13 = v309 --[[ copy: 61 -> 75 ]];
v308.toHaveNthReturnedWith = function(v525, v526, v527, v528) --[[ Line: 1143 ]]
    -- upvalues: v45 (ref), l_v309_13 (copy), l_Number_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_printWithType_0 (copy), l_stringify_0 (copy), v31 (ref), l_printExpected_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v530 = {
        expectedColor = function(v529) --[[ Line: 1146 ]] --[[ Name: expectedColor ]]
            return v529;
        end, 
        isNot = v525.isNot, 
        promise = v525.promise, 
        secondArgument = "expected"
    };
    v45(v526, l_v309_13, "n", v530);
    if not l_Number_0.isSafeInteger(v527) or v527 < 1 then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(l_v309_13, nil, "n", v530), ("%s must be a positive integer"):format("n"), l_printWithType_0("n", v527, l_stringify_0))));
    end;
    local v531 = v526.getMockName();
    local l_mock_6 = v526.mock;
    local l_calls_6 = l_mock_6.calls;
    local l_results_6 = l_mock_6.results;
    local v535 = #l_results_6;
    local v536 = false;
    if v527 <= v535 then
        v536 = v31(v528, l_results_6[v527]);
    end;
    local _ = nil;
    return {
        message = v536 and function() --[[ Line: 1180 ]]
            -- upvalues: v527 (copy), l_results_6 (copy), v535 (copy), l_matcherHint_0 (ref), l_v309_13 (ref), v531 (copy), v530 (copy), v527 (copy), l_printExpected_0 (ref), v528 (copy), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_6 (copy)
            local v538 = {};
            if v527 - 1 >= 1 then
                table.insert(v538, {
                    v527 - 1, 
                    l_results_6[v527 - 1]
                });
            end;
            table.insert(v538, {
                v527, 
                l_results_6[v527]
            });
            if v527 + 1 <= v535 then
                table.insert(v538, {
                    v527 + 1, 
                    l_results_6[v527 + 1]
                });
            end;
            local v539 = l_matcherHint_0(l_v309_13, v531, "n", v530) .. "\n\n" .. ("n: %s\n"):format((tostring(v527))) .. ("Expected: never %s\n"):format(l_printExpected_0(v528));
            if #l_results_6 ~= 1 or l_results_6[1].type ~= "return" or l_stringify_0(l_results_6[1].value) ~= l_stringify_0(v528) then
                v539 = v539 .. v41("Received:       ", v528, v538, #l_results_6 == 1, v527);
            end;
            return v539 .. v33(v32(l_results_6), #l_calls_6);
        end or function() --[[ Line: 1212 ]]
            -- upvalues: v527 (copy), v535 (copy), v31 (ref), v528 (copy), l_results_6 (copy), l_matcherHint_0 (ref), l_v309_13 (ref), v531 (copy), v530 (copy), v527 (copy), l_printExpected_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_6 (copy)
            local v540 = {};
            if v527 <= v535 then
                if v527 - 1 >= 1 then
                    local v541 = v527 - 1;
                    while v541 >= 1 and not v31(v528, l_results_6[v541]) do
                        v541 = v541 - 1;
                    end;
                    if v541 < 1 then
                        v541 = v527 - 1;
                    end;
                    table.insert(v540, {
                        v541, 
                        l_results_6[v541]
                    });
                end;
                table.insert(v540, {
                    v527, 
                    l_results_6[v527]
                });
                if v527 + 1 <= v535 then
                    local v542 = v527 + 1;
                    while v542 <= v535 and not v31(v528, l_results_6[v542]) do
                        v542 = v542 + 1;
                    end;
                    if v535 < v542 then
                        v542 = v527 + 1;
                    end;
                    table.insert(v540, {
                        v542, 
                        l_results_6[v542]
                    });
                end;
            elseif v535 > 0 then
                local l_v535_0 = v535;
                while l_v535_0 >= 1 and not v31(v528, l_results_6[l_v535_0]) do
                    l_v535_0 = l_v535_0 - 1;
                end;
                if l_v535_0 < 1 then
                    l_v535_0 = v535 - 1;
                end;
                table.insert(v540, {
                    l_v535_0, 
                    l_results_6[l_v535_0]
                });
            end;
            return l_matcherHint_0(l_v309_13, v531, "n", v530) .. "\n\n" .. ("n: %s\n"):format((tostring(v527))) .. ("Expected: %s\n"):format(l_printExpected_0(v528)) .. v41("Received: ", v528, v540, #l_results_6 == 1, v527) .. v33(v32(l_results_6), #l_calls_6);
        end, 
        pass = v536
    };
end;
v309 = "toHaveReturned";
local l_v309_14 = v309 --[[ copy: 61 -> 76 ]];
v308.toHaveReturned = function(v545, v546, v547) --[[ Line: 478 ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_v309_14 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v548 = {
        isNot = v545.isNot, 
        promise = v545.promise
    };
    l_ensureNoExpected_0(v547, l_v309_14, v548);
    v45(v546, l_v309_14, "", v548);
    local v549 = v546.getMockName();
    local v552 = l_Array_0.reduce(v546.mock.results, function(v550, v551) --[[ Line: 491 ]]
        if v551.type == "return" then
            return v550 + 1;
        else
            return v550;
        end;
    end, 0);
    local v553 = v552 > 0;
    local _ = nil;
    return {
        message = v553 and function() --[[ Line: 502 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_14 (ref), v549 (copy), v548 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v552 (copy), l_Array_0 (ref), v546 (copy)
            local v558 = l_matcherHint_0(l_v309_14, v549, "", v548) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v552)) .. l_Array_0.join(l_Array_0.reduce(v546.mock.results, function(v555, v556, v557) --[[ Line: 508 ]]
                -- upvalues: l_printReceived_0 (ref)
                if v556.type == "return" and #v555 < 3 then
                    table.insert(v555, ("%s: %s"):format(tostring(v557), l_printReceived_0(v556.value)));
                end;
                return v555;
            end, {}), "\n");
            if #v546.mock.calls ~= v552 then
                v558 = v558 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v546.mock.calls);
            end;
            return v558;
        end or function() --[[ Line: 525 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_14 (ref), v549 (copy), v548 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v552 (copy), v546 (copy)
            local v559 = l_matcherHint_0(l_v309_14, v549, "", v548) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v552));
            if #v546.mock.calls ~= v552 then
                v559 = v559 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v546.mock.calls));
            end;
            return v559;
        end, 
        pass = v553
    };
end;
v309 = "toHaveReturnedTimes";
local l_v309_15 = v309 --[[ copy: 61 -> 77 ]];
v308.toHaveReturnedTimes = function(v561, v562, v563) --[[ Line: 592 ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), l_v309_15 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v564 = {
        isNot = v561.isNot, 
        promise = v561.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v563, l_v309_15, v564);
    v45(v562, l_v309_15, "expected", v564);
    local v565 = v562.getMockName();
    local v568 = l_Array_0.reduce(v562.mock.results, function(v566, v567) --[[ Line: 605 ]]
        if v567.type == "return" then
            return v566 + 1;
        else
            return v566;
        end;
    end, 0);
    local v569 = v568 == v563;
    local _ = nil;
    return {
        message = v569 and function() --[[ Line: 617 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_15 (ref), v565 (copy), v564 (copy), l_printExpected_0 (ref), v563 (copy), v562 (copy), v568 (copy), l_printReceived_0 (ref)
            local v571 = l_matcherHint_0(l_v309_15, v565, "expected", v564) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v563));
            if #v562.mock.calls ~= v568 then
                v571 = v571 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v562.mock.calls));
            end;
            return v571;
        end or function() --[[ Line: 630 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_15 (ref), v565 (copy), v564 (copy), l_printExpected_0 (ref), v563 (copy), l_printReceived_0 (ref), v568 (copy), v562 (copy)
            local v572 = l_matcherHint_0(l_v309_15, v565, "expected", v564) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v563)) .. ("Received number of returns: %s"):format(l_printReceived_0(v568));
            if #v562.mock.calls ~= v568 then
                v572 = v572 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v562.mock.calls));
            end;
            return v572;
        end, 
        pass = v569
    };
end;
v309 = "toHaveReturnedWith";
local l_v309_16 = v309 --[[ copy: 61 -> 78 ]];
v308.toHaveReturnedWith = function(v574, v575, v576) --[[ Line: 733 ]]
    -- upvalues: v45 (ref), l_v309_16 (copy), l_Array_0 (copy), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v577 = {
        isNot = v574.isNot, 
        promise = v574.promise
    };
    v45(v575, l_v309_16, "expected", v577);
    local v578 = v575.getMockName();
    local l_mock_7 = v575.mock;
    local l_calls_7 = l_mock_7.calls;
    local l_results_7 = l_mock_7.results;
    local v583 = l_Array_0.some(l_results_7, function(v582) --[[ Line: 746 ]]
        -- upvalues: v31 (ref), v576 (copy)
        return v31(v576, v582);
    end);
    local _ = nil;
    return {
        message = v583 and function() --[[ Line: 752 ]]
            -- upvalues: l_results_7 (copy), v31 (ref), v576 (copy), l_matcherHint_0 (ref), l_v309_16 (ref), v578 (copy), v577 (copy), l_printExpected_0 (ref), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_7 (copy)
            local v585 = {};
            local v586 = 1;
            while v586 <= #l_results_7 and #v585 < 3 do
                if v31(v576, l_results_7[v586]) then
                    table.insert(v585, {
                        v586, 
                        l_results_7[v586]
                    });
                end;
                v586 = v586 + 1;
            end;
            local v587 = l_matcherHint_0(l_v309_16, v578, "expected", v577) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v576));
            if #l_results_7 ~= 1 or l_results_7[1].type ~= "return" or l_stringify_0(l_results_7[1].value) ~= l_stringify_0(v576) then
                v587 = v587 .. v41("Received:       ", v576, v585, #l_results_7 == 1);
            end;
            return v587 .. v33(v32(l_results_7), #l_calls_7);
        end or function() --[[ Line: 782 ]]
            -- upvalues: l_results_7 (copy), l_matcherHint_0 (ref), l_v309_16 (ref), v578 (copy), v577 (copy), l_printExpected_0 (ref), v576 (copy), v41 (ref), v33 (ref), v32 (ref), l_calls_7 (copy)
            local v588 = {};
            local v589 = 1;
            while v589 <= #l_results_7 and #v588 < 3 do
                table.insert(v588, {
                    v589, 
                    l_results_7[v589]
                });
                v589 = v589 + 1;
            end;
            return l_matcherHint_0(l_v309_16, v578, "expected", v577) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v576)) .. v41("Received: ", v576, v588, #l_results_7 == 1) .. v33(v32(l_results_7), #l_calls_7);
        end, 
        pass = v583
    };
end;
v309 = "toReturn";
local l_v309_17 = v309 --[[ copy: 61 -> 79 ]];
v308.toReturn = function(v591, v592, v593) --[[ Line: 478 ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_v309_17 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v594 = {
        isNot = v591.isNot, 
        promise = v591.promise
    };
    l_ensureNoExpected_0(v593, l_v309_17, v594);
    v45(v592, l_v309_17, "", v594);
    local v595 = v592.getMockName();
    local v598 = l_Array_0.reduce(v592.mock.results, function(v596, v597) --[[ Line: 491 ]]
        if v597.type == "return" then
            return v596 + 1;
        else
            return v596;
        end;
    end, 0);
    local v599 = v598 > 0;
    local _ = nil;
    return {
        message = v599 and function() --[[ Line: 502 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_17 (ref), v595 (copy), v594 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v598 (copy), l_Array_0 (ref), v592 (copy)
            local v604 = l_matcherHint_0(l_v309_17, v595, "", v594) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(0)) .. ("Received number of returns: %s\n\n"):format(l_printReceived_0(v598)) .. l_Array_0.join(l_Array_0.reduce(v592.mock.results, function(v601, v602, v603) --[[ Line: 508 ]]
                -- upvalues: l_printReceived_0 (ref)
                if v602.type == "return" and #v601 < 3 then
                    table.insert(v601, ("%s: %s"):format(tostring(v603), l_printReceived_0(v602.value)));
                end;
                return v601;
            end, {}), "\n");
            if #v592.mock.calls ~= v598 then
                v604 = v604 .. "\n\nReceived number of calls:   " .. l_printReceived_0(#v592.mock.calls);
            end;
            return v604;
        end or function() --[[ Line: 525 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_17 (ref), v595 (copy), v594 (copy), l_printExpected_0 (ref), l_printReceived_0 (ref), v598 (copy), v592 (copy)
            local v605 = l_matcherHint_0(l_v309_17, v595, "", v594) .. "\n\n" .. ("Expected number of returns: >= %s\n"):format(l_printExpected_0(1)) .. ("Received number of returns:    %s"):format(l_printReceived_0(v598));
            if #v592.mock.calls ~= v598 then
                v605 = v605 .. ("\nReceived number of calls:      %s"):format(l_printReceived_0(#v592.mock.calls));
            end;
            return v605;
        end, 
        pass = v599
    };
end;
v309 = "toReturnTimes";
local l_v309_18 = v309 --[[ copy: 61 -> 80 ]];
v308.toReturnTimes = function(v607, v608, v609) --[[ Line: 592 ]]
    -- upvalues: l_ensureExpectedIsNonNegativeInteger_0 (copy), l_v309_18 (copy), v45 (ref), l_Array_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local v610 = {
        isNot = v607.isNot, 
        promise = v607.promise
    };
    l_ensureExpectedIsNonNegativeInteger_0(v609, l_v309_18, v610);
    v45(v608, l_v309_18, "expected", v610);
    local v611 = v608.getMockName();
    local v614 = l_Array_0.reduce(v608.mock.results, function(v612, v613) --[[ Line: 605 ]]
        if v613.type == "return" then
            return v612 + 1;
        else
            return v612;
        end;
    end, 0);
    local v615 = v614 == v609;
    local _ = nil;
    return {
        message = v615 and function() --[[ Line: 617 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_18 (ref), v611 (copy), v610 (copy), l_printExpected_0 (ref), v609 (copy), v608 (copy), v614 (copy), l_printReceived_0 (ref)
            local v617 = l_matcherHint_0(l_v309_18, v611, "expected", v610) .. "\n\n" .. ("Expected number of returns: never %s"):format(l_printExpected_0(v609));
            if #v608.mock.calls ~= v614 then
                v617 = v617 .. ("\n\nReceived number of calls:         %s"):format(l_printReceived_0(#v608.mock.calls));
            end;
            return v617;
        end or function() --[[ Line: 630 ]]
            -- upvalues: l_matcherHint_0 (ref), l_v309_18 (ref), v611 (copy), v610 (copy), l_printExpected_0 (ref), v609 (copy), l_printReceived_0 (ref), v614 (copy), v608 (copy)
            local v618 = l_matcherHint_0(l_v309_18, v611, "expected", v610) .. "\n\n" .. ("Expected number of returns: %s\n"):format(l_printExpected_0(v609)) .. ("Received number of returns: %s"):format(l_printReceived_0(v614));
            if #v608.mock.calls ~= v614 then
                v618 = v618 .. ("\nReceived number of calls:   %s"):format(l_printReceived_0(#v608.mock.calls));
            end;
            return v618;
        end, 
        pass = v615
    };
end;
v309 = "toReturnWith";
v308.toReturnWith = function(v619, v620, v621) --[[ Line: 733 ]]
    -- upvalues: v45 (ref), v309 (copy), l_Array_0 (copy), v31 (ref), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), v41 (ref), v33 (ref), v32 (ref)
    local v622 = {
        isNot = v619.isNot, 
        promise = v619.promise
    };
    v45(v620, v309, "expected", v622);
    local v623 = v620.getMockName();
    local l_mock_8 = v620.mock;
    local l_calls_8 = l_mock_8.calls;
    local l_results_8 = l_mock_8.results;
    local v628 = l_Array_0.some(l_results_8, function(v627) --[[ Line: 746 ]]
        -- upvalues: v31 (ref), v621 (copy)
        return v31(v621, v627);
    end);
    local _ = nil;
    return {
        message = v628 and function() --[[ Line: 752 ]]
            -- upvalues: l_results_8 (copy), v31 (ref), v621 (copy), l_matcherHint_0 (ref), v309 (ref), v623 (copy), v622 (copy), l_printExpected_0 (ref), l_stringify_0 (ref), v41 (ref), v33 (ref), v32 (ref), l_calls_8 (copy)
            local v630 = {};
            local v631 = 1;
            while v631 <= #l_results_8 and #v630 < 3 do
                if v31(v621, l_results_8[v631]) then
                    table.insert(v630, {
                        v631, 
                        l_results_8[v631]
                    });
                end;
                v631 = v631 + 1;
            end;
            local v632 = l_matcherHint_0(v309, v623, "expected", v622) .. "\n\n" .. ("Expected: never %s\n"):format(l_printExpected_0(v621));
            if #l_results_8 ~= 1 or l_results_8[1].type ~= "return" or l_stringify_0(l_results_8[1].value) ~= l_stringify_0(v621) then
                v632 = v632 .. v41("Received:       ", v621, v630, #l_results_8 == 1);
            end;
            return v632 .. v33(v32(l_results_8), #l_calls_8);
        end or function() --[[ Line: 782 ]]
            -- upvalues: l_results_8 (copy), l_matcherHint_0 (ref), v309 (ref), v623 (copy), v622 (copy), l_printExpected_0 (ref), v621 (copy), v41 (ref), v33 (ref), v32 (ref), l_calls_8 (copy)
            local v633 = {};
            local v634 = 1;
            while v634 <= #l_results_8 and #v633 < 3 do
                table.insert(v633, {
                    v634, 
                    l_results_8[v634]
                });
                v634 = v634 + 1;
            end;
            return l_matcherHint_0(v309, v623, "expected", v622) .. "\n\n" .. ("Expected: %s\n"):format(l_printExpected_0(v621)) .. v41("Received: ", v621, v633, #l_results_8 == 1) .. v33(v32(l_results_8), #l_calls_8);
        end, 
        pass = v628
    };
end;
v42 = function(v635) --[[ Line: 1303 ]] --[[ Name: isMock ]]
    local v636 = false;
    if v635 ~= nil then
        v636 = false;
        if typeof(v635) == "table" then
            v636 = v635._isMockFunction == true;
        end;
    end;
    return v636;
end;
v43 = function(v637) --[[ Line: 1307 ]] --[[ Name: isSpy ]]
    local v638 = false;
    if v637 ~= nil then
        v638 = false;
        if typeof(v637) == "table" then
            v638 = false;
            if v637.calls ~= nil then
                v638 = false;
                if typeof(v637.calls.all) == "function" then
                    v638 = typeof(v637.calls.count) == "function";
                end;
            end;
        end;
    end;
    return v638;
end;
v44 = function(v639, v640, v641, v642) --[[ Line: 1316 ]] --[[ Name: ensureMockOrSpy ]]
    -- upvalues: v42 (ref), v43 (ref), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy)
    if not v42(v639) and not v43(v639) then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v640, nil, v641, v642), ("%s value must be a mock or spy function"):format(l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v639, l_printReceived_0))));
    end;
end;
v45 = function(v643, v644, v645, v646) --[[ Line: 1336 ]] --[[ Name: ensureMock ]]
    -- upvalues: v42 (ref), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy)
    if not v42(v643) then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0(v644, nil, v645, v646), ("%s value must be a mock function"):format(l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v643, l_printReceived_0))));
    end;
end;
return v308;