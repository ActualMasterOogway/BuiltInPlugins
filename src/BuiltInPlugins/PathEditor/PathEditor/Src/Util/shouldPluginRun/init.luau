local l_RunService_0 = game:GetService("RunService");
return function() --[[ Line: 3 ]]
    -- upvalues: l_RunService_0 (copy)
    if require(script.Parent.DebugFlags).RunningUnderCLI() then
        return false;
    elseif l_RunService_0:IsRunning() then
        return false;
    else
        return true;
    end;
end;