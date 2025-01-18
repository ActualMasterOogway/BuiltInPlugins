local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.SetPageSaveState);
local v2 = require(l_Parent_0.Src.Util.SaveState);
return function(v3, v4) --[[ Line: 11 ]]
    -- upvalues: v1 (copy), v2 (copy)
    return function(v5, v6) --[[ Line: 12 ]]
        -- upvalues: v4 (copy), v1 (ref), v3 (copy), v2 (ref)
        local v7 = v4(v5, v6);
        v5:dispatch(v1(v3, v2.Saving));
        local v8 = 0;
        local v9 = false;
        for _, v11 in ipairs(v7) do
            coroutine.wrap(function() --[[ Line: 20 ]]
                -- upvalues: v11 (copy), v9 (ref), v5 (copy), v1 (ref), v3 (ref), v2 (ref), v8 (ref), v7 (copy)
                local l_status_0, l_result_0 = pcall(v11);
                if not l_status_0 and not v9 then
                    warn("Failed", l_result_0);
                    v9 = true;
                    v5:dispatch(v1(v3, v2.SaveFailed));
                end;
                v8 = v8 + 1;
                if v8 == #v7 and not v9 then
                    v5:dispatch(v1(v3, v2.Saved));
                end;
            end)();
        end;
    end;
end;