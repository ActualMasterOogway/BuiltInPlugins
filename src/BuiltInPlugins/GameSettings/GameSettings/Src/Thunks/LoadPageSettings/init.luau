local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Actions.AppendSettings);
local v2 = require(l_Parent_0.Src.Actions.SetPageLoadState);
local v3 = require(l_Parent_0.Src.Util.Analytics);
local v4 = require(l_Parent_0.Src.Util.LoadState);
return function(v5, v6) --[[ Line: 13 ]]
    -- upvalues: v2 (copy), v4 (copy), v3 (copy), v1 (copy)
    return function(v7, v8) --[[ Line: 14 ]]
        -- upvalues: v6 (copy), v2 (ref), v5 (copy), v4 (ref), v3 (ref), v1 (ref)
        local v9 = v6(v7, v8);
        v7:dispatch(v2(v5, v4.Loading));
        v3.onPageLoadAttempt(v5);
        local v10 = tick();
        local v11 = 0;
        local v12 = false;
        local v13 = {};
        for _, v15 in ipairs(v9) do
            coroutine.wrap(function() --[[ Line: 25 ]]
                -- upvalues: v15 (copy), v13 (copy), v12 (ref), v7 (copy), v2 (ref), v5 (ref), v4 (ref), v11 (ref), v9 (copy), v1 (ref), v3 (ref), v10 (copy)
                local l_status_0, l_result_0 = pcall(v15, v13);
                if not l_status_0 and not v12 then
                    warn("Failed", l_result_0);
                    v12 = true;
                    v7:dispatch(v2(v5, v4.LoadFailed));
                end;
                v11 = v11 + 1;
                if v11 == #v9 then
                    if not v12 then
                        v7:dispatch(v1(v13));
                        v7:dispatch(v2(v5, v4.Loaded));
                        v3.onPageLoadSuccess(v5, tick() - v10);
                        return;
                    else
                        v3.onPageLoadError(v5, tick() - v10);
                    end;
                end;
            end)();
        end;
    end;
end;