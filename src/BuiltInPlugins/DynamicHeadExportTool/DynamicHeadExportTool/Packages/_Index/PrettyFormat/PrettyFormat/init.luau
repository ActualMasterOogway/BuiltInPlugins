local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_Object_0 = v2.Object;
local l_extends_0 = v2.extends;
local l_isNaN_0 = v2.Number.isNaN;
local v7 = require(l_script_0.Collections);
local l_printTableEntries_0 = v7.printTableEntries;
local l_printListItems_0 = v7.printListItems;
local v10 = require(l_script_0.plugins.AsymmetricMatcher);
local v11 = require(l_script_0.plugins.ConvertAnsi);
local v12 = require(l_script_0.plugins.RobloxInstance);
local v13 = require(l_script_0.plugins.ReactElement);
local v14 = require(l_script_0.plugins.ReactTestComponent);
local v15 = require(l_Parent_0.JestGetType);
local l_getType_0 = v15.getType;
local l_isRobloxBuiltin_0 = v15.isRobloxBuiltin;
local _ = require(l_script_0.Types);
local v21 = l_extends_0(l_Error_0, "PrettyFormatPluginError", function(v19, v20) --[[ Line: 49 ]]
    v19.name = "PrettyFormatPluginError";
    v19.message = v20;
end);
local v22 = nil;
local v23 = nil;
local function _(v24) --[[ Line: 58 ]] --[[ Name: printNumber ]]
    -- upvalues: l_isNaN_0 (copy)
    if l_isNaN_0(v24) then
        return "nan";
    else
        return (tostring(v24));
    end;
end;
local function _(v26, v27) --[[ Line: 68 ]] --[[ Name: printFunction ]]
    if not v27 then
        return "[Function]";
    else
        local v28 = debug.info(v26, "n");
        if v28 == nil or v28 == "" then
            v28 = "anonymous";
        end;
        return "[Function " .. v28 .. "]";
    end;
end;
local function _(v30) --[[ Line: 79 ]] --[[ Name: printSymbol ]]
    return (tostring(v30));
end;
local function _(v32) --[[ Line: 83 ]] --[[ Name: printError ]]
    return "[" .. tostring(v32) .. "]";
end;
local function v42(v34, v35, v36, v37) --[[ Line: 91 ]] --[[ Name: printBasicValue ]]
    -- upvalues: l_getType_0 (copy), l_isNaN_0 (copy), l_isRobloxBuiltin_0 (copy)
    local v38 = l_getType_0(v34);
    if v38 == "boolean" or v38 == "nil" then
        return (tostring(v34));
    elseif v38 == "number" then
        local l_v34_0 = v34;
        if l_isNaN_0(l_v34_0) then
            return "nan";
        else
            return (tostring(l_v34_0));
        end;
    elseif v38 == "string" then
        if v37 then
            return "\"" .. v34:gsub("\\", "\\\\"):gsub("\"", "\\\"") .. "\"";
        else
            return "\"" .. v34 .. "\"";
        end;
    elseif v38 == "function" then
        local l_v34_1 = v34;
        if not v35 then
            return "[Function]";
        else
            local v41 = debug.info(l_v34_1, "n");
            if v41 == nil or v41 == "" then
                v41 = "anonymous";
            end;
            return "[Function " .. v41 .. "]";
        end;
    elseif v38 == "symbol" then
        return (tostring(v34));
    elseif v38 == "DateTime" then
        return string.sub(v34:ToIsoDate(), 1, -2) .. "." .. string.format("%03d", v34:ToUniversalTime().Millisecond) .. "Z";
    elseif v38 == "error" then
        return "[" .. tostring(v34) .. "]";
    elseif v38 == "regexp" then
        v34 = tostring(v34);
        if v36 then
            return (v34:gsub("[\\%^%$%*%+%?%.%(%)|%[%]{}]", "\\%1"));
        else
            return v34;
        end;
    elseif v38 == "Instance" then
        return v34.ClassName;
    elseif l_isRobloxBuiltin_0(v34) then
        return string.format("%s(%s)", v38, (tostring(v34)));
    elseif v38 == "userdata" then
        return (tostring(v34));
    else
        return nil;
    end;
end;
local _ = function(v43) --[[ Line: 170 ]] --[[ Name: is_array ]]
    if type(v43) ~= "table" then
        return false;
    elseif #v43 > 0 then
        return true;
    else
        for _, _ in pairs(v43) do
            return false;
        end;
        return true;
    end;
