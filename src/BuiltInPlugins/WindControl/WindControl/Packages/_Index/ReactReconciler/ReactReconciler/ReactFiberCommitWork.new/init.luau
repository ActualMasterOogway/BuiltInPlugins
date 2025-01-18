local function v1(v0) --[[ Line: 11 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local v2 = 0;
local function _(v3) --[[ Line: 25 ]] --[[ Name: isCallable ]]
    if typeof(v3) == "function" then
        return true;
    else
        if typeof(v3) == "table" then
            local v4 = getmetatable(v3);
            if v4 and rawget(v4, "__call") then
                return true;
            elseif v3._isMockFunction then
                return true;
            end;
        end;
        return false;
    end;
end;
local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v8 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v8.Error;
local l_Object_0 = v8.Object;
local l_Set_0 = v8.Set;
local v12 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v15 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local v18 = require(script.Parent.ReactHookEffectTags);
local l_unstable_wrap_0 = require(l_Parent_0.Scheduler).tracing.unstable_wrap;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local l_enableProfilerCommitHooks_0 = l_ReactFeatureFlags_0.enableProfilerCommitHooks;
local l_enableSuspenseCallback_0 = l_ReactFeatureFlags_0.enableSuspenseCallback;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v26 = require(script.Parent.ReactWorkTags);
local l_FunctionComponent_0 = v26.FunctionComponent;
local l_ForwardRef_0 = v26.ForwardRef;
local l_ClassComponent_0 = v26.ClassComponent;
local l_HostRoot_0 = v26.HostRoot;
local l_HostComponent_0 = v26.HostComponent;
local l_HostText_0 = v26.HostText;
local l_HostPortal_0 = v26.HostPortal;
local l_Profiler_0 = v26.Profiler;
local l_SuspenseComponent_0 = v26.SuspenseComponent;
local l_DehydratedFragment_0 = v26.DehydratedFragment;
local l_IncompleteClassComponent_0 = v26.IncompleteClassComponent;
local l_MemoComponent_0 = v26.MemoComponent;
local l_SimpleMemoComponent_0 = v26.SimpleMemoComponent;
local l_SuspenseListComponent_0 = v26.SuspenseListComponent;
local l_FundamentalComponent_0 = v26.FundamentalComponent;
local l_ScopeComponent_0 = v26.ScopeComponent;
local l_Block_0 = v26.Block;
local l_OffscreenComponent_0 = v26.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v26.LegacyHiddenComponent;
local l_ReactErrorUtils_0 = require(l_Parent_0.Shared).ReactErrorUtils;
local l_invokeGuardedCallback_0 = l_ReactErrorUtils_0.invokeGuardedCallback;
local l_hasCaughtError_0 = l_ReactErrorUtils_0.hasCaughtError;
local l_clearCaughtError_0 = l_ReactErrorUtils_0.clearCaughtError;
local v50 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v50.NoFlags;
local l_ContentReset_0 = v50.ContentReset;
local l_Placement_0 = v50.Placement;
local l_Snapshot_0 = v50.Snapshot;
local l_Update_0 = v50.Update;
local l_Callback_0 = v50.Callback;
local l_LayoutMask_0 = v50.LayoutMask;
local l_PassiveMask_0 = v50.PassiveMask;
local l_Ref_0 = v50.Ref;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local v63 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v63.current;
local l_resetCurrentFiber_0 = v63.resetCurrentFiber;
local l_setCurrentFiber_0 = v63.setCurrentFiber;
local l_onCommitUnmount_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitUnmount;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v69 = require(script.Parent["ReactProfilerTimer.new"]);
local l_startLayoutEffectTimer_0 = v69.startLayoutEffectTimer;
local l_recordPassiveEffectDuration_0 = v69.recordPassiveEffectDuration;
local l_recordLayoutEffectDuration_0 = v69.recordLayoutEffectDuration;
local l_startPassiveEffectTimer_0 = v69.startPassiveEffectTimer;
local l_getCommitTime_0 = v69.getCommitTime;
local l_ProfileMode_0 = require(script.Parent.ReactTypeOfMode).ProfileMode;
local l_commitUpdateQueue_0 = v15.commitUpdateQueue;
local l_getPublicInstance_0 = v12.getPublicInstance;
local l_supportsMutation_0 = v12.supportsMutation;
local l_supportsPersistence_0 = v12.supportsPersistence;
local l_supportsHydration_0 = v12.supportsHydration;
local l_commitMount_0 = v12.commitMount;
local l_commitUpdate_0 = v12.commitUpdate;
local l_resetTextContent_0 = v12.resetTextContent;
local l_commitTextUpdate_0 = v12.commitTextUpdate;
local l_appendChild_0 = v12.appendChild;
local l_appendChildToContainer_0 = v12.appendChildToContainer;
local l_insertBefore_0 = v12.insertBefore;
local l_insertInContainerBefore_0 = v12.insertInContainerBefore;
local l_removeChild_0 = v12.removeChild;
local l_removeChildFromContainer_0 = v12.removeChildFromContainer;
local l_hideInstance_0 = v12.hideInstance;
local l_hideTextInstance_0 = v12.hideTextInstance;
local l_unhideInstance_0 = v12.unhideInstance;
local l_unhideTextInstance_0 = v12.unhideTextInstance;
local l_commitHydratedSuspenseInstance_0 = v12.commitHydratedSuspenseInstance;
local l_clearContainer_0 = v12.clearContainer;
local v97 = nil;
local function v100(v98, v99) --[[ Line: 190 ]] --[[ Name: resolveRetryWakeable ]]
    -- upvalues: v97 (ref)
    if not v97 then
        v97 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v97.resolveRetryWakeable(v98, v99);
end;
local function _() --[[ Line: 197 ]] --[[ Name: markCommitTimeOfFallback ]]
    -- upvalues: v97 (ref)
    if not v97 then
        v97 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v97.markCommitTimeOfFallback();
end;
local function v102() --[[ Line: 205 ]] --[[ Name: schedulePassiveEffectCallback ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback());
end;
local function v106(_, _, v105) --[[ Line: 210 ]] --[[ Name: captureCommitPhaseError ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle");
    error(v105);
end;
local l_NoFlags_1 = v18.NoFlags;
local l_HasEffect_0 = v18.HasEffect;
local l_Layout_0 = v18.Layout;
local l_Passive_0 = v18.Passive;
local v111 = nil;
local function v112() --[[ Line: 226 ]]
    -- upvalues: v111 (ref)
    if not v111 then
        v111 = require(script.Parent["ReactFiberBeginWork.new"]).didWarnAboutReassigningProps;
    end;
    return v111;
end;
local v113 = nil;
local v114 = nil;
local v115 = nil;
local v116 = nil;
local v117 = nil;
local v118 = nil;
local v119 = nil;
local v120 = nil;
local v121 = nil;
local v122 = nil;
local v123 = nil;
local function v128(v124, v125) --[[ Line: 253 ]] --[[ Name: callComponentWillUnmountWithTimer ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_describeError_0 (copy), l_recordLayoutEffectDuration_0 (copy)
    v125.props = v124.memoizedProps;
    v125.state = v124.memoizedState;
    if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v124.mode, l_ProfileMode_0) ~= 0 then
        local v126, v127 = xpcall(function() --[[ Line: 262 ]]
            -- upvalues: l_startLayoutEffectTimer_0 (ref), v125 (copy)
            l_startLayoutEffectTimer_0();
            v125:componentWillUnmount();
        end, l_describeError_0);
        l_recordLayoutEffectDuration_0(v124);
        if not v126 then
            error(v127);
            return;
        end;
    else
        v125:componentWillUnmount();
    end;
end;
safelyCallComponentWillUnmount = function(v129, v130, v131) --[[ Line: 280 ]] --[[ Name: safelyCallComponentWillUnmount ]]
    -- upvalues: v128 (copy), l_describeError_0 (copy), v106 (ref)
    local v132, v133 = xpcall(v128, l_describeError_0, v129, v130);
    if not v132 then
        v106(v129, v131, v133);
    end;
end;
local function _(v134, v135) --[[ Line: 293 ]] --[[ Name: safelyDetachRef ]]
    -- upvalues: l_describeError_0 (copy), v106 (ref)
    local l_ref_0 = v134.ref;
    if l_ref_0 ~= nil then
        if typeof(l_ref_0) == "function" then
            local v137, v138 = xpcall(l_ref_0, l_describeError_0);
            if not v137 then
                v106(v134, v135, v138);
                return;
            end;
        else
            l_ref_0.current = nil;
        end;
    end;
end;
local function v145(v140, v141, v142) --[[ Line: 309 ]] --[[ Name: safelyCallDestroy ]]
    -- upvalues: l_describeError_0 (copy), v106 (ref)
    local v143, v144 = xpcall(v142, l_describeError_0);
    if not v143 then
        v106(v140, v141, v144);
    end;
end;
local function v153(v146, v147) --[[ Line: 321 ]] --[[ Name: commitBeforeMutationLifeCycles ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_ClassComponent_0 (copy), l_Snapshot_0 (copy), v112 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resolveDefaultProps_0 (copy), l_HostRoot_0 (copy), l_supportsMutation_0 (copy), l_clearContainer_0 (copy), l_HostComponent_0 (copy), l_HostText_0 (copy), l_HostPortal_0 (copy), l_IncompleteClassComponent_0 (copy), l_invariant_0 (copy)
    if v147.tag == l_FunctionComponent_0 or v147.tag == l_ForwardRef_0 or v147.tag == l_SimpleMemoComponent_0 or v147.tag == l_Block_0 then
        return;
    elseif v147.tag == l_ClassComponent_0 then
        if bit32.band(v147.flags, l_Snapshot_0) ~= 0 and v146 ~= nil then
            local l_memoizedProps_0 = v146.memoizedProps;
            local l_memoizedState_0 = v146.memoizedState;
            local l_stateNode_0 = v147.stateNode;
            if _G.__DEV__ and v147.type == v147.elementType and not v112 then
                if l_stateNode_0.props ~= v147.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "getSnapshotBeforeUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v147.type) or "instance");
                end;
                if l_stateNode_0.state ~= v147.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "getSnapshotBeforeUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v147.type) or "instance");
                end;
            end;
            local v151 = l_stateNode_0:getSnapshotBeforeUpdate(v147.elementType == v147.type and l_memoizedProps_0 or l_resolveDefaultProps_0(v147.type, l_memoizedProps_0), l_memoizedState_0);
            if _G.__DEV__ then

            end;
            l_stateNode_0.__reactInternalSnapshotBeforeUpdate = v151;
        end;
        return;
    elseif v147.tag == l_HostRoot_0 then
        if l_supportsMutation_0 and bit32.band(v147.flags, l_Snapshot_0) ~= 0 then
            local l_stateNode_1 = v147.stateNode;
            l_clearContainer_0(l_stateNode_1.containerInfo);
        end;
        return;
    elseif v147.tag == l_HostComponent_0 or v147.tag == l_HostText_0 or v147.tag == l_HostPortal_0 or v147.tag == l_IncompleteClassComponent_0 then
        return;
    else
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
        return;
    end;
end;
local function v164(v154, v155, v156) --[[ Line: 415 ]] --[[ Name: commitHookEffectListUnmount ]]
    -- upvalues: l_describeError_0 (copy), v106 (ref)
    local l_updateQueue_0 = v155.updateQueue;
    local v158 = nil;
    if l_updateQueue_0 ~= nil then
        v158 = l_updateQueue_0.lastEffect;
    end;
    if v158 ~= nil then
        local l_next_0 = v158.next;
        local l_l_next_0_0 = l_next_0;
        repeat
            if bit32.band(l_l_next_0_0.tag, v154) == v154 then
                local l_destroy_0 = l_l_next_0_0.destroy;
                l_l_next_0_0.destroy = nil;
                if l_destroy_0 ~= nil then
                    local v162, v163 = xpcall(l_destroy_0, l_describeError_0);
                    if not v162 then
                        v106(v155, v156, v163);
                    end;
                end;
            end;
            l_l_next_0_0 = l_l_next_0_0.next;
        until l_l_next_0_0 == l_next_0;
    end;
end;
local function v173(v165, v166) --[[ Line: 443 ]] --[[ Name: commitHookEffectListMount ]]
    -- upvalues: l_console_0 (copy)
    local l_updateQueue_1 = v166.updateQueue;
    local v168 = if l_updateQueue_1 ~= nil then l_updateQueue_1.lastEffect else nil;
    if v168 ~= nil then
        local l_next_1 = v168.next;
        local l_l_next_1_0 = l_next_1;
        repeat
            if bit32.band(l_l_next_1_0.tag, v165) == v165 then
                l_l_next_1_0.destroy = l_l_next_1_0.create();
                if _G.__DEV__ then
                    local l_destroy_1 = l_l_next_1_0.destroy;
                    if l_destroy_1 ~= nil and typeof(l_destroy_1) ~= "function" then
                        local v172 = nil;
                        v172 = if l_destroy_1 == nil then " You returned nil. If your effect does not require clean " .. "up, return nil (or nothing)." else if typeof(l_destroy_1.andThen) == "function" then "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. " .. "Instead, write the async function inside your effect " .. "and call it immediately:\n\n" .. "useEffect(function()\n" .. "  function fetchData()\n" .. "    -- You can await here\n" .. "    local response = MyAPI.getData(someId):await()\n" .. "    -- ...\n" .. "  end\n" .. "  fetchData()\n" .. "end, {someId}) -- Or {} if effect doesn't need props or state\n\n" .. "Learn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" else " You returned: " .. l_destroy_1;
                        l_console_0.error("An effect function must not return anything besides a function, " .. "which is used for clean-up.%s", v172);
                    end;
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
        until l_l_next_1_0 == l_next_1;
    end;
end;
commitProfilerPassiveEffect = function(v174, v175) --[[ Line: 494 ]] --[[ Name: commitProfilerPassiveEffect ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_Profiler_0 (copy), l_getCommitTime_0 (copy), l_enableSchedulerTracing_0 (copy)
    if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and v175.tag == l_Profiler_0 then
        local l_passiveEffectDuration_0 = v175.stateNode.passiveEffectDuration;
        local l_id_0 = v175.memoizedProps.id;
        local l_onPostCommit_0 = v175.memoizedProps.onPostCommit;
        local v179 = l_getCommitTime_0();
        if typeof(l_onPostCommit_0) == "function" then
            if l_enableSchedulerTracing_0 then
                l_onPostCommit_0(l_id_0, v175.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v179, v174.memoizedInteractions);
                return;
            else
                l_onPostCommit_0(l_id_0, v175.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v179);
            end;
        end;
    end;
end;
local function v180(v181, v182, v183, v184) --[[ Line: 539 ]] --[[ Name: recursivelyCommitLayoutEffects ]]
    -- upvalues: v106 (ref), v102 (ref), l_Profiler_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), v123 (ref), l_LayoutMask_0 (copy), l_NoFlags_0 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), v180 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy), l_describeError_0 (copy), l_Update_0 (copy), l_Callback_0 (copy), v63 (copy), v2 (ref), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v173 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_PassiveMask_0 (copy), l_ClassComponent_0 (copy), v119 (ref), l_HostRoot_0 (copy), v117 (ref), l_HostComponent_0 (copy), v118 (ref), l_SuspenseComponent_0 (copy), l_FundamentalComponent_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), l_IncompleteClassComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), l_OffscreenComponent_0 (copy), l_ScopeComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_invariant_0 (copy), l_Ref_0 (copy)
    if v183 ~= nil then
        v106 = v183;
    end;
    if v184 ~= nil then
        v102 = v184;
    end;
    local l_flags_0 = v181.flags;
    local l_tag_0 = v181.tag;
    if l_tag_0 == l_Profiler_0 then
        local v187 = nil;
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 then
            v187 = v123;
            v123 = v181;
        end;
        local l_child_0 = v181.child;
        while l_child_0 ~= nil do
            if bit32.band(v181.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if _G.__DEV__ then
                    local l_l_current_0_0 = l_current_0;
                    l_setCurrentFiber_0(l_child_0);
                    l_invokeGuardedCallback_0(nil, v180, nil, l_child_0, v182, v106, v102);
                    if l_hasCaughtError_0() then
                        local v190 = l_clearCaughtError_0();
                        v106(l_child_0, v181, v190);
                    end;
                    if l_l_current_0_0 ~= nil then
                        l_setCurrentFiber_0(l_l_current_0_0);
                    else
                        l_resetCurrentFiber_0();
                    end;
                else
                    local v191, v192 = xpcall(v180, l_describeError_0, l_child_0, v182, v106, v102);
                    if not v191 then
                        v106(l_child_0, v181, v192);
                    end;
                end;
            end;
            l_child_0 = l_child_0.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 and l_enableProfilerTimer_0 then
            if _G.__DEV__ then
                local l_l_current_0_1 = l_current_0;
                l_setCurrentFiber_0(v181);
                l_invokeGuardedCallback_0(nil, commitLayoutEffectsForProfiler, nil, v181, v182);
                if l_hasCaughtError_0() then
                    local v194 = l_clearCaughtError_0();
                    v106(v181, v181.return_, v194);
                end;
                if l_l_current_0_1 ~= nil then
                    l_setCurrentFiber_0(l_l_current_0_1);
                else
                    l_resetCurrentFiber_0();
                end;
            else
                local v195, v196 = xpcall(commitLayoutEffectsForProfiler, l_describeError_0, v181, v182);
                if not v195 then
                    v106(v181, v181.return_, v196);
                end;
            end;
        end;
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 then
            if v187 ~= nil then
                local l_stateNode_2 = v187.stateNode;
                l_stateNode_2.effectDuration = l_stateNode_2.effectDuration + v181.stateNode.effectDuration;
            end;
            v123 = v187;
            return;
        end;
    else
        local l_child_1 = v181.child;
        while l_child_1 ~= nil do
            if bit32.band(v181.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if _G.__DEV__ then
                    local l_current_1 = v63.current;
                    l_setCurrentFiber_0(l_child_1);
                    if v2 < 20 then
                        v2 = v2 + 1;
                        l_invokeGuardedCallback_0(nil, v180, nil, l_child_1, v182, v106, v102);
                        v2 = v2 - 1;
                        if l_hasCaughtError_0() then
                            local v200 = l_clearCaughtError_0();
                            v106(l_child_1, v181, v200);
                        end;
                    else
                        v180(l_child_1, v182, v106, v102);
                    end;
                    if l_current_1 ~= nil then
                        l_setCurrentFiber_0(l_current_1);
                    else
                        l_resetCurrentFiber_0();
                    end;
                else
                    local v201 = nil;
                    local v202 = nil;
                    if not _G.__YOLO__ and v2 < 20 then
                        v2 = v2 + 1;
                        local v203, v204 = xpcall(v180, l_describeError_0, l_child_1, v182, v106, v102);
                        v201 = v203;
                        v202 = v204;
                        v2 = v2 - 1;
                    else
                        v201 = true;
                        v180(l_child_1, v182, v106, v102);
                    end;
                    if not v201 then
                        v106(l_child_1, v181, v202);
                    end;
                end;
            end;
            l_child_1 = l_child_1.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 then
            if l_tag_0 == l_FunctionComponent_0 or l_tag_0 == l_ForwardRef_0 or l_tag_0 == l_SimpleMemoComponent_0 or l_tag_0 == l_Block_0 then
                if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v181.mode, l_ProfileMode_0) ~= 0 then
                    local v205, v206 = xpcall(function() --[[ Line: 730 ]]
                        -- upvalues: l_startLayoutEffectTimer_0 (ref), v173 (ref), l_Layout_0 (ref), l_HasEffect_0 (ref), v181 (copy)
                        l_startLayoutEffectTimer_0();
                        v173(bit32.bor(l_Layout_0, l_HasEffect_0), v181);
                    end, l_describeError_0);
                    l_recordLayoutEffectDuration_0(v181);
                    if not v205 then
                        error(v206);
                    end;
                else
                    v173(bit32.bor(l_Layout_0, l_HasEffect_0), v181);
                end;
                if bit32.band(v181.subtreeFlags, l_PassiveMask_0) ~= l_NoFlags_0 then
                    v102();
                end;
            elseif l_tag_0 == l_ClassComponent_0 then
                v119(v181);
            elseif l_tag_0 == l_HostRoot_0 then
                v117(v181);
            elseif l_tag_0 == l_HostComponent_0 then
                v118(v181);
            elseif l_tag_0 == l_SuspenseComponent_0 then
                commitSuspenseHydrationCallbacks(v182, v181);
            elseif l_tag_0 ~= l_FundamentalComponent_0 and l_tag_0 ~= l_HostPortal_0 and l_tag_0 ~= l_HostText_0 and l_tag_0 ~= l_IncompleteClassComponent_0 and l_tag_0 ~= l_LegacyHiddenComponent_0 and l_tag_0 ~= l_OffscreenComponent_0 and l_tag_0 ~= l_ScopeComponent_0 and l_tag_0 ~= l_SuspenseListComponent_0 then
                l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
            end;
        end;
        if bit32.band(l_flags_0, l_Ref_0) ~= 0 then
            commitAttachRef(v181);
        end;
    end;
end;
commitLayoutEffectsForProfiler = function(v207, v208) --[[ Line: 795 ]] --[[ Name: commitLayoutEffectsForProfiler ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_getCommitTime_0 (copy), l_Update_0 (copy), l_Callback_0 (copy), l_NoFlags_0 (copy), l_enableSchedulerTracing_0 (copy), l_enableProfilerCommitHooks_0 (copy)
    local v209 = false;
    local v210 = false;
    if l_enableProfilerTimer_0 then
        local l_flags_1 = v207.flags;
        local l_alternate_0 = v207.alternate;
        local l_onCommit_0 = v207.memoizedProps.onCommit;
        local l_onRender_0 = v207.memoizedProps.onRender;
        local l_effectDuration_0 = v207.stateNode.effectDuration;
        local v216 = l_getCommitTime_0();
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Callback_0_0 = l_Callback_0;
        if bit32.band(l_flags_1, l_l_Update_0_0) ~= l_NoFlags_0 then
            local v219;
            if typeof(l_onRender_0) == "function" then
                v219 = true;
            else
                if typeof(l_onRender_0) == "table" then
                    local v220 = getmetatable(l_onRender_0);
                    if v220 and rawget(v220, "__call") then
                        v219 = true;
                        v209 = true;
                    elseif l_onRender_0._isMockFunction then
                        v219 = true;
                        v209 = true;
                    end;
                end;
                if not v209 then
                    if not v209 then
                        v219 = false;
                    end;
                end;
            end;
            v209 = false;
            if v219 then
                if l_enableSchedulerTracing_0 then
                    l_onRender_0(v207.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v207.actualDuration, v207.treeBaseDuration, v207.actualStartTime, v216, v208.memoizedInteractions);
                else
                    l_onRender_0(v207.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v207.actualDuration, v207.treeBaseDuration, v207.actualStartTime, v216);
                end;
            end;
        end;
        if l_enableProfilerCommitHooks_0 and bit32.band(l_flags_1, l_l_Callback_0_0) ~= l_NoFlags_0 then
            local v221;
            if typeof(l_onCommit_0) == "function" then
                v221 = true;
            else
                if typeof(l_onCommit_0) == "table" then
                    local v222 = getmetatable(l_onCommit_0);
                    if v222 and rawget(v222, "__call") then
                        v221 = true;
                        v210 = true;
                    elseif l_onCommit_0._isMockFunction then
                        v221 = true;
                        v210 = true;
                    end;
                end;
                if not v210 then
                    if not v210 then
                        v221 = false;
                    end;
                end;
            end;
            v210 = false;
            if v221 then
                if l_enableSchedulerTracing_0 then
                    l_onCommit_0(v207.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v216, v208.memoizedInteractions);
                    return;
                else
                    l_onCommit_0(v207.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v216);
                end;
            end;
        end;
    end;
end;
v119 = function(v223) --[[ Line: 884 ]] --[[ Name: commitLayoutEffectsForClassComponent ]]
    -- upvalues: l_Update_0 (copy), v112 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_describeError_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_resolveDefaultProps_0 (copy), l_commitUpdateQueue_0 (copy)
    local l_stateNode_3 = v223.stateNode;
    local l_alternate_1 = v223.alternate;
    if bit32.band(v223.flags, l_Update_0) ~= 0 then
        if l_alternate_1 == nil then
            if _G.__DEV__ and v223.type == v223.elementType and not v112 then
                if l_stateNode_3.props ~= v223.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "componentDidMount. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v223.type) or "instance");
                end;
                if l_stateNode_3.state ~= v223.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "componentDidMount. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v223.type) or "instance");
                end;
            end;
            if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v223.mode, l_ProfileMode_0) ~= 0 then
                local v226, v227 = xpcall(function() --[[ Line: 924 ]]
                    -- upvalues: l_startLayoutEffectTimer_0 (ref), l_stateNode_3 (copy)
                    l_startLayoutEffectTimer_0();
                    l_stateNode_3:componentDidMount();
                end, l_describeError_0);
                l_recordLayoutEffectDuration_0(v223);
                if not v226 then
                    error(v227);
                end;
            else
                l_stateNode_3:componentDidMount();
            end;
        else
            local v228 = v223.elementType == v223.type and l_alternate_1.memoizedProps or l_resolveDefaultProps_0(v223.type, l_alternate_1.memoizedProps);
            local l_memoizedState_1 = l_alternate_1.memoizedState;
            if _G.__DEV__ and v223.type == v223.elementType and not v112 then
                if l_stateNode_3.props ~= v223.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "componentDidUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v223.type) or "instance");
                end;
                if l_stateNode_3.state ~= v223.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "componentDidUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v223.type) or "instance");
                end;
            end;
            if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v223.mode, l_ProfileMode_0) ~= 0 then
                local l_v228_0 = v228 --[[ copy: 3 -> 7 ]];
                local v231, v232 = xpcall(function() --[[ Line: 979 ]]
                    -- upvalues: l_startLayoutEffectTimer_0 (ref), l_stateNode_3 (copy), l_v228_0 (copy), l_memoizedState_1 (copy)
                    l_startLayoutEffectTimer_0();
                    l_stateNode_3:componentDidUpdate(l_v228_0, l_memoizedState_1, l_stateNode_3.__reactInternalSnapshotBeforeUpdate);
                end, l_describeError_0);
                l_recordLayoutEffectDuration_0(v223);
                if not v231 then
                    error(v232);
                end;
            else
                l_stateNode_3:componentDidUpdate(v228, l_memoizedState_1, l_stateNode_3.__reactInternalSnapshotBeforeUpdate);
            end;
        end;
    end;
    local l_updateQueue_2 = v223.updateQueue;
    if l_updateQueue_2 ~= nil then
        if _G.__DEV__ and v223.type == v223.elementType and not v112 then
            if l_stateNode_3.props ~= v223.memoizedProps then
                l_console_0.error("Expected %s props to match memoized props before " .. "processing the update queue. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v223.type) or "instance");
            end;
            if l_stateNode_3.state ~= v223.memoizedState then
                l_console_0.error("Expected %s state to match memoized state before " .. "processing the update queue. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v223.type) or "instance");
            end;
        end;
        l_commitUpdateQueue_0(v223, l_updateQueue_2, l_stateNode_3);
    end;
end;
v117 = function(v234) --[[ Line: 1042 ]] --[[ Name: commitLayoutEffectsForHostRoot ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy), l_ClassComponent_0 (copy), l_commitUpdateQueue_0 (copy)
    local l_updateQueue_3 = v234.updateQueue;
    if l_updateQueue_3 ~= nil then
        local v236 = nil;
        if v234.child ~= nil then
            local l_child_2 = v234.child;
            if l_child_2.tag == l_HostComponent_0 then
                v236 = l_getPublicInstance_0(l_child_2.stateNode);
            elseif l_child_2.tag == l_ClassComponent_0 then
                v236 = l_child_2.stateNode;
            end;
        end;
        l_commitUpdateQueue_0(v234, l_updateQueue_3, v236);
    end;
end;
v118 = function(v238) --[[ Line: 1061 ]] --[[ Name: commitLayoutEffectsForHostComponent ]]
    -- upvalues: l_Update_0 (copy), l_commitMount_0 (copy)
    local l_stateNode_4 = v238.stateNode;
    if v238.alternate == nil and bit32.band(v238.flags, l_Update_0) ~= 0 then
        local l_type_0 = v238.type;
        local l_memoizedProps_1 = v238.memoizedProps;
        l_commitMount_0(l_stateNode_4, l_type_0, l_memoizedProps_1, v238);
    end;
end;
local function v247(v242, v243) --[[ Line: 1076 ]] --[[ Name: hideOrUnhideAllChildren ]]
    -- upvalues: l_supportsMutation_0 (copy), l_HostComponent_0 (copy), l_hideInstance_0 (copy), l_unhideInstance_0 (copy), l_HostText_0 (copy), l_hideTextInstance_0 (copy), l_unhideTextInstance_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy)
    if l_supportsMutation_0 then
        local l_v242_0 = v242;
        while true do
            if l_v242_0.tag == l_HostComponent_0 then
                local l_stateNode_5 = l_v242_0.stateNode;
                if v243 then
                    l_hideInstance_0(l_stateNode_5);
                else
                    l_unhideInstance_0(l_v242_0.stateNode, l_v242_0.memoizedProps);
                end;
            elseif l_v242_0.tag == l_HostText_0 then
                local l_stateNode_6 = l_v242_0.stateNode;
                if v243 then
                    l_hideTextInstance_0(l_stateNode_6);
                else
                    l_unhideTextInstance_0(l_stateNode_6, l_v242_0.memoizedProps);
                end;
            elseif (l_v242_0.tag ~= l_OffscreenComponent_0 and l_v242_0.tag ~= l_LegacyHiddenComponent_0 or l_v242_0.memoizedState == nil or l_v242_0 == v242) and l_v242_0.child ~= nil then
                l_v242_0.child.return_ = l_v242_0;
                l_v242_0 = l_v242_0.child;
                continue;
            end;
            if l_v242_0 == v242 then
                return;
            else
                while true do
                    if l_v242_0.sibling == nil then
                        if l_v242_0.return_ == nil or l_v242_0.return_ == v242 then
                            return;
                        else
                            l_v242_0 = l_v242_0.return_;
                        end;
                    else
                        l_v242_0.sibling.return_ = l_v242_0.return_;
                        l_v242_0 = l_v242_0.sibling;
                        break;
                    end;
                end;
            end;
        end;
    else
        return;
    end;
end;
commitAttachRef = function(v248) --[[ Line: 1127 ]] --[[ Name: commitAttachRef ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    local l_ref_1 = v248.ref;
    if l_ref_1 ~= nil then
        local l_stateNode_7 = v248.stateNode;
        local v251 = nil;
        v251 = if v248.tag == l_HostComponent_0 then l_getPublicInstance_0(l_stateNode_7) else l_stateNode_7;
        if typeof(l_ref_1) == "function" then
            l_ref_1(v251);
            return;
        elseif _G.__DEV__ and typeof(l_ref_1) ~= "table" then
            l_console_0.error("Unexpected ref object provided for %s. " .. "Use either a ref-setter function or React.createRef().", l_getComponentName_0(v248.type) or "instance");
            return;
        else
            l_ref_1.current = v251;
        end;
    end;
end;
commitDetachRef = function(v252) --[[ Line: 1166 ]] --[[ Name: commitDetachRef ]]
    local l_ref_2 = v252.ref;
    if l_ref_2 ~= nil then
        if typeof(l_ref_2) == "function" then
            l_ref_2(nil);
            return;
        else
            l_ref_2.current = nil;
        end;
    end;
end;
v122 = function(v254, v255, v256, v257) --[[ Line: 1180 ]] --[[ Name: commitUnmount ]]
    -- upvalues: l_onCommitUnmount_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_Layout_0 (copy), l_NoFlags_1 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_describeError_0 (copy), v106 (ref), l_recordLayoutEffectDuration_0 (copy), l_ClassComponent_0 (copy), l_HostComponent_0 (copy), l_HostPortal_0 (copy), l_supportsMutation_0 (copy), v120 (ref), l_supportsPersistence_0 (copy), v1 (copy)
    l_onCommitUnmount_0(v255);
    if v255.tag == l_FunctionComponent_0 or v255.tag == l_ForwardRef_0 or v255.tag == l_MemoComponent_0 or v255.tag == l_SimpleMemoComponent_0 or v255.tag == l_Block_0 then
        local l_updateQueue_4 = v255.updateQueue;
        if l_updateQueue_4 ~= nil then
            local l_lastEffect_0 = l_updateQueue_4.lastEffect;
            if l_lastEffect_0 ~= nil then
                local l_next_2 = l_lastEffect_0.next;
                local l_l_next_2_0 = l_next_2;
                repeat
                    if l_l_next_2_0.destroy ~= nil and bit32.band(l_l_next_2_0.tag, l_Layout_0) ~= l_NoFlags_1 then
                        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v255.mode, l_ProfileMode_0) ~= 0 then
                            l_startLayoutEffectTimer_0();
                            local l_destroy_2 = l_l_next_2_0.destroy;
                            local v263, v264 = xpcall(l_destroy_2, l_describeError_0);
                            if not v263 then
                                v106(v255, v256, v264);
                            end;
                            l_recordLayoutEffectDuration_0(v255);
                        else
                            local l_destroy_3 = l_l_next_2_0.destroy;
                            local v266, v267 = xpcall(l_destroy_3, l_describeError_0);
                            if not v266 then
                                v106(v255, v256, v267);
                            end;
                        end;
                    end;
                    l_l_next_2_0 = l_l_next_2_0.next;
                until l_l_next_2_0 == l_next_2;
            end;
        end;
        return;
    elseif v255.tag == l_ClassComponent_0 then
        local l_ref_3 = v255.ref;
        if l_ref_3 ~= nil then
            if typeof(l_ref_3) == "function" then
                local v269, v270 = xpcall(l_ref_3, l_describeError_0);
                if not v269 then
                    v106(v255, v256, v270);
                end;
            else
                l_ref_3.current = nil;
            end;
        end;
        l_ref_3 = v255.stateNode;
        if typeof(l_ref_3.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v255, l_ref_3, v256);
        end;
        return;
    elseif v255.tag == l_HostComponent_0 then
        local l_ref_4 = v255.ref;
        if l_ref_4 ~= nil then
            if typeof(l_ref_4) == "function" then
                local v272, v273 = xpcall(l_ref_4, l_describeError_0);
                if not v272 then
                    v106(v255, v256, v273);
                    return;
                end;
            else
                l_ref_4.current = nil;
            end;
        end;
        return;
    elseif v255.tag == l_HostPortal_0 then
        if l_supportsMutation_0 then
            v120(v254, v255, v256, v257);
            return;
        else
            if l_supportsPersistence_0 then
                v1("emptyPortalContainer");
            end;
            return;
        end;
    else
        return;
    end;
end;
v121 = function(v274, v275, v276, v277) --[[ Line: 1283 ]] --[[ Name: commitNestedUnmounts ]]
    -- upvalues: v122 (ref), l_supportsMutation_0 (copy), l_HostPortal_0 (copy)
    local l_v275_0 = v275;
    while true do
        v122(v274, l_v275_0, v276, v277);
        if l_v275_0.child ~= nil and (not l_supportsMutation_0 or l_v275_0.tag ~= l_HostPortal_0) then
            l_v275_0.child.return_ = l_v275_0;
            l_v275_0 = l_v275_0.child;
            continue;
        end;
        if l_v275_0 == v275 then
            return;
        else
            while true do
                if l_v275_0.sibling == nil then
                    if l_v275_0.return_ == nil or l_v275_0.return_ == v275 then
                        return;
                    else
                        l_v275_0 = l_v275_0.return_;
                    end;
                else
                    l_v275_0.sibling.return_ = l_v275_0.return_;
                    l_v275_0 = l_v275_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function _(v279) --[[ Line: 1328 ]] --[[ Name: detachFiberMutation ]]
    local l_alternate_2 = v279.alternate;
    if l_alternate_2 ~= nil then
        l_alternate_2.return_ = nil;
        v279.alternate = nil;
    end;
    v279.return_ = nil;
end;
local function v284(v282) --[[ Line: 1395 ]] --[[ Name: getHostParentFiber ]]
    -- upvalues: v113 (ref), l_Error_0 (copy)
    local l_return__0 = v282.return_;
    while true do
        if l_return__0 ~= nil then
            if v113(l_return__0) then
                return l_return__0;
            else
                l_return__0 = l_return__0.return_;
            end;
        else
            error(l_Error_0.new("Expected to find a host parent. This error is likely caused by a bug " .. "in React. Please file an issue."));
            return;
        end;
    end;
end;
v113 = function(v285) --[[ Line: 1411 ]] --[[ Name: isHostParent ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy)
    local v286 = true;
    if v285.tag ~= l_HostComponent_0 then
        v286 = true;
        if v285.tag ~= l_HostRoot_0 then
            v286 = v285.tag == l_HostPortal_0;
        end;
    end;
    return v286;
end;
v114 = function(v287) --[[ Line: 1418 ]] --[[ Name: getHostSibling ]]
    -- upvalues: v113 (ref), l_HostComponent_0 (copy), l_HostText_0 (copy), l_DehydratedFragment_0 (copy), l_Placement_0 (copy), l_HostPortal_0 (copy)
    local l_v287_0 = v287;
    while true do
        local v289 = false;
        while true do
            if l_v287_0.sibling == nil then
                if l_v287_0.return_ == nil or v113(l_v287_0.return_) then
                    return nil;
                else
                    l_v287_0 = l_v287_0.return_;
                end;
            else
                l_v287_0.sibling.return_ = l_v287_0.return_;
                l_v287_0 = l_v287_0.sibling;
                while l_v287_0.tag ~= l_HostComponent_0 and l_v287_0.tag ~= l_HostText_0 and l_v287_0.tag ~= l_DehydratedFragment_0 do
                    if bit32.band(l_v287_0.flags, l_Placement_0) ~= 0 then
                        v289 = true;
                        break;
                    elseif l_v287_0.child == nil or l_v287_0.tag == l_HostPortal_0 then
                        v289 = true;
                        break;
                    else
                        l_v287_0.child.return_ = l_v287_0;
                        l_v287_0 = l_v287_0.child;
                    end;
                end;
                if not v289 and bit32.band(l_v287_0.flags, l_Placement_0) == 0 then
                    return l_v287_0.stateNode;
                else
                    break;
                end;
            end;
        end;
    end;
end;
local function v296(v290) --[[ Line: 1472 ]] --[[ Name: commitPlacement ]]
    -- upvalues: l_supportsMutation_0 (copy), v284 (copy), l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy), l_invariant_0 (copy), l_ContentReset_0 (copy), l_resetTextContent_0 (copy), v114 (ref), v116 (ref), v115 (ref)
    if not l_supportsMutation_0 then
        return;
    else
        local v291 = v284(v290);
        local v292 = nil;
        local v293 = nil;
        local l_stateNode_8 = v291.stateNode;
        if v291.tag == l_HostComponent_0 then
            v292 = l_stateNode_8;
            v293 = false;
        elseif v291.tag == l_HostRoot_0 then
            v292 = l_stateNode_8.containerInfo;
            v293 = true;
        elseif v291.tag == l_HostPortal_0 then
            v292 = l_stateNode_8.containerInfo;
            v293 = true;
        else
            l_invariant_0(false, "Invalid host parent fiber. This error is likely caused by a bug " .. "in React. Please file an issue.");
        end;
        if bit32.band(v291.flags, l_ContentReset_0) ~= 0 then
            l_resetTextContent_0(v292);
            v291.flags = bit32.band(v291.flags, (bit32.bnot(l_ContentReset_0)));
        end;
        local v295 = v114(v290);
        if v293 then
            v116(v290, v295, v292);
            return;
        else
            v115(v290, v295, v292);
            return;
        end;
    end;
end;
v116 = function(v297, v298, v299) --[[ Line: 1523 ]] --[[ Name: insertOrAppendPlacementNodeIntoContainer ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_insertInContainerBefore_0 (copy), l_appendChildToContainer_0 (copy), l_HostPortal_0 (copy), v116 (ref)
    local l_tag_1 = v297.tag;
    local v301 = true;
    if l_tag_1 ~= l_HostComponent_0 then
        v301 = l_tag_1 == l_HostText_0;
    end;
    if v301 then
        local l_stateNode_9 = v297.stateNode;
        if v298 then
            l_insertInContainerBefore_0(v299, l_stateNode_9, v298);
            return;
        else
            l_appendChildToContainer_0(v299, l_stateNode_9);
            return;
        end;
    elseif l_tag_1 == l_HostPortal_0 then
        return;
    else
        local l_child_3 = v297.child;
        if l_child_3 ~= nil then
            v116(l_child_3, v298, v299);
            local l_sibling_0 = l_child_3.sibling;
            while l_sibling_0 ~= nil do
                v116(l_sibling_0, v298, v299);
                l_sibling_0 = l_sibling_0.sibling;
            end;
        end;
        return;
    end;
end;
v115 = function(v305, v306, v307) --[[ Line: 1555 ]] --[[ Name: insertOrAppendPlacementNode ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_insertBefore_0 (copy), l_appendChild_0 (copy), l_HostPortal_0 (copy), v115 (ref)
    local l_tag_2 = v305.tag;
    local v309 = true;
    if l_tag_2 ~= l_HostComponent_0 then
        v309 = l_tag_2 == l_HostText_0;
    end;
    if v309 then
        local l_stateNode_10 = v305.stateNode;
        if v306 then
            l_insertBefore_0(v307, l_stateNode_10, v306);
            return;
        else
            l_appendChild_0(v307, l_stateNode_10);
            return;
        end;
    elseif l_tag_2 == l_HostPortal_0 then
        return;
    else
        local l_child_4 = v305.child;
        if l_child_4 ~= nil then
            v115(l_child_4, v306, v307);
            local l_sibling_1 = l_child_4.sibling;
            while l_sibling_1 ~= nil do
                v115(l_sibling_1, v306, v307);
                l_sibling_1 = l_sibling_1.sibling;
            end;
        end;
        return;
    end;
end;
v120 = function(v313, v314, v315, v316) --[[ Line: 1587 ]] --[[ Name: unmountHostComponents ]]
    -- upvalues: l_Error_0 (copy), l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), v121 (ref), l_removeChildFromContainer_0 (copy), l_removeChild_0 (copy), v122 (ref)
    local l_v314_0 = v314;
    local v318 = false;
    local v319 = nil;
    local v320 = nil;
    while true do
        if not v318 then
            local l_return__1 = l_v314_0.return_;
            while true do
                if l_return__1 == nil then
                    error(l_Error_0.new("Expected to find a host parent. This error is likely caused by " .. "a bug in React. Please file an issue."));
                end;
                local l_stateNode_11 = l_return__1.stateNode;
                if l_return__1.tag == l_HostComponent_0 then
                    v319 = l_stateNode_11;
                    v320 = false;
                    break;
                elseif l_return__1.tag == l_HostRoot_0 then
                    v319 = l_stateNode_11.containerInfo;
                    v320 = true;
                    break;
                elseif l_return__1.tag == l_HostPortal_0 then
                    v319 = l_stateNode_11.containerInfo;
                    v320 = true;
                    break;
                else
                    l_return__1 = l_return__1.return_;
                end;
            end;
            v318 = true;
        end;
        if l_v314_0.tag == l_HostComponent_0 or l_v314_0.tag == l_HostText_0 then
            v121(v313, l_v314_0, v315, v316);
            if v320 then
                l_removeChildFromContainer_0(v319, l_v314_0.stateNode);
            else
                l_removeChild_0(v319, l_v314_0.stateNode);
            end;
        elseif l_v314_0.tag == l_HostPortal_0 then
            if l_v314_0.child ~= nil then
                v319 = l_v314_0.stateNode.containerInfo;
                v320 = true;
                l_v314_0.child.return_ = l_v314_0;
                l_v314_0 = l_v314_0.child;
                continue;
            end;
        else
            v122(v313, l_v314_0, v315, v316);
            if l_v314_0.child ~= nil then
                l_v314_0.child.return_ = l_v314_0;
                l_v314_0 = l_v314_0.child;
                continue;
            end;
        end;
        if l_v314_0 == v314 then
            return;
        else
            while true do
                if l_v314_0.sibling == nil then
                    if l_v314_0.return_ == nil or l_v314_0.return_ == v314 then
                        return;
                    else
                        l_v314_0 = l_v314_0.return_;
                        if l_v314_0.tag == l_HostPortal_0 then
                            v318 = false;
                        end;
                    end;
                else
                    l_v314_0.sibling.return_ = l_v314_0.return_;
                    l_v314_0 = l_v314_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function v329(v323, v324, v325, v326) --[[ Line: 1769 ]] --[[ Name: commitDeletion ]]
    -- upvalues: v120 (ref)
    v120(v323, v324, v325, v326);
    local l_alternate_3 = v324.alternate;
    local l_alternate_4 = v324.alternate;
    if l_alternate_4 ~= nil then
        l_alternate_4.return_ = nil;
        v324.alternate = nil;
    end;
    v324.return_ = nil;
    if l_alternate_3 ~= nil then
        l_alternate_4 = l_alternate_3.alternate;
        if l_alternate_4 ~= nil then
            l_alternate_4.return_ = nil;
            l_alternate_3.alternate = nil;
        end;
        l_alternate_3.return_ = nil;
    end;
end;
local function v344(v330, v331) --[[ Line: 1801 ]] --[[ Name: commitWork ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v164 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_describeError_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_ClassComponent_0 (copy), l_HostComponent_0 (copy), l_commitUpdate_0 (copy), l_HostText_0 (copy), l_invariant_0 (copy), l_commitTextUpdate_0 (copy), l_HostRoot_0 (copy), l_supportsHydration_0 (copy), v1 (copy), l_Profiler_0 (copy), l_SuspenseComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_IncompleteClassComponent_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), v247 (copy)
    if v331.tag == l_FunctionComponent_0 or v331.tag == l_ForwardRef_0 or v331.tag == l_MemoComponent_0 or v331.tag == l_SimpleMemoComponent_0 or v331.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v331.mode, l_ProfileMode_0) ~= 0 then
            local v332, v333 = xpcall(function() --[[ Line: 1890 ]]
                -- upvalues: l_startLayoutEffectTimer_0 (ref), v164 (ref), l_Layout_0 (ref), l_HasEffect_0 (ref), v331 (copy)
                l_startLayoutEffectTimer_0();
                v164(bit32.bor(l_Layout_0, l_HasEffect_0), v331, v331.return_);
            end, l_describeError_0);
            l_recordLayoutEffectDuration_0(v331);
            if not v332 then
                error(v333);
                return;
            end;
        else
            v164(bit32.bor(l_Layout_0, l_HasEffect_0), v331, v331.return_);
        end;
        return;
    elseif v331.tag == l_ClassComponent_0 then
        return;
    elseif v331.tag == l_HostComponent_0 then
        local l_stateNode_12 = v331.stateNode;
        if l_stateNode_12 ~= nil then
            local l_memoizedProps_2 = v331.memoizedProps;
            local v336 = nil;
            v336 = if v330 then v330.memoizedProps else l_memoizedProps_2;
            local l_type_1 = v331.type;
            local l_updateQueue_5 = v331.updateQueue;
            v331.updateQueue = nil;
            if l_updateQueue_5 ~= nil then
                l_commitUpdate_0(l_stateNode_12, l_updateQueue_5, l_type_1, v336, l_memoizedProps_2, v331);
            end;
        end;
        return;
    elseif v331.tag == l_HostText_0 then
        l_invariant_0(v331.stateNode ~= nil, "This should have a text node initialized. This error is likely " .. "caused by a bug in React. Please file an issue.");
        local l_stateNode_13 = v331.stateNode;
        local l_memoizedProps_3 = v331.memoizedProps;
        local v341 = nil;
        if v330 ~= nil then
            v341 = v330.memoizedProps;
            v341 = l_memoizedProps_3;
        end;
        l_commitTextUpdate_0(l_stateNode_13, v341, l_memoizedProps_3);
        return;
    elseif v331.tag == l_HostRoot_0 then
        if l_supportsHydration_0 then
            local l_stateNode_14 = v331.stateNode;
            if l_stateNode_14.hydrate then
                l_stateNode_14.hydrate = false;
                v1("commitWork: HostRoot: commitHydratedContainer");
            end;
        end;
        return;
    elseif v331.tag == l_Profiler_0 then
        return;
    elseif v331.tag == l_SuspenseComponent_0 then
        commitSuspenseComponent(v331);
        attachSuspenseRetryListeners(v331);
        return;
    else
        if v331.tag == l_SuspenseListComponent_0 then
            v1("commitWork: SuspenseListComponent");
        elseif v331.tag == l_IncompleteClassComponent_0 then
            return;
        elseif v331.tag == l_OffscreenComponent_0 or v331.tag == l_LegacyHiddenComponent_0 then
            local v343 = v331.memoizedState ~= nil;
            v247(v331, v343);
            return;
        end;
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
        return;
    end;
end;
commitSuspenseComponent = function(v345) --[[ Line: 2016 ]] --[[ Name: commitSuspenseComponent ]]
    -- upvalues: v97 (ref), l_supportsMutation_0 (copy), v247 (copy), l_enableSuspenseCallback_0 (copy), l_Object_0 (copy), l_console_0 (copy)
    local l_memoizedState_2 = v345.memoizedState;
    if l_memoizedState_2 ~= nil then
        if not v97 then
            v97 = require(script.Parent["ReactFiberWorkLoop.new"]);
        end;
        v97.markCommitTimeOfFallback();
        if l_supportsMutation_0 then
            local l_child_5 = v345.child;
            v247(l_child_5, true);
        end;
    end;
    if l_enableSuspenseCallback_0 and l_memoizedState_2 ~= nil then
        local l_suspenseCallback_0 = v345.memoizedProps.suspenseCallback;
        if typeof(l_suspenseCallback_0) == "function" then
            local l_updateQueue_6 = v345.updateQueue;
            if l_updateQueue_6 ~= nil then
                l_suspenseCallback_0(l_Object_0.assign({}, l_updateQueue_6));
                return;
            end;
        elseif _G.__DEV__ and l_suspenseCallback_0 ~= nil then
            l_console_0.error("Unexpected type for suspenseCallback: %s", (tostring(l_suspenseCallback_0)));
        end;
    end;
end;
commitSuspenseHydrationCallbacks = function(v350, v351) --[[ Line: 2052 ]] --[[ Name: commitSuspenseHydrationCallbacks ]]
    -- upvalues: l_supportsHydration_0 (copy), l_commitHydratedSuspenseInstance_0 (copy), l_enableSuspenseCallback_0 (copy)
    if not l_supportsHydration_0 then
        return;
    else
        if v351.memoizedState == nil then
            local l_alternate_5 = v351.alternate;
            if l_alternate_5 ~= nil then
                local l_memoizedState_3 = l_alternate_5.memoizedState;
                if l_memoizedState_3 ~= nil then
                    local l_dehydrated_0 = l_memoizedState_3.dehydrated;
                    if l_dehydrated_0 ~= nil then
                        l_commitHydratedSuspenseInstance_0(l_dehydrated_0);
                        if l_enableSuspenseCallback_0 then
                            local l_hydrationCallbacks_0 = v350.hydrationCallbacks;
                            if l_hydrationCallbacks_0 ~= nil then
                                local l_onHydrated_0 = l_hydrationCallbacks_0.onHydrated;
                                if l_onHydrated_0 then
                                    l_onHydrated_0(l_dehydrated_0);
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
attachSuspenseRetryListeners = function(v357) --[[ Line: 2083 ]] --[[ Name: attachSuspenseRetryListeners ]]
    -- upvalues: l_Set_0 (copy), v100 (copy), l_enableSchedulerTracing_0 (copy), l_unstable_wrap_0 (copy)
    local l_updateQueue_7 = v357.updateQueue;
    if l_updateQueue_7 ~= nil then
        v357.updateQueue = nil;
        local l_stateNode_15 = v357.stateNode;
        if l_stateNode_15 == nil then
            v357.stateNode = l_Set_0.new();
            l_stateNode_15 = v357.stateNode;
        end;
        for v360, _ in l_updateQueue_7 do
            local function v362() --[[ Line: 2097 ]]
                -- upvalues: v100 (ref), v357 (copy), v360 (copy)
                return v100(v357, v360);
            end;
            do
                local l_v362_0 = v362;
                if not l_stateNode_15:has(v360) then
                    if l_enableSchedulerTracing_0 and v360.__reactDoNotTraceInteractions ~= true then
                        l_v362_0 = l_unstable_wrap_0(l_v362_0);
                    end;
                    l_stateNode_15:add(v360);
                    v360:andThen(function() --[[ Line: 2109 ]]
                        -- upvalues: l_v362_0 (ref)
                        return l_v362_0();
                    end, function() --[[ Line: 2112 ]]
                        -- upvalues: l_v362_0 (ref)
                        return l_v362_0();
                    end);
                end;
            end;
        end;
    end;
end;
isSuspenseBoundaryBeingHidden = function(v364, v365) --[[ Line: 2124 ]] --[[ Name: isSuspenseBoundaryBeingHidden ]]
    if v364 ~= nil then
        local l_memoizedState_4 = v364.memoizedState;
        if l_memoizedState_4 == nil or l_memoizedState_4.dehydrated ~= nil then
            local l_memoizedState_5 = v365.memoizedState;
            local v368 = false;
            if l_memoizedState_5 ~= nil then
                v368 = l_memoizedState_5.dehydrated == nil;
            end;
            return v368;
        end;
    end;
    return false;
end;
commitResetTextContent = function(v369) --[[ Line: 2139 ]] --[[ Name: commitResetTextContent ]]
    -- upvalues: l_supportsMutation_0 (copy), l_resetTextContent_0 (copy)
    if not l_supportsMutation_0 then
        return;
    else
        l_resetTextContent_0(v369.stateNode);
        return;
    end;
end;
local function v371(v370) --[[ Line: 2146 ]] --[[ Name: commitPassiveUnmount ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v164 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_recordPassiveEffectDuration_0 (copy)
    if v370.tag == l_FunctionComponent_0 or v370.tag == l_ForwardRef_0 or v370.tag == l_SimpleMemoComponent_0 or v370.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v370.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v164(bit32.bor(l_Passive_0, l_HasEffect_0), v370, v370.return_);
            l_recordPassiveEffectDuration_0(v370);
            return;
        else
            v164(bit32.bor(l_Passive_0, l_HasEffect_0), v370, v370.return_);
        end;
    end;
end;
local function v374(v372, v373) --[[ Line: 2175 ]] --[[ Name: commitPassiveUnmountInsideDeletedTree ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v164 (copy), l_Passive_0 (copy), l_recordPassiveEffectDuration_0 (copy)
    if v372.tag == l_FunctionComponent_0 or v372.tag == l_ForwardRef_0 or v372.tag == l_SimpleMemoComponent_0 or v372.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v372.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v164(l_Passive_0, v372, v373);
            l_recordPassiveEffectDuration_0(v372);
            return;
        else
            v164(l_Passive_0, v372, v373);
        end;
    end;
end;
local function v379(v375, v376) --[[ Line: 2207 ]] --[[ Name: commitPassiveMount ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v173 (copy), l_describeError_0 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_recordPassiveEffectDuration_0 (copy), l_Profiler_0 (copy)
    if v376.tag == l_FunctionComponent_0 or v376.tag == l_ForwardRef_0 or v376.tag == l_SimpleMemoComponent_0 or v376.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v376.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            local v377, v378 = xpcall(v173, l_describeError_0, bit32.bor(l_Passive_0, l_HasEffect_0), v376);
            l_recordPassiveEffectDuration_0(v376);
            if not v377 then
                error(v378);
                return;
            end;
        else
            v173(bit32.bor(l_Passive_0, l_HasEffect_0), v376);
            return;
        end;
    elseif v376.tag == l_Profiler_0 then
        commitProfilerPassiveEffect(v375, v376);
    end;
end;
invokeLayoutEffectMountInDEV = function(v380) --[[ Line: 2238 ]] --[[ Name: invokeLayoutEffectMountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v173 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v106 (ref), l_ClassComponent_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        if v380.tag == l_FunctionComponent_0 or v380.tag == l_ForwardRef_0 or v380.tag == l_SimpleMemoComponent_0 or v380.tag == l_Block_0 then
            l_invokeGuardedCallback_0(nil, v173, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v380);
            if l_hasCaughtError_0() then
                local v381 = l_clearCaughtError_0();
                v106(v380, v380.return_, v381);
            end;
            return;
        end;
    elseif v380.tag == l_ClassComponent_0 then
        local l_stateNode_16 = v380.stateNode;
        l_invokeGuardedCallback_0(nil, l_stateNode_16.componentDidMount, l_stateNode_16);
        if l_hasCaughtError_0() then
            local v383 = l_clearCaughtError_0();
            v106(v380, v380.return_, v383);
        end;
        return;
    end;
end;
invokePassiveEffectMountInDEV = function(v384) --[[ Line: 2269 ]] --[[ Name: invokePassiveEffectMountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v173 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v106 (ref)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 and (v384.tag == l_FunctionComponent_0 or v384.tag == l_ForwardRef_0 or v384.tag == l_SimpleMemoComponent_0 or v384.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v173, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v384);
        if l_hasCaughtError_0() then
            local v385 = l_clearCaughtError_0();
            v106(v384, v384.return_, v385);
        end;
        return;
    else
        return;
    end;
end;
invokeLayoutEffectUnmountInDEV = function(v386) --[[ Line: 2292 ]] --[[ Name: invokeLayoutEffectUnmountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v164 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v106 (ref), l_ClassComponent_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        if v386.tag == l_FunctionComponent_0 or v386.tag == l_ForwardRef_0 or v386.tag == l_SimpleMemoComponent_0 or v386.tag == l_Block_0 then
            l_invokeGuardedCallback_0(nil, v164, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v386, v386.return_);
            if l_hasCaughtError_0() then
                local v387 = l_clearCaughtError_0();
                v106(v386, v386.return_, v387);
            end;
            return;
        end;
    elseif v386.tag == l_ClassComponent_0 then
        local l_stateNode_17 = v386.stateNode;
        if typeof(l_stateNode_17.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v386, l_stateNode_17, v386.return_);
        end;
        return;
    end;
end;
invokePassiveEffectUnmountInDEV = function(v389) --[[ Line: 2321 ]] --[[ Name: invokePassiveEffectUnmountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v164 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v106 (ref)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 and (v389.tag == l_FunctionComponent_0 or v389.tag == l_ForwardRef_0 or v389.tag == l_SimpleMemoComponent_0 or v389.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v164, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v389, v389.return_);
        if l_hasCaughtError_0() then
            local v390 = l_clearCaughtError_0();
            v106(v389, v389.return_, v390);
        end;
        return;
    else
        return;
    end;
end;
return {
    safelyCallDestroy = v145, 
    commitBeforeMutationLifeCycles = v153, 
    commitResetTextContent = commitResetTextContent, 
    commitPlacement = v296, 
    commitDeletion = v329, 
    commitWork = v344, 
    commitAttachRef = commitAttachRef, 
    commitDetachRef = commitDetachRef, 
    commitPassiveUnmount = v371, 
    commitPassiveUnmountInsideDeletedTree = v374, 
    commitPassiveMount = v379, 
    invokeLayoutEffectMountInDEV = invokeLayoutEffectMountInDEV, 
    invokeLayoutEffectUnmountInDEV = invokeLayoutEffectUnmountInDEV, 
    invokePassiveEffectMountInDEV = invokePassiveEffectMountInDEV, 
    invokePassiveEffectUnmountInDEV = invokePassiveEffectUnmountInDEV, 
    isSuspenseBoundaryBeingHidden = isSuspenseBoundaryBeingHidden, 
    recursivelyCommitLayoutEffects = v180
};