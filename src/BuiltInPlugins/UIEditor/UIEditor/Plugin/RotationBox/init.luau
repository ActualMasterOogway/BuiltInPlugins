local v0 = {};
local v1 = require(script.Parent.ValueBox);
local v2 = Vector2.new(4, 20);
local v3 = nil;
v0.update = function(_, v5, v6) --[[ Line: 18 ]] --[[ Name: update ]]
    -- upvalues: v2 (copy), v3 (ref)
    local v7 = v5 + v2;
    v3:setPosition(UDim2.new(0, v7.X, 0, v7.Y));
    local v8 = string.format("%d\194\176", v6);
    v3:setText(v8);
end;
v0.setVisible = function(_, v10) --[[ Line: 28 ]] --[[ Name: setVisible ]]
    -- upvalues: v3 (ref)
    v3:setVisible(v10);
end;
v0.On = function(_) --[[ Line: 32 ]] --[[ Name: On ]]
    -- upvalues: v3 (ref), v1 (copy)
    v3 = v1.new();
end;
v0.Off = function(_) --[[ Line: 37 ]] --[[ Name: Off ]]
    -- upvalues: v3 (ref)
    v3:Destroy();
    v3 = nil;
end;
return v0;