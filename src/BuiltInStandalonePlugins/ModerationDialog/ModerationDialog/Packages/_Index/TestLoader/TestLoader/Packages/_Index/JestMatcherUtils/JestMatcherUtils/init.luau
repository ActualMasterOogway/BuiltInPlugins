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
local function v39(v40, v41, v42) --[[ Line: 99 ]] --[[ Name: stringify ]]
    -- upvalues: l_Symbol_0 (copy), l_format_0 (copy), v23 (copy), v39 (copy)
    if v40 == l_Symbol_0.for_("$$nil") then
        v40 = nil;
    end;
    local v43 = if v41 ~= nil then v41 else 10;
    local v44 = if v42 ~= nil then v42 else 10;
    local v45 = nil;
    if not pcall(function() --[[ Line: 111 ]]
        -- upvalues: v45 (ref), l_format_0 (ref), v40 (ref), v43 (copy), v44 (copy), v23 (ref)
        v45 = l_format_0(v40, {
            maxDepth = v43, 
            maxWidth = v44, 
            min = true, 
            plugins = v23
        });
    end) then
        v45 = l_format_0(v40, {
            callToJSON = false, 
            maxDepth = v43, 
            maxWidth = v44, 
            min = true, 
            plugins = v23
        });
    end;
    if #v45 >= 10000 and v43 > 1 then
        return v39(v40, math.floor(v43 / 2), v44);
    elseif #v45 >= 10000 and v44 > 1 then
        return v39(v40, v43, (math.floor(v44 / 2)));
    else
        return v45;
    end;
end;
local function v48(v46) --[[ Line: 151 ]] --[[ Name: highlightTrailingWhitespace ]]
    -- upvalues: l_inverse_0 (copy)
    return v46:gsub("%s+$", function(v47) --[[ Line: 152 ]]
        -- upvalues: l_inverse_0 (ref)
        return l_inverse_0(v47);
    end);
