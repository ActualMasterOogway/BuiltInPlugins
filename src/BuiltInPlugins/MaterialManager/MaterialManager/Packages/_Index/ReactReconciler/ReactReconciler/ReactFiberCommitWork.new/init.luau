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
local v62 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v62.current;
local l_resetCurrentFiber_0 = v62.resetCurrentFiber;
local l_setCurrentFiber_0 = v62.setCurrentFiber;
local l_onCommitUnmount_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitUnmount;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v68 = require(script.Parent["ReactProfilerTimer.new"]);
local l_startLayoutEffectTimer_0 = v68.startLayoutEffectTimer;
local l_recordPassiveEffectDuration_0 = v68.recordPassiveEffectDuration;
local l_recordLayoutEffectDuration_0 = v68.recordLayoutEffectDuration;
local l_startPassiveEffectTimer_0 = v68.startPassiveEffectTimer;
local l_getCommitTime_0 = v68.getCommitTime;
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
local v96 = nil;
local function v99(v97, v98) --[[ Line: 189 ]] --[[ Name: resolveRetryWakeable ]]
    -- upvalues: v96 (ref)
    if not v96 then
        v96 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v96.resolveRetryWakeable(v97, v98);
end;
local function _() --[[ Line: 196 ]] --[[ Name: markCommitTimeOfFallback ]]
    -- upvalues: v96 (ref)
    if not v96 then
        v96 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v96.markCommitTimeOfFallback();
