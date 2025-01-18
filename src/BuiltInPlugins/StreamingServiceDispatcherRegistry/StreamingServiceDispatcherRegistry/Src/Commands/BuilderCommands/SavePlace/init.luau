local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter).GetService("StreamingService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIAddSavePlaceCommand);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIUpdateSavePlaceTelemetry);
return function(v5) --[[ Line: 12 ]] --[[ Name: savePlace ]]
    -- upvalues: v3 (copy), v4 (copy), v1 (copy)
    assert(v3(), "SavePlace command is not enabled");
    if v4() then
        local v6 = v5.arguments.toolSource or "";
        v1:AttemptSaveAndSendPlaceTelemetry(v5.requestId, v6);
        return;
    else
        v1:AttemptSaveAndSendPlaceTelemetry(v5.requestId, "");
        return;
    end;
end;