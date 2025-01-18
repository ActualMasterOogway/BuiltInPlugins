local v0 = {};
v0.__index = v0;
v0.new = function() --[[ Line: 5 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.Destroy = function(_) --[[ Line: 9 ]] --[[ Name: Destroy ]]

end;
v0.LoadLocalAsset = function(_, _) --[[ Line: 11 ]] --[[ Name: LoadLocalAsset ]]
    return Instance.new("Model");
end;
return v0;