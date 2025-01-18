local v0 = script.Parent.Parent["roblox_infinite-scroller"]["infinite-scroller"];
if v0.ClassName == "ModuleScript" then
    return require(v0);
else
    return v0;
end;