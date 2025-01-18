local l_Parent_0 = script.Parent.Parent.Parent;
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.SetRecording);
return function(v4) --[[ Line: 11 ]]
    -- upvalues: l_ChangeHistoryService_0 (copy), v3 (copy)
    return function(v5) --[[ Line: 12 ]]
        -- upvalues: v4 (copy), l_ChangeHistoryService_0 (ref), v3 (ref)
        local l_ChangeHistoryServiceRecording_0 = v5:getState().PathReducer.ChangeHistoryServiceRecording;
        if v4 == nil then
            if l_ChangeHistoryService_0:IsRecordingInProgress() then
                if l_ChangeHistoryServiceRecording_0 ~= nil then
                    l_ChangeHistoryService_0:FinishRecording(l_ChangeHistoryServiceRecording_0, Enum.FinishRecordingOperation.Commit);
                else
                    l_ChangeHistoryService_0:FinishRecording("", Enum.FinishRecordingOperation.Cancel);
                end;
            end;
            v5:dispatch(v3(nil));
            return;
        else
            if v4 ~= nil and l_ChangeHistoryServiceRecording_0 == nil then
                l_ChangeHistoryServiceRecording_0 = l_ChangeHistoryService_0:TryBeginRecording(v4);
                if l_ChangeHistoryServiceRecording_0 then
                    v5:dispatch(v3(l_ChangeHistoryServiceRecording_0));
                end;
            end;
            return;
        end;
    end;
end;