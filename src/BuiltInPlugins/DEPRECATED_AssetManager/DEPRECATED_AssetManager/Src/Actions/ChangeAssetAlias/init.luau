local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 5 ]]
    assert(type(v1) == "string", string.format("ChangeAssetAlias assetId requires a string, not %s", (type(v1))));
    assert(type(v2) == "string", string.format("ChangeAssetAlias newAlias requires a string, not %s", (type(v2))));
    return {
        assetId = v1, 
        newAlias = v2
    };
end);