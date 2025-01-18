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
local l_ConsolePatchingDev_0 = require(l_Parent_0.Shared).ConsolePatchingDev;
local l_disableLogs_0 = l_ConsolePatchingDev_0.disableLogs;
local l_reenableLogs_0 = l_ConsolePatchingDev_0.reenableLogs;
local v23 = {
    UpdateState = 0, 
    ReplaceState = 1, 
    ForceUpdate = 2, 
    CaptureUpdate = 3
};
local v24 = false;
local v25 = nil;
local v26 = nil;
if _G.__DEV__ then
    v25 = false;
    v26 = nil;
    v23.resetCurrentlyProcessingQueue = function() --[[ Line: 172 ]]
        -- upvalues: v26 (ref)
        v26 = nil;
    end;
end;
local v27 = table.create(210);
local v28 = 210;
for v29 = 1, 210 do
    v27[v29] = {
        eventTime = -1, 
        lane = -1, 
        tag = -1, 
        payload = nil, 
        callback = nil, 
        next = nil
    };
end;
v23.initializeUpdateQueue = function(v30) --[[ Line: 193 ]] --[[ Name: initializeUpdateQueue ]]
    v30.updateQueue = {
        baseState = v30.memoizedState, 
        firstBaseUpdate = nil, 
        lastBaseUpdate = nil, 
        shared = {
            pending = nil
        }, 
        effects = nil
    };
end;
v23.cloneUpdateQueue = function(v31, v32) --[[ Line: 207 ]] --[[ Name: cloneUpdateQueue ]]
    local l_updateQueue_0 = v32.updateQueue;
    local l_updateQueue_1 = v31.updateQueue;
    if l_updateQueue_0 == l_updateQueue_1 then
        v32.updateQueue = {
            baseState = l_updateQueue_1.baseState, 
            firstBaseUpdate = l_updateQueue_1.firstBaseUpdate, 
            lastBaseUpdate = l_updateQueue_1.lastBaseUpdate, 
            shared = l_updateQueue_1.shared, 
            effects = l_updateQueue_1.effects
        };
    end;
end;
v23.createUpdate = function(v35, v36) --[[ Line: 227 ]] --[[ Name: createUpdate ]]
    -- upvalues: v28 (ref), v27 (copy)
    if v28 > 0 then
        local v37 = v27[v28];
        v27[v28] = nil;
        v28 = v28 - 1;
        v37.eventTime = v35;
        v37.lane = v36;
        v37.tag = 0;
        return v37;
    else
        return {
            eventTime = v35, 
            lane = v36, 
            tag = 0, 
            payload = nil, 
            callback = nil, 
            next = nil
        };
    end;
end;
v23.enqueueUpdate = function(v38, v39) --[[ Line: 269 ]] --[[ Name: enqueueUpdate ]]
    -- upvalues: v26 (ref), v25 (ref), l_console_0 (copy)
    local l_updateQueue_2 = v38.updateQueue;
    if l_updateQueue_2 == nil then
        return;
    else
        local l_shared_0 = l_updateQueue_2.shared;
        local l_pending_0 = l_shared_0.pending;
        if l_pending_0 == nil then
            v39.next = v39;
        else
            v39.next = l_pending_0.next;
            l_pending_0.next = v39;
        end;
        l_shared_0.pending = v39;
        if _G.__DEV__ and v26 == l_shared_0 and not v25 then
            l_console_0.error("An update (setState, replaceState, or forceUpdate) was scheduled " .. "from inside an update function. Update functions should be pure, " .. "with zero side-effects. Consider using componentDidUpdate or a " .. "callback.");
            v25 = true;
        end;
        return;
    end;
