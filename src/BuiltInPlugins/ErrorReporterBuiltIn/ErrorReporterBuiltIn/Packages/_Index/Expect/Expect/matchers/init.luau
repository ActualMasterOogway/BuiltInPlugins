local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Number_0 = v2.Number;
local l_Object_0 = v2.Object;
local l_instanceof_0 = v2.instanceof;
local v8 = require(l_Parent_1.JestGetType);
local l_getType_0 = v8.getType;
local l_isPrimitive_0 = v8.isPrimitive;
local v11 = require(l_Parent_1.JestMatcherUtils);
local l_DIM_COLOR_0 = v11.DIM_COLOR;
local l_EXPECTED_COLOR_0 = v11.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v11.RECEIVED_COLOR;
local l_SUGGEST_TO_CONTAIN_EQUAL_0 = v11.SUGGEST_TO_CONTAIN_EQUAL;
local l_ensureExpectedIsNonNegativeInteger_0 = v11.ensureExpectedIsNonNegativeInteger;
local l_ensureNoExpected_0 = v11.ensureNoExpected;
local l_ensureNumbers_0 = v11.ensureNumbers;
local l_getLabelPrinter_0 = v11.getLabelPrinter;
local l_matcherErrorMessage_0 = v11.matcherErrorMessage;
local l_matcherHint_0 = v11.matcherHint;
local l_printDiffOrStringify_0 = v11.printDiffOrStringify;
local l_printExpected_0 = v11.printExpected;
local l_printReceived_0 = v11.printReceived;
local l_printWithType_0 = v11.printWithType;
local l_stringify_0 = v11.stringify;
local l_equals_0 = require(l_Parent_0.jasmineUtils).equals;
local v28 = require(l_Parent_0.print);
local l_printCloseTo_0 = v28.printCloseTo;
local l_printExpectedConstructorName_0 = v28.printExpectedConstructorName;
local l_printExpectedConstructorNameNot_0 = v28.printExpectedConstructorNameNot;
local l_printReceivedArrayContainExpectedItem_0 = v28.printReceivedArrayContainExpectedItem;
local l_printReceivedConstructorName_0 = v28.printReceivedConstructorName;
local l_printReceivedConstructorNameNot_0 = v28.printReceivedConstructorNameNot;
local l_printReceivedStringContainExpectedResult_0 = v28.printReceivedStringContainExpectedResult;
local l_printReceivedStringContainExpectedSubstring_0 = v28.printReceivedStringContainExpectedSubstring;
local _ = require(l_Parent_0.types);
local v38 = require(l_Parent_0.utils);
local l_getObjectSubset_0 = v38.getObjectSubset;
local l_getPath_0 = v38.getPath;
local l_iterableEquality_0 = v38.iterableEquality;
local l_subsetEquality_0 = v38.subsetEquality;
local l_typeEquality_0 = v38.typeEquality;
local v44 = require(l_Parent_1.RobloxShared);
local l_instanceSubsetEquality_0 = v44.RobloxInstance.instanceSubsetEquality;
local l_getInstanceSubset_0 = v44.RobloxInstance.getInstanceSubset;
local function _(v47) --[[ Line: 80 ]] --[[ Name: isExpand ]]
    return not not v47;
end;
local v49 = {
    l_typeEquality_0
};
local function v58(v50, v51, v52) --[[ Line: 101 ]] --[[ Name: toBe ]]
    -- upvalues: l_Object_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_equals_0 (copy), l_iterableEquality_0 (copy), l_DIM_COLOR_0 (copy), l_printDiffOrStringify_0 (copy)
    local v53 = {
        comment = "Object.is equality", 
        isNot = v50.isNot, 
        promise = v50.promise
    };
    local v54 = l_Object_0.is(v51, v52);
    local v55 = nil;
    v55 = v54 and function() --[[ Line: 113 ]]
        -- upvalues: l_matcherHint_0 (ref), v53 (copy), l_printExpected_0 (ref), v52 (copy)
        return l_matcherHint_0("toBe", nil, nil, v53) .. "\n\n" .. string.format("Expected: never %s", l_printExpected_0(v52));
    end or function() --[[ Line: 119 ]]
        -- upvalues: l_equals_0 (ref), v51 (copy), v52 (copy), l_iterableEquality_0 (ref), l_matcherHint_0 (ref), v53 (copy), l_DIM_COLOR_0 (ref), l_printDiffOrStringify_0 (ref), v50 (copy)
        local v56 = nil;
        if l_equals_0(v51, v52, {
            l_iterableEquality_0
        }) then
            v56 = "toEqual";
        end;
        local v57 = l_matcherHint_0("toBe", nil, nil, v53) .. "\n\n";
        if v56 ~= nil then
            v57 = v57 .. l_DIM_COLOR_0(string.format("If it should pass with deep equality, replace \"%s\" with \"%s\"", "toBe", v56)) .. "\n\n";
        end;
        return v57 .. l_printDiffOrStringify_0(v52, v51, "Expected", "Received", not not v50.expand);
    end;
    return {
        actual = v51, 
        expected = v52, 
        message = v55, 
        name = "toBe", 
        pass = v54
    };
