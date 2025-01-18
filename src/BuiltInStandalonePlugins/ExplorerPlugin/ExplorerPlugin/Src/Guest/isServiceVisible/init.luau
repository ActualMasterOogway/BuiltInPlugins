local l_ExplorerServiceVisibilityService_0 = game:GetService("ExplorerServiceVisibilityService");
return function(v1) --[[ Line: 4 ]] --[[ Name: isServiceVisible ]]
    -- upvalues: l_ExplorerServiceVisibilityService_0 (copy)
    return l_ExplorerServiceVisibilityService_0:GetServiceVisibility(v1);
end;