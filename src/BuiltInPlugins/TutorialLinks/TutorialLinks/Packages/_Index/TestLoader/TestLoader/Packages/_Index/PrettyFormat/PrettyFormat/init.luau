local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_extends_0 = v2.extends;
local l_isNaN_0 = v2.Number.isNaN;
local v7 = require(l_script_0.Collections);
local l_printTableEntries_0 = v7.printTableEntries;
local l_printMapEntries_0 = v7.printMapEntries;
local l_printListItems_0 = v7.printListItems;
local v11 = require(l_script_0.plugins.AsymmetricMatcher);
local v12 = require(l_script_0.plugins.ConvertAnsi);
local v13 = require(l_script_0.plugins.RobloxInstance);
local v14 = require(l_script_0.plugins.ReactElement);
local v15 = require(l_script_0.plugins.ReactTestComponent);
local v16 = require(l_script_0.plugins.RedactStackTraces);
local v17 = require(l_Parent_0.JestGetType);
local l_getType_0 = v17.getType;
local l_isRobloxBuiltin_0 = v17.isRobloxBuiltin;
local _ = require(l_script_0.Types);
local v23 = l_extends_0(l_Error_0, "PrettyFormatPluginError", function(v21, v22) --[[ Line: 51 ]]
    v21.name = "PrettyFormatPluginError";
    v21.message = v22;
end);
local v24 = nil;
local v25 = nil;
local function _(v26) --[[ Line: 60 ]] --[[ Name: printNumber ]]
    -- upvalues: l_isNaN_0 (copy)
    if l_isNaN_0(v26) then
        return "nan";
    else
        return (tostring(v26));
    end;
end;
local function _(v28, v29) --[[ Line: 70 ]] --[[ Name: printFunction ]]
    if not v29 then
        return "[Function]";
    else
        local v30 = debug.info(v28, "n");
        if v30 == nil or v30 == "" then
            v30 = "anonymous";
        end;
        return "[Function " .. v30 .. "]";
    end;
end;
local function _(v32) --[[ Line: 81 ]] --[[ Name: printSymbol ]]
    return (tostring(v32));
end;
local function _(v34) --[[ Line: 85 ]] --[[ Name: printError ]]
    return "[" .. tostring(v34) .. "]";
end;
local function v44(v36, v37, v38, v39) --[[ Line: 93 ]] --[[ Name: printBasicValue ]]
    -- upvalues: l_getType_0 (copy), l_isNaN_0 (copy), l_isRobloxBuiltin_0 (copy)
    local v40 = l_getType_0(v36);
    if v40 == "boolean" or v40 == "nil" then
        return (tostring(v36));
    elseif v40 == "number" then
        local l_v36_0 = v36;
        if l_isNaN_0(l_v36_0) then
            return "nan";
        else
            return (tostring(l_v36_0));
        end;
    elseif v40 == "string" then
        if v39 then
            return "\"" .. v36:gsub("\\", "\\\\"):gsub("\"", "\\\"") .. "\"";
        else
            return "\"" .. v36 .. "\"";
        end;
    elseif v40 == "function" then
        local l_v36_1 = v36;
        if not v37 then
            return "[Function]";
        else
            local v43 = debug.info(l_v36_1, "n");
            if v43 == nil or v43 == "" then
                v43 = "anonymous";
            end;
            return "[Function " .. v43 .. "]";
        end;
    elseif v40 == "symbol" then
        return (tostring(v36));
    elseif v40 == "DateTime" then
        return string.sub(v36:ToIsoDate(), 1, -2) .. "." .. string.format("%03d", v36:ToUniversalTime().Millisecond) .. "Z";
    elseif v40 == "error" then
        return "[" .. tostring(v36) .. "]";
    elseif v40 == "regexp" then
        v36 = tostring(v36);
        if v38 then
            return (v36:gsub("[\\%^%$%*%+%?%.%(%)|%[%]{}]", "\\%1"));
        else
            return v36;
        end;
    elseif v40 == "Instance" then
        return v36.ClassName;
    elseif l_isRobloxBuiltin_0(v36) then
        return string.format("%s(%s)", v40, (tostring(v36)));
    elseif v40 == "userdata" then
        return (tostring(v36));
    else
        return nil;
    end;
end;
local _ = function(v45) --[[ Line: 172 ]] --[[ Name: is_array ]]
    if type(v45) ~= "table" then
        return false;
    elseif #v45 > 0 then
        return true;
    else
        for _, _ in pairs(v45) do
            return false;
        end;
        return true;
    end;
