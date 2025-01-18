local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v2 = {};
local v3 = nil;
local _ = require(script.Parent.ReactFiberLane);
local l_enableDebugTracing_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableDebugTracing;
local v6 = nil;
local v7 = {};
local v8 = 0;
decimalToBinaryString = function(v9) --[[ Line: 39 ]] --[[ Name: decimalToBinaryString ]]
    local v10 = "";
    repeat
        local v11, v12 = math.modf(v9 / 2);
        v9 = v11;
        v10 = math.ceil(v12) .. v10;
    until v9 == 0;
    local v13 = 31 - string.len(v10);
    return string.rep("0", v13) .. v10;
end;
local function _(v14) --[[ Line: 52 ]] --[[ Name: formatLanes ]]
    return "0b" .. decimalToBinaryString(v14);
end;
local function v18(...) --[[ Line: 58 ]] --[[ Name: group ]]
    -- upvalues: v7 (copy), v6 (ref), l_console_0 (copy), v3 (ref)
    for _, v17 in {
        ...
    } do
        table.insert(v7, v17);
    end;
    if v6 == nil then
        v6 = l_console_0.log;
        l_console_0.log = v3;
    end;
end;
local function v19() --[[ Line: 68 ]] --[[ Name: groupEnd ]]
    -- upvalues: v7 (copy), v8 (ref), l_console_0 (copy), v6 (ref)
    table.remove(v7, 1);
    while v8 > #v7 do
        l_console_0.groupEnd();
        v8 = v8 - 1;
    end;
    if #v7 == 0 then
        l_console_0.log = v6;
        v6 = nil;
    end;
end;
v3 = function(...) --[[ Line: 80 ]] --[[ Name: log ]]
    -- upvalues: v8 (ref), v7 (copy), l_console_0 (copy), v6 (ref)
    if v8 < #v7 then
        for v20 = v8 + 1, #v7 do
            local v21 = v7[v20];
            l_console_0.group(v21);
        end;
        v8 = #v7;
    end;
    if typeof(v6) == "function" then
        v6(...);
        return;
    else
        l_console_0.log(...);
        return;
    end;
end;
v2.logCommitStarted = function(v22) --[[ Line: 98 ]] --[[ Name: logCommitStarted ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v18 (copy)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v18(string.format("* commit (%s)", "0b" .. decimalToBinaryString(v22)), "", "", "");
    end;
end;
v2.logCommitStopped = function() --[[ Line: 113 ]] --[[ Name: logCommitStopped ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v19 (copy)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v19();
    end;
end;
v2.logComponentSuspended = function(v23, v24) --[[ Line: 141 ]] --[[ Name: logComponentSuspended ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v3 (ref)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v3(string.format("* %s suspended", v23));
        v24:andThen(function() --[[ Line: 155 ]]
            -- upvalues: v3 (ref), v23 (copy)
            v3(string.format("* %s resolved", v23));
        end, function() --[[ Line: 164 ]]
            -- upvalues: v3 (ref), v23 (copy)
            v3(string.format("* %s rejected", v23));
        end);
    end;
end;
v2.logLayoutEffectsStarted = function(v25) --[[ Line: 179 ]] --[[ Name: logLayoutEffectsStarted ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v18 (copy)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v18(string.format("* layout effects (%s)", "0b" .. decimalToBinaryString(v25)));
    end;
end;
v2.logLayoutEffectsStopped = function() --[[ Line: 194 ]] --[[ Name: logLayoutEffectsStopped ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v19 (copy)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v19();
    end;
end;
v2.logPassiveEffectsStarted = function(v26) --[[ Line: 203 ]] --[[ Name: logPassiveEffectsStarted ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v18 (copy)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v18(string.format("* passive effects (%s)", "0b" .. decimalToBinaryString(v26)));
    end;
end;
v2.logPassiveEffectsStopped = function() --[[ Line: 218 ]] --[[ Name: logPassiveEffectsStopped ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v19 (copy)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v19();
    end;
end;
v2.logRenderStarted = function(v27) --[[ Line: 227 ]] --[[ Name: logRenderStarted ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v18 (copy)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v18(string.format("* render (%s)", "0b" .. decimalToBinaryString(v27)));
    end;
end;
v2.logRenderStopped = function() --[[ Line: 242 ]] --[[ Name: logRenderStopped ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v19 (copy)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v19();
    end;
end;
v2.logForceUpdateScheduled = function(v28, v29) --[[ Line: 251 ]] --[[ Name: logForceUpdateScheduled ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v3 (ref)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v3(string.format("* %s forced update (%s)", v28, "0b" .. decimalToBinaryString(v29)));
    end;
end;
v2.logStateUpdateScheduled = function(v30, v31, _) --[[ Line: 266 ]] --[[ Name: logStateUpdateScheduled ]]
    -- upvalues: l_enableDebugTracing_0 (copy), v3 (ref)
    if _G.__DEV__ and l_enableDebugTracing_0 then
        v3(string.format("* %s updated state (%s)", v30, "0b" .. decimalToBinaryString(v31)));
    end;
end;
return v2;