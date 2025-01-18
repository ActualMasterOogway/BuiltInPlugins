local l_Parent_0 = script.Parent.Parent;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local v2 = require(script.Parent.ReactWorkTags);
local _ = require(script.Parent.ReactInternalTypes);
local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
    return game:DefineFastInt("ReactMicroprofilerLevel", 0);
end);
if not l_status_0 then
    l_result_0 = 0;
end;
local v6 = false;
local v7 = nil;
startTimerSampling = function(v8) --[[ Line: 48 ]] --[[ Name: startTimerSampling ]]
    -- upvalues: v6 (ref), v7 (ref)
    if v6 then
        warn("RobloxReactProfiling Timer Sampling already running.");
    end;
    v6 = true;
    v7 = v8;
end;
endTimerSampling = function() --[[ Line: 56 ]] --[[ Name: endTimerSampling ]]
    -- upvalues: v6 (ref), v7 (ref)
    v6 = false;
    v7 = nil;
end;
getFirstStringKey = function(v9) --[[ Line: 61 ]] --[[ Name: getFirstStringKey ]]
    for v10, _ in v9 do
        if type(v10) == "string" then
            return v10;
        end;
    end;
    return nil;
end;
startTimer = function(v12) --[[ Line: 70 ]] --[[ Name: startTimer ]]
    -- upvalues: v6 (ref)
    if v6 then
        v12.startTime = os.clock();
    end;
end;
endTimer = function(v13) --[[ Line: 75 ]] --[[ Name: endTimer ]]
    -- upvalues: v6 (ref), v7 (ref)
    if v6 then
        v13.endTime = os.clock();
        if v7 then
            v7(v13);
        end;
    end;
end;
profileRootBeforeUnitOfWork = function(v14) --[[ Line: 84 ]] --[[ Name: profileRootBeforeUnitOfWork ]]
    local l_current_0 = v14.current;
    local v16 = nil;
    if l_current_0 then
        if l_current_0.memoizedProps then
            v16 = getFirstStringKey(l_current_0.memoizedProps);
        end;
        if v16 == nil and l_current_0.stateNode and l_current_0.stateNode.containerInfo then
            v16 = l_current_0.stateNode.containerInfo.Name;
        end;
    end;
    if v16 == "Folder" and l_current_0.child then
        local l_child_0 = l_current_0.child;
        local v18 = nil;
        if l_child_0.memoizedProps then
            v18 = getFirstStringKey(l_child_0.memoizedProps);
        end;
        if v18 == nil and l_child_0.stateNode and l_child_0.stateNode.containerInfo then
            v18 = l_child_0.stateNode.containerInfo.Name;
        end;
        if v18 ~= nil then
            v16 = v18;
        end;
    end;
    if v16 ~= nil then
        local v19 = {
            id = v16, 
            startTime = 0, 
            endTime = 0
        };
        startTimer(v19);
        debug.profilebegin(v16);
        return v19;
    else
        return nil;
    end;
end;
profileRootAfterYielding = function(v20) --[[ Line: 138 ]] --[[ Name: profileRootAfterYielding ]]
    if v20 then
        endTimer(v20);
        debug.profileend();
    end;
end;
profileUnitOfWorkBefore = function(v21) --[[ Line: 145 ]] --[[ Name: profileUnitOfWorkBefore ]]
    -- upvalues: l_getComponentName_0 (copy), v2 (copy)
    local v22 = l_getComponentName_0(v21.type);
    if v21.key then
        v22 = tostring(v21.key) .. "=" .. (v22 or "?");
    end;
    local v23 = nil;
    if v21.stateNode and (v21.tag == v2.HostComponent or v21.tag == v2.HostText) then
        local l_FirstAncestorWhichIsA_0 = v21.stateNode:FindFirstAncestorWhichIsA("LayerCollector");
        if l_FirstAncestorWhichIsA_0 then
            v23 = "[" .. l_FirstAncestorWhichIsA_0:GetFullName() .. "] ";
        end;
    end;
    if v23 then
        v22 = v23 .. " : " .. (v22 or "?");
    end;
    if v22 ~= nil then
        debug.profilebegin(v22);
        return true;
    else
        return false;
    end;
end;
profileUnitOfWorkAfter = function(v25) --[[ Line: 178 ]] --[[ Name: profileUnitOfWorkAfter ]]
    if v25 then
        debug.profileend();
    end;
end;
profileCommitBefore = function() --[[ Line: 184 ]] --[[ Name: profileCommitBefore ]]
    debug.profilebegin("Commit");
end;
profileCommitAfter = function() --[[ Line: 187 ]] --[[ Name: profileCommitAfter ]]
    debug.profileend();
end;
noop = function(...) --[[ Line: 191 ]] --[[ Name: noop ]]

end;
return {
    startTimerSampling = startTimerSampling, 
    endTimerSampling = endTimerSampling, 
    profileRootBeforeUnitOfWork = if l_result_0 >= 1 then profileRootBeforeUnitOfWork else noop, 
    profileRootAfterYielding = if l_result_0 >= 1 then profileRootAfterYielding else noop, 
    profileUnitOfWorkBefore = if l_result_0 >= 10 then profileUnitOfWorkBefore else noop, 
    profileUnitOfWorkAfter = if l_result_0 >= 10 then profileUnitOfWorkAfter else noop, 
    profileCommitBefore = if l_result_0 >= 1 then profileCommitBefore else noop, 
    profileCommitAfter = if l_result_0 >= 1 then profileCommitAfter else noop
};