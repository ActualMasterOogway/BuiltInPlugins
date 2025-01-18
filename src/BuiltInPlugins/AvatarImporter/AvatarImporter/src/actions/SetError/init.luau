local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.src.actions.Action)(script.Name, function(v1, v2) --[[ Line: 5 ]]
    return {
        name = v1, 
        message = v2
    };
end);