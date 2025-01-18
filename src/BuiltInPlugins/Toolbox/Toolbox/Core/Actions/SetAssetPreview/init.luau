local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 7 ]]
    return {
        isPreviewing = v1, 
        previewAssetId = v2, 
        previewSwimlaneName = v3
    };
end);