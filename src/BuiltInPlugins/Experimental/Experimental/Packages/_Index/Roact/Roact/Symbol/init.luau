return {
    named = function(v0) --[[ Line: 17 ]] --[[ Name: named ]]
        assert(type(v0) == "string", "Symbols must be created using a string name!");
        local v1 = newproxy(true);
        local v2 = ("Symbol(%s)"):format(v0);
        getmetatable(v1).__tostring = function() --[[ Line: 24 ]]
            -- upvalues: v2 (copy)
            return v2;
        end;
        return v1;
    end
};