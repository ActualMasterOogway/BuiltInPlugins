local v0 = require(script.Parent.Parent.VirtualInputUtils);
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v5 = {
    SendKeyEvent = function(v2, v3, v4) --[[ Line: 7 ]] --[[ Name: SendKeyEvent ]]
        -- upvalues: l_VirtualInputManager_0 (copy), v0 (copy)
        l_VirtualInputManager_0:SendKeyEvent(v2, v3, v4, v0.getCurrentWindow());
    end
};
v5.pressKey = function(v6) --[[ Line: 11 ]] --[[ Name: pressKey ]]
    -- upvalues: v5 (copy)
    v5.SendKeyEvent(true, v6, false);
end;
v5.releaseKey = function(v7) --[[ Line: 15 ]] --[[ Name: releaseKey ]]
    -- upvalues: v5 (copy)
    v5.SendKeyEvent(false, v7, false);
end;
v5.hitKey = function(v8) --[[ Line: 19 ]] --[[ Name: hitKey ]]
    -- upvalues: v5 (copy)
    v5.pressKey(v8);
    v5.releaseKey(v8);
end;
return v5;