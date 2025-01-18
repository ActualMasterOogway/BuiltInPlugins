return function(v0) --[[ Line: 12 ]]
    return function(v1) --[[ Line: 19 ]]
        -- upvalues: v0 (copy)
        assert(v0 ~= nil, "Expecting a valid ChangeHistoryService service");
        if not v1 or not v1.Name or not v1.DoChange then
            return;
        else
            local v2 = v0:TryBeginRecording(v1.DisplayName or v1.Name, v1.DisplayName);
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 30 ]]
                -- upvalues: v1 (copy)
                return v1.DoChange() or Enum.FinishRecordingOperation.Cancel;
            end);
            if v2 then
                local v5 = if l_status_0 then l_result_0 else Enum.FinishRecordingOperation.Cancel;
                v0:FinishRecording(v2, v5);
            end;
            if not l_status_0 then
                error(l_result_0);
            end;
            return;
        end;
    end;
end;