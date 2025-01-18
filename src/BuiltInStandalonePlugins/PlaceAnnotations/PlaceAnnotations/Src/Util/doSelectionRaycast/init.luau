return function(v0) --[[ Line: 3 ]]
    local v1 = RaycastParams.new();
    v1.CollisionGroup = "StudioSelectable";
    v1.BruteForceAllSlow = true;
    return workspace:Raycast(v0.Origin.Position, v0.UnitRay.Direction * 1000, v1);
end;