local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
return require(l_script_FirstAncestor_0.Packages.Framework).Util.Action(script.Name, function(v1) --[[ Line: 16 ]]
    return {
        selectedLayer = v1
    };
end);