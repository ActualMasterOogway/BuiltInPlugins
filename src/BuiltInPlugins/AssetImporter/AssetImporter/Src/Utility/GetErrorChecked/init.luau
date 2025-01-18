local _ = function(v0) --[[ Line: 5 ]] --[[ Name: nodeToImportHasError ]]
    for _, v2 in (v0:GetStatuses()) do
        if v2.Level == "Error" and v0.ShouldImport then
            return true;
        end;
    end;
    return false;
end;
return function(v4) --[[ Line: 15 ]]
    local v5 = false;
    local v6 = false;
    local v7;
    for _, v9 in (v4:GetStatuses()) do
        if v9.Level == "Error" and v4.ShouldImport then
            v7 = true;
            v5 = true;
        end;
        if v5 then
            break;
        end;
    end;
    if not v5 then
        v7 = false;
    end;
    v5 = false;
    if v7 then
        return true;
    else
        for _, v11 in pairs(v4:GetDescendants()) do
            local v12;
            for _, v14 in (v11:GetStatuses()) do
                if v14.Level == "Error" and v11.ShouldImport then
                    v12 = true;
                    v6 = true;
                end;
                if v6 then
                    break;
                end;
            end;
            if not v6 then
                v12 = false;
            end;
            v6 = false;
            if v12 then
                return true;
            end;
        end;
        return false;
    end;
end;