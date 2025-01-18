return {
    new = function(v0) --[[ Line: 14 ]] --[[ Name: new ]]
        local v1 = newproxy(true);
        local v2 = "Symbol()";
        if v0 then
            v2 = ("Symbol(%s)"):format(v0);
        end;
        getmetatable(v1).__tostring = function() --[[ Line: 22 ]]
            -- upvalues: v2 (ref)
            return v2;
        end;
        return v1;
    end
};