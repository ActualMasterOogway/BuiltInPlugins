local v0 = utf8.char(8230);
return function(v1, v2, v3, v4) --[[ Line: 17 ]]
    -- upvalues: v0 (copy)
    v4 = v4 or 7;
    if v2 <= 0 then
        return "";
    elseif v3(v1) <= v2 then
        return v1;
    else
        local l_v0_0 = v0;
        if v4 > 0 then
            local v6 = l_v0_0 .. v1:sub(-v4);
            if v3(v6) < v2 then
                l_v0_0 = v6;
            end;
        end;
        local v7 = v2 - v3(l_v0_0);
        if v7 <= 0 then
            return "";
        else
            local v8 = #v1:sub(1, -(utf8.len(l_v0_0) or 0));
            local v9 = "";
            local v10 = 0;
            while true do
                v10 = v10 + 1;
                if v8 < v10 then
                    return v1;
                else
                    local v11 = v1:sub(1, v10);
                    if v7 < v3(v11) then
                        return v9 .. l_v0_0;
                    else
                        v9 = v11;
                    end;
                end;
            end;
        end;
    end;
end;