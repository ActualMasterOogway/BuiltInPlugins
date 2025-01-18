local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_Number_0 = v2.Number;
local l_Object_0 = v2.Object;
local l_instanceof_0 = v2.instanceof;
local _ = require(l_Parent_1.RegExp);
local v9 = require(l_Parent_1.JestGetType);
local l_getType_0 = v9.getType;
local l_isPrimitive_0 = v9.isPrimitive;
local v12 = require(l_Parent_1.JestMatcherUtils);
local l_DIM_COLOR_0 = v12.DIM_COLOR;
local l_EXPECTED_COLOR_0 = v12.EXPECTED_COLOR;
local l_RECEIVED_COLOR_0 = v12.RECEIVED_COLOR;
local l_SUGGEST_TO_CONTAIN_EQUAL_0 = v12.SUGGEST_TO_CONTAIN_EQUAL;
local l_ensureExpectedIsNonNegativeInteger_0 = v12.ensureExpectedIsNonNegativeInteger;
local l_ensureNoExpected_0 = v12.ensureNoExpected;
local l_ensureNumbers_0 = v12.ensureNumbers;
local l_getLabelPrinter_0 = v12.getLabelPrinter;
local l_matcherErrorMessage_0 = v12.matcherErrorMessage;
local l_matcherHint_0 = v12.matcherHint;
local l_printDiffOrStringify_0 = v12.printDiffOrStringify;
local l_printExpected_0 = v12.printExpected;
local l_printReceived_0 = v12.printReceived;
local l_printWithType_0 = v12.printWithType;
local l_stringify_0 = v12.stringify;
local l_equals_0 = require(l_Parent_0.jasmineUtils).equals;
local v29 = require(l_Parent_0.print);
local l_printCloseTo_0 = v29.printCloseTo;
local l_printExpectedConstructorName_0 = v29.printExpectedConstructorName;
local l_printExpectedConstructorNameNot_0 = v29.printExpectedConstructorNameNot;
local l_printReceivedArrayContainExpectedItem_0 = v29.printReceivedArrayContainExpectedItem;
local l_printReceivedConstructorName_0 = v29.printReceivedConstructorName;
local l_printReceivedConstructorNameNot_0 = v29.printReceivedConstructorNameNot;
local l_printReceivedStringContainExpectedResult_0 = v29.printReceivedStringContainExpectedResult;
local l_printReceivedStringContainExpectedSubstring_0 = v29.printReceivedStringContainExpectedSubstring;
local _ = require(l_Parent_0.types);
local v39 = require(l_Parent_0.utils);
local l_getObjectSubset_0 = v39.getObjectSubset;
local l_getPath_0 = v39.getPath;
local l_iterableEquality_0 = v39.iterableEquality;
local l_pathAsArray_0 = v39.pathAsArray;
local l_subsetEquality_0 = v39.subsetEquality;
local l_typeEquality_0 = v39.typeEquality;
local v46 = require(l_Parent_1.RobloxShared);
local l_instanceSubsetEquality_0 = v46.RobloxInstance.instanceSubsetEquality;
local l_getInstanceSubset_0 = v46.RobloxInstance.getInstanceSubset;
local function _(v49) --[[ Line: 85 ]] --[[ Name: isExpand ]]
    return not not v49;
end;
local v51 = {
    l_typeEquality_0
};
local function v60(v52, v53, v54) --[[ Line: 106 ]] --[[ Name: toBe ]]
    -- upvalues: l_Object_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_equals_0 (copy), l_iterableEquality_0 (copy), l_DIM_COLOR_0 (copy), l_printDiffOrStringify_0 (copy)
    local v55 = {
        comment = "Object.is equality", 
        isNot = v52.isNot, 
        promise = v52.promise
    };
    local v56 = l_Object_0.is(v53, v54);
    local v57 = nil;
    v57 = v56 and function() --[[ Line: 123 ]]
        -- upvalues: l_matcherHint_0 (ref), v55 (copy), l_printExpected_0 (ref), v54 (copy)
        return l_matcherHint_0("toBe", nil, nil, v55) .. "\n\n" .. string.format("Expected: never %s", l_printExpected_0(v54));
    end or function() --[[ Line: 129 ]]
        -- upvalues: l_equals_0 (ref), v53 (copy), v54 (copy), l_iterableEquality_0 (ref), l_matcherHint_0 (ref), v55 (copy), l_DIM_COLOR_0 (ref), l_printDiffOrStringify_0 (ref), v52 (copy)
        local v58 = nil;
        if l_equals_0(v53, v54, {
            l_iterableEquality_0
        }) then
            v58 = "toEqual";
        end;
        local v59 = l_matcherHint_0("toBe", nil, nil, v55) .. "\n\n";
        if v58 ~= nil then
            v59 = v59 .. l_DIM_COLOR_0(string.format("If it should pass with deep equality, replace \"%s\" with \"%s\"", "toBe", v58)) .. "\n\n";
        end;
        return v59 .. l_printDiffOrStringify_0(v54, v53, "Expected", "Received", not not v52.expand);
    end;
    return {
        actual = v53, 
        expected = v54, 
        message = v57, 
        name = "toBe", 
        pass = v56
    };
