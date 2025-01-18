local v0 = require(script.Parent.findOr);
local v1 = require(script.Parent.slice);
return function(v2, v3) --[[ Line: 8 ]] --[[ Name: split ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v3 == nil then
        return {
            v2
        };
    else
        local v4 = nil;
        if typeof(v3) == "string" then
            if v3 == "" then
                return {
                    v2
                };
            else
                v4 = {
                    v3
                };
            end;
        else
            v4 = v3;
        end;
        local v5 = 1;
        local v6 = {};
        local v7 = nil;
        repeat
            local v8 = v0(v2, v4, v5);
            if v8 ~= nil then
                table.insert(v6, v1(v2, v5, v8.index));
                v5 = v8.index + utf8.len(v8.match);
            else
                table.insert(v6, v1(v2, v5, nil));
            end;
            if v8 ~= nil then
                v7 = v8;
            end;
        until v8 == nil or utf8.len(v2) < v5;
        local v9 = utf8.len(v2);
        if v7 ~= nil and v7.index + utf8.len(v7.match) == v9 + 1 then
            table.insert(v6, "");
        end;
        return v6;
    end;
end;