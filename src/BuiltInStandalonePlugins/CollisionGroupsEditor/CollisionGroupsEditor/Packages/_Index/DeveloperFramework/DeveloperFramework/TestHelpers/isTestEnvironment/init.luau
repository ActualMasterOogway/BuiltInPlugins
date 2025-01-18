local l_Parent_0 = script:FindFirstAncestor("TestHelpers").Parent;
return function() --[[ Line: 5 ]]
    -- upvalues: l_Parent_0 (copy)
    local l_TestFlags_0 = l_Parent_0:FindFirstChild("TestFlags");
    local v2 = if l_TestFlags_0 then l_TestFlags_0:FindFirstChild("IsTestEnvironment") else nil;
    if v2 and v2:IsA("BoolValue") then
        return v2.Value;
    else
        return false;
    end;
end;