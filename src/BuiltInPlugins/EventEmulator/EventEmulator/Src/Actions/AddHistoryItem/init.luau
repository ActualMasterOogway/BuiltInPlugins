local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 5 ]]
    assert(type(v1) == "string", ("Expected view to be a string, received %s"):format((type(v1))));
    assert(type(v2) == "string", ("Expected name to be a string, received %s"):format((type(v2))));
    return {
        item = {
            Name = v2, 
            View = v1, 
            Data = v3
        }
    };
end);