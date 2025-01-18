local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.convertStudsToMeters = function(v1) --[[ Line: 28 ]] --[[ Name: convertStudsToMeters ]]
    return v1 * 0.28;
end;
v0.calculateJumpDistance = function(v2, v3, v4) --[[ Line: 39 ]] --[[ Name: calculateJumpDistance ]]
    return workspace:CalculateJumpDistance(v2, v3, v4);
end;
v0.calculateJumpHeight = function(v5, v6) --[[ Line: 43 ]] --[[ Name: calculateJumpHeight ]]
    return workspace:CalculateJumpHeight(v5, v6);
end;
v0.calculateJumpPower = function(v7, v8) --[[ Line: 47 ]] --[[ Name: calculateJumpPower ]]
    return workspace:CalculateJumpPower(v7, v8);
end;
v0.getGravity = function(_, v10) --[[ Line: 51 ]] --[[ Name: getGravity ]]
    return v10:GetService("Workspace").Gravity;
end;
v0.setGravity = function(_, v12, v13) --[[ Line: 57 ]] --[[ Name: setGravity ]]
    v12:GetService("Workspace").Gravity = v13;
end;
v0.getUseJumpPower = function(_, v15) --[[ Line: 63 ]] --[[ Name: getUseJumpPower ]]
    return v15:GetService("StarterPlayer").CharacterUseJumpPower;
end;
v0.setUseJumpPower = function(_, v17, v18) --[[ Line: 69 ]] --[[ Name: setUseJumpPower ]]
    v17:GetService("StarterPlayer").CharacterUseJumpPower = v18;
end;
v0.getJumpHeight = function(v19, v20) --[[ Line: 75 ]] --[[ Name: getJumpHeight ]]
    local l_StarterPlayer_0 = v20:GetService("StarterPlayer");
    local l_Workspace_0 = v20:GetService("Workspace");
    if v19:getUseJumpPower(v20) then
        return l_Workspace_0:CalculateJumpHeight(v19:getGravity(v20), v19:getJumpPower(v20));
    else
        return l_StarterPlayer_0.CharacterJumpHeight;
    end;
end;
v0.setJumpHeight = function(v23, v24, v25) --[[ Line: 86 ]] --[[ Name: setJumpHeight ]]
    local l_StarterPlayer_1 = v24:GetService("StarterPlayer");
    local l_Workspace_1 = v24:GetService("Workspace");
    local v28 = v23:getGravity(v24);
    l_StarterPlayer_1.CharacterJumpHeight = v25;
    l_StarterPlayer_1.CharacterJumpPower = l_Workspace_1:CalculateJumpPower(v28, v25);
end;
v0.getJumpPower = function(v29, v30) --[[ Line: 95 ]] --[[ Name: getJumpPower ]]
    local l_StarterPlayer_2 = v30:GetService("StarterPlayer");
    local v32 = v29:getGravity(v30);
    if v29:getUseJumpPower(v30) then
        return l_StarterPlayer_2.CharacterJumpPower;
    else
        return workspace:CalculateJumpPower(v32, v29:getJumpHeight(v30));
    end;
end;
v0.setJumpPower = function(v33, v34, v35) --[[ Line: 106 ]] --[[ Name: setJumpPower ]]
    local l_StarterPlayer_3 = v34:GetService("StarterPlayer");
    l_StarterPlayer_3.CharacterJumpPower = v35;
    l_StarterPlayer_3.CharacterJumpHeight = workspace:CalculateJumpHeight(v33:getGravity(v34), v35);
end;
v0.getWalkspeed = function(_, v38) --[[ Line: 113 ]] --[[ Name: getWalkspeed ]]
    return v38:GetService("StarterPlayer").CharacterWalkSpeed;
end;
v0.setWalkspeed = function(_, v40, v41) --[[ Line: 119 ]] --[[ Name: setWalkspeed ]]
    v40:GetService("StarterPlayer").CharacterWalkSpeed = v41;
end;
v0.getMaxSlopeAngle = function(_, v43) --[[ Line: 125 ]] --[[ Name: getMaxSlopeAngle ]]
    return v43:GetService("StarterPlayer").CharacterMaxSlopeAngle;
end;
v0.setMaxSlopeAngle = function(_, v45, v46) --[[ Line: 131 ]] --[[ Name: setMaxSlopeAngle ]]
    v45:GetService("StarterPlayer").CharacterMaxSlopeAngle = v46;
end;
return v0;