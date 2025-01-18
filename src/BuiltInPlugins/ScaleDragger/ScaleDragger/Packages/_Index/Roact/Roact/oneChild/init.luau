return function(v0) --[[ Line: 8 ]] --[[ Name: oneChild ]]
    if not v0 then
        return nil;
    else
        local v1, v2 = next(v0);
        if not v2 then
            return nil;
        else
            if next(v0, v1) then
                error("Expected at most child, had more than one child.", 2);
            end;
            return v2;
        end;
    end;
end;