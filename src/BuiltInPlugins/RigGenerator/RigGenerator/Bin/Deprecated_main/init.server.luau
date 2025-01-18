if game:GetFastFlag("ImprovePluginSpeed_RigGenerator") then
    return;
else
    local l_Parent_0 = script.Parent.Parent;
    local v1 = require(l_Parent_0.Packages.TestLoader);
    v1.launch("RigGenerator", l_Parent_0.Src);
    if v1.isCli() then
        return;
    else
        require(script.Parent.main)(plugin);
        return;
    end;
end;