local v0 = {};
local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_default_0 = require(l_Parent_0.Console).default;
local v4 = require(l_Parent_1.LuauPolyfill);
local l_Boolean_0 = v4.Boolean;
local l_inspect_0 = v4.util.inspect;
local v7 = require(l_Parent_0.helpers);
local l_format_0 = v7.format;
local l_formatWithOptions_0 = v7.formatWithOptions;
local _ = require(l_Parent_1.RobloxShared);
local v11 = require(l_Parent_1.ChalkLua);
local v12 = require(l_Parent_1.JestUtil);
local l_clearLine_0 = v12.clearLine;
local l_formatTime_0 = v12.formatTime;
local _ = require(l_Parent_0.types);
local v16 = setmetatable({}, {
    __index = l_default_0
});
v16.__index = v16;
v16.new = function(v17, v18, v19) --[[ Line: 84 ]] --[[ Name: new ]]
    -- upvalues: l_default_0 (copy), v16 (copy)
    local v20 = setmetatable(l_default_0.new(v17, v18), v16);
    local v23 = if v19 ~= nil then v19 else function(_, v22) --[[ Line: 93 ]]
        return v22;
    end;
    v20._counters = {};
    v20._timers = {};
    v20._groupDepth = 0;
    v20.Console = l_default_0;
    v20._stdout = v17;
    v20._stderr = v18;
    v20._formatBuffer = v23;
    return v20;
end;
v16._log = function(v24, v25, v26) --[[ Line: 110 ]] --[[ Name: _log ]]
    -- upvalues: l_clearLine_0 (copy), l_default_0 (copy)
    l_clearLine_0(v24._stdout);
    l_default_0.log(v24, v24._formatBuffer(v25, ("  "):rep(v24._groupDepth) .. v26));
end;
v16._logError = function(v27, v28, v29) --[[ Line: 116 ]] --[[ Name: _logError ]]
    -- upvalues: l_clearLine_0 (copy), l_default_0 (copy)
    l_clearLine_0(v27._stderr);
    l_default_0.error(v27, v27._formatBuffer(v28, ("  "):rep(v27._groupDepth) .. v29));
end;
v16.assert = function(v30, v31, v32) --[[ Line: 122 ]] --[[ Name: assert ]]
    xpcall(function() --[[ Line: 123 ]]
        -- upvalues: v31 (copy)
        assert(v31);
    end, function(v33) --[[ Line: 125 ]]
        -- upvalues: v32 (copy), v30 (copy)
        local v34 = "";
        if v32 ~= nil then
            v34 = " " .. tostring(v32);
        end;
        v30:_logError("assert", tostring(v33) .. v34);
    end);
end;
v16.count = function(v35, v36) --[[ Line: 135 ]] --[[ Name: count ]]
    -- upvalues: l_format_0 (copy)
    local v37 = if v36 ~= nil then v36 else "default";
    if v35._counters[v37] == nil then
        v35._counters[v37] = 0;
    end;
    local l__counters_0 = v35._counters;
    l__counters_0[v37] = l__counters_0[v37] + 1;
    v35:_log("count", l_format_0("%s: %s", v37, v35._counters[v37]));
end;
v16.countReset = function(v39, v40) --[[ Line: 146 ]] --[[ Name: countReset ]]
    local v41 = if v40 ~= nil then v40 else "default";
    v39._counters[v41] = 0;
end;
v16.debug = function(v42, v43, ...) --[[ Line: 151 ]] --[[ Name: debug ]]
    -- upvalues: l_format_0 (copy)
    v42:_log("debug", l_format_0(v43, ...));
end;
v16.dir = function(v44, v45, v46) --[[ Line: 155 ]] --[[ Name: dir ]]
    -- upvalues: l_inspect_0 (copy), l_formatWithOptions_0 (copy)
    local v47 = v46 or {};
    local v48 = l_inspect_0(v45, v47);
    v44:_log("dir", l_formatWithOptions_0(v47, v48));
