local l_Parent_0 = script.Parent.Parent;
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_console_0 = require(l_Parent_0.Shared).console;
local _ = require(script.Parent.ReactInternalTypes);
local v4 = require(script.Parent.ReactFiberLane);
local l_NoLane_0 = v4.NoLane;
local l_NoLanes_0 = v4.NoLanes;
local l_isSubsetOfLanes_0 = v4.isSubsetOfLanes;
local l_mergeLanes_0 = v4.mergeLanes;
local v9 = nil;
local function _() --[[ Line: 111 ]] --[[ Name: enterDisallowedContextReadInDEV ]]
    -- upvalues: v9 (ref)
    if not v9 then
        v9 = require(script.Parent["ReactFiberNewContext.new"]);
    end;
    v9.enterDisallowedContextReadInDEV();
end;
local function _() --[[ Line: 117 ]] --[[ Name: exitDisallowedContextReadInDEV ]]
    -- upvalues: v9 (ref)
    if not v9 then
        v9 = require(script.Parent["ReactFiberNewContext.new"]);
    end;
    v9.exitDisallowedContextReadInDEV();
end;
local v12 = require(script.Parent.ReactFiberFlags);
local l_Callback_0 = v12.Callback;
local l_ShouldCapture_0 = v12.ShouldCapture;
local l_DidCapture_0 = v12.DidCapture;
local l_debugRenderPhaseSideEffectsForStrictMode_0 = require(l_Parent_0.Shared).ReactFeatureFlags.debugRenderPhaseSideEffectsForStrictMode;
local l_StrictMode_0 = require(script.Parent.ReactTypeOfMode).StrictMode;
local l_markSkippedUpdateLanes_0 = require(script.Parent.ReactFiberWorkInProgress).markSkippedUpdateLanes;
local l_invariant_0 = require(l_Parent_0.Shared).invariant;
local l_describeError_0 = require(l_Parent_0.Shared).describeError;
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local v24 = {
    UpdateState = 0, 
    ReplaceState = 1, 
    ForceUpdate = 2, 
    CaptureUpdate = 3
};
local v25 = false;
local v26 = nil;
local v27 = nil;
if _G.__DEV__ then
    v26 = false;
    v27 = nil;
    v24.resetCurrentlyProcessingQueue = function() --[[ Line: 173 ]]
        -- upvalues: v27 (ref)
        v27 = nil;
    end;
end;
local v28 = table.create(210);
local v29 = 210;
for v30 = 1, 210 do
    v28[v30] = {
        eventTime = -1, 
        lane = -1, 
        tag = -1, 
        payload = nil, 
        callback = nil, 
        next = nil
    };
end;
v24.initializeUpdateQueue = function(v31) --[[ Line: 194 ]] --[[ Name: initializeUpdateQueue ]]
    v31.updateQueue = {
        baseState = v31.memoizedState, 
        firstBaseUpdate = nil, 
        lastBaseUpdate = nil, 
        shared = {
            pending = nil
        }, 
        effects = nil
    };
end;
v24.cloneUpdateQueue = function(v32, v33) --[[ Line: 208 ]] --[[ Name: cloneUpdateQueue ]]
    local l_updateQueue_0 = v33.updateQueue;
    local l_updateQueue_1 = v32.updateQueue;
    if l_updateQueue_0 == l_updateQueue_1 then
        v33.updateQueue = {
            baseState = l_updateQueue_1.baseState, 
            firstBaseUpdate = l_updateQueue_1.firstBaseUpdate, 
            lastBaseUpdate = l_updateQueue_1.lastBaseUpdate, 
            shared = l_updateQueue_1.shared, 
            effects = l_updateQueue_1.effects
        };
    end;
end;
v24.createUpdate = function(v36, v37) --[[ Line: 228 ]] --[[ Name: createUpdate ]]
    -- upvalues: v29 (ref), v28 (copy)
    if v29 > 0 then
        local v38 = v28[v29];
        v28[v29] = nil;
        v29 = v29 - 1;
        v38.eventTime = v36;
        v38.lane = v37;
        v38.tag = 0;
        return v38;
    else
        return {
            eventTime = v36, 
            lane = v37, 
            tag = 0, 
            payload = nil, 
            callback = nil, 
            next = nil
        };
    end;
