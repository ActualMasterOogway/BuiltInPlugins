return function(v0, v1) --[[ Line: 2 ]] --[[ Name: getParent ]]
    local v2 = v1 or 0;
    local v3 = string.sub(v0, 1, 1) == "/";
    local v4 = {};
    for v5 in string.gmatch(v0, "[^\\/][^\\/]*") do
        table.insert(v4, v5);
    end;
    if v2 > 0 then
        v4 = {
            table.unpack(v4, 1, #v4 - v2)
        };
    end;
    if v3 then
        return "/" .. table.concat(v4, "/");
    else
        return table.concat(v4, "\\");
    end;
end;