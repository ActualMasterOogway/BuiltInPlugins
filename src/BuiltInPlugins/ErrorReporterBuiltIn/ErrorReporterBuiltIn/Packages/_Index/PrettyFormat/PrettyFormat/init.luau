local l_script_0 = script;
local l_Parent_0 = l_script_0.Parent;
local v2 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v2.Error;
local l_extends_0 = v2.extends;
local l_isNaN_0 = v2.Number.isNaN;
local v6 = require(l_script_0.Collections);
local l_printTableEntries_0 = v6.printTableEntries;
local l_printListItems_0 = v6.printListItems;
local v9 = require(l_script_0.plugins.AsymmetricMatcher);
local v10 = require(l_script_0.plugins.ConvertAnsi);
local v11 = require(l_script_0.plugins.RobloxInstance);
local v12 = require(l_Parent_0.JestGetType);
local l_getType_0 = v12.getType;
local l_isRobloxBuiltin_0 = v12.isRobloxBuiltin;
local _ = require(l_script_0.Types);
local v18 = l_extends_0(l_Error_0, "PrettyFormatPluginError", function(v16, v17) --[[ Line: 43 ]]
    v16.name = "PrettyFormatPluginError";
    v16.message = v17;
end);
local v19 = nil;
local v20 = nil;
local function _(v21) --[[ Line: 53 ]] --[[ Name: printNumber ]]
    -- upvalues: l_isNaN_0 (copy)
    if l_isNaN_0(v21) then
        return "nan";
    else
        return (tostring(v21));
    end;
end;
local function _(v23, v24) --[[ Line: 63 ]] --[[ Name: printFunction ]]
    if not v24 then
        return "[Function]";
    else
        local v25 = debug.info(v23, "n");
        if v25 == nil or v25 == "" then
            v25 = "anonymous";
        end;
        return "[Function " .. v25 .. "]";
    end;
end;
local function _(v27) --[[ Line: 74 ]] --[[ Name: printSymbol ]]
    return (tostring(v27));
end;
local function _(v29) --[[ Line: 78 ]] --[[ Name: printError ]]
    return "[" .. tostring(v29) .. "]";
end;
local function v39(v31, v32, v33, v34) --[[ Line: 86 ]] --[[ Name: printBasicValue ]]
    -- upvalues: l_getType_0 (copy), l_isNaN_0 (copy), l_isRobloxBuiltin_0 (copy)
    local v35 = l_getType_0(v31);
    if v35 == "boolean" or v35 == "nil" then
        return (tostring(v31));
    elseif v35 == "number" then
        local l_v31_0 = v31;
        if l_isNaN_0(l_v31_0) then
            return "nan";
        else
            return (tostring(l_v31_0));
        end;
    elseif v35 == "string" then
        if v34 then
            return "\"" .. v31:gsub("\\", "\\\\"):gsub("\"", "\\\"") .. "\"";
        else
            return "\"" .. v31 .. "\"";
        end;
    elseif v35 == "function" then
        local l_v31_1 = v31;
        if not v32 then
            return "[Function]";
        else
            local v38 = debug.info(l_v31_1, "n");
            if v38 == nil or v38 == "" then
                v38 = "anonymous";
            end;
            return "[Function " .. v38 .. "]";
        end;
    elseif v35 == "symbol" then
        return (tostring(v31));
    elseif v35 == "DateTime" then
        return string.sub(v31:ToIsoDate(), 1, -2) .. "." .. string.format("%03d", v31:ToUniversalTime().Millisecond) .. "Z";
    elseif v35 == "error" then
        return "[" .. tostring(v31) .. "]";
    elseif v35 == "regexp" then
        v31 = tostring(v31);
        if v33 then
            return (v31:gsub("[\\%^%$%*%+%?%.%(%)|%[%]{}]", "\\%1"));
        else
            return v31;
        end;
    elseif v35 == "Instance" then
        return v31.ClassName;
    elseif l_isRobloxBuiltin_0(v31) then
        return string.format("%s(%s)", v35, (tostring(v31)));
    elseif v35 == "userdata" then
        return (tostring(v31));
    else
        return nil;
    end;
end;
local _ = function(v40) --[[ Line: 164 ]] --[[ Name: is_array ]]
    if type(v40) ~= "table" then
        return false;
    elseif #v40 > 0 then
        return true;
    else
        for _, _ in pairs(v40) do
            return false;
        end;
        return true;
    end;
