local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 9 ]]
    return {
        TableName = v1, 
        SortIndex = v2, 
        SortOrder = v3
    };
end);