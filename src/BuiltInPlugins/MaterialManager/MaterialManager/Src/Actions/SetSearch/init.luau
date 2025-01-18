local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 10 ]]
    assert(type(v1) == "string", ("Expected search to be a string, received %s"):format((type(v1))));
    return {
        Search = v1
    };
end);