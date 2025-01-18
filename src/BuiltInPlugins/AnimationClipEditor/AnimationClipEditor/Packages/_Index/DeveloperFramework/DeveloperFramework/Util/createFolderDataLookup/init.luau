return function(v0) --[[ Line: 7 ]]
    local v1 = {};
    for _, v3 in pairs(v0) do
        if v3 ~= script then
            v1[v3.Name] = {
                name = v3.Name, 
                story = v3:FindFirstChild(v3.Name .. ".story"), 
                style = v3:FindFirstChild("style"), 
                test = v3:FindFirstChild("test.spec")
            };
        end;
    end;
    return v1;
end;