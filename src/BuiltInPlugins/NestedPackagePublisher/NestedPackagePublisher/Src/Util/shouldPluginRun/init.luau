return function() --[[ Line: 1 ]]
    if require(script.Parent.DebugFlags).RunningUnderCLI() then
        return false;
    elseif not require(script.Parent.hasInternalPermission)() then
        return false;
    elseif not game:GetFastFlag("NestedPackagePublisherPlugin") then
        return false;
    else
        return true;
    end;
end;