return function() --[[ Line: 6 ]]
    return function(v0) --[[ Line: 7 ]]
        local v1 = v0:getState();
        local l_FrameBuffer_0 = v1.DebugData.FrameBuffer;
        local l_Status_0 = v1.Status;
        local l_Adornments_0 = l_Status_0.Adornments;
        local l_HistoryFrame_0 = l_Status_0.HistoryFrame;
        local v6 = if l_FrameBuffer_0 then l_FrameBuffer_0[l_HistoryFrame_0 or 1] else nil;
        if v6 then
            for v7, v8 in l_Adornments_0 do
                local l_gizmo_0 = v8.gizmo;
                if l_gizmo_0 then
                    local v10 = v6.layerMap[v7];
                    if v10 and v10.weight > 0 and v8.enabled then
                        l_gizmo_0:SetColor(v8.colorEntry.color);
                        l_gizmo_0:DrawPose(v10.animationPose, v10.animationMask);
                    end;
                    l_gizmo_0:Update();
                end;
            end;
        end;
    end;
end;