return function(v0) --[[ Line: 2 ]]
    if v0 == nil then
        return Instance.new("Model");
    elseif v0:IsA("Model") then
        return v0;
    else
        local l_Model_0 = Instance.new("Model");
        v0.Parent = l_Model_0;
        return l_Model_0;
    end;
end;