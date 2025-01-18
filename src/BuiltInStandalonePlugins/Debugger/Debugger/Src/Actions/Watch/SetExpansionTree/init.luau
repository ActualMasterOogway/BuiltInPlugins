local l_Parent_0 = script.Parent.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 13 ]]
    return {
        isVariablesTab = v1, 
        expansionMapping = v2
    };
end);