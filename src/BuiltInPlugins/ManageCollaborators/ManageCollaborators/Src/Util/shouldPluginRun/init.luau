return function() --[[ Line: 1 ]]
    if require(script.Parent.DebugFlags).RunningUnderCLI() then
        return false;
    else
        return true;
    end;
end;