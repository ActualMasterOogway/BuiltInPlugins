local v0 = {};
local v1 = require(script.Parent["ReactBinding.roblox"]);
v0.createRef = function() --[[ Line: 21 ]]
    -- upvalues: v1 (copy)
    local v2, _ = v1.create(nil);
    local v4 = {};
    if _G.__DEV__ then
        v2._source = debug.traceback("Ref created at:", 1);
    end;
    setmetatable(v4, {
        __index = function(_, v6) --[[ Line: 39 ]] --[[ Name: __index ]]
            -- upvalues: v2 (copy)
            if v6 == "current" then
                return v2:getValue();
            else
                return v2[v6];
            end;
        end, 
        __newindex = function(_, v8, v9) --[[ Line: 46 ]] --[[ Name: __newindex ]]
            -- upvalues: v1 (ref), v2 (copy)
            if v8 == "current" then
                v1.update(v2, v9);
            end;
            v2[v8] = v9;
        end, 
        __tostring = function(_) --[[ Line: 57 ]] --[[ Name: __tostring ]]
            -- upvalues: v2 (copy)
            return ("Ref(%s)"):format((tostring(v2:getValue())));
        end
    });
    return v4;
end;
return v0;