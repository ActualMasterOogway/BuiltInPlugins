local v0 = require(script.Parent.Symbol);
local v1 = require(script.Parent.strict);
local v2 = require(script.Parent.Portal);
local v3 = newproxy(true);
local v5 = {
    Portal = v0.named("Portal"), 
    Host = v0.named("Host"), 
    Function = v0.named("Function"), 
    Stateful = v0.named("Stateful"), 
    Fragment = v0.named("Fragment"), 
    of = function(v4) --[[ Line: 25 ]] --[[ Name: of ]]
        -- upvalues: v3 (copy)
        if typeof(v4) ~= "table" then
            return nil;
        else
            return v4[v3];
        end;
    end
};
local v6 = {
    string = v5.Host, 
    ["function"] = v5.Function, 
    table = v5.Stateful
};
v5.fromComponent = function(v7) --[[ Line: 39 ]] --[[ Name: fromComponent ]]
    -- upvalues: v2 (copy), v3 (copy), v6 (copy)
    if v7 == v2 then
        return v3.Portal;
    else
        return v6[typeof(v7)];
    end;
end;
getmetatable(v3).__index = v5;
v1(v5, "ElementKind");
return v3;