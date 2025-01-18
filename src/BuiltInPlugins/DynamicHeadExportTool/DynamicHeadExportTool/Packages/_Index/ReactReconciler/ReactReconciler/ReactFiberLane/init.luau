local l_Parent_0 = script.Parent.Parent;
local _ = require(script.Parent.ReactInternalTypes);
local l_rshift_0 = bit32.rshift;
local l_log_0 = math.log;
local l_floor_0 = math.floor;
local function _(v5) --[[ Line: 21 ]] --[[ Name: clz32 ]]
    -- upvalues: l_rshift_0 (copy), l_log_0 (copy), l_floor_0 (copy)
    local v6 = l_rshift_0(v5, 0);
    if v6 == 0 then
        return 32;
    else
        return 31 - l_floor_0(l_log_0(v6) / 0.6931471805599453);
    end;
end;
local l_console_0 = require(l_Parent_0.Shared).console;
local v9 = require(script.Parent["ReactFiberSchedulerPriorities.roblox"]);
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ImmediatePriority_0 = v9.ImmediatePriority;
local l_UserBlockingPriority_0 = v9.UserBlockingPriority;
local l_NormalPriority_0 = v9.NormalPriority;
local l_LowPriority_0 = v9.LowPriority;
local l_IdlePriority_0 = v9.IdlePriority;
local l_NoPriority_0 = v9.NoPriority;
local v17 = {
    SyncLanePriority = 15, 
    SyncBatchedLanePriority = 14, 
    InputDiscreteLanePriority = 12, 
    InputContinuousLanePriority = 10, 
    DefaultLanePriority = 8, 
    TransitionPriority = 6, 
    NoLanePriority = 0, 
    NoLanes = 0, 
    NoLane = 0, 
    SyncLane = 1, 
    SyncBatchedLane = 2, 
    InputDiscreteHydrationLane = 4, 
    DefaultHydrationLane = 256, 
    DefaultLanes = 3584, 
    RetryLanes = 62914560, 
    SomeRetryLane = 33554432, 
    SelectiveHydrationLane = 67108864, 
    IdleHydrationLane = 134217728, 
    OffscreenLane = 1073741824, 
    NoTimestamp = -1
};
local l_NoLanePriority_0 = v17.NoLanePriority;
v17.getCurrentUpdateLanePriority = function() --[[ Line: 136 ]]
    -- upvalues: l_NoLanePriority_0 (ref)
    return l_NoLanePriority_0;
end;
v17.setCurrentUpdateLanePriority = function(v19) --[[ Line: 140 ]]
    -- upvalues: l_NoLanePriority_0 (ref)
    l_NoLanePriority_0 = v19;
end;
local l_DefaultLanePriority_0 = v17.DefaultLanePriority;
local function v28(v21) --[[ Line: 148 ]] --[[ Name: getHighestPriorityLanes ]]
    -- upvalues: l_DefaultLanePriority_0 (ref), l_console_0 (copy)
    if bit32.band(1, v21) ~= 0 then
        l_DefaultLanePriority_0 = 15;
        return 1;
    elseif bit32.band(2, v21) ~= 0 then
        l_DefaultLanePriority_0 = 14;
        return 2;
    elseif bit32.band(4, v21) ~= 0 then
        l_DefaultLanePriority_0 = 13;
        return 4;
    else
        local v22 = bit32.band(24, v21);
        if v22 ~= 0 then
            l_DefaultLanePriority_0 = 12;
            return v22;
        elseif bit32.band(v21, 32) ~= 0 then
            l_DefaultLanePriority_0 = 11;
            return 32;
        else
            local v23 = bit32.band(192, v21);
            if v23 ~= 0 then
                l_DefaultLanePriority_0 = 10;
                return v23;
            elseif bit32.band(v21, 256) ~= 0 then
                l_DefaultLanePriority_0 = 9;
                return 256;
            else
                local v24 = bit32.band(3584, v21);
                if v24 ~= 0 then
                    l_DefaultLanePriority_0 = 8;
                    return v24;
                elseif bit32.band(v21, 4096) ~= 0 then
                    l_DefaultLanePriority_0 = 7;
                    return 4096;
                else
                    local v25 = bit32.band(4186112, v21);
                    if v25 ~= 0 then
                        l_DefaultLanePriority_0 = 6;
                        return v25;
                    else
                        local v26 = bit32.band(62914560, v21);
                        if v26 ~= 0 then
                            l_DefaultLanePriority_0 = 5;
                            return v26;
                        elseif bit32.band(v21, 67108864) ~= 0 then
                            l_DefaultLanePriority_0 = 4;
                            return 67108864;
                        elseif bit32.band(v21, 134217728) ~= 0 then
                            l_DefaultLanePriority_0 = 3;
                            return 134217728;
                        else
                            local v27 = bit32.band(805306368, v21);
                            if v27 ~= 0 then
                                l_DefaultLanePriority_0 = 2;
                                return v27;
                            elseif bit32.band(1073741824, v21) ~= 0 then
                                l_DefaultLanePriority_0 = 1;
                                return 1073741824;
                            else
                                if _G.__DEV__ then
                                    l_console_0.error("Should have found matching lanes. This is a bug in React.");
                                end;
                                l_DefaultLanePriority_0 = 8;
                                return v21;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v17.schedulerPriorityToLanePriority = function(v29) --[[ Line: 223 ]] --[[ Name: schedulerPriorityToLanePriority ]]
    -- upvalues: l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_IdlePriority_0 (copy)
    if v29 == l_ImmediatePriority_0 then
        return 15;
    elseif v29 == l_UserBlockingPriority_0 then
        return 10;
    elseif v29 == l_NormalPriority_0 or v29 == l_LowPriority_0 then
        return 8;
    elseif v29 == l_IdlePriority_0 then
        return 2;
    else
        return 0;
    end;
