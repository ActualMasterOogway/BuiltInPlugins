return function(v0) --[[ Line: 1 ]] --[[ Name: dump ]]
    local l_v0_Keys_0 = v0:GetKeys();
    for _, v3 in pairs(l_v0_Keys_0) do
        print("{", v3.Time, v3.Value, v3.Interpolation.Name, v3.LeftTangent, v3.RightTangent, "}");
    end;
end;