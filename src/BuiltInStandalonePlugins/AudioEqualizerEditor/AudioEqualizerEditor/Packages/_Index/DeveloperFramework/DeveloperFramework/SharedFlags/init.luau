local v0 = {};
for _, v2 in ipairs(script:GetChildren()) do
    v0[v2.Name] = require(v2);
end;
return v0;