end;
v17.lanePriorityToSchedulerPriority = function(v30) --[[ Line: 243 ]] --[[ Name: lanePriorityToSchedulerPriority ]]
    -- upvalues: l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_IdlePriority_0 (copy), l_NoPriority_0 (copy), l_invariant_0 (copy)
    if v30 == 15 or v30 == 14 then
        return l_ImmediatePriority_0;
    elseif v30 == 13 or v30 == 12 or v30 == 11 or v30 == 10 then
        return l_UserBlockingPriority_0;
    elseif v30 == 9 or v30 == 8 or v30 == 7 or v30 == 6 or v30 == 4 or v30 == 5 then
        return l_NormalPriority_0;
    elseif v30 == 3 or v30 == 2 or v30 == 1 then
        return l_IdlePriority_0;
    elseif v30 == 0 then
        return l_NoPriority_0;
    else
        l_invariant_0(false, "Invalid update priority: %s. This is a bug in React.", v30);
        error("unreachable");
        return;
    end;
end;
local v31 = nil;
local v32 = nil;
local v33 = nil;
v17.getNextLanes = function(v34, v35) --[[ Line: 286 ]] --[[ Name: getNextLanes ]]
    -- upvalues: l_DefaultLanePriority_0 (ref), v28 (copy), v32 (ref), v31 (ref)
    local l_pendingLanes_0 = v34.pendingLanes;
    if l_pendingLanes_0 == 0 then
        l_DefaultLanePriority_0 = 0;
        return 0;
    else
        local v37 = 0;
        local v38 = 0;
        local l_expiredLanes_0 = v34.expiredLanes;
        local l_suspendedLanes_0 = v34.suspendedLanes;
        local l_pingedLanes_0 = v34.pingedLanes;
        if l_expiredLanes_0 ~= 0 then
            v37 = l_expiredLanes_0;
            l_DefaultLanePriority_0 = 15;
            v38 = 15;
        else
            local v42 = bit32.band(l_pendingLanes_0, 134217727);
            if v42 ~= 0 then
                local v43 = bit32.band(v42, (bit32.bnot(l_suspendedLanes_0)));
                if v43 ~= 0 then
                    v37 = v28(v43);
                    v38 = l_DefaultLanePriority_0;
                else
                    local v44 = bit32.band(v42, l_pingedLanes_0);
                    if v44 ~= 0 then
                        v37 = v28(v44);
                        v38 = l_DefaultLanePriority_0;
                    end;
                end;
            else
                local v45 = bit32.band(l_pendingLanes_0, (bit32.bnot(l_suspendedLanes_0)));
                if v45 ~= 0 then
                    v37 = v28(v45);
                    v38 = l_DefaultLanePriority_0;
                elseif l_pingedLanes_0 ~= 0 then
                    v37 = v28(l_pingedLanes_0);
                    v38 = l_DefaultLanePriority_0;
                end;
            end;
        end;
        if v37 == 0 then
            return 0;
        else
            v37 = bit32.band(l_pendingLanes_0, bit32.lshift(v32(v37), 1) - 1);
            if v35 ~= 0 and v35 ~= v37 and bit32.band(v35, l_suspendedLanes_0) == 0 then
                v28(v35);
                if v38 <= l_DefaultLanePriority_0 then
                    return v35;
                else
                    l_DefaultLanePriority_0 = v38;
                end;
            end;
            local l_entangledLanes_0 = v34.entangledLanes;
            if l_entangledLanes_0 ~= 0 then
                local l_entanglements_0 = v34.entanglements;
                local v48 = bit32.band(v37, l_entangledLanes_0);
                while v48 > 0 do
                    local v49 = v31(v48);
                    local v50 = bit32.lshift(1, v49);
                    v37 = bit32.bor(v37, l_entanglements_0[v49]);
                    v48 = bit32.band(v48, (bit32.bnot(v50)));
                end;
            end;
            return v37;
        end;
    end;
