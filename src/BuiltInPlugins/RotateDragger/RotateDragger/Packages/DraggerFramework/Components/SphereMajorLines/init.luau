local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Components.WireframeHandleAdornment);
local v4 = {};
for v5 = -3, 3 do
    table.insert(v4, Vector3.new(0, v5, -3).Unit);
end;
for v6 = -3, 3 do
    table.insert(v4, Vector3.new(0, 3, v6).Unit);
end;
for v7 = 3, -3, -1 do
    table.insert(v4, Vector3.new(0, v7, 3).Unit);
end;
for v8 = 3, -3, -1 do
    table.insert(v4, Vector3.new(0, -3, v8).Unit);
end;
local v9 = {};
for v10 = -3, 3 do
    table.insert(v9, Vector3.new(-3, 0, v10).Unit);
end;
for v11 = -3, 3 do
    table.insert(v9, Vector3.new(v11, 0, 3).Unit);
end;
for v12 = 3, -3, -1 do
    table.insert(v9, Vector3.new(3, 0, v12).Unit);
end;
for v13 = 3, -3, -1 do
    table.insert(v9, Vector3.new(v13, 0, -3).Unit);
end;
local v14 = {};
for v15 = -3, 3 do
    table.insert(v14, Vector3.new(-3, v15, 0).Unit);
end;
for v16 = -3, 3 do
    table.insert(v14, Vector3.new(v16, 3, 0).Unit);
end;
for v17 = 3, -3, -1 do
    table.insert(v14, Vector3.new(3, v17, 0).Unit);
end;
for v18 = 3, -3, -1 do
    table.insert(v14, Vector3.new(v18, -3, 0).Unit);
end;
local function v20(v19) --[[ Line: 58 ]] --[[ Name: renderSphereMajorLines ]]
    -- upvalues: v4 (copy), v14 (copy), v9 (copy)
    v19:AddPath(v4, true);
    v19:AddPath(v14, true);
    v19:AddPath(v9, true);
end;
return function(v21) --[[ Line: 64 ]] --[[ Name: SphereMajorLines ]]
    -- upvalues: v2 (copy), v3 (copy), v20 (copy)
    local l_Size_0 = v21.Part.Size;
    local v23 = 0.5 * math.min(l_Size_0.X, l_Size_0.Y, l_Size_0.Z);
    return v2.createElement(v3, {
        AlwaysOnTop = false, 
        Adornee = v21.Part, 
        Scale = Vector3.one * v23, 
        Color3 = v21.Color3, 
        Render = v20
    });
end;