end;
v31 = function(v49) --[[ Line: 158 ]] --[[ Name: replaceTrailingSpaces ]]
    -- upvalues: v29 (copy)
    return v49:gsub("%s+$", function(v50) --[[ Line: 159 ]]
        -- upvalues: v29 (ref)
        return string.rep(v29, #v50);
    end);
end;
local function v52(v51) --[[ Line: 164 ]] --[[ Name: printReceived ]]
    -- upvalues: l_red_0 (copy), v31 (ref), v39 (copy)
    return l_red_0(v31(v39(v51)));
end;
local function v54(v53) --[[ Line: 168 ]] --[[ Name: printExpected ]]
    -- upvalues: l_green_0 (copy), v31 (ref), v39 (copy)
    return l_green_0(v31(v39(v53)));
end;
local function v60(v55, v56, v57) --[[ Line: 172 ]] --[[ Name: printWithType ]]
    -- upvalues: l_getType_0 (copy)
    local v58 = l_getType_0(v56);
    local _ = nil;
    return (if v58 ~= "nil" then string.format("%s has type:  %s\n", v55, v58) else "") .. string.format("%s has value: %s", v55, v57(v56));
end;
local function v65(v61, v62, v63) --[[ Line: 189 ]] --[[ Name: ensureNoExpected ]]
    -- upvalues: l_Error_0 (copy), v37 (ref), v38 (ref), v60 (copy), v54 (copy)
    if typeof(v61) ~= "nil" then
        local l_v62_0 = v62;
        if not v63 then
            l_v62_0 = "[.never]" .. l_v62_0;
        end;
        error(l_Error_0(v37(v38(l_v62_0, nil, "", v63), "this matcher must not have an expected argument", (v60("Expected", v61, v54)))));
    end;
end;
local function v70(v66, v67, v68) --[[ Line: 211 ]] --[[ Name: ensureActualIsNumber ]]
    -- upvalues: l_Error_0 (copy), v37 (ref), v38 (ref), l_red_0 (copy), v60 (copy), v52 (copy)
    if typeof(v66) ~= "number" then
        local l_v67_0 = v67;
        if not v68 then
            l_v67_0 = "[.never]" .. l_v67_0;
        end;
        error(l_Error_0(v37(v38(l_v67_0, nil, nil, v68), l_red_0("received") .. " value must be a number", (v60("Received", v66, v52)))));
    end;
end;
local function v75(v71, v72, v73) --[[ Line: 234 ]] --[[ Name: ensureExpectedIsNumber ]]
    -- upvalues: l_Error_0 (copy), v37 (ref), v38 (ref), l_green_0 (copy), v60 (copy), v54 (copy)
    if typeof(v71) ~= "number" then
        local l_v72_0 = v72;
        if not v73 then
            l_v72_0 = "[.never]" .. l_v72_0;
        end;
        error(l_Error_0(v37(v38(l_v72_0, nil, nil, v73), l_green_0("expected") .. " value must be a number", (v60("Expected", v71, v54)))));
    end;
end;
local function v80(v76, v77, v78, v79) --[[ Line: 257 ]] --[[ Name: ensureNumbers ]]
    -- upvalues: v70 (copy), v75 (copy)
    v70(v76, v78, v79);
    v75(v77, v78, v79);
end;
local function v85(v81, v82, v83) --[[ Line: 262 ]] --[[ Name: ensureExpectedIsNonNegativeInteger ]]
    -- upvalues: l_Number_0 (copy), l_Error_0 (copy), v37 (ref), v38 (ref), l_green_0 (copy), v60 (copy), v54 (copy)
    if typeof(v81) ~= "number" or not l_Number_0.isSafeInteger(v81) or v81 < 0 then
        local l_v82_0 = v82;
        if not v83 then
            l_v82_0 = "[.never]" .. l_v82_0;
        end;
        error(l_Error_0(v37(v38(l_v82_0, nil, nil, v83), l_green_0("expected") .. " value must be a non-negative integer", (v60("Expected", v81, v54)))));
    end;
end;
v32 = function(v86, v87, v88) --[[ Line: 287 ]] --[[ Name: getCommonAndChangedSubstrings ]]
    -- upvalues: l_Array_0 (copy), l_DIFF_EQUAL_0 (copy), l_inverse_0 (copy)
    return l_Array_0.reduce(v86, function(v89, v90) --[[ Line: 288 ]]
        -- upvalues: l_DIFF_EQUAL_0 (ref), v87 (copy), v88 (copy), l_inverse_0 (ref)
        if v90[1] == l_DIFF_EQUAL_0 then
            return v89 .. v90[2];
        elseif v90[1] ~= v87 then
            return v89;
        elseif v88 then
            return v89 .. l_inverse_0(v90[2]);
        else
            return v89 .. v90[2];
        end;
    end, "");
end;
v33 = function(v91, v92) --[[ Line: 301 ]] --[[ Name: isLineDiffable ]]
    -- upvalues: l_getType_0 (copy), l_isPrimitive_0 (copy)
    local v93 = l_getType_0(v91);
    local v94 = l_getType_0(v92);
    if v93 ~= v94 then
        return false;
    elseif l_isPrimitive_0(v91) then
        local v95 = false;
        if typeof(v91) == "string" then
            v95 = false;
            if typeof(v92) == "string" then
                v95 = false;
                if #v91 ~= 0 then
                    v95 = false;
                    if #v92 ~= 0 then
                        v95 = not not (string.find(v91, "\n") or string.find(v92, "\n"));
                    end;
                end;
            end;
        end;
        return v95;
    elseif v93 == "DateTime" or v93 == "function" then
        return false;
    elseif v93 == "table" and typeof(v91.asymmetricMatch) == "function" then
        return false;
    elseif v94 == "table" and typeof(v92.asymmetricMatch) == "function" then
        return false;
    else
        return true;
    end;
end;
printDiffOrStringify = function(v96, v97, v98, v99, v100) --[[ Line: 339 ]] --[[ Name: printDiffOrStringify ]]
    -- upvalues: l_diffStringsUnified_0 (copy), v7 (copy), l_diffStringsRaw_0 (copy), l_Array_0 (copy), l_DIFF_EQUAL_0 (copy), v32 (ref), l_DIFF_DELETE_0 (copy), l_green_0 (copy), v31 (ref), v39 (copy), l_DIFF_INSERT_0 (copy), l_red_0 (copy), v33 (ref), v35 (ref), v21 (copy), l_diff_0 (copy)
    if typeof(v96) == "string" and typeof(v97) == "string" and #v96 ~= 0 and #v97 ~= 0 and #v96 <= 20000 and #v97 <= 20000 and v96 ~= v97 then
        if string.find(v96, "\n") or string.find(v97, "\n") then
            return l_diffStringsUnified_0(v96, v97, {
                aAnnotation = v98, 
                bAnnotation = v99, 
                changeLineTrailingSpaceColor = v7.bgYellow, 
                commonLineTrailingSpaceColor = v7.bgYellow, 
                emptyFirstOrLastLinePlaceholder = utf8.char(8629), 
                expand = v100, 
                includeChangeCounts = true
            });
        else
            local v101 = l_diffStringsRaw_0(v96, v97, true);
            local v103 = l_Array_0.some(v101, function(v102) --[[ Line: 368 ]]
                -- upvalues: l_DIFF_EQUAL_0 (ref)
                return v102[1] == l_DIFF_EQUAL_0;
            end);
            local v104 = getLabelPrinter(v98, v99);
            local v105 = v104(v98);
            local v106 = v32(v101, l_DIFF_DELETE_0, v103);
            local v107 = v105 .. l_green_0(v31(v39(v106)));
            local v108 = v104(v99);
            local v109 = v32(v101, l_DIFF_INSERT_0, v103);
            return v107 .. "\n" .. v108 .. l_red_0(v31(v39(v109)));
        end;
    else
        if v33(v96, v97) then
            local v110 = v35(v21(v96), v21(v97), {}, {});
            local l_replacedExpected_0 = v110.replacedExpected;
            local l_replacedReceived_0 = v110.replacedReceived;
            local v113 = l_diff_0(l_replacedExpected_0, l_replacedReceived_0, {
                aAnnotation = v98, 
                bAnnotation = v99, 
                expand = v100, 
                includeChangeCounts = true
            });
            if typeof(v113) == "string" and string.find(v113, "%- " .. v98) and string.find(v113, "%+ " .. v99) then
                return v113;
            end;
        end;
        local v114 = getLabelPrinter(v98, v99);
        local v115 = v114(v98) .. l_green_0(v31(v39(v96)));
        local _ = nil;
        return v115 .. "\n" .. if v39(v96) == v39(v97) then v114(v99) .. "serializes to the same string" else v114(v99) .. l_red_0(v31(v39(v97)));
    end;
end;
v34 = function(v117, v118) --[[ Line: 422 ]] --[[ Name: shouldPrintDiff ]]
    if typeof(v117) == "number" and typeof(v118) == "number" then
        return false;
    elseif typeof(v117) == "boolean" and typeof(v118) == "boolean" then
        return false;
    else
        return true;
    end;
end;
v35 = function(v119, v120, v121, v122) --[[ Line: 436 ]] --[[ Name: replaceMatchedToAsymmetricMatcher ]]
    -- upvalues: v20 (copy), l_Array_0 (copy), v36 (ref), v35 (ref)
    if not v20.isReplaceable(v119, v120) then
        return {
            replacedExpected = v119, 
            replacedReceived = v120
        };
    elseif l_Array_0.indexOf(v121, v119) ~= -1 or l_Array_0.indexOf(v122, v120) ~= -1 then
        return {
            replacedExpected = v119, 
            replacedReceived = v120
        };
    else
        table.insert(v121, v119);
        table.insert(v122, v120);
        local v123 = v20.new(v119);
        local v124 = v20.new(v120);
        v123:forEach(function(v125, v126) --[[ Line: 465 ]]
            -- upvalues: v124 (copy), v36 (ref), v123 (copy), v20 (ref), v35 (ref), v121 (copy), v122 (copy)
            local v127 = v124:get(v126);
            if v36(v125) then
                if v125:asymmetricMatch(v127) then
                    v124:set(v126, v125);
                    return;
                end;
            elseif v36(v127) then
                if v127:asymmetricMatch(v125) then
                    v123:set(v126, v127);
                    return;
                end;
            elseif v20.isReplaceable(v125, v127) then
                local v128 = v35(v125, v127, v121, v122);
                v123:set(v126, v128.replacedExpected);
                v124:set(v126, v128.replacedReceived);
            end;
        end);
        return {
            replacedExpected = v123.object, 
            replacedReceived = v124.object
        };
    end;
end;
v36 = function(v129) --[[ Line: 492 ]] --[[ Name: isAsymmetricMatcher ]]
    -- upvalues: l_getType_0 (copy)
    local v130 = l_getType_0(v129);
    local v131 = false;
    if v130 == "table" then
        v131 = typeof(v129.asymmetricMatch) == "function";
    end;
    return v131;
end;
local function v135(v132, v133, v134) --[[ Line: 497 ]] --[[ Name: diff ]]
    -- upvalues: v34 (ref), l_diff_0 (copy)
    return v34(v132, v133) and l_diff_0(v132, v133, v134) or nil;
end;
pluralize = function(v136, v137) --[[ Line: 505 ]] --[[ Name: pluralize ]]
    -- upvalues: v30 (copy)
    if v137 == 1 then
        return (v30[v137 + 1] or v137) .. " " .. v136;
    else
        return (v30[v137 + 1] or v137) .. " " .. v136 .. "s";
    end;
end;
getLabelPrinter = function(...) --[[ Line: 521 ]] --[[ Name: getLabelPrinter ]]
    -- upvalues: l_Array_0 (copy)
    local v140 = l_Array_0.reduce({
        ...
    }, function(v138, v139) --[[ Line: 524 ]]
        return (math.max(#v139, v138));
    end, 0);
    return function(v141) --[[ Line: 528 ]]
        -- upvalues: v140 (copy)
        if #v141 > v140 then
            error("Cannot print label for string with length larger than the max allowed of " .. v140);
        end;
        return string.format("%s: %s", v141, string.rep(" ", v140 - #v141));
    end;
end;
v37 = function(v142, v143, v144) --[[ Line: 539 ]] --[[ Name: matcherErrorMessage ]]
    -- upvalues: l_bold_0 (copy)
    if typeof(v144) == "string" then
        return string.format("%s\n\n%s: %s%s", v142, l_bold_0("Matcher error"), v143, "\n\n" .. v144);
    else
        return string.format("%s\n\n%s: %s%s", v142, l_bold_0("Matcher error"), v143, "");
    end;
end;
v38 = function(v145, v146, v147, v148) --[[ Line: 554 ]] --[[ Name: matcherHint ]]
    -- upvalues: l_green_0 (copy), l_red_0 (copy), l_dim_0 (copy)
    v146 = v146 or "received";
    v147 = v147 or "expected";
    v148 = v148 or {};
    local v149 = nil;
    local v150 = nil;
    local v151 = nil;
    local v152 = nil;
    local v153 = nil;
    local v154 = nil;
    local v155 = nil;
    local v156 = nil;
    if v148 then
        v149 = v148.comment or "";
        v150 = v148.expectedColor or l_green_0;
        v151 = v148.isDirectExpectCall or false;
        v152 = v148.isNot or false;
        v153 = v148.promise or "";
        v154 = v148.receivedColor or l_red_0;
        v155 = v148.secondArgument or "";
        v156 = v148.secondArgumentColor or l_green_0;
    end;
    local v157 = "";
    local v158 = "expect";
    if not v151 and v146 ~= "" then
        v157 = v157 .. l_dim_0(v158 .. "(") .. v154(v146);
        v158 = ")";
    end;
    if v153 ~= "" then
        v157 = v157 .. l_dim_0(v158 .. ".") .. v153;
        v158 = "";
    end;
    if v152 then
        v157 = v157 .. l_dim_0(v158 .. ".") .. "never";
        v158 = "";
    end;
    if string.find(v145, "%.") then
        v158 = v158 .. v145;
    else
        v157 = v157 .. l_dim_0(v158 .. ".") .. v145;
        v158 = "";
    end;
    if v147 == "" then
        v158 = v158 .. "()";
    else
        v157 = v157 .. l_dim_0(v158 .. "(") .. v150(v147);
        if v155 ~= "" then
            v157 = v157 .. l_dim_0(", ") .. v156(v155);
        end;
        v158 = ")";
    end;
    if v149 ~= "" then
        v158 = v158 .. " -- " .. v149;
    end;
    if v158 ~= "" then
        v157 = v157 .. l_dim_0(v158);
    end;
    return v157;
end;
return {
    EXPECTED_COLOR = l_green_0, 
    RECEIVED_COLOR = l_red_0, 
    INVERTED_COLOR = l_inverse_0, 
    BOLD_WEIGHT = l_bold_0, 
    DIM_COLOR = l_dim_0, 
    SUGGEST_TO_CONTAIN_EQUAL = "Looks like you wanted to test for object/array equality with the stricter `toContain` matcher. You probably need to use `toContainEqual` instead.", 
    stringify = v39, 
    highlightTrailingWhitespace = v48, 
    printReceived = v52, 
    printExpected = v54, 
    printWithType = v60, 
    ensureNoExpected = v65, 
    ensureActualIsNumber = v70, 
    ensureExpectedIsNumber = v75, 
    ensureNumbers = v80, 
    ensureExpectedIsNonNegativeInteger = v85, 
    printDiffOrStringify = printDiffOrStringify, 
    diff = v135, 
    pluralize = pluralize, 
    getLabelPrinter = getLabelPrinter, 
    matcherErrorMessage = v37, 
    matcherHint = v38
};