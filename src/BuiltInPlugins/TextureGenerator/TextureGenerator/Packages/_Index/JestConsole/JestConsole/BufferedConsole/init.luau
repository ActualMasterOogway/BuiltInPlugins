local v0 = {};
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local v3 = require(l_Parent_1.LuauPolyfill);
local l_Array_0 = v3.Array;
local l_Boolean_0 = v3.Boolean;
local l_String_0 = v3.String;
local l_Error_0 = v3.Error;
local l_inspect_0 = v3.util.inspect;
local l_default_0 = require(l_Parent_0.Console).default;
local v10 = require(l_Parent_0.helpers);
local l_format_0 = v10.format;
local l_formatWithOptions_0 = v10.formatWithOptions;
local v13 = require(l_Parent_1.ChalkLua);
local v14 = require(l_Parent_1.JestUtil);
local l_ErrorWithStack_0 = v14.ErrorWithStack;
local l_formatTime_0 = v14.formatTime;
local _ = require(l_Parent_0.types);
local _ = require(l_Parent_1.RobloxShared);
local v19 = nil;
local v20 = setmetatable({}, {
    __index = l_default_0
});
v20.__index = v20;
v20.new = function() --[[ Line: 87 ]] --[[ Name: new ]]
    -- upvalues: l_default_0 (copy), v20 (copy)
    local v23 = setmetatable(l_default_0.new({
        write = function(v21, v22) --[[ Line: 90 ]] --[[ Name: write ]]
            -- upvalues: v20 (ref)
            v20.write(v21._buffer, "log", v22, nil);
            return true;
        end
    }), v20);
    v23._buffer = {};
    v23._counters = {};
    v23._timers = {};
    v23._groupDepth = 0;
    v23.Console = l_default_0;
    return v23;
end;
v20.write = function(v24, v25, v26, v27) --[[ Line: 106 ]] --[[ Name: write ]]
    -- upvalues: l_ErrorWithStack_0 (copy), v20 (copy), v19 (ref), l_Array_0 (copy), l_String_0 (copy), l_Boolean_0 (copy)
    local v28 = if v27 ~= nil then v27 else 2;
    local l_stack_0 = l_ErrorWithStack_0.new(nil, v20.write).stack;
    v19(l_stack_0, "always have a stack trace");
    local v30 = l_Array_0.join(l_Array_0.filter(l_Array_0.slice(l_String_0.split(l_stack_0, "\n"), v28), l_Boolean_0.toJSBoolean), "\n");
    table.insert(v24, {
        message = v26, 
        origin = v30, 
        type = v25
    });
    return v24;
end;
v20._log = function(v31, v32, v33) --[[ Line: 118 ]] --[[ Name: _log ]]
    -- upvalues: v20 (copy)
    v20.write(v31._buffer, v32, ("  "):rep(v31._groupDepth) .. v33, 3);
end;
v20.assert = function(v34, v35, v36) --[[ Line: 122 ]] --[[ Name: assert ]]
    xpcall(function() --[[ Line: 123 ]]
        -- upvalues: v35 (copy)
        assert(v35);
    end, function(v37) --[[ Line: 125 ]]
        -- upvalues: v36 (copy), v34 (copy)
        local v38 = "";
        if v36 ~= nil then
            v38 = " " .. tostring(v36);
        end;
        v34:_log("assert", tostring(v37) .. v38);
    end);
end;
v20.count = function(v39, v40) --[[ Line: 135 ]] --[[ Name: count ]]
    -- upvalues: l_format_0 (copy)
    local v41 = if v40 ~= nil then v40 else "default";
    if v39._counters[v41] == nil then
        v39._counters[v41] = 0;
    end;
    local l__counters_0 = v39._counters;
    l__counters_0[v41] = l__counters_0[v41] + 1;
    v39:_log("count", l_format_0("%s: %s", v41, v39._counters[v41]));
end;
v20.countReset = function(v43, v44) --[[ Line: 144 ]] --[[ Name: countReset ]]
    local v45 = if v44 ~= nil then v44 else "default";
    v43._counters[v45] = 0;
end;
v20.debug = function(v46, v47, ...) --[[ Line: 149 ]] --[[ Name: debug ]]
    -- upvalues: l_format_0 (copy)
    v46:_log("debug", l_format_0(v47, ...));
end;
v20.dir = function(v48, v49, v50) --[[ Line: 153 ]] --[[ Name: dir ]]
    -- upvalues: l_inspect_0 (copy), l_formatWithOptions_0 (copy)
    local v51 = v50 or {};
    local v52 = l_inspect_0(v49, v51);
    v48:_log("dir", l_formatWithOptions_0(v51, v52));
