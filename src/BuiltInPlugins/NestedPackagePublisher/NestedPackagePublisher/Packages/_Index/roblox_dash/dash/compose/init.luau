local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.identity);
return function(...) --[[ Line: 21 ]] --[[ Name: compose ]]
    -- upvalues: v1 (copy)
    local v2 = select("#", ...);
    if v2 == 0 then
        return v1;
    else
        local v3 = {
            ...
        };
        return function(...) --[[ Line: 27 ]]
            -- upvalues: v3 (copy), v2 (copy)
            local v4 = {
                v3[1](...)
            };
            for v5 = 2, v2 do
                v4 = {
                    v3[v5](unpack(v4))
                };
            end;
            return unpack(v4);
        end;
    end;
end;