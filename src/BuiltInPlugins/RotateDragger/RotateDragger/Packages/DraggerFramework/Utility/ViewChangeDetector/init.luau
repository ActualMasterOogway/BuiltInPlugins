local _ = script.Parent.Parent;
local l_Workspace_0 = game:GetService("Workspace");
local v2 = {};
v2.__index = v2;
v2.new = function(v3) --[[ Line: 13 ]] --[[ Name: new ]]
    -- upvalues: l_Workspace_0 (copy), v2 (copy)
    local l_CurrentCamera_0 = l_Workspace_0.CurrentCamera;
    return (setmetatable({
        _mouse = v3, 
        _lastCameraCFrame = l_CurrentCamera_0 and l_CurrentCamera_0.CFrame or CFrame.new(), 
        _lastMouseX = v3.X, 
        _lastMouseY = v3.Y
    }, v2));
end;
v2.poll = function(v5) --[[ Line: 23 ]] --[[ Name: poll ]]
    -- upvalues: l_Workspace_0 (copy)
    local l_CurrentCamera_1 = l_Workspace_0.CurrentCamera;
    if not l_CurrentCamera_1 then
        return false;
    else
        local l__mouse_0 = v5._mouse;
        if v5._lastCameraCFrame ~= l_CurrentCamera_1.CFrame or v5._lastMouseX ~= l__mouse_0.X or v5._lastMouseY ~= l__mouse_0.Y then
            v5._lastCameraCFrame = l_CurrentCamera_1.CFrame;
            v5._lastMouseX = l__mouse_0.X;
            v5._lastMouseY = l__mouse_0.Y;
            return true;
        else
            return false;
        end;
    end;
end;
return v2;