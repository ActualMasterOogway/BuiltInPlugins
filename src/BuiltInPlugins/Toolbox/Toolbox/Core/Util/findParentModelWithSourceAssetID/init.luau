local function v0(v1) --[[ Line: 1 ]] --[[ Name: findParentModelWithSourceAssetID ]]
    -- upvalues: v0 (copy)
    if not v1 then
        return nil;
    else
        local l_v1_FirstAncestorWhichIsA_0 = v1:FindFirstAncestorWhichIsA("Model");
        if l_v1_FirstAncestorWhichIsA_0 then
            local l_SourceAssetId_0 = l_v1_FirstAncestorWhichIsA_0.SourceAssetId;
            if l_SourceAssetId_0 and l_SourceAssetId_0 ~= -1 then
                return l_v1_FirstAncestorWhichIsA_0;
            else
                return v0(l_v1_FirstAncestorWhichIsA_0);
            end;
        else
            return nil;
        end;
    end;
end;
return v0;