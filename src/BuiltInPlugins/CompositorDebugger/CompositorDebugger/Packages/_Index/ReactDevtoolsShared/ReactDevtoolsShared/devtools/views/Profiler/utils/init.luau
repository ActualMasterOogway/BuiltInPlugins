local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.LuauPolyfill);
local l_Array_0 = v1.Array;
local l_Boolean_0 = v1.Boolean;
local l_Error_0 = v1.Error;
local l_Map_0 = v1.Map;
local l_Number_0 = v1.Number;
local v7 = {};
local l_PROFILER_EXPORT_VERSION_0 = require(script.Parent.Parent.Parent.Parent.constants).PROFILER_EXPORT_VERSION;
local _ = require(script.Parent.Parent.Parent.Parent.backend.types);
local _ = require(script.Parent.types);
local v11 = {
    "var(--color-commit-gradient-0)", 
    "var(--color-commit-gradient-1)", 
    "var(--color-commit-gradient-2)", 
    "var(--color-commit-gradient-3)", 
    "var(--color-commit-gradient-4)", 
    "var(--color-commit-gradient-5)", 
    "var(--color-commit-gradient-6)", 
    "var(--color-commit-gradient-7)", 
    "var(--color-commit-gradient-8)", 
    "var(--color-commit-gradient-9)"
};
v7.prepareProfilingDataFrontendFromBackendAndStore = function(v12, v13, v14) --[[ Line: 47 ]] --[[ Name: prepareProfilingDataFrontendFromBackendAndStore ]]
    -- upvalues: l_Map_0 (copy), l_Error_0 (copy), l_Array_0 (copy)
    local v15 = l_Map_0.new();
    for _, v17 in v12 do
        for _, v19 in v17.dataForRoots do
            local l_commitData_0 = v19.commitData;
            local l_displayName_0 = v19.displayName;
            local l_initialTreeBaseDurations_0 = v19.initialTreeBaseDurations;
            local l_interactionCommits_0 = v19.interactionCommits;
            local l_interactions_0 = v19.interactions;
            local l_rootID_0 = v19.rootID;
            local v26 = v13:get(l_rootID_0);
            if v26 == nil then
                error(l_Error_0.new(string.format("Could not find profiling operations for root %s", (tostring(l_rootID_0)))));
            end;
            local v27 = v14:get(l_rootID_0);
            if v27 == nil then
                error(l_Error_0.new(string.format("Could not find profiling snapshots for root %s", (tostring(l_rootID_0)))));
            end;
            v15:set(l_rootID_0, {
                commitData = l_Array_0.map(l_commitData_0, function(v28, _) --[[ Line: 103 ]]
                    -- upvalues: l_Map_0 (ref)
                    return {
                        changeDescriptions = if v28.changeDescriptions ~= nil then l_Map_0.new(v28.changeDescriptions) else nil, 
                        duration = v28.duration, 
                        fiberActualDurations = l_Map_0.new(v28.fiberActualDurations), 
                        fiberSelfDurations = l_Map_0.new(v28.fiberSelfDurations), 
                        interactionIDs = v28.interactionIDs, 
                        priorityLevel = v28.priorityLevel, 
                        timestamp = v28.timestamp
                    };
                end), 
                displayName = l_displayName_0, 
                initialTreeBaseDurations = l_Map_0.new(l_initialTreeBaseDurations_0), 
                interactionCommits = l_Map_0.new(l_interactionCommits_0), 
                interactions = l_Map_0.new(l_interactions_0), 
                operations = v26, 
                rootID = l_rootID_0, 
                snapshots = v27
            });
        end;
    end;
    return {
        dataForRoots = v15, 
        imported = false
    };
end;
v7.prepareProfilingDataFrontendFromExport = function(v30) --[[ Line: 145 ]] --[[ Name: prepareProfilingDataFrontendFromExport ]]
    -- upvalues: l_PROFILER_EXPORT_VERSION_0 (copy), l_Map_0 (copy), l_Array_0 (copy)
    local l_version_0 = v30.version;
    if l_version_0 ~= l_PROFILER_EXPORT_VERSION_0 then
        error(string.format("Unsupported profiler export version \"%s\"", (tostring(l_version_0))));
    end;
    local v32 = l_Map_0.new();
    l_Array_0.forEach(v30.dataForRoots, function(v33) --[[ Line: 155 ]]
        -- upvalues: v32 (copy), l_Array_0 (ref), l_Map_0 (ref)
        local l_commitData_1 = v33.commitData;
        local l_displayName_1 = v33.displayName;
        local l_initialTreeBaseDurations_1 = v33.initialTreeBaseDurations;
        local l_interactionCommits_1 = v33.interactionCommits;
        local l_interactions_1 = v33.interactions;
        local l_operations_0 = v33.operations;
        local l_rootID_1 = v33.rootID;
        local l_snapshots_0 = v33.snapshots;
        v32:set(l_rootID_1, {
            commitData = l_Array_0.map(l_commitData_1, function(v42) --[[ Line: 166 ]]
                -- upvalues: l_Map_0 (ref)
                local l_changeDescriptions_0 = v42.changeDescriptions;
                local l_duration_0 = v42.duration;
                local l_fiberActualDurations_0 = v42.fiberActualDurations;
                local l_fiberSelfDurations_0 = v42.fiberSelfDurations;
                local l_interactionIDs_0 = v42.interactionIDs;
                local l_priorityLevel_0 = v42.priorityLevel;
                local l_timestamp_0 = v42.timestamp;
                return {
                    changeDescriptions = if l_changeDescriptions_0 ~= nil then l_Map_0.new(l_changeDescriptions_0) else nil, 
                    duration = l_duration_0, 
                    fiberActualDurations = l_Map_0.new(l_fiberActualDurations_0), 
                    fiberSelfDurations = l_Map_0.new(l_fiberSelfDurations_0), 
                    interactionIDs = l_interactionIDs_0, 
                    priorityLevel = l_priorityLevel_0, 
                    timestamp = l_timestamp_0
                };
            end), 
            displayName = l_displayName_1, 
            initialTreeBaseDurations = l_Map_0.new(l_initialTreeBaseDurations_1), 
            interactionCommits = l_Map_0.new(l_interactionCommits_1), 
            interactions = l_Map_0.new(l_interactions_1), 
            operations = l_operations_0, 
            rootID = l_rootID_1, 
            snapshots = l_Map_0.new(l_snapshots_0)
        });
    end);
    return {
        dataForRoots = v32, 
        imported = true
    };
