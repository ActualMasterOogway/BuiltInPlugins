return function() --[[ Line: 5 ]] --[[ Name: createNextNonce ]]
    local v0 = 1;
    return function() --[[ Line: 8 ]]
        -- upvalues: v0 (ref)
        local l_v0_0 = v0;
        v0 = v0 + 1;
        local v2 = "";
        while l_v0_0 > 0 do
            v2 = v2 .. string.char(33 + l_v0_0 % 93);
            l_v0_0 = math.floor(l_v0_0 / 93);
        end;
        return v2;
    end;
end;