local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 10 ]]
    local v2 = true;
    if type(v1) ~= "string" then
        v2 = v1 == nil;
    end;
    assert(v2, "Bad generationErrorType");
    return {
        initialImageId = v1
    };
end);