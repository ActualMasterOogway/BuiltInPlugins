local l_Parent_0 = script.Parent.Parent;
if game:DefineFastFlag("DebugDevFrameworkForceSupportsStyleSheets", false) then
    return true;
else
    local v1 = if l_Parent_0.Parent:FindFirstChild("React") then require(l_Parent_0.Parent.React) else nil;
    local l_l_Parent_0_FirstAncestorWhichIsA_0 = l_Parent_0:FindFirstAncestorWhichIsA("Plugin");
    local v3 = if l_l_Parent_0_FirstAncestorWhichIsA_0 then l_l_Parent_0_FirstAncestorWhichIsA_0:FindFirstChildWhichIsA("Folder") else l_Parent_0.Parent:FindFirstChild("DeveloperStorybook") or nil;
    local v4 = if v3 then v3:FindFirstChild("Src") else nil;
    local v5 = if v4 then v4:FindFirstChild("EnableStyleSheets") else nil;
    local v6 = if v1 then v1.Tag ~= nil and (v5 and v5.Value and true or false) else false;
    if game:GetFastFlag("DebugDeveloperFrameworkSdk") and v3 then
        print((("[DebugDeveloperFrameworkSdk] %* StyleSheets supported: %*"):format(v3.Name, v6)));
    end;
    return v6;
end;