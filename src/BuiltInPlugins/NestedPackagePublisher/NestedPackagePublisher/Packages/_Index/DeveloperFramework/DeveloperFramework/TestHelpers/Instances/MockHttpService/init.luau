local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 5 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _index = 0
    }, v0));
end;
v0.GenerateGUID = function(v1) --[[ Line: 11 ]] --[[ Name: GenerateGUID ]]
    v1._index = v1._index + 1;
    return (tostring(v1._index));
end;
return v0;