local l_MarketplaceService_0 = game:GetService("MarketplaceService");
local function v6(v1, v2, v3) --[[ Line: 9 ]] --[[ Name: getExperiencePlaceId ]]
    v2.Develop.V2.Universes.places(v1):makeRequest():andThen(function(v4) --[[ Line: 10 ]]
        -- upvalues: v3 (copy)
        v3(v4.responseBody.data[1].id);
    end, function(v5) --[[ Line: 12 ]]
        -- upvalues: v3 (copy)
        warn("Unable to retrieve details of experience", v5.responseBody);
        v3();
    end);
end;
return function(v7, v8, v9) --[[ Line: 18 ]]
    -- upvalues: v6 (copy), l_MarketplaceService_0 (copy)
    v6(v7, v8, function(v10) --[[ Line: 19 ]]
        -- upvalues: v9 (copy), l_MarketplaceService_0 (ref), v7 (copy)
        if not v10 then
            v9();
            return;
        else
            local l_l_MarketplaceService_0_ProductInfo_0 = l_MarketplaceService_0:GetProductInfo(v10);
            v9({
                experienceId = v7, 
                placeId = v10, 
                name = l_l_MarketplaceService_0_ProductInfo_0.Name
            });
            return;
        end;
    end);
end;