end;
local function v62(v49, v50, v51, v52, v53, v54) --[[ Line: 195 ]] --[[ Name: printComplexValue ]]
    -- upvalues: v24 (ref), l_getType_0 (copy), l_printListItems_0 (copy), l_printMapEntries_0 (copy), l_printTableEntries_0 (copy)
    local v55 = false;
    if table.find(v53, v49) ~= nil then
        return "[Circular]";
    else
        v53 = {
            unpack(v53)
        };
        table.insert(v53, v49);
        v52 = v52 + 1;
        local v56 = v50.maxDepth < v52;
        local l_min_0 = v50.min;
        if v50.callToJSON and not v56 and v49.toJSON and typeof(v49.toJSON) == "function" and not v54 then
            return v24(v49.toJSON(), v50, v51, v52, v53, true);
        elseif v56 then
            if l_getType_0(v49) == "set" then
                return "[Set]";
            else
                return "[Table]";
            end;
        else
            local v58 = "";
            if not l_min_0 then
                v58 = if v50.printBasicPrototype then "Table" .. " " else "";
            end;
            local v59;
            if type(v49) ~= "table" then
                v59 = false;
            elseif #v49 > 0 then
                v59 = true;
            else
                for _, _ in pairs(v49) do
                    v59 = false;
                    v55 = true;
                    if v55 then
                        break;
                    end;
                end;
                if not v55 then
                    v59 = true;
                end;
            end;
            v55 = false;
            if v59 then
                return v58 .. "{" .. l_printListItems_0(v49, v50, v51, v52, v53, v24) .. "}";
            elseif l_getType_0(v49) == "set" then
                if v56 then
                    return "[Set]";
                else
                    return "Set {" .. l_printListItems_0(v49._array, v50, v51, v52, v53, v24) .. "}";
                end;
            elseif l_getType_0(v49) == "map" then
                if v56 then
                    return "[Map]";
                else
                    return "Map {" .. l_printMapEntries_0(v49._map, v50, v51, v52, v53, v24) .. "}";
                end;
            else
                return v58 .. "{" .. l_printTableEntries_0(v49, v50, v51, v52, v53, v24) .. "}";
            end;
        end;
    end;
end;
local function _(v63) --[[ Line: 260 ]] --[[ Name: isNewPlugin ]]
    return v63.serialize ~= nil;
end;
printPlugin = function(v65, v66, v67, v68, v69, v70) --[[ Line: 264 ]] --[[ Name: printPlugin ]]
    -- upvalues: v24 (ref), v23 (copy), l_Error_0 (copy)
    local v71 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 267 ]]
        -- upvalues: v65 (copy), v71 (ref), v66 (copy), v67 (copy), v68 (copy), v69 (copy), v70 (copy), v24 (ref)
        if v65.serialize ~= nil then
            v71 = v65.serialize(v66, v67, v68, v69, v70, v24);
            return;
        else
            v71 = v65.print(v66, function(v72) --[[ Line: 271 ]]
                -- upvalues: v24 (ref), v67 (ref), v68 (ref), v69 (ref), v70 (ref)
                return v24(v72, v67, v68, v69, v70);
            end, function(v73) --[[ Line: 273 ]]
                -- upvalues: v68 (ref), v67 (ref)
                local v74 = v68 .. v67.indent;
                return v74 .. v73:gsub("\n", "\n" .. v74);
            end, {
                edgeSpacing = v67.spacingOuter, 
                min = v67.min, 
                spacing = v67.spacingInner
            }, v67.colors);
            return;
        end;
    end);
    if not l_status_0 then
        if typeof(l_result_0) == "table" and l_result_0.name == "PrettyFormatPluginError" then
            error(l_result_0);
        end;
        error(v23(l_result_0));
    end;
    if typeof(v71) ~= "string" then
        error(l_Error_0(string.format("pretty-format: Plugin must return type \"string\" but instead returned \"%s\".", (typeof(v71)))));
    end;
    return v71;
end;
local function v83(v77, v78) --[[ Line: 306 ]] --[[ Name: findPlugin ]]
    -- upvalues: v23 (copy)
    for _, v80 in ipairs(v77) do
        local l_status_1, l_result_1 = pcall(v80.test, v78);
        if not l_status_1 then
            error(v23(l_result_1));
        elseif l_result_1 then
            return v80;
        end;
    end;
    return nil;
end;
v24 = function(v84, v85, v86, v87, v88, v89) --[[ Line: 319 ]] --[[ Name: printer ]]
    -- upvalues: v83 (copy), v44 (copy), v62 (copy)
    local v90 = v83(v85.plugins, v84);
    if v90 ~= nil then
        return printPlugin(v90, v84, v85, v86, v87, v88);
    else
        local v91 = v44(v84, v85.printFunctionName, v85.escapeRegex, v85.escapeString);
        if v91 ~= nil then
            return v91;
        else
            return v62(v84, v85, v86, v87, v88, v89);
        end;
    end;
end;
local v92 = {
    callToJSON = true, 
    compareKeys = l_Object_0.None, 
    escapeRegex = false, 
    escapeString = true, 
    highlight = false, 
    indent = 2, 
    maxDepth = 1e999, 
    maxWidth = 1e999, 
    min = false, 
    plugins = {}, 
    printBasicPrototype = true, 
    printInstanceDefaults = true, 
    printFunctionName = true, 
    redactStackTracesInStrings = false, 
    theme = nil
};
local function v96(v93) --[[ Line: 364 ]] --[[ Name: validateOptions ]]
    -- upvalues: v92 (copy), l_Error_0 (copy)
    for v94, _ in pairs(v93) do
        if v92[v94] == nil then
            error(l_Error_0(string.format("pretty-format: Unknown option \"%s\".", (tostring(v94)))));
        end;
    end;
    if v93.min and v93.indent ~= nil and v93.indent ~= 0 then
        error(l_Error_0("pretty-format: Options \"min\" and \"indent\" cannot be used together."));
    end;
