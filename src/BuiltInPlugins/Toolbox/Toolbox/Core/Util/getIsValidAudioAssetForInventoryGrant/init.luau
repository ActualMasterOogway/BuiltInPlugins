local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local l_Promise_0 = require(l_Packages_0.Framework).Util.Promise;
local v3 = require(l_script_FirstAncestor_0.Core.Util.FiatUtil);
local v4 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local _ = game:GetEngineFeature("ToolboxSampleProductMUS418");
return function(v6, v7) --[[ Line: 16 ]] --[[ Name: getIsValidAudioAssetForInventoryGrant ]]
    -- upvalues: l_Promise_0 (copy), v4 (copy), v3 (copy)
    return l_Promise_0.new(function(v8) --[[ Line: 17 ]]
        -- upvalues: v6 (copy), v7 (copy), v4 (ref), v3 (ref)
        if v6:getIsAssetOpenForUse(v7):catch(function(v9) --[[ Line: 21 ]]
            -- upvalues: v4 (ref), v7 (ref), v8 (copy)
            if v4.shouldDebugUrls() then
                warn((("networkInterface:getIsAssetOpenForUse failed to fetch permissions of asset %*. %*"):format(v7, v9 or "")));
            end;
            v8(false);
        end):await() then
            v8(false);
            return;
        else
            local l_responseBody_0 = v6:getFiatProduct(v7, Enum.AssetType.Audio):catch(function(v10) --[[ Line: 40 ]]
                -- upvalues: v4 (ref), v7 (ref), v8 (copy)
                if v4.shouldDebugUrls() then
                    warn((("networkInterface:getFiatProduct failed to fetch details of asset %*. %*"):format(v7, v10 or "")));
                end;
                v8(false);
            end):await().responseBody;
            if not l_responseBody_0 then
                v8(false);
                return;
            else
                local v12 = v3.isFree(l_responseBody_0.purchasePrice);
                local l_purchasable_0 = l_responseBody_0.purchasable;
                if not v12 or not l_purchasable_0 then
                    v8(false);
                    return;
                elseif v6:getIsOwnedByUser(v7, Enum.AvatarItemType.Asset):catch(function(v14) --[[ Line: 67 ]]
                    -- upvalues: v4 (ref), v7 (ref), v8 (copy)
                    if v4.shouldDebugUrls() then
                        warn((("networkInterface:getIsOwnedByUser failed to check ownership of asset %*. %*"):format(v7, v14 or "")));
                    end;
                    v8(false);
                end):await().responseBody then
                    v8(false);
                    return;
                else
                    v8(true);
                    return;
                end;
            end;
        end;
    end);
end;