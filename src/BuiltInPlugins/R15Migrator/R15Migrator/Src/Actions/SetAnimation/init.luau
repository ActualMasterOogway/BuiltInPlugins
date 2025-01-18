local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
return require(l_script_FirstAncestor_0.Packages.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 6 ]]
    return {
        id = v1, 
        animation = v2
    };
end);