local v0 = false;
return function() --[[ Line: 6 ]]
    -- upvalues: v0 (ref)
    if v0 then
        return;
    else
        v0 = true;
        local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
        if require(l_script_FirstAncestor_0.Src.Util.DebugFlags).EnableRoactConfigs() then
            require(l_script_FirstAncestor_0.Packages.Roact).setGlobalConfig({
                elementTracing = true, 
                propValidation = true, 
                typeChecks = true
            });
        end;
        return;
    end;
end;