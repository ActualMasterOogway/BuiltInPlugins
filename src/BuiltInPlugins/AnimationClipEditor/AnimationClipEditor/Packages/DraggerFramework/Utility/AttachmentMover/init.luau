local l_RunService_0 = game:GetService("RunService");
local _ = script.Parent.Parent;
local v2 = {};
v2.__index = v2;
v2.new = function() --[[ Line: 8 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy)
    return (setmetatable({}, v2));
end;
v2.setDragged = function(v3, v4) --[[ Line: 12 ]] --[[ Name: setDragged ]]
    -- upvalues: l_RunService_0 (copy)
    v3._originalWorldCFrames = {};
    local v5 = l_RunService_0:IsRunning();
    v3._partsToUnanchor = {};
    for _, v7 in ipairs(v4) do
        v3._originalWorldCFrames[v7] = v7.WorldCFrame;
        if v5 then
            local l_v7_FirstAncestorWhichIsA_0 = v7:FindFirstAncestorWhichIsA("BasePart");
            if l_v7_FirstAncestorWhichIsA_0 and not l_v7_FirstAncestorWhichIsA_0:IsGrounded() then
                v3._partsToUnanchor[l_v7_FirstAncestorWhichIsA_0] = true;
            end;
        end;
    end;
    for v9, _ in pairs(v3._partsToUnanchor) do
        v9.Anchored = true;
    end;
end;
v2.transformTo = function(v11, v12) --[[ Line: 30 ]] --[[ Name: transformTo ]]
    for v13, v14 in pairs(v11._originalWorldCFrames) do
        v13.WorldCFrame = v12 * v14;
    end;
end;
v2.commit = function(v15) --[[ Line: 36 ]] --[[ Name: commit ]]
    v15._originalWorldCFrames = nil;
    for v16, _ in pairs(v15._partsToUnanchor) do
        v16.Anchored = false;
    end;
    v15._partsToUnanchor = nil;
end;
return v2;