end;
local function v101() --[[ Line: 204 ]] --[[ Name: schedulePassiveEffectCallback ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback());
end;
local function v105(_, _, v104) --[[ Line: 209 ]] --[[ Name: captureCommitPhaseError ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle");
    error(v104);
end;
local l_NoFlags_1 = v18.NoFlags;
local l_HasEffect_0 = v18.HasEffect;
local l_Layout_0 = v18.Layout;
local l_Passive_0 = v18.Passive;
local v110 = nil;
local function v111() --[[ Line: 225 ]]
    -- upvalues: v110 (ref)
    if not v110 then
        v110 = require(script.Parent["ReactFiberBeginWork.new"]).didWarnAboutReassigningProps;
    end;
    return v110;
end;
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
local v122 = nil;
local function v127(v123, v124) --[[ Line: 252 ]] --[[ Name: callComponentWillUnmountWithTimer ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_recordLayoutEffectDuration_0 (copy)
    v124.props = v123.memoizedProps;
    v124.state = v123.memoizedState;
    if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v123.mode, l_ProfileMode_0) ~= 0 then
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 261 ]]
            -- upvalues: l_startLayoutEffectTimer_0 (ref), v124 (copy)
            l_startLayoutEffectTimer_0();
            v124:componentWillUnmount();
        end);
        l_recordLayoutEffectDuration_0(v123);
        if not l_status_0 then
            error(l_result_0);
            return;
        end;
    else
        v124:componentWillUnmount();
    end;
end;
safelyCallComponentWillUnmount = function(v128, v129, v130) --[[ Line: 279 ]] --[[ Name: safelyCallComponentWillUnmount ]]
    -- upvalues: v127 (copy), v105 (ref)
    local l_status_1, l_result_1 = pcall(v127, v128, v129);
    if not l_status_1 then
        v105(v128, v130, l_result_1);
    end;
end;
local function _(v133, v134) --[[ Line: 292 ]] --[[ Name: safelyDetachRef ]]
    -- upvalues: v105 (ref)
    local l_ref_0 = v133.ref;
    if l_ref_0 ~= nil then
        if typeof(l_ref_0) == "function" then
            local l_status_2, l_result_2 = pcall(l_ref_0);
            if not l_status_2 then
                v105(v133, v134, l_result_2);
                return;
            end;
        else
            l_ref_0.current = nil;
        end;
    end;
end;
local function v144(v139, v140, v141) --[[ Line: 308 ]] --[[ Name: safelyCallDestroy ]]
    -- upvalues: v105 (ref)
    local l_status_3, l_result_3 = pcall(v141);
    if not l_status_3 then
        v105(v139, v140, l_result_3);
    end;
end;
local function v152(v145, v146) --[[ Line: 320 ]] --[[ Name: commitBeforeMutationLifeCycles ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_ClassComponent_0 (copy), l_Snapshot_0 (copy), v111 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resolveDefaultProps_0 (copy), l_HostRoot_0 (copy), l_supportsMutation_0 (copy), l_clearContainer_0 (copy), l_HostComponent_0 (copy), l_HostText_0 (copy), l_HostPortal_0 (copy), l_IncompleteClassComponent_0 (copy), l_invariant_0 (copy)
    if v146.tag == l_FunctionComponent_0 or v146.tag == l_ForwardRef_0 or v146.tag == l_SimpleMemoComponent_0 or v146.tag == l_Block_0 then
        return;
    elseif v146.tag == l_ClassComponent_0 then
        if bit32.band(v146.flags, l_Snapshot_0) ~= 0 and v145 ~= nil then
            local l_memoizedProps_0 = v145.memoizedProps;
            local l_memoizedState_0 = v145.memoizedState;
            local l_stateNode_0 = v146.stateNode;
            if _G.__DEV__ and v146.type == v146.elementType and not v111 then
                if l_stateNode_0.props ~= v146.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "getSnapshotBeforeUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v146.type) or "instance");
                end;
                if l_stateNode_0.state ~= v146.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "getSnapshotBeforeUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v146.type) or "instance");
                end;
            end;
            local v150 = l_stateNode_0:getSnapshotBeforeUpdate(v146.elementType == v146.type and l_memoizedProps_0 or l_resolveDefaultProps_0(v146.type, l_memoizedProps_0), l_memoizedState_0);
            if _G.__DEV__ then

            end;
            l_stateNode_0.__reactInternalSnapshotBeforeUpdate = v150;
        end;
        return;
    elseif v146.tag == l_HostRoot_0 then
        if l_supportsMutation_0 and bit32.band(v146.flags, l_Snapshot_0) ~= 0 then
            local l_stateNode_1 = v146.stateNode;
            l_clearContainer_0(l_stateNode_1.containerInfo);
        end;
        return;
    elseif v146.tag == l_HostComponent_0 or v146.tag == l_HostText_0 or v146.tag == l_HostPortal_0 or v146.tag == l_IncompleteClassComponent_0 then
        return;
    else
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
        return;
    end;
end;
local function v163(v153, v154, v155) --[[ Line: 414 ]] --[[ Name: commitHookEffectListUnmount ]]
    -- upvalues: v105 (ref)
    local l_updateQueue_0 = v154.updateQueue;
    local v157 = nil;
    if l_updateQueue_0 ~= nil then
        v157 = l_updateQueue_0.lastEffect;
    end;
    if v157 ~= nil then
        local l_next_0 = v157.next;
        local l_l_next_0_0 = l_next_0;
        repeat
            if bit32.band(l_l_next_0_0.tag, v153) == v153 then
                local l_destroy_0 = l_l_next_0_0.destroy;
                l_l_next_0_0.destroy = nil;
                if l_destroy_0 ~= nil then
                    local l_status_4, l_result_4 = pcall(l_destroy_0);
                    if not l_status_4 then
                        v105(v154, v155, l_result_4);
                    end;
                end;
            end;
            l_l_next_0_0 = l_l_next_0_0.next;
        until l_l_next_0_0 == l_next_0;
    end;
end;
local function v172(v164, v165) --[[ Line: 442 ]] --[[ Name: commitHookEffectListMount ]]
    -- upvalues: l_console_0 (copy)
    local l_updateQueue_1 = v165.updateQueue;
    local v167 = if l_updateQueue_1 ~= nil then l_updateQueue_1.lastEffect else nil;
    if v167 ~= nil then
        local l_next_1 = v167.next;
        local l_l_next_1_0 = l_next_1;
        repeat
            if bit32.band(l_l_next_1_0.tag, v164) == v164 then
                l_l_next_1_0.destroy = l_l_next_1_0.create();
                if _G.__DEV__ then
                    local l_destroy_1 = l_l_next_1_0.destroy;
                    if l_destroy_1 ~= nil and typeof(l_destroy_1) ~= "function" then
                        local v171 = nil;
                        v171 = if l_destroy_1 == nil then " You returned nil. If your effect does not require clean " .. "up, return nil (or nothing)." else if typeof(l_destroy_1.andThen) == "function" then "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. " .. "Instead, write the async function inside your effect " .. "and call it immediately:\n\n" .. "useEffect(function()\n" .. "  function fetchData()\n" .. "    -- You can await here\n" .. "    local response = MyAPI.getData(someId):await()\n" .. "    -- ...\n" .. "  end\n" .. "  fetchData()\n" .. "end, {someId}) -- Or {} if effect doesn't need props or state\n\n" .. "Learn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" else " You returned: " .. l_destroy_1;
                        l_console_0.error("An effect function must not return anything besides a function, " .. "which is used for clean-up.%s", v171);
                    end;
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
        until l_l_next_1_0 == l_next_1;
    end;
end;
commitProfilerPassiveEffect = function(v173, v174) --[[ Line: 493 ]] --[[ Name: commitProfilerPassiveEffect ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_Profiler_0 (copy), l_getCommitTime_0 (copy), l_enableSchedulerTracing_0 (copy)
    if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and v174.tag == l_Profiler_0 then
        local l_passiveEffectDuration_0 = v174.stateNode.passiveEffectDuration;
        local l_id_0 = v174.memoizedProps.id;
        local l_onPostCommit_0 = v174.memoizedProps.onPostCommit;
        local v178 = l_getCommitTime_0();
        if typeof(l_onPostCommit_0) == "function" then
            if l_enableSchedulerTracing_0 then
                l_onPostCommit_0(l_id_0, v174.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v178, v173.memoizedInteractions);
                return;
            else
                l_onPostCommit_0(l_id_0, v174.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v178);
            end;
        end;
    end;
end;
local function v179(v180, v181, v182, v183) --[[ Line: 538 ]] --[[ Name: recursivelyCommitLayoutEffects ]]
    -- upvalues: v105 (ref), v101 (ref), l_Profiler_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), v122 (ref), l_LayoutMask_0 (copy), l_NoFlags_0 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), v179 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy), l_Update_0 (copy), l_Callback_0 (copy), v62 (copy), v2 (ref), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v172 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_PassiveMask_0 (copy), l_ClassComponent_0 (copy), v118 (ref), l_HostRoot_0 (copy), v116 (ref), l_HostComponent_0 (copy), v117 (ref), l_SuspenseComponent_0 (copy), l_FundamentalComponent_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), l_IncompleteClassComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), l_OffscreenComponent_0 (copy), l_ScopeComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_invariant_0 (copy), l_Ref_0 (copy)
    if v182 ~= nil then
        v105 = v182;
    end;
    if v183 ~= nil then
        v101 = v183;
    end;
    local l_flags_0 = v180.flags;
    local l_tag_0 = v180.tag;
    if l_tag_0 == l_Profiler_0 then
        local v186 = nil;
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 then
            v186 = v122;
            v122 = v180;
        end;
        local l_child_0 = v180.child;
        while l_child_0 ~= nil do
            if bit32.band(v180.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if _G.__DEV__ then
                    local l_l_current_0_0 = l_current_0;
                    l_setCurrentFiber_0(l_child_0);
                    l_invokeGuardedCallback_0(nil, v179, nil, l_child_0, v181, v105, v101);
                    if l_hasCaughtError_0() then
                        local v189 = l_clearCaughtError_0();
                        v105(l_child_0, v180, v189);
                    end;
                    if l_l_current_0_0 ~= nil then
                        l_setCurrentFiber_0(l_l_current_0_0);
                    else
                        l_resetCurrentFiber_0();
                    end;
                else
                    local l_status_5, l_result_5 = pcall(v179, l_child_0, v181, v105, v101);
                    if not l_status_5 then
                        v105(l_child_0, v180, l_result_5);
                    end;
                end;
            end;
            l_child_0 = l_child_0.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 and l_enableProfilerTimer_0 then
            if _G.__DEV__ then
                local l_l_current_0_1 = l_current_0;
                l_setCurrentFiber_0(v180);
                l_invokeGuardedCallback_0(nil, commitLayoutEffectsForProfiler, nil, v180, v181);
                if l_hasCaughtError_0() then
                    local v193 = l_clearCaughtError_0();
                    v105(v180, v180.return_, v193);
                end;
                if l_l_current_0_1 ~= nil then
                    l_setCurrentFiber_0(l_l_current_0_1);
                else
                    l_resetCurrentFiber_0();
                end;
            else
                local l_status_6, l_result_6 = pcall(commitLayoutEffectsForProfiler, v180, v181);
                if not l_status_6 then
                    v105(v180, v180.return_, l_result_6);
                end;
            end;
        end;
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 then
            if v186 ~= nil then
                local l_stateNode_2 = v186.stateNode;
                l_stateNode_2.effectDuration = l_stateNode_2.effectDuration + v180.stateNode.effectDuration;
            end;
            v122 = v186;
            return;
        end;
    else
        local l_child_1 = v180.child;
        while l_child_1 ~= nil do
            if bit32.band(v180.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if _G.__DEV__ then
                    local l_current_1 = v62.current;
                    l_setCurrentFiber_0(l_child_1);
                    if v2 < 20 then
                        v2 = v2 + 1;
                        l_invokeGuardedCallback_0(nil, v179, nil, l_child_1, v181, v105, v101);
                        v2 = v2 - 1;
                        if l_hasCaughtError_0() then
                            local v199 = l_clearCaughtError_0();
                            v105(l_child_1, v180, v199);
                        end;
                    else
                        v179(l_child_1, v181, v105, v101);
                    end;
                    if l_current_1 ~= nil then
                        l_setCurrentFiber_0(l_current_1);
                    else
                        l_resetCurrentFiber_0();
                    end;
                else
                    local v200 = nil;
                    local v201 = nil;
                    if not _G.__YOLO__ and v2 < 20 then
                        v2 = v2 + 1;
                        local l_status_7, l_result_7 = pcall(v179, l_child_1, v181, v105, v101);
                        v200 = l_status_7;
                        v201 = l_result_7;
                        v2 = v2 - 1;
                    else
                        v200 = true;
                        v179(l_child_1, v181, v105, v101);
                    end;
                    if not v200 then
                        v105(l_child_1, v180, v201);
                    end;
                end;
            end;
            l_child_1 = l_child_1.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 then
            if l_tag_0 == l_FunctionComponent_0 or l_tag_0 == l_ForwardRef_0 or l_tag_0 == l_SimpleMemoComponent_0 or l_tag_0 == l_Block_0 then
                if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v180.mode, l_ProfileMode_0) ~= 0 then
                    local l_status_8, l_result_8 = pcall(function() --[[ Line: 728 ]]
                        -- upvalues: l_startLayoutEffectTimer_0 (ref), v172 (ref), l_Layout_0 (ref), l_HasEffect_0 (ref), v180 (copy)
                        l_startLayoutEffectTimer_0();
                        v172(bit32.bor(l_Layout_0, l_HasEffect_0), v180);
                    end);
                    l_recordLayoutEffectDuration_0(v180);
                    if not l_status_8 then
                        error(l_result_8);
                    end;
                else
                    v172(bit32.bor(l_Layout_0, l_HasEffect_0), v180);
                end;
                if bit32.band(v180.subtreeFlags, l_PassiveMask_0) ~= l_NoFlags_0 then
                    v101();
                end;
            elseif l_tag_0 == l_ClassComponent_0 then
                v118(v180);
            elseif l_tag_0 == l_HostRoot_0 then
                v116(v180);
            elseif l_tag_0 == l_HostComponent_0 then
                v117(v180);
            elseif l_tag_0 == l_SuspenseComponent_0 then
                commitSuspenseHydrationCallbacks(v181, v180);
            elseif l_tag_0 ~= l_FundamentalComponent_0 and l_tag_0 ~= l_HostPortal_0 and l_tag_0 ~= l_HostText_0 and l_tag_0 ~= l_IncompleteClassComponent_0 and l_tag_0 ~= l_LegacyHiddenComponent_0 and l_tag_0 ~= l_OffscreenComponent_0 and l_tag_0 ~= l_ScopeComponent_0 and l_tag_0 ~= l_SuspenseListComponent_0 then
                l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
            end;
        end;
        if bit32.band(l_flags_0, l_Ref_0) ~= 0 then
            commitAttachRef(v180);
        end;
    end;
end;
commitLayoutEffectsForProfiler = function(v206, v207) --[[ Line: 793 ]] --[[ Name: commitLayoutEffectsForProfiler ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_getCommitTime_0 (copy), l_Update_0 (copy), l_Callback_0 (copy), l_NoFlags_0 (copy), l_enableSchedulerTracing_0 (copy), l_enableProfilerCommitHooks_0 (copy)
    local v208 = false;
    local v209 = false;
    if l_enableProfilerTimer_0 then
        local l_flags_1 = v206.flags;
        local l_alternate_0 = v206.alternate;
        local l_onCommit_0 = v206.memoizedProps.onCommit;
        local l_onRender_0 = v206.memoizedProps.onRender;
        local l_effectDuration_0 = v206.stateNode.effectDuration;
        local v215 = l_getCommitTime_0();
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Callback_0_0 = l_Callback_0;
        if bit32.band(l_flags_1, l_l_Update_0_0) ~= l_NoFlags_0 then
            local v218;
            if typeof(l_onRender_0) == "function" then
                v218 = true;
            else
                if typeof(l_onRender_0) == "table" then
                    local v219 = getmetatable(l_onRender_0);
                    if v219 and rawget(v219, "__call") then
                        v218 = true;
                        v208 = true;
                    elseif l_onRender_0._isMockFunction then
                        v218 = true;
                        v208 = true;
                    end;
                end;
                if not v208 then
                    if not v208 then
                        v218 = false;
                    end;
                end;
            end;
            v208 = false;
            if v218 then
                if l_enableSchedulerTracing_0 then
                    l_onRender_0(v206.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v206.actualDuration, v206.treeBaseDuration, v206.actualStartTime, v215, v207.memoizedInteractions);
                else
                    l_onRender_0(v206.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v206.actualDuration, v206.treeBaseDuration, v206.actualStartTime, v215);
                end;
            end;
        end;
        if l_enableProfilerCommitHooks_0 and bit32.band(l_flags_1, l_l_Callback_0_0) ~= l_NoFlags_0 then
            local v220;
            if typeof(l_onCommit_0) == "function" then
                v220 = true;
            else
                if typeof(l_onCommit_0) == "table" then
                    local v221 = getmetatable(l_onCommit_0);
                    if v221 and rawget(v221, "__call") then
                        v220 = true;
                        v209 = true;
                    elseif l_onCommit_0._isMockFunction then
                        v220 = true;
                        v209 = true;
                    end;
                end;
                if not v209 then
                    if not v209 then
                        v220 = false;
                    end;
                end;
            end;
            v209 = false;
            if v220 then
                if l_enableSchedulerTracing_0 then
                    l_onCommit_0(v206.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v215, v207.memoizedInteractions);
                    return;
                else
                    l_onCommit_0(v206.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v215);
                end;
            end;
        end;
    end;
end;
v118 = function(v222) --[[ Line: 882 ]] --[[ Name: commitLayoutEffectsForClassComponent ]]
    -- upvalues: l_Update_0 (copy), v111 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_resolveDefaultProps_0 (copy), l_commitUpdateQueue_0 (copy)
    local l_stateNode_3 = v222.stateNode;
    local l_alternate_1 = v222.alternate;
    if bit32.band(v222.flags, l_Update_0) ~= 0 then
        if l_alternate_1 == nil then
            if _G.__DEV__ and v222.type == v222.elementType and not v111 then
                if l_stateNode_3.props ~= v222.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "componentDidMount. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v222.type) or "instance");
                end;
                if l_stateNode_3.state ~= v222.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "componentDidMount. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v222.type) or "instance");
                end;
            end;
            if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v222.mode, l_ProfileMode_0) ~= 0 then
                local l_status_9, l_result_9 = pcall(function() --[[ Line: 922 ]]
                    -- upvalues: l_startLayoutEffectTimer_0 (ref), l_stateNode_3 (copy)
                    l_startLayoutEffectTimer_0();
                    l_stateNode_3:componentDidMount();
                end);
                l_recordLayoutEffectDuration_0(v222);
                if not l_status_9 then
                    error(l_result_9);
                end;
            else
                l_stateNode_3:componentDidMount();
            end;
        else
            local v227 = v222.elementType == v222.type and l_alternate_1.memoizedProps or l_resolveDefaultProps_0(v222.type, l_alternate_1.memoizedProps);
            local l_memoizedState_1 = l_alternate_1.memoizedState;
            if _G.__DEV__ and v222.type == v222.elementType and not v111 then
                if l_stateNode_3.props ~= v222.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "componentDidUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v222.type) or "instance");
                end;
                if l_stateNode_3.state ~= v222.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "componentDidUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v222.type) or "instance");
                end;
            end;
            if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v222.mode, l_ProfileMode_0) ~= 0 then
                local l_v227_0 = v227 --[[ copy: 3 -> 7 ]];
                local l_status_10, l_result_10 = pcall(function() --[[ Line: 977 ]]
                    -- upvalues: l_startLayoutEffectTimer_0 (ref), l_stateNode_3 (copy), l_v227_0 (copy), l_memoizedState_1 (copy)
                    l_startLayoutEffectTimer_0();
                    l_stateNode_3:componentDidUpdate(l_v227_0, l_memoizedState_1, l_stateNode_3.__reactInternalSnapshotBeforeUpdate);
                end);
                l_recordLayoutEffectDuration_0(v222);
                if not l_status_10 then
                    error(l_result_10);
                end;
            else
                l_stateNode_3:componentDidUpdate(v227, l_memoizedState_1, l_stateNode_3.__reactInternalSnapshotBeforeUpdate);
            end;
        end;
    end;
    local l_updateQueue_2 = v222.updateQueue;
    if l_updateQueue_2 ~= nil then
        if _G.__DEV__ and v222.type == v222.elementType and not v111 then
            if l_stateNode_3.props ~= v222.memoizedProps then
                l_console_0.error("Expected %s props to match memoized props before " .. "processing the update queue. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v222.type) or "instance");
            end;
            if l_stateNode_3.state ~= v222.memoizedState then
                l_console_0.error("Expected %s state to match memoized state before " .. "processing the update queue. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v222.type) or "instance");
            end;
        end;
        l_commitUpdateQueue_0(v222, l_updateQueue_2, l_stateNode_3);
    end;
end;
v116 = function(v233) --[[ Line: 1040 ]] --[[ Name: commitLayoutEffectsForHostRoot ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy), l_ClassComponent_0 (copy), l_commitUpdateQueue_0 (copy)
    local l_updateQueue_3 = v233.updateQueue;
    if l_updateQueue_3 ~= nil then
        local v235 = nil;
        if v233.child ~= nil then
            local l_child_2 = v233.child;
            if l_child_2.tag == l_HostComponent_0 then
                v235 = l_getPublicInstance_0(l_child_2.stateNode);
            elseif l_child_2.tag == l_ClassComponent_0 then
                v235 = l_child_2.stateNode;
            end;
        end;
        l_commitUpdateQueue_0(v233, l_updateQueue_3, v235);
    end;
end;
v117 = function(v237) --[[ Line: 1059 ]] --[[ Name: commitLayoutEffectsForHostComponent ]]
    -- upvalues: l_Update_0 (copy), l_commitMount_0 (copy)
    local l_stateNode_4 = v237.stateNode;
    if v237.alternate == nil and bit32.band(v237.flags, l_Update_0) ~= 0 then
        local l_type_0 = v237.type;
        local l_memoizedProps_1 = v237.memoizedProps;
        l_commitMount_0(l_stateNode_4, l_type_0, l_memoizedProps_1, v237);
    end;
end;
local function v246(v241, v242) --[[ Line: 1074 ]] --[[ Name: hideOrUnhideAllChildren ]]
    -- upvalues: l_supportsMutation_0 (copy), l_HostComponent_0 (copy), l_hideInstance_0 (copy), l_unhideInstance_0 (copy), l_HostText_0 (copy), l_hideTextInstance_0 (copy), l_unhideTextInstance_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy)
    if l_supportsMutation_0 then
        local l_v241_0 = v241;
        while true do
            if l_v241_0.tag == l_HostComponent_0 then
                local l_stateNode_5 = l_v241_0.stateNode;
                if v242 then
                    l_hideInstance_0(l_stateNode_5);
                else
                    l_unhideInstance_0(l_v241_0.stateNode, l_v241_0.memoizedProps);
                end;
            elseif l_v241_0.tag == l_HostText_0 then
                local l_stateNode_6 = l_v241_0.stateNode;
                if v242 then
                    l_hideTextInstance_0(l_stateNode_6);
                else
                    l_unhideTextInstance_0(l_stateNode_6, l_v241_0.memoizedProps);
                end;
            elseif (l_v241_0.tag ~= l_OffscreenComponent_0 and l_v241_0.tag ~= l_LegacyHiddenComponent_0 or l_v241_0.memoizedState == nil or l_v241_0 == v241) and l_v241_0.child ~= nil then
                l_v241_0.child.return_ = l_v241_0;
                l_v241_0 = l_v241_0.child;
                continue;
            end;
            if l_v241_0 == v241 then
                return;
            else
                while true do
                    if l_v241_0.sibling == nil then
                        if l_v241_0.return_ == nil or l_v241_0.return_ == v241 then
                            return;
                        else
                            l_v241_0 = l_v241_0.return_;
                        end;
                    else
                        l_v241_0.sibling.return_ = l_v241_0.return_;
                        l_v241_0 = l_v241_0.sibling;
                        break;
                    end;
                end;
            end;
        end;
    else
        return;
    end;
end;
commitAttachRef = function(v247) --[[ Line: 1125 ]] --[[ Name: commitAttachRef ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    local l_ref_1 = v247.ref;
    if l_ref_1 ~= nil then
        local l_stateNode_7 = v247.stateNode;
        local v250 = nil;
        v250 = if v247.tag == l_HostComponent_0 then l_getPublicInstance_0(l_stateNode_7) else l_stateNode_7;
        if typeof(l_ref_1) == "function" then
            l_ref_1(v250);
            return;
        elseif _G.__DEV__ and typeof(l_ref_1) ~= "table" then
            l_console_0.error("Unexpected ref object provided for %s. " .. "Use either a ref-setter function or React.createRef().", l_getComponentName_0(v247.type) or "instance");
            return;
        else
            l_ref_1.current = v250;
        end;
    end;
end;
commitDetachRef = function(v251) --[[ Line: 1164 ]] --[[ Name: commitDetachRef ]]
    local l_ref_2 = v251.ref;
    if l_ref_2 ~= nil then
        if typeof(l_ref_2) == "function" then
            l_ref_2(nil);
            return;
        else
            l_ref_2.current = nil;
        end;
    end;
end;
v121 = function(v253, v254, v255, v256) --[[ Line: 1178 ]] --[[ Name: commitUnmount ]]
    -- upvalues: l_onCommitUnmount_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_Layout_0 (copy), l_NoFlags_1 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v105 (ref), l_recordLayoutEffectDuration_0 (copy), l_ClassComponent_0 (copy), l_HostComponent_0 (copy), l_HostPortal_0 (copy), l_supportsMutation_0 (copy), v119 (ref), l_supportsPersistence_0 (copy), v1 (copy)
    l_onCommitUnmount_0(v254);
    if v254.tag == l_FunctionComponent_0 or v254.tag == l_ForwardRef_0 or v254.tag == l_MemoComponent_0 or v254.tag == l_SimpleMemoComponent_0 or v254.tag == l_Block_0 then
        local l_updateQueue_4 = v254.updateQueue;
        if l_updateQueue_4 ~= nil then
            local l_lastEffect_0 = l_updateQueue_4.lastEffect;
            if l_lastEffect_0 ~= nil then
                local l_next_2 = l_lastEffect_0.next;
                local l_l_next_2_0 = l_next_2;
                repeat
                    if l_l_next_2_0.destroy ~= nil and bit32.band(l_l_next_2_0.tag, l_Layout_0) ~= l_NoFlags_1 then
                        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v254.mode, l_ProfileMode_0) ~= 0 then
                            l_startLayoutEffectTimer_0();
                            local l_destroy_2 = l_l_next_2_0.destroy;
                            local l_status_11, l_result_11 = pcall(l_destroy_2);
                            if not l_status_11 then
                                v105(v254, v255, l_result_11);
                            end;
                            l_recordLayoutEffectDuration_0(v254);
                        else
                            local l_destroy_3 = l_l_next_2_0.destroy;
                            local l_status_12, l_result_12 = pcall(l_destroy_3);
                            if not l_status_12 then
                                v105(v254, v255, l_result_12);
                            end;
                        end;
                    end;
                    l_l_next_2_0 = l_l_next_2_0.next;
                until l_l_next_2_0 == l_next_2;
            end;
        end;
        return;
    elseif v254.tag == l_ClassComponent_0 then
        local l_ref_3 = v254.ref;
        if l_ref_3 ~= nil then
            if typeof(l_ref_3) == "function" then
                local l_status_13, l_result_13 = pcall(l_ref_3);
                if not l_status_13 then
                    v105(v254, v255, l_result_13);
                end;
            else
                l_ref_3.current = nil;
            end;
        end;
        l_ref_3 = v254.stateNode;
        if typeof(l_ref_3.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v254, l_ref_3, v255);
        end;
        return;
    elseif v254.tag == l_HostComponent_0 then
        local l_ref_4 = v254.ref;
        if l_ref_4 ~= nil then
            if typeof(l_ref_4) == "function" then
                local l_status_14, l_result_14 = pcall(l_ref_4);
                if not l_status_14 then
                    v105(v254, v255, l_result_14);
                    return;
                end;
            else
                l_ref_4.current = nil;
            end;
        end;
        return;
    elseif v254.tag == l_HostPortal_0 then
        if l_supportsMutation_0 then
            v119(v253, v254, v255, v256);
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
v120 = function(v273, v274, v275, v276) --[[ Line: 1281 ]] --[[ Name: commitNestedUnmounts ]]
    -- upvalues: v121 (ref), l_supportsMutation_0 (copy), l_HostPortal_0 (copy)
    local l_v274_0 = v274;
    while true do
        v121(v273, l_v274_0, v275, v276);
        if l_v274_0.child ~= nil and (not l_supportsMutation_0 or l_v274_0.tag ~= l_HostPortal_0) then
            l_v274_0.child.return_ = l_v274_0;
            l_v274_0 = l_v274_0.child;
            continue;
        end;
        if l_v274_0 == v274 then
            return;
        else
            while true do
                if l_v274_0.sibling == nil then
                    if l_v274_0.return_ == nil or l_v274_0.return_ == v274 then
                        return;
                    else
                        l_v274_0 = l_v274_0.return_;
                    end;
                else
                    l_v274_0.sibling.return_ = l_v274_0.return_;
                    l_v274_0 = l_v274_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function _(v278) --[[ Line: 1326 ]] --[[ Name: detachFiberMutation ]]
    local l_alternate_2 = v278.alternate;
    if l_alternate_2 ~= nil then
        l_alternate_2.return_ = nil;
        v278.alternate = nil;
    end;
    v278.return_ = nil;
end;
local function v283(v281) --[[ Line: 1393 ]] --[[ Name: getHostParentFiber ]]
    -- upvalues: v112 (ref), l_Error_0 (copy)
    local l_return__0 = v281.return_;
    while true do
        if l_return__0 ~= nil then
            if v112(l_return__0) then
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
v112 = function(v284) --[[ Line: 1409 ]] --[[ Name: isHostParent ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy)
    local v285 = true;
    if v284.tag ~= l_HostComponent_0 then
        v285 = true;
        if v284.tag ~= l_HostRoot_0 then
            v285 = v284.tag == l_HostPortal_0;
        end;
    end;
    return v285;
end;
v113 = function(v286) --[[ Line: 1416 ]] --[[ Name: getHostSibling ]]
    -- upvalues: v112 (ref), l_HostComponent_0 (copy), l_HostText_0 (copy), l_DehydratedFragment_0 (copy), l_Placement_0 (copy), l_HostPortal_0 (copy)
    local l_v286_0 = v286;
    while true do
        local v288 = false;
        while true do
            if l_v286_0.sibling == nil then
                if l_v286_0.return_ == nil or v112(l_v286_0.return_) then
                    return nil;
                else
                    l_v286_0 = l_v286_0.return_;
                end;
            else
                l_v286_0.sibling.return_ = l_v286_0.return_;
                l_v286_0 = l_v286_0.sibling;
                while l_v286_0.tag ~= l_HostComponent_0 and l_v286_0.tag ~= l_HostText_0 and l_v286_0.tag ~= l_DehydratedFragment_0 do
                    if bit32.band(l_v286_0.flags, l_Placement_0) ~= 0 then
                        v288 = true;
                        break;
                    elseif l_v286_0.child == nil or l_v286_0.tag == l_HostPortal_0 then
                        v288 = true;
                        break;
                    else
                        l_v286_0.child.return_ = l_v286_0;
                        l_v286_0 = l_v286_0.child;
                    end;
                end;
                if not v288 and bit32.band(l_v286_0.flags, l_Placement_0) == 0 then
                    return l_v286_0.stateNode;
                else
                    break;
                end;
            end;
        end;
    end;
end;
local function v295(v289) --[[ Line: 1470 ]] --[[ Name: commitPlacement ]]
    -- upvalues: l_supportsMutation_0 (copy), v283 (copy), l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy), l_invariant_0 (copy), l_ContentReset_0 (copy), l_resetTextContent_0 (copy), v113 (ref), v115 (ref), v114 (ref)
    if not l_supportsMutation_0 then
        return;
    else
        local v290 = v283(v289);
        local v291 = nil;
        local v292 = nil;
        local l_stateNode_8 = v290.stateNode;
        if v290.tag == l_HostComponent_0 then
            v291 = l_stateNode_8;
            v292 = false;
        elseif v290.tag == l_HostRoot_0 then
            v291 = l_stateNode_8.containerInfo;
            v292 = true;
        elseif v290.tag == l_HostPortal_0 then
            v291 = l_stateNode_8.containerInfo;
            v292 = true;
        else
            l_invariant_0(false, "Invalid host parent fiber. This error is likely caused by a bug " .. "in React. Please file an issue.");
        end;
        if bit32.band(v290.flags, l_ContentReset_0) ~= 0 then
            l_resetTextContent_0(v291);
            v290.flags = bit32.band(v290.flags, (bit32.bnot(l_ContentReset_0)));
        end;
        local v294 = v113(v289);
        if v292 then
            v115(v289, v294, v291);
            return;
        else
            v114(v289, v294, v291);
            return;
        end;
    end;
end;
v115 = function(v296, v297, v298) --[[ Line: 1521 ]] --[[ Name: insertOrAppendPlacementNodeIntoContainer ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_insertInContainerBefore_0 (copy), l_appendChildToContainer_0 (copy), l_HostPortal_0 (copy), v115 (ref)
    local l_tag_1 = v296.tag;
    local v300 = true;
    if l_tag_1 ~= l_HostComponent_0 then
        v300 = l_tag_1 == l_HostText_0;
    end;
    if v300 then
        local l_stateNode_9 = v296.stateNode;
        if v297 then
            l_insertInContainerBefore_0(v298, l_stateNode_9, v297);
            return;
        else
            l_appendChildToContainer_0(v298, l_stateNode_9);
            return;
        end;
    elseif l_tag_1 == l_HostPortal_0 then
        return;
    else
        local l_child_3 = v296.child;
        if l_child_3 ~= nil then
            v115(l_child_3, v297, v298);
            local l_sibling_0 = l_child_3.sibling;
            while l_sibling_0 ~= nil do
                v115(l_sibling_0, v297, v298);
                l_sibling_0 = l_sibling_0.sibling;
            end;
        end;
        return;
    end;
end;
v114 = function(v304, v305, v306) --[[ Line: 1553 ]] --[[ Name: insertOrAppendPlacementNode ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_insertBefore_0 (copy), l_appendChild_0 (copy), l_HostPortal_0 (copy), v114 (ref)
    local l_tag_2 = v304.tag;
    local v308 = true;
    if l_tag_2 ~= l_HostComponent_0 then
        v308 = l_tag_2 == l_HostText_0;
    end;
    if v308 then
        local l_stateNode_10 = v304.stateNode;
        if v305 then
            l_insertBefore_0(v306, l_stateNode_10, v305);
            return;
        else
            l_appendChild_0(v306, l_stateNode_10);
            return;
        end;
    elseif l_tag_2 == l_HostPortal_0 then
        return;
    else
        local l_child_4 = v304.child;
        if l_child_4 ~= nil then
            v114(l_child_4, v305, v306);
            local l_sibling_1 = l_child_4.sibling;
            while l_sibling_1 ~= nil do
                v114(l_sibling_1, v305, v306);
                l_sibling_1 = l_sibling_1.sibling;
            end;
        end;
        return;
    end;
end;
v119 = function(v312, v313, v314, v315) --[[ Line: 1585 ]] --[[ Name: unmountHostComponents ]]
    -- upvalues: l_Error_0 (copy), l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), v120 (ref), l_removeChildFromContainer_0 (copy), l_removeChild_0 (copy), v121 (ref)
    local l_v313_0 = v313;
    local v317 = false;
    local v318 = nil;
    local v319 = nil;
    while true do
        if not v317 then
            local l_return__1 = l_v313_0.return_;
            while true do
                if l_return__1 == nil then
                    error(l_Error_0.new("Expected to find a host parent. This error is likely caused by " .. "a bug in React. Please file an issue."));
                end;
                local l_stateNode_11 = l_return__1.stateNode;
                if l_return__1.tag == l_HostComponent_0 then
                    v318 = l_stateNode_11;
                    v319 = false;
                    break;
                elseif l_return__1.tag == l_HostRoot_0 then
                    v318 = l_stateNode_11.containerInfo;
                    v319 = true;
                    break;
                elseif l_return__1.tag == l_HostPortal_0 then
                    v318 = l_stateNode_11.containerInfo;
                    v319 = true;
                    break;
                else
                    l_return__1 = l_return__1.return_;
                end;
            end;
            v317 = true;
        end;
        if l_v313_0.tag == l_HostComponent_0 or l_v313_0.tag == l_HostText_0 then
            v120(v312, l_v313_0, v314, v315);
            if v319 then
                l_removeChildFromContainer_0(v318, l_v313_0.stateNode);
            else
                l_removeChild_0(v318, l_v313_0.stateNode);
            end;
        elseif l_v313_0.tag == l_HostPortal_0 then
            if l_v313_0.child ~= nil then
                v318 = l_v313_0.stateNode.containerInfo;
                v319 = true;
                l_v313_0.child.return_ = l_v313_0;
                l_v313_0 = l_v313_0.child;
                continue;
            end;
        else
            v121(v312, l_v313_0, v314, v315);
            if l_v313_0.child ~= nil then
                l_v313_0.child.return_ = l_v313_0;
                l_v313_0 = l_v313_0.child;
                continue;
            end;
        end;
        if l_v313_0 == v313 then
            return;
        else
            while true do
                if l_v313_0.sibling == nil then
                    if l_v313_0.return_ == nil or l_v313_0.return_ == v313 then
                        return;
                    else
                        l_v313_0 = l_v313_0.return_;
                        if l_v313_0.tag == l_HostPortal_0 then
                            v317 = false;
                        end;
                    end;
                else
                    l_v313_0.sibling.return_ = l_v313_0.return_;
                    l_v313_0 = l_v313_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function v328(v322, v323, v324, v325) --[[ Line: 1767 ]] --[[ Name: commitDeletion ]]
    -- upvalues: v119 (ref)
    v119(v322, v323, v324, v325);
    local l_alternate_3 = v323.alternate;
    local l_alternate_4 = v323.alternate;
    if l_alternate_4 ~= nil then
        l_alternate_4.return_ = nil;
        v323.alternate = nil;
    end;
    v323.return_ = nil;
    if l_alternate_3 ~= nil then
        l_alternate_4 = l_alternate_3.alternate;
        if l_alternate_4 ~= nil then
            l_alternate_4.return_ = nil;
            l_alternate_3.alternate = nil;
        end;
        l_alternate_3.return_ = nil;
    end;
end;
local function v343(v329, v330) --[[ Line: 1799 ]] --[[ Name: commitWork ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v163 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_ClassComponent_0 (copy), l_HostComponent_0 (copy), l_commitUpdate_0 (copy), l_HostText_0 (copy), l_invariant_0 (copy), l_commitTextUpdate_0 (copy), l_HostRoot_0 (copy), l_supportsHydration_0 (copy), v1 (copy), l_Profiler_0 (copy), l_SuspenseComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_IncompleteClassComponent_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), v246 (copy)
    if v330.tag == l_FunctionComponent_0 or v330.tag == l_ForwardRef_0 or v330.tag == l_MemoComponent_0 or v330.tag == l_SimpleMemoComponent_0 or v330.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v330.mode, l_ProfileMode_0) ~= 0 then
            local l_status_15, l_result_15 = pcall(function() --[[ Line: 1888 ]]
                -- upvalues: l_startLayoutEffectTimer_0 (ref), v163 (ref), l_Layout_0 (ref), l_HasEffect_0 (ref), v330 (copy)
                l_startLayoutEffectTimer_0();
                v163(bit32.bor(l_Layout_0, l_HasEffect_0), v330, v330.return_);
            end);
            l_recordLayoutEffectDuration_0(v330);
            if not l_status_15 then
                error(l_result_15);
                return;
            end;
        else
            v163(bit32.bor(l_Layout_0, l_HasEffect_0), v330, v330.return_);
        end;
        return;
    elseif v330.tag == l_ClassComponent_0 then
        return;
    elseif v330.tag == l_HostComponent_0 then
        local l_stateNode_12 = v330.stateNode;
        if l_stateNode_12 ~= nil then
            local l_memoizedProps_2 = v330.memoizedProps;
            local v335 = nil;
            v335 = if v329 then v329.memoizedProps else l_memoizedProps_2;
            local l_type_1 = v330.type;
            local l_updateQueue_5 = v330.updateQueue;
            v330.updateQueue = nil;
            if l_updateQueue_5 ~= nil then
                l_commitUpdate_0(l_stateNode_12, l_updateQueue_5, l_type_1, v335, l_memoizedProps_2, v330);
            end;
        end;
        return;
    elseif v330.tag == l_HostText_0 then
        l_invariant_0(v330.stateNode ~= nil, "This should have a text node initialized. This error is likely " .. "caused by a bug in React. Please file an issue.");
        local l_stateNode_13 = v330.stateNode;
        local l_memoizedProps_3 = v330.memoizedProps;
        local v340 = nil;
        if v329 ~= nil then
            v340 = v329.memoizedProps;
            v340 = l_memoizedProps_3;
        end;
        l_commitTextUpdate_0(l_stateNode_13, v340, l_memoizedProps_3);
        return;
    elseif v330.tag == l_HostRoot_0 then
        if l_supportsHydration_0 then
            local l_stateNode_14 = v330.stateNode;
            if l_stateNode_14.hydrate then
                l_stateNode_14.hydrate = false;
                v1("commitWork: HostRoot: commitHydratedContainer");
            end;
        end;
        return;
    elseif v330.tag == l_Profiler_0 then
        return;
    elseif v330.tag == l_SuspenseComponent_0 then
        commitSuspenseComponent(v330);
        attachSuspenseRetryListeners(v330);
        return;
    else
        if v330.tag == l_SuspenseListComponent_0 then
            v1("commitWork: SuspenseListComponent");
        elseif v330.tag == l_IncompleteClassComponent_0 then
            return;
        elseif v330.tag == l_OffscreenComponent_0 or v330.tag == l_LegacyHiddenComponent_0 then
            local v342 = v330.memoizedState ~= nil;
            v246(v330, v342);
            return;
        end;
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
        return;
    end;
end;
commitSuspenseComponent = function(v344) --[[ Line: 2014 ]] --[[ Name: commitSuspenseComponent ]]
    -- upvalues: v96 (ref), l_supportsMutation_0 (copy), v246 (copy), l_enableSuspenseCallback_0 (copy), l_Object_0 (copy), l_console_0 (copy)
    local l_memoizedState_2 = v344.memoizedState;
    if l_memoizedState_2 ~= nil then
        if not v96 then
            v96 = require(script.Parent["ReactFiberWorkLoop.new"]);
        end;
        v96.markCommitTimeOfFallback();
        if l_supportsMutation_0 then
            local l_child_5 = v344.child;
            v246(l_child_5, true);
        end;
    end;
    if l_enableSuspenseCallback_0 and l_memoizedState_2 ~= nil then
        local l_suspenseCallback_0 = v344.memoizedProps.suspenseCallback;
        if typeof(l_suspenseCallback_0) == "function" then
            local l_updateQueue_6 = v344.updateQueue;
            if l_updateQueue_6 ~= nil then
                l_suspenseCallback_0(l_Object_0.assign({}, l_updateQueue_6));
                return;
            end;
        elseif _G.__DEV__ and l_suspenseCallback_0 ~= nil then
            l_console_0.error("Unexpected type for suspenseCallback: %s", (tostring(l_suspenseCallback_0)));
        end;
    end;
end;
commitSuspenseHydrationCallbacks = function(v349, v350) --[[ Line: 2050 ]] --[[ Name: commitSuspenseHydrationCallbacks ]]
    -- upvalues: l_supportsHydration_0 (copy), l_commitHydratedSuspenseInstance_0 (copy), l_enableSuspenseCallback_0 (copy)
    if not l_supportsHydration_0 then
        return;
    else
        if v350.memoizedState == nil then
            local l_alternate_5 = v350.alternate;
            if l_alternate_5 ~= nil then
                local l_memoizedState_3 = l_alternate_5.memoizedState;
                if l_memoizedState_3 ~= nil then
                    local l_dehydrated_0 = l_memoizedState_3.dehydrated;
                    if l_dehydrated_0 ~= nil then
                        l_commitHydratedSuspenseInstance_0(l_dehydrated_0);
                        if l_enableSuspenseCallback_0 then
                            local l_hydrationCallbacks_0 = v349.hydrationCallbacks;
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
attachSuspenseRetryListeners = function(v356) --[[ Line: 2081 ]] --[[ Name: attachSuspenseRetryListeners ]]
    -- upvalues: l_Set_0 (copy), v99 (copy), l_enableSchedulerTracing_0 (copy), l_unstable_wrap_0 (copy)
    local l_updateQueue_7 = v356.updateQueue;
    if l_updateQueue_7 ~= nil then
        v356.updateQueue = nil;
        local l_stateNode_15 = v356.stateNode;
        if l_stateNode_15 == nil then
            v356.stateNode = l_Set_0.new();
            l_stateNode_15 = v356.stateNode;
        end;
        for v359, _ in pairs(l_updateQueue_7) do
            local function v361() --[[ Line: 2095 ]]
                -- upvalues: v99 (ref), v356 (copy), v359 (copy)
                return v99(v356, v359);
            end;
            do
                local l_v361_0 = v361;
                if not l_stateNode_15:has(v359) then
                    if l_enableSchedulerTracing_0 and v359.__reactDoNotTraceInteractions ~= true then
                        l_v361_0 = l_unstable_wrap_0(l_v361_0);
                    end;
                    l_stateNode_15:add(v359);
                    v359:andThen(function() --[[ Line: 2107 ]]
                        -- upvalues: l_v361_0 (ref)
                        return l_v361_0();
                    end, function() --[[ Line: 2110 ]]
                        -- upvalues: l_v361_0 (ref)
                        return l_v361_0();
                    end);
                end;
            end;
        end;
    end;
end;
isSuspenseBoundaryBeingHidden = function(v363, v364) --[[ Line: 2122 ]] --[[ Name: isSuspenseBoundaryBeingHidden ]]
    if v363 ~= nil then
        local l_memoizedState_4 = v363.memoizedState;
        if l_memoizedState_4 == nil or l_memoizedState_4.dehydrated ~= nil then
            local l_memoizedState_5 = v364.memoizedState;
            local v367 = false;
            if l_memoizedState_5 ~= nil then
                v367 = l_memoizedState_5.dehydrated == nil;
            end;
            return v367;
        end;
    end;
    return false;
end;
commitResetTextContent = function(v368) --[[ Line: 2137 ]] --[[ Name: commitResetTextContent ]]
    -- upvalues: l_supportsMutation_0 (copy), l_resetTextContent_0 (copy)
    if not l_supportsMutation_0 then
        return;
    else
        l_resetTextContent_0(v368.stateNode);
        return;
    end;
end;
local function v370(v369) --[[ Line: 2144 ]] --[[ Name: commitPassiveUnmount ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v163 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_recordPassiveEffectDuration_0 (copy)
    if v369.tag == l_FunctionComponent_0 or v369.tag == l_ForwardRef_0 or v369.tag == l_SimpleMemoComponent_0 or v369.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v369.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v163(bit32.bor(l_Passive_0, l_HasEffect_0), v369, v369.return_);
            l_recordPassiveEffectDuration_0(v369);
            return;
        else
            v163(bit32.bor(l_Passive_0, l_HasEffect_0), v369, v369.return_);
        end;
    end;
end;
local function v373(v371, v372) --[[ Line: 2173 ]] --[[ Name: commitPassiveUnmountInsideDeletedTree ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v163 (copy), l_Passive_0 (copy), l_recordPassiveEffectDuration_0 (copy)
    if v371.tag == l_FunctionComponent_0 or v371.tag == l_ForwardRef_0 or v371.tag == l_SimpleMemoComponent_0 or v371.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v371.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v163(l_Passive_0, v371, v372);
            l_recordPassiveEffectDuration_0(v371);
            return;
        else
            v163(l_Passive_0, v371, v372);
        end;
    end;
end;
local function v378(v374, v375) --[[ Line: 2205 ]] --[[ Name: commitPassiveMount ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v172 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_recordPassiveEffectDuration_0 (copy), l_Profiler_0 (copy)
    if v375.tag == l_FunctionComponent_0 or v375.tag == l_ForwardRef_0 or v375.tag == l_SimpleMemoComponent_0 or v375.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v375.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            local l_status_16, l_result_16 = pcall(v172, bit32.bor(l_Passive_0, l_HasEffect_0), v375);
            l_recordPassiveEffectDuration_0(v375);
            if not l_status_16 then
                error(l_result_16);
                return;
            end;
        else
            v172(bit32.bor(l_Passive_0, l_HasEffect_0), v375);
            return;
        end;
    elseif v375.tag == l_Profiler_0 then
        commitProfilerPassiveEffect(v374, v375);
    end;
end;
invokeLayoutEffectMountInDEV = function(v379) --[[ Line: 2236 ]] --[[ Name: invokeLayoutEffectMountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v172 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v105 (ref), l_ClassComponent_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        if v379.tag == l_FunctionComponent_0 or v379.tag == l_ForwardRef_0 or v379.tag == l_SimpleMemoComponent_0 or v379.tag == l_Block_0 then
            l_invokeGuardedCallback_0(nil, v172, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v379);
            if l_hasCaughtError_0() then
                local v380 = l_clearCaughtError_0();
                v105(v379, v379.return_, v380);
            end;
            return;
        end;
    elseif v379.tag == l_ClassComponent_0 then
        local l_stateNode_16 = v379.stateNode;
        l_invokeGuardedCallback_0(nil, l_stateNode_16.componentDidMount, l_stateNode_16);
        if l_hasCaughtError_0() then
            local v382 = l_clearCaughtError_0();
            v105(v379, v379.return_, v382);
        end;
        return;
    end;
end;
invokePassiveEffectMountInDEV = function(v383) --[[ Line: 2267 ]] --[[ Name: invokePassiveEffectMountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v172 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v105 (ref)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 and (v383.tag == l_FunctionComponent_0 or v383.tag == l_ForwardRef_0 or v383.tag == l_SimpleMemoComponent_0 or v383.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v172, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v383);
        if l_hasCaughtError_0() then
            local v384 = l_clearCaughtError_0();
            v105(v383, v383.return_, v384);
        end;
        return;
    else
        return;
    end;
end;
invokeLayoutEffectUnmountInDEV = function(v385) --[[ Line: 2290 ]] --[[ Name: invokeLayoutEffectUnmountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v163 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v105 (ref), l_ClassComponent_0 (copy)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 then
        if v385.tag == l_FunctionComponent_0 or v385.tag == l_ForwardRef_0 or v385.tag == l_SimpleMemoComponent_0 or v385.tag == l_Block_0 then
            l_invokeGuardedCallback_0(nil, v163, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v385, v385.return_);
            if l_hasCaughtError_0() then
                local v386 = l_clearCaughtError_0();
                v105(v385, v385.return_, v386);
            end;
            return;
        end;
    elseif v385.tag == l_ClassComponent_0 then
        local l_stateNode_17 = v385.stateNode;
        if typeof(l_stateNode_17.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v385, l_stateNode_17, v385.return_);
        end;
        return;
    end;
end;
invokePassiveEffectUnmountInDEV = function(v388) --[[ Line: 2319 ]] --[[ Name: invokePassiveEffectUnmountInDEV ]]
    -- upvalues: l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v163 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v105 (ref)
    if _G.__DEV__ and l_enableDoubleInvokingEffects_0 and (v388.tag == l_FunctionComponent_0 or v388.tag == l_ForwardRef_0 or v388.tag == l_SimpleMemoComponent_0 or v388.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v163, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v388, v388.return_);
        if l_hasCaughtError_0() then
            local v389 = l_clearCaughtError_0();
            v105(v388, v388.return_, v389);
        end;
        return;
    else
        return;
    end;
end;
return {
    safelyCallDestroy = v144, 
    commitBeforeMutationLifeCycles = v152, 
    commitResetTextContent = commitResetTextContent, 
    commitPlacement = v295, 
    commitDeletion = v328, 
    commitWork = v343, 
    commitAttachRef = commitAttachRef, 
    commitDetachRef = commitDetachRef, 
    commitPassiveUnmount = v370, 
    commitPassiveUnmountInsideDeletedTree = v373, 
    commitPassiveMount = v378, 
    invokeLayoutEffectMountInDEV = invokeLayoutEffectMountInDEV, 
    invokeLayoutEffectUnmountInDEV = invokeLayoutEffectUnmountInDEV, 
    invokePassiveEffectMountInDEV = invokePassiveEffectMountInDEV, 
    invokePassiveEffectUnmountInDEV = invokePassiveEffectUnmountInDEV, 
    isSuspenseBoundaryBeingHidden = isSuspenseBoundaryBeingHidden, 
    recursivelyCommitLayoutEffects = v179
};