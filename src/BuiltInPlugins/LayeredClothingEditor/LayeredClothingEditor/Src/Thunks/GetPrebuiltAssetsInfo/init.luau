local _ = game:GetService("AssetService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Cryo);
local l_isProductionEnvironment_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.isProductionEnvironment;
local v4 = require(l_Parent_0.Src.Actions.SetPrebuiltAssetsInfo);
local _ = function(v5) --[[ Line: 17 ]] --[[ Name: convertArrayToIdIndexedTable ]]
    local v6 = {};
    for _, v8 in pairs(v5) do
        v6[v8.id] = v8;
    end;
    return v6;
end;
local function v15(v10, v11) --[[ Line: 25 ]] --[[ Name: getBundleInfo ]]
    local v12 = {};
    for _, v14 in ipairs(v11) do
        v12[v14] = v10:GetBundleDetailsAsync(v14);
    end;
    return v12;
end;
return function(v16, v17, v18, v19) --[[ Line: 33 ]]
    -- upvalues: l_isProductionEnvironment_0 (copy), v15 (copy), v2 (copy), v4 (copy)
    return function(v20) --[[ Line: 34 ]]
        -- upvalues: l_isProductionEnvironment_0 (ref), v15 (ref), v17 (copy), v19 (copy), v2 (ref), v4 (ref), v16 (copy), v18 (copy)
        if not l_isProductionEnvironment_0() then
            return;
        else
            local function v27(v21) --[[ Line: 39 ]]
                -- upvalues: v15 (ref), v17 (ref), v19 (ref), v2 (ref), v20 (copy), v4 (ref)
                local l_data_0 = v21.responseBody.data;
                local v23 = {};
                for _, v25 in pairs(l_data_0) do
                    v23[v25.id] = v25;
                end;
                local l_v23_0 = v23;
                l_data_0 = v15(v17, v19);
                v23 = v2.Dictionary.join(l_v23_0, l_data_0);
                v20:dispatch(v4(v23));
            end;
            v16.api.Develop.V1.Assets.assets(v18):makeRequest():andThen(v27, function(v28) --[[ Line: 47 ]]
                local v29 = v28 and v28.responseBody and v28.responseBody.errors;
                if not v29 then
                    warn("Could not fetch information for assets");
                    return;
                else
                    for _, v31 in ipairs(v29) do
                        warn("Could not fetch information for assets: " .. tostring(v31.message));
                    end;
                    return;
                end;
            end);
            return;
        end;
    end;
end;