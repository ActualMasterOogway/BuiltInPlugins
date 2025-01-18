local v0 = require(script.Parent.findSourceAssetsFromDescendant);
return function(v1) --[[ Line: 14 ]] --[[ Name: getSourceAssetsFromDescendants ]]
    -- upvalues: v0 (copy)
    local v2 = {};
    for _, v4 in v1 do
        if v4.SourceAssetId > 0 then
            table.insert(v2, v4);
        end;
        for _, v6 in v0(v4) do
            if not table.find(v2, v6) then
                table.insert(v2, v6);
            end;
        end;
    end;
    return v2;
end;