end;
v23.enqueueCapturedUpdate = function(v43, v44) --[[ Line: 304 ]] --[[ Name: enqueueCapturedUpdate ]]
    local l_updateQueue_3 = v43.updateQueue;
    local l_alternate_0 = v43.alternate;
    if l_alternate_0 ~= nil then
        local l_updateQueue_4 = l_alternate_0.updateQueue;
        if l_updateQueue_3 == l_updateQueue_4 then
            local v48 = nil;
            local v49 = nil;
            local l_firstBaseUpdate_0 = l_updateQueue_3.firstBaseUpdate;
            if l_firstBaseUpdate_0 ~= nil then
                local l_l_firstBaseUpdate_0_0 = l_firstBaseUpdate_0;
                repeat
                    local v52 = {
                        eventTime = l_l_firstBaseUpdate_0_0.eventTime, 
                        lane = l_l_firstBaseUpdate_0_0.lane, 
                        tag = l_l_firstBaseUpdate_0_0.tag, 
                        payload = l_l_firstBaseUpdate_0_0.payload, 
                        callback = l_l_firstBaseUpdate_0_0.callback, 
                        next = nil
                    };
                    if v49 == nil then
                        v49 = v52;
                        v48 = v52;
                    else
                        v49.next = v52;
                        v49 = v52;
                    end;
                    l_l_firstBaseUpdate_0_0 = l_l_firstBaseUpdate_0_0.next;
                until l_l_firstBaseUpdate_0_0 == nil;
                if v49 == nil then
                    v49 = v44;
                    v48 = v44;
                else
                    v49.next = v44;
                    v49 = v44;
                end;
            else
                v49 = v44;
                v48 = v44;
            end;
            v43.updateQueue = {
                baseState = l_updateQueue_4.baseState, 
                firstBaseUpdate = v48, 
                lastBaseUpdate = v49, 
                shared = l_updateQueue_4.shared, 
                effects = l_updateQueue_4.effects
            };
            return;
        end;
    end;
    local l_lastBaseUpdate_0 = l_updateQueue_3.lastBaseUpdate;
    if l_lastBaseUpdate_0 == nil then
        l_updateQueue_3.firstBaseUpdate = v44;
    else
        l_lastBaseUpdate_0.next = v44;
    end;
    l_updateQueue_3.lastBaseUpdate = v44;
end;
local function v72(v54, _, v56, v57, v58, _) --[[ Line: 388 ]] --[[ Name: getStateFromUpdate ]]
    -- upvalues: v9 (ref), l_debugRenderPhaseSideEffectsForStrictMode_0 (copy), l_StrictMode_0 (copy), l_disableLogs_0 (copy), l_reenableLogs_0 (copy), l_ShouldCapture_0 (copy), l_DidCapture_0 (copy), l_Object_0 (copy), v24 (ref)
    if v56.tag == 1 then
        local l_payload_0 = v56.payload;
        if typeof(l_payload_0) == "function" then
            if _G.__DEV__ then
                if not v9 then
                    v9 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v9.enterDisallowedContextReadInDEV();
            end;
            local v61 = l_payload_0(v57, v58);
            if _G.__DEV__ then
                if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v54.mode, l_StrictMode_0) ~= 0 then
                    l_disableLogs_0();
                    local v62 = nil;
                    local v63 = nil;
                    if not _G.__YOLO__ then
                        local l_status_0, l_result_0 = pcall(l_payload_0, v57, v58);
                        v62 = l_status_0;
                        v63 = l_result_0;
                    else
                        v62 = true;
                        l_payload_0(v57, v58);
                    end;
                    l_reenableLogs_0();
                    if not v62 then
                        error(v63);
                    end;
                end;
                if not v9 then
                    v9 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v9.exitDisallowedContextReadInDEV();
            end;
            return v61;
        else
            return l_payload_0;
        end;
    elseif v56.tag == 3 or v56.tag == 0 then
        if v56.tag == 3 then
            v54.flags = bit32.bor(bit32.band(v54.flags, (bit32.bnot(l_ShouldCapture_0))), l_DidCapture_0);
        end;
        local l_payload_1 = v56.payload;
        local v67 = nil;
        if typeof(l_payload_1) == "function" then
            if _G.__DEV__ then
                if not v9 then
                    v9 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v9.enterDisallowedContextReadInDEV();
            end;
            v67 = l_payload_1(v57, v58);
            if _G.__DEV__ then
                if l_debugRenderPhaseSideEffectsForStrictMode_0 and bit32.band(v54.mode, l_StrictMode_0) ~= 0 then
                    l_disableLogs_0();
                    local v68 = nil;
                    local v69 = nil;
                    if not _G.__YOLO__ then
                        local l_status_1, l_result_1 = pcall(l_payload_1, v57, v58);
                        v68 = l_status_1;
                        v69 = l_result_1;
                    else
                        v68 = true;
                        l_payload_1(v57, v58);
                    end;
                    l_reenableLogs_0();
                    if not v68 then
                        error(v69);
                    end;
                end;
                if not v9 then
                    v9 = require(script.Parent["ReactFiberNewContext.new"]);
                end;
                v9.exitDisallowedContextReadInDEV();
            end;
        else
            v67 = l_payload_1;
        end;
        if v67 == nil then
            return v57;
        else
            return l_Object_0.assign({}, v57, v67);
        end;
    elseif v56.tag == 2 then
        v24 = true;
        return v57;
    else
        return v57;
    end;