end;
local function v60(v47, v48, v49, v50, v51, v52) --[[ Line: 193 ]] --[[ Name: printComplexValue ]]
    -- upvalues: v22 (ref), l_getType_0 (copy), l_printListItems_0 (copy), l_printTableEntries_0 (copy)
    local v53 = false;
    if table.find(v51, v47) ~= nil then
        return "[Circular]";
    else
        v51 = {
            unpack(v51)
        };
        table.insert(v51, v47);
        v50 = v50 + 1;
        local v54 = v48.maxDepth < v50;
        local l_min_0 = v48.min;
        if v48.callToJSON and not v54 and v47.toJSON and typeof(v47.toJSON) == "function" and not v52 then
            return v22(v47.toJSON(), v48, v49, v50, v51, true);
        elseif v54 then
            if l_getType_0(v47) == "set" then
                return "[Set]";
            else
                return "[Table]";
            end;
        else
            local v56 = "";
            if not l_min_0 then
                v56 = if v48.printBasicPrototype then "Table" .. " " else "";
            end;
            local v57;
            if type(v47) ~= "table" then
                v57 = false;
            elseif #v47 > 0 then
                v57 = true;
            else
                for _, _ in pairs(v47) do
                    v57 = false;
                    v53 = true;
                    if v53 then
                        break;
                    end;
                end;
                if not v53 then
                    v57 = true;
                end;
            end;
            v53 = false;
            if v57 then
                return v56 .. "{" .. l_printListItems_0(v47, v48, v49, v50, v51, v22) .. "}";
            elseif l_getType_0(v47) == "set" then
                if v54 then
                    return "[Set]";
                else
                    return "Set {" .. l_printListItems_0(v47._array, v48, v49, v50, v51, v22) .. "}";
                end;
            else
                return v56 .. "{" .. l_printTableEntries_0(v47, v48, v49, v50, v51, v22) .. "}";
            end;
        end;
    end;
end;
local function _(v61) --[[ Line: 250 ]] --[[ Name: isNewPlugin ]]
    return v61.serialize ~= nil;
end;
printPlugin = function(v63, v64, v65, v66, v67, v68) --[[ Line: 254 ]] --[[ Name: printPlugin ]]
    -- upvalues: v22 (ref), v21 (copy), l_Error_0 (copy)
    local v69 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 257 ]]
        -- upvalues: v63 (copy), v69 (ref), v64 (copy), v65 (copy), v66 (copy), v67 (copy), v68 (copy), v22 (ref)
        if v63.serialize ~= nil then
            v69 = v63.serialize(v64, v65, v66, v67, v68, v22);
            return;
        else
            v69 = v63.print(v64, function(v70) --[[ Line: 261 ]]
                -- upvalues: v22 (ref), v65 (ref), v66 (ref), v67 (ref), v68 (ref)
                return v22(v70, v65, v66, v67, v68);
            end, function(v71) --[[ Line: 263 ]]
                -- upvalues: v66 (ref), v65 (ref)
                local v72 = v66 .. v65.indent;
                return v72 .. v71:gsub("\n", "\n" .. v72);
            end, {
                edgeSpacing = v65.spacingOuter, 
                min = v65.min, 
                spacing = v65.spacingInner
            }, v65.colors);
            return;
        end;
    end);
    if not l_status_0 then
        error(v21(l_result_0));
    end;
    if typeof(v69) ~= "string" then
        error(l_Error_0(string.format("pretty-format: Plugin must return type \"string\" but instead returned \"%s\".", (typeof(v69)))));
    end;
    return v69;
end;
local function v81(v75, v76) --[[ Line: 291 ]] --[[ Name: findPlugin ]]
    -- upvalues: v21 (copy)
    for _, v78 in ipairs(v75) do
        local l_status_1, l_result_1 = pcall(v78.test, v76);
        if not l_status_1 then
            error(v21(l_result_1));
        elseif l_result_1 then
            return v78;
        end;
    end;
    return nil;
end;
v22 = function(v82, v83, v84, v85, v86, v87) --[[ Line: 304 ]] --[[ Name: printer ]]
    -- upvalues: v81 (copy), v42 (copy), v60 (copy)
    local v88 = v81(v83.plugins, v82);
    if v88 ~= nil then
        return printPlugin(v88, v82, v83, v84, v85, v86);
    else
        local v89 = v42(v82, v83.printFunctionName, v83.escapeRegex, v83.escapeString);
        if v89 ~= nil then
            return v89;
        else
            return v60(v82, v83, v84, v85, v86, v87);
        end;
    end;
