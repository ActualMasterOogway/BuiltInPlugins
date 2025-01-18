local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v2 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v2.Array;
local l_Error_0 = v2.Error;
local l_instanceof_0 = v2.instanceof;
local l_String_0 = v2.String;
local v7 = require(l_Parent_1.ChalkLua);
local l_getObjectSubset_0 = require(l_Parent_1.RobloxShared).expect.getObjectSubset;
local v9 = require(l_Parent_1.JestDiff);
local l_DIFF_DELETE_0 = v9.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v9.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v9.DIFF_INSERT;
local l_diffLinesUnified_0 = v9.diffLinesUnified;
local l_diffLinesUnified2_0 = v9.diffLinesUnified2;
local l_diffStringsRaw_0 = v9.diffStringsRaw;
local l_diffStringsUnified_0 = v9.diffStringsUnified;
local v17 = require(l_Parent_1.JestGetType);
local l_getType_0 = v17.getType;
local l_isPrimitive_0 = v17.isPrimitive;
local v20 = require(l_Parent_1.JestMatcherUtils);
local l_BOLD_WEIGHT_0 = v20.BOLD_WEIGHT;
local l_EXPECTED_COLOR_0 = v20.EXPECTED_COLOR;
local l_INVERTED_COLOR_0 = v20.INVERTED_COLOR;
local l_RECEIVED_COLOR_0 = v20.RECEIVED_COLOR;
local l_getLabelPrinter_0 = v20.getLabelPrinter;
local l_matcherHint_0 = v20.matcherHint;
local l_prettyFormat_0 = require(l_Parent_1.PrettyFormat).prettyFormat;
local v28 = require(l_Parent_0.colors);
local l_aBackground2_0 = v28.aBackground2;
local l_aBackground3_0 = v28.aBackground3;
local l_aForeground2_0 = v28.aForeground2;
local l_aForeground3_0 = v28.aForeground3;
local l_bBackground2_0 = v28.bBackground2;
local l_bBackground3_0 = v28.bBackground3;
local l_bForeground2_0 = v28.bForeground2;
local l_bForeground3_0 = v28.bForeground3;
local v37 = require(l_Parent_0.dedentLines);
local v38 = require(l_Parent_0.utils);
local l_deserializeString_0 = v38.deserializeString;
local l_minify_0 = v38.minify;
local l_serialize_0 = v38.serialize;
local function v44(v42) --[[ Line: 72 ]] --[[ Name: getSnapshotColorForChalkInstance ]]
    -- upvalues: l_aForeground3_0 (copy), l_aBackground3_0 (copy), l_aForeground2_0 (copy), l_aBackground2_0 (copy), v7 (copy)
    local l_level_0 = v42.level;
    if l_level_0 == 3 then
        return v42.rgb(l_aForeground3_0[1], l_aForeground3_0[2], l_aForeground3_0[3]) .. v42.bgRgb(l_aBackground3_0[1], l_aBackground3_0[2], l_aBackground3_0[3]);
    elseif l_level_0 == 2 then
        return v42.ansi256(l_aForeground2_0) .. v42.bgAnsi256(l_aBackground2_0);
    else
        return v42.magenta .. v7.bgYellowBright;
    end;
end;
local function v47(v45) --[[ Line: 89 ]] --[[ Name: getReceivedColorForChalkInstance ]]
    -- upvalues: l_bForeground3_0 (copy), l_bBackground3_0 (copy), l_bForeground2_0 (copy), l_bBackground2_0 (copy), v7 (copy)
    local l_level_1 = v45.level;
    if l_level_1 == 3 then
        return v45.rgb(l_bForeground3_0[1], l_bForeground3_0[2], l_bForeground3_0[3]) .. v45.bgRgb(l_bBackground3_0[1], l_bBackground3_0[2], l_bBackground3_0[3]);
    elseif l_level_1 == 2 then
        return v45.ansi256(l_bForeground2_0) .. v45.bgAnsi256(l_bBackground2_0);
    else
        return v45.cyan .. v7.bgWhiteBright;
    end;
