local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
return function(v1, v2) --[[ Line: 4 ]] --[[ Name: recordChangesThroughChangeHistoryService ]]
    -- upvalues: l_ChangeHistoryService_0 (copy)
    local v3 = l_ChangeHistoryService_0:TryBeginRecording(v1);
    local l_Cancel_0 = Enum.FinishRecordingOperation.Cancel;
    local v5 = nil;
    xpcall(function() --[[ Line: 10 ]]
        -- upvalues: l_Cancel_0 (ref), v2 (copy)
        l_Cancel_0 = v2();
    end, function(v6) --[[ Line: 12 ]]
        -- upvalues: v5 (ref)
        v5 = ("%*\n%*"):format(v6, (debug.traceback()));
    end);
    if v3 ~= nil then
        l_ChangeHistoryService_0:FinishRecording(v3, l_Cancel_0);
    end;
    if v5 ~= nil then
        error(v5);
    end;
end;