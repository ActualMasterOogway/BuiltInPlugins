local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1, v2) --[[ Line: 5 ]]
    assert(type(v1) == "number", string.format("SetRootTreeViewInstance requires assetId to be a number, not %s", (type(v1))));
    assert(typeof(v2) == "Instance", string.format("SetRootTreeViewInstance requires rootTreeViewInstance a String, not %s", (type(v2))));
    return {
        assetId = v1, 
        rootTreeViewInstance = v2
    };
end);