local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 7 ]]
    return {
        assetIds = v1, 
        positionOverride = v2, 
        scriptWarningOverride = v3
    };
end);