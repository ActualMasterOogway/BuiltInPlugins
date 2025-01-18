local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 53 ]]
    return {
        allowedAssetTypesForRelease = v1, 
        allowedAssetTypesForUpload = v2, 
        allowedAssetTypesForFree = v3
    };
end);