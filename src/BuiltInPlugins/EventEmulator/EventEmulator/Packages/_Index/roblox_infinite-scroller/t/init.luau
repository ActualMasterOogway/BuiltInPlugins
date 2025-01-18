local l_t_0 = script.Parent.Parent.roblox_t.t;
if l_t_0.ClassName == "ModuleScript" then
    return require(l_t_0);
else
    return l_t_0;
end;