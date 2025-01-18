local l_Parent_0 = script.Parent.Parent;
local _ = require(script.Parent.ReactInternalTypes);
local l_console_0 = require(l_Parent_0.Shared).console;
local v3 = require(script.Parent["ReactFiberSchedulerPriorities.roblox"]);
local v4 = require(l_Parent_0.SafeFlags).createGetFFlag("ReactInlineMergeLanes")();
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_ImmediatePriority_0 = v3.ImmediatePriority;
local l_UserBlockingPriority_0 = v3.UserBlockingPriority;
local l_NormalPriority_0 = v3.NormalPriority;
local l_LowPriority_0 = v3.LowPriority;
local l_IdlePriority_0 = v3.IdlePriority;
local l_NoPriority_0 = v3.NoPriority;
local v12 = {
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
local l_NoLanePriority_0 = v12.NoLanePriority;
v12.getCurrentUpdateLanePriority = function() --[[ Line: 146 ]]
    -- upvalues: l_NoLanePriority_0 (ref)
    return l_NoLanePriority_0;
end;
v12.setCurrentUpdateLanePriority = function(v14) --[[ Line: 150 ]]
    -- upvalues: l_NoLanePriority_0 (ref)
    l_NoLanePriority_0 = v14;
end;
local l_DefaultLanePriority_0 = v12.DefaultLanePriority;
local function v23(v16) --[[ Line: 158 ]] --[[ Name: getHighestPriorityLanes ]]
    -- upvalues: l_DefaultLanePriority_0 (ref), l_console_0 (copy)
    if bit32.band(1, v16) ~= 0 then
        l_DefaultLanePriority_0 = 15;
        return 1;
    elseif bit32.band(2, v16) ~= 0 then
        l_DefaultLanePriority_0 = 14;
        return 2;
    elseif bit32.band(4, v16) ~= 0 then
        l_DefaultLanePriority_0 = 13;
        return 4;
    else
        local v17 = bit32.band(24, v16);
        if v17 ~= 0 then
            l_DefaultLanePriority_0 = 12;
            return v17;
        elseif bit32.band(v16, 32) ~= 0 then
            l_DefaultLanePriority_0 = 11;
            return 32;
        else
            local v18 = bit32.band(192, v16);
            if v18 ~= 0 then
                l_DefaultLanePriority_0 = 10;
                return v18;
            elseif bit32.band(v16, 256) ~= 0 then
                l_DefaultLanePriority_0 = 9;
                return 256;
            else
                local v19 = bit32.band(3584, v16);
                if v19 ~= 0 then
                    l_DefaultLanePriority_0 = 8;
                    return v19;
                elseif bit32.band(v16, 4096) ~= 0 then
                    l_DefaultLanePriority_0 = 7;
                    return 4096;
                else
                    local v20 = bit32.band(4186112, v16);
                    if v20 ~= 0 then
                        l_DefaultLanePriority_0 = 6;
                        return v20;
                    else
                        local v21 = bit32.band(62914560, v16);
                        if v21 ~= 0 then
                            l_DefaultLanePriority_0 = 5;
                            return v21;
                        elseif bit32.band(v16, 67108864) ~= 0 then
                            l_DefaultLanePriority_0 = 4;
                            return 67108864;
                        elseif bit32.band(v16, 134217728) ~= 0 then
                            l_DefaultLanePriority_0 = 3;
                            return 134217728;
                        else
                            local v22 = bit32.band(805306368, v16);
                            if v22 ~= 0 then
                                l_DefaultLanePriority_0 = 2;
                                return v22;
                            elseif bit32.band(1073741824, v16) ~= 0 then
                                l_DefaultLanePriority_0 = 1;
                                return 1073741824;
                            else
                                if _G.__DEV__ then
                                    l_console_0.error("Should have found matching lanes. This is a bug in React.");
                                end;
                                l_DefaultLanePriority_0 = 8;
                                return v16;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
v12.schedulerPriorityToLanePriority = function(v24) --[[ Line: 233 ]] --[[ Name: schedulerPriorityToLanePriority ]]
    -- upvalues: l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_LowPriority_0 (copy), l_IdlePriority_0 (copy)
    if v24 == l_ImmediatePriority_0 then
        return 15;
    elseif v24 == l_UserBlockingPriority_0 then
        return 10;
    elseif v24 == l_NormalPriority_0 or v24 == l_LowPriority_0 then
        return 8;
    elseif v24 == l_IdlePriority_0 then
        return 2;
    else
        return 0;
    end;
end;
v12.lanePriorityToSchedulerPriority = function(v25) --[[ Line: 254 ]] --[[ Name: lanePriorityToSchedulerPriority ]]
    -- upvalues: l_ImmediatePriority_0 (copy), l_UserBlockingPriority_0 (copy), l_NormalPriority_0 (copy), l_IdlePriority_0 (copy), l_NoPriority_0 (copy), l_invariant_0 (copy)
    if v25 == 15 or v25 == 14 then
        return l_ImmediatePriority_0;
    elseif v25 == 13 or v25 == 12 or v25 == 11 or v25 == 10 then
        return l_UserBlockingPriority_0;
    elseif v25 == 9 or v25 == 8 or v25 == 7 or v25 == 6 or v25 == 4 or v25 == 5 then
        return l_NormalPriority_0;
    elseif v25 == 3 or v25 == 2 or v25 == 1 then
        return l_IdlePriority_0;
    elseif v25 == 0 then
        return l_NoPriority_0;
    else
        l_invariant_0(false, "Invalid update priority: %s. This is a bug in React.", v25);
        error("unreachable");
        return;
    end;
end;
local v26 = nil;
local v27 = nil;
local v28 = nil;
v12.getNextLanes = function(v29, v30) --[[ Line: 298 ]] --[[ Name: getNextLanes ]]
    -- upvalues: l_DefaultLanePriority_0 (ref), v23 (copy), v27 (ref), v26 (ref)
    local l_pendingLanes_0 = v29.pendingLanes;
    if l_pendingLanes_0 == 0 then
        l_DefaultLanePriority_0 = 0;
        return 0;
    else
        local v32 = 0;
        local v33 = 0;
        local l_expiredLanes_0 = v29.expiredLanes;
        local l_suspendedLanes_0 = v29.suspendedLanes;
        local l_pingedLanes_0 = v29.pingedLanes;
        if l_expiredLanes_0 ~= 0 then
            v32 = l_expiredLanes_0;
            l_DefaultLanePriority_0 = 15;
            v33 = 15;
        else
            local v37 = bit32.band(l_pendingLanes_0, 134217727);
            if v37 ~= 0 then
                local v38 = bit32.band(v37, (bit32.bnot(l_suspendedLanes_0)));
                if v38 ~= 0 then
                    v32 = v23(v38);
                    v33 = l_DefaultLanePriority_0;
                else
                    local v39 = bit32.band(v37, l_pingedLanes_0);
                    if v39 ~= 0 then
                        v32 = v23(v39);
                        v33 = l_DefaultLanePriority_0;
                    end;
                end;
            else
                local v40 = bit32.band(l_pendingLanes_0, (bit32.bnot(l_suspendedLanes_0)));
                if v40 ~= 0 then
                    v32 = v23(v40);
                    v33 = l_DefaultLanePriority_0;
                elseif l_pingedLanes_0 ~= 0 then
                    v32 = v23(l_pingedLanes_0);
                    v33 = l_DefaultLanePriority_0;
                end;
            end;
        end;
        if v32 == 0 then
            return 0;
        else
            v32 = bit32.band(l_pendingLanes_0, bit32.lshift(v27(v32), 1) - 1);
            if v30 ~= 0 and v30 ~= v32 and bit32.band(v30, l_suspendedLanes_0) == 0 then
                v23(v30);
                if v33 <= l_DefaultLanePriority_0 then
                    return v30;
                else
                    l_DefaultLanePriority_0 = v33;
                end;
            end;
            local l_entangledLanes_0 = v29.entangledLanes;
            if l_entangledLanes_0 ~= 0 then
                local l_entanglements_0 = v29.entanglements;
                local v43 = bit32.band(v32, l_entangledLanes_0);
                while v43 > 0 do
                    local v44 = v26(v43);
                    local v45 = bit32.lshift(1, v44);
                    v32 = bit32.bor(v32, l_entanglements_0[v44]);
                    v43 = bit32.band(v43, (bit32.bnot(v45)));
                end;
            end;
            return v32;
        end;
    end;
end;
v12.getMostRecentEventTime = function(v46, v47) --[[ Line: 417 ]] --[[ Name: getMostRecentEventTime ]]
    -- upvalues: v26 (ref)
    local l_eventTimes_0 = v46.eventTimes;
    local v49 = -1;
    while v47 > 0 do
        local v50 = v26(v47);
        local v51 = bit32.lshift(1, v50);
        local v52 = l_eventTimes_0[v50];
        if v49 < v52 then
            v49 = v52;
        end;
        v47 = bit32.band(v47, (bit32.bnot(v51)));
    end;
    return v49;
end;
v12.computeExpirationTime = function(v53, v54) --[[ Line: 437 ]] --[[ Name: computeExpirationTime ]]
    -- upvalues: v23 (copy), l_DefaultLanePriority_0 (ref)
    v23(v53);
    local l_l_DefaultLanePriority_0_0 = l_DefaultLanePriority_0;
    if l_l_DefaultLanePriority_0_0 >= 10 then
        return v54 + 250;
    elseif l_l_DefaultLanePriority_0_0 >= 6 then
        return v54 + 5000;
    else
        return -1;
    end;
end;
v12.markStarvedLanesAsExpired = function(v56, v57) --[[ Line: 467 ]] --[[ Name: markStarvedLanesAsExpired ]]
    -- upvalues: v26 (ref), v23 (copy), l_DefaultLanePriority_0 (ref)
    local l_pendingLanes_1 = v56.pendingLanes;
    local l_suspendedLanes_1 = v56.suspendedLanes;
    local l_pingedLanes_1 = v56.pingedLanes;
    local l_expirationTimes_0 = v56.expirationTimes;
    local l_l_pendingLanes_1_0 = l_pendingLanes_1;
    while l_l_pendingLanes_1_0 > 0 do
        local v63 = v26(l_l_pendingLanes_1_0);
        local v64 = bit32.lshift(1, v63);
        local v65 = l_expirationTimes_0[v63];
        if v65 == -1 then
            if bit32.band(v64, l_suspendedLanes_1) == 0 or bit32.band(v64, l_pingedLanes_1) ~= 0 then
                v23(v64);
                local l_l_DefaultLanePriority_0_1 = l_DefaultLanePriority_0;
                l_expirationTimes_0[v63] = if l_l_DefaultLanePriority_0_1 >= 10 then v57 + 250 else if l_l_DefaultLanePriority_0_1 >= 6 then v57 + 5000 else -1;
            end;
        elseif v65 <= v57 then
            v56.expiredLanes = bit32.bor(v56.expiredLanes, v64);
        end;
        l_l_pendingLanes_1_0 = bit32.band(l_l_pendingLanes_1_0, (bit32.bnot(v64)));
    end;
end;
v12.getHighestPriorityPendingLanes = function(v67) --[[ Line: 509 ]] --[[ Name: getHighestPriorityPendingLanes ]]
    -- upvalues: v23 (copy)
    return (v23(v67.pendingLanes));
end;
v12.getLanesToRetrySynchronouslyOnError = function(v68) --[[ Line: 514 ]] --[[ Name: getLanesToRetrySynchronouslyOnError ]]
    local v69 = bit32.band(v68.pendingLanes, 3221225471);
    if v69 ~= 0 then
        return v69;
    elseif bit32.band(v69, 1073741824) ~= 0 then
        return 1073741824;
    else
        return 0;
    end;
end;
v12.returnNextLanesPriority = function() --[[ Line: 527 ]] --[[ Name: returnNextLanesPriority ]]
    -- upvalues: l_DefaultLanePriority_0 (ref)
    return l_DefaultLanePriority_0;
end;
v12.includesNonIdleWork = function(v70) --[[ Line: 532 ]] --[[ Name: includesNonIdleWork ]]
    return bit32.band(v70, 134217727) ~= 0;
end;
v12.includesOnlyRetries = function(v71) --[[ Line: 537 ]] --[[ Name: includesOnlyRetries ]]
    return bit32.band(v71, 62914560) == v71;
end;
v12.includesOnlyTransitions = function(v72) --[[ Line: 542 ]] --[[ Name: includesOnlyTransitions ]]
    return bit32.band(v72, 4186112) == v72;
end;
local v73 = nil;
local function v74(v75, v76) --[[ Line: 552 ]] --[[ Name: findUpdateLane ]]
    -- upvalues: v73 (ref), v74 (copy), l_invariant_0 (copy)
    if v75 ~= 0 then
        if v75 == 15 then
            return 1;
        elseif v75 == 14 then
            return 2;
        elseif v75 == 12 then
            local v77 = v73((bit32.band(24, (bit32.bnot(v76)))));
            if v77 == 0 then
                return v74(10, v76);
            else
                return v77;
            end;
        elseif v75 == 10 then
            local v78 = v73((bit32.band(192, (bit32.bnot(v76)))));
            if v78 == 0 then
                return v74(8, v76);
            else
                return v78;
            end;
        elseif v75 == 8 then
            local v79 = v73((bit32.band(3584, (bit32.bnot(v76)))));
            if v79 == 0 then
                v79 = v73((bit32.band(4186112, (bit32.bnot(v76)))));
                if v79 == 0 then
                    v79 = v73(3584);
                end;
            end;
            return v79;
        elseif v75 ~= 6 and v75 ~= 5 and v75 == 2 then
            local v80 = v73((bit32.band(805306368, (bit32.bnot(v76)))));
            if v80 == 0 then
                v80 = v73(805306368);
            end;
            return v80;
        end;
    end;
    l_invariant_0(false, "Invalid update priority: %s. This is a bug in React.", v75);
    error("unreachable");
end;
v12.findUpdateLane = v74;
v12.findTransitionLane = function(v81, v82) --[[ Line: 611 ]] --[[ Name: findTransitionLane ]]
    -- upvalues: v73 (ref)
    local v83 = v73((bit32.band(4186112, (bit32.bnot(v82)))));
    if v83 == 0 then
        v83 = v73((bit32.band(4186112, (bit32.bnot(v81)))));
        if v83 == 0 then
            v83 = v73(4186112);
        end;
    end;
    return v83;
end;
v12.findRetryLane = function(v84) --[[ Line: 631 ]] --[[ Name: findRetryLane ]]
    -- upvalues: v73 (ref)
    local v85 = v73((bit32.band(62914560, (bit32.bnot(v84)))));
    if v85 == 0 then
        v85 = v73(62914560);
    end;
    return v85;
end;
local function _(v86) --[[ Line: 643 ]] --[[ Name: getHighestPriorityLane ]]
    return (bit32.band(v86, -v86));
end;
v27 = function(v88) --[[ Line: 647 ]] --[[ Name: getLowestPriorityLane ]]
    local v89 = 31 - bit32.countlz(v88);
    if v89 < 0 then
        return 0;
    else
        return (bit32.lshift(1, v89));
    end;
end;
v28 = function(v90) --[[ Line: 657 ]] --[[ Name: getEqualOrHigherPriorityLanes ]]
    -- upvalues: v27 (ref)
    return bit32.lshift(v27(v90), 1) - 1;
end;
v73 = function(v91) --[[ Line: 661 ]] --[[ Name: pickArbitraryLane ]]
    return (bit32.band(v91, -v91));
end;
v12.pickArbitraryLane = v73;
v26 = function(v92) --[[ Line: 670 ]] --[[ Name: pickArbitraryLaneIndex ]]
    return 31 - bit32.countlz(v92);
end;
v12.includesSomeLane = function(v93, v94) --[[ Line: 679 ]] --[[ Name: includesSomeLane ]]
    return bit32.band(v93, v94) ~= 0;
end;
v12.isSubsetOfLanes = function(v95, v96) --[[ Line: 684 ]] --[[ Name: isSubsetOfLanes ]]
    return bit32.band(v95, v96) == v96;
end;
local function v99(v97, v98) --[[ Line: 689 ]] --[[ Name: mergeLanes ]]
    return (bit32.bor(v97, v98));
end;
v12.mergeLanes = if v4 then bit32.bor else v99;
v12.removeLanes = function(v100, v101) --[[ Line: 697 ]] --[[ Name: removeLanes ]]
    return (bit32.band(v100, (bit32.bnot(v101))));
end;
v12.laneToLanes = function(v102) --[[ Line: 704 ]] --[[ Name: laneToLanes ]]
    return v102;
end;
v12.higherPriorityLane = function(v103, v104) --[[ Line: 709 ]] --[[ Name: higherPriorityLane ]]
    if v103 ~= 0 and v104 ~= 0 then
        if v103 < v104 then
            return v103;
        else
            return v104;
        end;
    elseif v103 ~= 0 then
        return v103;
    else
        return v104;
    end;
end;
v12.higherLanePriority = function(v105, v106) --[[ Line: 725 ]] --[[ Name: higherLanePriority ]]
    if v105 ~= 0 and v106 < v105 then
        return v105;
    else
        return v106;
    end;
end;
v12.createLaneMap = function(v107) --[[ Line: 736 ]] --[[ Name: createLaneMap ]]
    return {
        [0] = v107, 
        [1] = v107, 
        [2] = v107, 
        [3] = v107, 
        [4] = v107, 
        [5] = v107, 
        [6] = v107, 
        [7] = v107, 
        [8] = v107, 
        [9] = v107, 
        [10] = v107, 
        [11] = v107, 
        [12] = v107, 
        [13] = v107, 
        [14] = v107, 
        [15] = v107, 
        [16] = v107, 
        [17] = v107, 
        [18] = v107, 
        [19] = v107, 
        [20] = v107, 
        [21] = v107, 
        [22] = v107, 
        [23] = v107, 
        [24] = v107, 
        [25] = v107, 
        [26] = v107, 
        [27] = v107, 
        [28] = v107, 
        [29] = v107, 
        [30] = v107, 
        [31] = v107
    };
end;
v12.markRootUpdated = function(v108, v109, v110) --[[ Line: 780 ]] --[[ Name: markRootUpdated ]]
    v108.pendingLanes = bit32.bor(v108.pendingLanes, v109);
    local v111 = v109 - 1;
    v108.suspendedLanes = bit32.band(v108.suspendedLanes, v111);
    v108.pingedLanes = bit32.band(v108.pingedLanes, v111);
    v108.eventTimes[31 - bit32.countlz(v109)] = v110;
end;
v12.markRootSuspended = function(v112, v113) --[[ Line: 809 ]] --[[ Name: markRootSuspended ]]
    -- upvalues: v26 (ref)
    v112.suspendedLanes = bit32.bor(v112.suspendedLanes, v113);
    v112.pingedLanes = bit32.band(v112.pingedLanes, (bit32.bnot(v113)));
    local l_expirationTimes_1 = v112.expirationTimes;
    local l_v113_0 = v113;
    while l_v113_0 > 0 do
        local v116 = v26(l_v113_0);
        local v117 = bit32.lshift(1, v116);
        l_expirationTimes_1[v116] = -1;
        l_v113_0 = bit32.band(l_v113_0, (bit32.bnot(v117)));
    end;
end;
v12.markRootPinged = function(v118, v119, _) --[[ Line: 827 ]] --[[ Name: markRootPinged ]]
    v118.pingedLanes = bit32.bor(v118.pingedLanes, (bit32.band(v118.suspendedLanes, v119)));
end;
v12.markRootExpired = function(v121, v122) --[[ Line: 833 ]] --[[ Name: markRootExpired ]]
    v121.expiredLanes = bit32.bor(v121.expiredLanes, (bit32.band(v122, v121.pendingLanes)));
end;
v12.markDiscreteUpdatesExpired = function(v123) --[[ Line: 839 ]] --[[ Name: markDiscreteUpdatesExpired ]]
    v123.expiredLanes = bit32.bor(v123.expiredLanes, (bit32.band(24, v123.pendingLanes)));
end;
v12.hasDiscreteLanes = function(v124) --[[ Line: 845 ]] --[[ Name: hasDiscreteLanes ]]
    return bit32.band(v124, 24) ~= 0;
end;
v12.markRootMutableRead = function(v125, v126) --[[ Line: 850 ]] --[[ Name: markRootMutableRead ]]
    v125.mutableReadLanes = bit32.bor(v125.mutableReadLanes, (bit32.band(v126, v125.pendingLanes)));
end;
v12.markRootFinished = function(v127, v128) --[[ Line: 856 ]] --[[ Name: markRootFinished ]]
    -- upvalues: v26 (ref)
    local v129 = bit32.band(v127.pendingLanes, (bit32.bnot(v128)));
    v127.pendingLanes = v128;
    v127.suspendedLanes = 0;
    v127.pingedLanes = 0;
    v127.expiredLanes = bit32.band(v127.expiredLanes, v128);
    v127.mutableReadLanes = bit32.band(v127.mutableReadLanes, v128);
    v127.entangledLanes = bit32.band(v127.entangledLanes, v128);
    local l_entanglements_1 = v127.entanglements;
    local l_eventTimes_1 = v127.eventTimes;
    local l_expirationTimes_2 = v127.expirationTimes;
    local l_v129_0 = v129;
    while l_v129_0 > 0 do
        local v134 = v26(l_v129_0);
        local v135 = bit32.lshift(1, v134);
        l_entanglements_1[v134] = 0;
        l_eventTimes_1[v134] = -1;
        l_expirationTimes_2[v134] = -1;
        l_v129_0 = bit32.band(l_v129_0, (bit32.bnot(v135)));
    end;
end;
v12.markRootEntangled = function(v136, v137) --[[ Line: 889 ]] --[[ Name: markRootEntangled ]]
    -- upvalues: v26 (ref)
    v136.entangledLanes = bit32.bor(v136.entangledLanes, v137);
    local l_entanglements_2 = v136.entanglements;
    local l_v137_0 = v137;
    while l_v137_0 > 0 do
        local v140 = v26(l_v137_0);
        local v141 = bit32.lshift(1, v140);
        l_entanglements_2[v140] = bit32.bor(l_entanglements_2[v140], v137);
        l_v137_0 = bit32.band(l_v137_0, (bit32.bnot(v141)));
    end;
end;
v12.getBumpedLaneForHydration = function(v142, v143) --[[ Line: 905 ]] --[[ Name: getBumpedLaneForHydration ]]
    -- upvalues: v23 (copy), l_DefaultLanePriority_0 (ref), l_invariant_0 (copy)
    v23(v143);
    local l_l_DefaultLanePriority_0_2 = l_DefaultLanePriority_0;
    local v145 = nil;
    if l_l_DefaultLanePriority_0_2 == 15 or l_l_DefaultLanePriority_0_2 == 14 then
        v145 = 0;
    elseif l_l_DefaultLanePriority_0_2 == 13 or l_l_DefaultLanePriority_0_2 == 12 then
        v145 = 4;
    elseif l_l_DefaultLanePriority_0_2 == 11 or l_l_DefaultLanePriority_0_2 == 10 then
        v145 = 32;
    elseif l_l_DefaultLanePriority_0_2 == 9 or l_l_DefaultLanePriority_0_2 == 8 then
        v145 = 256;
    elseif l_l_DefaultLanePriority_0_2 == 7 or l_l_DefaultLanePriority_0_2 == 6 then
        v145 = 4096;
    elseif l_l_DefaultLanePriority_0_2 == 5 then
        v145 = 4096;
    elseif l_l_DefaultLanePriority_0_2 == 4 then
        v145 = 67108864;
    elseif l_l_DefaultLanePriority_0_2 == 3 or l_l_DefaultLanePriority_0_2 == 2 then
        v145 = 134217728;
    elseif l_l_DefaultLanePriority_0_2 == 1 or l_l_DefaultLanePriority_0_2 == 0 then
        v145 = 0;
    else
        l_invariant_0(false, "Invalid lane: %s. This is a bug in React.", (tostring(v145)));
    end;
    if bit32.band(v145, (bit32.bor(v142.suspendedLanes, v143))) ~= 0 then
        return 0;
    else
        return v145;
    end;
end;
return v12;