local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 4 ]]
    local v2 = false;
    if typeof(v1) == "EnumItem" then
        v2 = v1.EnumType == Enum.CreatorType;
    end;
    assert(v2, script.Name .. " requires creatorType to be an Enum.CreatorType, not " .. typeof(v1));
    return {
        creatorType = v1
    };
end);