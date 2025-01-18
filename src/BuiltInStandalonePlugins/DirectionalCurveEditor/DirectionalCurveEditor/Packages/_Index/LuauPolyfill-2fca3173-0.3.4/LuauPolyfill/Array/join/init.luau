local v0 = require(script.Parent.map);
return function(v1, v2) --[[ Line: 5 ]] --[[ Name: join ]]
    -- upvalues: v0 (copy)
    if #v1 == 0 then
        return "";
    else
        local v4 = v0(v1, function(v3) --[[ Line: 10 ]]
            return (tostring(v3));
        end);
        return table.concat(v4, v2 or ",");
    end;
end;