end;
v16.dirxml = function(v49, v50, ...) --[[ Line: 161 ]] --[[ Name: dirxml ]]
    -- upvalues: l_format_0 (copy)
    v49:_log("dirxml", l_format_0(v50, ...));
end;
v16.error = function(v51, v52, ...) --[[ Line: 165 ]] --[[ Name: error ]]
    -- upvalues: l_format_0 (copy)
    v51:_logError("error", l_format_0(v52, ...));
end;
v16.group = function(v53, v54, ...) --[[ Line: 169 ]] --[[ Name: group ]]
    -- upvalues: l_Boolean_0 (copy), v11 (copy), l_format_0 (copy)
    local v55 = {
        ...
    };
    v53._groupDepth = v53._groupDepth + 1;
    if l_Boolean_0.toJSBoolean(v54) or #v55 > 0 then
        v53:_log("group", v11.bold(l_format_0(v54, ...)));
    end;
end;
v16.groupCollapsed = function(v56, v57, ...) --[[ Line: 177 ]] --[[ Name: groupCollapsed ]]
    -- upvalues: l_Boolean_0 (copy), v11 (copy), l_format_0 (copy)
    local v58 = {
        ...
    };
    v56._groupDepth = v56._groupDepth + 1;
    if l_Boolean_0.toJSBoolean(v57) or #v58 > 0 then
        v56:_log("groupCollapsed", v11.bold(l_format_0(v57, ...)));
    end;
end;
v16.groupEnd = function(v59) --[[ Line: 185 ]] --[[ Name: groupEnd ]]
    if v59._groupDepth > 0 then
        v59._groupDepth = v59._groupDepth - 1;
    end;
end;
v16.info = function(v60, v61, ...) --[[ Line: 191 ]] --[[ Name: info ]]
    -- upvalues: l_format_0 (copy)
    v60:_log("info", l_format_0(v61, ...));
end;
v16.log = function(v62, v63, ...) --[[ Line: 195 ]] --[[ Name: log ]]
    -- upvalues: l_format_0 (copy)
    v62:_log("log", l_format_0(v63, ...));
end;
v16.time = function(v64, v65) --[[ Line: 199 ]] --[[ Name: time ]]
    local v66 = if v65 ~= nil then v65 else "default";
    if v64._timers[v66] ~= nil then
        return;
    else
        v64._timers[v66] = DateTime.now();
        return;
    end;
end;
v16.timeEnd = function(v67, v68) --[[ Line: 207 ]] --[[ Name: timeEnd ]]
    -- upvalues: l_Boolean_0 (copy), l_format_0 (copy), l_formatTime_0 (copy)
    local v69 = if v68 ~= nil then v68 else "default";
    local v70 = v67._timers[v69];
    if l_Boolean_0.toJSBoolean(v70) then
        local v71 = DateTime.now().UnixTimestampMillis - v70.UnixTimestampMillis;
        v67:_log("time", l_format_0("%s: %s", v69, l_formatTime_0(v71)));
        v67._timers[v69] = nil;
    end;
end;
v16.timeLog = function(v72, v73, ...) --[[ Line: 218 ]] --[[ Name: timeLog ]]
    -- upvalues: l_Boolean_0 (copy), l_format_0 (copy), l_formatTime_0 (copy)
    local v74 = if v73 ~= nil then v73 else "default";
    local v75 = v72._timers[v74];
    if l_Boolean_0.toJSBoolean(v75) then
        local v76 = DateTime.now().UnixTimestampMillis - v75.UnixTimestampMillis;
        v72:_log("time", l_format_0("%s: %s", v74, l_formatTime_0(v76), ...));
    end;
end;
v16.warn = function(v77, v78, ...) --[[ Line: 228 ]] --[[ Name: warn ]]
    -- upvalues: l_format_0 (copy)
    v77:_logError("warn", l_format_0(v78, ...));
end;
v16.getBuffer = function(_) --[[ Line: 232 ]] --[[ Name: getBuffer ]]
    return nil;
end;
v0.default = v16;
return v0;