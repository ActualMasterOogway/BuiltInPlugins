local _ = function(v0) --[[ Line: 3 ]] --[[ Name: removeAllTags ]]
    for _, v2 in v0:GetTags() do
        v0:RemoveTag(v2);
    end;
end;
return function(v4) --[[ Line: 9 ]] --[[ Name: sanitizeModel ]]
    for _, v6 in v4:GetDescendants() do
        for _, v8 in v6:GetTags() do
            v6:RemoveTag(v8);
        end;
        if v6:IsA("Script") or v6:IsA("LocalScript") or v6:IsA("ModuleScript") then
            v6:Remove();
        end;
    end;
end;