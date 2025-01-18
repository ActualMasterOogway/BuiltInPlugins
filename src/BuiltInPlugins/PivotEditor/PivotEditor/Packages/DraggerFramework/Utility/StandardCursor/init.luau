local l_RunService_0 = game:GetService("RunService");
local l_Parent_0 = script.Parent.Parent;
local v2 = require(l_Parent_0.Flags.getFFlagImprovedCursors);
local v3 = {};
local function _() --[[ Line: 19 ]] --[[ Name: isPlaySolo ]]
    -- upvalues: l_RunService_0 (copy)
    return l_RunService_0:IsRunning() and not l_RunService_0:IsRunMode();
end;
v3.getArrow = function() --[[ Line: 23 ]] --[[ Name: getArrow ]]
    -- upvalues: l_RunService_0 (copy), v2 (copy)
    if l_RunService_0:IsRunning() and not l_RunService_0:IsRunMode() then
        if v2() then
            return "rbxasset://textures/Cursors/KeyboardMouse/ArrowFarCursor.png";
        else
            return "rbxasset://textures/advCursor-default.png";
        end;
    else
        return "rbxasset://SystemCursors/Arrow";
    end;
end;
v3.getOpenHand = function() --[[ Line: 35 ]] --[[ Name: getOpenHand ]]
    -- upvalues: l_RunService_0 (copy), v2 (copy)
    if l_RunService_0:IsRunning() and not l_RunService_0:IsRunMode() then
        if v2() then
            return "rbxasset://textures/Cursors/DragDetector/HoverCursor.png";
        else
            return "rbxasset://textures/advCursor-openedHand.png";
        end;
    else
        return "rbxasset://SystemCursors/OpenHand";
    end;
end;
v3.getClosedHand = function() --[[ Line: 47 ]] --[[ Name: getClosedHand ]]
    -- upvalues: l_RunService_0 (copy), v2 (copy)
    if l_RunService_0:IsRunning() and not l_RunService_0:IsRunMode() then
        if v2() then
            return "rbxasset://textures/Cursors/DragDetector/ActivatedCursor.png";
        else
            return "rbxasset://textures/advClosed-hand.png";
        end;
    else
        return "rbxasset://SystemCursors/ClosedHand";
    end;
end;
return v3;