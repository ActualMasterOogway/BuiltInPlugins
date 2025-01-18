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
local l_format_0 = require(l_Parent_1.PrettyFormat).format;
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
local _ = require(l_Parent_0.types);
local v39 = require(l_Parent_0.utils);
local l_deserializeString_0 = v39.deserializeString;
local l_minify_0 = v39.minify;
local l_serialize_0 = v39.serialize;
local function v45(v43) --[[ Line: 75 ]] --[[ Name: getSnapshotColorForChalkInstance ]]
    -- upvalues: l_aForeground3_0 (copy), l_aBackground3_0 (copy), l_aForeground2_0 (copy), l_aBackground2_0 (copy), v7 (copy)
    local l_level_0 = v43.level;
    if l_level_0 == 3 then
        return v43.rgb(l_aForeground3_0[1], l_aForeground3_0[2], l_aForeground3_0[3]) .. v43.bgRgb(l_aBackground3_0[1], l_aBackground3_0[2], l_aBackground3_0[3]);
    elseif l_level_0 == 2 then
        return v43.ansi256(l_aForeground2_0) .. v43.bgAnsi256(l_aBackground2_0);
    else
        return v43.magenta .. v7.bgYellowBright;
    end;
end;
local function v48(v46) --[[ Line: 93 ]] --[[ Name: getReceivedColorForChalkInstance ]]
    -- upvalues: l_bForeground3_0 (copy), l_bBackground3_0 (copy), l_bForeground2_0 (copy), l_bBackground2_0 (copy), v7 (copy)
    local l_level_1 = v46.level;
    if l_level_1 == 3 then
        return v46.rgb(l_bForeground3_0[1], l_bForeground3_0[2], l_bForeground3_0[3]) .. v46.bgRgb(l_bBackground3_0[1], l_bBackground3_0[2], l_bBackground3_0[3]);
    elseif l_level_1 == 2 then
        return v46.ansi256(l_bForeground2_0) .. v46.bgAnsi256(l_bBackground2_0);
    else
        return v46.cyan .. v7.bgWhiteBright;
    end;
end;
local v49 = v45(v7);
local v50 = v48(v7);
local function v52(v51) --[[ Line: 113 ]] --[[ Name: noColor ]]
    return v51;
end;
local function v62(v53, v54) --[[ Line: 121 ]] --[[ Name: matcherHintFromConfig ]]
    -- upvalues: v50 (copy), v52 (copy), l_BOLD_WEIGHT_0 (copy), v49 (copy), l_matcherHint_0 (copy)
    local l_context_0 = v53.context;
    local l_hint_0 = v53.hint;
    local l_inlineSnapshot_0 = v53.inlineSnapshot;
    local l_matcherName_0 = v53.matcherName;
    local l_properties_0 = v53.properties;
    local v60 = {
        isNot = l_context_0.isNot, 
        promise = l_context_0.promise
    };
    if v54 then
        v60.receivedColor = v50;
    end;
    local v61 = "";
    if typeof(l_properties_0) == "table" then
        v61 = "properties";
        if v54 then
            v60.expectedColor = v52;
        end;
        if typeof(l_hint_0) == "string" and #l_hint_0 ~= 0 then
            v60.secondArgument = "hint";
            v60.secondArgumentColor = l_BOLD_WEIGHT_0;
        elseif typeof(l_inlineSnapshot_0) == "string" then
            v60.secondArgument = "snapshot";
            if v54 then
                v60.secondArgumentColor = v49;
            else
                v60.secondArgumentColor = v52;
            end;
        end;
    elseif typeof(l_hint_0) == "string" and #l_hint_0 ~= 0 then
        v61 = "hint";
        v60.expectedColor = l_BOLD_WEIGHT_0;
    elseif typeof(l_inlineSnapshot_0) == "string" then
        v61 = "snapshot";
        if v54 then
            v60.expectedColor = v49;
        end;
    end;
    return l_matcherHint_0(l_matcherName_0, nil, v61, v60);
end;
local function _(v63, v64, v65) --[[ Line: 175 ]] --[[ Name: joinDiffs ]]
    -- upvalues: l_Array_0 (copy), l_DIFF_EQUAL_0 (copy), l_INVERTED_COLOR_0 (copy)
    return l_Array_0.reduce(v63, function(v66, v67) --[[ Line: 184 ]]
        -- upvalues: l_DIFF_EQUAL_0 (ref), v64 (copy), v65 (copy), l_INVERTED_COLOR_0 (ref)
        local l_v66_0 = v66;
        if v67[1] == l_DIFF_EQUAL_0 then
            return v66 .. v67[2];
        else
            if v67[1] == v64 then
                if v65 then
                    return l_v66_0 .. l_INVERTED_COLOR_0(v67[2]);
                else
                    l_v66_0 = l_v66_0 .. v67[2];
                end;
            end;
            return l_v66_0;
        end;
    end, "");
