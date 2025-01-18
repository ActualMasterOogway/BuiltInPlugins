local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v2) --[[ Line: 6 ]] --[[ Name: debugSleep ]]
    if not v2 or not v2.arguments then
        task.wait(1);
        return;
    else
        local v3 = v2 and v2.arguments;
        task.wait(v3.time or 1);
        return;
    end;
end;