end;
local function v74(v61, v62, v63, v64) --[[ Line: 164 ]] --[[ Name: toBeCloseTo ]]
    -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printWithType_0 (copy), l_printExpected_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printReceived_0 (copy), l_printCloseTo_0 (copy)
    local v65 = nil;
    if v64 then
        v65 = "precision";
    else
        v64 = 2;
    end;
    local l_isNot_0 = v61.isNot;
    local v68 = {
        isNot = l_isNot_0, 
        promise = v61.promise, 
        secondArgument = v65, 
        secondArgumentColor = function(v67) --[[ Line: 184 ]] --[[ Name: secondArgumentColor ]]
            return v67;
        end
    };
    if typeof(v63) ~= "number" then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toBeCloseTo", nil, nil, v68), string.format("%s value must be a number", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v63, l_printExpected_0))));
    end;
    if typeof(v62) ~= "number" then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toBeCloseTo", nil, nil, v68), string.format("%s value must be a number", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v62, l_printReceived_0))));
    end;
    local v69 = false;
    local v70 = 0;
    local v71 = 0;
    if v62 == 1e999 and v63 == 1e999 then
        v69 = true;
    elseif v62 == -1e999 and v63 == -1e999 then
        v69 = true;
    else
        v70 = 10 ^ (-v64) / 2;
        v71 = math.abs(v63 - v62);
        v69 = v71 < v70;
    end;
    local _ = nil;
    return {
        message = v69 and function() --[[ Line: 229 ]]
            -- upvalues: l_matcherHint_0 (ref), v68 (copy), l_printExpected_0 (ref), v63 (copy), v71 (ref), l_printReceived_0 (ref), v62 (copy), l_printCloseTo_0 (ref), v70 (ref), v64 (ref), l_isNot_0 (copy)
            local v73 = l_matcherHint_0("toBeCloseTo", nil, nil, v68) .. "\n\n" .. string.format("Expected: never %s\n", l_printExpected_0(v63));
            if v71 == 0 then
                return v73;
            else
                return v73 .. string.format("Received:       %s\n", l_printReceived_0(v62)) .. "\n" .. l_printCloseTo_0(v71, v70, v64, l_isNot_0);
            end;
        end or function() --[[ Line: 242 ]]
            -- upvalues: l_matcherHint_0 (ref), v68 (copy), l_printExpected_0 (ref), v63 (copy), l_printReceived_0 (ref), v62 (copy), l_printCloseTo_0 (ref), v71 (ref), v70 (ref), v64 (ref), l_isNot_0 (copy)
            return l_matcherHint_0("toBeCloseTo", nil, nil, v68) .. "\n\n" .. string.format("Expected: %s\n", l_printExpected_0(v63)) .. string.format("Received: %s\n", l_printReceived_0(v62)) .. "\n" .. l_printCloseTo_0(v71, v70, v64, l_isNot_0);
        end, 
        pass = v69
    };
end;
local function v80(v75, v76, v77) --[[ Line: 256 ]] --[[ Name: toBeDefined ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
    local v78 = {
        isNot = v75.isNot, 
        promise = v75.promise
    };
    l_ensureNoExpected_0(v77, "toBeDefined", v78);
    local v79 = v76 ~= nil;
    return {
        message = function() --[[ Line: 271 ]]
            -- upvalues: l_matcherHint_0 (ref), v78 (copy), l_printReceived_0 (ref), v76 (copy)
            return l_matcherHint_0("toBeDefined", nil, "", v78) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v76));
        end, 
        pass = v79
    };
end;
local function v86(v81, v82, v83) --[[ Line: 281 ]] --[[ Name: toBeFalsy ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
    local v84 = {
        isNot = v81.isNot, 
        promise = v81.promise
    };
    l_ensureNoExpected_0(v83, "toBeFalsy", v84);
    local v85 = not v82;
    return {
        message = function() --[[ Line: 296 ]]
            -- upvalues: l_matcherHint_0 (ref), v84 (copy), l_printReceived_0 (ref), v82 (copy)
            return l_matcherHint_0("toBeFalsy", nil, "", v84) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v82));
        end, 
        pass = v85
    };
end;
local function v93(v87, v88, v89) --[[ Line: 305 ]] --[[ Name: toBeGreaterThan ]]
    -- upvalues: l_ensureNumbers_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local l_isNot_1 = v87.isNot;
    local v91 = {
        isNot = l_isNot_1, 
        promise = v87.promise
    };
    l_ensureNumbers_0(v88, v89, "toBeGreaterThan", v91);
    local v92 = v89 < v88;
    return {
        message = function() --[[ Line: 321 ]]
            -- upvalues: l_matcherHint_0 (ref), v91 (copy), l_isNot_1 (copy), l_printExpected_0 (ref), v89 (copy), l_printReceived_0 (ref), v88 (copy)
            return l_matcherHint_0("toBeGreaterThan", nil, nil, v91) .. "\n\n" .. string.format("Expected:%s > %s\n", l_isNot_1 and " never" or "", l_printExpected_0(v89)) .. string.format("Received:%s   %s", l_isNot_1 and "      " or "", l_printReceived_0(v88));
        end, 
        pass = v92
    };
