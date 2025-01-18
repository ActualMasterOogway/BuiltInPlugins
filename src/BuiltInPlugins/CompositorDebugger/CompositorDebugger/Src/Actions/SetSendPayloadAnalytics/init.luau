local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
return require(l_script_FirstAncestor_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 18 ]]
    return {
        enable = v1
    };
end);