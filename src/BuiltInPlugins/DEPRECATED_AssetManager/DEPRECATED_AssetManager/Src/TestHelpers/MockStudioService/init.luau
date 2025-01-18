local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _localUserId = 0
    }, v0));
end;
v0.GetUserId = function(v1) --[[ Line: 12 ]] --[[ Name: GetUserId ]]
    return v1._localUserId;
end;
return v0;