local v0 = {};
v0.__index = v0;
v0.new = function(_, _) --[[ Line: 12 ]] --[[ Name: new ]]
    -- upvalues: v0 (copy)
    return (setmetatable({}, v0));
end;
v0.isEmpty = function(_) --[[ Line: 25 ]] --[[ Name: isEmpty ]]
    return true;
end;
v0.getBoundingBox = function(_) --[[ Line: 41 ]] --[[ Name: getBoundingBox ]]
    return CFrame.new(), Vector3.new(), (Vector3.new());
end;
v0.doesContainItem = function(_, _) --[[ Line: 52 ]] --[[ Name: doesContainItem ]]
    return false;
end;
v0.isDynamic = function(_) --[[ Line: 66 ]] --[[ Name: isDynamic ]]
    return false;
end;
v0.getMyFancyCustomObjects = function(_) --[[ Line: 76 ]] --[[ Name: getMyFancyCustomObjects ]]
    return {};
end;
return v0;