local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "table", ("Expected parameters to be a table, received %s"):format((type(v1))));
    return {
        parameters = v1
    };
end);