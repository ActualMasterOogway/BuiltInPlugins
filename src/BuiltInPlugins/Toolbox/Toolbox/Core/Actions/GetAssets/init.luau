local l_Packages_0 = script.Parent.Parent.Parent.Packages;
return require(l_Packages_0.Framework).Util.Action(script.Name, function(v1, v2, v3) --[[ Line: 7 ]]
    return {
        assets = v1, 
        totalResults = v2, 
        cursor = v3
    };
end);