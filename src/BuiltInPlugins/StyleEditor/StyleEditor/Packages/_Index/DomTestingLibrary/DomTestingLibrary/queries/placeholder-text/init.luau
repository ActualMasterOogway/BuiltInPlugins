local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local l_wrapAllByQueryWithSuggestion_0 = require(script.Parent.Parent["query-helpers"]).wrapAllByQueryWithSuggestion;
local l_checkContainerType_0 = require(script.Parent.Parent.helpers).checkContainerType;
local _ = require(script.Parent.Parent.types);
local v6 = require(script.Parent["all-utils"]);
local l_queryAllByAttribute_0 = v6.queryAllByAttribute;
local l_buildQueries_0 = v6.buildQueries;
local v9 = nil;
v9 = function(...) --[[ Line: 19 ]] --[[ Name: queryAllByPlaceholderText ]]
    -- upvalues: l_checkContainerType_0 (copy), l_queryAllByAttribute_0 (copy)
    l_checkContainerType_0(({
        ...
    })[1]);
    return l_queryAllByAttribute_0("PlaceholderText", ...);
end;
local v10 = nil;
v10 = function(_, v12) --[[ Line: 26 ]] --[[ Name: getMultipleError ]]
    return ("Found multiple elements with the placeholder text of: %s"):format((tostring(v12)));
end;
local v13 = nil;
v13 = function(_, v15) --[[ Line: 30 ]] --[[ Name: getMissingError ]]
    return ("Unable to find an element with the placeholder text of: %s"):format((tostring(v15)));
end;
local v16 = l_wrapAllByQueryWithSuggestion_0(v9, debug.info(v9, "n"), "queryAll");
local v17, v18, v19, v20, v21 = l_buildQueries_0(v9, v10, v13);
v2.queryByPlaceholderText = v17;
v2.queryAllByPlaceholderText = v16;
v2.getByPlaceholderText = v19;
v2.getAllByPlaceholderText = v18;
v2.findAllByPlaceholderText = v20;
v2.findByPlaceholderText = v21;
return v2;