local v8 = {
    setVector3Value = function(v0, v1, v2) --[[ Line: 8 ]] --[[ Name: setVector3Value ]]
        local l_v0_FirstChild_0 = v0:FindFirstChild(v1);
        if l_v0_FirstChild_0 == nil then
            l_v0_FirstChild_0 = Instance.new("Vector3Value");
            l_v0_FirstChild_0.Name = v1;
            l_v0_FirstChild_0.Parent = v0;
        end;
        if l_v0_FirstChild_0:IsA("Vector3Value") then
            l_v0_FirstChild_0.Value = v2;
        end;
    end, 
    setNumberValue = function(v4, v5, v6) --[[ Line: 24 ]] --[[ Name: setNumberValue ]]
        local l_v4_FirstChild_0 = v4:FindFirstChild(v5);
        if l_v4_FirstChild_0 == nil then
            l_v4_FirstChild_0 = Instance.new("NumberValue");
            l_v4_FirstChild_0.Name = v5;
            l_v4_FirstChild_0.Parent = v4;
        end;
        if l_v4_FirstChild_0:IsA("NumberValue") then
            l_v4_FirstChild_0.Value = v6;
        end;
    end
};
v8.setOriginalSize = function(v9, v10) --[[ Line: 37 ]] --[[ Name: setOriginalSize ]]
    -- upvalues: v8 (copy)
    v8.setVector3Value(v9, "OriginalSize", v10);
end;
v8.setOriginalPosition = function(v11, v12) --[[ Line: 41 ]] --[[ Name: setOriginalPosition ]]
    -- upvalues: v8 (copy)
    v8.setVector3Value(v11, "OriginalPosition", v12);
end;
v8.setBodyProportionScale = function(v13, v14) --[[ Line: 45 ]] --[[ Name: setBodyProportionScale ]]
    -- upvalues: v8 (copy)
    v8.setNumberValue(v13, "BodyProportionScale", v14);
end;
v8.setBodyTypeScale = function(v15, v16) --[[ Line: 49 ]] --[[ Name: setBodyTypeScale ]]
    -- upvalues: v8 (copy)
    v8.setNumberValue(v15, "BodyTypeScale", v16);
end;
return v8;