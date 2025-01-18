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
local l_Object_0 = v8.Object;
local l_Set_0 = v8.Set;
local v11 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v14 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local v17 = require(script.Parent.ReactHookEffectTags);
local l_unstable_wrap_0 = require(l_Parent_0.Scheduler).tracing.unstable_wrap;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local l_enableProfilerCommitHooks_0 = l_ReactFeatureFlags_0.enableProfilerCommitHooks;
local l_enableSuspenseCallback_0 = l_ReactFeatureFlags_0.enableSuspenseCallback;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v25 = require(script.Parent.ReactWorkTags);
local l_FunctionComponent_0 = v25.FunctionComponent;
local l_ForwardRef_0 = v25.ForwardRef;
local l_ClassComponent_0 = v25.ClassComponent;
local l_HostRoot_0 = v25.HostRoot;
local l_HostComponent_0 = v25.HostComponent;
local l_HostText_0 = v25.HostText;
local l_HostPortal_0 = v25.HostPortal;
local l_Profiler_0 = v25.Profiler;
local l_SuspenseComponent_0 = v25.SuspenseComponent;
local l_DehydratedFragment_0 = v25.DehydratedFragment;
local l_IncompleteClassComponent_0 = v25.IncompleteClassComponent;
local l_MemoComponent_0 = v25.MemoComponent;
local l_SimpleMemoComponent_0 = v25.SimpleMemoComponent;
local l_SuspenseListComponent_0 = v25.SuspenseListComponent;
local l_FundamentalComponent_0 = v25.FundamentalComponent;
local l_ScopeComponent_0 = v25.ScopeComponent;
local l_Block_0 = v25.Block;
local l_OffscreenComponent_0 = v25.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v25.LegacyHiddenComponent;
local l_ReactErrorUtils_0 = require(l_Parent_0.Shared).ReactErrorUtils;
local l_invokeGuardedCallback_0 = l_ReactErrorUtils_0.invokeGuardedCallback;
local l_hasCaughtError_0 = l_ReactErrorUtils_0.hasCaughtError;
local l_clearCaughtError_0 = l_ReactErrorUtils_0.clearCaughtError;
local v49 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v49.NoFlags;
local l_ContentReset_0 = v49.ContentReset;
local l_Placement_0 = v49.Placement;
local l_Snapshot_0 = v49.Snapshot;
local l_Update_0 = v49.Update;
local l_Callback_0 = v49.Callback;
local l_LayoutMask_0 = v49.LayoutMask;
local l_PassiveMask_0 = v49.PassiveMask;
local l_Ref_0 = v49.Ref;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local v61 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v61.current;
local l_resetCurrentFiber_0 = v61.resetCurrentFiber;
local l_setCurrentFiber_0 = v61.setCurrentFiber;
local l_onCommitUnmount_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitUnmount;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v67 = require(script.Parent["ReactProfilerTimer.new"]);
local l_startLayoutEffectTimer_0 = v67.startLayoutEffectTimer;
local l_recordPassiveEffectDuration_0 = v67.recordPassiveEffectDuration;
local l_recordLayoutEffectDuration_0 = v67.recordLayoutEffectDuration;
local l_startPassiveEffectTimer_0 = v67.startPassiveEffectTimer;
local l_getCommitTime_0 = v67.getCommitTime;
local l_ProfileMode_0 = require(script.Parent.ReactTypeOfMode).ProfileMode;
local l_commitUpdateQueue_0 = v14.commitUpdateQueue;
local l_getPublicInstance_0 = v11.getPublicInstance;
local l_supportsMutation_0 = v11.supportsMutation;
local l_supportsPersistence_0 = v11.supportsPersistence;
local l_supportsHydration_0 = v11.supportsHydration;
local l_commitMount_0 = v11.commitMount;
local l_commitUpdate_0 = v11.commitUpdate;
local l_resetTextContent_0 = v11.resetTextContent;
local l_commitTextUpdate_0 = v11.commitTextUpdate;
local l_appendChild_0 = v11.appendChild;
local l_appendChildToContainer_0 = v11.appendChildToContainer;
local l_insertBefore_0 = v11.insertBefore;
local l_insertInContainerBefore_0 = v11.insertInContainerBefore;
local l_removeChild_0 = v11.removeChild;
local l_removeChildFromContainer_0 = v11.removeChildFromContainer;
local l_hideInstance_0 = v11.hideInstance;
local l_hideTextInstance_0 = v11.hideTextInstance;
local l_unhideInstance_0 = v11.unhideInstance;
local l_unhideTextInstance_0 = v11.unhideTextInstance;
local l_commitHydratedSuspenseInstance_0 = v11.commitHydratedSuspenseInstance;
local l_clearContainer_0 = v11.clearContainer;
local v95 = nil;
local function v98(v96, v97) --[[ Line: 185 ]] --[[ Name: resolveRetryWakeable ]]
    -- upvalues: v95 (ref)
    if not v95 then
        v95 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v95.resolveRetryWakeable(v96, v97);
end;
local function _() --[[ Line: 192 ]] --[[ Name: markCommitTimeOfFallback ]]
    -- upvalues: v95 (ref)
    if not v95 then
        v95 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v95.markCommitTimeOfFallback();
