local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Components.WireframeHandleAdornment);
return function(v4) --[[ Line: 14 ]] --[[ Name: CylinderMajorLines ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_Part_0 = v4.Part;
    local l_Size_0 = l_Part_0.Size;
    local v7 = 0.5 * math.min(l_Size_0.Y, l_Size_0.Z);
    local v8 = 0.5 * l_Size_0.X;
    local v9 = Vector3.new(0, v7, 0);
    local v10 = Vector3.new(0, 0, v7);
    local v11 = Vector3.new(v8, 0, 0);
    local v12 = {};
    for v13 = -3, 3 do
        local v14 = Vector2.new(-3, v13).Unit * v7;
        table.insert(v12, (Vector3.new(0, v14.X, v14.Y)));
    end;
    for v15 = -3, 3 do
        local v16 = Vector2.new(v15, 3).Unit * v7;
        table.insert(v12, (Vector3.new(0, v16.X, v16.Y)));
    end;
    for v17 = 3, -3, -1 do
        local v18 = Vector2.new(3, v17).Unit * v7;
        table.insert(v12, (Vector3.new(0, v18.X, v18.Y)));
    end;
    for v19 = 3, -3, -1 do
        local v20 = Vector2.new(v19, -3).Unit * v7;
        table.insert(v12, (Vector3.new(0, v20.X, v20.Y)));
    end;
    return v2.createElement(v3, {
        Adornee = l_Part_0, 
        Color3 = v4.Color3, 
        AlwaysOnTop = false, 
        Render = function(v21) --[[ Line: 47 ]] --[[ Name: Render ]]
            -- upvalues: v9 (copy), v11 (copy), v10 (copy), v12 (copy), v8 (copy), v7 (copy)
            v21:AddLine(v9 + v11, v9 - v11);
            v21:AddLine(-v9 + v11, -v9 - v11);
            v21:AddLine(v10 + v11, v10 - v11);
            v21:AddLine(-v10 + v11, -v10 - v11);
            v21:AddPath(v12, true);
            v21:AddLine(Vector3.new(v8, v7, 0), (Vector3.new(v8, -v7, 0)));
            v21:AddLine(Vector3.new(-v8, v7, 0), (Vector3.new(-v8, -v7, 0)));
            v21:AddLine(Vector3.new(v8, 0, v7), (Vector3.new(v8, 0, -v7)));
            v21:AddLine(Vector3.new(-v8, 0, v7), (Vector3.new(-v8, 0, -v7)));
        end
    });
end;