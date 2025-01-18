local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
return require(l_script_FirstAncestor_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 11 ]]
    assert(typeof(v1) == "table", "checked should be a table");
    return {
        checked = v1
    };
end);