end;
local function v72(v59, v60, v61, v62) --[[ Line: 158 ]] --[[ Name: toBeCloseTo ]]
    -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printWithType_0 (copy), l_printExpected_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printReceived_0 (copy), l_printCloseTo_0 (copy)
    local v63 = nil;
    if v62 then
        v63 = "precision";
    else
        v62 = 2;
    end;
    local l_isNot_0 = v59.isNot;
    local v66 = {
        isNot = l_isNot_0, 
        promise = v59.promise, 
        secondArgument = v63, 
        secondArgumentColor = function(v65) --[[ Line: 177 ]] --[[ Name: secondArgumentColor ]]
            return v65;
        end
    };
    if typeof(v61) ~= "number" then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toBeCloseTo", nil, nil, v66), string.format("%s value must be a number", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v61, l_printExpected_0))));
    end;
    if typeof(v60) ~= "number" then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toBeCloseTo", nil, nil, v66), string.format("%s value must be a number", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v60, l_printReceived_0))));
    end;
    local v67 = false;
    local v68 = 0;
    local v69 = 0;
    if v60 == 1e999 and v61 == 1e999 then
        v67 = true;
    elseif v60 == -1e999 and v61 == -1e999 then
        v67 = true;
    else
        v68 = 10 ^ (-v62) / 2;
        v69 = math.abs(v61 - v60);
        v67 = v69 < v68;
    end;
    local _ = nil;
    return {
        message = v67 and function() --[[ Line: 216 ]]
            -- upvalues: l_matcherHint_0 (ref), v66 (copy), l_printExpected_0 (ref), v61 (copy), v69 (ref), l_printReceived_0 (ref), v60 (copy), l_printCloseTo_0 (ref), v68 (ref), v62 (ref), l_isNot_0 (copy)
            local v71 = l_matcherHint_0("toBeCloseTo", nil, nil, v66) .. "\n\n" .. string.format("Expected: never %s\n", l_printExpected_0(v61));
            if v69 == 0 then
                return v71;
            else
                return v71 .. string.format("Received:       %s\n", l_printReceived_0(v60)) .. "\n" .. l_printCloseTo_0(v69, v68, v62, l_isNot_0);
            end;
        end or function() --[[ Line: 229 ]]
            -- upvalues: l_matcherHint_0 (ref), v66 (copy), l_printExpected_0 (ref), v61 (copy), l_printReceived_0 (ref), v60 (copy), l_printCloseTo_0 (ref), v69 (ref), v68 (ref), v62 (ref), l_isNot_0 (copy)
            return l_matcherHint_0("toBeCloseTo", nil, nil, v66) .. "\n\n" .. string.format("Expected: %s\n", l_printExpected_0(v61)) .. string.format("Received: %s\n", l_printReceived_0(v60)) .. "\n" .. l_printCloseTo_0(v69, v68, v62, l_isNot_0);
        end, 
        pass = v67
    };
end;
local function v78(v73, v74, v75) --[[ Line: 243 ]] --[[ Name: toBeDefined ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
    local v76 = {
        isNot = v73.isNot, 
        promise = v73.promise
    };
    l_ensureNoExpected_0(v75, "toBeDefined", v76);
    local v77 = v74 ~= nil;
    return {
        message = function() --[[ Line: 253 ]]
            -- upvalues: l_matcherHint_0 (ref), v76 (copy), l_printReceived_0 (ref), v74 (copy)
            return l_matcherHint_0("toBeDefined", nil, "", v76) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v74));
        end, 
        pass = v77
    };
end;
local function v84(v79, v80, v81) --[[ Line: 264 ]] --[[ Name: toBeFalsy ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
    local v82 = {
        isNot = v79.isNot, 
        promise = v79.promise
    };
    l_ensureNoExpected_0(v81, "toBeFalsy", v82);
    local v83 = not v80;
    return {
        message = function() --[[ Line: 274 ]]
            -- upvalues: l_matcherHint_0 (ref), v82 (copy), l_printReceived_0 (ref), v80 (copy)
            return l_matcherHint_0("toBeFalsy", nil, "", v82) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v80));
        end, 
        pass = v83
    };
end;
local function v91(v85, v86, v87) --[[ Line: 283 ]] --[[ Name: toBeGreaterThan ]]
    -- upvalues: l_ensureNumbers_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local l_isNot_1 = v85.isNot;
    local v89 = {
        isNot = l_isNot_1, 
        promise = v85.promise
    };
    l_ensureNumbers_0(v86, v87, "toBeGreaterThan", v89);
    local v90 = v87 < v86;
    return {
        message = function() --[[ Line: 298 ]]
            -- upvalues: l_matcherHint_0 (ref), v89 (copy), l_isNot_1 (copy), l_printExpected_0 (ref), v87 (copy), l_printReceived_0 (ref), v86 (copy)
            return l_matcherHint_0("toBeGreaterThan", nil, nil, v89) .. "\n\n" .. string.format("Expected:%s > %s\n", l_isNot_1 and " never" or "", l_printExpected_0(v87)) .. string.format("Received:%s   %s", l_isNot_1 and "      " or "", l_printReceived_0(v86));
        end, 
        pass = v90
    };