end;
local v48 = v44(v7);
local v49 = v47(v7);
local function v51(v50) --[[ Line: 109 ]] --[[ Name: noColor ]]
    return v50;
end;
local function v61(v52, v53) --[[ Line: 115 ]] --[[ Name: matcherHintFromConfig ]]
    -- upvalues: v49 (copy), v51 (copy), l_BOLD_WEIGHT_0 (copy), v48 (copy), l_matcherHint_0 (copy)
    local l_context_0 = v52.context;
    local l_hint_0 = v52.hint;
    local l_inlineSnapshot_0 = v52.inlineSnapshot;
    local l_matcherName_0 = v52.matcherName;
    local l_properties_0 = v52.properties;
    local v59 = {
        isNot = l_context_0.isNot, 
        promise = l_context_0.promise
    };
    if v53 then
        v59.receivedColor = v49;
    end;
    local v60 = "";
    if typeof(l_properties_0) == "table" then
        v60 = "properties";
        if v53 then
            v59.expectedColor = v51;
        end;
        if typeof(l_hint_0) == "string" and #l_hint_0 ~= 0 then
            v59.secondArgument = "hint";
            v59.secondArgumentColor = l_BOLD_WEIGHT_0;
        elseif typeof(l_inlineSnapshot_0) == "string" then
            v59.secondArgument = "snapshot";
            if v53 then
                v59.secondArgumentColor = v48;
            else
                v59.secondArgumentColor = v51;
            end;
        end;
    elseif typeof(l_hint_0) == "string" and #l_hint_0 ~= 0 then
        v60 = "hint";
        v59.expectedColor = l_BOLD_WEIGHT_0;
    elseif typeof(l_inlineSnapshot_0) == "string" then
        v60 = "snapshot";
        if v53 then
            v59.expectedColor = v48;
        end;
    end;
    return l_matcherHint_0(l_matcherName_0, nil, v60, v59);
end;
local function _(v62, v63, v64) --[[ Line: 172 ]] --[[ Name: joinDiffs ]]
    -- upvalues: l_Array_0 (copy), l_DIFF_EQUAL_0 (copy), l_INVERTED_COLOR_0 (copy)
    return l_Array_0.reduce(v62, function(v65, v66) --[[ Line: 180 ]]
        -- upvalues: l_DIFF_EQUAL_0 (ref), v63 (copy), v64 (copy), l_INVERTED_COLOR_0 (ref)
        local l_v65_0 = v65;
        if v66[1] == l_DIFF_EQUAL_0 then
            return v65 .. v66[2];
        else
            if v66[1] == v63 then
                if v64 then
                    return l_v65_0 .. l_INVERTED_COLOR_0(v66[2]);
                else
                    l_v65_0 = l_v65_0 .. v66[2];
                end;
            end;
            return l_v65_0;
        end;
    end, "");
end;
local function v71(v69) --[[ Line: 199 ]] --[[ Name: isLineDiffable ]]
    -- upvalues: l_getType_0 (copy), l_isPrimitive_0 (copy), l_instanceof_0 (copy), l_Error_0 (copy)
    local v70 = l_getType_0(v69);
    if l_isPrimitive_0(v69) then
        return typeof(v69) == "string";
    elseif v70 == "DateTime" or v70 == "function" or v70 == "regexp" then
        return false;
    elseif l_instanceof_0(v69, l_Error_0) then
        return false;
    elseif v70 == "table" and typeof(v69.asymmetricMatch) == "function" then
        return false;
    else
        return true;
    end;
