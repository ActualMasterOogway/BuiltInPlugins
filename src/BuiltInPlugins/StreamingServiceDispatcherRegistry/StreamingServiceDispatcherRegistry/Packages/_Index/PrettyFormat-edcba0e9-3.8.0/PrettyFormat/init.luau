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
local v16 = require(l_Parent_0.JestGetType);
local l_getType_0 = v16.getType;
local l_isRobloxBuiltin_0 = v16.isRobloxBuiltin;
local _ = require(l_script_0.Types);
local v22 = l_extends_0(l_Error_0, "PrettyFormatPluginError", function(v20, v21) --[[ Line: 50 ]]
    v20.name = "PrettyFormatPluginError";
    v20.message = v21;
end);
local v23 = nil;
local v24 = nil;
local function _(v25) --[[ Line: 59 ]] --[[ Name: printNumber ]]
    -- upvalues: l_isNaN_0 (copy)
    if l_isNaN_0(v25) then
        return "nan";
    else
        return (tostring(v25));
    end;
end;
local function _(v27, v28) --[[ Line: 69 ]] --[[ Name: printFunction ]]
    if not v28 then
        return "[Function]";
    else
        local v29 = debug.info(v27, "n");
        if v29 == nil or v29 == "" then
            v29 = "anonymous";
        end;
        return "[Function " .. v29 .. "]";
    end;
end;
local function _(v31) --[[ Line: 80 ]] --[[ Name: printSymbol ]]
    return (tostring(v31));
end;
local function _(v33) --[[ Line: 84 ]] --[[ Name: printError ]]
    return "[" .. tostring(v33) .. "]";
end;
local function v43(v35, v36, v37, v38) --[[ Line: 92 ]] --[[ Name: printBasicValue ]]
    -- upvalues: l_getType_0 (copy), l_isNaN_0 (copy), l_isRobloxBuiltin_0 (copy)
    local v39 = l_getType_0(v35);
    if v39 == "boolean" or v39 == "nil" then
        return (tostring(v35));
    elseif v39 == "number" then
        local l_v35_0 = v35;
        if l_isNaN_0(l_v35_0) then
            return "nan";
        else
            return (tostring(l_v35_0));
        end;
    elseif v39 == "string" then
        if v38 then
            return "\"" .. v35:gsub("\\", "\\\\"):gsub("\"", "\\\"") .. "\"";
        else
            return "\"" .. v35 .. "\"";
        end;
    elseif v39 == "function" then
        local l_v35_1 = v35;
        if not v36 then
            return "[Function]";
        else
            local v42 = debug.info(l_v35_1, "n");
            if v42 == nil or v42 == "" then
                v42 = "anonymous";
            end;
            return "[Function " .. v42 .. "]";
        end;
    elseif v39 == "symbol" then
        return (tostring(v35));
    elseif v39 == "DateTime" then
        return string.sub(v35:ToIsoDate(), 1, -2) .. "." .. string.format("%03d", v35:ToUniversalTime().Millisecond) .. "Z";
    elseif v39 == "error" then
        return "[" .. tostring(v35) .. "]";
    elseif v39 == "regexp" then
        v35 = tostring(v35);
        if v37 then
            return (v35:gsub("[\\%^%$%*%+%?%.%(%)|%[%]{}]", "\\%1"));
        else
            return v35;
        end;
    elseif v39 == "Instance" then
        return v35.ClassName;
    elseif l_isRobloxBuiltin_0(v35) then
        return string.format("%s(%s)", v39, (tostring(v35)));
    elseif v39 == "userdata" then
        return (tostring(v35));
    else
        return nil;
    end;
end;
local _ = function(v44) --[[ Line: 171 ]] --[[ Name: is_array ]]
    if type(v44) ~= "table" then
        return false;
    elseif #v44 > 0 then
        return true;
    else
        for _, _ in pairs(v44) do
            return false;
        end;
        return true;
    end;
