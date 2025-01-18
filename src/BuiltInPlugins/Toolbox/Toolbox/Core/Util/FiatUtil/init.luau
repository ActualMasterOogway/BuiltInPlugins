local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local _ = require(l_script_FirstAncestor_0.Core.Types.MarketplaceFiatServiceTypes);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFStringToolboxFiatMonetizableAssetTypesCSV);
local v5 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxAssetConfigOnboardingLink);
local l_game_EngineFeature_0 = game:GetEngineFeature("ToolboxSampleProductMUS418");
local v7 = {
    ENABLED_ASSET_TYPES = if v5() then nil else {}, 
    MONETIZABLE_ASSET_TYPES = if v5() then {} else nil
};
local v8 = v4();
local l_status_0, l_result_0 = pcall(function() --[[ Line: 19 ]]
    -- upvalues: v8 (copy), v5 (copy), v7 (copy)
    for v9 in v8:gmatch("([^,]+),?") do
        local v10 = Enum.AssetType[v9];
        if v5() then
            v7.MONETIZABLE_ASSET_TYPES[v10.Name] = true;
        else
            v7.ENABLED_ASSET_TYPES[v10.Name] = true;
        end;
    end;
end);
if not l_status_0 and v1.shouldDebugWarnings() then
    warn(("Fiat error: Asset Type was not found for getFStringToolboxFiatMonetizableAssetTypesCSV: %s"):format(l_result_0));
end;
v7.isFree = function(v13) --[[ Line: 33 ]] --[[ Name: isFree ]]
    -- upvalues: l_game_EngineFeature_0 (copy)
    if l_game_EngineFeature_0 then
        if not v13 or not v13.quantity then
            return false;
        else
            local v14 = true;
            if v13.quantity.significand ~= 0 then
                v14 = v13.quantity.significand == nil;
            end;
            return v14;
        end;
    else
        return v13 and v13.quantity and v13.quantity.significand == 0;
    end;
end;
v7.calculateQuantity = function(v15) --[[ Line: 44 ]] --[[ Name: calculateQuantity ]]
    if not v15 or not v15.quantity then
        return;
    else
        return v15.quantity.significand * 10 ^ v15.quantity.exponent;
    end;
end;
v7.stringFromCurrencyCode = function(v16) --[[ Line: 51 ]] --[[ Name: stringFromCurrencyCode ]]
    if v16 == "USD" then
        return "$";
    else
        return v16;
    end;
end;
v7.displayStringFromMoney = function(v17, v18) --[[ Line: 58 ]] --[[ Name: displayStringFromMoney ]]
    -- upvalues: v7 (copy)
    if v7.isFree(v17) then
        if v18 then
            return (v18:getText("General", "Free"));
        else
            return "Free";
        end;
    else
        local v19 = v7.stringFromCurrencyCode(v17.currencyCode);
        local v20 = v17.quantity.significand * 10 ^ v17.quantity.exponent;
        return string.format("%s%.2f", v19, v20);
    end;
end;
local v21 = {
    [Enum.AssetType.Audio.Value] = "PRODUCT_TYPE_AUDIO", 
    [Enum.AssetType.Decal.Value] = "PRODUCT_TYPE_DECAL", 
    [Enum.AssetType.FontFamily.Value] = "PRODUCT_TYPE_FONT_FAMILY", 
    [Enum.AssetType.MeshPart.Value] = "PRODUCT_TYPE_MESH_PART", 
    [Enum.AssetType.Model.Value] = "PRODUCT_TYPE_MODEL", 
    [Enum.AssetType.Plugin.Value] = "PRODUCT_TYPE_PLUGIN", 
    [Enum.AssetType.Video.Value] = "PRODUCT_TYPE_VIDEO", 
    [Enum.AssetType.Package.Value] = "PRODUCT_TYPE_MODEL"
};
v7.convertAssetTypeToProductType = function(v22) --[[ Line: 81 ]] --[[ Name: convertAssetTypeToProductType ]]
    -- upvalues: v21 (copy)
    local v23 = v21[v22];
    if not v23 then
        warn(("No product type for asset type %s"):format((tostring(v22))));
        return "PRODUCT_TYPE_INVALID";
    else
        return v23;
    end;
end;
v7.getDefaultFiatProduct = function() --[[ Line: 92 ]] --[[ Name: getDefaultFiatProduct ]]
    return {
        basePrice = {
            currencyCode = "USD", 
            quantity = {
                significand = 0, 
                exponent = 0
            }
        }, 
        published = false, 
        purchasable = false
    };
end;
v7.createPartialFiatProductWithOnlyAssetId = function(v24, v25) --[[ Line: 101 ]] --[[ Name: createPartialFiatProductWithOnlyAssetId ]]
    return {
        audioAssetId = if v25 == Enum.AssetType.Audio then tostring(v24) else nil, 
        decalAssetId = if v25 == Enum.AssetType.Decal then tostring(v24) else nil, 
        meshPartAssetId = if v25 == Enum.AssetType.MeshPart then tostring(v24) else nil, 
        modelAssetId = if not (v25 ~= Enum.AssetType.Model) or v25 == Enum.AssetType.Package then tostring(v24) else nil, 
        pluginAssetId = if v25 == Enum.AssetType.Plugin then tostring(v24) else nil, 
        videoAssetId = if v25 == Enum.AssetType.Video then tostring(v24) else nil
    };
end;
v7.createFiatProduct = function(v26, v27, v28, v29, v30, v31) --[[ Line: 117 ]] --[[ Name: createFiatProduct ]]
    -- upvalues: v21 (copy), v3 (copy), v7 (copy)
    if not v27 or not v21[v27.Value] then
        return nil;
    else
        return v3.join(v7.createPartialFiatProductWithOnlyAssetId(v26, v27), {
            basePrice = v28, 
            description = v29, 
            displayName = v30, 
            published = v31
        });
    end;
end;
return v7;