end;
local function v100(v94, v95, v96) --[[ Line: 331 ]] --[[ Name: toBeGreaterThanOrEqual ]]
    -- upvalues: l_ensureNumbers_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local l_isNot_2 = v94.isNot;
    local v98 = {
        isNot = l_isNot_2, 
        promise = v94.promise
    };
    l_ensureNumbers_0(v95, v96, "toBeGreaterThanOrEqual", v98);
    local v99 = v96 <= v95;
    return {
        message = function() --[[ Line: 347 ]]
            -- upvalues: l_matcherHint_0 (ref), v98 (copy), l_isNot_2 (copy), l_printExpected_0 (ref), v96 (copy), l_printReceived_0 (ref), v95 (copy)
            return l_matcherHint_0("toBeGreaterThanOrEqual", nil, nil, v98) .. "\n\n" .. string.format("Expected:%s >= %s\n", l_isNot_2 and " never" or "", l_printExpected_0(v96)) .. string.format("Received:%s    %s", l_isNot_2 and "      " or "", l_printReceived_0(v95));
        end, 
        pass = v99
    };
end;
local function v110(v101, v102, v103) --[[ Line: 358 ]] --[[ Name: toBeInstanceOf ]]
    -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printWithType_0 (copy), l_printExpected_0 (copy), l_instanceof_0 (copy), l_printExpectedConstructorNameNot_0 (copy), l_printReceivedConstructorNameNot_0 (copy), l_printExpectedConstructorName_0 (copy), l_isPrimitive_0 (copy), l_printReceived_0 (copy), l_printReceivedConstructorName_0 (copy)
    local v104 = {
        isNot = v101.isNot, 
        promise = v101.promise
    };
    if typeof(v103) ~= "table" then
        error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toBeInstanceOf", nil, nil, v104), string.format("%s value must be a prototype class", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v103, l_printExpected_0))));
    end;
    local v105 = l_instanceof_0(v102, v103);
    local v106 = nil;
    if typeof((getmetatable(v102))) == "table" and typeof(getmetatable(v102).__index) == "table" then
        v106 = getmetatable(v102).__index;
    end;
    local _ = nil;
    return {
        message = v105 and function() --[[ Line: 391 ]]
            -- upvalues: l_matcherHint_0 (ref), v104 (copy), l_printExpectedConstructorNameNot_0 (ref), v103 (copy), v106 (ref), l_printReceivedConstructorNameNot_0 (ref)
            local v108 = l_matcherHint_0("toBeInstanceOf", nil, nil, v104) .. "\n\n" .. l_printExpectedConstructorNameNot_0("Expected constructor", v103);
            if v106 and v106 ~= v103 then
                v108 = v108 .. l_printReceivedConstructorNameNot_0("Received constructor", v106, v103);
            end;
            return v108;
        end or function() --[[ Line: 403 ]]
            -- upvalues: l_matcherHint_0 (ref), v104 (copy), l_printExpectedConstructorName_0 (ref), v103 (copy), l_isPrimitive_0 (ref), v102 (copy), v106 (ref), l_printReceived_0 (ref), l_printReceivedConstructorName_0 (ref)
            local v109 = l_matcherHint_0("toBeInstanceOf", nil, nil, v104) .. "\n\n" .. l_printExpectedConstructorName_0("Expected constructor", v103);
            if l_isPrimitive_0(v102) or v106 == nil then
                return v109 .. string.format("\nReceived value has no prototype\nReceived value: %s", l_printReceived_0(v102));
            else
                return v109 .. l_printReceivedConstructorName_0("Received constructor", v106);
            end;
        end, 
        pass = v105
    };
end;
local function v117(v111, v112, v113) --[[ Line: 421 ]] --[[ Name: toBeLessThan ]]
    -- upvalues: l_ensureNumbers_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local l_isNot_3 = v111.isNot;
    local v115 = {
        isNot = l_isNot_3, 
        promise = v111.promise
    };
    l_ensureNumbers_0(v112, v113, "toBeLessThan", v115);
    local v116 = v112 < v113;
    return {
        message = function() --[[ Line: 437 ]]
            -- upvalues: l_matcherHint_0 (ref), v115 (copy), l_isNot_3 (copy), l_printExpected_0 (ref), v113 (copy), l_printReceived_0 (ref), v112 (copy)
            return l_matcherHint_0("toBeLessThan", nil, nil, v115) .. "\n\n" .. string.format("Expected:%s < %s\n", l_isNot_3 and " never" or "", l_printExpected_0(v113)) .. string.format("Received:%s   %s", l_isNot_3 and "      " or "", l_printReceived_0(v112));
        end, 
        pass = v116
    };
end;
local function v124(v118, v119, v120) --[[ Line: 447 ]] --[[ Name: toBeLessThanOrEqual ]]
    -- upvalues: l_ensureNumbers_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_printReceived_0 (copy)
    local l_isNot_4 = v118.isNot;
    local v122 = {
        isNot = l_isNot_4, 
        promise = v118.promise
    };
    l_ensureNumbers_0(v119, v120, "toBeLessThanOrEqual", v122);
    local v123 = v119 <= v120;
    return {
        message = function() --[[ Line: 463 ]]
            -- upvalues: l_matcherHint_0 (ref), v122 (copy), l_isNot_4 (copy), l_printExpected_0 (ref), v120 (copy), l_printReceived_0 (ref), v119 (copy)
            return l_matcherHint_0("toBeLessThanOrEqual", nil, nil, v122) .. "\n\n" .. string.format("Expected:%s <= %s\n", l_isNot_4 and " never" or "", l_printExpected_0(v120)) .. string.format("Received:%s    %s", l_isNot_4 and "      " or "", l_printReceived_0(v119));
        end, 
        pass = v123
    };
