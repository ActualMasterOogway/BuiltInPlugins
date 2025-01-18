local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter).GetService("ChatbotUIService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v3) --[[ Line: 10 ]]
    -- upvalues: v1 (copy)
    local l_arguments_0 = v3.arguments;
    v1:DisplayContent("DisplaySuggestions", l_arguments_0);
end;