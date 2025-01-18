local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 11 ]]
    assert(type(v1) == "boolean", "SetCanManageAsset expects a boolean.");
    assert(type(v2) == "number", "SetCanManageAsset expects an asset id.");
    return {
        canManage = v1, 
        assetId = v2
    };
end);