end;
v20.dirxml = function(v53, v54, ...) --[[ Line: 159 ]] --[[ Name: dirxml ]]
    -- upvalues: l_format_0 (copy)
    v53:_log("dirxml", l_format_0(v54, ...));
end;
v20.error = function(v55, v56, ...) --[[ Line: 163 ]] --[[ Name: error ]]
    -- upvalues: l_format_0 (copy)
    v55:_log("error", l_format_0(v56, ...));
end;
v20.group = function(v57, v58, ...) --[[ Line: 167 ]] --[[ Name: group ]]
    -- upvalues: l_Boolean_0 (copy), v13 (copy), l_format_0 (copy)
    local v59 = {
        ...
    };
    v57._groupDepth = v57._groupDepth + 1;
    if l_Boolean_0.toJSBoolean(v58) or #v59 > 0 then
        v57:_log("group", v13.bold(l_format_0(v58, ...)));
    end;
end;
v20.groupCollapsed = function(v60, v61, ...) --[[ Line: 175 ]] --[[ Name: groupCollapsed ]]
    -- upvalues: l_Boolean_0 (copy), v13 (copy), l_format_0 (copy)
    local v62 = {
        ...
    };
    v60._groupDepth = v60._groupDepth + 1;
    if l_Boolean_0.toJSBoolean(v61) or #v62 > 0 then
        v60:_log("groupCollapsed", v13.bold(l_format_0(v61, ...)));
    end;
end;
v20.groupEnd = function(v63) --[[ Line: 183 ]] --[[ Name: groupEnd ]]
    if v63._groupDepth > 0 then
        v63._groupDepth = v63._groupDepth - 1;
    end;
end;
v20.info = function(v64, v65, ...) --[[ Line: 189 ]] --[[ Name: info ]]
    -- upvalues: l_format_0 (copy)
    v64:_log("info", l_format_0(v65, ...));
end;
v20.log = function(v66, v67, ...) --[[ Line: 193 ]] --[[ Name: log ]]
    -- upvalues: l_format_0 (copy)
    v66:_log("log", l_format_0(v67, ...));
end;
v20.time = function(v68, v69) --[[ Line: 197 ]] --[[ Name: time ]]
    -- upvalues: l_Boolean_0 (copy)
    local v70 = if v69 ~= nil then v69 else "default";
    if l_Boolean_0.toJSBoolean(v68._timers[v70]) then
        return;
    else
        v68._timers[v70] = DateTime.now();
        return;
    end;
end;
v20.timeEnd = function(v71, v72) --[[ Line: 205 ]] --[[ Name: timeEnd ]]
    -- upvalues: l_Boolean_0 (copy), l_format_0 (copy), l_formatTime_0 (copy)
    local v73 = if v72 ~= nil then v72 else "default";
    local v74 = v71._timers[v73];
    if l_Boolean_0.toJSBoolean(v74) then
        local v75 = DateTime.now().UnixTimestampMillis - v74.UnixTimestampMillis;
        v71:_log("time", l_format_0("%s: %s", v73, l_formatTime_0(v75)));
        v71._timers[v73] = nil;
    end;
end;
v20.timeLog = function(v76, v77, ...) --[[ Line: 216 ]] --[[ Name: timeLog ]]
    -- upvalues: l_Boolean_0 (copy), l_format_0 (copy), l_formatTime_0 (copy)
    local v78 = if v77 ~= nil then v77 else "default";
    local v79 = v76._timers[v78];
    if l_Boolean_0.toJSBoolean(v79) then
        local v80 = DateTime.now().UnixTimestampMillis - v79.UnixTimestampMillis;
        v76:_log("time", l_format_0("%s: %s", v78, l_formatTime_0(v80), ...));
    end;
end;
v20.warn = function(v81, v82, ...) --[[ Line: 226 ]] --[[ Name: warn ]]
    -- upvalues: l_format_0 (copy)
    v81:_log("warn", l_format_0(v82, ...));
end;
v20.getBuffer = function(v83) --[[ Line: 230 ]] --[[ Name: getBuffer ]]
    if #v83._buffer > 0 then
        return v83._buffer;
    else
        return nil;
    end;
end;
v19 = function(v84, v85) --[[ Line: 234 ]] --[[ Name: invariant ]]
    -- upvalues: l_Boolean_0 (copy), l_Error_0 (copy)
    if not l_Boolean_0.toJSBoolean(v84) then
        error(l_Error_0.new(v85));
    end;
end;
v0.default = v20;
return v0;