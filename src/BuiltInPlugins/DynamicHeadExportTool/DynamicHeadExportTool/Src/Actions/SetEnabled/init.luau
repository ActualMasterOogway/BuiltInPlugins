local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
return require(l_script_FirstAncestor_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 5 ]]
    return {
        enabled = v1
    };
end);