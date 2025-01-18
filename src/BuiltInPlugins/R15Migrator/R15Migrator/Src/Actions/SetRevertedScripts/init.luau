local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
return require(l_script_FirstAncestor_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 6 ]]
    return {
        revertedScripts = v1
    };
end);