end;
local function v72(v70) --[[ Line: 203 ]] --[[ Name: isLineDiffable ]]
    -- upvalues: l_getType_0 (copy), l_isPrimitive_0 (copy), l_instanceof_0 (copy), l_Error_0 (copy)
    local v71 = l_getType_0(v70);
    if l_isPrimitive_0(v70) then
        return typeof(v70) == "string";
    elseif v71 == "DateTime" or v71 == "function" or v71 == "regexp" then
        return false;
    elseif l_instanceof_0(v70, l_Error_0) then
        return false;
    elseif v71 == "table" and typeof(v70.asymmetricMatch) == "function" then
        return false;
    else
        return true;
    end;
end;
return {
    getSnapshotColorForChalkInstance = v45, 
    getReceivedColorForChalkInstance = v48, 
    aSnapshotColor = v49, 
    bReceivedColor = v50, 
    noColor = v52, 
    HINT_ARG = "hint", 
    SNAPSHOT_ARG = "snapshot", 
    PROPERTIES_ARG = "properties", 
    matcherHintFromConfig = v62, 
    printExpected = function(v73) --[[ Line: 226 ]] --[[ Name: printExpected ]]
        -- upvalues: l_EXPECTED_COLOR_0 (copy), l_minify_0 (copy)
        return l_EXPECTED_COLOR_0(l_minify_0(v73));
    end, 
    printReceived = function(v74) --[[ Line: 230 ]] --[[ Name: printReceived ]]
        -- upvalues: l_RECEIVED_COLOR_0 (copy), l_minify_0 (copy)
        return l_RECEIVED_COLOR_0(l_minify_0(v74));
    end, 
    printPropertiesAndReceived = function(v75, v76, v77) --[[ Line: 234 ]] --[[ Name: printPropertiesAndReceived ]]
        -- upvalues: v72 (copy), l_diffLinesUnified_0 (copy), l_serialize_0 (copy), l_getObjectSubset_0 (copy), l_EXPECTED_COLOR_0 (copy), l_RECEIVED_COLOR_0 (copy), v7 (copy), l_getLabelPrinter_0 (copy), l_minify_0 (copy)
        if v72(v75) and v72(v76) then
            return l_diffLinesUnified_0(l_serialize_0(v75):split("\n"), l_serialize_0(l_getObjectSubset_0(v76, v75)):split("\n"), {
                aAnnotation = "Expected properties", 
                aColor = l_EXPECTED_COLOR_0, 
                bAnnotation = "Received value", 
                bColor = l_RECEIVED_COLOR_0, 
                changeLineTrailingSpaceColor = v7.bgYellow, 
                commonLineTrailingSpaceColor = v7.bgYellow, 
                emptyFirstOrLastLinePlaceholder = utf8.char(8629), 
                expand = v77, 
                includeChangeCounts = true
            });
        else
            local v78 = l_getLabelPrinter_0("Expected properties", "Received value");
            return v78("Expected properties") .. l_EXPECTED_COLOR_0(l_minify_0(v75)) .. "\n" .. v78("Received value") .. l_RECEIVED_COLOR_0(l_minify_0(v76));
        end;
    end, 
    printSnapshotAndReceived = function(v79, v80, v81, v82) --[[ Line: 271 ]] --[[ Name: printSnapshotAndReceived ]]
        -- upvalues: v49 (copy), v50 (copy), v52 (copy), v7 (copy), l_String_0 (copy), l_format_0 (copy), l_diffStringsRaw_0 (copy), l_Array_0 (copy), l_DIFF_EQUAL_0 (copy), l_DIFF_DELETE_0 (copy), l_INVERTED_COLOR_0 (copy), l_DIFF_INSERT_0 (copy), l_getLabelPrinter_0 (copy), l_deserializeString_0 (copy), l_diffStringsUnified_0 (copy), l_diffLinesUnified_0 (copy), v72 (copy), l_serialize_0 (copy), v37 (copy), l_diffLinesUnified2_0 (copy)
        local l_v49_0 = v49;
        local l_v50_0 = v50;
        local v85 = {
            aAnnotation = "Snapshot", 
            aColor = l_v49_0, 
            bAnnotation = "Received", 
            bColor = l_v50_0, 
            changeLineTrailingSpaceColor = v52, 
            commonLineTrailingSpaceColor = v7.bgYellow, 
            emptyFirstOrLastLinePlaceholder = utf8.char(8629), 
            expand = v82, 
            includeChangeCounts = true
        };
        if typeof(v81) == "string" then
            if #v79 >= 2 and l_String_0.startsWith(v79, "\"") and l_String_0.endsWith(v79, "\"") and v80 == l_format_0(v81) then
                if not v79:find("\n") and not v80:find("\n") then
                    local l_v79_0 = v79;
                    local l_v80_0 = v80;
                    if #v79 - 2 <= 20000 and #v80 - 2 <= 20000 then
                        local v88 = l_diffStringsRaw_0(string.sub(v79, 2, -2), string.sub(v80, 2, -2), true);
                        local v90 = l_Array_0.some(v88, function(v89) --[[ Line: 306 ]]
                            -- upvalues: l_DIFF_EQUAL_0 (ref)
                            return v89[1] == l_DIFF_EQUAL_0;
                        end);
                        local v91 = "\"";
                        local l_l_DIFF_DELETE_0_0 = l_DIFF_DELETE_0;
                        local l_l_l_DIFF_DELETE_0_0_0 = l_l_DIFF_DELETE_0_0 --[[ copy: 14 -> 15 ]];
                        l_v79_0 = v91 .. l_Array_0.reduce(v88, function(v94, v95) --[[ Line: 184 ]]
                            -- upvalues: l_DIFF_EQUAL_0 (ref), l_l_l_DIFF_DELETE_0_0_0 (copy), v90 (copy), l_INVERTED_COLOR_0 (ref)
                            local l_v94_0 = v94;
                            if v95[1] == l_DIFF_EQUAL_0 then
                                return v94 .. v95[2];
                            else
                                if v95[1] == l_l_l_DIFF_DELETE_0_0_0 then
                                    if v90 then
                                        return l_v94_0 .. l_INVERTED_COLOR_0(v95[2]);
                                    else
                                        l_v94_0 = l_v94_0 .. v95[2];
                                    end;
                                end;
                                return l_v94_0;
                            end;
                        end, "") .. "\"";
                        v91 = "\"";
                        l_l_DIFF_DELETE_0_0 = l_DIFF_INSERT_0;
                        l_v80_0 = v91 .. l_Array_0.reduce(v88, function(v97, v98) --[[ Line: 184 ]]
                            -- upvalues: l_DIFF_EQUAL_0 (ref), l_l_DIFF_DELETE_0_0 (copy), v90 (copy), l_INVERTED_COLOR_0 (ref)
                            local l_v97_0 = v97;
                            if v98[1] == l_DIFF_EQUAL_0 then
                                return v97 .. v98[2];
                            else
                                if v98[1] == l_l_DIFF_DELETE_0_0 then
                                    if v90 then
                                        return l_v97_0 .. l_INVERTED_COLOR_0(v98[2]);
                                    else
                                        l_v97_0 = l_v97_0 .. v98[2];
                                    end;
                                end;
                                return l_v97_0;
                            end;
                        end, "") .. "\"";
                    end;
                    local v100 = l_getLabelPrinter_0("Snapshot", "Received");
                    return v100("Snapshot") .. l_v49_0(l_v79_0) .. "\n" .. v100("Received") .. l_v50_0(l_v80_0);
                else
                    v79 = l_deserializeString_0(v79);
                    v80 = v81;
                end;
            end;
            if #v79 <= 20000 and #v80 <= 20000 then
                return l_diffStringsUnified_0(v79, v80, v85);
            else
                return l_diffLinesUnified_0(v79:split("\n"), v80:split("\n"), v85);
            end;
        elseif v72(v81) then
            local v101 = v79:split("\n");
            local v102 = v80:split("\n");
            local v103 = l_serialize_0(v81, 0);
            if v103 ~= v80 then
                local v104 = v37(v101);
                if v104 ~= nil then
                    local v105 = v103:split("\n");
                    return l_diffLinesUnified2_0(v101, v102, v104, v105, v85);
                end;
            end;
            return l_diffLinesUnified_0(v101, v102, v85);
        else
            local v106 = l_getLabelPrinter_0("Snapshot", "Received");
            return v106("Snapshot") .. l_v49_0(v79) .. "\n" .. v106("Received") .. l_v50_0(v80);
        end;
    end
};