end;
local function v61(v48, v49, v50, v51, v52, v53) --[[ Line: 194 ]] --[[ Name: printComplexValue ]]
    -- upvalues: v23 (ref), l_getType_0 (copy), l_printListItems_0 (copy), l_printMapEntries_0 (copy), l_printTableEntries_0 (copy)
    local v54 = false;
    if table.find(v52, v48) ~= nil then
        return "[Circular]";
    else
        v52 = {
            unpack(v52)
        };
        table.insert(v52, v48);
        v51 = v51 + 1;
        local v55 = v49.maxDepth < v51;
        local l_min_0 = v49.min;
        if v49.callToJSON and not v55 and v48.toJSON and typeof(v48.toJSON) == "function" and not v53 then
            return v23(v48.toJSON(), v49, v50, v51, v52, true);
        elseif v55 then
            if l_getType_0(v48) == "set" then
                return "[Set]";
            else
                return "[Table]";
            end;
        else
            local v57 = "";
            if not l_min_0 then
                v57 = if v49.printBasicPrototype then "Table" .. " " else "";
            end;
            local v58;
            if type(v48) ~= "table" then
                v58 = false;
            elseif #v48 > 0 then
                v58 = true;
            else
                for _, _ in pairs(v48) do
                    v58 = false;
                    v54 = true;
                    if v54 then
                        break;
                    end;
                end;
                if not v54 then
                    v58 = true;
                end;
            end;
            v54 = false;
            if v58 then
                return v57 .. "{" .. l_printListItems_0(v48, v49, v50, v51, v52, v23) .. "}";
            elseif l_getType_0(v48) == "set" then
                if v55 then
                    return "[Set]";
                else
                    return "Set {" .. l_printListItems_0(v48._array, v49, v50, v51, v52, v23) .. "}";
                end;
            elseif l_getType_0(v48) == "map" then
                if v55 then
                    return "[Map]";
                else
                    return "Map {" .. l_printMapEntries_0(v48._map, v49, v50, v51, v52, v23) .. "}";
                end;
            else
                return v57 .. "{" .. l_printTableEntries_0(v48, v49, v50, v51, v52, v23) .. "}";
            end;
        end;
    end;
end;
local function _(v62) --[[ Line: 259 ]] --[[ Name: isNewPlugin ]]
    return v62.serialize ~= nil;
end;
printPlugin = function(v64, v65, v66, v67, v68, v69) --[[ Line: 263 ]] --[[ Name: printPlugin ]]
    -- upvalues: v23 (ref), v22 (copy), l_Error_0 (copy)
    local v70 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 266 ]]
        -- upvalues: v64 (copy), v70 (ref), v65 (copy), v66 (copy), v67 (copy), v68 (copy), v69 (copy), v23 (ref)
        if v64.serialize ~= nil then
            v70 = v64.serialize(v65, v66, v67, v68, v69, v23);
            return;
        else
            v70 = v64.print(v65, function(v71) --[[ Line: 270 ]]
                -- upvalues: v23 (ref), v66 (ref), v67 (ref), v68 (ref), v69 (ref)
                return v23(v71, v66, v67, v68, v69);
            end, function(v72) --[[ Line: 272 ]]
                -- upvalues: v67 (ref), v66 (ref)
                local v73 = v67 .. v66.indent;
                return v73 .. v72:gsub("\n", "\n" .. v73);
            end, {
                edgeSpacing = v66.spacingOuter, 
                min = v66.min, 
                spacing = v66.spacingInner
            }, v66.colors);
            return;
        end;
    end);
    if not l_status_0 then
        if typeof(l_result_0) == "table" and l_result_0.name == "PrettyFormatPluginError" then
            error(l_result_0);
        end;
        error(v22(l_result_0));
    end;
    if typeof(v70) ~= "string" then
        error(l_Error_0(string.format("pretty-format: Plugin must return type \"string\" but instead returned \"%s\".", (typeof(v70)))));
    end;
    return v70;
end;
local function v82(v76, v77) --[[ Line: 305 ]] --[[ Name: findPlugin ]]
    -- upvalues: v22 (copy)
    for _, v79 in ipairs(v76) do
        local l_status_1, l_result_1 = pcall(v79.test, v77);
        if not l_status_1 then
            error(v22(l_result_1));
        elseif l_result_1 then
            return v79;
        end;
    end;
    return nil;
end;
v23 = function(v83, v84, v85, v86, v87, v88) --[[ Line: 318 ]] --[[ Name: printer ]]
    -- upvalues: v82 (copy), v43 (copy), v61 (copy)
    local v89 = v82(v84.plugins, v83);
    if v89 ~= nil then
        return printPlugin(v89, v83, v84, v85, v86, v87);
    else
        local v90 = v43(v83, v84.printFunctionName, v84.escapeRegex, v84.escapeString);
        if v90 ~= nil then
            return v90;
        else
            return v61(v83, v84, v85, v86, v87, v88);
        end;
    end;
end;
local v91 = {
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
    theme = nil
};
local function v95(v92) --[[ Line: 361 ]] --[[ Name: validateOptions ]]
    -- upvalues: v91 (copy), l_Error_0 (copy)
    for v93, _ in pairs(v92) do
        if v91[v93] == nil then
            error(l_Error_0(string.format("pretty-format: Unknown option \"%s\".", (tostring(v93)))));
        end;
    end;
    if v92.min and v92.indent ~= nil and v92.indent ~= 0 then
        error(l_Error_0("pretty-format: Options \"min\" and \"indent\" cannot be used together."));
    end;
