local v0 = {};
v0.__index = v0;
v0.new = function(v1, v2) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({
        _region = v2[1], 
        _draggerContext = v1
    }, v0));
end;
v0.isEmpty = function(_) --[[ Line: 19 ]] --[[ Name: isEmpty ]]
    return false;
end;
v0.getBoundingBox = function(v4) --[[ Line: 23 ]] --[[ Name: getBoundingBox ]]
    if v4._draggerContext:shouldUseLocalSpace() then
        return v4._region.Region.transform, Vector3.new(), v4._region.Region.size;
    else
        return v4._region.Region.transform, Vector3.new(), v4._region.Region.size;
    end;
end;
v0.doesContainItem = function(_, _) --[[ Line: 31 ]] --[[ Name: doesContainItem ]]
    return true;
end;
v0.isDynamic = function(_) --[[ Line: 35 ]] --[[ Name: isDynamic ]]
    return false;
end;
return v0;