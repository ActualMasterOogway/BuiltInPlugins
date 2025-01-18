local function v1(v0) --[[ Line: 11 ]] --[[ Name: unimplemented ]]
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
    print("UNIMPLEMENTED ERROR: " .. tostring(v0));
    error("FIXME (roblox): " .. v0 .. " is unimplemented", 2);
end;
local l___DEV___0 = _G.__DEV__;
local l___YOLO___0 = _G.__YOLO__;
local v4 = 0;
local function _(v5) --[[ Line: 27 ]] --[[ Name: isCallable ]]
    if typeof(v5) == "function" then
        return true;
    else
        if typeof(v5) == "table" then
            local v6 = getmetatable(v5);
            if v6 and rawget(v6, "__call") then
                return true;
            elseif v5._isMockFunction then
                return true;
            end;
        end;
        return false;
    end;
end;
local l_Parent_0 = script.Parent.Parent;
local l_console_0 = require(l_Parent_0.Shared).console;
local v10 = require(l_Parent_0.LuauPolyfill);
local l_Error_0 = v10.Error;
local l_Set_0 = v10.Set;
local v13 = require(script.Parent.ReactFiberHostConfig);
local _ = require(script.Parent.ReactInternalTypes);
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"]);
local v16 = require(script.Parent["ReactUpdateQueue.new"]);
local _ = require(l_Parent_0.Shared);
local _ = require(script.Parent.ReactFiberOffscreenComponent);
local v19 = require(script.Parent.ReactHookEffectTags);
local l_unstable_wrap_0 = require(l_Parent_0.Scheduler).tracing.unstable_wrap;
local l_ReactFeatureFlags_0 = require(l_Parent_0.Shared).ReactFeatureFlags;
local l_enableSchedulerTracing_0 = l_ReactFeatureFlags_0.enableSchedulerTracing;
local l_enableProfilerTimer_0 = l_ReactFeatureFlags_0.enableProfilerTimer;
local l_enableProfilerCommitHooks_0 = l_ReactFeatureFlags_0.enableProfilerCommitHooks;
local l_enableSuspenseCallback_0 = l_ReactFeatureFlags_0.enableSuspenseCallback;
local l_enableDoubleInvokingEffects_0 = l_ReactFeatureFlags_0.enableDoubleInvokingEffects;
local v27 = require(script.Parent.ReactWorkTags);
local l_FunctionComponent_0 = v27.FunctionComponent;
local l_ForwardRef_0 = v27.ForwardRef;
local l_ClassComponent_0 = v27.ClassComponent;
local l_HostRoot_0 = v27.HostRoot;
local l_HostComponent_0 = v27.HostComponent;
local l_HostText_0 = v27.HostText;
local l_HostPortal_0 = v27.HostPortal;
local l_Profiler_0 = v27.Profiler;
local l_SuspenseComponent_0 = v27.SuspenseComponent;
local l_DehydratedFragment_0 = v27.DehydratedFragment;
local l_IncompleteClassComponent_0 = v27.IncompleteClassComponent;
local l_MemoComponent_0 = v27.MemoComponent;
local l_SimpleMemoComponent_0 = v27.SimpleMemoComponent;
local l_SuspenseListComponent_0 = v27.SuspenseListComponent;
local l_FundamentalComponent_0 = v27.FundamentalComponent;
local l_ScopeComponent_0 = v27.ScopeComponent;
local l_Block_0 = v27.Block;
local l_OffscreenComponent_0 = v27.OffscreenComponent;
local l_LegacyHiddenComponent_0 = v27.LegacyHiddenComponent;
local l_ReactErrorUtils_0 = require(l_Parent_0.Shared).ReactErrorUtils;
local l_invokeGuardedCallback_0 = l_ReactErrorUtils_0.invokeGuardedCallback;
local l_hasCaughtError_0 = l_ReactErrorUtils_0.hasCaughtError;
local l_clearCaughtError_0 = l_ReactErrorUtils_0.clearCaughtError;
local v51 = require(script.Parent.ReactFiberFlags);
local l_NoFlags_0 = v51.NoFlags;
local l_ContentReset_0 = v51.ContentReset;
local l_Placement_0 = v51.Placement;
local l_Snapshot_0 = v51.Snapshot;
local l_Update_0 = v51.Update;
local l_Callback_0 = v51.Callback;
local l_LayoutMask_0 = v51.LayoutMask;
local l_PassiveMask_0 = v51.PassiveMask;
local l_Ref_0 = v51.Ref;
local l_getComponentName_0 = require(l_Parent_0.Shared).getComponentName;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local v64 = require(script.Parent.ReactCurrentFiber);
local l_current_0 = v64.current;
local l_resetCurrentFiber_0 = v64.resetCurrentFiber;
local l_setCurrentFiber_0 = v64.setCurrentFiber;
local l_onCommitUnmount_0 = require(script.Parent["ReactFiberDevToolsHook.new"]).onCommitUnmount;
local l_resolveDefaultProps_0 = require(script.Parent["ReactFiberLazyComponent.new"]).resolveDefaultProps;
local v70 = require(script.Parent["ReactProfilerTimer.new"]);
local l_startLayoutEffectTimer_0 = v70.startLayoutEffectTimer;
local l_recordPassiveEffectDuration_0 = v70.recordPassiveEffectDuration;
local l_recordLayoutEffectDuration_0 = v70.recordLayoutEffectDuration;
local l_startPassiveEffectTimer_0 = v70.startPassiveEffectTimer;
local l_getCommitTime_0 = v70.getCommitTime;
local l_ProfileMode_0 = require(script.Parent.ReactTypeOfMode).ProfileMode;
local l_commitUpdateQueue_0 = v16.commitUpdateQueue;
local l_getPublicInstance_0 = v13.getPublicInstance;
local l_supportsMutation_0 = v13.supportsMutation;
local l_supportsPersistence_0 = v13.supportsPersistence;
local l_supportsHydration_0 = v13.supportsHydration;
local l_commitMount_0 = v13.commitMount;
local l_commitUpdate_0 = v13.commitUpdate;
local l_resetTextContent_0 = v13.resetTextContent;
local l_commitTextUpdate_0 = v13.commitTextUpdate;
local l_appendChild_0 = v13.appendChild;
local l_appendChildToContainer_0 = v13.appendChildToContainer;
local l_insertBefore_0 = v13.insertBefore;
local l_insertInContainerBefore_0 = v13.insertInContainerBefore;
local l_removeChild_0 = v13.removeChild;
local l_removeChildFromContainer_0 = v13.removeChildFromContainer;
local l_hideInstance_0 = v13.hideInstance;
local l_hideTextInstance_0 = v13.hideTextInstance;
local l_unhideInstance_0 = v13.unhideInstance;
local l_unhideTextInstance_0 = v13.unhideTextInstance;
local l_commitHydratedSuspenseInstance_0 = v13.commitHydratedSuspenseInstance;
local l_clearContainer_0 = v13.clearContainer;
local v98 = nil;
local function v101(v99, v100) --[[ Line: 193 ]] --[[ Name: resolveRetryWakeable ]]
    -- upvalues: v98 (ref)
    if not v98 then
        v98 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v98.resolveRetryWakeable(v99, v100);
end;
local function _() --[[ Line: 200 ]] --[[ Name: markCommitTimeOfFallback ]]
    -- upvalues: v98 (ref)
    if not v98 then
        v98 = require(script.Parent["ReactFiberWorkLoop.new"]);
    end;
    v98.markCommitTimeOfFallback();
