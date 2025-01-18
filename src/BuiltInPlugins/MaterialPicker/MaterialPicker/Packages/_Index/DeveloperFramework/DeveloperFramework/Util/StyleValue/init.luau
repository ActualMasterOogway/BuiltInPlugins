local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 34 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    assert(v1, "StyleValue.new expects a 'name' parameter");
    assert(v2, "StyleValue.new expects a 'themesToValuesMap' parameter");
    local v3 = {
        name = v1, 
        themes = v2
    };
    v3.__tostring = function() --[[ Line: 43 ]]
        -- upvalues: v3 (copy)
        return v3.name;
    end;
    setmetatable(v3, v0);
    return v3;
end;
v0.get = function(v4, v5) --[[ Line: 51 ]] --[[ Name: get ]]
    return v4.themes[v5];
end;
return v0;