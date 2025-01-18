local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerClothingTypeIcons);
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerNewCatalogAccessories);
local v5 = require(l_script_FirstAncestor_0.Src.Resources.BuiltinItems);
local v6 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Util.find);
local l_Localization_0 = v1.ContextServices.Localization;
local function _(v9) --[[ Line: 18 ]] --[[ Name: findUserItemName ]]
    -- upvalues: v6 (copy)
    assert(v9.item.source == v6.SOURCE_INSTANCE, "Non-user item passed to findUserItemName");
    local l_FirstChild_0 = v9.item.instance:FindFirstChild(v6.REFERENCE_VALUE_NAME);
    if l_FirstChild_0 ~= nil and l_FirstChild_0:IsA("ObjectValue") and l_FirstChild_0.Value ~= nil then
        return l_FirstChild_0.Value.Name;
    else
        return nil;
    end;
end;
return function(v12) --[[ Line: 29 ]] --[[ Name: useItemName ]]
    -- upvalues: l_Localization_0 (copy), v6 (copy), v4 (copy), v7 (copy), v5 (copy), v3 (copy)
    local v13 = l_Localization_0:use();
    if v12.item.source ~= v6.SOURCE_BUILTIN then
        assert(v12.item.source == v6.SOURCE_INSTANCE, "Non-user item passed to findUserItemName");
        local l_FirstChild_1 = v12.item.instance:FindFirstChild(v6.REFERENCE_VALUE_NAME);
        if l_FirstChild_1 ~= nil and l_FirstChild_1:IsA("ObjectValue") and l_FirstChild_1.Value ~= nil then
            return l_FirstChild_1.Value.Name;
        else
            return nil;
        end;
    else
        assert(v12.item.source == v6.SOURCE_BUILTIN, v6.LUAU_ANALYZE_ERROR);
        local l_builtinItem_0 = v12.item.builtinItem;
        if typeof(v12.item.builtinItem) == "number" then
            l_builtinItem_0 = v12.item.builtinItem;
        elseif typeof(v12.item.builtinItem) == "Color3" then
            return nil;
        elseif typeof(v12.item.builtinItem) == "table" then
            if v12.item.builtinItem.left ~= nil then
                l_builtinItem_0 = v12.item.builtinItem.left;
            else
                return nil;
            end;
        else
            return nil;
        end;
        local v16 = ("%*_%*"):format(v12.palette.Key, l_builtinItem_0);
        local v18 = if v4() then v7(v5.allItems, function(v17) --[[ Line: 57 ]]
            -- upvalues: l_builtinItem_0 (ref)
            return v17.id == l_builtinItem_0;
        end) else nil;
        local v19 = v13:getText("ItemNames2", v16) .. if v4() and v18 and (not v3() or v18.accessoryType == "rigid") then (" (%*)"):format(v18.attachment) else "";
        if v19:match(v16) then
            return nil;
        else
            return v19;
        end;
    end;
end;