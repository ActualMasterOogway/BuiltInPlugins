local l_Workspace_0 = game:GetService("Workspace");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = Color3.new(1, 0, 1);
return function(v4) --[[ Line: 14 ]]
    -- upvalues: v2 (copy), l_Workspace_0 (copy), v3 (copy)
    local v5 = {};
    local v6 = Vector3.new(1e999, 1e999, 1e999, 0);
    local v7 = Vector3.new(-1e999, -1e999, -1e999, 0);
    for _, v9 in ipairs(v4.SnapPoints) do
        v6 = v6:Min(v9.Position);
        v7 = v7:Max(v9.Position);
    end;
    local l_Magnitude_0 = (v7 - v6).Magnitude;
    for v11, v12 in ipairs(v4.SnapPoints) do
        local l_Position_0 = v12.Position;
        local v14 = v4.DraggerContext:getHandleScale(l_Position_0);
        local l_Magnitude_1 = (l_Position_0 - v4.Focus).Magnitude;
        if l_Magnitude_0 >= l_Magnitude_1 and l_Magnitude_1 >= 0.001 then
            v14 = v14 * (1.8 - 1.6 * (l_Magnitude_1 / l_Magnitude_0) ^ 0.5);
            v5[v11 * 2 - 1] = v2.createElement("BoxHandleAdornment", {
                ZIndex = 0, 
                Adornee = l_Workspace_0.Terrain, 
                CFrame = v12, 
                Color3 = v3, 
                Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0) * v14
            });
            v5[v11 * 2] = v2.createElement("BoxHandleAdornment", {
                ZIndex = 0, 
                Adornee = l_Workspace_0.Terrain, 
                CFrame = v12, 
                Color3 = v3, 
                AlwaysOnTop = true, 
                Transparency = 0.7, 
                Size = Vector3.new(0.20000000298023224, 0.20000000298023224, 0.20000000298023224, 0) * v14
            });
        end;
    end;
    return v2.createElement("Folder", {}, v5);
end;