end;
v7.prepareProfilingDataExport = function(v50) --[[ Line: 199 ]] --[[ Name: prepareProfilingDataExport ]]
    -- upvalues: l_Array_0 (copy), l_PROFILER_EXPORT_VERSION_0 (copy)
    local v51 = {};
    v50.dataForRoots:forEach(function(v52) --[[ Line: 203 ]]
        -- upvalues: v51 (copy), l_Array_0 (ref)
        local l_commitData_2 = v52.commitData;
        local l_displayName_2 = v52.displayName;
        local l_initialTreeBaseDurations_2 = v52.initialTreeBaseDurations;
        local l_interactionCommits_2 = v52.interactionCommits;
        local l_interactions_2 = v52.interactions;
        local l_operations_1 = v52.operations;
        local l_rootID_2 = v52.rootID;
        local l_snapshots_1 = v52.snapshots;
        table.insert(v51, {
            commitData = l_Array_0.map(l_commitData_2, function(v61) --[[ Line: 214 ]]
                -- upvalues: l_Array_0 (ref)
                local l_changeDescriptions_1 = v61.changeDescriptions;
                local l_duration_1 = v61.duration;
                local l_fiberActualDurations_1 = v61.fiberActualDurations;
                local l_fiberSelfDurations_1 = v61.fiberSelfDurations;
                local l_interactionIDs_1 = v61.interactionIDs;
                local l_priorityLevel_1 = v61.priorityLevel;
                local l_timestamp_1 = v61.timestamp;
                return {
                    changeDescriptions = if l_changeDescriptions_1 ~= nil then l_Array_0.from(l_changeDescriptions_1:entries()) else nil, 
                    duration = l_duration_1, 
                    fiberActualDurations = l_Array_0.from(l_fiberActualDurations_1:entries()), 
                    fiberSelfDurations = l_Array_0.from(l_fiberSelfDurations_1:entries()), 
                    interactionIDs = l_interactionIDs_1, 
                    priorityLevel = l_priorityLevel_1, 
                    timestamp = l_timestamp_1
                };
            end), 
            displayName = l_displayName_2, 
            initialTreeBaseDurations = l_Array_0.from(l_initialTreeBaseDurations_2:entries()), 
            interactionCommits = l_Array_0.from(l_interactionCommits_2:entries()), 
            interactions = l_Array_0.from(l_interactions_2:entries()), 
            operations = l_operations_1, 
            rootID = l_rootID_2, 
            snapshots = l_Array_0.from(l_snapshots_1:entries())
        });
    end);
    return {
        version = l_PROFILER_EXPORT_VERSION_0, 
        dataForRoots = v51
    };
end;
v7.getGradientColor = function(v69) --[[ Line: 249 ]] --[[ Name: getGradientColor ]]
    -- upvalues: v11 (copy), l_Number_0 (copy)
    local v70 = #v11;
    local _ = nil;
    return v11[math.round(l_Number_0.isNaN(v69) and 0 or if l_Number_0.isFinite(v69) then math.max(0, (math.min(v70, v69))) * v70 else v70)];
end;
v7.formatDuration = function(v72) --[[ Line: 262 ]] --[[ Name: formatDuration ]]
    -- upvalues: l_Boolean_0 (copy)
    local v73 = math.round(v72 * 10) / 10;
    if l_Boolean_0.toJSBoolean(v73) then
        return v73;
    else
        return "<0.1";
    end;
end;
v7.formatPercentage = function(v74) --[[ Line: 267 ]] --[[ Name: formatPercentage ]]
    return (math.round(v74 * 100));
end;
v7.formatTime = function(v75) --[[ Line: 271 ]] --[[ Name: formatTime ]]
    return math.round(math.round(v75) / 100) / 10;
end;
v7.scale = function(v76, v77, v78, v79) --[[ Line: 275 ]] --[[ Name: scale ]]
    return function(v80, v81) --[[ Line: 281 ]]
        -- upvalues: v77 (copy), v76 (copy), v79 (copy), v78 (copy)
        if v77 - v76 == 0 then
            return v81;
        else
            return (v80 - v76) / (v77 - v76) * (v79 - v78);
        end;
    end;
end;
return v7;