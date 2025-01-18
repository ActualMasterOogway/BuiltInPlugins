return function(v0, v1) --[[ Line: 17 ]] --[[ Name: bind ]]
    assert(v0 ~= nil, "Expecting a valid function for argument 'func'");
    assert(typeof(v1) == "table", "Expecting a valid array for argument 'args'");
    return function(...) --[[ Line: 21 ]]
        -- upvalues: v0 (copy), v1 (copy)
        return v0(unpack(v1), ...);
    end;
end;