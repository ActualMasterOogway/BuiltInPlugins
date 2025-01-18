local l_Parent_0 = script.Parent.Parent.Parent;
return require(l_Parent_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 5 ]]
    assert(type(v1) == "table", string.format("SetAssetPreviewData requires a table, not %s", (type(v1))));
    return {
        assetPreviewData = v1
    };
end);