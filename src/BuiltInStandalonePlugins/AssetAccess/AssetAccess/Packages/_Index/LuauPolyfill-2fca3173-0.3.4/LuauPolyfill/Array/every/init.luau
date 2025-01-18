return function(v0, v1, v2) --[[ Line: 9 ]]
    if typeof(v0) ~= "table" then
        error(string.format("Array.every called on %s", (typeof(v0))));
    end;
    if typeof(v1) ~= "function" then
        error("callback is not a function");
    end;
    local v3 = #v0;
    local v4 = 1;
    while true do
        if v4 <= v3 then
            local v5 = v0[v4];
            local _ = nil;
            if v5 ~= nil and not if v2 ~= nil then v1(v2, v5, v4, v0) else v1(v5, v4, v0) then
                return false;
            else
                v4 = v4 + 1;
            end;
        else
            return true;
        end;
    end;
end;