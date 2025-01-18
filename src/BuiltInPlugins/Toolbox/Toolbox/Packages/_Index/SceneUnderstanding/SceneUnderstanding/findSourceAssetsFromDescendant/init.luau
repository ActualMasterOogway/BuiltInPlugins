return function(v0) --[[ Line: 1 ]] --[[ Name: findSourceAssetsFromDescendant ]]
    local v1 = {};
    local l_Parent_0 = v0.Parent;
    while l_Parent_0 do
        if l_Parent_0.SourceAssetId > 0 then
            table.insert(v1, l_Parent_0);
        end;
        l_Parent_0 = l_Parent_0.Parent;
    end;
    return v1;
end;