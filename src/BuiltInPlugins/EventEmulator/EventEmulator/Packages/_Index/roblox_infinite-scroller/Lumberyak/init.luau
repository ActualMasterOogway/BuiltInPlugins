local l_lumberyak_0 = script.Parent.Parent.roblox_lumberyak.lumberyak;
if l_lumberyak_0.ClassName == "ModuleScript" then
    return require(l_lumberyak_0);
else
    return l_lumberyak_0;
end;