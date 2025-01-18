local l_Parent_0 = script.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.MarkTryInStudioDone);
local v3 = require(l_Parent_0.Core.Util.Analytics.Analytics);
return function(v4, v5, _, v7, v8) --[[ Line: 8 ]]
    -- upvalues: v3 (copy), v2 (copy)
    return function(v9) --[[ Line: 9 ]]
        -- upvalues: v3 (ref), v4 (copy), v7 (copy), v8 (copy), v5 (copy), v2 (ref)
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 10 ]]
            -- upvalues: v3 (ref), v9 (copy), v4 (ref), v7 (ref), v8 (ref), v5 (ref), v2 (ref)
            if not v3.getIsEditMode() then
                return;
            elseif v9:getState().tryInStudio.triedInStudio[v4] then
                return;
            else
                v7:getItemDetails({
                    {
                        id = v4, 
                        itemType = "Asset"
                    }
                }):andThen(function(v10) --[[ Line: 29 ]]
                    -- upvalues: v4 (ref), v3 (ref), v8 (ref), v5 (ref), v9 (ref), v2 (ref)
                    local v11 = v10.responseBody.data[1];
                    if not v11 then
                        warn("Could not find asset information in response for", (tostring(v4)));
                        v3.onTryAssetFailure(v4);
                        return;
                    else
                        local v12 = {
                            Asset = {
                                Id = v11.asset.id, 
                                TypeId = v11.asset.typeId, 
                                AssetGenres = v11.asset.assetGenres, 
                                Name = v11.asset.name, 
                                Description = v11.asset.description, 
                                Created = v11.asset.createdUtc, 
                                Updated = v11.asset.updatedUtc, 
                                AssetSubTypes = v11.asset.assetSubTypes
                            }, 
                            Context = {}, 
                            Creator = {
                                Name = v11.creator.name, 
                                Id = v11.creator.id, 
                                Type = v11.creator.type
                            }
                        };
                        v8(v12);
                        v5(v12, false);
                        v3.onTryAsset(v4);
                        v9:dispatch(v2(v4));
                        return;
                    end;
                end, function(v13) --[[ Line: 66 ]]
                    -- upvalues: v4 (ref), v3 (ref)
                    warn("Could not load asset information for", tostring(v4), v13);
                    v3.onTryAssetFailure(v4);
                end);
                return nil;
            end;
        end);
        if not l_status_0 then
            warn("Failed to try asset", tostring(v4), (tostring(l_result_0)));
            v3.onTryAssetFailure(v4);
        end;
    end;
end;