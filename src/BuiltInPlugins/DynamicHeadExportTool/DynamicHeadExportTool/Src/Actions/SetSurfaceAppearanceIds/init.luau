local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
return require(l_script_FirstAncestor_0.Packages.Framework).Util.Action(script.Name, function(v1, v2, v3, v4) --[[ Line: 5 ]]
    return {
        colorMap = v1, 
        metalnessMap = v2, 
        normalMap = v3, 
        roughnessMap = v4
    };
end);