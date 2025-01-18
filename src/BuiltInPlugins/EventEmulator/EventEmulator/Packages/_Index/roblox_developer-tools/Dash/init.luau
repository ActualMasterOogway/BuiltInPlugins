local l_dash_0 = script.Parent.Parent.roblox_dash.dash;
if l_dash_0.ClassName == "ModuleScript" then
    return require(l_dash_0);
else
    return l_dash_0;
end;