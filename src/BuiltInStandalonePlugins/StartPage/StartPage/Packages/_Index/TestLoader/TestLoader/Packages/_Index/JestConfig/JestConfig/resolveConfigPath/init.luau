local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Error_0 = v1.Error;
local l_String_0 = v1.String;
local l_console_0 = v1.console;
local v6 = {};
local v7 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_JEST_CONFIG_BASE_NAME_0 = require(script.Parent.constants).JEST_CONFIG_BASE_NAME;
local l_DOCUMENTATION_NOTE_0 = require(script.Parent.utils).DOCUMENTATION_NOTE;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local function _(v14) --[[ Line: 50 ]] --[[ Name: isFile ]]
    -- upvalues: l_String_0 (copy)
    local v15 = false;
    if typeof(v14) == "Instance" then
        v15 = v14:IsA("ModuleScript") and l_String_0.endsWith(v14.Name, ".config");
    end;
    return v15;
end;
local function _(v17) --[[ Line: 56 ]] --[[ Name: getConfigFilename ]]
    -- upvalues: l_JEST_CONFIG_BASE_NAME_0 (copy)
    return l_JEST_CONFIG_BASE_NAME_0 .. v17;
end;
v6.default = function(v19, v20, v21) --[[ Line: 60 ]]
    -- upvalues: l_String_0 (copy), l_Error_0 (copy), v11 (ref)
    local v22 = v21 ~= nil and v21;
    local function _(v23, v24) --[[ Line: 69 ]] --[[ Name: resolvePath ]]
        return v23[v24];
    end;
    local v26 = nil;
    v26 = if typeof(v19) == "string" then v20[v19] else v19;
    local l_v26_0 = v26;
    local v28 = false;
    if typeof(l_v26_0) == "Instance" then
        v28 = l_v26_0:IsA("ModuleScript") and l_String_0.endsWith(l_v26_0.Name, ".config");
    end;
    if v28 then
        return v26;
    else
        if v26 == nil then
            error(l_Error_0.new("Can't find a root directory while resolving a config file path.\n" .. ("Provided path to resolve: %s\n"):format((tostring(v19))) .. ("cwd: %s"):format((tostring(v20)))));
        end;
        return v11(v26, v19, v20, v22);
    end;
end;
local function v30(v29) --[[ Line: 106 ]] --[[ Name: isJestConfigFile ]]
    -- upvalues: l_JEST_CONFIG_BASE_NAME_0 (copy)
    return v29:IsA("ModuleScript") and v29.Name == l_JEST_CONFIG_BASE_NAME_0;
end;
v11 = function(v31, v32, v33, v34) --[[ Line: 111 ]] --[[ Name: resolveConfigPathByTraversing ]]
    -- upvalues: l_Error_0 (copy), v12 (ref), l_Array_0 (copy), v30 (copy), l_console_0 (copy), v13 (ref), v11 (ref)
    if v31 == nil or typeof(v31.GetChildren) ~= "function" then
        error(l_Error_0.new(v12(v32, v33)));
    end;
    local v38 = l_Array_0.filter(v31:GetChildren(), function(v35) --[[ Line: 125 ]]
        -- upvalues: v30 (ref)
        local l_status_0, l_result_0 = pcall(v30, v35);
        return l_status_0 and l_result_0;
    end);
    if not v34 and #v38 > 1 then
        l_console_0.warn(v13(v38));
    end;
    if #v38 > 0 then
        return v38[1];
    else
        if v31 == game then
            error(l_Error_0.new(v12(v32, v33)));
        end;
        return v11(v31.Parent, v32, v33, v34);
    end;
end;
v12 = function(v39, v40) --[[ Line: 172 ]] --[[ Name: makeResolutionErrorMessage ]]
    -- upvalues: l_Array_0 (copy), l_JEST_CONFIG_BASE_NAME_0 (copy)
    return "Could not find a config file based on provided values:\n" .. ("path: \"%s\"\n"):format((tostring(v39))) .. ("cwd: \"%s\"\n"):format((tostring(v40))) .. "Config paths must be specified by either a direct path to a config script\n" .. "or a path to a directory. If directory is given, Jest will try to\n" .. ("traverse directory tree up, until it finds one of those files in exact order: %s."):format(l_Array_0.join(l_Array_0.map({
        ".lua"
    }, function(v41) --[[ Line: 192 ]]
        -- upvalues: l_JEST_CONFIG_BASE_NAME_0 (ref)
        return ("\"%s\""):format(l_JEST_CONFIG_BASE_NAME_0 .. v41);
    end), " or "));
end;
local _ = function(_) --[[ Line: 201 ]] --[[ Name: extraIfPackageJson ]]
    return "";
end;
v13 = function(v44) --[[ Line: 210 ]] --[[ Name: makeMultipleConfigsWarning ]]
    -- upvalues: v7 (copy), l_Array_0 (copy), l_DOCUMENTATION_NOTE_0 (copy)
    return v7.yellow({
        l_Array_0.join(l_Array_0.concat({}, {
            v7.bold("\226\151\143 Multiple configurations found:")
        }, l_Array_0.map(v44, function(v45) --[[ Line: 216 ]]
            return ("    * %s%s"):format(tostring(""), (tostring(v45)));
        end), {
            "", 
            "  Implicit config resolution does not allow multiple configuration files.", 
            "  Either remove unused config files or select one explicitly with `--config`."
        }), "\n"), 
        l_DOCUMENTATION_NOTE_0
    });
end;
return v6;