end;
return {
    getSnapshotColorForChalkInstance = v44, 
    getReceivedColorForChalkInstance = v47, 
    aSnapshotColor = v48, 
    bReceivedColor = v49, 
    noColor = v51, 
    HINT_ARG = "hint", 
    SNAPSHOT_ARG = "snapshot", 
    PROPERTIES_ARG = "properties", 
    matcherHintFromConfig = v61, 
    printExpected = function(v72) --[[ Line: 229 ]] --[[ Name: printExpected ]]
        -- upvalues: l_EXPECTED_COLOR_0 (copy), l_minify_0 (copy)
        return l_EXPECTED_COLOR_0(l_minify_0(v72));
    end, 
    printReceived = function(v73) --[[ Line: 233 ]] --[[ Name: printReceived ]]
        -- upvalues: l_RECEIVED_COLOR_0 (copy), l_minify_0 (copy)
        return l_RECEIVED_COLOR_0(l_minify_0(v73));
    end, 
    printPropertiesAndReceived = function(v74, v75, v76) --[[ Line: 237 ]] --[[ Name: printPropertiesAndReceived ]]
        -- upvalues: v71 (copy), l_diffLinesUnified_0 (copy), l_serialize_0 (copy), l_getObjectSubset_0 (copy), l_EXPECTED_COLOR_0 (copy), l_RECEIVED_COLOR_0 (copy), v7 (copy), l_getLabelPrinter_0 (copy), l_minify_0 (copy)
        if v71(v74) and v71(v75) then
            return l_diffLinesUnified_0(l_serialize_0(v74):split("\n"), l_serialize_0(l_getObjectSubset_0(v75, v74)):split("\n"), {
                aAnnotation = "Expected properties", 
                aColor = l_EXPECTED_COLOR_0, 
                bAnnotation = "Received value", 
                bColor = l_RECEIVED_COLOR_0, 
                changeLineTrailingSpaceColor = v7.bgYellow, 
                commonLineTrailingSpaceColor = v7.bgYellow, 
                emptyFirstOrLastLinePlaceholder = utf8.char(8629), 
                expand = v76, 
                includeChangeCounts = true
            });
        else
            local v77 = l_getLabelPrinter_0("Expected properties", "Received value");
            return v77("Expected properties") .. l_EXPECTED_COLOR_0(l_minify_0(v74)) .. "\n" .. v77("Received value") .. l_RECEIVED_COLOR_0(l_minify_0(v75));
        end;
    end, 
    printSnapshotAndReceived = function(v78, v79, v80, v81) --[[ Line: 273 ]] --[[ Name: printSnapshotAndReceived ]]
        -- upvalues: v48 (copy), v49 (copy), v51 (copy), v7 (copy), l_String_0 (copy), l_prettyFormat_0 (copy), l_diffStringsRaw_0 (copy), l_Array_0 (copy), l_DIFF_EQUAL_0 (copy), l_DIFF_DELETE_0 (copy), l_INVERTED_COLOR_0 (copy), l_DIFF_INSERT_0 (copy), l_getLabelPrinter_0 (copy), l_deserializeString_0 (copy), l_diffStringsUnified_0 (copy), l_diffLinesUnified_0 (copy), v71 (copy), l_serialize_0 (copy), v37 (copy), l_diffLinesUnified2_0 (copy)
        local l_v48_0 = v48;
        local l_v49_0 = v49;
        local v84 = {
            aAnnotation = "Snapshot", 
            aColor = l_v48_0, 
            bAnnotation = "Received", 
            bColor = l_v49_0, 
            changeLineTrailingSpaceColor = v51, 
            commonLineTrailingSpaceColor = v7.bgYellow, 
            emptyFirstOrLastLinePlaceholder = utf8.char(8629), 
            expand = v81, 
            includeChangeCounts = true
        };
        if typeof(v80) == "string" then
            if #v78 >= 2 and l_String_0.startsWith(v78, "\"") and l_String_0.endsWith(v78, "\"") and v79 == l_prettyFormat_0(v80) then
                if not v78:find("\n") and not v79:find("\n") then
                    local l_v78_0 = v78;
                    local l_v79_0 = v79;
                    if #v78 - 2 <= 20000 and #v79 - 2 <= 20000 then
                        local v87 = l_diffStringsRaw_0(string.sub(v78, 2, -2), string.sub(v79, 2, -2), true);
                        local v89 = l_Array_0.some(v87, function(v88) --[[ Line: 315 ]]
                            -- upvalues: l_DIFF_EQUAL_0 (ref)
                            return v88[1] == l_DIFF_EQUAL_0;
                        end);
                        local v90 = "\"";
                        local l_l_DIFF_DELETE_0_0 = l_DIFF_DELETE_0;
                        local l_l_l_DIFF_DELETE_0_0_0 = l_l_DIFF_DELETE_0_0 --[[ copy: 14 -> 15 ]];
                        l_v78_0 = v90 .. l_Array_0.reduce(v87, function(v93, v94) --[[ Line: 180 ]]
                            -- upvalues: l_DIFF_EQUAL_0 (ref), l_l_l_DIFF_DELETE_0_0_0 (copy), v89 (copy), l_INVERTED_COLOR_0 (ref)
                            local l_v93_0 = v93;
                            if v94[1] == l_DIFF_EQUAL_0 then
                                return v93 .. v94[2];
                            else
                                if v94[1] == l_l_l_DIFF_DELETE_0_0_0 then
                                    if v89 then
                                        return l_v93_0 .. l_INVERTED_COLOR_0(v94[2]);
                                    else
                                        l_v93_0 = l_v93_0 .. v94[2];
                                    end;
                                end;
                                return l_v93_0;
                            end;
                        end, "") .. "\"";
                        v90 = "\"";
                        l_l_DIFF_DELETE_0_0 = l_DIFF_INSERT_0;
                        l_v79_0 = v90 .. l_Array_0.reduce(v87, function(v96, v97) --[[ Line: 180 ]]
                            -- upvalues: l_DIFF_EQUAL_0 (ref), l_l_DIFF_DELETE_0_0 (copy), v89 (copy), l_INVERTED_COLOR_0 (ref)
                            local l_v96_0 = v96;
                            if v97[1] == l_DIFF_EQUAL_0 then
                                return v96 .. v97[2];
                            else
                                if v97[1] == l_l_DIFF_DELETE_0_0 then
                                    if v89 then
                                        return l_v96_0 .. l_INVERTED_COLOR_0(v97[2]);
                                    else
                                        l_v96_0 = l_v96_0 .. v97[2];
                                    end;
                                end;
                                return l_v96_0;
                            end;
                        end, "") .. "\"";
                    end;
                    local v99 = l_getLabelPrinter_0("Snapshot", "Received");
                    return v99("Snapshot") .. l_v48_0(l_v78_0) .. "\n" .. v99("Received") .. l_v49_0(l_v79_0);
                else
                    v78 = l_deserializeString_0(v78);
                    v79 = v80;
                end;
            end;
            if #v78 <= 20000 and #v79 <= 20000 then
                return l_diffStringsUnified_0(v78, v79, v84);
            else
                return l_diffLinesUnified_0(v78:split("\n"), v79:split("\n"), v84);
            end;
        elseif v71(v80) then
            local v100 = v78:split("\n");
            local v101 = v79:split("\n");
            local v102 = l_serialize_0(v80, 0);
            if v102 ~= v79 then
                local v103 = v37(v100);
                if v103 ~= nil then
                    local v104 = v102:split("\n");
                    return l_diffLinesUnified2_0(v100, v101, v103, v104, v84);
                end;
            end;
            return l_diffLinesUnified_0(v100, v101, v84);
        else
            local v105 = l_getLabelPrinter_0("Snapshot", "Received");
            return v105("Snapshot") .. l_v48_0(v78) .. "\n" .. v105("Received") .. l_v49_0(v79);
        end;
    end
};