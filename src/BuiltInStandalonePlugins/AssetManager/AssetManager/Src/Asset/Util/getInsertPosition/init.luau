return function() --[[ Line: 4 ]]
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    local v1 = l_CurrentCamera_0.ViewportSize / 2;
    local v2 = l_CurrentCamera_0:ViewportPointToRay(v1.X, v1.Y, 0);
    local v3 = Ray.new(v2.Origin, v2.Direction * 2048);
    local v4 = RaycastParams.new();
    v4.BruteForceAllSlow = true;
    local v5 = game.Workspace:Raycast(v3.Origin, v3.Direction, v4);
    if v5 then
        return v5.Position;
    else
        return l_CurrentCamera_0.CFrame.p + v2.Direction * 64;
    end;
end;