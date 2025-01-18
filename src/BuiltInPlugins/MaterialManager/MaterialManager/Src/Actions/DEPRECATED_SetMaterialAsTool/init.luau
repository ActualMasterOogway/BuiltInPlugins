local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 11 ]]
    assert(type(v1) == "boolean", ("Expected active to be boolean, received %s"):format((type(v1))));
    return {
        DEPRECATED_ActiveAsTool = v1
    };
end);