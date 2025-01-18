local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Analytics);
local v2 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.RpcTypes);
local v4 = require(l_script_FirstAncestor_0.Components.Contexts.SelectAllContext);
local v5 = require(l_script_FirstAncestor_0.Util.iterateExplorerNodeDescendants);
return function(v6) --[[ Line: 9 ]] --[[ Name: useSelectAll ]]
    -- upvalues: v2 (copy), v1 (copy), v4 (copy), v5 (copy)
    local v7 = v2.useContext(v1.AnalyticsContext);
    local v8 = v2.useContext(v4.Context);
    local v10 = v2.useCallback(function(v9) --[[ Line: 13 ]]
        -- upvalues: v7 (copy)
        v7.logStat({
            eventName = "LuaExplorerSelectAll", 
            backends = {
                "RobloxTelemetryStat"
            }, 
            throttlingPercentage = game:DefineFastInt("LuaExplorerSelectAllThrottlingHundredthsPercent", 10000), 
            description = "Time it takes to collect the IDs to select, and request from the guest. Does NOT count the time it actually takes to perform the selection.", 
            lastUpdated = "2024-12-03"
        }, {}, v9);
    end, {
        v7
    });
    v2.useEffect(function() --[[ Line: 23 ]]
        -- upvalues: v8 (copy), v6 (copy), v10 (copy), v5 (ref)
        return (v8.registerSelectAll(function() --[[ Line: 24 ]]
            -- upvalues: v6 (ref), v10 (ref), v5 (ref)
            local v11 = os.clock();
            if v6.getSearch() ~= "" then
                v6.selectAllSearchedIds();
                v10(os.clock() - v11);
                return;
            else
                local v12 = v6.focusedRootObservable.get();
                if v12.children == nil then
                    return;
                else
                    local v13 = {};
                    for v14 in v5(v12) do
                        table.insert(v13, v14.datum.id);
                    end;
                    v6.selectIds(table.freeze(v13));
                    v10(os.clock() - v11);
                    return;
                end;
            end;
        end));
    end, {
        v8.registerSelectAll, 
        v6, 
        v10
    });
end;