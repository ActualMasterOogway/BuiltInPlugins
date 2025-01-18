return function(v0) --[[ Line: 1 ]] --[[ Name: formatFeedbackTable ]]
    local v1 = {};
    for v2, v3 in pairs(v0) do
        table.insert(v1, (("\"%*\": \"%*\""):format(v2, (tostring(v3)))));
    end;
    return "{" .. table.concat(v1, ",") .. "}";
end;