end;
v24.enqueueUpdate = function(v39, v40) --[[ Line: 270 ]] --[[ Name: enqueueUpdate ]]
    -- upvalues: v27 (ref), v26 (ref), l_console_0 (copy)
    local l_updateQueue_2 = v39.updateQueue;
    if l_updateQueue_2 == nil then
        return;
    else
        local l_shared_0 = l_updateQueue_2.shared;
        local l_pending_0 = l_shared_0.pending;
        if l_pending_0 == nil then
            v40.next = v40;
        else
            v40.next = l_pending_0.next;
            l_pending_0.next = v40;
        end;
        l_shared_0.pending = v40;
        if _G.__DEV__ and v27 == l_shared_0 and not v26 then
            l_console_0.error("An update (setState, replaceState, or forceUpdate) was scheduled " .. "from inside an update function. Update functions should be pure, " .. "with zero side-effects. Consider using componentDidUpdate or a " .. "callback.");
            v26 = true;
        end;
        return;
    end;
end;
v24.enqueueCapturedUpdate = function(v44, v45) --[[ Line: 305 ]] --[[ Name: enqueueCapturedUpdate ]]
    local l_updateQueue_3 = v44.updateQueue;
    local l_alternate_0 = v44.alternate;
    if l_alternate_0 ~= nil then
        local l_updateQueue_4 = l_alternate_0.updateQueue;
        if l_updateQueue_3 == l_updateQueue_4 then
            local v49 = nil;
            local v50 = nil;
            local l_firstBaseUpdate_0 = l_updateQueue_3.firstBaseUpdate;
            if l_firstBaseUpdate_0 ~= nil then
                local l_l_firstBaseUpdate_0_0 = l_firstBaseUpdate_0;
                repeat
                    local v53 = {
                        eventTime = l_l_firstBaseUpdate_0_0.eventTime, 
                        lane = l_l_firstBaseUpdate_0_0.lane, 
                        tag = l_l_firstBaseUpdate_0_0.tag, 
                        payload = l_l_firstBaseUpdate_0_0.payload, 
                        callback = l_l_firstBaseUpdate_0_0.callback, 
                        next = nil
                    };
                    if v50 == nil then
                        v50 = v53;
                        v49 = v53;
                    else
                        v50.next = v53;
                        v50 = v53;
                    end;
                    l_l_firstBaseUpdate_0_0 = l_l_firstBaseUpdate_0_0.next;
                until l_l_firstBaseUpdate_0_0 == nil;
                if v50 == nil then
                    v50 = v45;
                    v49 = v45;
                else
                    v50.next = v45;
                    v50 = v45;
                end;
            else
                v50 = v45;
                v49 = v45;
            end;
            v44.updateQueue = {
                baseState = l_updateQueue_4.baseState, 
                firstBaseUpdate = v49, 
                lastBaseUpdate = v50, 
                shared = l_updateQueue_4.shared, 
                effects = l_updateQueue_4.effects
            };
            return;
        end;
    end;
    local l_lastBaseUpdate_0 = l_updateQueue_3.lastBaseUpdate;
    if l_lastBaseUpdate_0 == nil then
        l_updateQueue_3.firstBaseUpdate = v45;
    else
        l_lastBaseUpdate_0.next = v45;
    end;
    l_updateQueue_3.lastBaseUpdate = v45;
