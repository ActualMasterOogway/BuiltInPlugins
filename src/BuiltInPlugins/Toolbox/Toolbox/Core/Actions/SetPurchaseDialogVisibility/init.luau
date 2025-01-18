local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1) --[[ Line: 6 ]]
    return {
        isVisible = v1
    };
end);