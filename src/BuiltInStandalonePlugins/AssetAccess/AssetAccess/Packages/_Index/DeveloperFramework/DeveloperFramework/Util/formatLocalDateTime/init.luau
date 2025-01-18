return function(v0, v1, v2) --[[ Line: 1 ]] --[[ Name: formatLocalDateTime ]]
    assert(type(v0) == "string", "must pass an isoDateTimeString");
    assert(type(v1) == "string", "must pass a formatString");
    assert(type(v2) == "string", "must pass a localeId");
    local v3 = DateTime.fromIsoDate(v0);
    if v3 == nil then
        return v0;
    else
        return v3:FormatLocalTime(v1, v2);
    end;
end;