end;
local function v73(v55, _, v57, v58, v59, _) --[[ Line: 389 ]] --[[ Name: getStateFromUpdate ]]
    -- upvalues: v9 (ref), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_describeError_0 (copy), l_reenableLogs_0 (copy), l_ShouldCapture_0 (copy), l_DidCapture_0 (copy), l_Object_0 (copy), v25 (ref)
    if v57.tag == 1 then
        local l_payload_0 = v57.payload;
        if typeof(l_payload_0) == "function" then
            if _G.__DEV__ then
                if not v9 then
                    v9 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v9.enterDisallowedContextReadInDEV();
            end;
            local v62 = l_payload_0(v58, v59);
            if _G.__DEV__ then
                if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v55.mode, l_StrictMode_0) ~= 0 then
                    l_disableLogs_0();
                    local v63 = nil;
                    local v64 = nil;
                    if not _G.__YOLO__ then
                        local v65, v66 = xpcall(l_payload_0, l_describeError_0, v58, v59);
                        v63 = v65;
                        v64 = v66;
                    else
                        v63 = true;
                        l_payload_0(v58, v59);
                    end;
                    l_reenableLogs_0();
                    if not v63 then
                        error(v64);
                    end;
                end;
                if not v9 then
                    v9 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v9.exitDisallowedContextReadInDEV();
            end;
            return v62;
        else
            return l_payload_0;
        end;
    elseif v57.tag == 3 or v57.tag == 0 then
        if v57.tag == 3 then
            v55.flags = bit32.bor(bit32.band(v55.flags, (bit32.bnot(l_ShouldCapture_0))), l_DidCapture_0);
        end;
        local l_payload_1 = v57.payload;
        local v68 = nil;
        if typeof(l_payload_1) == "function" then
            if _G.__DEV__ then
                if not v9 then
                    v9 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v9.enterDisallowedContextReadInDEV();
            end;
            v68 = l_payload_1(v58, v59);
            if _G.__DEV__ then
                if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v55.mode, l_StrictMode_0) ~= 0 then
                    l_disableLogs_0();
                    local v69 = nil;
                    local v70 = nil;
                    if not _G.__YOLO__ then
                        local v71, v72 = xpcall(l_payload_1, l_describeError_0, v58, v59);
                        v69 = v71;
                        v70 = v72;
                    else
                        v69 = true;
                        l_payload_1(v58, v59);
                    end;
                    l_reenableLogs_0();
                    if not v69 then
                        error(v70);
                    end;
                end;
                if not v9 then
                    v9 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v9.exitDisallowedContextReadInDEV();
            end;
        else
            v68 = l_payload_1;
        end;
        if v68 == nil then
            return v58;
        else
            return l_Object_0.assign({}, v58, v68);
        end;
    elseif v57.tag == 2 then
        v25 = true;
        return v58;
    else
        return v58;
    end;
