local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 11 ]]
    return {
        codeSummary = v2, 
        assetId = v1
    };
end);