end;
local function v130(v125, v126, v127) --[[ Line: 473 ]] --[[ Name: toBeNan ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_Number_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
    local v128 = {
        isNot = v125.isNot, 
        promise = v125.promise
    };
    l_ensureNoExpected_0(v127, "toBeNan", v128);
    local v129 = l_Number_0.isNaN(v126);
    return {
        message = function() --[[ Line: 488 ]]
            -- upvalues: l_matcherHint_0 (ref), v128 (copy), l_printReceived_0 (ref), v126 (copy)
            return l_matcherHint_0("toBeNan", nil, "", v128) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v126));
        end, 
        pass = v129
    };
end;
local function v136(v131, v132, v133) --[[ Line: 497 ]] --[[ Name: toBeNil ]]
    -- upvalues: l_ensureNoExpected_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
    local v134 = {
        isNot = v131.isNot, 
        promise = v131.promise
    };
    l_ensureNoExpected_0(v133, "toBeNil", v134);
    local v135 = v132 == nil;
    return {
        message = function() --[[ Line: 512 ]]
            -- upvalues: l_matcherHint_0 (ref), v134 (copy), l_printReceived_0 (ref), v132 (copy)
            return l_matcherHint_0("toBeNil", nil, "", v134) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v132));
        end, 
        pass = v135
    };
