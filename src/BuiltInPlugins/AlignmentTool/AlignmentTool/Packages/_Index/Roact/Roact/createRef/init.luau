local v0 = require(script.Parent.Binding);
return function() --[[ Line: 7 ]] --[[ Name: createRef ]]
    -- upvalues: v0 (copy)
    local v1, _ = v0.create(nil);
    local v3 = {};
    setmetatable(v3, {
        __index = function(_, v5) --[[ Line: 16 ]] --[[ Name: __index ]]
            -- upvalues: v1 (copy)
            if v5 == "current" then
                return v1:getValue();
            else
                return v1[v5];
            end;
        end, 
        __newindex = function(_, v7, v8) --[[ Line: 23 ]] --[[ Name: __newindex ]]
            -- upvalues: v1 (copy)
            if v7 == "current" then
                error("Cannot assign to the 'current' property of refs", 2);
            end;
            v1[v7] = v8;
        end, 
        __tostring = function(_) --[[ Line: 30 ]] --[[ Name: __tostring ]]
            -- upvalues: v1 (copy)
            return ("RoactRef(%s)"):format((tostring(v1:getValue())));
        end
    });
    return v3;
end;