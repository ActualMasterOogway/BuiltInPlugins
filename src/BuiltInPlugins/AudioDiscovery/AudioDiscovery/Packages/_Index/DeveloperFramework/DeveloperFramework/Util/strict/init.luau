return function(v0, v1) --[[ Line: 1 ]] --[[ Name: strict ]]
    v1 = v1 or tostring(v0);
    return (setmetatable(v0, {
        __index = function(_, v3) --[[ Line: 5 ]] --[[ Name: __index ]]
            -- upvalues: v1 (ref)
            local v4 = ("%q (%s) is not a valid member of %s"):format(tostring(v3), typeof(v3), v1);
            error(v4, 2);
        end, 
        __newindex = function(_, v6) --[[ Line: 11 ]] --[[ Name: __newindex ]]
            -- upvalues: v1 (ref)
            local v7 = ("%q (%s) is not a valid member of %s"):format(tostring(v6), typeof(v6), v1);
            error(v7, 2);
        end
    }));
end;