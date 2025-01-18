local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Object_0 = v2.Object;
local l_Symbol_0 = v2.Symbol;
local v5 = require(l_Parent_0.PrettyFormat);
local l_prettyFormat_0 = v5.prettyFormat;
local v7 = require(l_Parent_0.ChalkLua);
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local l_DIFF_DELETE_0 = require(l_script_0.CleanupSemantic).DIFF_DELETE;
local l_DIFF_EQUAL_0 = require(l_script_0.CleanupSemantic).DIFF_EQUAL;
local l_DIFF_INSERT_0 = require(l_script_0.CleanupSemantic).DIFF_INSERT;
local l_Diff_0 = require(l_script_0.CleanupSemantic).Diff;
local l_normalizeDiffOptions_0 = require(l_script_0.NormalizeDiffOptions).normalizeDiffOptions;
local l_diffLinesRaw_0 = require(l_script_0.DiffLines).diffLinesRaw;
local l_diffLinesUnified_0 = require(l_script_0.DiffLines).diffLinesUnified;
local l_diffLinesUnified2_0 = require(l_script_0.DiffLines).diffLinesUnified2;
local l_diffStringsRaw_0 = require(l_script_0.PrintDiffs).diffStringsRaw;
local l_diffStringsUnified_0 = require(l_script_0.PrintDiffs).diffStringsUnified;
local l_NO_DIFF_MESSAGE_0 = require(l_script_0.Constants).NO_DIFF_MESSAGE;
local l_SIMILAR_MESSAGE_0 = require(l_script_0.Constants).SIMILAR_MESSAGE;
local _ = require(l_script_0.types);
local v22 = nil;
local v23 = nil;
local function v26(v24, v25) --[[ Line: 45 ]] --[[ Name: getCommonMessage ]]
    -- upvalues: l_normalizeDiffOptions_0 (copy)
    return l_normalizeDiffOptions_0(v25).commonColor(v24);
end;
local function _(v27) --[[ Line: 51 ]] --[[ Name: tableCopy ]]
    local v28 = {};
    for v29, v30 in pairs(v27) do
        v28[v29] = v30;
    end;
    return v28;
end;
local l_plugins_0 = v5.plugins;
local v33 = {
    l_plugins_0.AsymmetricMatcher, 
    l_plugins_0.RobloxInstance
};
local v34 = {
    plugins = v33
};
local v35 = {};
for v36, v37 in pairs(v34) do
    v35[v36] = v37;
end;
local l_v35_0 = v35;
l_v35_0.indent = 0;
v35 = {
    callToJSON = false, 
    maxDepth = 10, 
    plugins = v33
};
local v39 = {};
for v40, v41 in pairs(v35) do
    v39[v40] = v41;
end;
local l_v39_0 = v39;
l_v39_0.indent = 0;
v39 = function(v43, v44, v45) --[[ Line: 84 ]] --[[ Name: diff ]]
    -- upvalues: l_Object_0 (copy), v26 (copy), l_NO_DIFF_MESSAGE_0 (copy), l_getType_0 (copy), l_Symbol_0 (copy), v7 (copy), l_diffLinesUnified_0 (copy), v22 (ref), v23 (ref)
    if l_Object_0.is(v43, v44) then
        return v26(l_NO_DIFF_MESSAGE_0, v45);
    else
        local v46 = l_getType_0(v43);
        local l_v46_0 = v46;
        local v48 = false;
        if v46 == "table" and l_getType_0(v43.asymmetricMatch) == "function" then
            if v43["$$typeof"] ~= l_Symbol_0.for_("jest.asymmetricMatcher") then
                return nil;
            elseif typeof(v43.getExpectedType) ~= "function" then
                return nil;
            else
                l_v46_0 = v43:getExpectedType();
                v48 = l_v46_0 == "string";
            end;
        end;
        if l_v46_0 ~= l_getType_0(v44) then
            return string.format("  Comparing two different types of values." .. " Expected %s but " .. "received %s.", v7.green(l_v46_0), v7.red(l_getType_0(v44)));
        elseif v48 then
            return nil;
        elseif v46 == "string" then
            return l_diffLinesUnified_0(string.split(v43, "\n"), string.split(v44, "\n"), v45);
        elseif v46 == "boolean" or v46 == "number" then
            return v22(v43, v44, v45);
        else
            return v23(v43, v44, v45);
        end;
    end;
