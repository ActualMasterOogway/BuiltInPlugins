return function(v0) --[[ Line: 6 ]] --[[ Name: preventExtensions ]]
    local v1 = tostring(v0);
    return (setmetatable(v0, {
        __newindex = function(_, v3, _) --[[ Line: 11 ]] --[[ Name: __newindex ]]
            -- upvalues: v1 (copy)
            local v5 = ("%q (%s) is not a valid member of %s"):format(tostring(v3), typeof(v3), v1);
            error(v5, 2);
        end, 
        __metatable = false
    }));
end;