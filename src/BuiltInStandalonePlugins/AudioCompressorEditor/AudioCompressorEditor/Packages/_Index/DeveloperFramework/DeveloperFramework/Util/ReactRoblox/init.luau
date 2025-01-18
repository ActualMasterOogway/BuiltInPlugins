local l_Parent_0 = script:FindFirstAncestor("Util").Parent;
if l_Parent_0.Parent.Parent and l_Parent_0.Parent.Parent.Parent then
    local l_ReactRoblox_0 = l_Parent_0.Parent.Parent.Parent:FindFirstChild("ReactRoblox");
    if l_ReactRoblox_0 and l_ReactRoblox_0:IsA("ModuleScript") then
        return require(l_ReactRoblox_0);
    end;
end;
if l_Parent_0.Parent:FindFirstChild("ReactRoblox") then
    return require(l_Parent_0.Parent.ReactRoblox);
else
    return nil;
end;