end;
local function v57(v44, v45, v46, v47, v48, v49) --[[ Line: 187 ]] --[[ Name: printComplexValue ]]
    -- upvalues: v19 (ref), l_getType_0 (copy), l_printListItems_0 (copy), l_printTableEntries_0 (copy)
    local v50 = false;
    if table.find(v48, v44) ~= nil then
        return "[Circular]";
    else
        v48 = {
            unpack(v48)
        };
        table.insert(v48, v44);
        v47 = v47 + 1;
        local v51 = v45.maxDepth < v47;
        local l_min_0 = v45.min;
        if v45.callToJSON and not v51 and v44.toJSON and typeof(v44.toJSON) == "function" and not v49 then
            return v19(v44.toJSON(), v45, v46, v47, v48, true);
        elseif v51 then
            if l_getType_0(v44) == "set" then
                return "[Set]";
            else
                return "[Table]";
            end;
        else
            local v53 = "";
            if not l_min_0 then
                v53 = "Table" .. " ";
            end;
            local v54;
            if type(v44) ~= "table" then
                v54 = false;
            elseif #v44 > 0 then
                v54 = true;
            else
                for _, _ in pairs(v44) do
                    v54 = false;
                    v50 = true;
                    if v50 then
                        break;
                    end;
                end;
                if not v50 then
                    v54 = true;
                end;
            end;
            v50 = false;
            if v54 then
                return v53 .. "{" .. l_printListItems_0(v44, v45, v46, v47, v48, v19) .. "}";
            elseif l_getType_0(v44) == "set" then
                if v51 then
                    return "[Set]";
                else
                    return "Set {" .. l_printListItems_0(v44._array, v45, v46, v47, v48, v19) .. "}";
                end;
            else
                return v53 .. "{" .. l_printTableEntries_0(v44, v45, v46, v47, v48, v19) .. "}";
            end;
        end;
    end;
end;
local function _(v58) --[[ Line: 264 ]] --[[ Name: isNewPlugin ]]
    return v58.serialize ~= nil;
end;
printPlugin = function(v60, v61, v62, v63, v64, v65) --[[ Line: 270 ]] --[[ Name: printPlugin ]]
    -- upvalues: v19 (ref), v18 (copy), l_Error_0 (copy)
    local v66 = nil;
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 280 ]]
        -- upvalues: v60 (copy), v66 (ref), v61 (copy), v62 (copy), v63 (copy), v64 (copy), v65 (copy), v19 (ref)
        if v60.serialize ~= nil then
            v66 = v60.serialize(v61, v62, v63, v64, v65, v19);
            return;
        else
            v66 = v60.print(v61, function(v67) --[[ Line: 286 ]]
                -- upvalues: v19 (ref), v62 (ref), v63 (ref), v64 (ref), v65 (ref)
                return v19(v67, v62, v63, v64, v65);
            end, function(v68) --[[ Line: 289 ]]
                -- upvalues: v63 (ref), v62 (ref)
                local v69 = v63 .. v62.indent;
                return v69 .. v68:gsub("\n", "\n" .. v69);
            end, {
                edgeSpacing = v62.spacingOuter, 
                min = v62.min, 
                spacing = v62.spacingInner
            }, v62.colors);
            return;
        end;
    end);
    if not l_status_0 then
        error(v18(l_result_0));
    end;
    if typeof(v66) ~= "string" then
        error(l_Error_0(string.format("pretty-format: Plugin must return type \"string\" but instead returned \"%s\".", (typeof(v66)))));
    end;
    return v66;
end;
local function v78(v72, v73) --[[ Line: 316 ]] --[[ Name: findPlugin ]]
    -- upvalues: v18 (copy)
    for _, v75 in ipairs(v72) do
        local l_status_1, l_result_1 = pcall(v75.test, v73);
        if not l_status_1 then
            error(v18(l_result_1));
        elseif l_result_1 then
            return v75;
        end;
    end;
    return nil;
end;
v19 = function(v79, v80, v81, v82, v83, v84) --[[ Line: 329 ]] --[[ Name: printer ]]
    -- upvalues: v78 (copy), v39 (copy), v57 (copy)
    local v85 = v78(v80.plugins, v79);
    if v85 ~= nil then
        return printPlugin(v85, v79, v80, v81, v82, v83);
    else
        local v86 = v39(v79, v80.printFunctionName, v80.escapeRegex, v80.escapeString);
        if v86 ~= nil then
            return v86;
        else
            return v57(v79, v80, v81, v82, v83, v84);
        end;
    end;
