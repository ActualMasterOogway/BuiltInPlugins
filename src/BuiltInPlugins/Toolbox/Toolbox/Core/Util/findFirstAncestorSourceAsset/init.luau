return function(v0) --[[ Line: 1 ]] --[[ Name: findFirstAncestorSourceAsset ]]
    local l_Parent_0 = v0.Parent;
    while true do
        if l_Parent_0 then
            if l_Parent_0.SourceAssetId > 0 then
                return l_Parent_0;
            else
                l_Parent_0 = l_Parent_0.Parent;
            end;
        else
            return nil;
        end;
    end;
end;