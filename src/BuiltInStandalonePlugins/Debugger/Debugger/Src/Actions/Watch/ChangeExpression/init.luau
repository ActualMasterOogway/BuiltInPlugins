local l_Parent_0 = script.Parent.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 11 ]]
    return {
        oldExpression = v1, 
        newExpression = v2
    };
end);