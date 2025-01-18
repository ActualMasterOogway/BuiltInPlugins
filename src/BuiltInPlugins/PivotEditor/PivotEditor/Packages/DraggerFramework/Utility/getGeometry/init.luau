local function v1(v0) --[[ Line: 3 ]] --[[ Name: getShape ]]
    if v0:IsA("WedgePart") then
        return "Wedge", (Vector3.new(1, 1, 1, 0));
    elseif v0:IsA("CornerWedgePart") then
        return "CornerWedge", (Vector3.new(1, 1, 1, 0));
    elseif v0:IsA("Terrain") then
        return "Terrain", (Vector3.new(1, 1, 1, 0));
    elseif v0:IsA("UnionOperation") then
        return "Brick", (Vector3.new(1, 1, 1, 0));
    elseif v0:IsA("MeshPart") then
        return "Brick", (Vector3.new(1, 1, 1, 0));
    else
        if v0:IsA("Part") then
            if v0.Shape == Enum.PartType.Ball then
                return "Sphere", (Vector3.new(1, 1, 1, 0));
            elseif v0.Shape == Enum.PartType.Cylinder then
                return "Cylinder", (Vector3.new(1, 1, 1, 0));
            elseif v0.Shape == Enum.PartType.Block then
                return "Brick", (Vector3.new(1, 1, 1, 0));
            elseif v0.Shape == Enum.PartType.Wedge then
                return "Wedge", (Vector3.new(1, 1, 1, 0));
            elseif v0.Shape == Enum.PartType.CornerWedge then
                return "CornerWedge", (Vector3.new(1, 1, 1, 0));
            end;
        end;
        return "Brick", (Vector3.new(1, 1, 1, 0));
    end;
