local v0 = false;
return function() --[[ Line: 3 ]]
    -- upvalues: v0 (ref)
    if v0 then
        return;
    else
        v0 = true;
        local l_Parent_0 = script.Parent.Parent;
        local v2 = require(l_Parent_0.Packages.Roact);
        if require(l_Parent_0.Src.Util.DebugFlags).EnableRoactConfigs() then
            v2.setGlobalConfig({
                elementTracing = true, 
                propValidation = true, 
                typeChecks = true
            });
        end;
        return;
    end;
end;