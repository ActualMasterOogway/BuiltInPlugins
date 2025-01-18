return {
    new = function() --[[ Line: 3 ]] --[[ Name: new ]]
        local v0 = {
            map = {}, 
            mt = {}
        };
        v0.mt.__index = function(v1, v2) --[[ Line: 8 ]] --[[ Name: __index ]]
            -- upvalues: v0 (copy)
            if v2 == "insert" then
                return function(v3, v4) --[[ Line: 10 ]]
                    -- upvalues: v1 (copy)
                    if not v1.map[v3] then
                        table.insert(v1, {
                            v3, 
                            v4
                        });
                        v1.map[v3] = #v1;
                    end;
                end;
            elseif v2 == "remove" then
                return function(v5, _) --[[ Line: 17 ]]
                    -- upvalues: v1 (copy), v0 (ref)
                    if v1.map[v5] then
                        local v7 = v1.map[v5];
                        table.remove(v0, v7);
                        for v8 = v7, #v1 do
                            v1.map[v1[v8][1]] = v8;
                        end;
                    end;
                end;
            elseif v2 == "exists" then
                return function(v9) --[[ Line: 27 ]]
                    -- upvalues: v1 (copy)
                    return v1.map[v9] ~= nil;
                end;
            elseif v2 == "clear" then
                return function() --[[ Line: 31 ]]
                    -- upvalues: v1 (copy)
                    while #v1 > 0 do
                        v1.map[v1[1][1]] = nil;
                        table.remove(v1, 1);
                    end;
                end;
            else
                return;
            end;
        end;
        setmetatable(v0, v0.mt);
        return v0;
    end
};