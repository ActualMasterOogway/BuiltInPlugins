local l_Framework_0 = script.Parent.Parent.Parent.Packages.Framework;
return require(l_Framework_0).Util.Action(script.Name, function(v1) --[[ Line: 6 ]]
    assert(typeof(v1) == "Instance");
    return {
        targetObject = v1
    };
end);