end;
local v87 = {
    callToJSON = true, 
    escapeRegex = false, 
    escapeString = true, 
    highlight = false, 
    indent = 2, 
    maxDepth = 1e999, 
    min = false, 
    plugins = {}, 
    printFunctionName = true, 
    theme = nil
};
local function v91(v88) --[[ Line: 378 ]] --[[ Name: validateOptions ]]
    -- upvalues: v87 (copy), l_Error_0 (copy)
    for v89, _ in pairs(v88) do
        if v87[v89] == nil then
            error(l_Error_0(string.format("pretty-format: Unknown option \"%s\".", (tostring(v89)))));
        end;
    end;
    if v88.min and v88.indent ~= nil and v88.indent ~= 0 then
        error(l_Error_0("pretty-format: Options \"min\" and \"indent\" cannot be used together."));
    end;
end;
local function _(v92, v93) --[[ Line: 395 ]] --[[ Name: getOption ]]
    -- upvalues: v87 (copy)
    if v92 and v92[v93] ~= nil then
        return v92[v93];
    else
        return v87[v93];
    end;
end;
local function _(v95) --[[ Line: 402 ]] --[[ Name: getIndent ]]
    -- upvalues: v87 (copy), v20 (ref)
    if v95 and v95.min then
        return "";
    else
        local l_indent_0 = v87.indent;
        if v95 and v95.indent ~= nil then
            l_indent_0 = v95.indent;
        end;
        return v20(l_indent_0);
    end;
end;
local function _(v98) --[[ Line: 413 ]] --[[ Name: getSpacingInner ]]
    if v98 and v98.min then
        return " ";
    else
        return "\n";
    end;
end;
local function _(v100) --[[ Line: 420 ]] --[[ Name: getSpacingOuter ]]
    if v100 and v100.min then
        return "";
    else
        return "\n";
    end;
end;
local function v106(v102) --[[ Line: 428 ]] --[[ Name: getConfig ]]
    -- upvalues: v87 (copy), v20 (ref)
    local v103 = {
        callToJSON = if v102 and v102.callToJSON ~= nil then v102.callToJSON else v87.callToJSON, 
        colors = nil, 
        escapeRegex = if v102 and v102.escapeRegex ~= nil then v102.escapeRegex else v87.escapeRegex, 
        escapeString = if v102 and v102.escapeString ~= nil then v102.escapeString else v87.escapeString
    };
    local v104;
    if v102 and v102.min then
        v104 = "";
    else
        local l_indent_1 = v87.indent;
        if v102 and v102.indent ~= nil then
            l_indent_1 = v102.indent;
        end;
        v104 = v20(l_indent_1);
    end;
    v103.indent = v104;
    v103.maxDepth = if v102 and v102.maxDepth ~= nil then v102.maxDepth else v87.maxDepth;
    v103.min = if v102 and v102.min ~= nil then v102.min else v87.min;
    v103.plugins = if v102 and v102.plugins ~= nil then v102.plugins else v87.plugins;
    v103.printFunctionName = if v102 and v102.printFunctionName ~= nil then v102.printFunctionName else v87.printFunctionName;
    v103.spacingInner = v102 and v102.min and " " or "\n";
    v103.spacingOuter = v102 and v102.min and "" or "\n";
    return v103;
end;
v20 = function(v107) --[[ Line: 447 ]] --[[ Name: createIndent ]]
    return string.rep(" ", v107);
end;
local function v112(v108, v109) --[[ Line: 457 ]] --[[ Name: prettyFormat ]]
    -- upvalues: v91 (copy), v78 (copy), v106 (copy), v39 (copy), v87 (copy), v57 (copy)
    if v109 then
        v91(v109);
        if v109.plugins then
            local v110 = v78(v109.plugins, v108);
            if v110 ~= nil then
                return printPlugin(v110, v108, v106(v109), "", 0, {});
            end;
        end;
    end;
    local v111 = v39(v108, if v109 and v109.printFunctionName ~= nil then v109.printFunctionName else v87.printFunctionName, if v109 and v109.escapeRegex ~= nil then v109.escapeRegex else v87.escapeRegex, if v109 and v109.escapeString ~= nil then v109.escapeString else v87.escapeString);
    if v111 ~= nil then
        return v111;
    else
        return v57(v108, v106(v109), "", 0, {}, nil);
    end;
end;
local v113 = {
    AsymmetricMatcher = v9, 
    ConvertAnsi = v10, 
    RobloxInstance = v11
};
return {
    prettyFormat = v112, 
    plugins = v113
};