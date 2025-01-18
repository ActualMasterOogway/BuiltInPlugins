local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 5 ]]
    assert(type(v1) == "number", string.format("SetAssetFavorited requires assetId to be a number, not %s", (type(v1))));
    assert(type(v2) == "boolean", string.format("SetAssetFavorited requires isAssetFavorited to be a boolean, not %s", (type(v2))));
    return {
        assetId = v1, 
        isAssetFavorited = v2
    };
end);