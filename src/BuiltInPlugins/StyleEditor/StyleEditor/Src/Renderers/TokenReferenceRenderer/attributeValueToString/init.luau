local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v20 = {
    string = function(v2) --[[ Line: 20 ]] --[[ Name: string ]]
        return string.format("'%s'", v2);
    end, 
    number = function(v3) --[[ Line: 24 ]] --[[ Name: number ]]
        return string.format("%.3f", v3);
    end, 
    UDim = function(v4) --[[ Line: 28 ]] --[[ Name: UDim ]]
        return string.format("{%.3f, %d}", v4.Scale, v4.Offset);
    end, 
    UDim2 = function(v5) --[[ Line: 32 ]] --[[ Name: UDim2 ]]
        return string.format("{%.3f, %d}, {%.3f, %d}", v5.X.Scale, v5.X.Offset, v5.Y.Scale, v5.Y.Offset);
    end, 
    Vector2 = function(v6) --[[ Line: 36 ]] --[[ Name: Vector2 ]]
        return string.format("{%.3f, %.3f}", v6.X, v6.Y);
    end, 
    Vector3 = function(v7) --[[ Line: 40 ]] --[[ Name: Vector3 ]]
        return string.format("{%.3f, %.3f, %.3f}", v7.X, v7.Y, v7.Z);
    end, 
    Rect = function(v8) --[[ Line: 44 ]] --[[ Name: Rect ]]
        return string.format("{%.3f, %.3f}, {%.3f, %.3f}", v8.Min.X, v8.Min.Y, v8.Max.X, v8.Max.Y);
    end, 
    Color3 = function(v9) --[[ Line: 48 ]] --[[ Name: Color3 ]]
        return string.format("#%s", v9:ToHex());
    end, 
    Font = function(v10, v11) --[[ Line: 52 ]] --[[ Name: Font ]]
        local v12 = v11.Fonts[v10.Family];
        if v12 then
            return v12.Name;
        else
            return v10.Family:match("/([^%s/]+)%.json") or v10.Family;
        end;
    end, 
    BrickColor = function(v13) --[[ Line: 59 ]] --[[ Name: BrickColor ]]
        return v13.Name;
    end, 
    CFrame = function(v14) --[[ Line: 63 ]] --[[ Name: CFrame ]]
        local v15, v16, v17 = v14:ToEulerAnglesXYZ();
        return string.format("{%.3f, %.3f, %.3f}, {%.3f, %.3f, %.3f}", v14.Position.X, v14.Position.Y, v14.Position.Z, v15, v16, v17);
    end, 
    NumberSequence = function(v18) --[[ Line: 76 ]] --[[ Name: NumberSequence ]]
        if #v18.Keypoints > 2 or v18.Keypoints[1].Value ~= v18.Keypoints[2].Value then
            return "<NumberSequence>";
        else
            return string.format("%.3f", v18.Keypoints[1].Value);
        end;
    end, 
    ColorSequence = function(v19) --[[ Line: 84 ]] --[[ Name: ColorSequence ]]
        if #v19.Keypoints > 2 or v19.Keypoints[1].Value ~= v19.Keypoints[2].Value then
            return "<ColorSequence>";
        else
            return string.format("#%s", v19.Keypoints[1].Value:ToHex());
        end;
    end
};
return function(v21, v22) --[[ Line: 93 ]] --[[ Name: attributeValueToString ]]
    -- upvalues: v20 (copy)
    local v23 = v20[typeof(v21)];
    if v23 then
        return v23(v21, v22);
    else
        return (tostring(v21));
    end;
end;