end;
local function _(v96, v97) --[[ Line: 378 ]] --[[ Name: getOption ]]
    -- upvalues: v91 (copy)
    if v96 and v96[v97] ~= nil then
        return v96[v97];
    else
        return v91[v97];
    end;
end;
local function _(v99) --[[ Line: 385 ]] --[[ Name: getIndent ]]
    -- upvalues: v91 (copy), v24 (ref)
    if v99 and v99.min then
        return "";
    else
        local l_indent_0 = v91.indent;
        if v99 and v99.indent ~= nil then
            l_indent_0 = v99.indent;
        end;
        return v24(l_indent_0);
    end;
end;
local function _(v102) --[[ Line: 396 ]] --[[ Name: getSpacingInner ]]
    if v102 and v102.min then
        return " ";
    else
        return "\n";
    end;
end;
local function _(v104) --[[ Line: 403 ]] --[[ Name: getSpacingOuter ]]
    if v104 and v104.min then
        return "";
    else
        return "\n";
    end;
end;
local function v110(v106) --[[ Line: 411 ]] --[[ Name: getConfig ]]
    -- upvalues: v91 (copy), v24 (ref)
    local v107 = {
        callToJSON = if v106 and v106.callToJSON ~= nil then v106.callToJSON else v91.callToJSON, 
        colors = nil, 
        compareKeys = if v106 ~= nil and typeof(v106.compareKeys) == "function" then v106.compareKeys else v91.compareKeys, 
        escapeRegex = if v106 and v106.escapeRegex ~= nil then v106.escapeRegex else v91.escapeRegex, 
        escapeString = if v106 and v106.escapeString ~= nil then v106.escapeString else v91.escapeString
    };
    local v108;
    if v106 and v106.min then
        v108 = "";
    else
        local l_indent_1 = v91.indent;
        if v106 and v106.indent ~= nil then
            l_indent_1 = v106.indent;
        end;
        v108 = v24(l_indent_1);
    end;
    v107.indent = v108;
    v107.maxDepth = if v106 and v106.maxDepth ~= nil then v106.maxDepth else v91.maxDepth;
    v107.maxWidth = if v106 and v106.maxWidth ~= nil then v106.maxWidth else v91.maxWidth;
    v107.min = if v106 and v106.min ~= nil then v106.min else v91.min;
    v107.plugins = if v106 and v106.plugins ~= nil then v106.plugins else v91.plugins;
    v107.printBasicPrototype = v106 == nil or not (v106.printBasicPrototype ~= nil) or v106.printBasicPrototype;
    v107.printInstanceDefaults = if v106 and v106.printInstanceDefaults ~= nil then v106.printInstanceDefaults else v91.printInstanceDefaults;
    v107.printFunctionName = if v106 and v106.printFunctionName ~= nil then v106.printFunctionName else v91.printFunctionName;
    v107.spacingInner = v106 and v106.min and " " or "\n";
    v107.spacingOuter = v106 and v106.min and "" or "\n";
    return v107;
end;
v24 = function(v111) --[[ Line: 437 ]] --[[ Name: createIndent ]]
    return string.rep(" ", v111);
end;
local function v116(v112, v113) --[[ Line: 447 ]] --[[ Name: format ]]
    -- upvalues: v95 (copy), v82 (copy), v110 (copy), v43 (copy), v91 (copy), v61 (copy)
    if v113 then
        v95(v113);
        if v113.plugins then
            local v114 = v82(v113.plugins, v112);
            if v114 ~= nil then
                return printPlugin(v114, v112, v110(v113), "", 0, {});
            end;
        end;
    end;
    local v115 = v43(v112, if v113 and v113.printFunctionName ~= nil then v113.printFunctionName else v91.printFunctionName, if v113 and v113.escapeRegex ~= nil then v113.escapeRegex else v91.escapeRegex, if v113 and v113.escapeString ~= nil then v113.escapeString else v91.escapeString);
    if v115 ~= nil then
        return v115;
    else
        return v61(v112, v110(v113), "", 0, {}, nil);
    end;
end;
local v117 = {
    AsymmetricMatcher = v11, 
    ConvertAnsi = v12, 
    ReactElement = v14, 
    ReactTestComponent = v15, 
    RobloxInstance = v13
};
return {
    format = v116, 
    default = v116, 
    plugins = v117, 
    DEFAULT_OPTIONS = v91
};