end;
v17.getMostRecentEventTime = function(v51, v52) --[[ Line: 402 ]] --[[ Name: getMostRecentEventTime ]]
    -- upvalues: v31 (ref)
    local l_eventTimes_0 = v51.eventTimes;
    local v54 = -1;
    while v52 > 0 do
        local v55 = v31(v52);
        local v56 = bit32.lshift(1, v55);
        local v57 = l_eventTimes_0[v55];
        if v54 < v57 then
            v54 = v57;
        end;
        v52 = bit32.band(v52, (bit32.bnot(v56)));
    end;
    return v54;
end;
v17.computeExpirationTime = function(v58, v59) --[[ Line: 422 ]] --[[ Name: computeExpirationTime ]]
    -- upvalues: v28 (copy), l_DefaultLanePriority_0 (ref)
    v28(v58);
    local l_l_DefaultLanePriority_0_0 = l_DefaultLanePriority_0;
    if l_l_DefaultLanePriority_0_0 >= 10 then
        return v59 + 250;
    elseif l_l_DefaultLanePriority_0_0 >= 6 then
        return v59 + 5000;
    else
        return -1;
    end;
end;
v17.markStarvedLanesAsExpired = function(v61, v62) --[[ Line: 452 ]] --[[ Name: markStarvedLanesAsExpired ]]
    -- upvalues: v31 (ref), v28 (copy), l_DefaultLanePriority_0 (ref)
    local l_pendingLanes_1 = v61.pendingLanes;
    local l_suspendedLanes_1 = v61.suspendedLanes;
    local l_pingedLanes_1 = v61.pingedLanes;
    local l_expirationTimes_0 = v61.expirationTimes;
    local l_l_pendingLanes_1_0 = l_pendingLanes_1;
    while l_l_pendingLanes_1_0 > 0 do
        local v68 = v31(l_l_pendingLanes_1_0);
        local v69 = bit32.lshift(1, v68);
        local v70 = l_expirationTimes_0[v68];
        if v70 == -1 then
            if bit32.band(v69, l_suspendedLanes_1) == 0 or bit32.band(v69, l_pingedLanes_1) ~= 0 then
                v28(v69);
                local l_l_DefaultLanePriority_0_1 = l_DefaultLanePriority_0;
                l_expirationTimes_0[v68] = if l_l_DefaultLanePriority_0_1 >= 10 then v62 + 250 else if l_l_DefaultLanePriority_0_1 >= 6 then v62 + 5000 else -1;
            end;
        elseif v70 <= v62 then
            v61.expiredLanes = bit32.bor(v61.expiredLanes, v69);
        end;
        l_l_pendingLanes_1_0 = bit32.band(l_l_pendingLanes_1_0, (bit32.bnot(v69)));
    end;
end;
v17.getHighestPriorityPendingLanes = function(v72) --[[ Line: 493 ]] --[[ Name: getHighestPriorityPendingLanes ]]
    -- upvalues: v28 (copy)
    return (v28(v72.pendingLanes));
end;
v17.getLanesToRetrySynchronouslyOnError = function(v73) --[[ Line: 498 ]] --[[ Name: getLanesToRetrySynchronouslyOnError ]]
    local v74 = bit32.band(v73.pendingLanes, 3221225471);
    if v74 ~= 0 then
        return v74;
    elseif bit32.band(v74, 1073741824) ~= 0 then
        return 1073741824;
    else
        return 0;
    end;
end;
v17.returnNextLanesPriority = function() --[[ Line: 510 ]] --[[ Name: returnNextLanesPriority ]]
    -- upvalues: l_DefaultLanePriority_0 (ref)
    return l_DefaultLanePriority_0;
