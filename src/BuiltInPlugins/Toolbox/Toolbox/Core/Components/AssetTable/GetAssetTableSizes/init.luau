local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v2 = require(l_Util_0.Constants);
local v3 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxEnableAssetRows);
local v4 = if v3() then v2.ITEM_ROW.LEFT_RIGHT_PADDING else 0;
local v5 = if v3() then v2.ASSET_ROW.ICON_SIZE + (v4 + v2.ASSET_ROW.LEFT_MOST_PADDING) else 0;
return function(v6) --[[ Line: 15 ]]
    -- upvalues: v2 (copy), v5 (copy)
    local l_ASSET_ROW_COLUMNS_0 = v2.ASSET_ROW_COLUMNS;
    local v8 = {
        [l_ASSET_ROW_COLUMNS_0.ICON] = UDim2.new(0, v5, 1, 0), 
        [l_ASSET_ROW_COLUMNS_0.NAME] = UDim2.new(0.4, -v5, 1, 0), 
        [l_ASSET_ROW_COLUMNS_0.CREATOR] = UDim2.new(0.2, 0, 1, 0), 
        [l_ASSET_ROW_COLUMNS_0.DATE_UPDATED] = UDim2.new(0.2, 0, 1, 0), 
        [l_ASSET_ROW_COLUMNS_0.DATE_CREATED] = UDim2.new(0.2, 0, 1, 0)
    };
    if v6 < 360 then
        v8[l_ASSET_ROW_COLUMNS_0.NAME] = UDim2.new(0.4, -v5, 1, 0);
        v8[l_ASSET_ROW_COLUMNS_0.CREATOR] = UDim2.new(0.3, 0, 1, 0);
        v8[l_ASSET_ROW_COLUMNS_0.DATE_UPDATED] = UDim2.new(0.3, 0, 1, 0);
        v8[l_ASSET_ROW_COLUMNS_0.DATE_CREATED] = nil;
    end;
    return v8, 360;
end;