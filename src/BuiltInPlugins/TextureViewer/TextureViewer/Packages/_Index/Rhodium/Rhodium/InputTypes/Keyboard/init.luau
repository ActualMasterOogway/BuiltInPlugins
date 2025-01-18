local v0 = require(script.Parent.Parent.VirtualInputUtils);
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v6 = {
    SendKeyEvent = function(v2, v3, v4) --[[ Line: 8 ]] --[[ Name: SendKeyEvent ]]
        -- upvalues: v0 (copy), l_VirtualInputManager_0 (copy)
        local v5 = v0.getCurrentWindow();
        l_VirtualInputManager_0:SendKeyEvent(v2, v3, v4, v5);
    end
};
v6.pressKey = function(v7) --[[ Line: 15 ]] --[[ Name: pressKey ]]
    -- upvalues: v6 (copy)
    v6.SendKeyEvent(true, v7, false);
end;
v6.releaseKey = function(v8) --[[ Line: 19 ]] --[[ Name: releaseKey ]]
    -- upvalues: v6 (copy)
    v6.SendKeyEvent(false, v8, false);
end;
v6.hitKey = function(v9) --[[ Line: 23 ]] --[[ Name: hitKey ]]
    -- upvalues: v6 (copy), v0 (copy)
    v6.pressKey(v9);
    v0.waitForInputEventsProcessed();
    v6.releaseKey(v9);
    v0.waitForInputEventsProcessed();
end;
return v6;