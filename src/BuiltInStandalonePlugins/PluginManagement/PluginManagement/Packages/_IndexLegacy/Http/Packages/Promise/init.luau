local l_Promise_0 = script.Parent.Parent.Parent.Promise.Packages.Promise;
if l_Promise_0.ClassName == "ModuleScript" then
    return require(l_Promise_0);
else
    return l_Promise_0;
end;