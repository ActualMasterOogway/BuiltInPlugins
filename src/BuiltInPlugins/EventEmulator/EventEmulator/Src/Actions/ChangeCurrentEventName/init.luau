local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "string", ("Expected item to be a string, received %s"):format((type(v1))));
    return {
        name = v1
    };
end);