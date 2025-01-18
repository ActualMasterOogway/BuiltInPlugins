local v0 = require(script.Parent.Utility);
local v1 = require(script.Parent.Flags.GetFFlagUIEditorFixCrashInConvert);
return {
    convertAbsoluteSizeToScaleOrOffset = function(_, v3, v4, v5, v6) --[[ Line: 6 ]] --[[ Name: convertAbsoluteSizeToScaleOrOffset ]]
        -- upvalues: v1 (copy), v0 (copy)
        local l_v5_0 = v5;
        if v1 and not v6 then
            return l_v5_0;
        else
            local l_UIPadding_0 = v6:FindFirstChildWhichIsA("UIPadding");
            local l_zero_0 = Vector2.zero;
            local l_zero_1 = Vector2.zero;
            if l_UIPadding_0 then
                l_zero_0 = v0:multUDimWithVector(UDim2.new(l_UIPadding_0.PaddingLeft, l_UIPadding_0.PaddingTop), v6.AbsoluteSize);
                l_zero_1 = v0:multUDimWithVector(UDim2.new(l_UIPadding_0.PaddingRight, l_UIPadding_0.PaddingBottom), v6.AbsoluteSize);
            end;
            local v11 = v6.AbsoluteSize - l_zero_0 - l_zero_1;
            local v12 = 1;
            local v13 = 1;
            if v11.X ~= 0 then
                v12 = v11.X;
            end;
            if v11.Y ~= 0 then
                v13 = v11.Y;
            end;
            v11 = Vector2.new(v12, v13);
            if v3 then
                local v14 = (v4 - Vector2.new(v5.X.Offset, v5.Y.Offset)) / v11;
                return (UDim2.new(v14.X, v5.X.Offset, v14.Y, v5.Y.Offset));
            else
                local v15 = v4 - Vector2.new(v5.X.Scale, v5.Y.Scale) * v6.AbsoluteSize;
                return (UDim2.new(v5.X.Scale, v15.X, v5.Y.Scale, v15.Y));
            end;
        end;
    end, 
    convertAbsolutePositionToScaleOrOffset = function(_, v17, v18, v19, v20, v21, v22) --[[ Line: 45 ]] --[[ Name: convertAbsolutePositionToScaleOrOffset ]]
        -- upvalues: v1 (copy), v0 (copy)
        local l_v20_0 = v20;
        if v1 and not v21 then
            return l_v20_0;
        else
            local l_UIPadding_1 = v21:FindFirstChildWhichIsA("UIPadding");
            local l_zero_2 = Vector2.zero;
            local l_zero_3 = Vector2.zero;
            if l_UIPadding_1 then
                l_zero_2 = v0:multUDimWithVector(UDim2.new(l_UIPadding_1.PaddingLeft, l_UIPadding_1.PaddingTop), v21.AbsoluteSize);
                l_zero_3 = v0:multUDimWithVector(UDim2.new(l_UIPadding_1.PaddingRight, l_UIPadding_1.PaddingBottom), v21.AbsoluteSize);
            end;
            local v27 = v19 / 2;
            local v28 = v0:rotate(v27, Vector2.zero, v21.AbsoluteRotation);
            local v29 = v18 + v27 - v28;
            local v30 = v21.AbsoluteSize / 2;
            local v31 = v0:rotate(v30, Vector2.zero, v21.AbsoluteRotation);
            local v32 = v21.AbsolutePosition + v30 - v31;
            local v33 = v0:rotate(v22 * v19, Vector2.zero, v21.AbsoluteRotation);
            local v34 = v29 - v32 + v33;
            local v35 = v0:rotate(v34, Vector2.zero, -v21.AbsoluteRotation);
            local v36 = v21.AbsoluteSize - l_zero_2 - l_zero_3;
            local v37 = 1;
            local v38 = 1;
            if v36.X ~= 0 then
                v37 = v36.X;
            end;
            if v36.Y ~= 0 then
                v38 = v36.Y;
            end;
            v36 = Vector2.new(v37, v38);
            if v17 then
                local v39 = Vector2.new(v20.X.Offset, v20.Y.Offset);
                local v40 = (v35 - l_zero_2 - v39) / v36;
                return (UDim2.new(v40.X, v20.X.Offset, v40.Y, v20.Y.Offset));
            else
                local v41 = Vector2.new(v20.X.Scale, v20.Y.Scale) * v21.AbsoluteSize;
                local v42 = v35 - l_zero_2 - v41;
                return (UDim2.new(v20.X.Scale, v42.X, v20.Y.Scale, v42.Y));
            end;
        end;
    end, 
    convertAbsoluteToScaleOrOffset = function(v43, v44, v45, v46, v47, v48, v49, v50, v51) --[[ Line: 103 ]] --[[ Name: convertAbsoluteToScaleOrOffset ]]
        return v43:convertAbsolutePositionToScaleOrOffset(v44, v46, v47, v48, v50, v51), (v43:convertAbsoluteSizeToScaleOrOffset(v45, v47, v49, v50));
    end
};