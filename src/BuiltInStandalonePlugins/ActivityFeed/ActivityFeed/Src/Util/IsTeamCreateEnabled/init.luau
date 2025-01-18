local l_RunService_0 = game:GetService("RunService");
return function() --[[ Line: 3 ]]
    -- upvalues: l_RunService_0 (copy)
    return l_RunService_0:IsEdit() and not l_RunService_0:IsServer();
end;