local function v2(v0, v1) --[[ Line: 3 ]] --[[ Name: defaultSort ]]
    return tostring(v0) < tostring(v1);
end;
return function(v3, v4) --[[ Line: 7 ]] --[[ Name: sort ]]
    -- upvalues: v2 (copy)
    local l_v2_0 = v2;
    if v4 ~= nil then
        if typeof(v4) ~= "function" then
            error("invalid argument to Array.sort: compareFunction must be a function");
        end;
        l_v2_0 = function(v6, v7) --[[ Line: 13 ]]
            -- upvalues: v4 (copy)
            local v8 = v4(v6, v7);
            if typeof(v8) ~= "number" then
                error(("invalid result from compare function, expected number but got %s"):format((typeof(v8))));
            end;
            return v8 < 0;
        end;
    end;
    table.sort(v3, l_v2_0);
    return v3;
end;