end;
v22 = function(v49, v50, v51) --[[ Line: 132 ]] --[[ Name: comparePrimitive ]]
    -- upvalues: l_prettyFormat_0 (copy), v34 (copy), v26 (copy), l_NO_DIFF_MESSAGE_0 (copy), l_diffLinesUnified_0 (copy)
    local v52 = l_prettyFormat_0(v49, v34);
    local v53 = l_prettyFormat_0(v50, v34);
    if v52 == v53 then
        return v26(l_NO_DIFF_MESSAGE_0, v51);
    else
        return l_diffLinesUnified_0(string.split(v52, "\n"), string.split(v53, "\n"), v51);
    end;
end;
v23 = function(v54, v55, v56) --[[ Line: 147 ]] --[[ Name: compareObjects ]]
    -- upvalues: l_NO_DIFF_MESSAGE_0 (copy), l_normalizeDiffOptions_0 (copy), l_prettyFormat_0 (copy), l_v35_0 (copy), v34 (copy), l_diffLinesUnified2_0 (copy), l_v39_0 (copy), v35 (copy), l_SIMILAR_MESSAGE_0 (copy)
    local v57 = nil;
    local v58 = false;
    local l_l_NO_DIFF_MESSAGE_0_0 = l_NO_DIFF_MESSAGE_0;
    local v60 = l_normalizeDiffOptions_0(v56).commonColor(l_l_NO_DIFF_MESSAGE_0_0);
    local v61;
    l_l_NO_DIFF_MESSAGE_0_0, v61 = pcall(function() --[[ Line: 156 ]]
        -- upvalues: l_prettyFormat_0 (ref), v54 (copy), l_v35_0 (ref), v55 (copy), v57 (ref), v60 (copy), v34 (ref), l_diffLinesUnified2_0 (ref), v56 (copy)
        local v62 = l_prettyFormat_0(v54, l_v35_0);
        local v63 = l_prettyFormat_0(v55, l_v35_0);
        if v62 == v63 then
            v57 = v60;
            return;
        else
            local v64 = l_prettyFormat_0(v54, v34);
            local v65 = l_prettyFormat_0(v55, v34);
            v57 = l_diffLinesUnified2_0(string.split(v64, "\n"), string.split(v65, "\n"), string.split(v62, "\n"), string.split(v63, "\n"), v56);
            return;
        end;
    end);
    if not l_l_NO_DIFF_MESSAGE_0_0 then
        v58 = true;
    end;
    if v57 == nil or v57 == v60 then
        local v66 = l_prettyFormat_0(v54, l_v39_0);
        local v67 = l_prettyFormat_0(v55, l_v39_0);
        if v66 == v67 then
            v57 = v60;
        else
            local v68 = l_prettyFormat_0(v54, v35);
            local v69 = l_prettyFormat_0(v55, v35);
            v57 = l_diffLinesUnified2_0(string.split(v68, "\n"), string.split(v69, "\n"), string.split(v66, "\n"), string.split(v67, "\n"), v56);
        end;
        if v57 ~= v60 and not v58 then
            local l_l_SIMILAR_MESSAGE_0_0 = l_SIMILAR_MESSAGE_0;
            v57 = l_normalizeDiffOptions_0(v56).commonColor(l_l_SIMILAR_MESSAGE_0_0) .. "\n\n" .. v57;
        end;
    end;
    return v57;
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
    diff = v39
};