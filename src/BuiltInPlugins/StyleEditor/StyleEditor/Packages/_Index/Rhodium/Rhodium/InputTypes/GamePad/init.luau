local l_VirtualInputManager_0 = game:GetService("VirtualInputManager");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Rhodium");
local v2 = require(l_script_FirstAncestor_0.VirtualInputUtils);
local v3 = {};
v3.__index = v3;
local v4 = 123;
v3.KeyCode = {
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
v3.new = function() --[[ Line: 32 ]] --[[ Name: new ]]
    -- upvalues: v4 (ref), v3 (copy), l_VirtualInputManager_0 (copy)
    local v5 = {
        deviceId = v4
    };
    v4 = v4 + 1;
    setmetatable(v5, v3);
    l_VirtualInputManager_0:HandleGamepadConnect(v5.deviceId);
    return v5;
end;
v3.disconnect = function(v6) --[[ Line: 44 ]] --[[ Name: disconnect ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    l_VirtualInputManager_0:HandleGamepadDisconnect(v6.deviceId);
end;
v3.pressButton = function(v7, v8) --[[ Line: 48 ]] --[[ Name: pressButton ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    l_VirtualInputManager_0:HandleGamepadButtonInput(v7.deviceId, v8, 1);
end;
v3.releaseButton = function(v9, v10) --[[ Line: 52 ]] --[[ Name: releaseButton ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    l_VirtualInputManager_0:HandleGamepadButtonInput(v9.deviceId, v10, 0);
end;
v3.hitButton = function(v11, v12) --[[ Line: 56 ]] --[[ Name: hitButton ]]
    -- upvalues: v2 (copy)
    v11:pressButton(v12);
    v11:releaseButton(v12);
    v2.waitForInputEventsProcessed();
end;
v3.moveStickTo = function(v13, v14, v15) --[[ Line: 62 ]] --[[ Name: moveStickTo ]]
    -- upvalues: l_VirtualInputManager_0 (copy)
    l_VirtualInputManager_0:HandleGamepadAxisInput(v13.deviceId, v14, v15.X, v15.Y, 0);
end;
v3.smoothMoveStickTo = function(v16, v17, v18, v19, v20) --[[ Line: 66 ]] --[[ Name: smoothMoveStickTo ]]
    -- upvalues: v2 (copy)
    v20 = v20 or 0;
    if v20 == 0 then
        v16:moveStickTo(v17, v19);
        return;
    else
        local v21 = 0;
        local function v25(v22) --[[ Line: 73 ]] --[[ Name: run ]]
            -- upvalues: v21 (ref), v20 (ref), v18 (copy), v19 (copy), v16 (copy), v17 (copy)
            local v23 = v21 / v20;
            v21 = v21 + v22;
            if v23 < 1 then
                local v24 = v18 + (v19 - v18) * v23;
                v16:moveStickTo(v17, v24);
                return false;
            else
                v16:moveStickTo(v17, v19);
                return true;
            end;
        end;
        v2.__syncRun(v25);
        return;
    end;
end;
v3.swingStick = function(v26, v27, v28, v29) --[[ Line: 88 ]] --[[ Name: swingStick ]]
    v29 = v29 or 0;
    assert(v29);
    local v30 = Vector2.new(0, 0);
    v26:moveStickTo(v27, v30);
    v26:smoothMoveStickTo(v27, v30, v28, v29 / 2);
    v26:smoothMoveStickTo(v27, v28, v30, v29 / 2);
end;
v3.swingLeft = function(v31, v32, v33) --[[ Line: 100 ]] --[[ Name: swingLeft ]]
    v31:swingStick(v32, Vector2.new(-1, 0), v33);
end;
v3.swingRight = function(v34, v35, v36) --[[ Line: 104 ]] --[[ Name: swingRight ]]
    v34:swingStick(v35, Vector2.new(1, 0), v36);
end;
v3.swingTop = function(v37, v38, v39) --[[ Line: 108 ]] --[[ Name: swingTop ]]
    v37:swingStick(v38, Vector2.new(0, 1), v39);
end;
v3.swingDown = function(v40, v41, v42) --[[ Line: 112 ]] --[[ Name: swingDown ]]
    v40:swingStick(v41, Vector2.new(0, -1), v42);
end;
return v3;