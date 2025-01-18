local v0 = require(script.Parent.Networking);
local v1 = {};
v1.new = function(v2) --[[ Line: 29 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy), v1 (copy)
    if not v2 then
        v2 = {};
    end;
    local v3 = v2.networking or v0.new();
    local v4 = {
        Images = require(script.Images), 
        Develop = require(script.Develop)(v3), 
        Inventory = require(script.Inventory)(v3), 
        WWW = require(script.WWW)(v3)
    };
    setmetatable(v4, v1);
    return v4;
end;
v1.mock = function(v5) --[[ Line: 55 ]] --[[ Name: mock ]]
    -- upvalues: v0 (copy), v1 (copy)
    local v6 = v0.mock(v5);
    return v1.new({
        networking = v6
    });
end;
return v1;