end;
v23.getStateFromUpdate = v72;
v23.processUpdateQueue = function(v73, v74, v75, v76) --[[ Line: 492 ]] --[[ Name: processUpdateQueue ]]
    -- upvalues: v24 (ref), v26 (ref), l_NoLanes_0 (copy), l_isSubsetOfLanes_0 (copy), l_mergeLanes_0 (copy), l_NoLane_0 (copy), v72 (copy), l_Callback_0 (copy), l_markSkippedUpdateLanes_0 (copy)
    local l_updateQueue_5 = v73.updateQueue;
    v24 = false;
    if _G.__DEV__ then
        v26 = l_updateQueue_5.shared;
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
        local l_alternate_1 = v73.alternate;
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
        local v88 = nil;
        local v89 = nil;
        local v90 = nil;
        local l_l_firstBaseUpdate_1_0 = l_firstBaseUpdate_1;
        while true do
            local l_lane_0 = l_l_firstBaseUpdate_1_0.lane;
            local l_eventTime_0 = l_l_firstBaseUpdate_1_0.eventTime;
            if not l_isSubsetOfLanes_0(v76, l_lane_0) then
                local v94 = {
                    eventTime = l_eventTime_0, 
                    lane = l_lane_0, 
                    tag = l_l_firstBaseUpdate_1_0.tag, 
                    payload = l_l_firstBaseUpdate_1_0.payload, 
                    callback = l_l_firstBaseUpdate_1_0.callback, 
                    next = nil
                };
                if v90 == nil then
                    v89 = v94;
                    v90 = v94;
                    v88 = l_baseState_0;
                else
                    v90.next = v94;
                    v90 = v94;
                end;
                l_l_NoLanes_0_0 = l_mergeLanes_0(l_l_NoLanes_0_0, l_lane_0);
            else
                if v90 ~= nil then
                    local v95 = {
                        eventTime = l_eventTime_0, 
                        lane = l_NoLane_0, 
                        tag = l_l_firstBaseUpdate_1_0.tag, 
                        payload = l_l_firstBaseUpdate_1_0.payload, 
                        callback = l_l_firstBaseUpdate_1_0.callback, 
                        next = nil
                    };
                    v90.next = v95;
                    v90 = v95;
                end;
                l_baseState_0 = v72(v73, l_updateQueue_5, l_l_firstBaseUpdate_1_0, l_baseState_0, v74, v75);
                if l_l_firstBaseUpdate_1_0.callback ~= nil and l_l_firstBaseUpdate_1_0.lane ~= l_NoLane_0 then
                    v73.flags = bit32.bor(v73.flags, l_Callback_0);
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
        if v90 == nil then
            v88 = l_baseState_0;
        end;
        l_updateQueue_5.baseState = v88;
        l_updateQueue_5.firstBaseUpdate = v89;
        l_updateQueue_5.lastBaseUpdate = v90;
        l_markSkippedUpdateLanes_0(l_l_NoLanes_0_0);
        v73.lanes = l_l_NoLanes_0_0;
        v73.memoizedState = l_baseState_0;
    end;
    if _G.__DEV__ then
        v26 = nil;
    end;
end;
local function _(v99, v100) --[[ Line: 683 ]] --[[ Name: callCallback ]]
    -- upvalues: l_invariant_0 (copy)
    l_invariant_0(typeof(v99) == "function", "Invalid argument passed as callback. Expected a function. Instead " .. "received: %s", (tostring(v99)));
    v99(v100);
end;
v23.resetHasForceUpdateBeforeProcessing = function() --[[ Line: 693 ]]
    -- upvalues: v24 (ref)
    v24 = false;
end;
v23.checkHasForceUpdateAfterProcessing = function() --[[ Line: 697 ]]
    -- upvalues: v24 (ref)
    return v24;
end;
v23.commitUpdateQueue = function(_, v103, v104) --[[ Line: 701 ]] --[[ Name: commitUpdateQueue ]]
    -- upvalues: l_invariant_0 (copy), v27 (copy), v28 (ref)
    local l_effects_1 = v103.effects;
    v103.effects = nil;
    if l_effects_1 ~= nil then
        for _, v107 in ipairs(l_effects_1) do
            local l_callback_0 = v107.callback;
            if l_callback_0 ~= nil then
                l_invariant_0(typeof(l_callback_0) == "function", "Invalid argument passed as callback. Expected a function. Instead " .. "received: %s", (tostring(l_callback_0)));
                l_callback_0(v104);
            end;
            table.clear(v107);
            table.insert(v27, v107);
            v28 = v28 + 1;
        end;
    end;
end;
return v23;