end;
local function v98(v92, v93, v94) --[[ Line: 308 ]] --[[ Name: toBeGreaterThanOrEqual ]]
    -- upvalues: l_ensureNumbers_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local l_isNot_2 = v92.isNot;
    local v96 = {
        isNot = l_isNot_2, 
        promise = v92.promise
    };
    l_ensureNumbers_0(v93, v94, "toBeGreaterThanOrEqual", v96);
    local v97 = v94 <= v93;
    return {
        message = function() --[[ Line: 323 ]]
            -- upvalues: l_matcherHint_0 (ref), v96 (copy), l_isNot_2 (copy), l_printExpected_0 (ref), v94 (copy), l_printReceived_0 (ref), v93 (copy)
            return l_matcherHint_0("toBeGreaterThanOrEqual", nil, nil, v96) .. "\n\n" .. string.format("Expected:%s >= %s\n", l_isNot_2 and " never" or "", l_printExpected_0(v94)) .. string.format("Received:%s    %s", l_isNot_2 and "      " or "", l_printReceived_0(v93));
        end, 
        pass = v97
    };
end;
local function v108(v99, v100, v101) --[[ Line: 334 ]] --[[ Name: toBeInstanceOf ]]
    -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printWithType_0 (copy), l_printExpected_0 (copy), l_instanceof_0 (copy), l_printExpectedConstructorNameNot_0 (copy), l_printReceivedConstructorNameNot_0 (copy), l_printExpectedConstructorName_0 (copy), l_isPrimitive_0 (copy), l_printReceived_0 (copy), l_printReceivedConstructorName_0 (copy)
    local v102 = {
        isNot = v99.isNot, 
        promise = v99.promise
    };
    if typeof(v101) ~= "table" then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toBeInstanceOf", nil, nil, v102), string.format("%s value must be a prototype class", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v101, l_printExpected_0))));
    end;
    local v103 = l_instanceof_0(v100, v101);
    local v104 = nil;
    if typeof((getmetatable(v100))) == "table" and typeof(getmetatable(v100).__index) == "table" then
        v104 = getmetatable(v100).__index;
    end;
    local _ = nil;
    return {
        message = v103 and function() --[[ Line: 360 ]]
            -- upvalues: l_matcherHint_0 (ref), v102 (copy), l_printExpectedConstructorNameNot_0 (ref), v101 (copy), v104 (ref), l_printReceivedConstructorNameNot_0 (ref)
            local v106 = l_matcherHint_0("toBeInstanceOf", nil, nil, v102) .. "\n\n" .. l_printExpectedConstructorNameNot_0("Expected constructor", v101);
            if v104 and v104 ~= v101 then
                v106 = v106 .. l_printReceivedConstructorNameNot_0("Received constructor", v104, v101);
            end;
            return v106;
        end or function() --[[ Line: 372 ]]
            -- upvalues: l_matcherHint_0 (ref), v102 (copy), l_printExpectedConstructorName_0 (ref), v101 (copy), l_isPrimitive_0 (ref), v100 (copy), v104 (ref), l_printReceived_0 (ref), l_printReceivedConstructorName_0 (ref)
            local v107 = l_matcherHint_0("toBeInstanceOf", nil, nil, v102) .. "\n\n" .. l_printExpectedConstructorName_0("Expected constructor", v101);
            if l_isPrimitive_0(v100) or v104 == nil then
                return v107 .. string.format("\nReceived value has no prototype\nReceived value: %s", l_printReceived_0(v100));
            else
                return v107 .. l_printReceivedConstructorName_0("Received constructor", v104);
            end;
        end, 
        pass = v103
    };
end;
local function v115(v109, v110, v111) --[[ Line: 389 ]] --[[ Name: toBeLessThan ]]
    -- upvalues: l_ensureNumbers_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local l_isNot_3 = v109.isNot;
    local v113 = {
        isNot = l_isNot_3, 
        promise = v109.promise
    };
    l_ensureNumbers_0(v110, v111, "toBeLessThan", v113);
    local v114 = v110 < v111;
    return {
        message = function() --[[ Line: 404 ]]
            -- upvalues: l_matcherHint_0 (ref), v113 (copy), l_isNot_3 (copy), l_printExpected_0 (ref), v111 (copy), l_printReceived_0 (ref), v110 (copy)
            return l_matcherHint_0("toBeLessThan", nil, nil, v113) .. "\n\n" .. string.format("Expected:%s < %s\n", l_isNot_3 and " never" or "", l_printExpected_0(v111)) .. string.format("Received:%s   %s", l_isNot_3 and "      " or "", l_printReceived_0(v110));
        end, 
        pass = v114
    };
end;
local function v122(v116, v117, v118) --[[ Line: 414 ]] --[[ Name: toBeLessThanOrEqual ]]
    -- upvalues: l_ensureNumbers_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local l_isNot_4 = v116.isNot;
    local v120 = {
        isNot = l_isNot_4, 
        promise = v116.promise
    };
    l_ensureNumbers_0(v117, v118, "toBeLessThanOrEqual", v120);
    local v121 = v117 <= v118;
    return {
        message = function() --[[ Line: 429 ]]
            -- upvalues: l_matcherHint_0 (ref), v120 (copy), l_isNot_4 (copy), l_printExpected_0 (ref), v118 (copy), l_printReceived_0 (ref), v117 (copy)
            return l_matcherHint_0("toBeLessThanOrEqual", nil, nil, v120) .. "\n\n" .. string.format("Expected:%s <= %s\n", l_isNot_4 and " never" or "", l_printExpected_0(v118)) .. string.format("Received:%s    %s", l_isNot_4 and "      " or "", l_printReceived_0(v117));
        end, 
        pass = v121
    };
