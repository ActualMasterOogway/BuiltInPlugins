local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Number_0 = v2.Number;
local l_Symbol_0 = v2.Symbol;
local v7 = require(l_Parent_0.ChalkLua);
local v8 = require(l_Parent_0.JestDiff);
local l_DIFF_DELETE_0 = v8.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v8.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v8.DIFF_INSERT;
local l_diff_0 = v8.diff;
local l_diffStringsRaw_0 = v8.diffStringsRaw;
local l_diffStringsUnified_0 = v8.diffStringsUnified;
local v15 = require(l_Parent_0.JestGetType);
local l_getType_0 = v15.getType;
local l_isPrimitive_0 = v15.isPrimitive;
local v18 = require(l_Parent_0.PrettyFormat);
local l_format_0 = v18.format;
local v20 = require(l_script_0.Replaceable);
local v21 = require(l_script_0.deepCyclicCopyReplaceable);
local l_plugins_0 = v18.plugins;
local v23 = {
    l_plugins_0.AsymmetricMatcher, 
    l_plugins_0.RobloxInstance
};
local l_green_0 = v7.green;
local l_red_0 = v7.red;
local l_inverse_0 = v7.inverse;
local l_bold_0 = v7.bold;
local l_dim_0 = v7.dim;
local v29 = utf8.char(183);
local v30 = {
    "zero", 
    "one", 
    "two", 
    "three", 
    "four", 
    "five", 
    "six", 
    "seven", 
    "eight", 
    "nine", 
    "ten", 
    "eleven", 
    "twelve", 
    "thirteen"
};
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = nil;
local function v39(v40, v41) --[[ Line: 99 ]] --[[ Name: stringify ]]
    -- upvalues: l_Symbol_0 (copy), l_format_0 (copy), v23 (copy), v39 (copy)
    if v40 == l_Symbol_0.for_("$$nil") then
        v40 = nil;
    end;
    v41 = v41 or 10;
    local v42 = nil;
    if not pcall(function() --[[ Line: 109 ]]
        -- upvalues: v42 (ref), l_format_0 (ref), v40 (ref), v41 (ref), v23 (ref)
        v42 = l_format_0(v40, {
            maxDepth = v41, 
            min = true, 
            plugins = v23
        });
    end) then
        v42 = l_format_0(v40, {
            callToJSON = false, 
            maxDepth = v41, 
            min = true, 
            plugins = v23
        });
    end;
    if #v42 >= 10000 and v41 > 1 and v41 then
        return v39(v40, (math.floor(v41 / 2)));
    else
        return v42;
    end;
end;
local function v45(v43) --[[ Line: 138 ]] --[[ Name: highlightTrailingWhitespace ]]
    -- upvalues: l_inverse_0 (copy)
    return v43:gsub("%s+$", function(v44) --[[ Line: 139 ]]
        -- upvalues: l_inverse_0 (ref)
        return l_inverse_0(v44);
    end);
