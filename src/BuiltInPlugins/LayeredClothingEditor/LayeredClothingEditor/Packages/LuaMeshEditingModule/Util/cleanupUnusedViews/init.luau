return function(v0, v1) --[[ Line: 1 ]]
    for _, v3 in ipairs(v1) do
        local l_MeshName_0 = v3.MeshName;
        local l_Index_0 = v3.Index;
        v0[l_MeshName_0][l_Index_0]:cleanup();
        v0[l_MeshName_0][l_Index_0] = nil;
    end;
end;