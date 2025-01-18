local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 7 ]]
    return {
        assetId = v1, 
        assetMediaIds = v2
    };
end);