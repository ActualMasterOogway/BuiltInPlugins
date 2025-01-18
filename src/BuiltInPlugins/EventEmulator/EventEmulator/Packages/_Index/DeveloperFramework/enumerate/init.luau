local l_enumerate_0 = script.Parent.Parent.roblox_enumerate.enumerate;
if l_enumerate_0.ClassName == "ModuleScript" then
    return require(l_enumerate_0);
else
    return l_enumerate_0;
end;