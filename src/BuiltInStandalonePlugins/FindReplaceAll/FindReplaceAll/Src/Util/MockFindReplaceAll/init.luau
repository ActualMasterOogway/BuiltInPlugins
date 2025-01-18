local v0 = {};
v0.__index = v0;
v0.new = function(_) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    local v4 = {
        FindAsync = function(_) --[[ Line: 7 ]] --[[ Name: FindAsync ]]

        end, 
        ReplaceAsync = function(_) --[[ Line: 10 ]] --[[ Name: ReplaceAsync ]]

        end
    };
    setmetatable(v4, {
        __index = v0
    });
    return v4;
end;
return v0;