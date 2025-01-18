local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_String_0 = v2.String;
local l_Symbol_0 = v2.Symbol;
local v6 = require(l_Parent_0.PrettyFormat);
local l_format_0 = v6.format;
local _ = require(l_script_0.PrettyFormat);
local v9 = require(l_Parent_0.ChalkLua);
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local v11 = require(l_script_0.CleanupSemantic);
local l_DIFF_DELETE_0 = v11.DIFF_DELETE;
local l_DIFF_EQUAL_0 = v11.DIFF_EQUAL;
local l_DIFF_INSERT_0 = v11.DIFF_INSERT;
local l_Diff_0 = v11.Diff;
local l_normalizeDiffOptions_0 = require(l_script_0.NormalizeDiffOptions).normalizeDiffOptions;
local l_diffLinesRaw_0 = require(l_script_0.DiffLines).diffLinesRaw;
local l_diffLinesUnified_0 = require(l_script_0.DiffLines).diffLinesUnified;
local l_diffLinesUnified2_0 = require(l_script_0.DiffLines).diffLinesUnified2;
local l_diffStringsRaw_0 = require(l_script_0.PrintDiffs).diffStringsRaw;
local l_diffStringsUnified_0 = require(l_script_0.PrintDiffs).diffStringsUnified;
local _ = require(l_script_0.types);
local l_NO_DIFF_MESSAGE_0 = require(l_script_0.Constants).NO_DIFF_MESSAGE;
local l_SIMILAR_MESSAGE_0 = require(l_script_0.Constants).SIMILAR_MESSAGE;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local function v31(v29, v30) --[[ Line: 59 ]] --[[ Name: getCommonMessage ]]
    -- upvalues: l_normalizeDiffOptions_0 (copy)
    return l_normalizeDiffOptions_0(v30).commonColor(v29);
end;
local l_plugins_0 = v6.plugins;
local v33 = {
    l_plugins_0.AsymmetricMatcher, 
    l_plugins_0.RobloxInstance
};
local v34 = {
    plugins = v33
};
local v35 = {
    callToJSON = false, 
    maxDepth = 10, 
    plugins = v33
};
local function v42(v36, v37, v38) --[[ Line: 85 ]] --[[ Name: diff ]]
    -- upvalues: l_Object_0 (copy), v31 (copy), l_NO_DIFF_MESSAGE_0 (copy), l_getType_0 (copy), l_Symbol_0 (copy), v9 (copy), l_diffLinesUnified_0 (copy), v25 (ref), v26 (ref)
    if l_Object_0.is(v36, v37) then
        return v31(l_NO_DIFF_MESSAGE_0, v38);
    else
        local v39 = l_getType_0(v36);
        local l_v39_0 = v39;
        local v41 = false;
        if v39 == "table" and l_getType_0(v36.asymmetricMatch) == "function" then
            if v36["$$typeof"] ~= l_Symbol_0.for_("jest.asymmetricMatcher") then
                return nil;
            elseif typeof(v36.getExpectedType) ~= "function" then
                return nil;
            else
                l_v39_0 = v36:getExpectedType();
                v41 = l_v39_0 == "string";
            end;
        end;
        if l_v39_0 ~= l_getType_0(v37) then
            return string.format("  Comparing two different types of values." .. " Expected %s but " .. "received %s.", v9.green(l_v39_0), v9.red(l_getType_0(v37)));
        elseif v41 then
            return nil;
        elseif v39 == "string" then
            return l_diffLinesUnified_0(string.split(v36, "\n"), string.split(v37, "\n"), v38);
        elseif v39 == "boolean" or v39 == "number" then
            return v25(v36, v37, v38);
        else
            return v26(v36, v37, v38);
        end;
    end;