end;
return {
    toBe = v60, 
    toBeCloseTo = v74, 
    toBeDefined = v80, 
    toBeFalsy = v86, 
    toBeGreaterThan = v93, 
    toBeGreaterThanOrEqual = v100, 
    toBeInstanceOf = v110, 
    toBeLessThan = v117, 
    toBeLessThanOrEqual = v124, 
    toBeNan = v130, 
    toBeNaN = v130, 
    toBeNil = v136, 
    toBeNull = v136, 
    toBeTruthy = function(v137, v138, v139) --[[ Line: 521 ]] --[[ Name: toBeTruthy ]]
        -- upvalues: l_ensureNoExpected_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
        local v140 = {
            isNot = v137.isNot, 
            promise = v137.promise
        };
        l_ensureNoExpected_0(v139, "toBeTruthy", v140);
        local v141 = not not v138;
        return {
            message = function() --[[ Line: 536 ]]
                -- upvalues: l_matcherHint_0 (ref), v140 (copy), l_printReceived_0 (ref), v138 (copy)
                return l_matcherHint_0("toBeTruthy", nil, "", v140) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v138));
            end, 
            pass = v141
        };
    end, 
    toBeUndefined = function(v142, v143, v144) --[[ Line: 546 ]] --[[ Name: toBeUndefined ]]
        -- upvalues: l_ensureNoExpected_0 (copy), l_matcherHint_0 (copy), l_printReceived_0 (copy)
        local v145 = {
            isNot = v142.isNot, 
            promise = v142.promise
        };
        l_ensureNoExpected_0(v144, "toBeUndefined", v145);
        local v146 = v143 == nil;
        return {
            message = function() --[[ Line: 561 ]]
                -- upvalues: l_matcherHint_0 (ref), v145 (copy), l_printReceived_0 (ref), v143 (copy)
                return l_matcherHint_0("toBeUndefined", nil, "", v145) .. "\n\n" .. string.format("Received: %s", l_printReceived_0(v143));
            end, 
            pass = v146
        };
    end, 
    toContain = function(v147, v148, v149) --[[ Line: 570 ]] --[[ Name: toContain ]]
        -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy), l_getLabelPrinter_0 (copy), l_printReceivedStringContainExpectedSubstring_0 (copy), l_Array_0 (copy), l_getType_0 (copy), l_printReceivedArrayContainExpectedItem_0 (copy), l_equals_0 (copy), l_iterableEquality_0 (copy), l_SUGGEST_TO_CONTAIN_EQUAL_0 (copy)
        local l_isNot_5 = v147.isNot;
        local v151 = {
            comment = "string.find or table.find", 
            isNot = l_isNot_5, 
            promise = v147.promise
        };
        if v148 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toContain", nil, nil, v151), string.format("%s value must not be nil", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v148, l_printReceived_0))));
        end;
        if typeof(v148) == "string" then
            local v152 = ("%s value must be a string if %s value is a string"):format(l_EXPECTED_COLOR_0("expected"), l_RECEIVED_COLOR_0("received"));
            if typeof(v149) ~= "string" then
                error(l_Error_0.new(l_matcherErrorMessage_0(l_matcherHint_0("toContain", v148, tostring(v149), v151), v152, tostring(l_printWithType_0("Expected", v149, l_printExpected_0)) .. "\n" .. tostring(l_printWithType_0("Received", v148, l_printReceived_0)))));
            end;
            local v153 = v148:find(tostring(v149), 1, true);
            local v154 = v153 ~= nil;
            return {
                message = function() --[[ Line: 618 ]]
                    -- upvalues: v149 (copy), l_getLabelPrinter_0 (ref), l_matcherHint_0 (ref), v151 (copy), l_isNot_5 (copy), l_printExpected_0 (ref), l_printReceivedStringContainExpectedSubstring_0 (ref), v148 (copy), v153 (copy), l_printReceived_0 (ref)
                    local v155 = string.format("Expected %s", typeof(v149) == "string" and "substring" or "value");
                    local v156 = l_getLabelPrinter_0(v155, "Received string");
                    return l_matcherHint_0("toContain", nil, nil, v151) .. "\n\n" .. string.format("%s%s%s\n", v156(v155), l_isNot_5 and "never " or "", l_printExpected_0(v149)) .. string.format("%s%s%s", v156("Received string"), l_isNot_5 and "      " or "", l_isNot_5 and l_printReceivedStringContainExpectedSubstring_0(v148, v153, #tostring(v149)) or l_printReceived_0(v148));
                end, 
                pass = v154
            };
        else
            local v157 = l_Array_0.from(v148);
            local v158 = table.find(v157, v149);
            local v159 = v158 ~= nil;
            return {
                message = function() --[[ Line: 647 ]]
                    -- upvalues: l_getType_0 (ref), v148 (copy), l_getLabelPrinter_0 (ref), l_matcherHint_0 (ref), v151 (copy), l_isNot_5 (copy), l_printExpected_0 (ref), v149 (copy), l_Array_0 (ref), l_printReceivedArrayContainExpectedItem_0 (ref), v158 (copy), l_printReceived_0 (ref), l_equals_0 (ref), l_iterableEquality_0 (ref), l_SUGGEST_TO_CONTAIN_EQUAL_0 (ref)
                    local v160 = string.format("Received %s", l_getType_0(v148));
                    local v161 = l_getLabelPrinter_0("Expected value", v160);
                    local v162 = l_matcherHint_0("toContain", nil, nil, v151) .. "\n\n" .. string.format("%s%s%s\n", v161("Expected value"), l_isNot_5 and "never " or "", l_printExpected_0(v149)) .. string.format("%s%s", v161(v160), l_isNot_5 and "      " or "");
                    v162 = if l_isNot_5 and l_Array_0.isArray(v148) then v162 .. l_printReceivedArrayContainExpectedItem_0(v148, v158) else v162 .. l_printReceived_0(v148);
                    if not l_isNot_5 and l_Array_0.findIndex(v148, function(v163) --[[ Line: 668 ]]
                        -- upvalues: l_equals_0 (ref), v149 (ref), l_iterableEquality_0 (ref)
                        return l_equals_0(v163, v149, {
                            l_iterableEquality_0
                        });
                    end) ~= -1 then
                        v162 = v162 .. string.format("\n\n%s", l_SUGGEST_TO_CONTAIN_EQUAL_0);
                    end;
                    return v162;
                end, 
                pass = v159
            };
        end;
    end, 
    toContainEqual = function(v164, v165, v166) --[[ Line: 682 ]] --[[ Name: toContainEqual ]]
        -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_Array_0 (copy), l_equals_0 (copy), l_iterableEquality_0 (copy), l_getType_0 (copy), l_getLabelPrinter_0 (copy), l_printExpected_0 (copy), l_printReceivedArrayContainExpectedItem_0 (copy)
        local l_isNot_6 = v164.isNot;
        local v168 = {
            comment = "deep equality", 
            isNot = l_isNot_6, 
            promise = v164.promise
        };
        if v165 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toContainEqual", nil, nil, v168), string.format("%s value must not be nil", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v165, l_printReceived_0))));
        end;
        local v170 = l_Array_0.findIndex(l_Array_0.from(v165), function(v169) --[[ Line: 708 ]]
            -- upvalues: l_equals_0 (ref), v166 (copy), l_iterableEquality_0 (ref)
            return l_equals_0(v169, v166, {
                l_iterableEquality_0
            });
        end);
        local v171 = v170 ~= -1;
        return {
            message = function() --[[ Line: 713 ]]
                -- upvalues: l_getType_0 (ref), v165 (copy), l_getLabelPrinter_0 (ref), l_matcherHint_0 (ref), v168 (copy), l_isNot_6 (copy), l_printExpected_0 (ref), v166 (copy), l_Array_0 (ref), l_printReceivedArrayContainExpectedItem_0 (ref), v170 (copy), l_printReceived_0 (ref)
                local v172 = string.format("Received %s", l_getType_0(v165));
                local v173 = l_getLabelPrinter_0("Expected value", v172);
                local v174 = l_matcherHint_0("toContainEqual", nil, nil, v168) .. "\n\n" .. string.format("%s%s%s\n", v173("Expected value"), l_isNot_6 and "never " or "", l_printExpected_0(v166)) .. string.format("%s%s", v173(v172), l_isNot_6 and "      " or "");
                if l_isNot_6 and l_Array_0.isArray(v165) then
                    return v174 .. l_printReceivedArrayContainExpectedItem_0(v165, v170);
                else
                    return v174 .. l_printReceived_0(v165);
                end;
            end, 
            pass = v171
        };
    end, 
    toEqual = function(v175, v176, v177) --[[ Line: 739 ]] --[[ Name: toEqual ]]
        -- upvalues: l_equals_0 (copy), l_iterableEquality_0 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), l_printReceived_0 (copy), l_printDiffOrStringify_0 (copy)
        local v178 = {
            comment = "deep equality", 
            isNot = v175.isNot, 
            promise = v175.promise
        };
        local v179 = l_equals_0(v176, v177, {
            l_iterableEquality_0
        });
        local v180 = nil;
        v180 = v179 and function() --[[ Line: 756 ]]
            -- upvalues: l_matcherHint_0 (ref), v178 (copy), l_printExpected_0 (ref), v177 (copy), l_stringify_0 (ref), v176 (copy), l_printReceived_0 (ref)
            local v181 = l_matcherHint_0("toEqual", nil, nil, v178) .. "\n\n" .. string.format("Expected: never %s\n", l_printExpected_0(v177));
            if l_stringify_0(v177) ~= l_stringify_0(v176) then
                v181 = v181 .. string.format("Received:       %s", l_printReceived_0(v176));
            end;
            return v181;
        end or function() --[[ Line: 766 ]]
            -- upvalues: l_matcherHint_0 (ref), v178 (copy), l_printDiffOrStringify_0 (ref), v177 (copy), v176 (copy), v175 (copy)
            return l_matcherHint_0("toEqual", nil, nil, v178) .. "\n\n" .. l_printDiffOrStringify_0(v177, v176, "Expected", "Received", not not v175.expand);
        end;
        return {
            actual = v176, 
            expected = v177, 
            message = v180, 
            name = "toEqual", 
            pass = v179
        };
    end, 
    toHaveLength = function(v182, v183, v184) --[[ Line: 779 ]] --[[ Name: toHaveLength ]]
        -- upvalues: l_Array_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_ensureExpectedIsNonNegativeInteger_0 (copy), l_getType_0 (copy), l_getLabelPrinter_0 (copy), l_printExpected_0 (copy)
        local l_isNot_7 = v182.isNot;
        local v186 = {
            isNot = l_isNot_7, 
            promise = v182.promise
        };
        local v187 = false;
        if typeof(v183) == "table" then
            v187 = typeof(v183.length) == "number";
        end;
        if not l_Array_0.isArray(v183) and typeof(v183) ~= "string" and not v187 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveLength", nil, nil, v186), string.format("%s value must have a length property whose value must be a number", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v183, l_printReceived_0))));
        end;
        l_ensureExpectedIsNonNegativeInteger_0(v184, "toHaveLength", v186);
        local v188 = nil;
        local v189 = nil;
        if v183.length ~= nil then
            v189 = v183.length;
            v188 = v189 == v184;
        else
            v189 = #v183;
            v188 = v189 == v184;
        end;
        return {
            message = function() --[[ Line: 822 ]]
                -- upvalues: l_getType_0 (ref), v183 (copy), l_getLabelPrinter_0 (ref), l_matcherHint_0 (ref), v186 (copy), l_isNot_7 (copy), l_printExpected_0 (ref), v184 (copy), l_printReceived_0 (ref), v189 (ref)
                local v190 = string.format("Received %s", l_getType_0(v183));
                local v191 = l_getLabelPrinter_0("Expected length", "Received length", v190);
                local v192 = l_matcherHint_0("toHaveLength", nil, nil, v186) .. "\n\n" .. string.format("%s%s%s\n", v191("Expected length"), l_isNot_7 and "never " or "", l_printExpected_0(v184));
                if not l_isNot_7 then
                    v192 = v192 .. string.format("%s%s\n", v191("Received length"), l_printReceived_0(v189));
                end;
                return v192 .. string.format("%s%s%s", v191(v190), l_isNot_7 and "      " or "", l_printReceived_0(v183));
            end, 
            pass = v188
        };
    end, 
    toHaveProperty = function(v193, v194, v195, v196) --[[ Line: 852 ]] --[[ Name: toHaveProperty ]]
        -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getType_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy), l_pathAsArray_0 (copy), l_getPath_0 (copy), l_equals_0 (copy), l_iterableEquality_0 (copy), l_stringify_0 (copy), l_printDiffOrStringify_0 (copy)
        local v197 = v196 ~= nil;
        local v198 = {
            isNot = v193.isNot, 
            promise = v193.promise, 
            secondArgument = v197 and "value" or ""
        };
        if v194 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveProperty", nil, "path", v198), string.format("%s value must not be nil", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v194, l_printReceived_0))));
        end;
        local v199 = l_getType_0(v195);
        if v199 ~= "string" and v199 ~= "table" then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveProperty", nil, "path", v198), string.format("%s path must be a string or array", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v195, l_printExpected_0))));
        end;
        local v200 = nil;
        v200 = if typeof(v195) == "string" then #l_pathAsArray_0(v195) else #v195;
        if v199 == "table" and v200 == 0 then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toHaveProperty", nil, "path", v198), string.format("%s path must not be an empty array", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v195, l_printExpected_0))));
        end;
        local v201 = l_getPath_0(v194, v195);
        local l_lastTraversedObject_0 = v201.lastTraversedObject;
        local l_hasEndProp_0 = v201.hasEndProp;
        local l_traversedPath_0 = v201.traversedPath;
        local v205 = #l_traversedPath_0 == v200;
        local v206 = nil;
        v206 = if v205 then v201.value else l_lastTraversedObject_0;
        local v207 = nil;
        v207 = if v197 then l_equals_0(v201.value, v196, {
            l_iterableEquality_0
        }) else not not l_hasEndProp_0;
        local _ = nil;
        return {
            message = v207 and function() --[[ Line: 938 ]]
                -- upvalues: l_matcherHint_0 (ref), v198 (copy), v197 (copy), l_printExpected_0 (ref), v195 (copy), v196 (copy), l_stringify_0 (ref), v206 (ref), l_printReceived_0 (ref)
                local v209 = l_matcherHint_0("toHaveProperty", nil, "path", v198) .. "\n\n";
                if v197 then
                    v209 = v209 .. string.format("Expected path: %s\n\n", l_printExpected_0(v195)) .. string.format("Expected value: never %s", l_printExpected_0(v196));
                    if l_stringify_0(v196) ~= l_stringify_0(v206) then
                        return v209 .. string.format("\nReceived value:       %s", l_printReceived_0(v206));
                    else
                        return v209;
                    end;
                else
                    return v209 .. string.format("Expected path: never %s\n\n", l_printExpected_0(v195)) .. string.format("Received value: %s", l_printReceived_0(v206));
                end;
            end or function() --[[ Line: 955 ]]
                -- upvalues: l_matcherHint_0 (ref), v198 (copy), l_printExpected_0 (ref), v195 (copy), v205 (copy), l_printDiffOrStringify_0 (ref), v196 (copy), v206 (ref), v193 (copy), v199 (copy), l_traversedPath_0 (copy), l_printReceived_0 (ref), v197 (copy)
                local v210 = l_matcherHint_0("toHaveProperty", nil, "path", v198) .. "\n\n" .. string.format("Expected path: %s\n", l_printExpected_0(v195));
                if v205 then
                    return v210 .. "\n" .. l_printDiffOrStringify_0(v196, v206, "Expected value", "Received value", not not v193.expand);
                else
                    v210 = v210 .. "Received path: ";
                    v210 = if not (v199 ~= "table") or #l_traversedPath_0 == 0 then v210 .. string.format("%s\n\n", l_printReceived_0(l_traversedPath_0)) else v210 .. string.format("%s\n\n", l_printReceived_0(table.concat(l_traversedPath_0, ".")));
                    if v197 then
                        v210 = v210 .. string.format("Expected value: %s\n", l_printExpected_0(v196));
                    end;
                    return v210 .. string.format("Received value: %s", l_printReceived_0(v206));
                end;
            end, 
            pass = v207
        };
    end, 
    toMatch = function(v211, v212, v213) --[[ Line: 991 ]] --[[ Name: toMatch ]]
        -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_getType_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy), l_printReceivedStringContainExpectedSubstring_0 (copy), l_printReceivedStringContainExpectedResult_0 (copy), l_getLabelPrinter_0 (copy)
        local v214 = {
            isNot = v211.isNot, 
            promise = v211.promise
        };
        if typeof(v212) ~= "string" then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatch", nil, nil, v214), string.format("%s value must be a string", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v212, l_printReceived_0))));
        end;
        if typeof(v213) ~= "string" and l_getType_0(v213) ~= "regexp" then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatch", nil, nil, v214), string.format("%s value must be a string or regular expression", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v213, l_printExpected_0))));
        end;
        local v215 = nil;
        if typeof(v213) == "string" then
            v213 = string.gsub(v213, string.char(27) .. "%[", string.char(27) .. "%%[");
            v215 = v212:find(v213) ~= nil;
        else
            v215 = v213:test(v212);
        end;
        local _ = nil;
        return {
            message = v215 and function() --[[ Line: 1040 ]]
                -- upvalues: l_matcherHint_0 (ref), v214 (copy), l_printExpected_0 (ref), v213 (ref), l_printReceivedStringContainExpectedSubstring_0 (ref), v212 (copy), l_printReceivedStringContainExpectedResult_0 (ref)
                local v217 = l_matcherHint_0("toMatch", nil, nil, v214) .. "\n\n" .. string.format("Expected pattern: never %s\n", l_printExpected_0(v213));
                if typeof(v213) == "string" then
                    return v217 .. string.format("Received string:        %s", l_printReceivedStringContainExpectedSubstring_0(v212, v212:find(v213), #v213));
                else
                    return v217 .. string.format("Received string:        %s", l_printReceivedStringContainExpectedResult_0(v212, v213:exec(v212)));
                end;
            end or function() --[[ Line: 1061 ]]
                -- upvalues: l_getLabelPrinter_0 (ref), l_matcherHint_0 (ref), v214 (copy), l_printExpected_0 (ref), v213 (ref), l_printReceived_0 (ref), v212 (copy)
                local v218 = l_getLabelPrinter_0("Expected pattern", "Received string");
                return l_matcherHint_0("toMatch", nil, nil, v214) .. "\n\n" .. string.format("%s%s\n", v218("Expected pattern"), l_printExpected_0(v213)) .. string.format("%s%s", v218("Received string"), l_printReceived_0(v212));
            end, 
            pass = v215
        };
    end, 
    toMatchObject = function(v219, v220, v221) --[[ Line: 1076 ]] --[[ Name: toMatchObject ]]
        -- upvalues: l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy), l_equals_0 (copy), l_iterableEquality_0 (copy), l_subsetEquality_0 (copy), l_stringify_0 (copy), l_printDiffOrStringify_0 (copy), l_getObjectSubset_0 (copy)
        local v222 = {
            isNot = v219.isNot, 
            promise = v219.promise
        };
        if typeof(v220) ~= "table" or v220 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchObject", nil, nil, v222), string.format("%s value must be a non-nil object", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v220, l_printReceived_0))));
        end;
        if typeof(v221) ~= "table" or v221 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchObject", nil, nil, v222), string.format("%s value must be a non-nil object", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v221, l_printExpected_0))));
        end;
        local v223 = l_equals_0(v220, v221, {
            l_iterableEquality_0, 
            l_subsetEquality_0
        });
        local _ = nil;
        return {
            message = v223 and function() --[[ Line: 1117 ]]
                -- upvalues: l_matcherHint_0 (ref), v222 (copy), l_printExpected_0 (ref), v221 (copy), l_stringify_0 (ref), v220 (copy), l_printReceived_0 (ref)
                local v225 = l_matcherHint_0("toMatchObject", nil, nil, v222) .. "\n\n" .. string.format("Expected: never %s", l_printExpected_0(v221));
                if l_stringify_0(v221) ~= l_stringify_0(v220) then
                    return v225 .. string.format("\nReceived:       %s", l_printReceived_0(v220));
                else
                    return v225;
                end;
            end or function() --[[ Line: 1127 ]]
                -- upvalues: l_matcherHint_0 (ref), v222 (copy), l_printDiffOrStringify_0 (ref), v221 (copy), l_getObjectSubset_0 (ref), v220 (copy), v219 (copy)
                return l_matcherHint_0("toMatchObject", nil, nil, v222) .. "\n\n" .. l_printDiffOrStringify_0(v221, l_getObjectSubset_0(v220, v221), "Expected", "Received", not not v219.expand);
            end, 
            pass = v223
        };
    end, 
    toStrictEqual = function(v226, v227, v228) --[[ Line: 1153 ]] --[[ Name: toStrictEqual ]]
        -- upvalues: l_equals_0 (copy), v51 (copy), l_matcherHint_0 (copy), l_printExpected_0 (copy), l_stringify_0 (copy), l_printReceived_0 (copy), l_printDiffOrStringify_0 (copy)
        local v229 = {
            comment = "deep equality", 
            isNot = v226.isNot, 
            promise = v226.promise
        };
        local v230 = l_equals_0(v227, v228, v51, true);
        local v231 = nil;
        v231 = v230 and function() --[[ Line: 1170 ]]
            -- upvalues: l_matcherHint_0 (ref), v229 (copy), l_printExpected_0 (ref), v228 (copy), l_stringify_0 (ref), v227 (copy), l_printReceived_0 (ref)
            local v232 = l_matcherHint_0("toStrictEqual", nil, nil, v229) .. "\n\n" .. string.format("Expected: not %s\n", l_printExpected_0(v228));
            if l_stringify_0(v228) ~= l_stringify_0(v227) then
                v232 = v232 .. string.format("Received:     %s", l_printReceived_0(v227));
            end;
            return v232;
        end or function() --[[ Line: 1182 ]]
            -- upvalues: l_matcherHint_0 (ref), v229 (copy), l_printDiffOrStringify_0 (ref), v228 (copy), v227 (copy), v226 (copy)
            return l_matcherHint_0("toStrictEqual", nil, nil, v229) .. "\n\n" .. l_printDiffOrStringify_0(v228, v227, "Expected", "Received", not not v226.expand);
        end;
        return {
            actual = v227, 
            expected = v228, 
            message = v231, 
            name = "toStrictEqual", 
            pass = v230
        };
    end, 
    toMatchInstance = function(v233, v234, v235) --[[ Line: 1195 ]] --[[ Name: toMatchInstance ]]
        -- upvalues: l_getType_0 (copy), l_Error_0 (copy), l_matcherErrorMessage_0 (copy), l_matcherHint_0 (copy), l_RECEIVED_COLOR_0 (copy), l_printWithType_0 (copy), l_printReceived_0 (copy), l_EXPECTED_COLOR_0 (copy), l_printExpected_0 (copy), l_equals_0 (copy), l_instanceSubsetEquality_0 (copy), l_stringify_0 (copy), l_getInstanceSubset_0 (copy), l_printDiffOrStringify_0 (copy)
        local v236 = {
            isNot = v233.isNot, 
            promise = v233.promise
        };
        if l_getType_0(v234) ~= "Instance" or v234 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchInstance", nil, nil, v236), string.format("%s value must be a Roblox Instance", l_RECEIVED_COLOR_0("received")), l_printWithType_0("Received", v234, l_printReceived_0))));
        end;
        if typeof(v235) ~= "table" or v235 == nil then
            error(l_Error_0(l_matcherErrorMessage_0(l_matcherHint_0("toMatchInstance", nil, nil, v236), string.format("%s value must be a table", l_EXPECTED_COLOR_0("expected")), l_printWithType_0("Expected", v235, l_printExpected_0))));
        end;
        local v237 = l_equals_0(v234, v235, {
            l_instanceSubsetEquality_0
        });
        local v238 = nil;
        if v237 then
            v238 = function() --[[ Line: 1235 ]]
                -- upvalues: l_matcherHint_0 (ref), v236 (copy), l_printExpected_0 (ref), v235 (copy), l_stringify_0 (ref), v234 (copy), l_printReceived_0 (ref)
                local v239 = l_matcherHint_0("toMatchInstance", nil, nil, v236) .. "\n\n" .. string.format("Expected: never %s", l_printExpected_0(v235));
                if l_stringify_0(v235) ~= l_stringify_0(v234) then
                    return v239 .. string.format("\nReceived:       %s", l_printReceived_0(v234));
                else
                    return v239;
                end;
            end;
        else
            local v240, v241 = l_getInstanceSubset_0(v234, v235);
            v238 = function() --[[ Line: 1246 ]]
                -- upvalues: l_matcherHint_0 (ref), v236 (copy), l_printDiffOrStringify_0 (ref), v241 (copy), v240 (copy), v233 (copy)
                return l_matcherHint_0("toMatchInstance", nil, nil, v236) .. "\n\n" .. l_printDiffOrStringify_0(v241, v240, "Expected", "Received", not not v233.expand);
            end;
        end;
        return {
            message = v238, 
            pass = v237
        };
    end
};