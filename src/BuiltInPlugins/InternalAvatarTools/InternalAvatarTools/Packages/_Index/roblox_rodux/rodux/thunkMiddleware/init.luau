return function(v0, v1) --[[ Line: 7 ]] --[[ Name: thunkMiddleware ]]
    return function(v2) --[[ Line: 8 ]]
        -- upvalues: v1 (copy), v0 (copy)
        if typeof(v2) == "function" then
            return v2(v1);
        else
            return v0(v2);
        end;
    end;
end;