end;
local function v100() --[[ Line: 200 ]] --[[ Name: schedulePassiveEffectCallback ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback());
end;
local function v104(_, _, v103) --[[ Line: 205 ]] --[[ Name: captureCommitPhaseError ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle");
    error(v103);
end;
local l_NoFlags_1 = v17.NoFlags;
local l_HasEffect_0 = v17.HasEffect;
local l_Layout_0 = v17.Layout;
local l_Passive_0 = v17.Passive;
local v109 = nil;
local function v110() --[[ Line: 221 ]]
    -- upvalues: v109 (ref)
    if not v109 then
        v109 = require(script.Parent["ReactFiberBeginWork.new"]).didWarnAboutReassigningProps;
    end;
    return v109;
end;
local v111 = nil;
local v112 = nil;
local v113 = nil;
local v114 = nil;
local v115 = nil;
local v116 = nil;
local v117 = nil;
local v118 = nil;
local v119 = nil;
local v120 = nil;
local v121 = nil;
local function v126(v122, v123) --[[ Line: 248 ]] --[[ Name: callComponentWillUnmountWithTimer ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_recordLayoutEffectDuration_0 (copy)
    v123.props = v122.memoizedProps;
    v123.state = v122.memoizedState;
    if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v122.mode, l_ProfileMode_0) ~= 0 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 257 ]]
            -- upvalues: l_startLayoutEffectTimer_0 (ref), v123 (copy)
            l_startLayoutEffectTimer_0();
            v123:componentWillUnmount();
        end);
        l_recordLayoutEffectDuration_0(v122);
        if not l_status_0 then
            error(l_result_0);
            return;
        end;
    else
        v123:componentWillUnmount();
    end;
end;
safelyCallComponentWillUnmount = function(v127, v128, v129) --[[ Line: 275 ]] --[[ Name: safelyCallComponentWillUnmount ]]
    -- upvalues: v126 (copy), v104 (ref)
    local l_status_1, l_result_1 = pcall(v126, v127, v128);
    if not l_status_1 then
        v104(v127, v129, l_result_1);
    end;
end;
local function _(v132, v133) --[[ Line: 288 ]] --[[ Name: safelyDetachRef ]]
    -- upvalues: v104 (ref)
    local l_ref_0 = v132.ref;
    if l_ref_0 ~= nil then
        if typeof(l_ref_0) == "function" then
            local l_status_2, l_result_2 = pcall(l_ref_0, nil);
            if not l_status_2 then
                v104(v132, v133, l_result_2);
                return;
            end;
        else
            l_ref_0.current = nil;
        end;
    end;
end;
local function v143(v138, v139, v140) --[[ Line: 303 ]] --[[ Name: safelyCallDestroy ]]
    -- upvalues: v104 (ref)
    local l_status_3, l_result_3 = pcall(v140);
    if not l_status_3 then
        v104(v138, v139, l_result_3);
    end;
end;
local function v151(v144, v145) --[[ Line: 315 ]] --[[ Name: commitBeforeMutationLifeCycles ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_ClassComponent_0 (copy), l_Snapshot_0 (copy), v110 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resolveDefaultProps_0 (copy), l_HostRoot_0 (copy), l_supportsMutation_0 (copy), l_clearContainer_0 (copy), l_HostComponent_0 (copy), l_HostText_0 (copy), l_HostPortal_0 (copy), l_IncompleteClassComponent_0 (copy), l_invariant_0 (copy)
    if v145.tag == l_FunctionComponent_0 or v145.tag == l_ForwardRef_0 or v145.tag == l_SimpleMemoComponent_0 or v145.tag == l_Block_0 then
        return;
    elseif v145.tag == l_ClassComponent_0 then
        if bit32.band(v145.flags, l_Snapshot_0) ~= 0 and v144 ~= nil then
            local l_memoizedProps_0 = v144.memoizedProps;
            local l_memoizedState_0 = v144.memoizedState;
            local l_stateNode_0 = v145.stateNode;
            if _G.__DEV__ and v145.type == v145.elementType and not v110 then
                if l_stateNode_0.props ~= v145.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "getSnapshotBeforeUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v145.type) or "instance");
                end;
                if l_stateNode_0.state ~= v145.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "getSnapshotBeforeUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v145.type) or "instance");
                end;
            end;
            local v149 = l_stateNode_0:getSnapshotBeforeUpdate(v145.elementType == v145.type and l_memoizedProps_0 or l_resolveDefaultProps_0(v145.type, l_memoizedProps_0), l_memoizedState_0);
            if _G.__DEV__ then

            end;
            l_stateNode_0.__reactInternalSnapshotBeforeUpdate = v149;
        end;
        return;
    elseif v145.tag == l_HostRoot_0 then
        if l_supportsMutation_0 and bit32.band(v145.flags, l_Snapshot_0) ~= 0 then
            local l_stateNode_1 = v145.stateNode;
            l_clearContainer_0(l_stateNode_1.containerInfo);
        end;
        return;
    elseif v145.tag == l_HostComponent_0 or v145.tag == l_HostText_0 or v145.tag == l_HostPortal_0 or v145.tag == l_IncompleteClassComponent_0 then
        return;
    else
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
        return;
    end;
end;
local function v162(v152, v153, v154) --[[ Line: 409 ]] --[[ Name: commitHookEffectListUnmount ]]
    -- upvalues: v104 (ref)
    local l_updateQueue_0 = v153.updateQueue;
    local v156 = nil;
    if l_updateQueue_0 ~= nil then
        v156 = l_updateQueue_0.lastEffect;
    end;
    if v156 ~= nil then
        local l_next_0 = v156.next;
        local l_l_next_0_0 = l_next_0;
        repeat
            if bit32.band(l_l_next_0_0.tag, v152) == v152 then
                local l_destroy_0 = l_l_next_0_0.destroy;
                l_l_next_0_0.destroy = nil;
                if l_destroy_0 ~= nil then
                    local l_status_4, l_result_4 = pcall(l_destroy_0);
                    if not l_status_4 then
                        v104(v153, v154, l_result_4);
                    end;
                end;
            end;
            l_l_next_0_0 = l_l_next_0_0.next;
        until l_l_next_0_0 == l_next_0;
    end;
end;
local function v171(v163, v164) --[[ Line: 437 ]] --[[ Name: commitHookEffectListMount ]]
    -- upvalues: l_console_0 (copy)
    local l_updateQueue_1 = v164.updateQueue;
    local v166 = nil;
    if l_updateQueue_1 ~= nil then
        v166 = l_updateQueue_1.lastEffect;
    end;
    if v166 ~= nil then
        local l_next_1 = v166.next;
        local l_l_next_1_0 = l_next_1;
        repeat
            if bit32.band(l_l_next_1_0.tag, v163) == v163 then
                l_l_next_1_0.destroy = l_l_next_1_0.create();
                if _G.__DEV__ then
                    local l_destroy_1 = l_l_next_1_0.destroy;
                    if l_destroy_1 ~= nil and typeof(l_destroy_1) ~= "function" then
                        local v170 = nil;
                        v170 = if l_destroy_1 == nil then " You returned nil. If your effect does not require clean " .. "up, return nil (or nothing)." else if typeof(l_destroy_1.andThen) == "function" then "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. " .. "Instead, write the async function inside your effect " .. "and call it immediately:\n\n" .. "useEffect(function()\n" .. "  function fetchData()\n" .. "    -- You can await here\n" .. "    local response = MyAPI.getData(someId):await()\n" .. "    -- ...\n" .. "  end\n" .. "  fetchData()\n" .. "end, {someId}) -- Or {} if effect doesn't need props or state\n\n" .. "Learn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" else " You returned: " .. l_destroy_1;
                        l_console_0.error("An effect function must not return anything besides a function, " .. "which is used for clean-up.%s", v170);
                    end;
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
        until l_l_next_1_0 == l_next_1;
    end;
end;
commitProfilerPassiveEffect = function(v172, v173) --[[ Line: 491 ]] --[[ Name: commitProfilerPassiveEffect ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_Profiler_0 (copy), l_getCommitTime_0 (copy), l_enableSchedulerTracing_0 (copy)
    if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and v173.tag == l_Profiler_0 then
        local l_passiveEffectDuration_0 = v173.stateNode.passiveEffectDuration;
        local l_id_0 = v173.memoizedProps.id;
        local l_onPostCommit_0 = v173.memoizedProps.onPostCommit;
        local v177 = l_getCommitTime_0();
        if typeof(l_onPostCommit_0) == "function" then
            if l_enableSchedulerTracing_0 then
                l_onPostCommit_0(l_id_0, v173.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v177, v172.memoizedInteractions);
                return;
            else
                l_onPostCommit_0(l_id_0, v173.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v177);
            end;
        end;
    end;
end;
local function v178(v179, v180, v181, v182) --[[ Line: 536 ]] --[[ Name: recursivelyCommitLayoutEffects ]]
    -- upvalues: v104 (ref), v100 (ref), l_Profiler_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), v121 (ref), l_LayoutMask_0 (copy), l_NoFlags_0 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), v178 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy), l_Update_0 (copy), l_Callback_0 (copy), v61 (copy), v2 (ref), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v171 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_PassiveMask_0 (copy), l_ClassComponent_0 (copy), v117 (ref), l_HostRoot_0 (copy), v115 (ref), l_HostComponent_0 (copy), v116 (ref), l_SuspenseComponent_0 (copy), l_FundamentalComponent_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), l_IncompleteClassComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), l_OffscreenComponent_0 (copy), l_ScopeComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_invariant_0 (copy), l_Ref_0 (copy)
    if v181 ~= nil then
        v104 = v181;
    end;
    if v182 ~= nil then
        v100 = v182;
    end;
    local l_flags_0 = v179.flags;
    local l_tag_0 = v179.tag;
    if l_tag_0 == l_Profiler_0 then
        local v185 = nil;
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 then
            v185 = v121;
            v121 = v179;
        end;
        local l_child_0 = v179.child;
        while l_child_0 ~= nil do
            if bit32.band(v179.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if _G.__DEV__ then
                    local l_l_current_0_0 = l_current_0;
                    l_setCurrentFiber_0(l_child_0);
                    l_invokeGuardedCallback_0(nil, v178, nil, l_child_0, v180, v104, v100);
                    if l_hasCaughtError_0() then
                        local v188 = l_clearCaughtError_0();
                        v104(l_child_0, v179, v188);
                    end;
                    if l_l_current_0_0 ~= nil then
                        l_setCurrentFiber_0(l_l_current_0_0);
                    else
                        l_resetCurrentFiber_0();
                    end;
                else
                    local l_status_5, l_result_5 = pcall(v178, l_child_0, v180, v104, v100);
                    if not l_status_5 then
                        v104(l_child_0, v179, l_result_5);
                    end;
                end;
            end;
            l_child_0 = l_child_0.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 and l_enableProfilerTimer_0 then
            if _G.__DEV__ then
                local l_l_current_0_1 = l_current_0;
                l_setCurrentFiber_0(v179);
                l_invokeGuardedCallback_0(nil, commitLayoutEffectsForProfiler, nil, v179, v180);
                if l_hasCaughtError_0() then
                    local v192 = l_clearCaughtError_0();
                    v104(v179, v179.return_, v192);
                end;
                if l_l_current_0_1 ~= nil then
                    l_setCurrentFiber_0(l_l_current_0_1);
                else
                    l_resetCurrentFiber_0();
                end;
            else
                local l_status_6, l_result_6 = pcall(commitLayoutEffectsForProfiler, v179, v180);
                if not l_status_6 then
                    v104(v179, v179.return_, l_result_6);
                end;
            end;
        end;
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 then
            if v185 ~= nil then
                local l_stateNode_2 = v185.stateNode;
                l_stateNode_2.effectDuration = l_stateNode_2.effectDuration + v179.stateNode.effectDuration;
            end;
            v121 = v185;
            return;
        end;
    else
        local l_child_1 = v179.child;
        while l_child_1 ~= nil do
            if bit32.band(v179.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if _G.__DEV__ then
                    local l_current_1 = v61.current;
                    l_setCurrentFiber_0(l_child_1);
                    if v2 < 20 then
                        v2 = v2 + 1;
                        l_invokeGuardedCallback_0(nil, v178, nil, l_child_1, v180, v104, v100);
                        v2 = v2 - 1;
                        if l_hasCaughtError_0() then
                            local v198 = l_clearCaughtError_0();
                            v104(l_child_1, v179, v198);
                        end;
                    else
                        v178(l_child_1, v180, v104, v100);
                    end;
                    if l_current_1 ~= nil then
                        l_setCurrentFiber_0(l_current_1);
                    else
                        l_resetCurrentFiber_0();
                    end;
                else
                    local v199 = nil;
                    local v200 = nil;
                    if not _G.__YOLO__ and v2 < 20 then
                        v2 = v2 + 1;
                        local l_status_7, l_result_7 = pcall(v178, l_child_1, v180, v104, v100);
                        v199 = l_status_7;
                        v200 = l_result_7;
                        v2 = v2 - 1;
                    else
                        v199 = true;
                        v178(l_child_1, v180, v104, v100);
                    end;
                    if not v199 then
                        v104(l_child_1, v179, v200);
                    end;
                end;
            end;
            l_child_1 = l_child_1.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 then
            if l_tag_0 == l_FunctionComponent_0 or l_tag_0 == l_ForwardRef_0 or l_tag_0 == l_SimpleMemoComponent_0 or l_tag_0 == l_Block_0 then
                if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v179.mode, l_ProfileMode_0) ~= 0 then
                    local l_status_8, l_result_8 = pcall(function() --[[ Line: 726 ]]
                        -- upvalues: l_startLayoutEffectTimer_0 (ref), v171 (ref), l_Layout_0 (ref), l_HasEffect_0 (ref), v179 (copy)
                        l_startLayoutEffectTimer_0();
                        v171(bit32.bor(l_Layout_0, l_HasEffect_0), v179);
                    end);
                    l_recordLayoutEffectDuration_0(v179);
                    if not l_status_8 then
                        error(l_result_8);
                    end;
                else
                    v171(bit32.bor(l_Layout_0, l_HasEffect_0), v179);
                end;
                if bit32.band(v179.subtreeFlags, l_PassiveMask_0) ~= l_NoFlags_0 then
                    v100();
                end;
            elseif l_tag_0 == l_ClassComponent_0 then
                v117(v179);
            elseif l_tag_0 == l_HostRoot_0 then
                v115(v179);
            elseif l_tag_0 == l_HostComponent_0 then
                v116(v179);
            elseif l_tag_0 == l_SuspenseComponent_0 then
                commitSuspenseHydrationCallbacks(v180, v179);
            elseif l_tag_0 ~= l_FundamentalComponent_0 and l_tag_0 ~= l_HostPortal_0 and l_tag_0 ~= l_HostText_0 and l_tag_0 ~= l_IncompleteClassComponent_0 and l_tag_0 ~= l_LegacyHiddenComponent_0 and l_tag_0 ~= l_OffscreenComponent_0 and l_tag_0 ~= l_ScopeComponent_0 and l_tag_0 ~= l_SuspenseListComponent_0 then
                l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
            end;
        end;
        if bit32.band(l_flags_0, l_Ref_0) ~= 0 then
            commitAttachRef(v179);
        end;
    end;
end;
commitLayoutEffectsForProfiler = function(v205, v206) --[[ Line: 791 ]] --[[ Name: commitLayoutEffectsForProfiler ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_getCommitTime_0 (copy), l_Update_0 (copy), l_Callback_0 (copy), l_NoFlags_0 (copy), l_enableSchedulerTracing_0 (copy), l_enableProfilerCommitHooks_0 (copy)
    local v207 = false;
    local v208 = false;
    if l_enableProfilerTimer_0 then
        local l_flags_1 = v205.flags;
        local l_alternate_0 = v205.alternate;
        local l_onCommit_0 = v205.memoizedProps.onCommit;
        local l_onRender_0 = v205.memoizedProps.onRender;
        local l_effectDuration_0 = v205.stateNode.effectDuration;
        local v214 = l_getCommitTime_0();
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Callback_0_0 = l_Callback_0;
        if bit32.band(l_flags_1, l_l_Update_0_0) ~= l_NoFlags_0 then
            local v217;
            if typeof(l_onRender_0) == "function" then
                v217 = true;
            else
                if typeof(l_onRender_0) == "table" then
                    local v218 = getmetatable(l_onRender_0);
                    if v218 and rawget(v218, "__call") then
                        v217 = true;
                        v207 = true;
                    elseif l_onRender_0._isMockFunction then
                        v217 = true;
                        v207 = true;
                    end;
                end;
                if not v207 then
                    if not v207 then
                        v217 = false;
                    end;
                end;
            end;
            v207 = false;
            if v217 then
                if l_enableSchedulerTracing_0 then
                    l_onRender_0(v205.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v205.actualDuration, v205.treeBaseDuration, v205.actualStartTime, v214, v206.memoizedInteractions);
                else
                    l_onRender_0(v205.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v205.actualDuration, v205.treeBaseDuration, v205.actualStartTime, v214);
                end;
            end;
        end;
        if l_enableProfilerCommitHooks_0 and bit32.band(l_flags_1, l_l_Callback_0_0) ~= l_NoFlags_0 then
            local v219;
            if typeof(l_onCommit_0) == "function" then
                v219 = true;
            else
                if typeof(l_onCommit_0) == "table" then
                    local v220 = getmetatable(l_onCommit_0);
                    if v220 and rawget(v220, "__call") then
                        v219 = true;
                        v208 = true;
                    elseif l_onCommit_0._isMockFunction then
                        v219 = true;
                        v208 = true;
                    end;
                end;
                if not v208 then
                    if not v208 then
                        v219 = false;
                    end;
                end;
            end;
            v208 = false;
            if v219 then
                if l_enableSchedulerTracing_0 then
                    l_onCommit_0(v205.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v214, v206.memoizedInteractions);
                    return;
                else
                    l_onCommit_0(v205.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v214);
                end;
            end;
        end;
    end;
end;
v117 = function(v221) --[[ Line: 880 ]] --[[ Name: commitLayoutEffectsForClassComponent ]]
    -- upvalues: l_Update_0 (copy), v110 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_resolveDefaultProps_0 (copy), l_commitUpdateQueue_0 (copy)
    local l_stateNode_3 = v221.stateNode;
    local l_alternate_1 = v221.alternate;
    if bit32.band(v221.flags, l_Update_0) ~= 0 then
        if l_alternate_1 == nil then
            if _G.__DEV__ and v221.type == v221.elementType and not v110 then
                if l_stateNode_3.props ~= v221.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "componentDidMount. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v221.type) or "instance");
                end;
                if l_stateNode_3.state ~= v221.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "componentDidMount. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v221.type) or "instance");
                end;
            end;
            if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v221.mode, l_ProfileMode_0) ~= 0 then
                local l_status_9, l_result_9 = pcall(function() --[[ Line: 920 ]]
                    -- upvalues: l_startLayoutEffectTimer_0 (ref), l_stateNode_3 (copy)
                    l_startLayoutEffectTimer_0();
                    l_stateNode_3:componentDidMount();
                end);
                l_recordLayoutEffectDuration_0(v221);
                if not l_status_9 then
                    error(l_result_9);
                end;
            else
                l_stateNode_3:componentDidMount();
            end;
        else
            local v226 = v221.elementType == v221.type and l_alternate_1.memoizedProps or l_resolveDefaultProps_0(v221.type, l_alternate_1.memoizedProps);
            local l_memoizedState_1 = l_alternate_1.memoizedState;
            if _G.__DEV__ and v221.type == v221.elementType and not v110 then
                if l_stateNode_3.props ~= v221.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "componentDidUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v221.type) or "instance");
                end;
                if l_stateNode_3.state ~= v221.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "componentDidUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v221.type) or "instance");
                end;
            end;
            if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v221.mode, l_ProfileMode_0) ~= 0 then
                local l_v226_0 = v226 --[[ copy: 3 -> 7 ]];
                local l_status_10, l_result_10 = pcall(function() --[[ Line: 975 ]]
                    -- upvalues: l_startLayoutEffectTimer_0 (ref), l_stateNode_3 (copy), l_v226_0 (copy), l_memoizedState_1 (copy)
                    l_startLayoutEffectTimer_0();
                    l_stateNode_3:componentDidUpdate(l_v226_0, l_memoizedState_1, l_stateNode_3.__reactInternalSnapshotBeforeUpdate);
                end);
                l_recordLayoutEffectDuration_0(v221);
                if not l_status_10 then
                    error(l_result_10);
                end;
            else
                l_stateNode_3:componentDidUpdate(v226, l_memoizedState_1, l_stateNode_3.__reactInternalSnapshotBeforeUpdate);
            end;
        end;
    end;
    local l_updateQueue_2 = v221.updateQueue;
    if l_updateQueue_2 ~= nil then
        if _G.__DEV__ and v221.type == v221.elementType and not v110 then
            if l_stateNode_3.props ~= v221.memoizedProps then
                l_console_0.error("Expected %s props to match memoized props before " .. "processing the update queue. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v221.type) or "instance");
            end;
            if l_stateNode_3.state ~= v221.memoizedState then
                l_console_0.error("Expected %s state to match memoized state before " .. "processing the update queue. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v221.type) or "instance");
            end;
        end;
        l_commitUpdateQueue_0(v221, l_updateQueue_2, l_stateNode_3);
    end;
end;
v115 = function(v232) --[[ Line: 1038 ]] --[[ Name: commitLayoutEffectsForHostRoot ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy), l_ClassComponent_0 (copy), l_commitUpdateQueue_0 (copy)
    local l_updateQueue_3 = v232.updateQueue;
    if l_updateQueue_3 ~= nil then
        local v234 = nil;
        if v232.child ~= nil then
            local l_child_2 = v232.child;
            if l_child_2.tag == l_HostComponent_0 then
                v234 = l_getPublicInstance_0(l_child_2.stateNode);
            elseif l_child_2.tag == l_ClassComponent_0 then
                v234 = l_child_2.stateNode;
            end;
        end;
        l_commitUpdateQueue_0(v232, l_updateQueue_3, v234);
    end;
end;
v116 = function(v236) --[[ Line: 1057 ]] --[[ Name: commitLayoutEffectsForHostComponent ]]
    -- upvalues: l_Update_0 (copy), l_commitMount_0 (copy)
    local l_stateNode_4 = v236.stateNode;
    if v236.alternate == nil and bit32.band(v236.flags, l_Update_0) ~= 0 then
        local l_type_0 = v236.type;
        local l_memoizedProps_1 = v236.memoizedProps;
        l_commitMount_0(l_stateNode_4, l_type_0, l_memoizedProps_1, v236);
    end;
end;
local function v245(v240, v241) --[[ Line: 1072 ]] --[[ Name: hideOrUnhideAllChildren ]]
    -- upvalues: l_supportsMutation_0 (copy), l_HostComponent_0 (copy), l_hideInstance_0 (copy), l_unhideInstance_0 (copy), l_HostText_0 (copy), l_hideTextInstance_0 (copy), l_unhideTextInstance_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy)
    if l_supportsMutation_0 then
        local l_v240_0 = v240;
        while true do
            if l_v240_0.tag == l_HostComponent_0 then
                local l_stateNode_5 = l_v240_0.stateNode;
                if v241 then
                    l_hideInstance_0(l_stateNode_5);
                else
                    l_unhideInstance_0(l_v240_0.stateNode, l_v240_0.memoizedProps);
                end;
            elseif l_v240_0.tag == l_HostText_0 then
                local l_stateNode_6 = l_v240_0.stateNode;
                if v241 then
                    l_hideTextInstance_0(l_stateNode_6);
                else
                    l_unhideTextInstance_0(l_stateNode_6, l_v240_0.memoizedProps);
                end;
            elseif (l_v240_0.tag ~= l_OffscreenComponent_0 and l_v240_0.tag ~= l_LegacyHiddenComponent_0 or l_v240_0.memoizedState == nil or l_v240_0 == v240) and l_v240_0.child ~= nil then
                l_v240_0.child.return_ = l_v240_0;
                l_v240_0 = l_v240_0.child;
                continue;
            end;
            if l_v240_0 == v240 then
                return;
            else
                while true do
                    if l_v240_0.sibling == nil then
                        if l_v240_0.return_ == nil or l_v240_0.return_ == v240 then
                            return;
                        else
                            l_v240_0 = l_v240_0.return_;
                        end;
                    else
                        l_v240_0.sibling.return_ = l_v240_0.return_;
                        l_v240_0 = l_v240_0.sibling;
                        break;
                    end;
                end;
            end;
        end;
    else
        return;
    end;
end;
commitAttachRef = function(v246) --[[ Line: 1123 ]] --[[ Name: commitAttachRef ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    local l_ref_1 = v246.ref;
    if l_ref_1 ~= nil then
        local l_stateNode_7 = v246.stateNode;
        local v249 = nil;
        v249 = if v246.tag == l_HostComponent_0 then l_getPublicInstance_0(l_stateNode_7) else l_stateNode_7;
        if typeof(l_ref_1) == "function" then
            l_ref_1(v249);
            return;
        elseif _G.__DEV__ and typeof(l_ref_1) ~= "table" then
            l_console_0.error("Unexpected ref object provided for %s. " .. "Use either a ref-setter function or React.createRef().", l_getComponentName_0(v246.type) or "instance");
            return;
        else
            l_ref_1.current = v249;
        end;
    end;
end;
commitDetachRef = function(v250) --[[ Line: 1162 ]] --[[ Name: commitDetachRef ]]
    local l_ref_2 = v250.ref;
    if l_ref_2 ~= nil then
        if typeof(l_ref_2) == "function" then
            l_ref_2(nil);
            return;
        else
            l_ref_2.current = nil;
        end;
    end;
end;
v120 = function(v252, v253, v254, v255) --[[ Line: 1176 ]] --[[ Name: commitUnmount ]]
    -- upvalues: l_onCommitUnmount_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_Layout_0 (copy), l_NoFlags_1 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v104 (ref), l_recordLayoutEffectDuration_0 (copy), l_ClassComponent_0 (copy), l_HostComponent_0 (copy), l_HostPortal_0 (copy), l_supportsMutation_0 (copy), v118 (ref), l_supportsPersistence_0 (copy), v1 (copy)
    l_onCommitUnmount_0(v253);
    if v253.tag == l_FunctionComponent_0 or v253.tag == l_ForwardRef_0 or v253.tag == l_MemoComponent_0 or v253.tag == l_SimpleMemoComponent_0 or v253.tag == l_Block_0 then
        local l_updateQueue_4 = v253.updateQueue;
        if l_updateQueue_4 ~= nil then
            local l_lastEffect_0 = l_updateQueue_4.lastEffect;
            if l_lastEffect_0 ~= nil then
                local l_next_2 = l_lastEffect_0.next;
                local l_l_next_2_0 = l_next_2;
                repeat
                    if l_l_next_2_0.destroy ~= nil and bit32.band(l_l_next_2_0.tag, l_Layout_0) ~= l_NoFlags_1 then
                        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v253.mode, l_ProfileMode_0) ~= 0 then
                            l_startLayoutEffectTimer_0();
                            local l_destroy_2 = l_l_next_2_0.destroy;
                            local l_status_11, l_result_11 = pcall(l_destroy_2);
                            if not l_status_11 then
                                v104(v253, v254, l_result_11);
                            end;
                            l_recordLayoutEffectDuration_0(v253);
                        else
                            local l_destroy_3 = l_l_next_2_0.destroy;
                            local l_status_12, l_result_12 = pcall(l_destroy_3);
                            if not l_status_12 then
                                v104(v253, v254, l_result_12);
                            end;
                        end;
                    end;
                    l_l_next_2_0 = l_l_next_2_0.next;
                until l_l_next_2_0 == l_next_2;
            end;
        end;
        return;
    elseif v253.tag == l_ClassComponent_0 then
        local l_ref_3 = v253.ref;
        if l_ref_3 ~= nil then
            if typeof(l_ref_3) == "function" then
                local l_status_13, l_result_13 = pcall(l_ref_3, nil);
                if not l_status_13 then
                    v104(v253, v254, l_result_13);
                end;
            else
                l_ref_3.current = nil;
            end;
        end;
        l_ref_3 = v253.stateNode;
        if typeof(l_ref_3.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v253, l_ref_3, v254);
        end;
        return;
    elseif v253.tag == l_HostComponent_0 then
        local l_ref_4 = v253.ref;
        if l_ref_4 ~= nil then
            if typeof(l_ref_4) == "function" then
                local l_status_14, l_result_14 = pcall(l_ref_4, nil);
                if not l_status_14 then
                    v104(v253, v254, l_result_14);
                    return;
                end;
            else
                l_ref_4.current = nil;
            end;
        end;
        return;
    elseif v253.tag == l_HostPortal_0 then
        if l_supportsMutation_0 then
            v118(v252, v253, v254, v255);
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
v119 = function(v272, v273, v274, v275) --[[ Line: 1279 ]] --[[ Name: commitNestedUnmounts ]]
    -- upvalues: v120 (ref), l_supportsMutation_0 (copy), l_HostPortal_0 (copy)
    local l_v273_0 = v273;
    while true do
        v120(v272, l_v273_0, v274, v275);
        if l_v273_0.child ~= nil and (not l_supportsMutation_0 or l_v273_0.tag ~= l_HostPortal_0) then
            l_v273_0.child.return_ = l_v273_0;
            l_v273_0 = l_v273_0.child;
            continue;
        end;
        if l_v273_0 == v273 then
            return;
        else
            while true do
                if l_v273_0.sibling == nil then
                    if l_v273_0.return_ == nil or l_v273_0.return_ == v273 then
                        return;
                    else
                        l_v273_0 = l_v273_0.return_;
                    end;
                else
                    l_v273_0.sibling.return_ = l_v273_0.return_;
                    l_v273_0 = l_v273_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function _(v277) --[[ Line: 1324 ]] --[[ Name: detachFiberMutation ]]
    local l_alternate_2 = v277.alternate;
    if l_alternate_2 ~= nil then
        l_alternate_2.return_ = nil;
        v277.alternate = nil;
    end;
    v277.return_ = nil;
end;
local function _(v280) --[[ Line: 1391 ]] --[[ Name: getHostParentFiber ]]
    -- upvalues: v111 (ref), l_invariant_0 (copy)
    local l_return__0 = v280.return_;
    while true do
        if l_return__0 ~= nil then
            if v111(l_return__0) then
                return l_return__0;
            else
                l_return__0 = l_return__0.return_;
            end;
        else
            l_invariant_0(false, "Expected to find a host parent. This error is likely caused by a bug " .. "in React. Please file an issue.");
            return l_return__0;
        end;
    end;
end;
v111 = function(v283) --[[ Line: 1409 ]] --[[ Name: isHostParent ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy)
    local v284 = true;
    if v283.tag ~= l_HostComponent_0 then
        v284 = true;
        if v283.tag ~= l_HostRoot_0 then
            v284 = v283.tag == l_HostPortal_0;
        end;
    end;
    return v284;
end;
v112 = function(v285) --[[ Line: 1416 ]] --[[ Name: getHostSibling ]]
    -- upvalues: v111 (ref), l_HostComponent_0 (copy), l_HostText_0 (copy), l_DehydratedFragment_0 (copy), l_Placement_0 (copy), l_HostPortal_0 (copy)
    local l_v285_0 = v285;
    while true do
        local v287 = false;
        while true do
            if l_v285_0.sibling == nil then
                if l_v285_0.return_ == nil or v111(l_v285_0.return_) then
                    return nil;
                else
                    l_v285_0 = l_v285_0.return_;
                end;
            else
                l_v285_0.sibling.return_ = l_v285_0.return_;
                l_v285_0 = l_v285_0.sibling;
                while l_v285_0.tag ~= l_HostComponent_0 and l_v285_0.tag ~= l_HostText_0 and l_v285_0.tag ~= l_DehydratedFragment_0 do
                    if bit32.band(l_v285_0.flags, l_Placement_0) ~= 0 then
                        v287 = true;
                        break;
                    elseif l_v285_0.child == nil or l_v285_0.tag == l_HostPortal_0 then
                        v287 = true;
                        break;
                    else
                        l_v285_0.child.return_ = l_v285_0;
                        l_v285_0 = l_v285_0.child;
                    end;
                end;
                if not v287 and bit32.band(l_v285_0.flags, l_Placement_0) == 0 then
                    return l_v285_0.stateNode;
                else
                    break;
                end;
            end;
        end;
    end;
end;
local function v294(v288) --[[ Line: 1470 ]] --[[ Name: commitPlacement ]]
    -- upvalues: l_supportsMutation_0 (copy), v111 (ref), l_invariant_0 (copy), l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy), l_ContentReset_0 (copy), l_resetTextContent_0 (copy), v112 (ref), v114 (ref), v113 (ref)
    if not l_supportsMutation_0 then
        return;
    else
        local l_return__1 = v288.return_;
        local v290;
        while true do
            if l_return__1 ~= nil then
                if v111(l_return__1) then
                    v290 = l_return__1;
                    break;
                else
                    l_return__1 = l_return__1.return_;
                end;
            else
                l_invariant_0(false, "Expected to find a host parent. This error is likely caused by a bug " .. "in React. Please file an issue.");
                v290 = l_return__1;
                break;
            end;
        end;
        l_return__1 = nil;
        local v291 = nil;
        local l_stateNode_8 = v290.stateNode;
        if v290.tag == l_HostComponent_0 then
            l_return__1 = l_stateNode_8;
            v291 = false;
        elseif v290.tag == l_HostRoot_0 then
            l_return__1 = l_stateNode_8.containerInfo;
            v291 = true;
        elseif v290.tag == l_HostPortal_0 then
            l_return__1 = l_stateNode_8.containerInfo;
            v291 = true;
        else
            l_invariant_0(false, "Invalid host parent fiber. This error is likely caused by a bug " .. "in React. Please file an issue.");
        end;
        if bit32.band(v290.flags, l_ContentReset_0) ~= 0 then
            l_resetTextContent_0(l_return__1);
            v290.flags = bit32.band(v290.flags, (bit32.bnot(l_ContentReset_0)));
        end;
        local v293 = v112(v288);
        if v291 then
            v114(v288, v293, l_return__1);
            return;
        else
            v113(v288, v293, l_return__1);
            return;
        end;
    end;
end;
v114 = function(v295, v296, v297) --[[ Line: 1521 ]] --[[ Name: insertOrAppendPlacementNodeIntoContainer ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_insertInContainerBefore_0 (copy), l_appendChildToContainer_0 (copy), l_HostPortal_0 (copy), v114 (ref)
    local l_tag_1 = v295.tag;
    local v299 = true;
    if l_tag_1 ~= l_HostComponent_0 then
        v299 = l_tag_1 == l_HostText_0;
    end;
    if v299 then
        local l_stateNode_9 = v295.stateNode;
        if v296 then
            l_insertInContainerBefore_0(v297, l_stateNode_9, v296);
            return;
        else
            l_appendChildToContainer_0(v297, l_stateNode_9);
            return;
        end;
    elseif l_tag_1 == l_HostPortal_0 then
        return;
    else
        local l_child_3 = v295.child;
        if l_child_3 ~= nil then
            v114(l_child_3, v296, v297);
            local l_sibling_0 = l_child_3.sibling;
            while l_sibling_0 ~= nil do
                v114(l_sibling_0, v296, v297);
                l_sibling_0 = l_sibling_0.sibling;
            end;
        end;
        return;
    end;
end;
v113 = function(v303, v304, v305) --[[ Line: 1553 ]] --[[ Name: insertOrAppendPlacementNode ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_insertBefore_0 (copy), l_appendChild_0 (copy), l_HostPortal_0 (copy), v113 (ref)
    local l_tag_2 = v303.tag;
    local v307 = true;
    if l_tag_2 ~= l_HostComponent_0 then
        v307 = l_tag_2 == l_HostText_0;
    end;
    if v307 then
        local l_stateNode_10 = v303.stateNode;
        if v304 then
            l_insertBefore_0(v305, l_stateNode_10, v304);
            return;
        else
            l_appendChild_0(v305, l_stateNode_10);
            return;
        end;
    elseif l_tag_2 == l_HostPortal_0 then
        return;
    else
        local l_child_4 = v303.child;
        if l_child_4 ~= nil then
            v113(l_child_4, v304, v305);
            local l_sibling_1 = l_child_4.sibling;
            while l_sibling_1 ~= nil do
                v113(l_sibling_1, v304, v305);
                l_sibling_1 = l_sibling_1.sibling;
            end;
        end;
        return;
    end;
end;
v118 = function(v311, v312, v313, v314) --[[ Line: 1585 ]] --[[ Name: unmountHostComponents ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), v119 (ref), l_removeChildFromContainer_0 (copy), l_removeChild_0 (copy), v120 (ref)
    local l_v312_0 = v312;
    local v316 = false;
    local v317 = nil;
    local v318 = nil;
    while true do
        if not v316 then
            local l_return__2 = l_v312_0.return_;
            while true do
                local l_stateNode_11 = l_return__2.stateNode;
                if l_return__2.tag == l_HostComponent_0 then
                    v317 = l_stateNode_11;
                    v318 = false;
                    break;
                elseif l_return__2.tag == l_HostRoot_0 then
                    v317 = l_stateNode_11.containerInfo;
                    v318 = true;
                    break;
                elseif l_return__2.tag == l_HostPortal_0 then
                    v317 = l_stateNode_11.containerInfo;
                    v318 = true;
                    break;
                else
                    l_return__2 = l_return__2.return_;
                end;
            end;
            v316 = true;
        end;
        if l_v312_0.tag == l_HostComponent_0 or l_v312_0.tag == l_HostText_0 then
            v119(v311, l_v312_0, v313, v314);
            if v318 then
                l_removeChildFromContainer_0(v317, l_v312_0.stateNode);
            else
                l_removeChild_0(v317, l_v312_0.stateNode);
            end;
        elseif l_v312_0.tag == l_HostPortal_0 then
            if l_v312_0.child ~= nil then
                v317 = l_v312_0.stateNode.containerInfo;
                v318 = true;
                l_v312_0.child.return_ = l_v312_0;
                l_v312_0 = l_v312_0.child;
                continue;
            end;
        else
            v120(v311, l_v312_0, v313, v314);
            if l_v312_0.child ~= nil then
                l_v312_0.child.return_ = l_v312_0;
                l_v312_0 = l_v312_0.child;
                continue;
            end;
        end;
        if l_v312_0 == v312 then
            return;
        else
            while true do
                if l_v312_0.sibling == nil then
                    if l_v312_0.return_ == nil or l_v312_0.return_ == v312 then
                        return;
                    else
                        l_v312_0 = l_v312_0.return_;
                        if l_v312_0.tag == l_HostPortal_0 then
                            v316 = false;
                        end;
                    end;
                else
                    l_v312_0.sibling.return_ = l_v312_0.return_;
                    l_v312_0 = l_v312_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function v327(v321, v322, v323, v324) --[[ Line: 1762 ]] --[[ Name: commitDeletion ]]
    -- upvalues: v118 (ref)
    v118(v321, v322, v323, v324);
    local l_alternate_3 = v322.alternate;
    local l_alternate_4 = v322.alternate;
    if l_alternate_4 ~= nil then
        l_alternate_4.return_ = nil;
        v322.alternate = nil;
    end;
    v322.return_ = nil;
    if l_alternate_3 ~= nil then
        l_alternate_4 = l_alternate_3.alternate;
        if l_alternate_4 ~= nil then
            l_alternate_4.return_ = nil;
            l_alternate_3.alternate = nil;
        end;
        l_alternate_3.return_ = nil;
    end;
end;
local function v342(v328, v329) --[[ Line: 1794 ]] --[[ Name: commitWork ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v162 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_ClassComponent_0 (copy), l_HostComponent_0 (copy), l_commitUpdate_0 (copy), l_HostText_0 (copy), l_invariant_0 (copy), l_commitTextUpdate_0 (copy), l_HostRoot_0 (copy), l_supportsHydration_0 (copy), v1 (copy), l_Profiler_0 (copy), l_SuspenseComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_IncompleteClassComponent_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), v245 (copy)
    if v329.tag == l_FunctionComponent_0 or v329.tag == l_ForwardRef_0 or v329.tag == l_MemoComponent_0 or v329.tag == l_SimpleMemoComponent_0 or v329.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v329.mode, l_ProfileMode_0) ~= 0 then
            local l_status_15, l_result_15 = pcall(function() --[[ Line: 1883 ]]
                -- upvalues: l_startLayoutEffectTimer_0 (ref), v162 (ref), l_Layout_0 (ref), l_HasEffect_0 (ref), v329 (copy)
                l_startLayoutEffectTimer_0();
                v162(bit32.bor(l_Layout_0, l_HasEffect_0), v329, v329.return_);
            end);
            l_recordLayoutEffectDuration_0(v329);
            if not l_status_15 then
                error(l_result_15);
                return;
            end;
        else
            v162(bit32.bor(l_Layout_0, l_HasEffect_0), v329, v329.return_);
        end;
        return;
    elseif v329.tag == l_ClassComponent_0 then
        return;
    elseif v329.tag == l_HostComponent_0 then
        local l_stateNode_12 = v329.stateNode;
        if l_stateNode_12 ~= nil then
            local l_memoizedProps_2 = v329.memoizedProps;
            local v334 = nil;
            v334 = if v328 then v328.memoizedProps else l_memoizedProps_2;
            local l_type_1 = v329.type;
            local l_updateQueue_5 = v329.updateQueue;
            v329.updateQueue = nil;
            if l_updateQueue_5 ~= nil then
                l_commitUpdate_0(l_stateNode_12, l_updateQueue_5, l_type_1, v334, l_memoizedProps_2, v329);
            end;
        end;
        return;
    elseif v329.tag == l_HostText_0 then
        l_invariant_0(v329.stateNode ~= nil, "This should have a text node initialized. This error is likely " .. "caused by a bug in React. Please file an issue.");
        local l_stateNode_13 = v329.stateNode;
        local l_memoizedProps_3 = v329.memoizedProps;
        local v339 = nil;
        if v328 ~= nil then
            v339 = v328.memoizedProps;
            v339 = l_memoizedProps_3;
        end;
        l_commitTextUpdate_0(l_stateNode_13, v339, l_memoizedProps_3);
        return;
    elseif v329.tag == l_HostRoot_0 then
        if l_supportsHydration_0 then
            local l_stateNode_14 = v329.stateNode;
            if l_stateNode_14.hydrate then
                l_stateNode_14.hydrate = false;
                v1("commitWork: HostRoot: commitHydratedContainer");
            end;
        end;
        return;
    elseif v329.tag == l_Profiler_0 then
        return;
    elseif v329.tag == l_SuspenseComponent_0 then
        commitSuspenseComponent(v329);
        attachSuspenseRetryListeners(v329);
        return;
    else
        if v329.tag == l_SuspenseListComponent_0 then
            v1("commitWork: SuspenseListComponent");
        elseif v329.tag == l_IncompleteClassComponent_0 then
            return;
        elseif v329.tag == l_OffscreenComponent_0 or v329.tag == l_LegacyHiddenComponent_0 then
            local v341 = v329.memoizedState ~= nil;
            v245(v329, v341);
            return;
        end;
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
        return;
    end;
end;
commitSuspenseComponent = function(v343) --[[ Line: 2011 ]] --[[ Name: commitSuspenseComponent ]]
    -- upvalues: v95 (ref), l_supportsMutation_0 (copy), v245 (copy), l_enableSuspenseCallback_0 (copy), l_Object_0 (copy), l_console_0 (copy)
    local l_memoizedState_2 = v343.memoizedState;
    if l_memoizedState_2 ~= nil then
        if not v95 then
            v95 = require(script.Parent["ReactFiberWorkLoop.new"]);
        end;
        v95.markCommitTimeOfFallback();
        if l_supportsMutation_0 then
            local l_child_5 = v343.child;
            v245(l_child_5, true);
        end;
    end;
    if l_enableSuspenseCallback_0 and l_memoizedState_2 ~= nil then
        local l_suspenseCallback_0 = v343.memoizedProps.suspenseCallback;
        if typeof(l_suspenseCallback_0) == "function" then
            local l_updateQueue_6 = v343.updateQueue;
            if l_updateQueue_6 ~= nil then
                l_suspenseCallback_0(l_Object_0.assign({}, l_updateQueue_6));
                return;
            end;
        elseif _G.__DEV__ and l_suspenseCallback_0 ~= nil then
            l_console_0.error("Unexpected type for suspenseCallback: %s", (tostring(l_suspenseCallback_0)));
        end;
    end;
end;
commitSuspenseHydrationCallbacks = function(v348, v349) --[[ Line: 2047 ]] --[[ Name: commitSuspenseHydrationCallbacks ]]
    -- upvalues: l_supportsHydration_0 (copy), l_commitHydratedSuspenseInstance_0 (copy), l_enableSuspenseCallback_0 (copy)
    if not l_supportsHydration_0 then
        return;
    else
        if v349.memoizedState == nil then
            local l_alternate_5 = v349.alternate;
            if l_alternate_5 ~= nil then
                local l_memoizedState_3 = l_alternate_5.memoizedState;
                if l_memoizedState_3 ~= nil then
                    local l_dehydrated_0 = l_memoizedState_3.dehydrated;
                    if l_dehydrated_0 ~= nil then
                        l_commitHydratedSuspenseInstance_0(l_dehydrated_0);
                        if l_enableSuspenseCallback_0 then
                            local l_hydrationCallbacks_0 = v348.hydrationCallbacks;
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
attachSuspenseRetryListeners = function(v355) --[[ Line: 2079 ]] --[[ Name: attachSuspenseRetryListeners ]]
    -- upvalues: l_Set_0 (copy), v98 (copy), l_enableSchedulerTracing_0 (copy), l_unstable_wrap_0 (copy)
    local l_updateQueue_7 = v355.updateQueue;
    if l_updateQueue_7 ~= nil then
        v355.updateQueue = nil;
        local l_stateNode_15 = v355.stateNode;
        if l_stateNode_15 == nil then
            v355.stateNode = l_Set_0.new();
            l_stateNode_15 = v355.stateNode;
        end;
        for v358, _ in pairs(l_updateQueue_7) do
            local function v360() --[[ Line: 2093 ]]
                -- upvalues: v98 (ref), v355 (copy), v358 (copy)
                return v98(v355, v358);
            end;
            do
                local l_v360_0 = v360;
                if not l_stateNode_15:has(v358) then
                    if l_enableSchedulerTracing_0 and v358.__reactDoNotTraceInteractions ~= true then
                        l_v360_0 = l_unstable_wrap_0(l_v360_0);
                    end;
                    l_stateNode_15:add(v358);
                    v358:andThen(function() --[[ Line: 2105 ]]
                        -- upvalues: l_v360_0 (ref)
                        return l_v360_0();
                    end, function() --[[ Line: 2108 ]]
                        -- upvalues: l_v360_0 (ref)
                        return l_v360_0();
                    end);
                end;
            end;
        end;
    end;
end;
isSuspenseBoundaryBeingHidden = function(v362, v363) --[[ Line: 2120 ]] --[[ Name: isSuspenseBoundaryBeingHidden ]]
    if v362 ~= nil then
        local l_memoizedState_4 = v362.memoizedState;
        if l_memoizedState_4 == nil or l_memoizedState_4.dehydrated ~= nil then
            local l_memoizedState_5 = v363.memoizedState;
            local v366 = false;
            if l_memoizedState_5 ~= nil then
                v366 = l_memoizedState_5.dehydrated == nil;
            end;
            return v366;
        end;
    end;
    return false;
end;
commitResetTextContent = function(v367) --[[ Line: 2135 ]] --[[ Name: commitResetTextContent ]]
    -- upvalues: l_supportsMutation_0 (copy), l_resetTextContent_0 (copy)
    if not l_supportsMutation_0 then
        return;
    else
        l_resetTextContent_0(v367.stateNode);
        return;
    end;
end;
local function v369(v368) --[[ Line: 2142 ]] --[[ Name: commitPassiveUnmount ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v162 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_recordPassiveEffectDuration_0 (copy)
    if v368.tag == l_FunctionComponent_0 or v368.tag == l_ForwardRef_0 or v368.tag == l_SimpleMemoComponent_0 or v368.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v368.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v162(bit32.bor(l_Passive_0, l_HasEffect_0), v368, v368.return_);
            l_recordPassiveEffectDuration_0(v368);
            return;
        else
            v162(bit32.bor(l_Passive_0, l_HasEffect_0), v368, v368.return_);
        end;
    end;
end;
local function v372(v370, v371) --[[ Line: 2171 ]] --[[ Name: commitPassiveUnmountInsideDeletedTree ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v162 (copy), l_Passive_0 (copy), l_recordPassiveEffectDuration_0 (copy)
    if v370.tag == l_FunctionComponent_0 or v370.tag == l_ForwardRef_0 or v370.tag == l_SimpleMemoComponent_0 or v370.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v370.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v162(l_Passive_0, v370, v371);
            l_recordPassiveEffectDuration_0(v370);
            return;
        else
            v162(l_Passive_0, v370, v371);
        end;
    end;
end;
local function v377(v373, v374) --[[ Line: 2203 ]] --[[ Name: commitPassiveMount ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v171 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_recordPassiveEffectDuration_0 (copy), l_Profiler_0 (copy)
    if v374.tag == l_FunctionComponent_0 or v374.tag == l_ForwardRef_0 or v374.tag == l_SimpleMemoComponent_0 or v374.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v374.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            local l_status_16, l_result_16 = pcall(v171, bit32.bor(l_Passive_0, l_HasEffect_0), v374);
            l_recordPassiveEffectDuration_0(v374);
            if not l_status_16 then
                error(l_result_16);
                return;
            end;
        else
            v171(bit32.bor(l_Passive_0, l_HasEffect_0), v374);
            return;
        end;
    elseif v374.tag == l_Profiler_0 then
        commitProfilerPassiveEffect(v373, v374);
    end;
end;
invokeLayoutEffectMountInDEV = function(v378) --[[ Line: 2234 ]] --[[ Name: invokeLayoutEffectMountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v171 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v104 (ref), l_ClassComponent_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        if v378.tag == l_FunctionComponent_0 or v378.tag == l_ForwardRef_0 or v378.tag == l_SimpleMemoComponent_0 or v378.tag == l_Block_0 then
            l_invokeGuardedCallback_0(nil, v171, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v378);
            if l_hasCaughtError_0() then
                local v379 = l_clearCaughtError_0();
                v104(v378, v378.return_, v379);
            end;
            return;
        end;
    elseif v378.tag == l_ClassComponent_0 then
        local l_stateNode_16 = v378.stateNode;
        l_invokeGuardedCallback_0(nil, l_stateNode_16.componentDidMount, l_stateNode_16);
        if l_hasCaughtError_0() then
            local v381 = l_clearCaughtError_0();
            v104(v378, v378.return_, v381);
        end;
        return;
    end;
end;
invokePassiveEffectMountInDEV = function(v382) --[[ Line: 2265 ]] --[[ Name: invokePassiveEffectMountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v171 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v104 (ref)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 and (v382.tag == l_FunctionComponent_0 or v382.tag == l_ForwardRef_0 or v382.tag == l_SimpleMemoComponent_0 or v382.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v171, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v382);
        if l_hasCaughtError_0() then
            local v383 = l_clearCaughtError_0();
            v104(v382, v382.return_, v383);
        end;
        return;
    else
        return;
    end;
end;
invokeLayoutEffectUnmountInDEV = function(v384) --[[ Line: 2288 ]] --[[ Name: invokeLayoutEffectUnmountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v162 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v104 (ref), l_ClassComponent_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        if v384.tag == l_FunctionComponent_0 or v384.tag == l_ForwardRef_0 or v384.tag == l_SimpleMemoComponent_0 or v384.tag == l_Block_0 then
            l_invokeGuardedCallback_0(nil, v162, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v384, v384.return_);
            if l_hasCaughtError_0() then
                local v385 = l_clearCaughtError_0();
                v104(v384, v384.return_, v385);
            end;
            return;
        end;
    elseif v384.tag == l_ClassComponent_0 then
        local l_stateNode_17 = v384.stateNode;
        if typeof(l_stateNode_17.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v384, l_stateNode_17, v384.return_);
        end;
        return;
    end;
end;
invokePassiveEffectUnmountInDEV = function(v387) --[[ Line: 2317 ]] --[[ Name: invokePassiveEffectUnmountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v162 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v104 (ref)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 and (v387.tag == l_FunctionComponent_0 or v387.tag == l_ForwardRef_0 or v387.tag == l_SimpleMemoComponent_0 or v387.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v162, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v387, v387.return_);
        if l_hasCaughtError_0() then
            local v388 = l_clearCaughtError_0();
            v104(v387, v387.return_, v388);
        end;
        return;
    else
        return;
    end;
end;
return {
    safelyCallDestroy = v143, 
    commitBeforeMutationLifeCycles = v151, 
    commitResetTextContent = commitResetTextContent, 
    commitPlacement = v294, 
    commitDeletion = v327, 
    commitWork = v342, 
    commitAttachRef = commitAttachRef, 
    commitDetachRef = commitDetachRef, 
    commitPassiveUnmount = v369, 
    commitPassiveUnmountInsideDeletedTree = v372, 
    commitPassiveMount = v377, 
    invokeLayoutEffectMountInDEV = invokeLayoutEffectMountInDEV, 
    invokeLayoutEffectUnmountInDEV = invokeLayoutEffectUnmountInDEV, 
    invokePassiveEffectMountInDEV = invokePassiveEffectMountInDEV, 
    invokePassiveEffectUnmountInDEV = invokePassiveEffectUnmountInDEV, 
    isSuspenseBoundaryBeingHidden = isSuspenseBoundaryBeingHidden, 
    recursivelyCommitLayoutEffects = v178
};