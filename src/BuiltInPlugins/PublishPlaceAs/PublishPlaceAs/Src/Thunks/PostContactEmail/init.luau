return function(v0, v1, v2) --[[ Line: 1 ]]
    local v3 = -1;
    v0.APIS.StudioModeration.contacts(v2, v1):makeRequest():andThen(function(v4) --[[ Line: 6 ]]
        -- upvalues: v3 (ref)
        v3 = v4.responseCode;
    end, function(v5) --[[ Line: 8 ]]
        -- upvalues: v3 (ref)
        v3 = v5.responseCode;
    end):await();
    return v3;
end;