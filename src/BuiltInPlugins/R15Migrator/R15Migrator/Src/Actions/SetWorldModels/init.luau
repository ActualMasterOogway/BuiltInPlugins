local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
return require(l_script_FirstAncestor_0.Packages.Framework).Util.Action(script.Name, function(v1, v2, v3, v4, v5) --[[ Line: 6 ]]
    return {
        newWorldModelEntries = {
            [v1] = {
                previewModel = v2, 
                convertedModel = v3, 
                resetPreviewModel = v4, 
                resetConvertedModel = v5
            }
        }
    };
end);