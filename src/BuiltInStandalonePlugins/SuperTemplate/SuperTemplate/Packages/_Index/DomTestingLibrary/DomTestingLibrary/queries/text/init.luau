local l_Parent_0 = script.Parent.Parent.Parent;
local l_Array_0 = require(l_Parent_0.LuauPolyfill).Array;
local v2 = require(script.Parent.Parent.jsHelpers.querySelectors);
local l_matches_0 = v2.matches;
local l_querySelectorAll_0 = v2.querySelectorAll;
local v5 = {};
local l_wrapAllByQueryWithSuggestion_0 = require(script.Parent.Parent["query-helpers"]).wrapAllByQueryWithSuggestion;
local l_checkContainerType_0 = require(script.Parent.Parent.helpers).checkContainerType;
local _ = require(script.Parent.Parent.types);
local v9 = require(script.Parent["all-utils"]);
local l_fuzzyMatches_0 = v9.fuzzyMatches;
local l_matches_1 = v9.matches;
local l_makeNormalizer_0 = v9.makeNormalizer;
local l_getNodeText_0 = v9.getNodeText;
local l_buildQueries_0 = v9.buildQueries;
local l_getConfig_0 = v9.getConfig;
local v16 = nil;
v16 = function(v17, v18, v19) --[[ Line: 31 ]] --[[ Name: queryAllByText ]]
    -- upvalues: l_getConfig_0 (copy), l_checkContainerType_0 (copy), l_matches_1 (copy), l_fuzzyMatches_0 (copy), l_makeNormalizer_0 (copy), l_matches_0 (copy), l_Array_0 (copy), l_querySelectorAll_0 (copy), l_getNodeText_0 (copy)
    local v20 = if v19 == nil then {} else v19;
    local v21 = if v20.selector == nil then {
        "."
    } else v20.selector;
    local v22 = v20.exact == nil or v20.exact;
    local l_collapseWhitespace_0 = v20.collapseWhitespace;
    local l_trim_0 = v20.trim;
    local v25 = if v20.ignore == nil then l_getConfig_0().defaultIgnore else v20.ignore;
    local l_normalizer_0 = v20.normalizer;
    l_checkContainerType_0(v17);
    local v27 = if v22 then l_matches_1 else l_fuzzyMatches_0;
    local v28 = l_makeNormalizer_0({
        collapseWhitespace = l_collapseWhitespace_0, 
        trim = l_trim_0, 
        normalizer = l_normalizer_0
    });
    local v29 = {};
    if l_matches_0(v17, v21) then
        v29 = {
            v17
        };
    end;
    return l_Array_0.filter(l_Array_0.filter(l_Array_0.concat({}, v29, l_querySelectorAll_0(v17, v21)), function(v30) --[[ Line: 59 ]]
        -- upvalues: v25 (copy), l_matches_0 (ref)
        return not (#v25 > 0) or not l_matches_0(v30, v25);
    end), function(v31) --[[ Line: 65 ]]
        -- upvalues: v27 (copy), l_getNodeText_0 (ref), v18 (copy), v28 (copy)
        return v27(l_getNodeText_0(v31), v31, v18, v28);
    end);
end;
local v32 = nil;
v32 = function(_, v34) --[[ Line: 72 ]] --[[ Name: getMultipleError ]]
    return ("Found multiple elements with the text: %s"):format((tostring(v34)));
end;
local v35 = nil;
v35 = function(_, v37, v38) --[[ Line: 76 ]] --[[ Name: getMissingError ]]
    -- upvalues: l_makeNormalizer_0 (copy)
    local v39 = if v38 == nil then {} else v38;
    local l_collapseWhitespace_1 = v39.collapseWhitespace;
    local l_trim_1 = v39.trim;
    local l_normalizer_1 = v39.normalizer;
    local v43 = l_makeNormalizer_0({
        collapseWhitespace = l_collapseWhitespace_1, 
        trim = l_trim_1, 
        normalizer = l_normalizer_1
    })((tostring(v37)));
    return ("Unable to find an element with the text: %s. This could be because the text is broken up by multiple elements. In this case, you can provide a function for your text matcher to make your matcher more flexible."):format((tostring(if v43 ~= tostring(v37) then ("%s (normalized from '%s')"):format(v43, (tostring(v37))) else v37)));
end;
local v44 = l_wrapAllByQueryWithSuggestion_0(v16, debug.info(v16, "n"), "queryAll");
local v45, v46, v47, v48, v49 = l_buildQueries_0(v16, v32, v35);
v5.queryByText = v45;
v5.queryAllByText = v44;
v5.getByText = v47;
v5.getAllByText = v46;
v5.findAllByText = v48;
v5.findByText = v49;
return v5;