end;
v17.includesNonIdleWork = function(v75) --[[ Line: 515 ]] --[[ Name: includesNonIdleWork ]]
    return bit32.band(v75, 134217727) ~= 0;
end;
v17.includesOnlyRetries = function(v76) --[[ Line: 520 ]] --[[ Name: includesOnlyRetries ]]
    return bit32.band(v76, 62914560) == v76;
end;
v17.includesOnlyTransitions = function(v77) --[[ Line: 525 ]] --[[ Name: includesOnlyTransitions ]]
    return bit32.band(v77, 4186112) == v77;
end;
local v78 = nil;
local function v79(v80, v81) --[[ Line: 535 ]] --[[ Name: findUpdateLane ]]
    -- upvalues: v78 (ref), v79 (copy), l_invariant_0 (copy)
    if v80 ~= 0 then
        if v80 == 15 then
            return 1;
        elseif v80 == 14 then
            return 2;
        elseif v80 == 12 then
            local v82 = v78((bit32.band(24, (bit32.bnot(v81)))));
            if v82 == 0 then
                return v79(10, v81);
            else
                return v82;
            end;
        elseif v80 == 10 then
            local v83 = v78((bit32.band(192, (bit32.bnot(v81)))));
            if v83 == 0 then
                return v79(8, v81);
            else
                return v83;
            end;
        elseif v80 == 8 then
            local v84 = v78((bit32.band(3584, (bit32.bnot(v81)))));
            if v84 == 0 then
                v84 = v78((bit32.band(4186112, (bit32.bnot(v81)))));
                if v84 == 0 then
                    v84 = v78(3584);
                end;
            end;
            return v84;
        elseif v80 ~= 6 and v80 ~= 5 and v80 == 2 then
            local v85 = v78((bit32.band(805306368, (bit32.bnot(v81)))));
            if v85 == 0 then
                v85 = v78(805306368);
            end;
            return v85;
        end;
    end;
    l_invariant_0(false, "Invalid update priority: %s. This is a bug in React.", v80);
    error("unreachable");
end;
v17.findUpdateLane = v79;
v17.findTransitionLane = function(v86, v87) --[[ Line: 601 ]] --[[ Name: findTransitionLane ]]
    -- upvalues: v78 (ref)
    local v88 = v78((bit32.band(4186112, (bit32.bnot(v87)))));
    if v88 == 0 then
        v88 = v78((bit32.band(4186112, (bit32.bnot(v86)))));
        if v88 == 0 then
            v88 = v78(4186112);
        end;
    end;
    return v88;
end;
v17.findRetryLane = function(v89) --[[ Line: 621 ]] --[[ Name: findRetryLane ]]
    -- upvalues: v78 (ref)
    local v90 = v78((bit32.band(62914560, (bit32.bnot(v89)))));
    if v90 == 0 then
        v90 = v78(62914560);
    end;
    return v90;
end;
local function _(v91) --[[ Line: 633 ]] --[[ Name: getHighestPriorityLane ]]
    return (bit32.band(v91, -v91));
end;
v32 = function(v93) --[[ Line: 637 ]] --[[ Name: getLowestPriorityLane ]]
    -- upvalues: l_rshift_0 (copy), l_log_0 (copy), l_floor_0 (copy)
    local v94 = l_rshift_0(v93, 0);
    local v95 = 31 - (v94 == 0 and 32 or 31 - l_floor_0(l_log_0(v94) / 0.6931471805599453));
    if v95 < 0 then
        return 0;
    else
        return (bit32.lshift(1, v95));
    end;
end;
v33 = function(v96) --[[ Line: 647 ]] --[[ Name: getEqualOrHigherPriorityLanes ]]
    -- upvalues: v32 (ref)
    return bit32.lshift(v32(v96), 1) - 1;
end;
v78 = function(v97) --[[ Line: 651 ]] --[[ Name: pickArbitraryLane ]]
    return (bit32.band(v97, -v97));
end;
v17.pickArbitraryLane = v78;
v31 = function(v98) --[[ Line: 660 ]] --[[ Name: pickArbitraryLaneIndex ]]
    -- upvalues: l_rshift_0 (copy), l_log_0 (copy), l_floor_0 (copy)
    local v99 = l_rshift_0(v98, 0);
    return 31 - (v99 == 0 and 32 or 31 - l_floor_0(l_log_0(v99) / 0.6931471805599453));
