local v0 = require(script.Parent.Parent.VirtualInputUtils);
local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local v2 = {};
v2.__index = v2;
local v3 = 123;
v2.KeyCode = {
    ButtonX = Enum.KeyCode.ButtonX, 
    ButtonY = Enum.KeyCode.ButtonY, 
    ButtonA = Enum.KeyCode.ButtonA, 
    ButtonB = Enum.KeyCode.ButtonB, 
    ButtonR1 = Enum.KeyCode.ButtonR1, 
    ButtonL1 = Enum.KeyCode.ButtonL1, 
    ButtonR2 = Enum.KeyCode.ButtonR2, 
    ButtonL2 = Enum.KeyCode.ButtonL2, 
    ButtonR3 = Enum.KeyCode.ButtonR3, 
    ButtonL3 = Enum.KeyCode.ButtonL3, 
    ButtonStart = Enum.KeyCode.ButtonStart, 
    ButtonSelect = Enum.KeyCode.ButtonSelect, 
    DPadLeft = Enum.KeyCode.DPadLeft, 
    DPadRight = Enum.KeyCode.DPadRight, 
    DPadUp = Enum.KeyCode.DPadUp, 
    DPadDown = Enum.KeyCode.DPadDown, 
    Thumbstick1 = Enum.KeyCode.Thumbstick1, 
    Thumbstick2 = Enum.KeyCode.Thumbstick2
};
v2.new = function() --[[ Line: 31 ]] --[[ Name: new ]]
    -- upvalues: v3 (ref), v2 (copy), l_VirtualInputManager_0 (copy)
    local v4 = {
        deviceId = v3
    };
    v3 = v3 + 1;
    setmetatable(v4, v2);
    l_VirtualInputManager_0:HandleGamepadConnect(v4.deviceId);
    return v4;
end;
v2.disconnect = function(v5) --[[ Line: 43 ]] --[[ Name: disconnect ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    l_VirtualInputManager_0:HandleGamepadDisconnect(v5.deviceId);
end;
v2.pressButton = function(v6, v7) --[[ Line: 47 ]] --[[ Name: pressButton ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    l_VirtualInputManager_0:HandleGamepadButtonInput(v6.deviceId, v7, 1);
end;
v2.releaseButton = function(v8, v9) --[[ Line: 51 ]] --[[ Name: releaseButton ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    l_VirtualInputManager_0:HandleGamepadButtonInput(v8.deviceId, v9, 0);
end;
v2.hitButton = function(v10, v11) --[[ Line: 55 ]] --[[ Name: hitButton ]]
    -- upvalues: v0 (copy)
    v10:pressButton(v11);
    v0.waitForInputEventsProcessed();
    v10:releaseButton(v11);
    v0.waitForInputEventsProcessed();
end;
v2.moveStickTo = function(v12, v13, v14) --[[ Line: 62 ]] --[[ Name: moveStickTo ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    l_VirtualInputManager_0:HandleGamepadAxisInput(v12.deviceId, v13, v14.X, v14.Y, 0);
end;
v2.smoothMoveStickTo = function(v15, v16, v17, v18, v19) --[[ Line: 66 ]] --[[ Name: smoothMoveStickTo ]]
    -- upvalues: v0 (copy)
    v19 = v19 or 0;
    if v19 == 0 then
        v15:moveStickTo(v16, v18);
        return;
    else
        local v20 = 0;
        local function v24(v21) --[[ Line: 73 ]] --[[ Name: run ]]
            -- upvalues: v20 (ref), v19 (ref), v17 (copy), v18 (copy), v15 (copy), v16 (copy)
            local v22 = v20 / v19;
            v20 = v20 + v21;
            if v22 < 1 then
                local v23 = v17 + (v18 - v17) * v22;
                v15:moveStickTo(v16, v23);
                return false;
            else
                v15:moveStickTo(v16, v18);
                return true;
            end;
        end;
        v0.__syncRun(v24);
        return;
    end;
end;
v2.swingStick = function(v25, v26, v27, v28) --[[ Line: 88 ]] --[[ Name: swingStick ]]
    v28 = v28 or 0;
    assert(v28);
    local v29 = Vector2.new(0, 0);
    v25:moveStickTo(v26, v29);
    v25:smoothMoveStickTo(v26, v29, v27, v28 / 2);
    v25:smoothMoveStickTo(v26, v27, v29, v28 / 2);
end;
v2.swingLeft = function(v30, v31, v32) --[[ Line: 100 ]] --[[ Name: swingLeft ]]
    v30:swingStick(v31, Vector2.new(-1, 0), v32);
end;
v2.swingRight = function(v33, v34, v35) --[[ Line: 104 ]] --[[ Name: swingRight ]]
    v33:swingStick(v34, Vector2.new(1, 0), v35);
end;
v2.swingTop = function(v36, v37, v38) --[[ Line: 108 ]] --[[ Name: swingTop ]]
    v36:swingStick(v37, Vector2.new(0, 1), v38);
end;
v2.swingDown = function(v39, v40, v41) --[[ Line: 112 ]] --[[ Name: swingDown ]]
    v39:swingStick(v40, Vector2.new(0, -1), v41);
end;
return v2;