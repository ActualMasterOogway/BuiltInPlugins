local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_0.Components.WireframeHandleAdornment);
return function(v4) --[[ Line: 20 ]] --[[ Name: LatLonGuide ]]
    -- upvalues: v2 (copy), v3 (copy)
    local l_Part_0 = v4.Part;
    local l_Size_0 = l_Part_0.Size;
    local v7 = 0.5 * math.min(l_Size_0.X, l_Size_0.Y, l_Size_0.Z);
    local v8 = l_Part_0.CFrame:PointToObjectSpace(v4.WorldPosition);
    local l_Y_0 = v8.Y;
    local v10 = math.atan2(v8.X, v8.Z);
    local function v21(v11) --[[ Line: 30 ]] --[[ Name: renderLongitude ]]
        -- upvalues: v8 (copy), v7 (copy)
        local v12 = {};
        if v8.Y < 0 then
            for v13 = 0, 3 do
                local v14 = Vector2.new(-3, v13).Unit * v7;
                table.insert(v12, (Vector3.new(0, v14.X, v14.Y)));
            end;
            for v15 = -3, 0 do
                local v16 = Vector2.new(v15, 3).Unit * v7;
                table.insert(v12, (Vector3.new(0, v16.X, v16.Y)));
            end;
        else
            for v17 = 0, 3 do
                local v18 = Vector2.new(v17, 3).Unit * v7;
                table.insert(v12, (Vector3.new(0, v18.X, v18.Y)));
            end;
            for v19 = 3, 0, -1 do
                local v20 = Vector2.new(3, v19).Unit * v7;
                table.insert(v12, (Vector3.new(0, v20.X, v20.Y)));
            end;
        end;
        v11:AddPath(v12, false);
    end;
    local v33 = {
        LattitudeGuide = v2.createElement(v3, {
            Color3 = v4.PrimaryColor, 
            AlwaysOnTop = true, 
            Adornee = l_Part_0, 
            Render = function(v22) --[[ Line: 60 ]] --[[ Name: Render ]]
                -- upvalues: v7 (copy), l_Y_0 (copy)
                local v23 = {};
                local v24 = math.sqrt(v7 * v7 - l_Y_0 * l_Y_0);
                for v25 = -3, 3 do
                    local v26 = Vector2.new(-3, v25).Unit * v24;
                    table.insert(v23, (Vector3.new(v26.X, l_Y_0, v26.Y)));
                end;
                for v27 = -3, 3 do
                    local v28 = Vector2.new(v27, 3).Unit * v24;
                    table.insert(v23, (Vector3.new(v28.X, l_Y_0, v28.Y)));
                end;
                for v29 = 3, -3, -1 do
                    local v30 = Vector2.new(3, v29).Unit * v24;
                    table.insert(v23, (Vector3.new(v30.X, l_Y_0, v30.Y)));
                end;
                for v31 = 3, -3, -1 do
                    local v32 = Vector2.new(v31, -3).Unit * v24;
                    table.insert(v23, (Vector3.new(v32.X, l_Y_0, v32.Y)));
                end;
                v22:AddPath(v23, true);
            end
        }), 
        LongitudeGuide = v2.createElement(v3, {
            Color3 = v4.PrimaryColor, 
            AlwaysOnTop = true, 
            Adornee = l_Part_0, 
            CFrame = CFrame.fromEulerAnglesYXZ(0, v10, 0), 
            Render = v21
        })
    };
    if v4.GridSize then
        local v34 = v4.GridSize / v7;
        v33.LongitudeRightSnap = v2.createElement(v3, {
            Color3 = v4.Color, 
            AlwaysOnTop = false, 
            Adornee = l_Part_0, 
            CFrame = CFrame.fromEulerAnglesYXZ(0, v10 + v34, 0), 
            Render = v21
        });
        v33.LongitudeLeftSnap = v2.createElement(v3, {
            Color3 = v4.Color, 
            AlwaysOnTop = false, 
            Adornee = l_Part_0, 
            CFrame = CFrame.fromEulerAnglesYXZ(0, v10 - v34, 0), 
            Render = v21
        });
        v33.LattitudeSnap = v2.createElement(v3, {
            Color3 = v4.Color, 
            AlwaysOnTop = false, 
            Adornee = l_Part_0, 
            CFrame = CFrame.fromEulerAnglesYXZ(0, v10, 0), 
            Render = function(v35) --[[ Line: 107 ]] --[[ Name: renderLattitudeGrid ]]
                -- upvalues: v8 (copy), v4 (copy), v7 (copy), l_Y_0 (copy), v34 (copy)
                local v36 = v8.Y >= 0 and 1 or -1;
                for v37 = v36 * v4.GridSize, v36 * v7, v36 * v4.GridSize do
                    if math.abs(v37 - l_Y_0) >= 0.01 then
                        local v38 = math.sqrt(v7 * v7 - v37 * v37);
                        local v39 = 2 * v38 * math.sin(v34 / 2);
                        local v40 = 3.141592653589793 - v34 / 2;
                        local v41 = v39 * math.cos(v40);
                        local v42 = v39 * math.sin(v40);
                        local v43 = Vector3.new(v41, v37, v38 - v42);
                        local v44 = Vector3.new(0, v37, v38);
                        local v45 = Vector3.new(-v41, v37, v38 - v42);
                        v35:AddLine(v43, v44);
                        v35:AddLine(v44, v45);
                    end;
                end;
            end
        });
    end;
    return v2.createFragment(v33);
end;