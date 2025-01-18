local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 7 ]]
    return {
        creatingUniverseName = v1, 
        creatingUniverseRootPlaceId = v2
    };
end);