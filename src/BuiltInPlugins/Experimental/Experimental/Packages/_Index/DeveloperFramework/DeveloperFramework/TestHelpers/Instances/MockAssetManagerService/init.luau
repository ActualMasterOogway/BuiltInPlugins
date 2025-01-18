local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 5 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.Destroy = function(_) --[[ Line: 9 ]] --[[ Name: Destroy ]]

end;
v0.CreateAlias = function(_, _, _, _) --[[ Line: 11 ]] --[[ Name: CreateAlias ]]

end;
return v0;