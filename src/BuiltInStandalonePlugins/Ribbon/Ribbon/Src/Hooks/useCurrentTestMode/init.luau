local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v1.useEffect;
local l_useState_0 = v1.useState;
local v4 = require(l_script_FirstAncestor_0.Src.Util.TestingModesHelper);
local l_AddTestModesJson_0 = game:GetFastFlag("AddTestModesJson");
return function(v6) --[[ Line: 11 ]] --[[ Name: useCurrentTestMode ]]
    -- upvalues: l_AddTestModesJson_0 (copy), l_useState_0 (copy), l_useEffect_0 (copy), v4 (copy)
    assert(l_AddTestModesJson_0, "useCurrentTestMode should only be used when FFlagAddTestModesJson is true");
    local v7, v8 = l_useState_0(-1);
    l_useEffect_0(function() --[[ Line: 14 ]]
        -- upvalues: v4 (ref), v6 (copy), v8 (copy)
        task.defer(function() --[[ Line: 15 ]]
            -- upvalues: v4 (ref), v6 (ref), v8 (ref)
            v4.connectTestModesAsync(v6, v8);
            v8(v4.getCurrentTestModeSettingValueAsync(v6));
        end);
    end, {
        v6
    });
    return v7;
end;