local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local v1 = require(l_script_FirstAncestor_0.Enums.PopoverSide);
local v2 = require(l_script_FirstAncestor_0.Enums.PopoverAlign);
local function _(v3, v4, v5, v6) --[[ Line: 9 ]] --[[ Name: calculatePopoverBounds ]]
    -- upvalues: v1 (copy)
    local l_v6_0 = v6;
    if v3 == v1.Top or v3 == v1.Bottom then
        return l_v6_0 + Vector2.new(0, v4 + v5);
    else
        return l_v6_0 + Vector2.new(v4 + v5, 0);
    end;
end;
return {
    isOnScreen = function(v9, v10) --[[ Line: 24 ]] --[[ Name: isOnScreen ]]
        if v9.Min.X > v10.Max.X or v9.Max.X < v10.Min.X or v9.Min.Y > v10.Max.Y or v9.Max.Y < v10.Min.Y then
            return false;
        else
            return true;
        end;
    end, 
    calculateSide = function(v11, v12, v13, v14, v15, v16) --[[ Line: 37 ]] --[[ Name: calculateSide ]]
        -- upvalues: v1 (copy)
        local l_v16_0 = v16;
        local v18 = if not (v11 ~= v1.Top) or v11 == v1.Bottom then l_v16_0 + Vector2.new(0, v12 + v15) else l_v16_0 + Vector2.new(v12 + v15, 0);
        if v11 == v1.Top then
            if v13.Min.Y - v18.Y < v14.Min.Y and v13.Max.Y + v18.Y < v14.Max.Y then
                return v1.Bottom;
            end;
        elseif v11 == v1.Bottom then
            if v13.Max.Y + v18.Y > v14.Max.Y and v13.Min.Y - v18.Y > v14.Min.Y then
                return v1.Top;
            end;
        elseif v11 == v1.Left then
            if v13.Min.X - v18.X < v14.Min.X and v13.Max.X + v18.X < v14.Max.X then
                return v1.Right;
            end;
        elseif v11 == v1.Right and v13.Max.X + v18.X > v14.Max.X and v13.Min.X - v18.X > v14.Min.X then
            return v1.Left;
        end;
        return v11;
    end, 
    calculatePositions = function(v19, v20, v21, v22, v23, v24, v25, v26) --[[ Line: 66 ]] --[[ Name: calculatePositions ]]
        -- upvalues: v1 (copy), v2 (copy)
        local v27 = v23.Max - v23.Min;
        local v28 = v24.Max - v24.Min;
        local l_v26_0 = v26;
        local v30 = if not (v19 ~= v1.Top) or v19 == v1.Bottom then l_v26_0 + Vector2.new(0, v20 + v25) else l_v26_0 + Vector2.new(v20 + v25, 0);
        l_v26_0 = 0;
        local v31 = 0;
        local v32 = 0;
        local v33 = 0;
        if v19 == v1.Top then
            v31 = v23.Min.Y - v30.Y;
            v33 = v26.Y;
        elseif v19 == v1.Bottom then
            v31 = v23.Max.Y + v30.Y - v26.Y;
            v33 = 0;
        elseif v19 == v1.Left then
            l_v26_0 = v23.Min.X - v30.X;
            v32 = v26.X;
        elseif v19 == v1.Right then
            l_v26_0 = v23.Max.X + v30.X - v26.X;
            v32 = 0;
        end;
        if v21 == v2.Start then
            if v19 == v1.Top or v19 == v1.Bottom then
                l_v26_0 = v23.Min.X + v22;
                v32 = math.min(v27.X, v30.X) / 2;
            else
                v31 = v23.Min.Y + v22;
                v33 = math.min(v27.Y, v30.Y) / 2;
            end;
        elseif v21 == v2.Center then
            if v19 == v1.Top or v19 == v1.Bottom then
                l_v26_0 = v23.Min.X + v22 + (v27.X - v30.X) / 2;
                v32 = v30.X / 2;
            else
                v31 = v23.Min.Y + v22 + (v27.Y - v30.Y) / 2;
                v33 = v30.Y / 2;
            end;
        elseif v21 == v2.End then
            if v19 == v1.Top or v19 == v1.Bottom then
                l_v26_0 = v23.Min.X + v22 + v27.X - v30.X;
                v32 = math.max(v27.X / 2 + v30.X - v27.X, v30.X / 2);
            else
                v31 = v23.Min.Y + v22 + v27.Y - v30.Y;
                v33 = math.max(v27.Y / 2 + v30.Y - v27.Y, v30.Y / 2);
            end;
        end;
        l_v26_0 = l_v26_0 - v24.Min.X;
        v31 = v31 - v24.Min.Y;
        l_v26_0 = math.clamp(l_v26_0, 0, v28.X - v30.X);
        v31 = math.clamp(v31, 0, v28.Y - v30.Y);
        return Vector2.new(l_v26_0, v31), Vector2.new(v32, v33);
    end
};