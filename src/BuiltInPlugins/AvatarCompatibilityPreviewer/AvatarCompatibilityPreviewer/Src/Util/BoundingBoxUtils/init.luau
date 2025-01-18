return {
    axisAlignedBoxSize = function(v0, v1) --[[ Line: 5 ]] --[[ Name: axisAlignedBoxSize ]]
        local v2 = v0:Inverse();
        local v3 = v1 * v2.XVector;
        local v4 = v1 * v2.YVector;
        local v5 = v1 * v2.ZVector;
        return (Vector3.new(math.abs(v3.X) + math.abs(v3.Y) + math.abs(v3.Z), math.abs(v4.X) + math.abs(v4.Y) + math.abs(v4.Z), math.abs(v5.X) + math.abs(v5.Y) + math.abs(v5.Z)));
    end, 
    getAABoundingBox = function(v6, v7) --[[ Line: 19 ]] --[[ Name: getAABoundingBox ]]
        local v8 = 1e999;
        local v9 = 1e999;
        local v10 = 1e999;
        local v11 = -1e999;
        local v12 = -1e999;
        local v13 = -1e999;
        for _, v15 in v6 do
            local v16 = v7:ToObjectSpace(v15.CFrame);
            local l_Size_0 = v15.Size;
            local l_X_0 = l_Size_0.X;
            local l_Y_0 = l_Size_0.Y;
            local l_Z_0 = l_Size_0.Z;
            local l_v16_Components_0, v22, v23, v24, v25, v26, v27, v28, v29, v30, v31, v32 = v16:GetComponents();
            local v33 = 0.5 * (math.abs(v24) * l_X_0 + math.abs(v25) * l_Y_0 + math.abs(v26) * l_Z_0);
            local v34 = 0.5 * (math.abs(v27) * l_X_0 + math.abs(v28) * l_Y_0 + math.abs(v29) * l_Z_0);
            local v35 = 0.5 * (math.abs(v30) * l_X_0 + math.abs(v31) * l_Y_0 + math.abs(v32) * l_Z_0);
            if l_v16_Components_0 - v33 < v8 then
                v8 = l_v16_Components_0 - v33;
            end;
            if v22 - v34 < v9 then
                v9 = v22 - v34;
            end;
            if v23 - v35 < v10 then
                v10 = v23 - v35;
            end;
            if v11 < l_v16_Components_0 + v33 then
                v11 = l_v16_Components_0 + v33;
            end;
            if v12 < v22 + v34 then
                v12 = v22 + v34;
            end;
            if v13 < v23 + v35 then
                v13 = v23 + v35;
            end;
        end;
        local v36 = Vector3.new(v11 - v8, v12 - v9, v13 - v10);
        return Vector3.new((v11 + v8) / 2, (v12 + v9) / 2, (v13 + v10) / 2), v36;
    end
};