end;
local function v128(v123, v124, v125) --[[ Line: 439 ]] --[[ Name: toBeNan ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_Number_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
    local v126 = {
        isNot = v123.isNot, 
        promise = v123.promise
    };
    l_ensureNoExpected_0(v125, "toBeNan", v126);
    local v127 = l_Number_0.isNaN(v124);
    return {
        message = function() --[[ Line: 449 ]]
            -- upvalues: l_matcherHint_0 (ref), v126 (copy), l_printReceived_0 (ref), v124 (copy)
            return l_matcherHint_0("toBeNan", nil, "", v126) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v124));
        end, 
        pass = v127
    };
end;
local function v134(v129, v130, v131) --[[ Line: 458 ]] --[[ Name: toBeNil ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
    local v132 = {
        isNot = v129.isNot, 
        promise = v129.promise
    };
    l_ensureNoExpected_0(v131, "toBeNil", v132);
    local v133 = v130 == nil;
    return {
        message = function() --[[ Line: 468 ]]
            -- upvalues: l_matcherHint_0 (ref), v132 (copy), l_printReceived_0 (ref), v130 (copy)
            return l_matcherHint_0("toBeNil", nil, "", v132) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v130));
        end, 
        pass = v133
    };
end;
return {
    toBe = v58, 
    toBeCloseTo = v72, 
    toBeDefined = v78, 
    toBeFalsy = v84, 
    toBeGreaterThan = v91, 
    toBeGreaterThanOrEqual = v98, 
    toBeInstanceOf = v108, 
    toBeLessThan = v115, 
    toBeLessThanOrEqual = v122, 
    toBeNan = v128, 
    toBeNaN = v128, 
    toBeNil = v134, 
    toBeNull = v134, 
    toBeTruthy = function(v135, v136, v137) --[[ Line: 477 ]] --[[ Name: toBeTruthy ]]
        -- upvalues: l_ensureNoExpected_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
        local v138 = {
            isNot = v135.isNot, 
            promise = v135.promise
        };
        l_ensureNoExpected_0(v137, "toBeTruthy", v138);
        local v139 = not not v136;
        return {
            message = function() --[[ Line: 487 ]]
                -- upvalues: l_matcherHint_0 (ref), v138 (copy), l_printReceived_0 (ref), v136 (copy)
                return l_matcherHint_0("toBeTruthy", nil, "", v138) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v136));
            end, 
            pass = v139
        };
    end, 
    toBeUndefined = function(v140, v141, v142) --[[ Line: 497 ]] --[[ Name: toBeUndefined ]]
        -- upvalues: l_ensureNoExpected_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
        local v143 = {
            isNot = v140.isNot, 
            promise = v140.promise
        };
        l_ensureNoExpected_0(v142, "toBeUndefined", v143);
        local v144 = v141 == nil;
        return {
            message = function() --[[ Line: 507 ]]
                -- upvalues: l_matcherHint_0 (ref), v143 (copy), l_printReceived_0 (ref), v141 (copy)
                return l_matcherHint_0("toBeUndefined", nil, "", v143) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v141));
            end, 
            pass = v144
        };
    end, 
    toContain = function(v145, v146, v147) --[[ Line: 516 ]] --[[ Name: toContain ]]
        -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getLabelPrinter_0 (copy), l_printExpected_0 (copy), l_printReceivedStringContainExpectedSubstring_0 (copy), l_Array_0 (copy), l_getType_0 (copy), l_printReceivedArrayContainExpectedItem_0 (copy), l_equals_0 (copy), l_iterableEquality_0 (copy), l_SUGGEST_TO_CONTAIN_EQUAL_0 (copy)
        local l_isNot_5 = v145.isNot;
        local v149 = {
            comment = "string.find or table.find", 
            isNot = l_isNot_5, 
            promise = v145.promise
        };
        if v146 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toContain", nil, nil, v149), string.format("%s value must not be nil", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v146, l_printReceived_0))));
        end;
        if typeof(v146) == "string" then
            local v150 = v146:find(tostring(v147), 1, true);
            local v151 = v150 ~= nil;
            return {
                message = function() --[[ Line: 543 ]]
                    -- upvalues: v147 (copy), l_getLabelPrinter_0 (ref), l_matcherHint_0 (ref), v149 (copy), l_isNot_5 (copy), l_printExpected_0 (ref), l_printReceivedStringContainExpectedSubstring_0 (ref), v146 (copy), v150 (copy), l_printReceived_0 (ref)
                    local v152 = string.format("Expected %s", typeof(v147) == "string" and "substring" or "value");
                    local v153 = l_getLabelPrinter_0(v152, "Received string");
                    return l_matcherHint_0("toContain", nil, nil, v149) .. "\n\n" .. string.format("%s%s%s\n", v153(v152), l_isNot_5 and "never " or "", l_printExpected_0(v147)) .. string.format("%s%s%s", v153("Received string"), l_isNot_5 and "      " or "", l_isNot_5 and l_printReceivedStringContainExpectedSubstring_0(v146, v150, #tostring(v147)) or l_printReceived_0(v146));
                end, 
                pass = v151
            };
        else
            local v154 = l_Array_0.from(v146);
            local v155 = table.find(v154, v147);
            local v156 = v155 ~= nil;
            return {
                message = function() --[[ Line: 578 ]]
                    -- upvalues: l_getType_0 (ref), v146 (copy), l_getLabelPrinter_0 (ref), l_matcherHint_0 (ref), v149 (copy), l_isNot_5 (copy), l_printExpected_0 (ref), v147 (copy), l_Array_0 (ref), l_printReceivedArrayContainExpectedItem_0 (ref), v155 (copy), l_printReceived_0 (ref), l_equals_0 (ref), l_iterableEquality_0 (ref), l_SUGGEST_TO_CONTAIN_EQUAL_0 (ref)
                    local v157 = string.format("Received %s", l_getType_0(v146));
                    local v158 = l_getLabelPrinter_0("Expected value", v157);
                    local v159 = l_matcherHint_0("toContain", nil, nil, v149) .. "\n\n" .. string.format("%s%s%s\n", v158("Expected value"), l_isNot_5 and "never " or "", l_printExpected_0(v147)) .. string.format("%s%s", v158(v157), l_isNot_5 and "      " or "");
                    v159 = if l_isNot_5 and l_Array_0.isArray(v146) then v159 .. l_printReceivedArrayContainExpectedItem_0(v146, v155) else v159 .. l_printReceived_0(v146);
                    if not l_isNot_5 and l_Array_0.findIndex(v146, function(v160) --[[ Line: 602 ]]
                        -- upvalues: l_equals_0 (ref), v147 (ref), l_iterableEquality_0 (ref)
                        return l_equals_0(v160, v147, {
                            l_iterableEquality_0
                        });
                    end) ~= -1 then
                        v159 = v159 .. string.format("\n\n%s", l_SUGGEST_TO_CONTAIN_EQUAL_0);
                    end;
                    return v159;
                end, 
                pass = v156
            };
        end;
    end, 
    toContainEqual = function(v161, v162, v163) --[[ Line: 615 ]] --[[ Name: toContainEqual ]]
        -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_Array_0 (copy), l_equals_0 (copy), l_iterableEquality_0 (copy), l_getType_0 (copy), l_getLabelPrinter_0 (copy), l_printExpected_0 (copy), l_printReceivedArrayContainExpectedItem_0 (copy)
        local l_isNot_6 = v161.isNot;
        local v165 = {
            comment = "deep equality", 
            isNot = l_isNot_6, 
            promise = v161.promise
        };
        if v162 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toContainEqual", nil, nil, v165), string.format("%s value must not be nil", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v162, l_printReceived_0))));
        end;
        local v167 = l_Array_0.findIndex(l_Array_0.from(v162), function(v166) --[[ Line: 639 ]]
            -- upvalues: l_equals_0 (ref), v163 (copy), l_iterableEquality_0 (ref)
            return l_equals_0(v166, v163, {
                l_iterableEquality_0
            });
        end);
        local v168 = v167 ~= -1;
        return {
            message = function() --[[ Line: 645 ]]
                -- upvalues: l_getType_0 (ref), v162 (copy), l_getLabelPrinter_0 (ref), l_matcherHint_0 (ref), v165 (copy), l_isNot_6 (copy), l_printExpected_0 (ref), v163 (copy), l_Array_0 (ref), l_printReceivedArrayContainExpectedItem_0 (ref), v167 (copy), l_printReceived_0 (ref)
                local v169 = string.format("Received %s", l_getType_0(v162));
                local v170 = l_getLabelPrinter_0("Expected value", v169);
                local v171 = l_matcherHint_0("toContainEqual", nil, nil, v165) .. "\n\n" .. string.format("%s%s%s\n", v170("Expected value"), l_isNot_6 and "never " or "", l_printExpected_0(v163)) .. string.format("%s%s", v170(v169), l_isNot_6 and "      " or "");
                if l_isNot_6 and l_Array_0.isArray(v162) then
                    return v171 .. l_printReceivedArrayContainExpectedItem_0(v162, v167);
                else
                    return v171 .. l_printReceived_0(v162);
                end;
            end, 
            pass = v168
        };
    end, 
    toEqual = function(v172, v173, v174) --[[ Line: 675 ]] --[[ Name: toEqual ]]
        -- upvalues: l_equals_0 (copy), l_iterableEquality_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), l_printReceived_0 (copy), l_printDiffOrStringify_0 (copy)
        local v175 = {
            comment = "deep equality", 
            isNot = v172.isNot, 
            promise = v172.promise
        };
        local v176 = l_equals_0(v173, v174, {
            l_iterableEquality_0
        });
        local v177 = nil;
        v177 = v176 and function() --[[ Line: 687 ]]
            -- upvalues: l_matcherHint_0 (ref), v175 (copy), l_printExpected_0 (ref), v174 (copy), l_stringify_0 (ref), v173 (copy), l_printReceived_0 (ref)
            local v178 = l_matcherHint_0("toEqual", nil, nil, v175) .. "\n\n" .. string.format("Expected: never %s\n", l_printExpected_0(v174));
            if l_stringify_0(v174) ~= l_stringify_0(v173) then
                v178 = v178 .. string.format("Received:       %s", l_printReceived_0(v173));
            end;
            return v178;
        end or function() --[[ Line: 700 ]]
            -- upvalues: l_matcherHint_0 (ref), v175 (copy), l_printDiffOrStringify_0 (ref), v174 (copy), v173 (copy), v172 (copy)
            return l_matcherHint_0("toEqual", nil, nil, v175) .. "\n\n" .. l_printDiffOrStringify_0(v174, v173, "Expected", "Received", not not v172.expand);
        end;
        return {
            actual = v173, 
            expected = v174, 
            message = v177, 
            name = "toEqual", 
            pass = v176
        };
    end, 
    toHaveLength = function(v179, v180, v181) --[[ Line: 719 ]] --[[ Name: toHaveLength ]]
        -- upvalues: l_Array_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_ensureExpectedIsNonNegativeInteger_0 (copy), l_getType_0 (copy), l_getLabelPrinter_0 (copy), l_printExpected_0 (copy)
        local l_isNot_7 = v179.isNot;
        local v183 = {
            isNot = l_isNot_7, 
            promise = v179.promise
        };
        local v184 = false;
        if typeof(v180) == "table" then
            v184 = typeof(v180.length) == "number";
        end;
        if not l_Array_0.isArray(v180) and typeof(v180) ~= "string" and not v184 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveLength", nil, nil, v183), string.format("%s value must have a length property whose value must be a number", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v180, l_printReceived_0))));
        end;
        l_ensureExpectedIsNonNegativeInteger_0(v181, "toHaveLength", v183);
        local v185 = nil;
        local v186 = nil;
        if v180.length ~= nil then
            v186 = v180.length;
            v185 = v186 == v181;
        else
            v186 = #v180;
            v185 = v186 == v181;
        end;
        return {
            message = function() --[[ Line: 758 ]]
                -- upvalues: l_getType_0 (ref), v180 (copy), l_getLabelPrinter_0 (ref), l_matcherHint_0 (ref), v183 (copy), l_isNot_7 (copy), l_printExpected_0 (ref), v181 (copy), l_printReceived_0 (ref), v186 (ref)
                local v187 = string.format("Received %s", l_getType_0(v180));
                local v188 = l_getLabelPrinter_0("Expected length", "Received length", v187);
                local v189 = l_matcherHint_0("toHaveLength", nil, nil, v183) .. "\n\n" .. string.format("%s%s%s\n", v188("Expected length"), l_isNot_7 and "never " or "", l_printExpected_0(v181));
                if not l_isNot_7 then
                    v189 = v189 .. string.format("%s%s\n", v188("Received length"), l_printReceived_0(v186));
                end;
                return v189 .. string.format("%s%s%s", v188(v187), l_isNot_7 and "      " or "", l_printReceived_0(v180));
            end, 
            pass = v185
        };
    end, 
    toHaveProperty = function(v190, v191, v192, v193) --[[ Line: 795 ]] --[[ Name: toHaveProperty ]]
        -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getType_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy), l_getPath_0 (copy), l_equals_0 (copy), l_iterableEquality_0 (copy), l_stringify_0 (copy), l_printDiffOrStringify_0 (copy)
        local v194 = v193 ~= nil;
        local v195 = {
            isNot = v190.isNot, 
            promise = v190.promise, 
            secondArgument = v194 and "value" or ""
        };
        if v191 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveProperty", nil, "path", v195), string.format("%s value must not be nil", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v191, l_printReceived_0))));
        end;
        local v196 = l_getType_0(v192);
        if v196 ~= "string" and v196 ~= "table" then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveProperty", nil, "path", v195), string.format("%s path must be a string or array", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v192, l_printExpected_0))));
        end;
        local v197 = nil;
        v197 = if typeof(v192) == "string" then #v192:split(".") else #v192;
        if v196 == "table" and v197 == 0 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveProperty", nil, "path", v195), string.format("%s path must not be an empty array", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v192, l_printExpected_0))));
        end;
        local v198 = l_getPath_0(v191, v192);
        local l_lastTraversedObject_0 = v198.lastTraversedObject;
        local l_hasEndProp_0 = v198.hasEndProp;
        local l_traversedPath_0 = v198.traversedPath;
        local v202 = #l_traversedPath_0 == v197;
        local v203 = nil;
        v203 = if v202 then v198.value else l_lastTraversedObject_0;
        local v204 = nil;
        v204 = if v194 then l_equals_0(v198.value, v193, {
            l_iterableEquality_0
        }) else not not l_hasEndProp_0;
        local _ = nil;
        return {
            message = v204 and function() --[[ Line: 874 ]]
                -- upvalues: l_matcherHint_0 (ref), v195 (copy), v194 (copy), l_printExpected_0 (ref), v192 (copy), v193 (copy), l_stringify_0 (ref), v203 (ref), l_printReceived_0 (ref)
                local v206 = l_matcherHint_0("toHaveProperty", nil, "path", v195) .. "\n\n";
                if v194 then
                    v206 = v206 .. string.format("Expected path: %s\n\n", l_printExpected_0(v192)) .. string.format("Expected value: never %s", l_printExpected_0(v193));
                    if l_stringify_0(v193) ~= l_stringify_0(v203) then
                        return v206 .. string.format("\nReceived value:       %s", l_printReceived_0(v203));
                    else
                        return v206;
                    end;
                else
                    return v206 .. string.format("Expected path: never %s\n\n", l_printExpected_0(v192)) .. string.format("Received value: %s", l_printReceived_0(v203));
                end;
            end or function() --[[ Line: 892 ]]
                -- upvalues: l_matcherHint_0 (ref), v195 (copy), l_printExpected_0 (ref), v192 (copy), v202 (copy), l_printDiffOrStringify_0 (ref), v193 (copy), v203 (ref), v190 (copy), v196 (copy), l_traversedPath_0 (copy), l_printReceived_0 (ref), v194 (copy)
                local v207 = l_matcherHint_0("toHaveProperty", nil, "path", v195) .. "\n\n" .. string.format("Expected path: %s\n", l_printExpected_0(v192));
                if v202 then
                    return v207 .. "\n" .. l_printDiffOrStringify_0(v193, v203, "Expected value", "Received value", not not v190.expand);
                else
                    v207 = v207 .. "Received path: ";
                    v207 = if not (v196 ~= "table") or #l_traversedPath_0 == 0 then v207 .. string.format("%s\n\n", l_printReceived_0(l_traversedPath_0)) else v207 .. string.format("%s\n\n", l_printReceived_0(table.concat(l_traversedPath_0, ".")));
                    if v194 then
                        v207 = v207 .. string.format("Expected value: %s\n", l_printExpected_0(v193));
                    end;
                    return v207 .. string.format("Received value: %s", l_printReceived_0(v203));
                end;
            end, 
            pass = v204
        };
    end, 
    toMatch = function(v208, v209, v210) --[[ Line: 927 ]] --[[ Name: toMatch ]]
        -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getType_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy), l_printReceivedStringContainExpectedSubstring_0 (copy), l_printReceivedStringContainExpectedResult_0 (copy), l_getLabelPrinter_0 (copy)
        local v211 = {
            isNot = v208.isNot, 
            promise = v208.promise
        };
        if typeof(v209) ~= "string" then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatch", nil, nil, v211), string.format("%s value must be a string", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v209, l_printReceived_0))));
        end;
        if typeof(v210) ~= "string" and l_getType_0(v210) ~= "regexp" then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatch", nil, nil, v211), string.format("%s value must be a string or regular expression", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v210, l_printExpected_0))));
        end;
        local v212 = nil;
        if typeof(v210) == "string" then
            v210 = string.gsub(v210, string.char(27) .. "%[", string.char(27) .. "%%[");
            v212 = v209:find(v210) ~= nil;
        else
            v212 = v210:test(v209);
        end;
        local _ = nil;
        return {
            message = v212 and function() --[[ Line: 968 ]]
                -- upvalues: l_matcherHint_0 (ref), v211 (copy), l_printExpected_0 (ref), v210 (ref), l_printReceivedStringContainExpectedSubstring_0 (ref), v209 (copy), l_printReceivedStringContainExpectedResult_0 (ref)
                local v214 = l_matcherHint_0("toMatch", nil, nil, v211) .. "\n\n" .. string.format("Expected pattern: never %s\n", l_printExpected_0(v210));
                if typeof(v210) == "string" then
                    return v214 .. string.format("Received string:        %s", l_printReceivedStringContainExpectedSubstring_0(v209, v209:find(v210), #v210));
                else
                    return v214 .. string.format("Received string:        %s", l_printReceivedStringContainExpectedResult_0(v209, v210:exec(v209)));
                end;
            end or function() --[[ Line: 981 ]]
                -- upvalues: l_getLabelPrinter_0 (ref), l_matcherHint_0 (ref), v211 (copy), l_printExpected_0 (ref), v210 (ref), l_printReceived_0 (ref), v209 (copy)
                local v215 = l_getLabelPrinter_0("Expected pattern", "Received string");
                return l_matcherHint_0("toMatch", nil, nil, v211) .. "\n\n" .. string.format("%s%s\n", v215("Expected pattern"), l_printExpected_0(v210)) .. string.format("%s%s", v215("Received string"), l_printReceived_0(v209));
            end, 
            pass = v212
        };
    end, 
    toMatchObject = function(v216, v217, v218) --[[ Line: 996 ]] --[[ Name: toMatchObject ]]
        -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy), l_equals_0 (copy), l_iterableEquality_0 (copy), l_subsetEquality_0 (copy), l_stringify_0 (copy), l_printDiffOrStringify_0 (copy), l_getObjectSubset_0 (copy)
        local v219 = {
            isNot = v216.isNot, 
            promise = v216.promise
        };
        if typeof(v217) ~= "table" or v217 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchObject", nil, nil, v219), string.format("%s value must be a non-nil object", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v217, l_printReceived_0))));
        end;
        if typeof(v218) ~= "table" or v218 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchObject", nil, nil, v219), string.format("%s value must be a non-nil object", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v218, l_printExpected_0))));
        end;
        local v220 = l_equals_0(v217, v218, {
            l_iterableEquality_0, 
            l_subsetEquality_0
        });
        local _ = nil;
        return {
            message = v220 and function() --[[ Line: 1028 ]]
                -- upvalues: l_matcherHint_0 (ref), v219 (copy), l_printExpected_0 (ref), v218 (copy), l_stringify_0 (ref), v217 (copy), l_printReceived_0 (ref)
                local v222 = l_matcherHint_0("toMatchObject", nil, nil, v219) .. "\n\n" .. string.format("Expected: never %s", l_printExpected_0(v218));
                if l_stringify_0(v218) ~= l_stringify_0(v217) then
                    return v222 .. string.format("\nReceived:       %s", l_printReceived_0(v217));
                else
                    return v222;
                end;
            end or function() --[[ Line: 1038 ]]
                -- upvalues: l_matcherHint_0 (ref), v219 (copy), l_printDiffOrStringify_0 (ref), v218 (copy), l_getObjectSubset_0 (ref), v217 (copy), v216 (copy)
                return l_matcherHint_0("toMatchObject", nil, nil, v219) .. "\n\n" .. l_printDiffOrStringify_0(v218, l_getObjectSubset_0(v217, v218), "Expected", "Received", not not v216.expand);
            end, 
            pass = v220
        };
    end, 
    toStrictEqual = function(v223, v224, v225) --[[ Line: 1064 ]] --[[ Name: toStrictEqual ]]
        -- upvalues: l_equals_0 (copy), v49 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), l_printReceived_0 (copy), l_printDiffOrStringify_0 (copy)
        local v226 = {
            comment = "deep equality", 
            isNot = v223.isNot, 
            promise = v223.promise
        };
        local v227 = l_equals_0(v224, v225, v49, true);
        local v228 = nil;
        v228 = v227 and function() --[[ Line: 1076 ]]
            -- upvalues: l_matcherHint_0 (ref), v226 (copy), l_printExpected_0 (ref), v225 (copy), l_stringify_0 (ref), v224 (copy), l_printReceived_0 (ref)
            local v229 = l_matcherHint_0("toStrictEqual", nil, nil, v226) .. "\n\n" .. string.format("Expected: not %s\n", l_printExpected_0(v225));
            if l_stringify_0(v225) ~= l_stringify_0(v224) then
                v229 = v229 .. string.format("Received:     %s", l_printReceived_0(v224));
            end;
            return v229;
        end or function() --[[ Line: 1088 ]]
            -- upvalues: l_matcherHint_0 (ref), v226 (copy), l_printDiffOrStringify_0 (ref), v225 (copy), v224 (copy), v223 (copy)
            return l_matcherHint_0("toStrictEqual", nil, nil, v226) .. "\n\n" .. l_printDiffOrStringify_0(v225, v224, "Expected", "Received", not not v223.expand);
        end;
        return {
            actual = v224, 
            expected = v225, 
            message = v228, 
            name = "toStrictEqual", 
            pass = v227
        };
    end, 
    toMatchInstance = function(v230, v231, v232) --[[ Line: 1107 ]] --[[ Name: toMatchInstance ]]
        -- upvalues: l_getType_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy), l_equals_0 (copy), l_instanceSubsetEquality_0 (copy), l_stringify_0 (copy), l_getInstanceSubset_0 (copy), l_printDiffOrStringify_0 (copy)
        local v233 = {
            isNot = v230.isNot, 
            promise = v230.promise
        };
        if l_getType_0(v231) ~= "Instance" or v231 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchInstance", nil, nil, v233), string.format("%s value must be a Roblox Instance", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v231, l_printReceived_0))));
        end;
        if typeof(v232) ~= "table" or v232 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchInstance", nil, nil, v233), string.format("%s value must be a table", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v232, l_printExpected_0))));
        end;
        local v234 = l_equals_0(v231, v232, {
            l_instanceSubsetEquality_0
        });
        local v235 = nil;
        if v234 then
            v235 = function() --[[ Line: 1138 ]]
                -- upvalues: l_matcherHint_0 (ref), v233 (copy), l_printExpected_0 (ref), v232 (copy), l_stringify_0 (ref), v231 (copy), l_printReceived_0 (ref)
                local v236 = l_matcherHint_0("toMatchInstance", nil, nil, v233) .. "\n\n" .. string.format("Expected: never %s", l_printExpected_0(v232));
                if l_stringify_0(v232) ~= l_stringify_0(v231) then
                    return v236 .. string.format("\nReceived:       %s", l_printReceived_0(v231));
                else
                    return v236;
                end;
            end;
        else
            local v237, v238 = l_getInstanceSubset_0(v231, v232);
            v235 = function() --[[ Line: 1149 ]]
                -- upvalues: l_matcherHint_0 (ref), v233 (copy), l_printDiffOrStringify_0 (ref), v238 (copy), v237 (copy), v230 (copy)
                return l_matcherHint_0("toMatchInstance", nil, nil, v233) .. "\n\n" .. l_printDiffOrStringify_0(v238, v237, "Expected", "Received", not not v230.expand);
            end;
        end;
        return {
            message = v235, 
            pass = v234
        };
    end
};