end;
v17.includesSomeLane = function(v100, v101) --[[ Line: 669 ]] --[[ Name: includesSomeLane ]]
    return bit32.band(v100, v101) ~= 0;
end;
v17.isSubsetOfLanes = function(v102, v103) --[[ Line: 674 ]] --[[ Name: isSubsetOfLanes ]]
    return bit32.band(v102, v103) == v103;
end;
v17.mergeLanes = function(v104, v105) --[[ Line: 679 ]] --[[ Name: mergeLanes ]]
    return (bit32.bor(v104, v105));
end;
v17.removeLanes = function(v106, v107) --[[ Line: 684 ]] --[[ Name: removeLanes ]]
    return (bit32.band(v106, (bit32.bnot(v107))));
end;
v17.laneToLanes = function(v108) --[[ Line: 691 ]] --[[ Name: laneToLanes ]]
    return v108;
end;
v17.higherPriorityLane = function(v109, v110) --[[ Line: 696 ]] --[[ Name: higherPriorityLane ]]
    if v109 ~= 0 and v110 ~= 0 then
        if v109 < v110 then
            return v109;
        else
            return v110;
        end;
    elseif v109 ~= 0 then
        return v109;
    else
        return v110;
    end;
end;
v17.higherLanePriority = function(v111, v112) --[[ Line: 712 ]] --[[ Name: higherLanePriority ]]
    if v111 ~= 0 and v112 < v111 then
        return v111;
    else
        return v112;
    end;
end;
v17.createLaneMap = function(v113) --[[ Line: 726 ]] --[[ Name: createLaneMap ]]
    return {
        [0] = v113, 
        [1] = v113, 
        [2] = v113, 
        [3] = v113, 
        [4] = v113, 
        [5] = v113, 
        [6] = v113, 
        [7] = v113, 
        [8] = v113, 
        [9] = v113, 
        [10] = v113, 
        [11] = v113, 
        [12] = v113, 
        [13] = v113, 
        [14] = v113, 
        [15] = v113, 
        [16] = v113, 
        [17] = v113, 
        [18] = v113, 
        [19] = v113, 
        [20] = v113, 
        [21] = v113, 
        [22] = v113, 
        [23] = v113, 
        [24] = v113, 
        [25] = v113, 
        [26] = v113, 
        [27] = v113, 
        [28] = v113, 
        [29] = v113, 
        [30] = v113, 
        [31] = v113
    };
end;
v17.markRootUpdated = function(v114, v115, v116) --[[ Line: 770 ]] --[[ Name: markRootUpdated ]]
    -- upvalues: l_rshift_0 (copy), l_log_0 (copy), l_floor_0 (copy)
    v114.pendingLanes = bit32.bor(v114.pendingLanes, v115);
    local v117 = v115 - 1;
    v114.suspendedLanes = bit32.band(v114.suspendedLanes, v117);
    v114.pingedLanes = bit32.band(v114.pingedLanes, v117);
    local l_eventTimes_1 = v114.eventTimes;
    local v119 = l_rshift_0(v115, 0);
    l_eventTimes_1[31 - (v119 == 0 and 32 or 31 - l_floor_0(l_log_0(v119) / 0.6931471805599453))] = v116;
end;
v17.markRootSuspended = function(v120, v121) --[[ Line: 803 ]] --[[ Name: markRootSuspended ]]
    -- upvalues: v31 (ref)
    v120.suspendedLanes = bit32.bor(v120.suspendedLanes, v121);
    v120.pingedLanes = bit32.band(v120.pingedLanes, (bit32.bnot(v121)));
    local l_expirationTimes_1 = v120.expirationTimes;
    local l_v121_0 = v121;
    while l_v121_0 > 0 do
        local v124 = v31(l_v121_0);
        local v125 = bit32.lshift(1, v124);
        l_expirationTimes_1[v124] = -1;
        l_v121_0 = bit32.band(l_v121_0, (bit32.bnot(v125)));
    end;
end;
v17.markRootPinged = function(v126, v127, _) --[[ Line: 821 ]] --[[ Name: markRootPinged ]]
    v126.pingedLanes = bit32.bor(v126.pingedLanes, (bit32.band(v126.suspendedLanes, v127)));
end;
v17.markRootExpired = function(v129, v130) --[[ Line: 830 ]] --[[ Name: markRootExpired ]]
    v129.expiredLanes = bit32.bor(v129.expiredLanes, (bit32.band(v130, v129.pendingLanes)));
