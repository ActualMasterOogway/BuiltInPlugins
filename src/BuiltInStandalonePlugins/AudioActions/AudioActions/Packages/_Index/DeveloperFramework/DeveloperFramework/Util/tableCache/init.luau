return function(v0) --[[ Line: 5 ]] --[[ Name: createTableCache ]]
    local v2 = {
        __tostring = function(v1) --[[ Line: 8 ]]
            -- upvalues: v0 (copy)
            return ("%s(%s)"):format(v0, v1.name);
        end
    };
    v2.add = function(_, v4) --[[ Line: 12 ]] --[[ Name: add ]]
        -- upvalues: v0 (copy), v2 (copy)
        assert(type(v4) == "string", ("%s must be created using a string name!"):format(v0));
        if rawget(v2, v4) then
            return (rawget(v2, v4));
        else
            local v5 = setmetatable({
                name = v4
            }, v2);
            v2[v4] = v5;
            return v5;
        end;
    end;
    return v2;
end;