end;
local function _(v97, v98) --[[ Line: 381 ]] --[[ Name: getOption ]]
    -- upvalues: v92 (copy)
    if v97 and v97[v98] ~= nil then
        return v97[v98];
    else
        return v92[v98];
    end;
end;
local function _(v100) --[[ Line: 388 ]] --[[ Name: getIndent ]]
    -- upvalues: v92 (copy), v25 (ref)
    if v100 and v100.min then
        return "";
    else
        local l_indent_0 = v92.indent;
        if v100 and v100.indent ~= nil then
            l_indent_0 = v100.indent;
        end;
        return v25(l_indent_0);
    end;
end;
local function _(v103) --[[ Line: 399 ]] --[[ Name: getSpacingInner ]]
    if v103 and v103.min then
        return " ";
    else
        return "\n";
    end;
end;
local function _(v105) --[[ Line: 406 ]] --[[ Name: getSpacingOuter ]]
    if v105 and v105.min then
        return "";
    else
        return "\n";
    end;
end;
local function v111(v107) --[[ Line: 414 ]] --[[ Name: getConfig ]]
    -- upvalues: v92 (copy), v25 (ref)
    local v108 = {
        callToJSON = if v107 and v107.callToJSON ~= nil then v107.callToJSON else v92.callToJSON, 
        colors = nil, 
        compareKeys = if v107 ~= nil and typeof(v107.compareKeys) == "function" then v107.compareKeys else v92.compareKeys, 
        escapeRegex = if v107 and v107.escapeRegex ~= nil then v107.escapeRegex else v92.escapeRegex, 
        escapeString = if v107 and v107.escapeString ~= nil then v107.escapeString else v92.escapeString
    };
    local v109;
    if v107 and v107.min then
        v109 = "";
    else
        local l_indent_1 = v92.indent;
        if v107 and v107.indent ~= nil then
            l_indent_1 = v107.indent;
        end;
        v109 = v25(l_indent_1);
    end;
    v108.indent = v109;
    v108.maxDepth = if v107 and v107.maxDepth ~= nil then v107.maxDepth else v92.maxDepth;
    v108.maxWidth = if v107 and v107.maxWidth ~= nil then v107.maxWidth else v92.maxWidth;
    v108.min = if v107 and v107.min ~= nil then v107.min else v92.min;
    v108.plugins = if v107 and v107.plugins ~= nil then v107.plugins else v92.plugins;
    v108.printBasicPrototype = v107 == nil or not (v107.printBasicPrototype ~= nil) or v107.printBasicPrototype;
    v108.printInstanceDefaults = if v107 and v107.printInstanceDefaults ~= nil then v107.printInstanceDefaults else v92.printInstanceDefaults;
    v108.redactStackTracesInStrings = if v107 and v107.redactStackTracesInStrings ~= nil then v107.redactStackTracesInStrings else v92.redactStackTracesInStrings;
    v108.printFunctionName = if v107 and v107.printFunctionName ~= nil then v107.printFunctionName else v92.printFunctionName;
    v108.spacingInner = v107 and v107.min and " " or "\n";
    v108.spacingOuter = v107 and v107.min and "" or "\n";
    return v108;
end;
v25 = function(v112) --[[ Line: 442 ]] --[[ Name: createIndent ]]
    return string.rep(" ", v112);
end;
local function v117(v113, v114) --[[ Line: 452 ]] --[[ Name: format ]]
    -- upvalues: v96 (copy), v83 (copy), v111 (copy), v44 (copy), v92 (copy), v62 (copy)
    if v114 then
        v96(v114);
        if v114.plugins then
            local v115 = v83(v114.plugins, v113);
            if v115 ~= nil then
                return printPlugin(v115, v113, v111(v114), "", 0, {});
            end;
        end;
    end;
    local v116 = v44(v113, if v114 and v114.printFunctionName ~= nil then v114.printFunctionName else v92.printFunctionName, if v114 and v114.escapeRegex ~= nil then v114.escapeRegex else v92.escapeRegex, if v114 and v114.escapeString ~= nil then v114.escapeString else v92.escapeString);
    if v116 ~= nil then
        return v116;
    else
        return v62(v113, v111(v114), "", 0, {}, nil);
    end;
end;
local v118 = {
    AsymmetricMatcher = v11, 
    ConvertAnsi = v12, 
    ReactElement = v14, 
    ReactTestComponent = v15, 
    RobloxInstance = v13, 
    RedactStackTraces = v16
};
setmetatable(v118, {
    __index = function(_, v120) --[[ Line: 490 ]] --[[ Name: __index ]]
        -- upvalues: l_Error_0 (copy)
        error(l_Error_0.new("Can't find pretty-format plugin: " .. v120));
    end
});
return {
    format = v117, 
    default = v117, 
    plugins = v118, 
    DEFAULT_OPTIONS = v92
};