end;
local v90 = {
    callToJSON = true, 
    compareKeys = l_Object_0.None, 
    escapeRegex = false, 
    escapeString = true, 
    highlight = false, 
    indent = 2, 
    maxDepth = 1e999, 
    min = false, 
    plugins = {}, 
    printBasicPrototype = true, 
    printFunctionName = true, 
    theme = nil
};
local function v94(v91) --[[ Line: 344 ]] --[[ Name: validateOptions ]]
    -- upvalues: v90 (copy), l_Error_0 (copy)
    for v92, _ in pairs(v91) do
        if v90[v92] == nil then
            error(l_Error_0(string.format("pretty-format: Unknown option \"%s\".", (tostring(v92)))));
        end;
    end;
    if v91.min and v91.indent ~= nil and v91.indent ~= 0 then
        error(l_Error_0("pretty-format: Options \"min\" and \"indent\" cannot be used together."));
    end;
end;
local function _(v95, v96) --[[ Line: 361 ]] --[[ Name: getOption ]]
    -- upvalues: v90 (copy)
    if v95 and v95[v96] ~= nil then
        return v95[v96];
    else
        return v90[v96];
    end;
end;
local function _(v98) --[[ Line: 368 ]] --[[ Name: getIndent ]]
    -- upvalues: v90 (copy), v23 (ref)
    if v98 and v98.min then
        return "";
    else
        local l_indent_0 = v90.indent;
        if v98 and v98.indent ~= nil then
            l_indent_0 = v98.indent;
        end;
        return v23(l_indent_0);
    end;
end;
local function _(v101) --[[ Line: 379 ]] --[[ Name: getSpacingInner ]]
    if v101 and v101.min then
        return " ";
    else
        return "\n";
    end;
end;
local function _(v103) --[[ Line: 386 ]] --[[ Name: getSpacingOuter ]]
    if v103 and v103.min then
        return "";
    else
        return "\n";
    end;
end;
local function v109(v105) --[[ Line: 394 ]] --[[ Name: getConfig ]]
    -- upvalues: v90 (copy), v23 (ref)
    local v106 = {
        callToJSON = if v105 and v105.callToJSON ~= nil then v105.callToJSON else v90.callToJSON, 
        colors = nil, 
        compareKeys = if v105 ~= nil and typeof(v105.compareKeys) == "function" then v105.compareKeys else v90.compareKeys, 
        escapeRegex = if v105 and v105.escapeRegex ~= nil then v105.escapeRegex else v90.escapeRegex, 
        escapeString = if v105 and v105.escapeString ~= nil then v105.escapeString else v90.escapeString
    };
    local v107;
    if v105 and v105.min then
        v107 = "";
    else
        local l_indent_1 = v90.indent;
        if v105 and v105.indent ~= nil then
            l_indent_1 = v105.indent;
        end;
        v107 = v23(l_indent_1);
    end;
    v106.indent = v107;
    v106.maxDepth = if v105 and v105.maxDepth ~= nil then v105.maxDepth else v90.maxDepth;
    v106.min = if v105 and v105.min ~= nil then v105.min else v90.min;
    v106.plugins = if v105 and v105.plugins ~= nil then v105.plugins else v90.plugins;
    v106.printBasicPrototype = v105 == nil or not (v105.printBasicPrototype ~= nil) or v105.printBasicPrototype;
    v106.printFunctionName = if v105 and v105.printFunctionName ~= nil then v105.printFunctionName else v90.printFunctionName;
    v106.spacingInner = v105 and v105.min and " " or "\n";
    v106.spacingOuter = v105 and v105.min and "" or "\n";
    return v106;
end;
v23 = function(v110) --[[ Line: 417 ]] --[[ Name: createIndent ]]
    return string.rep(" ", v110);
end;
local function v115(v111, v112) --[[ Line: 427 ]] --[[ Name: format ]]
    -- upvalues: v94 (copy), v81 (copy), v109 (copy), v42 (copy), v90 (copy), v60 (copy)
    if v112 then
        v94(v112);
        if v112.plugins then
            local v113 = v81(v112.plugins, v111);
            if v113 ~= nil then
                return printPlugin(v113, v111, v109(v112), "", 0, {});
            end;
        end;
    end;
    local v114 = v42(v111, if v112 and v112.printFunctionName ~= nil then v112.printFunctionName else v90.printFunctionName, if v112 and v112.escapeRegex ~= nil then v112.escapeRegex else v90.escapeRegex, if v112 and v112.escapeString ~= nil then v112.escapeString else v90.escapeString);
    if v114 ~= nil then
        return v114;
    else
        return v60(v111, v109(v112), "", 0, {}, nil);
    end;
end;
local v116 = {
    AsymmetricMatcher = v10, 
    ConvertAnsi = v11, 
    ReactElement = v13, 
    ReactTestComponent = v14, 
    RobloxInstance = v12
};
return {
    format = v115, 
    default = v115, 
    plugins = v116, 
    DEFAULT_OPTIONS = v90
};