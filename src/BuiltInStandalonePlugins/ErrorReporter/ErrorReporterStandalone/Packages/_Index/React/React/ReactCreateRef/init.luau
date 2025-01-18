local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Shared);
local v2 = require(script.Parent["ReactBinding.roblox"]);
return {
    createRef = function() --[[ Line: 25 ]]
        -- upvalues: v2 (copy)
        local v3, _ = v2.create(nil);
        local v5 = {};
        if _G.__DEV__ then
            v3._source = debug.traceback("Ref created at:", 1);
        end;
        setmetatable(v5, {
            __index = function(_, v7) --[[ Line: 43 ]] --[[ Name: __index ]]
                -- upvalues: v3 (copy)
                if v7 == "current" then
                    return v3:getValue();
                else
                    return v3[v7];
                end;
            end, 
            __newindex = function(_, v9, v10) --[[ Line: 50 ]] --[[ Name: __newindex ]]
                -- upvalues: v2 (ref), v3 (copy)
                if v9 == "current" then
                    v2.update(v3, v10);
                end;
                v3[v9] = v10;
            end, 
            __tostring = function(_) --[[ Line: 61 ]] --[[ Name: __tostring ]]
                -- upvalues: v3 (copy)
                return string.format("Ref(%s)", (tostring(v3:getValue())));
            end
        });
        return v5;
    end
};