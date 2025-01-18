local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 18 ]]
    assert(typeof(v1) == "string", ("Expected something to be a string, received %s"):format((type(v1))));
    return {
        something = v1
    };
end);