end;
v24.getStateFromUpdate = v73;
v24.processUpdateQueue = function(v74, v75, v76, v77) --[[ Line: 493 ]] --[[ Name: processUpdateQueue ]]
    -- upvalues: v25 (ref), v27 (ref), l_NoLanes_0 (copy), l_isSubsetOfLanes_0 (copy), l_mergeLanes_0 (copy), l_NoLane_0 (copy), v73 (copy), l_Callback_0 (copy), l_markSkippedUpdateLanes_0 (copy)
    local l_updateQueue_5 = v74.updateQueue;
    v25 = false;
    if _G.__DEV__ then
        v27 = l_updateQueue_5.shared;
    end;
    local l_firstBaseUpdate_1 = l_updateQueue_5.firstBaseUpdate;
    local l_lastBaseUpdate_1 = l_updateQueue_5.lastBaseUpdate;
    local l_pending_1 = l_updateQueue_5.shared.pending;
    if l_pending_1 ~= nil then
        l_updateQueue_5.shared.pending = nil;
        local l_l_pending_1_0 = l_pending_1;
        local l_next_0 = l_l_pending_1_0.next;
        l_l_pending_1_0.next = nil;
        if l_lastBaseUpdate_1 == nil then
            l_firstBaseUpdate_1 = l_next_0;
        else
            l_lastBaseUpdate_1.next = l_next_0;
        end;
        l_lastBaseUpdate_1 = l_l_pending_1_0;
        local l_alternate_1 = v74.alternate;
        if l_alternate_1 ~= nil then
            local l_updateQueue_6 = l_alternate_1.updateQueue;
            local l_lastBaseUpdate_2 = l_updateQueue_6.lastBaseUpdate;
            if l_lastBaseUpdate_2 ~= l_lastBaseUpdate_1 then
                if l_lastBaseUpdate_2 == nil then
                    l_updateQueue_6.firstBaseUpdate = l_next_0;
                else
                    l_lastBaseUpdate_2.next = l_next_0;
                end;
                l_updateQueue_6.lastBaseUpdate = l_l_pending_1_0;
            end;
        end;
    end;
    if l_firstBaseUpdate_1 ~= nil then
        local l_baseState_0 = l_updateQueue_5.baseState;
        local l_l_NoLanes_0_0 = l_NoLanes_0;
        local v89 = nil;
        local v90 = nil;
        local v91 = nil;
        local l_l_firstBaseUpdate_1_0 = l_firstBaseUpdate_1;
        while true do
            local l_lane_0 = l_l_firstBaseUpdate_1_0.lane;
            local l_eventTime_0 = l_l_firstBaseUpdate_1_0.eventTime;
            if not l_isSubsetOfLanes_0(v77, l_lane_0) then
                local v95 = {
                    eventTime = l_eventTime_0, 
                    lane = l_lane_0, 
                    tag = l_l_firstBaseUpdate_1_0.tag, 
                    payload = l_l_firstBaseUpdate_1_0.payload, 
                    callback = l_l_firstBaseUpdate_1_0.callback, 
                    next = nil
                };
                if v91 == nil then
                    v90 = v95;
                    v91 = v95;
                    v89 = l_baseState_0;
                else
                    v91.next = v95;
                    v91 = v95;
                end;
                l_l_NoLanes_0_0 = l_mergeLanes_0(l_l_NoLanes_0_0, l_lane_0);
            else
                if v91 ~= nil then
                    local v96 = {
                        eventTime = l_eventTime_0, 
                        lane = l_NoLane_0, 
                        tag = l_l_firstBaseUpdate_1_0.tag, 
                        payload = l_l_firstBaseUpdate_1_0.payload, 
                        callback = l_l_firstBaseUpdate_1_0.callback, 
                        next = nil
                    };
                    v91.next = v96;
                    v91 = v96;
                end;
                l_baseState_0 = v73(v74, l_updateQueue_5, l_l_firstBaseUpdate_1_0, l_baseState_0, v75, v76);
                if l_l_firstBaseUpdate_1_0.callback ~= nil and l_l_firstBaseUpdate_1_0.lane ~= l_NoLane_0 then
                    v74.flags = bit32.bor(v74.flags, l_Callback_0);
                    local l_effects_0 = l_updateQueue_5.effects;
                    if l_effects_0 == nil then
                        l_updateQueue_5.effects = {
                            l_l_firstBaseUpdate_1_0
                        };
                    else
                        table.insert(l_effects_0, l_l_firstBaseUpdate_1_0);
                    end;
                end;
            end;
            l_l_firstBaseUpdate_1_0 = l_l_firstBaseUpdate_1_0.next;
            if l_l_firstBaseUpdate_1_0 ~= nil then
                continue;
            end;
            l_pending_1 = l_updateQueue_5.shared.pending;
            if l_pending_1 ~= nil then
                local l_l_pending_1_1 = l_pending_1;
                local l_next_1 = l_l_pending_1_1.next;
                l_l_pending_1_1.next = nil;
                l_l_firstBaseUpdate_1_0 = l_next_1;
                l_updateQueue_5.lastBaseUpdate = l_l_pending_1_1;
                l_updateQueue_5.shared.pending = nil;
            else
                break;
            end;
        end;
        if v91 == nil then
            v89 = l_baseState_0;
        end;
        l_updateQueue_5.baseState = v89;
        l_updateQueue_5.firstBaseUpdate = v90;
        l_updateQueue_5.lastBaseUpdate = v91;
        l_markSkippedUpdateLanes_0(l_l_NoLanes_0_0);
        v74.lanes = l_l_NoLanes_0_0;
        v74.memoizedState = l_baseState_0;
    end;
    if _G.__DEV__ then
        v27 = nil;
    end;
end;
local function _(v100, v101) --[[ Line: 684 ]] --[[ Name: callCallback ]]
    -- upvalues: l_invariant_0 (copy)
    l_invariant_0(typeof(v100) == "function", "Invalid argument passed as callback. Expected a function. Instead " .. "received: %s", (tostring(v100)));
    v100(v101);
end;
v24.resetHasForceUpdateBeforeProcessing = function() --[[ Line: 694 ]]
    -- upvalues: v25 (ref)
    v25 = false;
end;
v24.checkHasForceUpdateAfterProcessing = function() --[[ Line: 698 ]]
    -- upvalues: v25 (ref)
    return v25;
end;
v24.commitUpdateQueue = function(_, v104, v105) --[[ Line: 702 ]] --[[ Name: commitUpdateQueue ]]
    -- upvalues: l_invariant_0 (copy), v28 (copy), v29 (ref)
    local l_effects_1 = v104.effects;
    v104.effects = nil;
    if l_effects_1 ~= nil then
        for _, v108 in l_effects_1 do
            local l_callback_0 = v108.callback;
            if l_callback_0 ~= nil then
                l_invariant_0(typeof(l_callback_0) == "function", "Invalid argument passed as callback. Expected a function. Instead " .. "received: %s", (tostring(l_callback_0)));
                l_callback_0(v105);
            end;
            table.clear(v108);
            table.insert(v28, v108);
            v29 = v29 + 1;
        end;
    end;
end;
return v24;