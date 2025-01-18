local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Promise);
local v2 = require(l_Parent_0.Src.Actions.SetLoadedPluginData);
local function v3(v4, v5, v6) --[[ Line: 8 ]] --[[ Name: FetchMarketplaceAssetInfo ]]
    -- upvalues: v1 (copy), v2 (copy), v3 (copy)
    return function(v7) --[[ Line: 9 ]]
        -- upvalues: v6 (ref), v5 (copy), v1 (ref), v4 (copy), v2 (ref), v3 (ref)
        if not v6 then
            v6 = 1;
        else
            v6 = v6 + 1;
            if v6 > 4 then
                return;
            end;
        end;
        local v8 = 0;
        local v9 = 0;
        local v10 = {};
        local v11 = {};
        local v12 = {};
        for v13, v14 in pairs(v5) do
            table.insert(v12, (v1.new(function(v15, v16) --[[ Line: 28 ]]
                -- upvalues: v4 (ref), v14 (copy)
                spawn(function() --[[ Line: 29 ]]
                    -- upvalues: v4 (ref), v14 (ref), v15 (copy), v16 (copy)
                    local l_status_0, l_result_0 = pcall(v4.GetProductInfo, v4, v14.assetId);
                    if l_status_0 then
                        v15(l_result_0);
                        return;
                    else
                        v16();
                        return;
                    end;
                end);
            end):andThen(function(v19) --[[ Line: 40 ]]
                -- upvalues: v14 (copy), v10 (copy), v13 (copy), v8 (ref)
                if v19 then
                    v14.creator = v19.Creator;
                end;
                v10[v13] = v14;
                v8 = v8 + 1;
            end, function() --[[ Line: 46 ]]
                -- upvalues: v11 (copy), v13 (copy), v14 (copy), v9 (ref)
                v11[v13] = v14;
                v9 = v9 + 1;
            end)));
        end;
        v1.all(v12):await();
        if v8 > 0 then
            v7:dispatch(v2(v10));
        end;
        if v9 > 0 then
            spawn(function() --[[ Line: 61 ]]
                -- upvalues: v6 (ref), v7 (copy), v3 (ref), v4 (ref), v11 (copy)
                local v20 = (v6 - 1) * 8;
                wait(v20);
                v7:dispatch(v3(v4, v11, v6));
            end);
        end;
    end;
end;
return v3;