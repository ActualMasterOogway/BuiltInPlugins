local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.Destroy = function(_) --[[ Line: 9 ]] --[[ Name: Destroy ]]

end;
v0.GetMaxNumTouches = function(_) --[[ Line: 11 ]] --[[ Name: GetMaxNumTouches ]]
    return 1;
end;
return v0;