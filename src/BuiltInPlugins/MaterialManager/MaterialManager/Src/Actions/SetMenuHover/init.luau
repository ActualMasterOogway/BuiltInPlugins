local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 10 ]]
    assert(type(v1) == "boolean", ("Expected menuHover to be a boolean, received %s"):format((type(v1))));
    return {
        MenuHover = v1
    };
end);