end;
local function v103() --[[ Line: 208 ]] --[[ Name: schedulePassiveEffectCallback ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("ReactFiberCommitWork: schedulePassiveEffectCallback causes a dependency cycle\n" .. debug.traceback());
end;
local function v107(_, _, v106) --[[ Line: 216 ]] --[[ Name: captureCommitPhaseError ]]
    -- upvalues: l_console_0 (copy)
    l_console_0.warn("ReactFiberCommitWork: captureCommitPhaseError causes a dependency cycle");
    error(v106);
end;
local l_NoFlags_1 = v19.NoFlags;
local l_HasEffect_0 = v19.HasEffect;
local l_Layout_0 = v19.Layout;
local l_Passive_0 = v19.Passive;
local v112 = nil;
local function v113() --[[ Line: 234 ]]
    -- upvalues: v112 (ref)
    if not v112 then
        v112 = require(script.Parent["ReactFiberBeginWork.new"]).didWarnAboutReassigningProps;
    end;
    return v112;
end;
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
local v124 = nil;
local function v129(v125, v126) --[[ Line: 259 ]] --[[ Name: callComponentWillUnmountWithTimer ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_describeError_0 (copy), l_recordLayoutEffectDuration_0 (copy)
    v126.props = v125.memoizedProps;
    v126.state = v125.memoizedState;
    if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v125.mode, l_ProfileMode_0) ~= 0 then
        local v127, v128 = xpcall(function() --[[ Line: 268 ]]
            -- upvalues: l_startLayoutEffectTimer_0 (ref), v126 (copy)
            l_startLayoutEffectTimer_0();
            v126:componentWillUnmount();
        end, l_describeError_0);
        l_recordLayoutEffectDuration_0(v125);
        if not v127 then
            error(v128);
            return;
        end;
    else
        v126:componentWillUnmount();
    end;
end;
safelyCallComponentWillUnmount = function(v130, v131, v132) --[[ Line: 286 ]] --[[ Name: safelyCallComponentWillUnmount ]]
    -- upvalues: v129 (copy), l_describeError_0 (copy), v107 (ref)
    local v133, v134 = xpcall(v129, l_describeError_0, v130, v131);
    if not v133 then
        v107(v130, v132, v134);
    end;
end;
local function _(v135, v136) --[[ Line: 300 ]] --[[ Name: safelyDetachRef ]]
    -- upvalues: l_describeError_0 (copy), v107 (ref)
    local l_ref_0 = v135.ref;
    if l_ref_0 ~= nil then
        if typeof(l_ref_0) == "function" then
            local v138, v139 = xpcall(l_ref_0, l_describeError_0);
            if not v138 then
                v107(v135, v136, v139);
                return;
            end;
        else
            l_ref_0.current = nil;
        end;
    end;
end;
local function v146(v141, v142, v143) --[[ Line: 316 ]] --[[ Name: safelyCallDestroy ]]
    -- upvalues: l_describeError_0 (copy), v107 (ref)
    local v144, v145 = xpcall(v143, l_describeError_0);
    if not v144 then
        v107(v141, v142, v145);
    end;
end;
local function v154(v147, v148) --[[ Line: 328 ]] --[[ Name: commitBeforeMutationLifeCycles ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_ClassComponent_0 (copy), l_Snapshot_0 (copy), l___DEV___0 (copy), v113 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_resolveDefaultProps_0 (copy), l_HostRoot_0 (copy), l_supportsMutation_0 (copy), l_clearContainer_0 (copy), l_HostComponent_0 (copy), l_HostText_0 (copy), l_HostPortal_0 (copy), l_IncompleteClassComponent_0 (copy), l_invariant_0 (copy)
    if v148.tag == l_FunctionComponent_0 or v148.tag == l_ForwardRef_0 or v148.tag == l_SimpleMemoComponent_0 or v148.tag == l_Block_0 then
        return;
    elseif v148.tag == l_ClassComponent_0 then
        if bit32.band(v148.flags, l_Snapshot_0) ~= 0 and v147 ~= nil then
            local l_memoizedProps_0 = v147.memoizedProps;
            local l_memoizedState_0 = v147.memoizedState;
            local l_stateNode_0 = v148.stateNode;
            if l___DEV___0 and v148.type == v148.elementType and not v113 then
                if l_stateNode_0.props ~= v148.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "getSnapshotBeforeUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v148.type) or "instance");
                end;
                if l_stateNode_0.state ~= v148.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "getSnapshotBeforeUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v148.type) or "instance");
                end;
            end;
            local v152 = l_stateNode_0:getSnapshotBeforeUpdate(v148.elementType == v148.type and l_memoizedProps_0 or l_resolveDefaultProps_0(v148.type, l_memoizedProps_0), l_memoizedState_0);
            if l___DEV___0 then

            end;
            l_stateNode_0.__reactInternalSnapshotBeforeUpdate = v152;
        end;
        return;
    elseif v148.tag == l_HostRoot_0 then
        if l_supportsMutation_0 and bit32.band(v148.flags, l_Snapshot_0) ~= 0 then
            local l_stateNode_1 = v148.stateNode;
            l_clearContainer_0(l_stateNode_1.containerInfo);
        end;
        return;
    elseif v148.tag == l_HostComponent_0 or v148.tag == l_HostText_0 or v148.tag == l_HostPortal_0 or v148.tag == l_IncompleteClassComponent_0 then
        return;
    else
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
        return;
    end;
end;
local function v165(v155, v156, v157) --[[ Line: 421 ]] --[[ Name: commitHookEffectListUnmount ]]
    -- upvalues: l_describeError_0 (copy), v107 (ref)
    local l_updateQueue_0 = v156.updateQueue;
    local v159 = nil;
    if l_updateQueue_0 ~= nil then
        v159 = l_updateQueue_0.lastEffect;
    end;
    if v159 ~= nil then
        local l_next_0 = v159.next;
        local l_l_next_0_0 = l_next_0;
        repeat
            if bit32.band(l_l_next_0_0.tag, v155) == v155 then
                local l_destroy_0 = l_l_next_0_0.destroy;
                l_l_next_0_0.destroy = nil;
                if l_destroy_0 ~= nil then
                    local v163, v164 = xpcall(l_destroy_0, l_describeError_0);
                    if not v163 then
                        v107(v156, v157, v164);
                    end;
                end;
            end;
            l_l_next_0_0 = l_l_next_0_0.next;
        until l_l_next_0_0 == l_next_0;
    end;
end;
local function v174(v166, v167) --[[ Line: 449 ]] --[[ Name: commitHookEffectListMount ]]
    -- upvalues: l___DEV___0 (copy), l_console_0 (copy)
    local l_updateQueue_1 = v167.updateQueue;
    local v169 = if l_updateQueue_1 ~= nil then l_updateQueue_1.lastEffect else nil;
    if v169 ~= nil then
        local l_next_1 = v169.next;
        local l_l_next_1_0 = l_next_1;
        repeat
            if bit32.band(l_l_next_1_0.tag, v166) == v166 then
                l_l_next_1_0.destroy = l_l_next_1_0.create();
                if l___DEV___0 then
                    local l_destroy_1 = l_l_next_1_0.destroy;
                    if l_destroy_1 ~= nil and typeof(l_destroy_1) ~= "function" then
                        local v173 = nil;
                        v173 = if l_destroy_1 == nil then " You returned nil. If your effect does not require clean " .. "up, return nil (or nothing)." else if typeof(l_destroy_1.andThen) == "function" then "\n\nIt looks like you wrote useEffect(Promise.new(function() --[[...]] end) or returned a Promise. " .. "Instead, write the async function inside your effect " .. "and call it immediately:\n\n" .. "useEffect(function()\n" .. "  function fetchData()\n" .. "    -- You can await here\n" .. "    local response = MyAPI.getData(someId):await()\n" .. "    -- ...\n" .. "  end\n" .. "  fetchData()\n" .. "end, {someId}) -- Or {} if effect doesn't need props or state\n\n" .. "Learn more about data fetching with Hooks: https://reactjs.org/link/hooks-data-fetching" else " You returned: " .. l_destroy_1;
                        l_console_0.error("An effect function must not return anything besides a function, " .. "which is used for clean-up.%s", v173);
                    end;
                end;
            end;
            l_l_next_1_0 = l_l_next_1_0.next;
        until l_l_next_1_0 == l_next_1;
    end;
end;
commitProfilerPassiveEffect = function(v175, v176) --[[ Line: 489 ]] --[[ Name: commitProfilerPassiveEffect ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_Profiler_0 (copy), l_getCommitTime_0 (copy), l_enableSchedulerTracing_0 (copy)
    if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and v176.tag == l_Profiler_0 then
        local l_passiveEffectDuration_0 = v176.stateNode.passiveEffectDuration;
        local l_id_0 = v176.memoizedProps.id;
        local l_onPostCommit_0 = v176.memoizedProps.onPostCommit;
        local v180 = l_getCommitTime_0();
        if typeof(l_onPostCommit_0) == "function" then
            if l_enableSchedulerTracing_0 then
                l_onPostCommit_0(l_id_0, v176.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v180, v175.memoizedInteractions);
                return;
            else
                l_onPostCommit_0(l_id_0, v176.alternate == nil and "mount" or "update", l_passiveEffectDuration_0, v180);
            end;
        end;
    end;
end;
local function v181(v182, v183, v184, v185) --[[ Line: 522 ]] --[[ Name: recursivelyCommitLayoutEffects ]]
    -- upvalues: v107 (ref), v103 (ref), l_Profiler_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), v124 (ref), l_LayoutMask_0 (copy), l_NoFlags_0 (copy), l___DEV___0 (copy), l_current_0 (copy), l_setCurrentFiber_0 (copy), l_invokeGuardedCallback_0 (copy), v181 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), l_resetCurrentFiber_0 (copy), l_describeError_0 (copy), l_Update_0 (copy), l_Callback_0 (copy), v64 (copy), v4 (ref), l___YOLO___0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v174 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_PassiveMask_0 (copy), l_ClassComponent_0 (copy), v120 (ref), l_HostRoot_0 (copy), v118 (ref), l_HostComponent_0 (copy), v119 (ref), l_SuspenseComponent_0 (copy), l_FundamentalComponent_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), l_IncompleteClassComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), l_OffscreenComponent_0 (copy), l_ScopeComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_invariant_0 (copy), l_Ref_0 (copy)
    if v184 ~= nil then
        v107 = v184;
    end;
    if v185 ~= nil then
        v103 = v185;
    end;
    local l_flags_0 = v182.flags;
    local l_tag_0 = v182.tag;
    if l_tag_0 == l_Profiler_0 then
        local v188 = nil;
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 then
            v188 = v124;
            v124 = v182;
        end;
        local l_child_0 = v182.child;
        while l_child_0 ~= nil do
            if bit32.band(v182.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if l___DEV___0 then
                    local l_l_current_0_0 = l_current_0;
                    l_setCurrentFiber_0(l_child_0);
                    l_invokeGuardedCallback_0(nil, v181, nil, l_child_0, v183, v107, v103);
                    if l_hasCaughtError_0() then
                        local v191 = l_clearCaughtError_0();
                        v107(l_child_0, v182, v191);
                    end;
                    if l_l_current_0_0 ~= nil then
                        l_setCurrentFiber_0(l_l_current_0_0);
                    else
                        l_resetCurrentFiber_0();
                    end;
                else
                    local v192, v193 = xpcall(v181, l_describeError_0, l_child_0, v183, v107, v103);
                    if not v192 then
                        v107(l_child_0, v182, v193);
                    end;
                end;
            end;
            l_child_0 = l_child_0.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 and l_enableProfilerTimer_0 then
            if l___DEV___0 then
                local l_l_current_0_1 = l_current_0;
                l_setCurrentFiber_0(v182);
                l_invokeGuardedCallback_0(nil, commitLayoutEffectsForProfiler, nil, v182, v183);
                if l_hasCaughtError_0() then
                    local v195 = l_clearCaughtError_0();
                    v107(v182, v182.return_, v195);
                end;
                if l_l_current_0_1 ~= nil then
                    l_setCurrentFiber_0(l_l_current_0_1);
                else
                    l_resetCurrentFiber_0();
                end;
            else
                local v196, v197 = xpcall(commitLayoutEffectsForProfiler, l_describeError_0, v182, v183);
                if not v196 then
                    v107(v182, v182.return_, v197);
                end;
            end;
        end;
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 then
            if v188 ~= nil then
                local l_stateNode_2 = v188.stateNode;
                l_stateNode_2.effectDuration = l_stateNode_2.effectDuration + v182.stateNode.effectDuration;
            end;
            v124 = v188;
            return;
        end;
    else
        local l_child_1 = v182.child;
        while l_child_1 ~= nil do
            if bit32.band(v182.subtreeFlags, l_LayoutMask_0) ~= l_NoFlags_0 then
                if l___DEV___0 then
                    local l_current_1 = v64.current;
                    l_setCurrentFiber_0(l_child_1);
                    if v4 < 20 then
                        v4 = v4 + 1;
                        l_invokeGuardedCallback_0(nil, v181, nil, l_child_1, v183, v107, v103);
                        v4 = v4 - 1;
                        if l_hasCaughtError_0() then
                            local v201 = l_clearCaughtError_0();
                            v107(l_child_1, v182, v201);
                        end;
                    else
                        v181(l_child_1, v183, v107, v103);
                    end;
                    if l_current_1 ~= nil then
                        l_setCurrentFiber_0(l_current_1);
                    else
                        l_resetCurrentFiber_0();
                    end;
                else
                    local v202 = nil;
                    local v203 = nil;
                    if not l___YOLO___0 and v4 < 20 then
                        v4 = v4 + 1;
                        local v204, v205 = xpcall(v181, l_describeError_0, l_child_1, v183, v107, v103);
                        v202 = v204;
                        v203 = v205;
                        v4 = v4 - 1;
                    else
                        v202 = true;
                        v181(l_child_1, v183, v107, v103);
                    end;
                    if not v202 then
                        v107(l_child_1, v182, v203);
                    end;
                end;
            end;
            l_child_1 = l_child_1.sibling;
        end;
        if bit32.band(l_flags_0, (bit32.bor(l_Update_0, l_Callback_0))) ~= l_NoFlags_0 then
            if l_tag_0 == l_FunctionComponent_0 or l_tag_0 == l_ForwardRef_0 or l_tag_0 == l_SimpleMemoComponent_0 or l_tag_0 == l_Block_0 then
                if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v182.mode, l_ProfileMode_0) ~= 0 then
                    local v206, v207 = xpcall(function() --[[ Line: 744 ]]
                        -- upvalues: l_startLayoutEffectTimer_0 (ref), v174 (ref), l_Layout_0 (ref), l_HasEffect_0 (ref), v182 (copy)
                        l_startLayoutEffectTimer_0();
                        v174(bit32.bor(l_Layout_0, l_HasEffect_0), v182);
                    end, l_describeError_0);
                    l_recordLayoutEffectDuration_0(v182);
                    if not v206 then
                        error(v207);
                    end;
                else
                    v174(bit32.bor(l_Layout_0, l_HasEffect_0), v182);
                end;
                if bit32.band(v182.subtreeFlags, l_PassiveMask_0) ~= l_NoFlags_0 then
                    v103();
                end;
            elseif l_tag_0 == l_ClassComponent_0 then
                v120(v182);
            elseif l_tag_0 == l_HostRoot_0 then
                v118(v182);
            elseif l_tag_0 == l_HostComponent_0 then
                v119(v182);
            elseif l_tag_0 == l_SuspenseComponent_0 then
                commitSuspenseHydrationCallbacks(v183, v182);
            elseif l_tag_0 ~= l_FundamentalComponent_0 and l_tag_0 ~= l_HostPortal_0 and l_tag_0 ~= l_HostText_0 and l_tag_0 ~= l_IncompleteClassComponent_0 and l_tag_0 ~= l_LegacyHiddenComponent_0 and l_tag_0 ~= l_OffscreenComponent_0 and l_tag_0 ~= l_ScopeComponent_0 and l_tag_0 ~= l_SuspenseListComponent_0 then
                l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
            end;
        end;
        if bit32.band(l_flags_0, l_Ref_0) ~= 0 then
            commitAttachRef(v182);
        end;
    end;
end;
commitLayoutEffectsForProfiler = function(v208, v209) --[[ Line: 809 ]] --[[ Name: commitLayoutEffectsForProfiler ]]
    -- upvalues: l_enableProfilerTimer_0 (copy), l_getCommitTime_0 (copy), l_Update_0 (copy), l_Callback_0 (copy), l_NoFlags_0 (copy), l_enableSchedulerTracing_0 (copy), l_enableProfilerCommitHooks_0 (copy)
    local v210 = false;
    local v211 = false;
    if l_enableProfilerTimer_0 then
        local l_flags_1 = v208.flags;
        local l_alternate_0 = v208.alternate;
        local l_onCommit_0 = v208.memoizedProps.onCommit;
        local l_onRender_0 = v208.memoizedProps.onRender;
        local l_effectDuration_0 = v208.stateNode.effectDuration;
        local v217 = l_getCommitTime_0();
        local l_l_Update_0_0 = l_Update_0;
        local l_l_Callback_0_0 = l_Callback_0;
        if bit32.band(l_flags_1, l_l_Update_0_0) ~= l_NoFlags_0 then
            local v220;
            if typeof(l_onRender_0) == "function" then
                v220 = true;
            else
                if typeof(l_onRender_0) == "table" then
                    local v221 = getmetatable(l_onRender_0);
                    if v221 and rawget(v221, "__call") then
                        v220 = true;
                        v210 = true;
                    elseif l_onRender_0._isMockFunction then
                        v220 = true;
                        v210 = true;
                    end;
                end;
                if not v210 then
                    if not v210 then
                        v220 = false;
                    end;
                end;
            end;
            v210 = false;
            if v220 then
                if l_enableSchedulerTracing_0 then
                    l_onRender_0(v208.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v208.actualDuration, v208.treeBaseDuration, v208.actualStartTime, v217, v209.memoizedInteractions);
                else
                    l_onRender_0(v208.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", v208.actualDuration, v208.treeBaseDuration, v208.actualStartTime, v217);
                end;
            end;
        end;
        if l_enableProfilerCommitHooks_0 and bit32.band(l_flags_1, l_l_Callback_0_0) ~= l_NoFlags_0 then
            local v222;
            if typeof(l_onCommit_0) == "function" then
                v222 = true;
            else
                if typeof(l_onCommit_0) == "table" then
                    local v223 = getmetatable(l_onCommit_0);
                    if v223 and rawget(v223, "__call") then
                        v222 = true;
                        v211 = true;
                    elseif l_onCommit_0._isMockFunction then
                        v222 = true;
                        v211 = true;
                    end;
                end;
                if not v211 then
                    if not v211 then
                        v222 = false;
                    end;
                end;
            end;
            v211 = false;
            if v222 then
                if l_enableSchedulerTracing_0 then
                    l_onCommit_0(v208.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v217, v209.memoizedInteractions);
                    return;
                else
                    l_onCommit_0(v208.memoizedProps.id, l_alternate_0 == nil and "mount" or "update", l_effectDuration_0, v217);
                end;
            end;
        end;
    end;
end;
v120 = function(v224) --[[ Line: 877 ]] --[[ Name: commitLayoutEffectsForClassComponent ]]
    -- upvalues: l_Update_0 (copy), l___DEV___0 (copy), v113 (copy), l_console_0 (copy), l_getComponentName_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_describeError_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_resolveDefaultProps_0 (copy), l_commitUpdateQueue_0 (copy)
    local l_stateNode_3 = v224.stateNode;
    local l_alternate_1 = v224.alternate;
    if bit32.band(v224.flags, l_Update_0) ~= 0 then
        if l_alternate_1 == nil then
            if l___DEV___0 and v224.type == v224.elementType and not v113 then
                if l_stateNode_3.props ~= v224.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "componentDidMount. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v224.type) or "instance");
                end;
                if l_stateNode_3.state ~= v224.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "componentDidMount. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v224.type) or "instance");
                end;
            end;
            if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v224.mode, l_ProfileMode_0) ~= 0 then
                local v227, v228 = xpcall(function() --[[ Line: 917 ]]
                    -- upvalues: l_startLayoutEffectTimer_0 (ref), l_stateNode_3 (copy)
                    l_startLayoutEffectTimer_0();
                    l_stateNode_3:componentDidMount();
                end, l_describeError_0);
                l_recordLayoutEffectDuration_0(v224);
                if not v227 then
                    error(v228);
                end;
            else
                l_stateNode_3:componentDidMount();
            end;
        else
            local v229 = v224.elementType == v224.type and l_alternate_1.memoizedProps or l_resolveDefaultProps_0(v224.type, l_alternate_1.memoizedProps);
            local l_memoizedState_1 = l_alternate_1.memoizedState;
            if l___DEV___0 and v224.type == v224.elementType and not v113 then
                if l_stateNode_3.props ~= v224.memoizedProps then
                    l_console_0.error("Expected %s props to match memoized props before " .. "componentDidUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v224.type) or "instance");
                end;
                if l_stateNode_3.state ~= v224.memoizedState then
                    l_console_0.error("Expected %s state to match memoized state before " .. "componentDidUpdate. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v224.type) or "instance");
                end;
            end;
            if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v224.mode, l_ProfileMode_0) ~= 0 then
                local l_v229_0 = v229 --[[ copy: 3 -> 7 ]];
                local v232, v233 = xpcall(function() --[[ Line: 971 ]]
                    -- upvalues: l_startLayoutEffectTimer_0 (ref), l_stateNode_3 (copy), l_v229_0 (copy), l_memoizedState_1 (copy)
                    l_startLayoutEffectTimer_0();
                    l_stateNode_3:componentDidUpdate(l_v229_0, l_memoizedState_1, l_stateNode_3.__reactInternalSnapshotBeforeUpdate);
                end, l_describeError_0);
                l_recordLayoutEffectDuration_0(v224);
                if not v232 then
                    error(v233);
                end;
            else
                l_stateNode_3:componentDidUpdate(v229, l_memoizedState_1, l_stateNode_3.__reactInternalSnapshotBeforeUpdate);
            end;
        end;
    end;
    local l_updateQueue_2 = v224.updateQueue;
    if l_updateQueue_2 ~= nil then
        if l___DEV___0 and v224.type == v224.elementType and not v113 then
            if l_stateNode_3.props ~= v224.memoizedProps then
                l_console_0.error("Expected %s props to match memoized props before " .. "processing the update queue. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.props`. " .. "Please file an issue.", l_getComponentName_0(v224.type) or "instance");
            end;
            if l_stateNode_3.state ~= v224.memoizedState then
                l_console_0.error("Expected %s state to match memoized state before " .. "processing the update queue. " .. "This might either be because of a bug in React, or because " .. "a component reassigns its own `this.state`. " .. "Please file an issue.", l_getComponentName_0(v224.type) or "instance");
            end;
        end;
        l_commitUpdateQueue_0(v224, l_updateQueue_2, l_stateNode_3);
    end;
end;
v118 = function(v235) --[[ Line: 1034 ]] --[[ Name: commitLayoutEffectsForHostRoot ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy), l_ClassComponent_0 (copy), l_commitUpdateQueue_0 (copy)
    local l_updateQueue_3 = v235.updateQueue;
    if l_updateQueue_3 ~= nil then
        local v237 = nil;
        if v235.child ~= nil then
            local l_child_2 = v235.child;
            if l_child_2.tag == l_HostComponent_0 then
                v237 = l_getPublicInstance_0(l_child_2.stateNode);
            elseif l_child_2.tag == l_ClassComponent_0 then
                v237 = l_child_2.stateNode;
            end;
        end;
        l_commitUpdateQueue_0(v235, l_updateQueue_3, v237);
    end;
end;
v119 = function(v239) --[[ Line: 1053 ]] --[[ Name: commitLayoutEffectsForHostComponent ]]
    -- upvalues: l_Update_0 (copy), l_commitMount_0 (copy)
    local l_stateNode_4 = v239.stateNode;
    if v239.alternate == nil and bit32.band(v239.flags, l_Update_0) ~= 0 then
        local l_type_0 = v239.type;
        local l_memoizedProps_1 = v239.memoizedProps;
        l_commitMount_0(l_stateNode_4, l_type_0, l_memoizedProps_1, v239);
    end;
end;
local function v248(v243, v244) --[[ Line: 1068 ]] --[[ Name: hideOrUnhideAllChildren ]]
    -- upvalues: l_supportsMutation_0 (copy), l_HostComponent_0 (copy), l_hideInstance_0 (copy), l_unhideInstance_0 (copy), l_HostText_0 (copy), l_hideTextInstance_0 (copy), l_unhideTextInstance_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy)
    if l_supportsMutation_0 then
        local l_v243_0 = v243;
        while true do
            if l_v243_0.tag == l_HostComponent_0 then
                local l_stateNode_5 = l_v243_0.stateNode;
                if v244 then
                    l_hideInstance_0(l_stateNode_5);
                else
                    l_unhideInstance_0(l_v243_0.stateNode, l_v243_0.memoizedProps);
                end;
            elseif l_v243_0.tag == l_HostText_0 then
                local l_stateNode_6 = l_v243_0.stateNode;
                if v244 then
                    l_hideTextInstance_0(l_stateNode_6);
                else
                    l_unhideTextInstance_0(l_stateNode_6, l_v243_0.memoizedProps);
                end;
            elseif (l_v243_0.tag ~= l_OffscreenComponent_0 and l_v243_0.tag ~= l_LegacyHiddenComponent_0 or l_v243_0.memoizedState == nil or l_v243_0 == v243) and l_v243_0.child ~= nil then
                l_v243_0.child.return_ = l_v243_0;
                l_v243_0 = l_v243_0.child;
                continue;
            end;
            if l_v243_0 == v243 then
                return;
            else
                while true do
                    if l_v243_0.sibling == nil then
                        if l_v243_0.return_ == nil or l_v243_0.return_ == v243 then
                            return;
                        else
                            l_v243_0 = l_v243_0.return_;
                        end;
                    else
                        l_v243_0.sibling.return_ = l_v243_0.return_;
                        l_v243_0 = l_v243_0.sibling;
                        break;
                    end;
                end;
            end;
        end;
    else
        return;
    end;
end;
commitAttachRef = function(v249) --[[ Line: 1118 ]] --[[ Name: commitAttachRef ]]
    -- upvalues: l_HostComponent_0 (copy), l_getPublicInstance_0 (copy), l___DEV___0 (copy), l_console_0 (copy), l_getComponentName_0 (copy)
    local l_ref_1 = v249.ref;
    if l_ref_1 ~= nil then
        local l_stateNode_7 = v249.stateNode;
        local v252 = nil;
        v252 = if v249.tag == l_HostComponent_0 then l_getPublicInstance_0(l_stateNode_7) else l_stateNode_7;
        if typeof(l_ref_1) == "function" then
            l_ref_1(v252);
            return;
        elseif l___DEV___0 and typeof(l_ref_1) ~= "table" then
            l_console_0.error("Unexpected ref object provided for %s. " .. "Use either a ref-setter function or React.createRef().", l_getComponentName_0(v249.type) or "instance");
            return;
        else
            l_ref_1.current = v252;
        end;
    end;
end;
commitDetachRef = function(v253) --[[ Line: 1157 ]] --[[ Name: commitDetachRef ]]
    local l_ref_2 = v253.ref;
    if l_ref_2 ~= nil then
        if typeof(l_ref_2) == "function" then
            l_ref_2(nil);
            return;
        else
            l_ref_2.current = nil;
        end;
    end;
end;
v123 = function(v255, v256, v257, v258) --[[ Line: 1171 ]] --[[ Name: commitUnmount ]]
    -- upvalues: l_onCommitUnmount_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_Layout_0 (copy), l_NoFlags_1 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), l_describeError_0 (copy), v107 (ref), l_recordLayoutEffectDuration_0 (copy), l_ClassComponent_0 (copy), l_HostComponent_0 (copy), l_HostPortal_0 (copy), l_supportsMutation_0 (copy), v121 (ref), l_supportsPersistence_0 (copy), v1 (copy)
    l_onCommitUnmount_0(v256);
    if v256.tag == l_FunctionComponent_0 or v256.tag == l_ForwardRef_0 or v256.tag == l_MemoComponent_0 or v256.tag == l_SimpleMemoComponent_0 or v256.tag == l_Block_0 then
        local l_updateQueue_4 = v256.updateQueue;
        if l_updateQueue_4 ~= nil then
            local l_lastEffect_0 = l_updateQueue_4.lastEffect;
            if l_lastEffect_0 ~= nil then
                local l_next_2 = l_lastEffect_0.next;
                local l_l_next_2_0 = l_next_2;
                repeat
                    if l_l_next_2_0.destroy ~= nil and bit32.band(l_l_next_2_0.tag, l_Layout_0) ~= l_NoFlags_1 then
                        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v256.mode, l_ProfileMode_0) ~= 0 then
                            l_startLayoutEffectTimer_0();
                            local l_destroy_2 = l_l_next_2_0.destroy;
                            local v264, v265 = xpcall(l_destroy_2, l_describeError_0);
                            if not v264 then
                                v107(v256, v257, v265);
                            end;
                            l_recordLayoutEffectDuration_0(v256);
                        else
                            local l_destroy_3 = l_l_next_2_0.destroy;
                            local v267, v268 = xpcall(l_destroy_3, l_describeError_0);
                            if not v267 then
                                v107(v256, v257, v268);
                            end;
                        end;
                    end;
                    l_l_next_2_0 = l_l_next_2_0.next;
                until l_l_next_2_0 == l_next_2;
            end;
        end;
        return;
    elseif v256.tag == l_ClassComponent_0 then
        local l_ref_3 = v256.ref;
        if l_ref_3 ~= nil then
            if typeof(l_ref_3) == "function" then
                local v270, v271 = xpcall(l_ref_3, l_describeError_0);
                if not v270 then
                    v107(v256, v257, v271);
                end;
            else
                l_ref_3.current = nil;
            end;
        end;
        l_ref_3 = v256.stateNode;
        if typeof(l_ref_3.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v256, l_ref_3, v257);
        end;
        return;
    elseif v256.tag == l_HostComponent_0 then
        local l_ref_4 = v256.ref;
        if l_ref_4 ~= nil then
            if typeof(l_ref_4) == "function" then
                local v273, v274 = xpcall(l_ref_4, l_describeError_0);
                if not v273 then
                    v107(v256, v257, v274);
                    return;
                end;
            else
                l_ref_4.current = nil;
            end;
        end;
        return;
    elseif v256.tag == l_HostPortal_0 then
        if l_supportsMutation_0 then
            v121(v255, v256, v257, v258);
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
v122 = function(v275, v276, v277, v278) --[[ Line: 1278 ]] --[[ Name: commitNestedUnmounts ]]
    -- upvalues: v123 (ref), l_supportsMutation_0 (copy), l_HostPortal_0 (copy)
    local l_v276_0 = v276;
    while true do
        v123(v275, l_v276_0, v277, v278);
        if l_v276_0.child ~= nil and (not l_supportsMutation_0 or l_v276_0.tag ~= l_HostPortal_0) then
            l_v276_0.child.return_ = l_v276_0;
            l_v276_0 = l_v276_0.child;
            continue;
        end;
        if l_v276_0 == v276 then
            return;
        else
            while true do
                if l_v276_0.sibling == nil then
                    if l_v276_0.return_ == nil or l_v276_0.return_ == v276 then
                        return;
                    else
                        l_v276_0 = l_v276_0.return_;
                    end;
                else
                    l_v276_0.sibling.return_ = l_v276_0.return_;
                    l_v276_0 = l_v276_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function _(v280) --[[ Line: 1318 ]] --[[ Name: detachFiberMutation ]]
    local l_alternate_2 = v280.alternate;
    if l_alternate_2 ~= nil then
        l_alternate_2.return_ = nil;
        v280.alternate = nil;
    end;
    v280.return_ = nil;
end;
local function v285(v283) --[[ Line: 1385 ]] --[[ Name: getHostParentFiber ]]
    -- upvalues: v114 (ref), l_Error_0 (copy)
    local l_return__0 = v283.return_;
    while true do
        if l_return__0 ~= nil then
            if v114(l_return__0) then
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
v114 = function(v286) --[[ Line: 1403 ]] --[[ Name: isHostParent ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy)
    local v287 = true;
    if v286.tag ~= l_HostComponent_0 then
        v287 = true;
        if v286.tag ~= l_HostRoot_0 then
            v287 = v286.tag == l_HostPortal_0;
        end;
    end;
    return v287;
end;
v115 = function(v288) --[[ Line: 1407 ]] --[[ Name: getHostSibling ]]
    -- upvalues: v114 (ref), l_HostComponent_0 (copy), l_HostText_0 (copy), l_DehydratedFragment_0 (copy), l_Placement_0 (copy), l_HostPortal_0 (copy)
    local l_v288_0 = v288;
    while true do
        local v290 = false;
        while true do
            if l_v288_0.sibling == nil then
                if l_v288_0.return_ == nil or v114(l_v288_0.return_) then
                    return nil;
                else
                    l_v288_0 = l_v288_0.return_;
                end;
            else
                l_v288_0.sibling.return_ = l_v288_0.return_;
                l_v288_0 = l_v288_0.sibling;
                while l_v288_0.tag ~= l_HostComponent_0 and l_v288_0.tag ~= l_HostText_0 and l_v288_0.tag ~= l_DehydratedFragment_0 do
                    if bit32.band(l_v288_0.flags, l_Placement_0) ~= 0 then
                        v290 = true;
                        break;
                    elseif l_v288_0.child == nil or l_v288_0.tag == l_HostPortal_0 then
                        v290 = true;
                        break;
                    else
                        l_v288_0.child.return_ = l_v288_0;
                        l_v288_0 = l_v288_0.child;
                    end;
                end;
                if not v290 and bit32.band(l_v288_0.flags, l_Placement_0) == 0 then
                    return l_v288_0.stateNode;
                else
                    break;
                end;
            end;
        end;
    end;
end;
local function v297(v291) --[[ Line: 1461 ]] --[[ Name: commitPlacement ]]
    -- upvalues: l_supportsMutation_0 (copy), v285 (copy), l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy), l_invariant_0 (copy), l_ContentReset_0 (copy), l_resetTextContent_0 (copy), v115 (ref), v117 (ref), v116 (ref)
    if not l_supportsMutation_0 then
        return;
    else
        local v292 = v285(v291);
        local v293 = nil;
        local v294 = nil;
        local l_stateNode_8 = v292.stateNode;
        if v292.tag == l_HostComponent_0 then
            v293 = l_stateNode_8;
            v294 = false;
        elseif v292.tag == l_HostRoot_0 then
            v293 = l_stateNode_8.containerInfo;
            v294 = true;
        elseif v292.tag == l_HostPortal_0 then
            v293 = l_stateNode_8.containerInfo;
            v294 = true;
        else
            l_invariant_0(false, "Invalid host parent fiber. This error is likely caused by a bug " .. "in React. Please file an issue.");
        end;
        if bit32.band(v292.flags, l_ContentReset_0) ~= 0 then
            l_resetTextContent_0(v293);
            v292.flags = bit32.band(v292.flags, (bit32.bnot(l_ContentReset_0)));
        end;
        local v296 = v115(v291);
        if v294 then
            v117(v291, v296, v293);
            return;
        else
            v116(v291, v296, v293);
            return;
        end;
    end;
end;
v117 = function(v298, v299, v300) --[[ Line: 1512 ]] --[[ Name: insertOrAppendPlacementNodeIntoContainer ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_insertInContainerBefore_0 (copy), l_appendChildToContainer_0 (copy), l_HostPortal_0 (copy), v117 (ref)
    local l_tag_1 = v298.tag;
    local v302 = true;
    if l_tag_1 ~= l_HostComponent_0 then
        v302 = l_tag_1 == l_HostText_0;
    end;
    if v302 then
        local l_stateNode_9 = v298.stateNode;
        if v299 then
            l_insertInContainerBefore_0(v300, l_stateNode_9, v299);
            return;
        else
            l_appendChildToContainer_0(v300, l_stateNode_9);
            return;
        end;
    elseif l_tag_1 == l_HostPortal_0 then
        return;
    else
        local l_child_3 = v298.child;
        if l_child_3 ~= nil then
            v117(l_child_3, v299, v300);
            local l_sibling_0 = l_child_3.sibling;
            while l_sibling_0 ~= nil do
                v117(l_sibling_0, v299, v300);
                l_sibling_0 = l_sibling_0.sibling;
            end;
        end;
        return;
    end;
end;
v116 = function(v306, v307, v308) --[[ Line: 1544 ]] --[[ Name: insertOrAppendPlacementNode ]]
    -- upvalues: l_HostComponent_0 (copy), l_HostText_0 (copy), l_insertBefore_0 (copy), l_appendChild_0 (copy), l_HostPortal_0 (copy), v116 (ref)
    local l_tag_2 = v306.tag;
    local v310 = true;
    if l_tag_2 ~= l_HostComponent_0 then
        v310 = l_tag_2 == l_HostText_0;
    end;
    if v310 then
        local l_stateNode_10 = v306.stateNode;
        if v307 then
            l_insertBefore_0(v308, l_stateNode_10, v307);
            return;
        else
            l_appendChild_0(v308, l_stateNode_10);
            return;
        end;
    elseif l_tag_2 == l_HostPortal_0 then
        return;
    else
        local l_child_4 = v306.child;
        if l_child_4 ~= nil then
            v116(l_child_4, v307, v308);
            local l_sibling_1 = l_child_4.sibling;
            while l_sibling_1 ~= nil do
                v116(l_sibling_1, v307, v308);
                l_sibling_1 = l_sibling_1.sibling;
            end;
        end;
        return;
    end;
end;
v121 = function(v314, v315, v316, v317) --[[ Line: 1572 ]] --[[ Name: unmountHostComponents ]]
    -- upvalues: l_Error_0 (copy), l_HostComponent_0 (copy), l_HostRoot_0 (copy), l_HostPortal_0 (copy), l_HostText_0 (copy), v122 (ref), l_removeChildFromContainer_0 (copy), l_removeChild_0 (copy), v123 (ref)
    local l_v315_0 = v315;
    local v319 = false;
    local v320 = nil;
    local v321 = nil;
    while true do
        if not v319 then
            local l_return__1 = l_v315_0.return_;
            while true do
                if l_return__1 == nil then
                    error(l_Error_0.new("Expected to find a host parent. This error is likely caused by " .. "a bug in React. Please file an issue."));
                end;
                local l_stateNode_11 = l_return__1.stateNode;
                if l_return__1.tag == l_HostComponent_0 then
                    v320 = l_stateNode_11;
                    v321 = false;
                    break;
                elseif l_return__1.tag == l_HostRoot_0 then
                    v320 = l_stateNode_11.containerInfo;
                    v321 = true;
                    break;
                elseif l_return__1.tag == l_HostPortal_0 then
                    v320 = l_stateNode_11.containerInfo;
                    v321 = true;
                    break;
                else
                    l_return__1 = l_return__1.return_;
                end;
            end;
            v319 = true;
        end;
        if l_v315_0.tag == l_HostComponent_0 or l_v315_0.tag == l_HostText_0 then
            v122(v314, l_v315_0, v316, v317);
            if v321 then
                l_removeChildFromContainer_0(v320, l_v315_0.stateNode);
            else
                l_removeChild_0(v320, l_v315_0.stateNode);
            end;
        elseif l_v315_0.tag == l_HostPortal_0 then
            if l_v315_0.child ~= nil then
                v320 = l_v315_0.stateNode.containerInfo;
                v321 = true;
                l_v315_0.child.return_ = l_v315_0;
                l_v315_0 = l_v315_0.child;
                continue;
            end;
        else
            v123(v314, l_v315_0, v316, v317);
            if l_v315_0.child ~= nil then
                l_v315_0.child.return_ = l_v315_0;
                l_v315_0 = l_v315_0.child;
                continue;
            end;
        end;
        if l_v315_0 == v315 then
            return;
        else
            while true do
                if l_v315_0.sibling == nil then
                    if l_v315_0.return_ == nil or l_v315_0.return_ == v315 then
                        return;
                    else
                        l_v315_0 = l_v315_0.return_;
                        if l_v315_0.tag == l_HostPortal_0 then
                            v319 = false;
                        end;
                    end;
                else
                    l_v315_0.sibling.return_ = l_v315_0.return_;
                    l_v315_0 = l_v315_0.sibling;
                    break;
                end;
            end;
        end;
    end;
end;
local function v330(v324, v325, v326, v327) --[[ Line: 1750 ]] --[[ Name: commitDeletion ]]
    -- upvalues: v121 (ref)
    v121(v324, v325, v326, v327);
    local l_alternate_3 = v325.alternate;
    local l_alternate_4 = v325.alternate;
    if l_alternate_4 ~= nil then
        l_alternate_4.return_ = nil;
        v325.alternate = nil;
    end;
    v325.return_ = nil;
    if l_alternate_3 ~= nil then
        l_alternate_4 = l_alternate_3.alternate;
        if l_alternate_4 ~= nil then
            l_alternate_4.return_ = nil;
            l_alternate_3.alternate = nil;
        end;
        l_alternate_3.return_ = nil;
    end;
end;
local function v345(v331, v332) --[[ Line: 1782 ]] --[[ Name: commitWork ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_MemoComponent_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startLayoutEffectTimer_0 (copy), v165 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_describeError_0 (copy), l_recordLayoutEffectDuration_0 (copy), l_ClassComponent_0 (copy), l_HostComponent_0 (copy), l_commitUpdate_0 (copy), l_HostText_0 (copy), l_invariant_0 (copy), l_commitTextUpdate_0 (copy), l_HostRoot_0 (copy), l_supportsHydration_0 (copy), v1 (copy), l_Profiler_0 (copy), l_SuspenseComponent_0 (copy), l_SuspenseListComponent_0 (copy), l_IncompleteClassComponent_0 (copy), l_OffscreenComponent_0 (copy), l_LegacyHiddenComponent_0 (copy), v248 (copy)
    if v332.tag == l_FunctionComponent_0 or v332.tag == l_ForwardRef_0 or v332.tag == l_MemoComponent_0 or v332.tag == l_SimpleMemoComponent_0 or v332.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v332.mode, l_ProfileMode_0) ~= 0 then
            local v333, v334 = xpcall(function() --[[ Line: 1871 ]]
                -- upvalues: l_startLayoutEffectTimer_0 (ref), v165 (ref), l_Layout_0 (ref), l_HasEffect_0 (ref), v332 (copy)
                l_startLayoutEffectTimer_0();
                v165(bit32.bor(l_Layout_0, l_HasEffect_0), v332, v332.return_);
            end, l_describeError_0);
            l_recordLayoutEffectDuration_0(v332);
            if not v333 then
                error(v334);
                return;
            end;
        else
            v165(bit32.bor(l_Layout_0, l_HasEffect_0), v332, v332.return_);
        end;
        return;
    elseif v332.tag == l_ClassComponent_0 then
        return;
    elseif v332.tag == l_HostComponent_0 then
        local l_stateNode_12 = v332.stateNode;
        if l_stateNode_12 ~= nil then
            local l_memoizedProps_2 = v332.memoizedProps;
            local v337 = nil;
            v337 = if v331 then v331.memoizedProps else l_memoizedProps_2;
            local l_type_1 = v332.type;
            local l_updateQueue_5 = v332.updateQueue;
            v332.updateQueue = nil;
            if l_updateQueue_5 ~= nil then
                l_commitUpdate_0(l_stateNode_12, l_updateQueue_5, l_type_1, v337, l_memoizedProps_2, v332);
            end;
        end;
        return;
    elseif v332.tag == l_HostText_0 then
        l_invariant_0(v332.stateNode ~= nil, "This should have a text node initialized. This error is likely " .. "caused by a bug in React. Please file an issue.");
        local l_stateNode_13 = v332.stateNode;
        local l_memoizedProps_3 = v332.memoizedProps;
        local v342 = nil;
        if v331 ~= nil then
            v342 = v331.memoizedProps;
            v342 = l_memoizedProps_3;
        end;
        l_commitTextUpdate_0(l_stateNode_13, v342, l_memoizedProps_3);
        return;
    elseif v332.tag == l_HostRoot_0 then
        if l_supportsHydration_0 then
            local l_stateNode_14 = v332.stateNode;
            if l_stateNode_14.hydrate then
                l_stateNode_14.hydrate = false;
                v1("commitWork: HostRoot: commitHydratedContainer");
            end;
        end;
        return;
    elseif v332.tag == l_Profiler_0 then
        return;
    elseif v332.tag == l_SuspenseComponent_0 then
        commitSuspenseComponent(v332);
        attachSuspenseRetryListeners(v332);
        return;
    else
        if v332.tag == l_SuspenseListComponent_0 then
            v1("commitWork: SuspenseListComponent");
        elseif v332.tag == l_IncompleteClassComponent_0 then
            return;
        elseif v332.tag == l_OffscreenComponent_0 or v332.tag == l_LegacyHiddenComponent_0 then
            local v344 = v332.memoizedState ~= nil;
            v248(v332, v344);
            return;
        end;
        l_invariant_0(false, "This unit of work tag should not have side-effects. This error is " .. "likely caused by a bug in React. Please file an issue.");
        return;
    end;
end;
commitSuspenseComponent = function(v346) --[[ Line: 1997 ]] --[[ Name: commitSuspenseComponent ]]
    -- upvalues: v98 (ref), l_supportsMutation_0 (copy), v248 (copy), l_enableSuspenseCallback_0 (copy), l___DEV___0 (copy), l_console_0 (copy)
    local l_memoizedState_2 = v346.memoizedState;
    if l_memoizedState_2 ~= nil then
        if not v98 then
            v98 = require(script.Parent["ReactFiberWorkLoop.new"]);
        end;
        v98.markCommitTimeOfFallback();
        if l_supportsMutation_0 then
            local l_child_5 = v346.child;
            v248(l_child_5, true);
        end;
    end;
    if l_enableSuspenseCallback_0 and l_memoizedState_2 ~= nil then
        local l_suspenseCallback_0 = v346.memoizedProps.suspenseCallback;
        if typeof(l_suspenseCallback_0) == "function" then
            local l_updateQueue_6 = v346.updateQueue;
            if l_updateQueue_6 ~= nil then
                l_suspenseCallback_0(table.clone(l_updateQueue_6));
                return;
            end;
        elseif l___DEV___0 and l_suspenseCallback_0 ~= nil then
            l_console_0.error("Unexpected type for suspenseCallback: %s", (tostring(l_suspenseCallback_0)));
        end;
    end;
end;
commitSuspenseHydrationCallbacks = function(v351, v352) --[[ Line: 2036 ]] --[[ Name: commitSuspenseHydrationCallbacks ]]
    -- upvalues: l_supportsHydration_0 (copy), l_commitHydratedSuspenseInstance_0 (copy), l_enableSuspenseCallback_0 (copy)
    if not l_supportsHydration_0 then
        return;
    else
        if v352.memoizedState == nil then
            local l_alternate_5 = v352.alternate;
            if l_alternate_5 ~= nil then
                local l_memoizedState_3 = l_alternate_5.memoizedState;
                if l_memoizedState_3 ~= nil then
                    local l_dehydrated_0 = l_memoizedState_3.dehydrated;
                    if l_dehydrated_0 ~= nil then
                        l_commitHydratedSuspenseInstance_0(l_dehydrated_0);
                        if l_enableSuspenseCallback_0 then
                            local l_hydrationCallbacks_0 = v351.hydrationCallbacks;
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
attachSuspenseRetryListeners = function(v358) --[[ Line: 2064 ]] --[[ Name: attachSuspenseRetryListeners ]]
    -- upvalues: l_Set_0 (copy), v101 (copy), l_enableSchedulerTracing_0 (copy), l_unstable_wrap_0 (copy)
    local l_updateQueue_7 = v358.updateQueue;
    if l_updateQueue_7 ~= nil then
        v358.updateQueue = nil;
        local l_stateNode_15 = v358.stateNode;
        if l_stateNode_15 == nil then
            v358.stateNode = l_Set_0.new();
            l_stateNode_15 = v358.stateNode;
        end;
        for v361, _ in l_updateQueue_7 do
            local function v363() --[[ Line: 2078 ]]
                -- upvalues: v101 (ref), v358 (copy), v361 (copy)
                return v101(v358, v361);
            end;
            do
                local l_v363_0 = v363;
                if not l_stateNode_15:has(v361) then
                    if l_enableSchedulerTracing_0 and v361.__reactDoNotTraceInteractions ~= true then
                        l_v363_0 = l_unstable_wrap_0(l_v363_0);
                    end;
                    l_stateNode_15:add(v361);
                    v361:andThen(function() --[[ Line: 2089 ]]
                        -- upvalues: l_v363_0 (ref)
                        return l_v363_0();
                    end, function() --[[ Line: 2091 ]]
                        -- upvalues: l_v363_0 (ref)
                        return l_v363_0();
                    end);
                end;
            end;
        end;
    end;
end;
isSuspenseBoundaryBeingHidden = function(v365, v366) --[[ Line: 2102 ]] --[[ Name: isSuspenseBoundaryBeingHidden ]]
    if v365 ~= nil then
        local l_memoizedState_4 = v365.memoizedState;
        if l_memoizedState_4 == nil or l_memoizedState_4.dehydrated ~= nil then
            local l_memoizedState_5 = v366.memoizedState;
            local v369 = false;
            if l_memoizedState_5 ~= nil then
                v369 = l_memoizedState_5.dehydrated == nil;
            end;
            return v369;
        end;
    end;
    return false;
end;
commitResetTextContent = function(v370) --[[ Line: 2114 ]] --[[ Name: commitResetTextContent ]]
    -- upvalues: l_supportsMutation_0 (copy), l_resetTextContent_0 (copy)
    if not l_supportsMutation_0 then
        return;
    else
        l_resetTextContent_0(v370.stateNode);
        return;
    end;
end;
local function v372(v371) --[[ Line: 2121 ]] --[[ Name: commitPassiveUnmount ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v165 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_recordPassiveEffectDuration_0 (copy)
    if v371.tag == l_FunctionComponent_0 or v371.tag == l_ForwardRef_0 or v371.tag == l_SimpleMemoComponent_0 or v371.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v371.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v165(bit32.bor(l_Passive_0, l_HasEffect_0), v371, v371.return_);
            l_recordPassiveEffectDuration_0(v371);
            return;
        else
            v165(bit32.bor(l_Passive_0, l_HasEffect_0), v371, v371.return_);
        end;
    end;
end;
local function v375(v373, v374) --[[ Line: 2150 ]] --[[ Name: commitPassiveUnmountInsideDeletedTree ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v165 (copy), l_Passive_0 (copy), l_recordPassiveEffectDuration_0 (copy)
    if v373.tag == l_FunctionComponent_0 or v373.tag == l_ForwardRef_0 or v373.tag == l_SimpleMemoComponent_0 or v373.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v373.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            v165(l_Passive_0, v373, v374);
            l_recordPassiveEffectDuration_0(v373);
            return;
        else
            v165(l_Passive_0, v373, v374);
        end;
    end;
end;
local function v380(v376, v377) --[[ Line: 2174 ]] --[[ Name: commitPassiveMount ]]
    -- upvalues: l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_enableProfilerTimer_0 (copy), l_enableProfilerCommitHooks_0 (copy), l_ProfileMode_0 (copy), l_startPassiveEffectTimer_0 (copy), v174 (copy), l_describeError_0 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_recordPassiveEffectDuration_0 (copy), l_Profiler_0 (copy)
    if v377.tag == l_FunctionComponent_0 or v377.tag == l_ForwardRef_0 or v377.tag == l_SimpleMemoComponent_0 or v377.tag == l_Block_0 then
        if l_enableProfilerTimer_0 and l_enableProfilerCommitHooks_0 and bit32.band(v377.mode, l_ProfileMode_0) ~= 0 then
            l_startPassiveEffectTimer_0();
            local v378, v379 = xpcall(v174, l_describeError_0, bit32.bor(l_Passive_0, l_HasEffect_0), v377);
            l_recordPassiveEffectDuration_0(v377);
            if not v378 then
                error(v379);
                return;
            end;
        else
            v174(bit32.bor(l_Passive_0, l_HasEffect_0), v377);
            return;
        end;
    elseif v377.tag == l_Profiler_0 then
        commitProfilerPassiveEffect(v376, v377);
    end;
end;
invokeLayoutEffectMountInDEV = function(v381) --[[ Line: 2207 ]] --[[ Name: invokeLayoutEffectMountInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v174 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v107 (ref), l_ClassComponent_0 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        if v381.tag == l_FunctionComponent_0 or v381.tag == l_ForwardRef_0 or v381.tag == l_SimpleMemoComponent_0 or v381.tag == l_Block_0 then
            l_invokeGuardedCallback_0(nil, v174, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v381);
            if l_hasCaughtError_0() then
                local v382 = l_clearCaughtError_0();
                v107(v381, v381.return_, v382);
            end;
            return;
        end;
    elseif v381.tag == l_ClassComponent_0 then
        local l_stateNode_16 = v381.stateNode;
        l_invokeGuardedCallback_0(nil, l_stateNode_16.componentDidMount, l_stateNode_16);
        if l_hasCaughtError_0() then
            local v384 = l_clearCaughtError_0();
            v107(v381, v381.return_, v384);
        end;
        return;
    end;
end;
invokePassiveEffectMountInDEV = function(v385) --[[ Line: 2239 ]] --[[ Name: invokePassiveEffectMountInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v174 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v107 (ref)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 and (v385.tag == l_FunctionComponent_0 or v385.tag == l_ForwardRef_0 or v385.tag == l_SimpleMemoComponent_0 or v385.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v174, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v385);
        if l_hasCaughtError_0() then
            local v386 = l_clearCaughtError_0();
            v107(v385, v385.return_, v386);
        end;
        return;
    else
        return;
    end;
end;
invokeLayoutEffectUnmountInDEV = function(v387) --[[ Line: 2263 ]] --[[ Name: invokeLayoutEffectUnmountInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v165 (copy), l_Layout_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v107 (ref), l_ClassComponent_0 (copy)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 then
        if v387.tag == l_FunctionComponent_0 or v387.tag == l_ForwardRef_0 or v387.tag == l_SimpleMemoComponent_0 or v387.tag == l_Block_0 then
            l_invokeGuardedCallback_0(nil, v165, nil, bit32.bor(l_Layout_0, l_HasEffect_0), v387, v387.return_);
            if l_hasCaughtError_0() then
                local v388 = l_clearCaughtError_0();
                v107(v387, v387.return_, v388);
            end;
            return;
        end;
    elseif v387.tag == l_ClassComponent_0 then
        local l_stateNode_17 = v387.stateNode;
        if typeof(l_stateNode_17.componentWillUnmount) == "function" then
            safelyCallComponentWillUnmount(v387, l_stateNode_17, v387.return_);
        end;
        return;
    end;
end;
invokePassiveEffectUnmountInDEV = function(v390) --[[ Line: 2294 ]] --[[ Name: invokePassiveEffectUnmountInDEV ]]
    -- upvalues: l___DEV___0 (copy), l_enableDoubleInvokingEffects_0 (copy), l_FunctionComponent_0 (copy), l_ForwardRef_0 (copy), l_SimpleMemoComponent_0 (copy), l_Block_0 (copy), l_invokeGuardedCallback_0 (copy), v165 (copy), l_Passive_0 (copy), l_HasEffect_0 (copy), l_hasCaughtError_0 (copy), l_clearCaughtError_0 (copy), v107 (ref)
    if l___DEV___0 and l_enableDoubleInvokingEffects_0 and (v390.tag == l_FunctionComponent_0 or v390.tag == l_ForwardRef_0 or v390.tag == l_SimpleMemoComponent_0 or v390.tag == l_Block_0) then
        l_invokeGuardedCallback_0(nil, v165, nil, bit32.bor(l_Passive_0, l_HasEffect_0), v390, v390.return_);
        if l_hasCaughtError_0() then
            local v391 = l_clearCaughtError_0();
            v107(v390, v390.return_, v391);
        end;
        return;
    else
        return;
    end;
end;
return {
    safelyCallDestroy = v146, 
    commitBeforeMutationLifeCycles = v154, 
    commitResetTextContent = commitResetTextContent, 
    commitPlacement = v297, 
    commitDeletion = v330, 
    commitWork = v345, 
    commitAttachRef = commitAttachRef, 
    commitDetachRef = commitDetachRef, 
    commitPassiveUnmount = v372, 
    commitPassiveUnmountInsideDeletedTree = v375, 
    commitPassiveMount = v380, 
    invokeLayoutEffectMountInDEV = invokeLayoutEffectMountInDEV, 
    invokeLayoutEffectUnmountInDEV = invokeLayoutEffectUnmountInDEV, 
    invokePassiveEffectMountInDEV = invokePassiveEffectMountInDEV, 
    invokePassiveEffectUnmountInDEV = invokePassiveEffectUnmountInDEV, 
    isSuspenseBoundaryBeingHidden = isSuspenseBoundaryBeingHidden, 
    recursivelyCommitLayoutEffects = v181
};