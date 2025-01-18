return function(v0) --[[ Line: 3 ]]
    local v1 = tonumber(v0);
    if v1 then
        v1 = math.clamp(v1, 0, 255);
        return Color3.fromRGB(v1, v1, v1);
    else
        local v2 = v0:gsub("%s+", ""):split(",");
        if #v2 == 3 then
            local v3 = tonumber(v2[1]);
            local v4 = tonumber(v2[2]);
            local v5 = tonumber(v2[3]);
            return Color3.fromRGB(v3, v4, v5);
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 22 ]]
                -- upvalues: v0 (copy)
                return Color3.fromHex(v0);
            end);
            if l_status_0 and l_result_0 then
                return l_result_0;
            else
                return nil;
            end;
        end;
    end;
end;