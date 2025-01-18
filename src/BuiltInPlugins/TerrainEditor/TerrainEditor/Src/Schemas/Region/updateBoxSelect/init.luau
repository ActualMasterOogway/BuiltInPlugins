local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local function _(v2) --[[ Line: 8 ]] --[[ Name: gridAlign ]]
    local v3 = v2.Position / 4;
    return (Vector3.new(math.floor(v3.X) * 4, math.floor(v3.Y) * 4, math.floor(v3.Z) * 4));
end;
return function(v5, v6, v7) --[[ Line: 13 ]]
    -- upvalues: v1 (copy)
    local v8 = v5:viewportPointToRay(Vector2.new(v6.X, v6.Y));
    local v9 = v5:viewportPointToRay(Vector2.new(v7.X, v7.Y));
    local v10 = v7 - v6;
    if math.sqrt(v10.X ^ 2 + v10.Y ^ 2) < v1.MouseMoveThreshold and not v5.reachedMinimalMouseDistance then
        return;
    else
        v5.reachedMinimalMouseDistance = true;
        local v11 = workspace:Raycast(v8.Origin, v8.Direction * 4096);
        local v12 = workspace:Raycast(v9.Origin, v9.Direction * 4096);
        if not v11 or not v12 then
            return;
        else
            if not v5.selectionOnDragPoint then
                v5.selectionOnDragPoint = v11;
            end;
            local v13 = v5.selectionOnDragPoint.Position / 4;
            local v14 = Vector3.new(math.floor(v13.X) * 4, math.floor(v13.Y) * 4, math.floor(v13.Z) * 4);
            v13 = v12.Position / 4;
            local v15 = Vector3.new(math.floor(v13.X) * 4, math.floor(v13.Y) * 4, math.floor(v13.Z) * 4);
            v13 = v14:Min(v15);
            local v16 = v15:Max(v14);
            local v17 = {
                Size = (v16 - v13):Max((Vector3.new(4, 4, 4, 0))), 
                Transform = CFrame.new((v16 + v13) / 2)
            };
            v5.updateSelectionOnDrag(v17);
            return;
        end;
    end;
end;