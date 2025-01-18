local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_String_0 = v1.String;
local v5 = {};
local v6 = require(l_Parent_0.ChalkLua);
local _ = require(l_Parent_0.JestTypes);
local l_getType_0 = require(l_Parent_0.JestGetType).getType;
local l_ValidationError_0 = require(l_Parent_0.JestValidate).ValidationError;
local v10 = require(script.Parent.utils);
local l_BULLET_0 = v10.BULLET;
local l_DOCUMENTATION_NOTE_0 = v10.DOCUMENTATION_NOTE;
local l_JSON_0 = require(l_Parent_0.RobloxShared).nodeUtils.JSON;
local v14 = nil;
local v15 = {
    "table", 
    "ModuleScript"
};
local v16 = ("%sReporter Validation Error"):format((tostring(l_BULLET_0)));
local function v20(v17, v18) --[[ Line: 53 ]] --[[ Name: createReporterError ]]
    -- upvalues: v6 (copy), l_Array_0 (copy), v15 (copy), l_getType_0 (copy), l_ValidationError_0 (copy), v16 (copy), l_DOCUMENTATION_NOTE_0 (copy)
    local v19 = ("  Reporter at index %s must be of type:\n"):format((tostring(v17))) .. ("    %s\n"):format(v6.green(v6.bold(l_Array_0.join(v15, " or ")))) .. "  but instead received:\n" .. ("    %s"):format(v6.red(v6.bold(l_getType_0(v18))));
    return l_ValidationError_0.new(v16, v19, l_DOCUMENTATION_NOTE_0);
end;
v5.createReporterError = v20;
local function v28(v21, v22, v23, v24, v25, v26) --[[ Line: 65 ]] --[[ Name: createArrayReporterError ]]
    -- upvalues: v6 (copy), l_getType_0 (copy), l_Array_0 (copy), l_String_0 (copy), l_JSON_0 (copy), l_ValidationError_0 (copy), v16 (copy), l_DOCUMENTATION_NOTE_0 (copy)
    local v27 = ("  Unexpected value for %s "):format(v26) .. ("at index %s of reporter at index %s\n"):format(tostring(v23), (tostring(v22))) .. "  Expected:\n" .. ("    %s\n"):format(v6.red(v6.bold(v25))) .. "  Got:\n" .. ("    %s\n"):format(v6.green(v6.bold(l_getType_0(v24)))) .. "  Reporter configuration:\n" .. ("    %s"):format(v6.green(v6.bold(l_Array_0.join(l_String_0.split(l_JSON_0.stringify(v21, nil, 2), "\n"), "\n    "))));
    return l_ValidationError_0.new(v16, v27, l_DOCUMENTATION_NOTE_0);
end;
v5.createArrayReporterError = v28;
v5.validateReporters = function(v29) --[[ Line: 87 ]] --[[ Name: validateReporters ]]
    -- upvalues: l_Array_0 (copy), l_Boolean_0 (copy), v14 (ref), v20 (copy)
    return l_Array_0.every(v29, function(v30, v31) --[[ Line: 88 ]]
        -- upvalues: l_Boolean_0 (ref), l_Array_0 (ref), v14 (ref), v20 (ref)
        if l_Boolean_0.toJSBoolean(l_Array_0.isArray(v30)) then
            v14(v30, v31);
        elseif typeof(v30) ~= "string" then
            error(v20(v31, v30));
        end;
        return true;
    end);
end;
v14 = function(v32, v33) --[[ Line: 99 ]] --[[ Name: validateArrayReporter ]]
    -- upvalues: v28 (copy)
    local v34, v35 = table.unpack(v32, 1, 2);
    if typeof(v34) ~= "Instance" or not v34:isA("ModuleScript") then
        error(v28(v32, v33, 0, v34, "ModuleScript", "Path"));
        return;
    else
        if typeof(v35) ~= "table" then
            error(v28(v32, v33, 1, v35, "table", "Reporter Configuration"));
        end;
        return;
    end;
end;
return v5;