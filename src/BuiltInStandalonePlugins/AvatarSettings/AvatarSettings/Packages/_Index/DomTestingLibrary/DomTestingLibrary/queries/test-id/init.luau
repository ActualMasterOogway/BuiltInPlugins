local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.LuauPolyfill);
local v2 = {};
local l_checkContainerType_0 = require(script.Parent.Parent.helpers).checkContainerType;
local l_wrapAllByQueryWithSuggestion_0 = require(script.Parent.Parent["query-helpers"]).wrapAllByQueryWithSuggestion;
local _ = require(script.Parent.Parent.types);
local v6 = require(script.Parent["all-utils"]);
local l_queryAllByAttribute_0 = v6.queryAllByAttribute;
local l_getConfig_0 = v6.getConfig;
local l_buildQueries_0 = v6.buildQueries;
local function _() --[[ Line: 19 ]] --[[ Name: getTestIdAttribute ]]
    -- upvalues: l_getConfig_0 (copy)
    return l_getConfig_0().testIdAttribute;
end;
local v11 = nil;
v11 = function(...) --[[ Line: 24 ]] --[[ Name: queryAllByTestId ]]
    -- upvalues: l_checkContainerType_0 (copy), l_queryAllByAttribute_0 (copy), l_getConfig_0 (copy)
    l_checkContainerType_0(({
        ...
    })[1]);
    return l_queryAllByAttribute_0(l_getConfig_0().testIdAttribute, ...);
end;
local v12 = nil;
v12 = function(_, v14) --[[ Line: 31 ]] --[[ Name: getMultipleError ]]
    -- upvalues: l_getConfig_0 (copy)
    return ("Found multiple elements by: [%s=\"%s\"]"):format(l_getConfig_0().testIdAttribute, (tostring(v14)));
end;
local v15 = nil;
v15 = function(_, v17) --[[ Line: 35 ]] --[[ Name: getMissingError ]]
    -- upvalues: l_getConfig_0 (copy)
    return ("Unable to find an element by: [%s=\"%s\"]"):format(l_getConfig_0().testIdAttribute, (tostring(v17)));
end;
local v18 = l_wrapAllByQueryWithSuggestion_0(v11, debug.info(v11, "n"), "queryAll");
local v19, v20, v21, v22, v23 = l_buildQueries_0(v11, v12, v15);
v2.queryByTestId = v19;
v2.queryAllByTestId = v18;
v2.getByTestId = v21;
v2.getAllByTestId = v20;
v2.findAllByTestId = v22;
v2.findByTestId = v23;
return v2;