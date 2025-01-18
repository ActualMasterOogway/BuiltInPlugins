local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v5 = require(l_script_FirstAncestor_0.Src.Util.SelectionWrapper);
local v6 = require(l_script_FirstAncestor_0.Src.Components.UserCatalogFolderContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.getPaletteFromKey);
local function v11(v8) --[[ Line: 17 ]] --[[ Name: catalogItemToEquippableChild ]]
    -- upvalues: v7 (copy), v2 (copy)
    local l_v8_Attribute_0 = v8:GetAttribute("RBX_Palette");
    if not l_v8_Attribute_0 then
        warn((("%* did not have a palette set. This is a bug in the plugin, please report it."):format(v8)));
        return nil;
    else
        local v10 = v7(l_v8_Attribute_0);
        if v10 == nil then
            warn((("%* has an invalid palette \"%*\". This is a bug in the plugin, please report it."):format(v8, l_v8_Attribute_0)));
            return nil;
        else
            return {
                palette = v10, 
                item = {
                    source = v2.SOURCE_INSTANCE, 
                    instance = v8
                }
            };
        end;
    end;
end;
return function() --[[ Line: 40 ]] --[[ Name: useEquipCatalogItemsInSelection ]]
    -- upvalues: v1 (copy), v4 (copy), v6 (copy), v5 (copy), v11 (copy)
    local v12 = v1.useContext(v4);
    local l_userCatalogFolder_0 = v1.useContext(v6.Context).userCatalogFolder;
    local v14 = v5:use():get();
    return v1.useCallback(function() --[[ Line: 46 ]]
        -- upvalues: l_userCatalogFolder_0 (copy), v14 (copy), v11 (ref), v12 (copy)
        if l_userCatalogFolder_0 == nil then
            return;
        else
            for _, v16 in (v14:Get()) do
                if v16:IsDescendantOf(l_userCatalogFolder_0) and (v16:IsA("Accessory") or v16:IsA("Folder")) then
                    local v17 = v11(v16);
                    if v17 ~= nil then
                        v12.addEquippedItem(v17);
                    end;
                end;
            end;
            return;
        end;
    end, {
        l_userCatalogFolder_0
    });
end;