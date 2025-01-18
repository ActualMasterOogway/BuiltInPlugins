local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
return require(l_script_FirstAncestor_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 9 ]]
    return {
        progress = v1
    };
end);