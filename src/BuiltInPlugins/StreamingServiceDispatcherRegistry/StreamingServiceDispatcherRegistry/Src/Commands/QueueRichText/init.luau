local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("ChatbotUIService");
local v3 = v1.GetService("StreamingService");
local v4 = v1.GetService("ConversationalAIAcceptanceService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v6) --[[ Line: 12 ]]
    -- upvalues: v2 (copy), v3 (copy), v4 (copy)
    local v7, v8, v9 = unpack(v6.arguments);
    if v7 == "DisplayContent" then
        v2:DisplayContent(v8, v9);
        return;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 18 ]]
            -- upvalues: v3 (ref), v6 (copy), v7 (copy), v9 (copy)
            return v3:ExecuteCommandAsync(v6.requestId, v7, v9.arguments);
        end);
        if not l_status_0 then
            v4:SendCommandErrorTelemetry(v6.requestId, v7, l_result_0);
        end;
        return;
    end;
end;