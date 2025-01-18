local v0 = {};
for _, v2 in pairs(script:GetChildren()) do
    if v2.ClassName == "ModuleScript" then
        v0[v2.Name] = require(v2);
    end;
end;
return v0.freeze("Dash", v0, true);