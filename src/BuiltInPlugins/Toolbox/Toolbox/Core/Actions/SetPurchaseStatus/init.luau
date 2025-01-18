local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1) --[[ Line: 11 ]]
    assert(v1, "SetPurchaseStatus expects a PurchaseStatus.");
    return {
        status = v1
    };
end);