local v0 = false;
return function() --[[ Line: 7 ]]
    -- upvalues: v0 (ref)
    if v0 then
        return;
    else
        v0 = true;
        local l_Parent_0 = script.Parent.Parent;
        if require(l_Parent_0.Src.Util.DebugFlags).EnableRoactConfigs() then
            require(l_Parent_0.Packages.Roact).setGlobalConfig({
                elementTracing = true, 
                propValidation = true, 
                typeChecks = true
            });
        end;
        return;
    end;
end;