end;
return function(v2, v3, v4) --[[ Line: 31 ]]
    -- upvalues: v1 (copy)
    local v5 = v4 or v2.CFrame;
    local l_p_0 = v5.p;
    local v7 = v2.Size.x / 2;
    local v8 = v2.Size.y / 2;
    local v9 = v2.Size.z / 2;
    local l_RightVector_0 = v5.RightVector;
    local l_UpVector_0 = v5.UpVector;
    local v12 = -v5.LookVector;
    local v13 = nil;
    local v14 = nil;
    local v15 = nil;
    local v16, v17 = v1(v2);
    v7 = v7 * v17.X;
    v8 = v8 * v17.Y;
    v9 = v9 * v17.Z;
    if v16 == "Brick" or v16 == "Sphere" or v16 == "Cylinder" then
        v13 = {
            l_p_0 + l_RightVector_0 * v7 + l_UpVector_0 * v8 + v12 * v9, 
            l_p_0 + l_RightVector_0 * v7 + l_UpVector_0 * v8 - v12 * v9, 
            l_p_0 - l_RightVector_0 * v7 + l_UpVector_0 * v8 + v12 * v9, 
            l_p_0 - l_RightVector_0 * v7 + l_UpVector_0 * v8 - v12 * v9, 
            l_p_0 + l_RightVector_0 * v7 - l_UpVector_0 * v8 + v12 * v9, 
            l_p_0 + l_RightVector_0 * v7 - l_UpVector_0 * v8 - v12 * v9, 
            l_p_0 - l_RightVector_0 * v7 - l_UpVector_0 * v8 + v12 * v9, 
            l_p_0 - l_RightVector_0 * v7 - l_UpVector_0 * v8 - v12 * v9
        };
        v14 = {
            {
                v13[1], 
                v13[2], 
                (math.min(2 * v7, 2 * v8))
            }, 
            {
                v13[3], 
                v13[4], 
                (math.min(2 * v7, 2 * v8))
            }, 
            {
                v13[1], 
                v13[3], 
                (math.min(2 * v8, 2 * v9))
            }, 
            {
                v13[2], 
                v13[4], 
                (math.min(2 * v8, 2 * v9))
            }, 
            {
                v13[5], 
                v13[6], 
                (math.min(2 * v7, 2 * v8))
            }, 
            {
                v13[7], 
                v13[8], 
                (math.min(2 * v7, 2 * v8))
            }, 
            {
                v13[5], 
                v13[7], 
                (math.min(2 * v8, 2 * v9))
            }, 
            {
                v13[6], 
                v13[8], 
                (math.min(2 * v8, 2 * v9))
            }, 
            {
                v13[1], 
                v13[5], 
                (math.min(2 * v7, 2 * v9))
            }, 
            {
                v13[2], 
                v13[6], 
                (math.min(2 * v7, 2 * v9))
            }, 
            {
                v13[3], 
                v13[7], 
                (math.min(2 * v7, 2 * v9))
            }, 
            {
                v13[4], 
                v13[8], 
                (math.min(2 * v7, 2 * v9))
            }
        };
        v15 = {
            {
                v13[1], 
                l_RightVector_0, 
                "RightSurface", 
                v12, 
                {
                    v13[5], 
                    v13[6], 
                    v13[2], 
                    v13[1]
                }
            }, 
            {
                v13[3], 
                -l_RightVector_0, 
                "LeftSurface", 
                v12, 
                {
                    v13[3], 
                    v13[4], 
                    v13[8], 
                    v13[7]
                }
            }, 
            {
                v13[1], 
                l_UpVector_0, 
                "TopSurface", 
                l_RightVector_0, 
                {
                    v13[1], 
                    v13[2], 
                    v13[4], 
                    v13[3]
                }
            }, 
            {
                v13[5], 
                -l_UpVector_0, 
                "BottomSurface", 
                l_RightVector_0, 
                {
                    v13[7], 
                    v13[8], 
                    v13[6], 
                    v13[5]
                }
            }, 
            {
                v13[1], 
                v12, 
                "BackSurface", 
                l_RightVector_0, 
                {
                    v13[1], 
                    v13[3], 
                    v13[7], 
                    v13[5]
                }
            }, 
            {
                v13[2], 
                -v12, 
                "FrontSurface", 
                l_RightVector_0, 
                {
                    v13[6], 
                    v13[8], 
                    v13[4], 
                    v13[2]
                }
            }
        };
    elseif v16 == "Sphere" or v16 == "Cylinder" then
        v13 = {
            v3
        };
        v14 = {};
        local l_Unit_0 = (v3 - l_p_0).Unit;
        local l_Unit_1 = l_Unit_0:Cross((Vector3.new(0, 1, 0, 0))).Unit;
        local _ = nil;
        v15 = {
            {
                v3, 
                l_Unit_0, 
                if math.abs(l_Unit_0.X) > math.abs(l_Unit_0.Y) and math.abs(l_Unit_0.X) > math.abs(l_Unit_0.Z) then l_Unit_0.X > 0 and "RightSurface" or "LeftSurface" else if math.abs(l_Unit_0.Y) > math.abs(l_Unit_0.Z) then l_Unit_0.Y > 0 and "TopSurface" or "BottomSurface" else l_Unit_0.Z > 0 and "BackSurface" or "FrontSurface", 
                l_Unit_1, 
                {}
            }
        };
    elseif v16 == "CornerWedge" then
        local l_Unit_2 = (v12 * v8 + l_UpVector_0 * v9).Unit;
        local l_Unit_3 = (-l_RightVector_0 * v8 + l_UpVector_0 * v7).Unit;
        v13 = {
            l_p_0 + l_RightVector_0 * v7 + l_UpVector_0 * v8 - v12 * v9, 
            l_p_0 + l_RightVector_0 * v7 - l_UpVector_0 * v8 + v12 * v9, 
            l_p_0 + l_RightVector_0 * v7 - l_UpVector_0 * v8 - v12 * v9, 
            l_p_0 - l_RightVector_0 * v7 - l_UpVector_0 * v8 + v12 * v9, 
            l_p_0 - l_RightVector_0 * v7 - l_UpVector_0 * v8 - v12 * v9
        };
        v14 = {
            {
                v13[2], 
                v13[3], 
                0
            }, 
            {
                v13[3], 
                v13[5], 
                0
            }, 
            {
                v13[5], 
                v13[4], 
                0
            }, 
            {
                v13[4], 
                v13[2], 
                0
            }, 
            {
                v13[1], 
                v13[3], 
                0
            }, 
            {
                v13[1], 
                v13[2], 
                0
            }, 
            {
                v13[1], 
                v13[5], 
                0
            }, 
            {
                v13[1], 
                v13[4], 
                0
            }
        };
        v15 = {
            {
                v13[2], 
                -l_UpVector_0, 
                "BottomSurface", 
                l_RightVector_0, 
                {
                    v13[2], 
                    v13[3], 
                    v13[5], 
                    v13[4]
                }
            }, 
            {
                v13[1], 
                l_RightVector_0, 
                "RightSurface", 
                -l_UpVector_0, 
                {
                    v13[1], 
                    v13[3], 
                    v13[2]
                }
            }, 
            {
                v13[1], 
                -v12, 
                "FrontSurface", 
                -l_UpVector_0, 
                {
                    v13[1], 
                    v13[3], 
                    v13[5]
                }
            }, 
            {
                v13[1], 
                l_Unit_2, 
                "BackSurface", 
                l_RightVector_0, 
                {
                    v13[1], 
                    v13[2], 
                    v13[4]
                }
            }, 
            {
                v13[1], 
                l_Unit_3, 
                "LeftSurface", 
                v12, 
                {
                    v13[1], 
                    v13[5], 
                    v13[4]
                }
            }
        };
    elseif v16 == "Wedge" then
        local l_Unit_4 = (-v12 * v8 + l_UpVector_0 * v9).Unit;
        v13 = {
            l_p_0 + l_RightVector_0 * v7 + l_UpVector_0 * v8 + v12 * v9, 
            l_p_0 - l_RightVector_0 * v7 + l_UpVector_0 * v8 + v12 * v9, 
            l_p_0 + l_RightVector_0 * v7 - l_UpVector_0 * v8 + v12 * v9, 
            l_p_0 + l_RightVector_0 * v7 - l_UpVector_0 * v8 - v12 * v9, 
            l_p_0 - l_RightVector_0 * v7 - l_UpVector_0 * v8 + v12 * v9, 
            l_p_0 - l_RightVector_0 * v7 - l_UpVector_0 * v8 - v12 * v9
        };
        v14 = {
            {
                v13[1], 
                v13[2], 
                (math.min(2 * v8, 2 * v9))
            }, 
            {
                v13[1], 
                v13[4], 
                (math.min(2 * v8, 2 * v9))
            }, 
            {
                v13[2], 
                v13[6], 
                (math.min(2 * v8, 2 * v9))
            }, 
            {
                v13[3], 
                v13[4], 
                (math.min(2 * v7, 2 * v8))
            }, 
            {
                v13[5], 
                v13[6], 
                (math.min(2 * v7, 2 * v8))
            }, 
            {
                v13[3], 
                v13[5], 
                (math.min(2 * v8, 2 * v9))
            }, 
            {
                v13[4], 
                v13[6], 
                (math.min(2 * v8, 2 * v9))
            }, 
            {
                v13[1], 
                v13[3], 
                (math.min(2 * v7, 2 * v9))
            }, 
            {
                v13[2], 
                v13[5], 
                (math.min(2 * v7, 2 * v9))
            }
        };
        v15 = {
            {
                v13[1], 
                l_RightVector_0, 
                "RightSurface", 
                v12, 
                {
                    v13[4], 
                    v13[1], 
                    v13[3]
                }
            }, 
            {
                v13[2], 
                -l_RightVector_0, 
                "LeftSurface", 
                v12, 
                {
                    v13[2], 
                    v13[6], 
                    v13[5]
                }
            }, 
            {
                v13[3], 
                -l_UpVector_0, 
                "BottomSurface", 
                l_RightVector_0, 
                {
                    v13[5], 
                    v13[6], 
                    v13[4], 
                    v13[3]
                }
            }, 
            {
                v13[1], 
                v12, 
                "BackSurface", 
                l_RightVector_0, 
                {
                    v13[1], 
                    v13[2], 
                    v13[5], 
                    v13[3]
                }
            }, 
            {
                v13[2], 
                l_Unit_4, 
                "FrontSurface", 
                l_Unit_4:Cross(l_RightVector_0), 
                {
                    v13[2], 
                    v13[1], 
                    v13[4], 
                    v13[6]
                }
            }
        };
    elseif v16 == "Terrain" then
        assert(false, "Called GetGeometry on Terrain");
    else
        assert(false, "Bad shape: " .. v16);
    end;
    local v24 = {
        part = v2, 
        shape = (not (v16 ~= "Sphere") or v16 == "Cylinder") and v16 or "Mesh", 
        vertices = v13, 
        edges = v14, 
        faces = v15, 
        vertexMargin = math.min(v7, v8, v9) * 2
    };
    local v25 = 0;
    for _, v27 in ipairs(v15) do
        v25 = v25 + 1;
        v27.id = v25;
        v27.point = v27[1];
        v27.normal = v27[2];
        v27.surface = v27[3];
        v27.direction = v27[4];
        v27.vertices = v27[5];
        v27.part = v2;
        v27.type = "Face";
        local v28 = nil;
        local v29 = nil;
        local v30 = nil;
        local v31 = nil;
        v27[1] = v28;
        v27[2] = v29;
        v27[3] = v30;
        v27[4] = v31;
    end;
    for _, v33 in ipairs(v14) do
        v25 = v25 + 1;
        v33.id = v25;
        local v34 = v33[1];
        local v35 = v33[2];
        v33.a = v34;
        v33.b = v35;
        v33.direction = (v33.b - v33.a).Unit;
        v33.length = (v33.b - v33.a).Magnitude;
        v33.edgeMargin = v33[3];
        v33.part = v2;
        v33.vertexMargin = v24.vertexMargin;
        v33.type = "Edge";
        v34 = nil;
        v35 = nil;
        local v36 = nil;
        v33[1] = v34;
        v33[2] = v35;
        v33[3] = v36;
    end;
    for v37, v38 in ipairs(v13) do
        v25 = v25 + 1;
        v13[v37] = {
            position = v38, 
            id = v25, 
            type = "Vertex"
        };
    end;
    return v24;
end;