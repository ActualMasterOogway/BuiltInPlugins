local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Rhodium");
local v2 = require(l_script_FirstAncestor_0.VirtualInputUtils);
local v7 = {
    SendKeyEvent = function(v3, v4, v5) --[[ Line: 9 ]] --[[ Name: SendKeyEvent ]]
        -- upvalues: v2 (copy), l_VirtualInputManager_0 (copy)
        local v6 = v2.getCurrentWindow();
        l_VirtualInputManager_0:SendKeyEvent(v3, v4, v5, v6);
    end
};
v7.pressKey = function(v8) --[[ Line: 16 ]] --[[ Name: pressKey ]]
    -- upvalues: v7 (copy)
    v7.SendKeyEvent(true, v8, false);
end;
v7.releaseKey = function(v9) --[[ Line: 20 ]] --[[ Name: releaseKey ]]
    -- upvalues: v7 (copy)
    v7.SendKeyEvent(false, v9, false);
end;
v7.hitKey = function(v10) --[[ Line: 24 ]] --[[ Name: hitKey ]]
    -- upvalues: v7 (copy), v2 (copy)
    v7.pressKey(v10);
    v7.releaseKey(v10);
    v2.waitForInputEventsProcessed();
end;
return v7;