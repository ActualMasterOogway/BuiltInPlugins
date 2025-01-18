local v0 = pcall(debug.loadmodule, Instance.new("ModuleScript"));
return function(v1) --[[ Line: 3 ]]
    -- upvalues: v0 (copy)
    if not v0 then
        local v2, v3, v4, v5 = v1:match("(%s*)%[string \"(.-)\"%]:(%d+)(.*)");
        if v3 then
            local l_v3_0 = v3;
            if v2 then
                l_v3_0 = v2 .. l_v3_0;
            end;
            if v4 then
                l_v3_0 = l_v3_0 .. ":" .. v4;
            end;
            if v5 then
                l_v3_0 = l_v3_0 .. v5;
            end;
            return l_v3_0;
        end;
    end;
    return v1;
end;