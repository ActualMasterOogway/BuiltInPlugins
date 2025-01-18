local v0 = {};
local l_Parent_0 = script.Parent.Parent;
local _ = require(script.Parent.ReactFiberLane);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(l_Parent_0.Shared);
local l_enableSchedulingProfiler_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSchedulingProfiler;
local l_ReactVersion_0 = require(l_Parent_0.Shared).ReactVersion;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v8 = _G.performance ~= nil;
local l_performance_0 = _G.performance;
formatLanes = function(v10) --[[ Line: 38 ]] --[[ Name: formatLanes ]]
    return (tostring(v10));
end;
if l_enableSchedulingProfiler_0 and v8 then
    l_performance_0.mark("--react-init-" .. tostring(l_ReactVersion_0));
end;
v0.markCommitStarted = function(v11) --[[ Line: 49 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        l_performance_0.mark("--commit-start-" .. formatLanes(v11));
    end;
end;
v0.markCommitStopped = function() --[[ Line: 57 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        l_performance_0.mark("--commit-stop");
    end;
end;
local v12 = {};
local v13 = 0;
getWakeableID = function(v14) --[[ Line: 71 ]] --[[ Name: getWakeableID ]]
    -- upvalues: v12 (copy), v13 (ref)
    if not v12[v14] ~= nil then
        v12[v14] = v13;
        v13 = v13 + 1;
    end;
    return v12[v14];
end;
v0.markComponentSuspended = function(v15, v16) --[[ Line: 79 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_getComponentName_0 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        local v17 = getWakeableID(v16);
        local v18 = l_getComponentName_0(v15.type) or "Unknown";
        l_performance_0.mark("--suspense-suspend-" .. tostring(v17) .. "-" .. v18);
        v16:andThen(function() --[[ Line: 87 ]]
            -- upvalues: l_performance_0 (ref), v17 (copy), v18 (copy)
            l_performance_0.mark("--suspense-resolved-" .. tostring(v17) .. "-" .. v18);
        end, function() --[[ Line: 90 ]]
            -- upvalues: l_performance_0 (ref), v17 (copy), v18 (copy)
            l_performance_0.mark("--suspense-rejected-" .. tostring(v17) .. "-" .. v18);
        end);
    end;
end;
v0.markLayoutEffectsStarted = function(v19) --[[ Line: 98 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        l_performance_0.mark("--layout-effects-start-" .. formatLanes(v19));
    end;
end;
v0.markLayoutEffectsStopped = function() --[[ Line: 106 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        l_performance_0.mark("--layout-effects-stop");
    end;
end;
v0.markPassiveEffectsStarted = function(v20) --[[ Line: 114 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        l_performance_0.mark("--passive-effects-start-" .. formatLanes(v20));
    end;
end;
v0.markPassiveEffectsStopped = function() --[[ Line: 122 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        l_performance_0.mark("--passive-effects-stop");
    end;
end;
v0.markRenderStarted = function(v21) --[[ Line: 130 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        l_performance_0.mark("--render-start-" .. formatLanes(v21));
    end;
end;
v0.markRenderYielded = function() --[[ Line: 138 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        l_performance_0.mark("--render-yield");
    end;
end;
v0.markRenderStopped = function() --[[ Line: 146 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        l_performance_0.mark("--render-stop");
    end;
end;
v0.markRenderScheduled = function(v22) --[[ Line: 154 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        l_performance_0.mark("--schedule-render-" .. formatLanes(v22));
    end;
end;
v0.markForceUpdateScheduled = function(v23, v24) --[[ Line: 162 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_getComponentName_0 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        local v25 = l_getComponentName_0(v23.type) or "Unknown";
        l_performance_0.mark("--schedule-forced-update-" .. formatLanes(v24) .. "-" .. v25);
    end;
end;
v0.markStateUpdateScheduled = function(v26, v27) --[[ Line: 174 ]]
    -- upvalues: l_enableSchedulingProfiler_0 (copy), v8 (copy), l_getComponentName_0 (copy), l_performance_0 (copy)
    if l_enableSchedulingProfiler_0 and v8 then
        local v28 = l_getComponentName_0(v26.type) or "Unknown";
        l_performance_0.mark("--schedule-state-update-" .. formatLanes(v27) .. "-" .. v28);
    end;
end;
return v0;