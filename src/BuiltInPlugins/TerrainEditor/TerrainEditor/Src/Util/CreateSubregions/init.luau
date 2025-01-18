local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Util.ConvertTransformToRegion);
local function _(v2) --[[ Line: 9 ]] --[[ Name: floorVector ]]
    return (Vector3.new(math.floor(v2.X), math.floor(v2.Y), (math.floor(v2.Z))));
end;
local function _(v4) --[[ Line: 13 ]] --[[ Name: ceilVector ]]
    return (Vector3.new(math.ceil(v4.X), math.ceil(v4.Y), (math.ceil(v4.Z))));
end;
return function(v6, v7) --[[ Line: 17 ]]
    -- upvalues: v1 (copy)
    local v8 = {};
    local v9 = {};
    local v10 = v1(v6, v7);
    local v11 = Vector3.new(v10.Min.X, v10.Min.Y, v10.Min.Z);
    local v12 = Vector3.new(v10.Max.X, v10.Max.Y, v10.Max.Z);
    local v13 = v11 / 400;
    local v14 = Vector3.new(math.floor(v13.X), math.floor(v13.Y), (math.floor(v13.Z))) * 400;
    local v15 = v12 / 400;
    local v16 = Vector3.new(math.ceil(v15.X), math.ceil(v15.Y), (math.ceil(v15.Z))) * 400;
    v13 = Region3int16.new(Vector3int16.new(v14.X, v14.Y, v14.Z), Vector3int16.new(v16.X, v16.Y, v16.Z));
    for v17 = v13.Min.X, v13.Max.X, 400 do
        for v18 = v13.Min.Y, v13.Max.Y, 400 do
            for v19 = v13.Min.Z, v13.Max.Z, 400 do
                local v20 = Vector3.new(v17, v18, v19):Max(v11);
                local v21 = Vector3.new(v17 + 400, v18 + 400, v19 + 400):Min(v12);
                if v20.X < v21.X and v20.Y < v21.Y and v20.Z < v21.Z then
                    table.insert(v8, Region3int16.new(Vector3int16.new(v20.X, v20.Y, v20.Z) - v10.Min, Vector3int16.new(v21.X, v21.Y, v21.Z) - v10.Min));
                    table.insert(v9, (Vector3int16.new(v20.X, v20.Y, v20.Z)));
                end;
            end;
        end;
    end;
    return v8, v9;
end;