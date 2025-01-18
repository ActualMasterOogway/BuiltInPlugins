local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Flags.getFFlagDebugExplorerProfiling);
return function(v2, v3) --[[ Line: 7 ]] --[[ Name: profile ]]
    -- upvalues: v1 (copy)
    if not v1() then
        return v2;
    else
        v3 = v3 or debug.info(v2, "n");
        local v4 = false;
        if v3 ~= nil then
            v4 = v3 ~= "";
        end;
        assert(v4, "No label specified, and no name could be derived");
        return function(...) --[[ Line: 16 ]]
            -- upvalues: v3 (ref), v2 (copy)
            debug.profilebegin(v3);
            local v5 = table.pack(v2(...));
            debug.profileend();
            return table.unpack(v5);
        end;
    end;
end;