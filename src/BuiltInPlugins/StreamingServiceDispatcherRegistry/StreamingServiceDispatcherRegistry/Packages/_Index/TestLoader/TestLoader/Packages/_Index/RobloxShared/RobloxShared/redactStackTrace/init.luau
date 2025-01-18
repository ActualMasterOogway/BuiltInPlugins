local v0 = ("\nRedacted.Stack.Trace:1337 function epicDuck"):rep(4):sub(2);
return function(v1) --[[ Line: 21 ]] --[[ Name: redactStackTrace ]]
    -- upvalues: v0 (copy)
    if v1 == nil then
        return nil;
    else
        local v2 = {};
        local v3 = false;
        for _, v5 in v1:split("\n") do
            local v6 = v5:gsub("[%w_%-]+%.[%w_%-%.]+%:%d+[%w \t_]*", v3 and "" or v0):gsub("[%w_%-]+%.[%w_%-%.]+%:%d+%:[%w \t_]*", v3 and "" or "Redacted.Stack.Trace:1337: The epic duck is coming!");
            v3 = v5 ~= v6;
            if not v3 or v6:match("%S") then
                table.insert(v2, v6);
            end;
        end;
        return table.concat(v2, "\n");
    end;
end;