end;
v25 = function(v43, v44, v45) --[[ Line: 132 ]] --[[ Name: comparePrimitive ]]
    -- upvalues: l_format_0 (copy), v34 (copy), v31 (copy), l_NO_DIFF_MESSAGE_0 (copy), l_diffLinesUnified_0 (copy)
    local v46 = l_format_0(v43, v34);
    local v47 = l_format_0(v44, v34);
    if v46 == v47 then
        return v31(l_NO_DIFF_MESSAGE_0, v45);
    else
        return l_diffLinesUnified_0(string.split(v46, "\n"), string.split(v47, "\n"), v45);
    end;
end;
v26 = function(v48, v49, v50) --[[ Line: 143 ]] --[[ Name: compareObjects ]]
    -- upvalues: v27 (ref), v34 (copy), v28 (ref), l_NO_DIFF_MESSAGE_0 (copy), l_normalizeDiffOptions_0 (copy), v35 (copy), l_SIMILAR_MESSAGE_0 (copy)
    local v51 = nil;
    local v52 = false;
    local l_status_0, _ = pcall(function() --[[ Line: 147 ]]
        -- upvalues: v27 (ref), v34 (ref), v50 (copy), v51 (ref), v28 (ref), v48 (copy), v49 (copy)
        local v53 = v27(v34, v50);
        v51 = v28(v48, v49, v53, v50);
    end);
    if not l_status_0 then
        v52 = true;
    end;
    local l_l_NO_DIFF_MESSAGE_0_0 = l_NO_DIFF_MESSAGE_0;
    local v57 = l_normalizeDiffOptions_0(v50).commonColor(l_l_NO_DIFF_MESSAGE_0_0);
    if v51 == nil or v51 == v57 then
        l_l_NO_DIFF_MESSAGE_0_0 = v27(v35, v50);
        v51 = v28(v48, v49, l_l_NO_DIFF_MESSAGE_0_0, v50);
        if v51 ~= v57 and not v52 then
            local l_l_SIMILAR_MESSAGE_0_0 = l_SIMILAR_MESSAGE_0;
            v51 = l_normalizeDiffOptions_0(v50).commonColor(l_l_SIMILAR_MESSAGE_0_0) .. "\n\n" .. v51;
        end;
    end;
    return v51;
end;
v27 = function(v59, v60) --[[ Line: 203 ]] --[[ Name: getFormatOptions ]]
    -- upvalues: l_normalizeDiffOptions_0 (copy), l_Object_0 (copy)
    local l_compareKeys_0 = l_normalizeDiffOptions_0(v60).compareKeys;
    return l_Object_0.assign({}, v59, {
        compareKeys = l_compareKeys_0
    });
end;
v28 = function(v62, v63, v64, v65) --[[ Line: 208 ]] --[[ Name: getObjectsDifference ]]
    -- upvalues: l_Object_0 (copy), l_format_0 (copy), v31 (copy), l_NO_DIFF_MESSAGE_0 (copy), l_diffLinesUnified2_0 (copy), l_String_0 (copy)
    local v66 = l_Object_0.assign({}, v64, {
        indent = 0
    });
    local v67 = l_format_0(v62, v66);
    local v68 = l_format_0(v63, v66);
    if v67 == v68 then
        return v31(l_NO_DIFF_MESSAGE_0, v65);
    else
        local v69 = l_format_0(v62, v64);
        local v70 = l_format_0(v63, v64);
        return l_diffLinesUnified2_0(l_String_0.split(v69, "\n"), l_String_0.split(v70, "\n"), l_String_0.split(v67, "\n"), l_String_0.split(v68, "\n"), v65);
    end;
end;
return {
    diffLinesRaw = l_diffLinesRaw_0, 
    diffLinesUnified = l_diffLinesUnified_0, 
    diffLinesUnified2 = l_diffLinesUnified2_0, 
    diffStringsRaw = l_diffStringsRaw_0, 
    diffStringsUnified = l_diffStringsUnified_0, 
    DIFF_DELETE = l_DIFF_DELETE_0, 
    DIFF_EQUAL = l_DIFF_EQUAL_0, 
    DIFF_INSERT = l_DIFF_INSERT_0, 
    Diff = l_Diff_0, 
    diff = v42
};