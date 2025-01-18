local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1) --[[ Line: 7 ]]
    assert(type(v1) == "number", "Expected elapsedTime to be a number");
    return {
        elapsedTime = v1
    };
end);