end;
v31 = function(v46) --[[ Line: 145 ]] --[[ Name: replaceTrailingSpaces ]]
    -- upvalues: v29 (copy)
    return v46:gsub("%s+$", function(v47) --[[ Line: 146 ]]
        -- upvalues: v29 (ref)
        return string.rep(v29, #v47);
    end);
end;
local function v49(v48) --[[ Line: 151 ]] --[[ Name: printReceived ]]
    -- upvalues: l_red_0 (copy), v31 (ref), v39 (copy)
    return l_red_0(v31(v39(v48)));
end;
local function v51(v50) --[[ Line: 155 ]] --[[ Name: printExpected ]]
    -- upvalues: l_green_0 (copy), v31 (ref), v39 (copy)
    return l_green_0(v31(v39(v50)));
end;
local function v57(v52, v53, v54) --[[ Line: 159 ]] --[[ Name: printWithType ]]
    -- upvalues: l_getType_0 (copy)
    local v55 = l_getType_0(v53);
    local _ = nil;
    return (if v55 ~= "nil" then string.format("%s has type:  %s\n", v52, v55) else "") .. string.format("%s has value: %s", v52, v54(v53));
end;
local function v62(v58, v59, v60) --[[ Line: 176 ]] --[[ Name: ensureNoExpected ]]
    -- upvalues: l_Error_0 (copy), v37 (ref), v38 (ref), v57 (copy), v51 (copy)
    if typeof(v58) ~= "nil" then
        local l_v59_0 = v59;
        if not v60 then
            l_v59_0 = "[.never]" .. l_v59_0;
        end;
        error(l_Error_0(v37(v38(l_v59_0, nil, "", v60), "this matcher must not have an expected argument", (v57("Expected", v58, v51)))));
    end;
end;
local function v67(v63, v64, v65) --[[ Line: 198 ]] --[[ Name: ensureActualIsNumber ]]
    -- upvalues: l_Error_0 (copy), v37 (ref), v38 (ref), l_red_0 (copy), v57 (copy), v49 (copy)
    if typeof(v63) ~= "number" then
        local l_v64_0 = v64;
        if not v65 then
            l_v64_0 = "[.never]" .. l_v64_0;
        end;
        error(l_Error_0(v37(v38(l_v64_0, nil, nil, v65), l_red_0("received") .. " value must be a number", (v57("Received", v63, v49)))));
    end;
end;
local function v72(v68, v69, v70) --[[ Line: 221 ]] --[[ Name: ensureExpectedIsNumber ]]
    -- upvalues: l_Error_0 (copy), v37 (ref), v38 (ref), l_green_0 (copy), v57 (copy), v51 (copy)
    if typeof(v68) ~= "number" then
        local l_v69_0 = v69;
        if not v70 then
            l_v69_0 = "[.never]" .. l_v69_0;
        end;
        error(l_Error_0(v37(v38(l_v69_0, nil, nil, v70), l_green_0("expected") .. " value must be a number", (v57("Expected", v68, v51)))));
    end;
end;
local function v77(v73, v74, v75, v76) --[[ Line: 244 ]] --[[ Name: ensureNumbers ]]
    -- upvalues: v67 (copy), v72 (copy)
    v67(v73, v75, v76);
    v72(v74, v75, v76);
end;
local function v82(v78, v79, v80) --[[ Line: 249 ]] --[[ Name: ensureExpectedIsNonNegativeInteger ]]
    -- upvalues: l_Number_0 (copy), l_Error_0 (copy), v37 (ref), v38 (ref), l_green_0 (copy), v57 (copy), v51 (copy)
    if typeof(v78) ~= "number" or not l_Number_0.isSafeInteger(v78) or v78 < 0 then
        local l_v79_0 = v79;
        if not v80 then
            l_v79_0 = "[.never]" .. l_v79_0;
        end;
        error(l_Error_0(v37(v38(l_v79_0, nil, nil, v80), l_green_0("expected") .. " value must be a non-negative integer", (v57("Expected", v78, v51)))));
    end;
end;
v32 = function(v83, v84, v85) --[[ Line: 274 ]] --[[ Name: getCommonAndChangedSubstrings ]]
    -- upvalues: l_Array_0 (copy), l_DIFF_EQUAL_0 (copy), l_inverse_0 (copy)
    return l_Array_0.reduce(v83, function(v86, v87) --[[ Line: 275 ]]
        -- upvalues: l_DIFF_EQUAL_0 (ref), v84 (copy), v85 (copy), l_inverse_0 (ref)
        if v87[1] == l_DIFF_EQUAL_0 then
            return v86 .. v87[2];
        elseif v87[1] ~= v84 then
            return v86;
        elseif v85 then
            return v86 .. l_inverse_0(v87[2]);
        else
            return v86 .. v87[2];
        end;
    end, "");
end;
v33 = function(v88, v89) --[[ Line: 288 ]] --[[ Name: isLineDiffable ]]
    -- upvalues: l_getType_0 (copy), l_isPrimitive_0 (copy)
    local v90 = l_getType_0(v88);
    local v91 = l_getType_0(v89);
    if v90 ~= v91 then
        return false;
    elseif l_isPrimitive_0(v88) then
        local v92 = false;
        if typeof(v88) == "string" then
            v92 = false;
            if typeof(v89) == "string" then
                v92 = false;
                if #v88 ~= 0 then
                    v92 = false;
                    if #v89 ~= 0 then
                        v92 = not not (string.find(v88, "\n") or string.find(v89, "\n"));
                    end;
                end;
            end;
        end;
        return v92;
    elseif v90 == "DateTime" or v90 == "function" then
        return false;
    elseif v90 == "table" and typeof(v88.asymmetricMatch) == "function" then
        return false;
    elseif v91 == "table" and typeof(v89.asymmetricMatch) == "function" then
        return false;
    else
        return true;
    end;
end;
printDiffOrStringify = function(v93, v94, v95, v96, v97) --[[ Line: 326 ]] --[[ Name: printDiffOrStringify ]]
    -- upvalues: l_diffStringsUnified_0 (copy), v7 (copy), l_diffStringsRaw_0 (copy), l_Array_0 (copy), l_DIFF_EQUAL_0 (copy), v32 (ref), l_DIFF_DELETE_0 (copy), l_green_0 (copy), v31 (ref), v39 (copy), l_DIFF_INSERT_0 (copy), l_red_0 (copy), v33 (ref), v35 (ref), v21 (copy), l_diff_0 (copy)
    if typeof(v93) == "string" and typeof(v94) == "string" and #v93 ~= 0 and #v94 ~= 0 and #v93 <= 20000 and #v94 <= 20000 and v93 ~= v94 then
        if string.find(v93, "\n") or string.find(v94, "\n") then
            return l_diffStringsUnified_0(v93, v94, {
                aAnnotation = v95, 
                bAnnotation = v96, 
                changeLineTrailingSpaceColor = v7.bgYellow, 
                commonLineTrailingSpaceColor = v7.bgYellow, 
                emptyFirstOrLastLinePlaceholder = utf8.char(8629), 
                expand = v97, 
                includeChangeCounts = true
            });
        else
            local v98 = l_diffStringsRaw_0(v93, v94, true);
            local v100 = l_Array_0.some(v98, function(v99) --[[ Line: 355 ]]
                -- upvalues: l_DIFF_EQUAL_0 (ref)
                return v99[1] == l_DIFF_EQUAL_0;
            end);
            local v101 = getLabelPrinter(v95, v96);
            local v102 = v101(v95);
            local v103 = v32(v98, l_DIFF_DELETE_0, v100);
            local v104 = v102 .. l_green_0(v31(v39(v103)));
            local v105 = v101(v96);
            local v106 = v32(v98, l_DIFF_INSERT_0, v100);
            return v104 .. "\n" .. v105 .. l_red_0(v31(v39(v106)));
        end;
    else
        if v33(v93, v94) then
            local v107 = v35(v21(v93), v21(v94), {}, {});
            local l_replacedExpected_0 = v107.replacedExpected;
            local l_replacedReceived_0 = v107.replacedReceived;
            local v110 = l_diff_0(l_replacedExpected_0, l_replacedReceived_0, {
                aAnnotation = v95, 
                bAnnotation = v96, 
                expand = v97, 
                includeChangeCounts = true
            });
            if typeof(v110) == "string" and string.find(v110, "%- " .. v95) and string.find(v110, "%+ " .. v96) then
                return v110;
            end;
        end;
        local v111 = getLabelPrinter(v95, v96);
        local v112 = v111(v95) .. l_green_0(v31(v39(v93)));
        local _ = nil;
        return v112 .. "\n" .. if v39(v93) == v39(v94) then v111(v96) .. "serializes to the same string" else v111(v96) .. l_red_0(v31(v39(v94)));
    end;
end;
v34 = function(v114, v115) --[[ Line: 409 ]] --[[ Name: shouldPrintDiff ]]
    if typeof(v114) == "number" and typeof(v115) == "number" then
        return false;
    elseif typeof(v114) == "boolean" and typeof(v115) == "boolean" then
        return false;
    else
        return true;
    end;
end;
v35 = function(v116, v117, v118, v119) --[[ Line: 423 ]] --[[ Name: replaceMatchedToAsymmetricMatcher ]]
    -- upvalues: v20 (copy), l_Array_0 (copy), v36 (ref), v35 (ref)
    if not v20.isReplaceable(v116, v117) then
        return {
            replacedExpected = v116, 
            replacedReceived = v117
        };
    elseif l_Array_0.indexOf(v118, v116) ~= -1 or l_Array_0.indexOf(v119, v117) ~= -1 then
        return {
            replacedExpected = v116, 
            replacedReceived = v117
        };
    else
        table.insert(v118, v116);
        table.insert(v119, v117);
        local v120 = v20.new(v116);
        local v121 = v20.new(v117);
        v120:forEach(function(v122, v123) --[[ Line: 452 ]]
            -- upvalues: v121 (copy), v36 (ref), v120 (copy), v20 (ref), v35 (ref), v118 (copy), v119 (copy)
            local v124 = v121:get(v123);
            if v36(v122) then
                if v122:asymmetricMatch(v124) then
                    v121:set(v123, v122);
                    return;
                end;
            elseif v36(v124) then
                if v124:asymmetricMatch(v122) then
                    v120:set(v123, v124);
                    return;
                end;
            elseif v20.isReplaceable(v122, v124) then
                local v125 = v35(v122, v124, v118, v119);
                v120:set(v123, v125.replacedExpected);
                v121:set(v123, v125.replacedReceived);
            end;
        end);
        return {
            replacedExpected = v120.object, 
            replacedReceived = v121.object
        };
    end;
end;
v36 = function(v126) --[[ Line: 483 ]] --[[ Name: isAsymmetricMatcher ]]
    -- upvalues: l_getType_0 (copy)
    local v127 = l_getType_0(v126);
    local v128 = false;
    if v127 == "table" then
        v128 = typeof(v126.asymmetricMatch) == "function";
    end;
    return v128;
end;
local function v132(v129, v130, v131) --[[ Line: 488 ]] --[[ Name: diff ]]
    -- upvalues: v34 (ref), l_diff_0 (copy)
    return v34(v129, v130) and l_diff_0(v129, v130, v131) or nil;
end;
pluralize = function(v133, v134) --[[ Line: 496 ]] --[[ Name: pluralize ]]
    -- upvalues: v30 (copy)
    if v134 == 1 then
        return (v30[v134 + 1] or v134) .. " " .. v133;
    else
        return (v30[v134 + 1] or v134) .. " " .. v133 .. "s";
    end;
end;
getLabelPrinter = function(...) --[[ Line: 512 ]] --[[ Name: getLabelPrinter ]]
    -- upvalues: l_Array_0 (copy)
    local v137 = l_Array_0.reduce({
        ...
    }, function(v135, v136) --[[ Line: 515 ]]
        return (math.max(#v136, v135));
    end, 0);
    return function(v138) --[[ Line: 519 ]]
        -- upvalues: v137 (copy)
        if #v138 > v137 then
            error("Cannot print label for string with length larger than the max allowed of " .. v137);
        end;
        return string.format("%s: %s", v138, string.rep(" ", v137 - #v138));
    end;
end;
v37 = function(v139, v140, v141) --[[ Line: 530 ]] --[[ Name: matcherErrorMessage ]]
    -- upvalues: l_bold_0 (copy)
    if typeof(v141) == "string" then
        return string.format("%s\n\n%s: %s%s", v139, l_bold_0("Matcher error"), v140, "\n\n" .. v141);
    else
        return string.format("%s\n\n%s: %s%s", v139, l_bold_0("Matcher error"), v140, "");
    end;
end;
v38 = function(v142, v143, v144, v145) --[[ Line: 545 ]] --[[ Name: matcherHint ]]
    -- upvalues: l_green_0 (copy), l_red_0 (copy), l_dim_0 (copy)
    v143 = v143 or "received";
    v144 = v144 or "expected";
    v145 = v145 or {};
    local v146 = nil;
    local v147 = nil;
    local v148 = nil;
    local v149 = nil;
    local v150 = nil;
    local v151 = nil;
    local v152 = nil;
    local v153 = nil;
    if v145 then
        v146 = v145.comment or "";
        v147 = v145.expectedColor or l_green_0;
        v148 = v145.isDirectExpectCall or false;
        v149 = v145.isNot or false;
        v150 = v145.promise or "";
        v151 = v145.receivedColor or l_red_0;
        v152 = v145.secondArgument or "";
        v153 = v145.secondArgumentColor or l_green_0;
    end;
    local v154 = "";
    local v155 = "expect";
    if not v148 and v143 ~= "" then
        v154 = v154 .. l_dim_0(v155 .. "(") .. v151(v143);
        v155 = ")";
    end;
    if v150 ~= "" then
        v154 = v154 .. l_dim_0(v155 .. ".") .. v150;
        v155 = "";
    end;
    if v149 then
        v154 = v154 .. l_dim_0(v155 .. ".") .. "never";
        v155 = "";
    end;
    if string.find(v142, "%.") then
        v155 = v155 .. v142;
    else
        v154 = v154 .. l_dim_0(v155 .. ".") .. v142;
        v155 = "";
    end;
    if v144 == "" then
        v155 = v155 .. "()";
    else
        v154 = v154 .. l_dim_0(v155 .. "(") .. v147(v144);
        if v152 ~= "" then
            v154 = v154 .. l_dim_0(", ") .. v153(v152);
        end;
        v155 = ")";
    end;
    if v146 ~= "" then
        v155 = v155 .. " -- " .. v146;
    end;
    if v155 ~= "" then
        v154 = v154 .. l_dim_0(v155);
    end;
    return v154;
end;
return {
    EXPECTED_COLOR = l_green_0, 
    RECEIVED_COLOR = l_red_0, 
    INVERTED_COLOR = l_inverse_0, 
    BOLD_WEIGHT = l_bold_0, 
    DIM_COLOR = l_dim_0, 
    SUGGEST_TO_CONTAIN_EQUAL = "Looks like you wanted to test for object/array equality with the stricter `toContain` matcher. You probably need to use `toContainEqual` instead.", 
    stringify = v39, 
    highlightTrailingWhitespace = v45, 
    printReceived = v49, 
    printExpected = v51, 
    printWithType = v57, 
    ensureNoExpected = v62, 
    ensureActualIsNumber = v67, 
    ensureExpectedIsNumber = v72, 
    ensureNumbers = v77, 
    ensureExpectedIsNonNegativeInteger = v82, 
    printDiffOrStringify = printDiffOrStringify, 
    diff = v132, 
    pluralize = pluralize, 
    getLabelPrinter = getLabelPrinter, 
    matcherErrorMessage = v37, 
    matcherHint = v38
};