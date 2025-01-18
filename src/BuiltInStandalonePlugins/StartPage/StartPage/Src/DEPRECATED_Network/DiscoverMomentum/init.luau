local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = require(l_script_FirstAncestor_0.Src.Util.Telemetry.TelemetryContext);
return function(v3, _, v5, v6, v7, _) --[[ Line: 22 ]] --[[ Name: DiscoverMomentum ]]
    if v5 > 1 then
        return;
    else
        v7(function(v9) --[[ Line: 35 ]]
            -- upvalues: v6 (copy), v3 (copy), v5 (copy)
            local v10 = table.clone(v9);
            if not v10[v6] then
                v10[v6] = {
                    targetResults = #v3, 
                    pages = {}, 
                    doNotWaitForImages = true
                };
            end;
            v10[v6].pages[v5] = v3;
            v10[v6].targetResults = #v3;
            return v10;
        end);
        return;
    end;
end;