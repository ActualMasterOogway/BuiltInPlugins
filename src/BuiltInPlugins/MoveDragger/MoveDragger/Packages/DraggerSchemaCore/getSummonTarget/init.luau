local l_DraggerFramework_0 = script.Parent.Parent.DraggerFramework;
local v1 = require(l_DraggerFramework_0.Utility.getEdgeHotspot);
local v2 = require(l_DraggerFramework_0.Utility.CursorGroupName);
local function _(v3, v4) --[[ Line: 9 ]] --[[ Name: isCandidateInViewport ]]
    local v5 = v3:getViewportSize();
    local v6 = v3:worldToViewportPoint(v4.Position);
    local l_X_0 = v6.X;
    local l_Y_0 = v6.Y;
    local v9 = false;
    if l_X_0 >= 0 then
        v9 = false;
        if l_X_0 <= v5.X then
            v9 = false;
            if l_Y_0 >= 0 then
                v9 = l_Y_0 <= v5.Y;
            end;
        end;
    end;
    return v9;
end;
local function _(v11, v12, v13) --[[ Line: 16 ]] --[[ Name: isSummonWithinEdgeThreshold ]]
    return 3 * v11:getHandleScale(v13.Position) * v11:getSummonMarginFactor() > v12.Unit:Distance(v13.Position);
end;
local v15 = RaycastParams.new();
v15.BruteForceAllSlow = true;
v15.CollisionGroup = v2;
return function(v16, v17) --[[ Line: 26 ]]
    -- upvalues: v1 (copy), v15 (copy)
    local v18 = v1(v16, {}, v17);
    if v18 then
        local v19 = v16:getViewportSize();
        local v20 = v16:worldToViewportPoint(v18.Position);
        local l_X_1 = v20.X;
        local l_Y_1 = v20.Y;
        local v23 = false;
        if l_X_1 >= 0 then
            v23 = false;
            if l_X_1 <= v19.X then
                v23 = false;
                if l_Y_1 >= 0 then
                    v23 = l_Y_1 <= v19.Y;
                end;
            end;
        end;
        if v23 and 3 * v16:getHandleScale(v18.Position) * v16:getSummonMarginFactor() > v17.Unit:Distance(v18.Position) then
            return v18;
        else
            v23 = workspace:Raycast(v17.Origin, v17.Direction, v15);
            if v23 then
                return v23.Instance.CFrame.Rotation + v23.Position;
            end;
        end;
    end;
    return nil;
end;