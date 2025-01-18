return function(v0) --[[ Line: 10 ]] --[[ Name: sanitizeString ]]
    if not v0 then
        return nil;
    else
        return (string.gsub(v0, "[\n\t]", ""));
    end;
end;