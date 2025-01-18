return function(v0) --[[ Line: 15 ]] --[[ Name: pruneDeps ]]
    if v0 == nil then
        return nil;
    else
        local v1 = {};
        for _, v3 in v0:split("\n") do
            if not v3:find("LoadedCode.JestRoblox._Index.") then
                table.insert(v1, v3);
            end;
        end;
        return table.concat(v1, "\n");
    end;
end;