end;
v17.markDiscreteUpdatesExpired = function(v131) --[[ Line: 835 ]] --[[ Name: markDiscreteUpdatesExpired ]]
    v131.expiredLanes = bit32.bor(v131.expiredLanes, (bit32.band(24, v131.pendingLanes)));
end;
v17.hasDiscreteLanes = function(v132) --[[ Line: 840 ]] --[[ Name: hasDiscreteLanes ]]
    return bit32.band(v132, 24) ~= 0;
end;
v17.markRootMutableRead = function(v133, v134) --[[ Line: 845 ]] --[[ Name: markRootMutableRead ]]
    v133.mutableReadLanes = bit32.bor(v133.mutableReadLanes, (bit32.band(v134, v133.pendingLanes)));
end;
v17.markRootFinished = function(v135, v136) --[[ Line: 850 ]] --[[ Name: markRootFinished ]]
    -- upvalues: v31 (ref)
    local v137 = bit32.band(v135.pendingLanes, (bit32.bnot(v136)));
    v135.pendingLanes = v136;
    v135.suspendedLanes = 0;
    v135.pingedLanes = 0;
    v135.expiredLanes = bit32.band(v135.expiredLanes, v136);
    v135.mutableReadLanes = bit32.band(v135.mutableReadLanes, v136);
    v135.entangledLanes = bit32.band(v135.entangledLanes, v136);
    local l_entanglements_1 = v135.entanglements;
    local l_eventTimes_2 = v135.eventTimes;
    local l_expirationTimes_2 = v135.expirationTimes;
    local l_v137_0 = v137;
    while l_v137_0 > 0 do
        local v142 = v31(l_v137_0);
        local v143 = bit32.lshift(1, v142);
        l_entanglements_1[v142] = 0;
        l_eventTimes_2[v142] = -1;
        l_expirationTimes_2[v142] = -1;
        l_v137_0 = bit32.band(l_v137_0, (bit32.bnot(v143)));
    end;
end;
v17.markRootEntangled = function(v144, v145) --[[ Line: 883 ]] --[[ Name: markRootEntangled ]]
    -- upvalues: v31 (ref)
    v144.entangledLanes = bit32.bor(v144.entangledLanes, v145);
    local l_entanglements_2 = v144.entanglements;
    local l_v145_0 = v145;
    while l_v145_0 > 0 do
        local v148 = v31(l_v145_0);
        local v149 = bit32.lshift(1, v148);
        l_entanglements_2[v148] = bit32.bor(l_entanglements_2[v148], v145);
        l_v145_0 = bit32.band(l_v145_0, (bit32.bnot(v149)));
    end;
end;
v17.getBumpedLaneForHydration = function(v150, v151) --[[ Line: 899 ]] --[[ Name: getBumpedLaneForHydration ]]
    -- upvalues: v28 (copy), l_DefaultLanePriority_0 (ref), l_invariant_0 (copy)
    v28(v151);
    local l_l_DefaultLanePriority_0_2 = l_DefaultLanePriority_0;
    local v153 = nil;
    if l_l_DefaultLanePriority_0_2 == 15 or l_l_DefaultLanePriority_0_2 == 14 then
        v153 = 0;
    elseif l_l_DefaultLanePriority_0_2 == 13 or l_l_DefaultLanePriority_0_2 == 12 then
        v153 = 4;
    elseif l_l_DefaultLanePriority_0_2 == 11 or l_l_DefaultLanePriority_0_2 == 10 then
        v153 = 32;
    elseif l_l_DefaultLanePriority_0_2 == 9 or l_l_DefaultLanePriority_0_2 == 8 then
        v153 = 256;
    elseif l_l_DefaultLanePriority_0_2 == 7 or l_l_DefaultLanePriority_0_2 == 6 then
        v153 = 4096;
    elseif l_l_DefaultLanePriority_0_2 == 5 then
        v153 = 4096;
    elseif l_l_DefaultLanePriority_0_2 == 4 then
        v153 = 67108864;
    elseif l_l_DefaultLanePriority_0_2 == 3 or l_l_DefaultLanePriority_0_2 == 2 then
        v153 = 134217728;
    elseif l_l_DefaultLanePriority_0_2 == 1 or l_l_DefaultLanePriority_0_2 == 0 then
        v153 = 0;
    else
        l_invariant_0(false, "Invalid lane: %s. This is a bug in React.", (tostring(v153)));
    end;
    if bit32.band(v153, (bit32.bor(v150.suspendedLanes, v151))) ~= 0 then
        return 0;
    else
        return v153;
    end;
end;
return v17;