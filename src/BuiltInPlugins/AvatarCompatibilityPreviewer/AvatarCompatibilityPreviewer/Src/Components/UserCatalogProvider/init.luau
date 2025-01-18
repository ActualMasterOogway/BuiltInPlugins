local l_HttpService_0 = game:GetService("HttpService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v6 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v7 = require(l_script_FirstAncestor_0.Src.Util.UserCatalogContext);
local v8 = require(l_script_FirstAncestor_0.Src.Components.UserCatalogFolderContext);
local v9 = require(l_script_FirstAncestor_0.Src.Util.getPaletteFromKey);
local v10 = require(l_script_FirstAncestor_0.Src.Hooks.DEPRECATED_useUserCatalogFolder);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerCatalogUndo);
local function v16(v13) --[[ Line: 24 ]] --[[ Name: catalogItemToEquippableChild ]]
    -- upvalues: v9 (copy), v5 (copy)
    local l_v13_Attribute_0 = v13:GetAttribute("RBX_Palette");
    if not l_v13_Attribute_0 then
        warn((("%* did not have a palette set. This is a bug in the plugin, please report it."):format(v13)));
        return nil;
    else
        local v15 = v9(l_v13_Attribute_0);
        if v15 == nil then
            warn((("%* has an invalid palette \"%*\". This is a bug in the plugin, please report it."):format(v13, l_v13_Attribute_0)));
            return nil;
        else
            assert(v15 ~= nil, v5.LUAU_ANALYZE_ERROR);
            return {
                palette = v15, 
                item = {
                    source = v5.SOURCE_INSTANCE, 
                    instance = v13
                }
            };
        end;
    end;
end;
return function(v17) --[[ Line: 48 ]] --[[ Name: UserCatalogProvider ]]
    -- upvalues: v12 (copy), v4 (copy), v8 (copy), v10 (copy), v6 (copy), v3 (copy), v16 (copy), v5 (copy), l_HttpService_0 (copy), v2 (copy), v7 (copy)
    local v18 = if v12() then v4.useContext(v8.Context).userCatalogFolder else v10();
    local v19 = v4.useContext(v6);
    local v23, v24 = v4.useState(v3.collectArray(if not v12() or v18 ~= nil then v18:GetChildren() else {}, function(_, v21) --[[ Line: 60 ]]
        -- upvalues: v16 (ref)
        local v22 = v16(v21);
        if v22 == nil then
            v21:Destroy();
        end;
        return v22;
    end));
    local v32 = v4.useCallback(function(v25, v26, v27) --[[ Line: 72 ]]
        -- upvalues: v12 (ref), v18 (copy), v5 (ref), v19 (copy), l_HttpService_0 (ref)
        if v12() and v18 == nil then
            warn("catalog folder is nil when trying to add new items");
            return;
        else
            for _, v29 in v18:GetChildren() do
                local l_v29_FirstChild_0 = v29:FindFirstChild(v5.REFERENCE_VALUE_NAME);
                if l_v29_FirstChild_0 ~= nil and l_v29_FirstChild_0:IsA("ObjectValue") then
                    assert(l_v29_FirstChild_0:IsA("ObjectValue"), v5.LUAU_ANALYZE_ERROR);
                    if l_v29_FirstChild_0.Value == v27 and v29:GetAttribute("RBX_Palette") == v26.Key then
                        v19.removeEquippedItem({
                            palette = v26, 
                            item = {
                                source = v5.SOURCE_INSTANCE, 
                                instance = v29
                            }
                        });
                        v29:Destroy();
                        break;
                    end;
                end;
            end;
            local l_ObjectValue_0 = Instance.new("ObjectValue");
            l_ObjectValue_0.Name = v5.REFERENCE_VALUE_NAME;
            l_ObjectValue_0.Value = v27;
            l_ObjectValue_0.Parent = v25;
            v25:SetAttribute("RBX_Palette", v26.Key);
            v25.Name = l_HttpService_0:GenerateGUID();
            v25.Parent = v18;
            return;
        end;
    end, {
        v19.removeEquippedItem, 
        v18
    });
    local v35 = v4.useCallback(function(v33, v34) --[[ Line: 117 ]]
        -- upvalues: v19 (copy), v5 (ref)
        v19.removeEquippedItem({
            palette = v33, 
            item = {
                source = v5.SOURCE_INSTANCE, 
                instance = v34
            }
        });
        v34:Destroy();
    end, {
        v19.removeEquippedItem
    });
    v4.useEffect(function() --[[ Line: 130 ]]
        -- upvalues: v12 (ref), v18 (copy), v19 (copy), v24 (copy), v16 (ref), v3 (ref), v5 (ref), v2 (ref)
        if v12() and v18 == nil then
            return;
        else
            if v12() then
                v19.cleanAllEquippedItems();
            end;
            local function v40(v36) --[[ Line: 139 ]] --[[ Name: childAdded ]]
                -- upvalues: v24 (ref), v16 (ref)
                v24(function(v37) --[[ Line: 140 ]]
                    -- upvalues: v16 (ref), v36 (copy)
                    local v38 = table.clone(v37);
                    local v39 = v16(v36);
                    assert(v39 ~= nil, "Newly added child to the catalog couldn't be turned into a catalog item");
                    table.insert(v38, v39);
                    return v38;
                end);
            end;
            local v41 = v18.ChildAdded:Connect(v40);
            local function v47(v42) --[[ Line: 153 ]] --[[ Name: childRemoved ]]
                -- upvalues: v24 (ref), v3 (ref), v5 (ref), v2 (ref), v12 (ref), v19 (ref)
                v24(function(v43) --[[ Line: 154 ]]
                    -- upvalues: v3 (ref), v5 (ref), v42 (copy), v2 (ref)
                    local v46 = v3.findIndex(v43, function(v44) --[[ Line: 156 ]]
                        -- upvalues: v5 (ref), v42 (ref)
                        local v45 = false;
                        if v44.item.source == v5.SOURCE_INSTANCE then
                            v45 = v44.item.instance == v42;
                        end;
                        return v45;
                    end);
                    if v46 == nil then
                        return v43;
                    else
                        return (v2.List.removeIndex(v43, v46));
                    end;
                end);
                if v12() then
                    v19.cleanAllEquippedItems();
                end;
            end;
            local v48 = v18.ChildRemoved:Connect(v47);
            v24(v3.map(v18:GetChildren(), function(v49) --[[ Line: 173 ]]
                -- upvalues: v16 (ref)
                local v50 = v16(v49);
                assert(v50 ~= nil, "Newly added child to the catalog couldn't be turned into a catalog item");
                return v50;
            end));
            return function() --[[ Line: 179 ]]
                -- upvalues: v41 (copy), v48 (copy)
                v41:Disconnect();
                v48:Disconnect();
            end;
        end;
    end, {
        if v12() then v18 else nil
    });
    local v51 = {
        equippableItems = v23, 
        addNewItem = v32, 
        removeItem = v35
    };
    return v4.createElement(v7.Provider, {
        value = v51
    }, v17.children);
end;