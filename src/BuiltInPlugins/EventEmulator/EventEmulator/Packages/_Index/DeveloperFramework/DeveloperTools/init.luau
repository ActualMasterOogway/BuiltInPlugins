local v0 = script.Parent.Parent["roblox_developer-tools"]["developer-tools"];
if v0.ClassName == "ModuleScript" then
    return require(v0);
else
    return v0;
end;