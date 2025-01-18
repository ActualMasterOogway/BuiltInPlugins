return function() --[[ Line: 1 ]]
    if require(script.Parent.DebugFlags).RunningUnderCLI() then
        return false;
    elseif not game:GetFastFlag("DebugR15MigratorPlugin") then
        return;
    else
        return true;
    end;
end;