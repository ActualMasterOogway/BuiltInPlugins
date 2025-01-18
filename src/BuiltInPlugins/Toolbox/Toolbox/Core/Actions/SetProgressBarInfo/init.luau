local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 7 ]]
    return {
        progressPercentage = v1, 
        progressTitle = v2, 
        progressText = v3
    };
end);