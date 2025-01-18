local v0 = require(script.Parent.cleanLoadStringStack);
return function(v1) --[[ Line: 18 ]] --[[ Name: pruneDeps ]]
    -- upvalues: v0 (copy)
    if v1 == nil then
        return nil;
    else
        local v2 = {};
        for _, v4 in v1:split("\n") do
            if not v4:find("LoadedCode.JestRoblox._Index.") then
                table.insert(v2, (v0(v4)));
            end;
        end;
        return table.concat(v2, "\n");
    end;
end;