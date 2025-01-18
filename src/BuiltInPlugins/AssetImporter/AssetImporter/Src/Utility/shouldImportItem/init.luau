return function(v0) --[[ Line: 2 ]]
    return v0 and v0.validSession and v0.enabled and not v0.uploaded and not v0.importDataError;
end;