local v7 = {
    Constructors = {
        Vector3 = Vector3, 
        CFrame = CFrame, 
        Color3 = Color3, 
        Vector2 = Vector2, 
        Rect = Rect, 
        UDim = UDim, 
        PhysicalProperties = PhysicalProperties, 
        Faces = Faces, 
        ColorSequence = ColorSequence, 
        NumberRange = NumberRange, 
        NumberSequence = NumberSequence, 
        UDim2 = UDim2, 
        BrickColor = BrickColor, 
        Region3int16 = Region3int16, 
        Ray = Ray, 
        TweenInfo = TweenInfo, 
        Enum = Enum
    }, 
    JSONEncodeValue = function(_, v1) --[[ Line: 23 ]] --[[ Name: JSONEncodeValue ]]
        local v2 = typeof(v1);
        if v2 == "number" or v2 == "string" or v2 == "nil" or v2 == "boolean" then
            return v1;
        elseif v2 == "Instance" then
            return {
                v1:GetFullName(), 
                0
            };
        elseif v2 == "Vector3" or v2 == "CFrame" or v2 == "Color3" or v2 == "Vector2" or v2 == "Rect" or v2 == "UDim" or v2 == "PhysicalProperties" then
            return {
                tostring(v1), 
                1, 
                v2
            };
        elseif v2 == "Faces" then
            return {
                tostring(v1), 
                2
            };
        elseif v2 == "ColorSequence" or v2 == "NumberRange" or v2 == "NumberSequence" then
            return {
                tostring(v1), 
                3, 
                v2
            };
        elseif v2 == "UDim2" then
            return {
                {
                    v1.X.Scale, 
                    v1.X.Offset, 
                    v1.Y.Scale, 
                    v1.Y.Offset
                }, 
                4
            };
        elseif v2 == "BrickColor" or v2 == "Content" then
            if v2 == "Content" then
                return (tostring(v1));
            else
                return {
                    tostring(v1), 
                    5
                };
            end;
        elseif v2 == "Region3int16" then
            local l_Min_0 = v1.Min;
            local l_Max_0 = v1.Max;
            return {
                {
                    l_Min_0.X, 
                    l_Min_0.Y, 
                    l_Min_0.Z, 
                    l_Max_0.X, 
                    l_Max_0.Y, 
                    l_Max_0.Z
                }, 
                6
            };
        elseif v2 == "Ray" then
            local l_Origin_0 = v1.Origin;
            local l_Direction_0 = v1.Direction;
            return {
                {
                    l_Origin_0.X, 
                    l_Origin_0.Y, 
                    l_Origin_0.Z, 
                    l_Direction_0.X, 
                    l_Direction_0.Y, 
                    l_Direction_0.Z
                }, 
                7
            };
        elseif v2 == "TweenInfo" then
            return {
                {
                    v1.Time, 
                    v1.EasingStyle.Value, 
                    v1.EasingDirection.Value, 
                    v1.RepeatCount, 
                    v1.Reverses, 
                    v1.DelayTime
                }, 
                8
            };
        elseif v2 == "EnumItem" then
            return {
                {
                    tostring(v1.EnumType), 
                    v1.Name
                }, 
                9
            };
        else
            return nil;
        end;
    end
};
v7.JSONDecodeValue = function(_, v9) --[[ Line: 77 ]] --[[ Name: JSONDecodeValue ]]
    -- upvalues: v7 (copy)
    if typeof(v9) ~= "table" then
        return v9;
    else
        local v10 = v9[1];
        local v11 = v9[2];
        local v12 = nil;
        if v9[3] then
            v12 = v7.Constructors[v9[3]];
        end;
        if v11 == 1 then
            return v12.new(table.unpack(string.split(v10, ", ")));
        elseif v11 == 2 then
            local v13 = {};
            for _, v15 in pairs(string.split(v10, ", ")) do
                table.insert(v13, Enum.NormalId[v15]);
            end;
            return Faces.new(table.unpack(v13));
        elseif v11 == 3 then
            return v12.new(table.unpack(string.split(v10, " ")));
        elseif v11 == 4 then
            return UDim2.new(v10[1], v10[2], v10[3], v10[4]);
        elseif v11 == 5 then
            return BrickColor.new(v10);
        elseif v11 == 6 then
            return Region3int16.new(Vector3int16.new(v10[1], v10[2], v10[3]), Vector3int16.new(v10[4], v10[5], v10[6]));
        elseif v11 == 7 then
            return Ray.new(Vector3.new(v10[1], v10[2], v10[3]), (Vector3.new(v10[4], v10[5], v10[6])));
        elseif v11 == 8 then
            return TweenInfo.new(table.unpack(v10));
        elseif v11 == 9 then
            return Enum[v10[1]][v10[2]];
        elseif v11 == 0 then
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 113 ]]
                -- upvalues: v10 (copy)
                local l_game_0 = game;
                for _, v18 in pairs(string.split(v10, ".")) do
                    l_game_0 = l_game_0[v18];
                end;
                return l_game_0;
            end);
            if l_status_0 then
                return l_result_0;
            else
                return nil;
            end;
        else
            return v10;
        end;
    end;
end;
return v7;