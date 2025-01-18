local l_Actions_0 = script:FindFirstAncestor("R15Migrator").Src.Actions;
local v1 = require(l_Actions_0.SetScriptAnalyticsSent);
return function(v2, v3, v4) --[[ Line: 6 ]]
    -- upvalues: v1 (copy)
    return function(v5) --[[ Line: 7 ]]
        -- upvalues: v4 (copy), v3 (copy), v2 (copy), v1 (ref)
        local v6 = v5:getState();
        if not v6.ScriptConversion.analyticsSent then
            v4:getHandler("onInitialScriptAnalysisScan")(v3, #v2, v6.ScriptConversion.completedScripts);
            v5:dispatch(v1(true));
        end;
    end;
end;