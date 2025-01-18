local l_script_FirstAncestor_0 = script:FindFirstAncestor("Ribbon");
local v1 = require(l_script_FirstAncestor_0.Src.Util.StudioUri);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_AddTestModesJson_0 = game:GetFastFlag("AddTestModesJson");
local v4 = nil;
local v5 = v1.fromSetting("RunTools", "TestMode");
return {
    connectTestModesAsync = function(v6, v7) --[[ Line: 18 ]] --[[ Name: connectTestModesAsync ]]
        -- upvalues: l_AddTestModesJson_0 (copy), v5 (copy), v4 (ref)
        assert(l_AddTestModesJson_0, "This function should only be called when FFlagAddTestModesJson is true");
        local v8 = v6:GetPluginComponent("Settings"):BindAsync(v5);
        if v4 then
            v4:Disconnect();
        end;
        v4 = v8:Connect(function(v9) --[[ Line: 27 ]]
            -- upvalues: v7 (copy)
            v7(v9.Value);
        end);
    end, 
    getMezzanineFromTestModeSetting = function(v10, v11) --[[ Line: 32 ]] --[[ Name: getMezzanineFromTestModeSetting ]]
        -- upvalues: l_AddTestModesJson_0 (copy)
        assert(l_AddTestModesJson_0, "This function should only be called when FFlagAddTestModesJson is true");
        if v11 == 0 or v11 == 1 then
            return v10.MezzanineControls.LeftMezzanineTestAndTestHere;
        elseif v11 == 2 then
            return v10.MezzanineControls.LeftMezzanineRun;
        elseif v11 == 3 then
            return v10.MezzanineControls.LeftMezzanineTeamTest;
        elseif v11 == 4 then
            return v10.MezzanineControls.LeftMezzanineServerAndClients;
        elseif v11 == 5 then
            return v10.MezzanineControls.LeftMezzanineDebugPlugin;
        else
            return v10.MezzanineControls.LeftMezzanineTestAndTestHere;
        end;
    end, 
    getCurrentTestModeSettingValueAsync = function(v12) --[[ Line: 49 ]] --[[ Name: getCurrentTestModeSettingValueAsync ]]
        -- upvalues: l_AddTestModesJson_0 (copy), v5 (copy)
        assert(l_AddTestModesJson_0, "This function should only be called when FFlagAddTestModesJson is true");
        local l_Async_0 = v12:GetPluginComponent("Settings"):GetAsync({
            v5
        });
        if not l_Async_0[1] then
            return -1;
        else
            return l_Async_0[1].Value;
        end;
    end
};