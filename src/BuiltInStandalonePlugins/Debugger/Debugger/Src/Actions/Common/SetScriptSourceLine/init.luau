local l_Parent_0 = script.Parent.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 12 ]]
    return {
        scriptRefGuid = v1, 
        lineNumber = v2, 
        source = v3
    };
end);