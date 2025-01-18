local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 4 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    assert(#v2 == 1, "Expected selection to have length 1.");
    return (setmetatable({
        _transform = v2[1], 
        _draggerContext = v1
    }, v0));
end;
v0.isEmpty = function(_) --[[ Line: 12 ]] --[[ Name: isEmpty ]]
    return false;
end;
v0.getBoundingBox = function(v4) --[[ Line: 16 ]] --[[ Name: getBoundingBox ]]
    if v4._draggerContext:shouldUseLocalSpace() then
        return v4:getLocalBoundingBox();
    else
        return CFrame.new(v4._transform.Transform.Position), Vector3.new(), (Vector3.new());
    end;
end;
v0.getLocalBoundingBox = function(v5) --[[ Line: 24 ]] --[[ Name: getLocalBoundingBox ]]
    return v5._transform.Transform, Vector3.new(), (Vector3.new());
end;
v0.doesContainItem = function(_, _) --[[ Line: 28 ]] --[[ Name: doesContainItem ]]
    return true;
end;
v0.isDynamic = function(_) --[[ Line: 32 ]] --[[ Name: isDynamic ]]
    return false;
end;
return v0;