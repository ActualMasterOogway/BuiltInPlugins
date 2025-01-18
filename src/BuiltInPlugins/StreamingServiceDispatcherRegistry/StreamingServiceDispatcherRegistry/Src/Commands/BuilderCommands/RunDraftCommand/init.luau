local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter).GetService("StreamingService");
local v2 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
return function(v5) --[[ Line: 11 ]] --[[ Name: runDraftCommand ]]
    -- upvalues: v2 (copy), v4 (copy), v1 (copy)
    if not v2.isDraftModeEnabled(v5.requestId) then
        v4.activeDraftGuids = {};
        v2.enableDraftMode(v5.requestId);
    end;
    v1:ExecuteCommandAsync(v5.requestId, v5.arguments.command, v5.arguments.arguments);
end;