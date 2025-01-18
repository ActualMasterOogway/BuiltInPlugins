local l_Parent_0 = script.Parent.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 9 ]]
    return {
        tableName = v1, 
        sortIndex = v2, 
        sortOrder = v3
    };
end);