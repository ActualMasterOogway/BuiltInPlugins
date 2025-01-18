local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.SetHistoryFrame);
local v3 = require(l_Actions_0.SetHistoryOffset);
local l_Reducers_0 = l_script_FirstAncestor_0.Src.Reducers;
local _ = require(l_Reducers_0.DebugData);
local _ = require(l_Reducers_0.Status);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v8 = require(l_Thunks_0.RenderAdornments);
return function(v9, v10) --[[ Line: 19 ]]
    -- upvalues: v3 (copy), v2 (copy), v8 (copy)
    return function(v11) --[[ Line: 20 ]]
        -- upvalues: v9 (copy), v3 (ref), v2 (ref), v10 (copy), v8 (ref)
        local v12 = v11:getState();
        local l_DebugData_0 = v12.DebugData;
        local l_Status_0 = v12.Status;
        local l_FrameBuffer_0 = l_DebugData_0.FrameBuffer;
        local l_DebugPoseEvent_0 = l_Status_0.DebugPoseEvent;
        local l_SelectedLayer_0 = l_Status_0.SelectedLayer;
        if v9 then
            local l_last_0 = l_FrameBuffer_0.last;
            if not l_last_0 then
                return;
            else
                local v19 = 1;
                if v9 ~= 0 then
                    local v20 = l_last_0.timestamp + v9;
                    for v21 = 2, l_FrameBuffer_0:getSize() do
                        if l_FrameBuffer_0[v21] then
                            if l_last_0.timestamp > v20 then
                                l_last_0 = l_FrameBuffer_0[v21];
                                v19 = v21;
                            else
                                break;
                            end;
                        end;
                    end;
                end;
                local v22 = if l_SelectedLayer_0 then l_last_0.layerMap[l_SelectedLayer_0] else l_last_0.payload;
                local v23 = v22 and v22.animationPose;
                local l_hrpCFrame_0 = l_last_0.payload.hrpCFrame;
                if l_DebugPoseEvent_0 then
                    l_DebugPoseEvent_0:Fire(v23, l_hrpCFrame_0);
                end;
                v11:dispatch(v3(v9));
                v11:dispatch(v2(v19));
            end;
        elseif v10 then
            local v25 = (l_Status_0.HistoryFrame or 1) + v10;
            if v25 < 1 or l_FrameBuffer_0:getSize() < v25 or not l_FrameBuffer_0[v25] then
                return;
            else
                local v26 = l_FrameBuffer_0[v25];
                local v27 = v26.timestamp - l_FrameBuffer_0.last.timestamp;
                local v28 = if l_SelectedLayer_0 then v26.layerMap[l_SelectedLayer_0] else v26.payload;
                local v29 = v28 and v28.animationPose;
                local l_hrpCFrame_1 = v26.payload.hrpCFrame;
                if l_DebugPoseEvent_0 then
                    l_DebugPoseEvent_0:Fire(v29, l_hrpCFrame_1);
                end;
                v11:dispatch(v3(v27));
                v11:dispatch(v2(v25));
            end;
        else
            if l_DebugPoseEvent_0 then
                l_DebugPoseEvent_0:Fire(nil, nil);
            end;
            v11:dispatch(v3(nil));
            v11:dispatch(v2(nil));
        end;
        v11:dispatch(v8());
    end;
end;