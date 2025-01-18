sanitizeIconSearchInput = function(v0) --[[ Line: 5 ]] --[[ Name: sanitizeIconSearchInput ]]
    v0 = string.gsub(v0, "\226\128\147", "-");
    v0 = string.gsub(v0, "\226\128\148", "-");
    v0 = string.gsub(v0, "\226\128\144", "-");
    v0 = string.gsub(v0, "\226\128\145", "-");
    v0 = string.gsub(v0, "\226\136\146", "-");
    v0 = string.gsub(v0, "%-", "%%-");
    return (string.lower(v0));
end;
return sanitizeIconSearchInput;