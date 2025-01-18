local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local l_querySelectorAll_0 = require(script.Parent.Parent.jsHelpers.querySelectors).querySelectorAll;
local v3 = {};
local l_wrapAllByQueryWithSuggestion_0 = require(script.Parent.Parent["query-helpers"]).wrapAllByQueryWithSuggestion;
local l_checkContainerType_0 = require(script.Parent.Parent.helpers).checkContainerType;
local _ = require(script.Parent.Parent.types);
local v7 = require(script.Parent["all-utils"]);
local _ = v7.getNodeText;
local l_matches_0 = v7.matches;
local l_fuzzyMatches_0 = v7.fuzzyMatches;
local l_makeNormalizer_0 = v7.makeNormalizer;
local l_buildQueries_0 = v7.buildQueries;
local v13 = nil;
v13 = function(v14, v15, v16) --[[ Line: 27 ]] --[[ Name: queryAllByDisplayValue ]]
    -- upvalues: l_checkContainerType_0 (copy), l_matches_0 (copy), l_fuzzyMatches_0 (copy), l_makeNormalizer_0 (copy), l_Array_0 (copy), l_querySelectorAll_0 (copy)
    local v17 = if v16 == nil then {} else v16;
    local v18 = v17.exact == nil or v17.exact;
    local l_collapseWhitespace_0 = v17.collapseWhitespace;
    local l_trim_0 = v17.trim;
    local l_normalizer_0 = v17.normalizer;
    l_checkContainerType_0(v14);
    local v22 = if v18 then l_matches_0 else l_fuzzyMatches_0;
    local v23 = l_makeNormalizer_0({
        collapseWhitespace = l_collapseWhitespace_0, 
        trim = l_trim_0, 
        normalizer = l_normalizer_0
    });
    return l_Array_0.filter(l_querySelectorAll_0(v14, {
        "TextBox"
    }), function(v24) --[[ Line: 39 ]]
        -- upvalues: v22 (copy), v15 (copy), v23 (copy)
        return v22(v24.Text, v24, v15, v23);
    end);
end;
local v25 = nil;
v25 = function(_, v27) --[[ Line: 59 ]] --[[ Name: getMultipleError ]]
    return ("Found multiple elements with the display value: %s."):format((tostring(v27)));
end;
local v28 = nil;
v28 = function(_, v30) --[[ Line: 64 ]] --[[ Name: getMissingError ]]
    return ("Unable to find an element with the display value: %s."):format((tostring(v30)));
end;
local v31 = l_wrapAllByQueryWithSuggestion_0(v13, debug.info(v13, "n"), "queryAll");
local v32, v33, v34, v35, v36 = l_buildQueries_0(v13, v25, v28);
v3.queryByDisplayValue = v32;
v3.queryAllByDisplayValue = v31;
v3.getByDisplayValue = v34;
v3.getAllByDisplayValue = v33;
v3.findAllByDisplayValue = v35;
v3.findByDisplayValue = v36;
return v3;