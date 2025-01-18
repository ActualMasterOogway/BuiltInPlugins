local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local function _(v2) --[[ Line: 17 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. v2);
    error("FIXME (roblox): " .. v2 .. " is unimplemented", 2);
end;
local _ = require(script.Parent.ReactInternalTypes);
local v5 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v7 = require(script.Parent.ReactWorkTags);
local l_HostComponent_0 = v7.HostComponent;
local l_HostText_0 = v7.HostText;
local l_HostRoot_0 = v7.HostRoot;
local l_SuspenseComponent_0 = v7.SuspenseComponent;
local v12 = require(script.Parent.ReactFiberFlags);
local l_Placement_0 = v12.Placement;
local l_Hydrating_0 = v12.Hydrating;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_createFiberFromDehydratedFragment_0 = require(script.Parent["ReactFiber.new"]).createFiberFromDehydratedFragment;
local l_supportsHydration_0 = v5.supportsHydration;
local l_getNextHydratableSibling_0 = v5.getNextHydratableSibling;
local l_getFirstHydratableChild_0 = v5.getFirstHydratableChild;
local l_canHydrateInstance_0 = v5.canHydrateInstance;
local l_canHydrateTextInstance_0 = v5.canHydrateTextInstance;
local l_canHydrateSuspenseInstance_0 = v5.canHydrateSuspenseInstance;
local l_hydrateInstance_0 = v5.hydrateInstance;
local l_hydrateTextInstance_0 = v5.hydrateTextInstance;
local l_hydrateSuspenseInstance_0 = v5.hydrateSuspenseInstance;
local l_getNextHydratableInstanceAfterSuspenseInstance_0 = v5.getNextHydratableInstanceAfterSuspenseInstance;
local l_didNotMatchHydratedContainerTextInstance_0 = v5.didNotMatchHydratedContainerTextInstance;
local l_didNotMatchHydratedTextInstance_0 = v5.didNotMatchHydratedTextInstance;
local l_shouldSetTextContent_0 = v5.shouldSetTextContent;
local l_enableSuspenseServerRenderer_0 = require(l_Parent_0.Shared).ReactFeatureFlags.enableSuspenseServerRenderer;
local l_OffscreenLane_0 = require(script.Parent.ReactFiberLane).OffscreenLane;
local v32 = nil;
local v33 = nil;
local v34 = false;
warnIfHydrating = function() --[[ Line: 91 ]] --[[ Name: warnIfHydrating ]]
    -- upvalues: v34 (ref), l_console_0 (copy)
    if _G.__DEV__ and v34 then
        l_console_0.error("We should not be hydrating here. This is a bug in React. Please file a bug.");
    end;
end;
enterHydrationState = function(v35) --[[ Line: 101 ]] --[[ Name: enterHydrationState ]]
    -- upvalues: l_supportsHydration_0 (copy), v33 (ref), l_getFirstHydratableChild_0 (copy), v32 (ref), v34 (ref)
    if not l_supportsHydration_0 then
        return false;
    else
        local l_containerInfo_0 = v35.stateNode.containerInfo;
        v33 = l_getFirstHydratableChild_0(l_containerInfo_0);
        v32 = v35;
        v34 = true;
        return true;
    end;
end;
reenterHydrationStateFromDehydratedSuspenseInstance = function(v37, v38) --[[ Line: 113 ]] --[[ Name: reenterHydrationStateFromDehydratedSuspenseInstance ]]
    -- upvalues: l_supportsHydration_0 (copy), v33 (ref), l_getNextHydratableSibling_0 (copy), v34 (ref)
    if not l_supportsHydration_0 then
        return false;
    else
        v33 = l_getNextHydratableSibling_0(v38);
        popToNextHostParent(v37);
        v34 = true;
        return true;
    end;
end;
deleteHydratableInstance = function(_, _) --[[ Line: 127 ]] --[[ Name: deleteHydratableInstance ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. "deleteHydratableInstance");
    error("FIXME (roblox): " .. "deleteHydratableInstance" .. " is unimplemented", 2);
end;
insertNonHydratedInstance = function(_, v42) --[[ Line: 162 ]] --[[ Name: insertNonHydratedInstance ]]
    -- upvalues: l_Hydrating_0 (copy), l_Placement_0 (copy)
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. "insertNonHydratedInstance");
    error("FIXME (roblox): " .. "insertNonHydratedInstance" .. " is unimplemented", 2);
    v42.flags = bit32.bor(bit32.band(v42.flags, (bit32.bnot(l_Hydrating_0))), l_Placement_0);
    if _G.__DEV__ then

    end;
end;
tryHydrate = function(v43, v44) --[[ Line: 226 ]] --[[ Name: tryHydrate ]]
    -- upvalues: l_HostComponent_0 (copy), l_canHydrateInstance_0 (copy), l_HostText_0 (copy), l_canHydrateTextInstance_0 (copy), l_SuspenseComponent_0 (copy), l_enableSuspenseServerRenderer_0 (copy), l_canHydrateSuspenseInstance_0 (copy), l_OffscreenLane_0 (copy), l_createFiberFromDehydratedFragment_0 (copy)
    if v43.tag == l_HostComponent_0 then
        local l_type_0 = v43.type;
        local l_pendingProps_0 = v43.pendingProps;
        local v47 = l_canHydrateInstance_0(v44, l_type_0, l_pendingProps_0);
        if v47 ~= nil then
            v43.stateNode = v47;
            return true;
        else
            return false;
        end;
    elseif v43.tag == l_HostText_0 then
        local l_pendingProps_1 = v43.pendingProps;
        local v49 = l_canHydrateTextInstance_0(v44, l_pendingProps_1);
        if v49 ~= nil then
            v43.stateNode = v49;
            return true;
        else
            return false;
        end;
    elseif v43.tag == l_SuspenseComponent_0 then
        if l_enableSuspenseServerRenderer_0 then
            local v50 = l_canHydrateSuspenseInstance_0(v44);
            if v50 ~= nil then
                v43.memoizedState = {
                    dehydrated = v50, 
                    retryLane = l_OffscreenLane_0
                };
                local v51 = l_createFiberFromDehydratedFragment_0(v50);
                v51.return_ = v43;
                v43.child = v51;
                return true;
            end;
        end;
        return false;
    else
        return false;
    end;
end;
tryToClaimNextHydratableInstance = function(v52) --[[ Line: 271 ]] --[[ Name: tryToClaimNextHydratableInstance ]]
    -- upvalues: v34 (ref), v33 (ref), v32 (ref), l_getNextHydratableSibling_0 (copy), l_getFirstHydratableChild_0 (copy)
    if not v34 then
        return;
    else
        local l_v33_0 = v33;
        if not l_v33_0 then
            insertNonHydratedInstance(v32, v52);
            v34 = false;
            v32 = v52;
            return;
        else
            local l_l_v33_0_0 = l_v33_0;
            if not tryHydrate(v52, l_v33_0) then
                l_v33_0 = l_getNextHydratableSibling_0(l_l_v33_0_0);
                if not l_v33_0 or not tryHydrate(v52, l_v33_0) then
                    insertNonHydratedInstance(v32, v52);
                    v34 = false;
                    v32 = v52;
                    return;
                else
                    deleteHydratableInstance(v32, l_l_v33_0_0);
                end;
            end;
            v32 = v52;
            v33 = l_getFirstHydratableChild_0(l_v33_0);
            return;
        end;
    end;
end;
prepareToHydrateHostInstance = function(v55, v56, v57) --[[ Line: 307 ]] --[[ Name: prepareToHydrateHostInstance ]]
    -- upvalues: l_supportsHydration_0 (copy), l_invariant_0 (copy), l_hydrateInstance_0 (copy)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected prepareToHydrateHostInstance() to never be called. " .. "This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_stateNode_0 = v55.stateNode;
    local v59 = l_hydrateInstance_0(l_stateNode_0, v55.type, v55.memoizedProps, v56, v57, v55);
    v55.updateQueue = v59;
    if v59 ~= nil then
        return true;
    else
        return false;
    end;
end;
prepareToHydrateHostTextInstance = function(v60) --[[ Line: 339 ]] --[[ Name: prepareToHydrateHostTextInstance ]]
    -- upvalues: l_supportsHydration_0 (copy), l_invariant_0 (copy), l_hydrateTextInstance_0 (copy), v32 (ref), l_HostRoot_0 (copy), l_didNotMatchHydratedContainerTextInstance_0 (copy), l_HostComponent_0 (copy), l_didNotMatchHydratedTextInstance_0 (copy)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected prepareToHydrateHostTextInstance() to never be called. " .. "This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_stateNode_1 = v60.stateNode;
    local l_memoizedProps_0 = v60.memoizedProps;
    local v63 = l_hydrateTextInstance_0(l_stateNode_1, l_memoizedProps_0, v60);
    if _G.__DEV__ and v63 then
        local l_v32_0 = v32;
        if l_v32_0 ~= nil then
            if l_v32_0.tag == l_HostRoot_0 then
                local l_containerInfo_1 = l_v32_0.stateNode.containerInfo;
                l_didNotMatchHydratedContainerTextInstance_0(l_containerInfo_1, l_stateNode_1, l_memoizedProps_0);
                return v63;
            elseif l_v32_0.tag == l_HostComponent_0 then
                local l_type_1 = l_v32_0.type;
                local l_memoizedProps_1 = l_v32_0.memoizedProps;
                local l_stateNode_2 = l_v32_0.stateNode;
                l_didNotMatchHydratedTextInstance_0(l_type_1, l_memoizedProps_1, l_stateNode_2, l_stateNode_1, l_memoizedProps_0);
            end;
        end;
    end;
    return v63;
end;
prepareToHydrateHostSuspenseInstance = function(v69) --[[ Line: 382 ]] --[[ Name: prepareToHydrateHostSuspenseInstance ]]
    -- upvalues: l_supportsHydration_0 (copy), l_invariant_0 (copy), l_hydrateSuspenseInstance_0 (copy)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected prepareToHydrateHostSuspenseInstance() to never be called. " .. "This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_memoizedState_0 = v69.memoizedState;
    local v71 = nil;
    v71 = if l_memoizedState_0 ~= nil then l_memoizedState_0.dehydrated else nil;
    l_invariant_0(v71, "Expected to have a hydrated suspense instance. " .. "This error is likely caused by a bug in React. Please file an issue.");
    l_hydrateSuspenseInstance_0(v71, v69);
end;
skipPastDehydratedSuspenseInstance = function(v72) --[[ Line: 407 ]] --[[ Name: skipPastDehydratedSuspenseInstance ]]
    -- upvalues: l_supportsHydration_0 (copy), l_invariant_0 (copy), l_getNextHydratableInstanceAfterSuspenseInstance_0 (copy)
    if not l_supportsHydration_0 then
        l_invariant_0(false, "Expected skipPastDehydratedSuspenseInstance() to never be called. " .. "This error is likely caused by a bug in React. Please file an issue.");
    end;
    local l_memoizedState_1 = v72.memoizedState;
    local v74 = nil;
    v74 = if l_memoizedState_1 ~= nil then l_memoizedState_1.dehydrated else nil;
    l_invariant_0(v74, "Expected to have a hydrated suspense instance. " .. "This error is likely caused by a bug in React. Please file an issue.");
    return l_getNextHydratableInstanceAfterSuspenseInstance_0(v74);
end;
popToNextHostParent = function(v75) --[[ Line: 430 ]] --[[ Name: popToNextHostParent ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_SuspenseComponent_0 (copy), v32 (ref)
    local l_return__0 = v75.return_;
    while l_return__0 ~= nil and l_return__0.tag ~= l_HostComponent_0 and l_return__0.tag ~= l_HostRoot_0 and l_return__0.tag ~= l_SuspenseComponent_0 do
        l_return__0 = l_return__0.return_;
    end;
    v32 = l_return__0;
end;
popHydrationState = function(v77) --[[ Line: 443 ]] --[[ Name: popHydrationState ]]
    -- upvalues: l_supportsHydration_0 (copy), v32 (ref), v34 (ref), l_HostComponent_0 (copy), l_shouldSetTextContent_0 (copy), v33 (ref), l_getNextHydratableSibling_0 (copy), l_SuspenseComponent_0 (copy)
    if not l_supportsHydration_0 then
        return false;
    elseif v77 ~= v32 then
        return false;
    elseif not v34 then
        popToNextHostParent(v77);
        v34 = true;
        return false;
    else
        local l_type_2 = v77.type;
        if v77.tag ~= l_HostComponent_0 or l_type_2 ~= "head" and l_type_2 ~= "body" and not l_shouldSetTextContent_0(l_type_2, v77.memoizedProps) then
            local l_v33_1 = v33;
            while l_v33_1 do
                deleteHydratableInstance(v77, l_v33_1);
                l_v33_1 = l_getNextHydratableSibling_0(l_v33_1);
            end;
        end;
        popToNextHostParent(v77);
        if v77.tag == l_SuspenseComponent_0 then
            v33 = skipPastDehydratedSuspenseInstance(v77);
        elseif v32 then
            v33 = l_getNextHydratableSibling_0(v77.stateNode);
        else
            v33 = nil;
        end;
        return true;
    end;
end;
resetHydrationState = function() --[[ Line: 496 ]] --[[ Name: resetHydrationState ]]
    -- upvalues: l_supportsHydration_0 (copy), v32 (ref), v33 (ref), v34 (ref)
    if not l_supportsHydration_0 then
        return;
    else
        v32 = nil;
        v33 = nil;
        v34 = false;
        return;
    end;
end;
getIsHydrating = function() --[[ Line: 506 ]] --[[ Name: getIsHydrating ]]
    -- upvalues: v34 (ref)
    return v34;
end;
return {
    warnIfHydrating = warnIfHydrating, 
    enterHydrationState = enterHydrationState, 
    getIsHydrating = getIsHydrating, 
    reenterHydrationStateFromDehydratedSuspenseInstance = reenterHydrationStateFromDehydratedSuspenseInstance, 
    resetHydrationState = resetHydrationState, 
    tryToClaimNextHydratableInstance = tryToClaimNextHydratableInstance, 
    prepareToHydrateHostInstance = prepareToHydrateHostInstance, 
    prepareToHydrateHostTextInstance = prepareToHydrateHostTextInstance, 
    prepareToHydrateHostSuspenseInstance = prepareToHydrateHostSuspenseInstance, 
    popHydrationState = popHydrationState
};