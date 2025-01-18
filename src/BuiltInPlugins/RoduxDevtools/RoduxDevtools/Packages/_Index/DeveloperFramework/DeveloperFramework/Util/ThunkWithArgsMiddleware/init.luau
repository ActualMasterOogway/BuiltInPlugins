return function(...) --[[ Line: 35 ]]
    local v0 = {
        ...
    };
    return function(v1, v2) --[[ Line: 38 ]]
        -- upvalues: v0 (copy)
        return function(v3) --[[ Line: 39 ]]
            -- upvalues: v2 (copy), v0 (ref), v1 (copy)
            if typeof(v3) == "function" then
                return v3(v2, unpack(v0));
            else
                return v1(v3);
            end;
        end;
    end;
end;