local v0 = require(script.Parent.Symbol);
local v1 = require(script.Parent.strict);
local v2 = newproxy(true);
local v3 = {};
local function _(v4) --[[ Line: 19 ]] --[[ Name: addType ]]
    -- upvalues: v3 (copy), v0 (copy)
    v3[v4] = v0.named("Roact" .. v4);
end;
v3.Binding = v0.named("Roact" .. "Binding");
v3.Element = v0.named("Roact" .. "Element");
v3.HostChangeEvent = v0.named("Roact" .. "HostChangeEvent");
v3.HostEvent = v0.named("Roact" .. "HostEvent");
v3.StatefulComponentClass = v0.named("Roact" .. "StatefulComponentClass");
v3.StatefulComponentInstance = v0.named("Roact" .. "StatefulComponentInstance");
v3.VirtualNode = v0.named("Roact" .. "VirtualNode");
v3.VirtualTree = v0.named("Roact" .. "VirtualTree");
v3.of = function(v6) --[[ Line: 32 ]] --[[ Name: of ]]
    -- upvalues: v2 (copy)
    if typeof(v6) ~= "table" then
        return nil;
    else
        return v6[v2];
    end;
end;
getmetatable(v2).__index = v3;
getmetatable(v2).__tostring = function() --[[ Line: 42 ]]
    return "RoactType";
end;
v1(v3, "Type");
return v2;