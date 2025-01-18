local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Parent_0.Core.Actions.SetPackagePermission);
local v4 = require(l_Parent_0.Core.Actions.NetworkError);
local v5 = require(l_Parent_0.Core.Components.AssetConfiguration.Permissions.PermissionsConstants);
local v6 = require(l_Parent_0.Core.Util.Permissions.KeyConverter);
local v7 = require(l_Parent_0.Core.Util.Analytics.Analytics);
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local function _(v9, v10) --[[ Line: 80 ]] --[[ Name: isHigherPermission ]]
    -- upvalues: v5 (copy)
    if v9 == nil then
        return v10;
    else
        local v11 = {
            [v5.OwnKey] = 4, 
            [v5.EditKey] = 3, 
            [v5.UseViewKey] = 2, 
            [v5.NoAccessKey] = 1
        };
        if v11[v10] > v11[v9] then
            return v10;
        else
            return v9;
        end;
    end;
end;
local function v21(v13) --[[ Line: 98 ]] --[[ Name: deserializeResults ]]
    -- upvalues: v6 (copy), v5 (copy), v2 (copy)
    local v14 = {};
    for _, v16 in ipairs(v13) do
        local v17 = v6.resolveActionPermission(v16.action, v16.status, v16.assetId);
        if v17 ~= v5.NoneKey then
            local v18 = v14[v16.assetId];
            local v19;
            if v18 == nil then
                v19 = v17;
            else
                local v20 = {
                    [v5.OwnKey] = 4, 
                    [v5.EditKey] = 3, 
                    [v5.UseViewKey] = 2, 
                    [v5.NoAccessKey] = 1
                };
                v19 = if v20[v17] > v20[v18] then v17 else v18;
            end;
            v14 = v2.Dictionary.join(v14, {
                [v16.assetId] = v19
            });
        end;
    end;
    return v14;
end;
return function(v22, v23) --[[ Line: 117 ]]
    -- upvalues: v5 (copy), v3 (copy), v7 (copy), v2 (copy), v4 (copy), l_Promise_0 (copy), v21 (copy)
    return function(v24) --[[ Line: 118 ]]
        -- upvalues: v23 (copy), v5 (ref), v3 (ref), v22 (copy), v7 (ref), v2 (ref), v4 (ref), l_Promise_0 (ref), v21 (ref)
        local v25 = {};
        for _, v27 in pairs(v23) do
            v25[v27] = v5.NoAccessKey;
        end;
        v24:dispatch(v3(v25));
        local v28 = {
            "Edit", 
            "Use", 
            "GrantAssetPermissions"
        };
        local v29 = {};
        local v30 = {};
        local l_game_FastInt_0 = game:GetFastInt("MaxPackageAssetIdsPerPermissionRequest");
        for v32 = 1, #v23, l_game_FastInt_0 do
            local v33 = {
                table.unpack(v23, v32, v32 + (l_game_FastInt_0 - 1))
            };
            table.insert(v30, v22:postAssetCheckPermissions(v28, v33):andThen(function(v34) --[[ Line: 136 ]]
                -- upvalues: v7 (ref), v29 (ref), v2 (ref)
                v7.sendResultToKibana(v34);
                v29 = v2.List.join(v29, v34.responseBody.results);
            end, function(v35) --[[ Line: 139 ]]
                -- upvalues: v7 (ref), v24 (copy), v4 (ref)
                v7.sendResultToKibana(v35);
                v24:dispatch(v4(v35));
            end));
        end;
        l_Promise_0.all(v30):andThen(function() --[[ Line: 146 ]]
            -- upvalues: v29 (ref), v21 (ref), v24 (copy), v3 (ref)
            if #v29 ~= 0 then
                local v36 = v21(v29);
                v24:dispatch(v3(v36));
            end;
        end);
    end;
end;