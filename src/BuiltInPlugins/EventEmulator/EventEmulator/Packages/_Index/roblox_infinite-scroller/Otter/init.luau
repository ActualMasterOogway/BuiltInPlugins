local l_otter_0 = script.Parent.Parent.roblox_otter.otter;
if l_otter_0.ClassName == "ModuleScript" then
    return require(l_otter_0);
else
    return l_otter_0;
end;