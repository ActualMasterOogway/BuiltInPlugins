local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_HttpService_0 = game:GetService("HttpService");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrAnalytics);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugAmrOutput);
local function v14(v5, v6, v7, v8) --[[ Line: 16 ]] --[[ Name: handleTryGrantPermissions ]]
    -- upvalues: v4 (copy)
    if not v6 then
        if #v7 == 0 then
            warn("Failed to insert assets. The asset owner must grant permissions to the asset(s).");
            for _, v10 in v8 do
                v5[v10] = nil;
            end;
        end;
        local v11 = "";
        for _, v13 in v7 do
            v5[v13.assetId] = nil;
            v11 = v11 .. ("%*%*, "):format(v13.assetId, if v4() then (" - Code: %*"):format(v13.errorCode) else nil);
        end;
        warn((("Failed to insert assets: %*"):format(v11)));
    end;
end;
return function(v15, v16, v17) --[[ Line: 40 ]]
    -- upvalues: v14 (copy), l_HttpService_0 (copy), v3 (copy)
    local v18 = v15:getSelection();
    local v19 = v15:getItems();
    local v20 = table.clone(v18);
    if game.GameId ~= 0 then
        local v21 = {};
        for v22, _ in v18 do
            table.insert(v21, v22);
            if #v21 == 50 then
                local v24, v25 = v16:grantUniverseUseAssetsPermissions(v21);
                v14(v20, v24, v25, v21);
                v21 = {};
            end;
        end;
        if #v21 > 0 then
            local v26, v27 = v16:grantUniverseUseAssetsPermissions(v21);
            v14(v20, v26, v27, v21);
        end;
    end;
    local v28 = {};
    for v29, _ in v20 do
        local v31 = v19[v29];
        if v31 then
            table.insert(v28, v31);
        end;
    end;
    local v32 = l_HttpService_0:JSONEncode(v28);
    v15:getPlugin():Invoke("OnInsertItems", v32, v17);
    if v3() then
        v15:sendInsertToAnalytics();
    end;
end;