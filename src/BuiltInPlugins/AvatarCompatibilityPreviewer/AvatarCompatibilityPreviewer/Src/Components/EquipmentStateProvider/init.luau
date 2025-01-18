local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Util.Constants);
local v3 = require(l_Parent_0.Src.Util.EquipmentStateContext);
local v4 = require(l_Parent_0.Src.Util.Serializers);
local _ = require(l_Parent_0.Src.Types);
local v6 = require(l_Parent_0.Src.Components.UserCatalogFolderContext);
local v7 = require(l_Parent_0.Src.Hooks.useAvatarAssets);
local v8 = require(l_Parent_0.Src.Hooks.useAddEquippedItem);
local v9 = require(l_Parent_0.Src.Hooks.useRemoveEquippedItem);
local v10 = require(l_Parent_0.Src.Hooks.useSerializedState);
local v11 = require(l_Parent_0.Src.Hooks.useSetEquippedItemIsHidden);
local v12 = require(l_Parent_0.Src.Hooks.useIncrementedState);
local v13 = require(l_Parent_0.Src.Hooks.DEPRECATED_useUserCatalogFolder);
local v14 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerBetterUseSerializedState);
local v15 = require(l_Parent_0.Src.Flags.getFFlagAvatarPreviewerCatalogUndo);
return function(v16) --[[ Line: 28 ]] --[[ Name: EquipmentStateProvider ]]
    -- upvalues: v15 (copy), v1 (copy), v6 (copy), v13 (copy), v4 (copy), v10 (copy), v11 (copy), v14 (copy), v8 (copy), v9 (copy), v7 (copy), v12 (copy), v2 (copy), v3 (copy)
    local v17 = if v15() then v1.useContext(v6.Context).userCatalogFolder else v13();
    local v18 = v1.useMemo(function() --[[ Line: 33 ]]
        -- upvalues: v15 (ref), v17 (copy), v4 (ref)
        if v15() and v17 == nil then
            return nil;
        else
            return v4.createEquippedItemsSerializer(v17);
        end;
    end, {
        v17
    });
    local v19, v20 = v10(v16.root, "equippedItems", {}, v18);
    local v21 = v11(v20, false);
    local v22 = v11(v20, true);
    local v30 = v1.useCallback(function(v23, v24) --[[ Line: 47 ]]
        -- upvalues: v20 (copy)
        v20(function(v25) --[[ Line: 48 ]]
            -- upvalues: v24 (copy), v23 (copy)
            local v26 = table.clone(v25);
            for v27, v28 in v26 do
                if v24 == nil or table.find(v24, v28) == nil then
                    local v29 = table.clone(v28);
                    v29.isHidden = v23;
                    v26[v27] = v29;
                end;
            end;
            return v26;
        end);
    end, {
        v19, 
        if v14() then v20 else nil
    });
    local v31 = v8(v20);
    local v32 = v9(v20);
    local v33 = v1.useCallback(function() --[[ Line: 68 ]]
        -- upvalues: v20 (copy)
        v20({});
    end, {
        if v14() then v20 else nil
    });
    local v39 = v1.useCallback(function(v34, v35) --[[ Line: 72 ]]
        -- upvalues: v20 (copy)
        v20(function(v36) --[[ Line: 73 ]]
            -- upvalues: v34 (copy), v35 (copy)
            local v37 = false;
            if v34 > 0 then
                v37 = v34 <= #v36;
            end;
            assert(v37, "Starting index out of range");
            v37 = false;
            if v35 > 0 then
                v37 = v35 <= #v36;
            end;
            assert(v37, "New index out of range");
            v36 = table.clone(v36);
            local v38 = table.remove(v36, v34);
            assert(v38 ~= nil, "Removed item is invalid even though we checked bounds");
            table.insert(v36, v35, v38);
            return v36;
        end);
    end, {
        if v14() then v20 else nil
    });
    local v40 = v7(v19);
    local v41 = v12();
    local v42 = v1.useCallback(function() --[[ Line: 91 ]]
        -- upvalues: v41 (copy)
        v41.increment();
        return function() --[[ Line: 93 ]]
            -- upvalues: v41 (ref)
            v41.decrement();
        end;
    end, {});
    local v47 = v1.useCallback(function() --[[ Line: 98 ]]
        -- upvalues: v15 (ref), v20 (copy), v2 (ref)
        assert(v15(), "FFlagAvatarPreviewerCatalogUndo must be enabled");
        v20(function(v43) --[[ Line: 100 ]]
            -- upvalues: v2 (ref)
            local v44 = {};
            for _, v46 in v43 do
                if v46.item.source ~= v2.SOURCE_INSTANCE or v46.item.instance:IsDescendantOf(game) then
                    table.insert(v44, v46);
                end;
            end;
            if #v43 == #v44 then
                return v43;
            else
                return v44;
            end;
        end);
    end, {
        v20, 
        v16.root
    });
    local v48 = {
        equippedItems = v19, 
        addEquippedItem = v31, 
        removeEquippedItem = v32, 
        removeAllEquippedItems = v33, 
        moveEquippedItemsToIndex = v39, 
        cleanAllEquippedItems = v47, 
        hideEquippedItem = v22, 
        showEquippedItem = v21, 
        setHideAllEquippedItems = v30, 
        avatarAssets = v40, 
        startIgnoringChildren = v42, 
        isIgnoringChildren = v41.amount > 0
    };
    return v1.createElement(v3.Provider, {
        value = v48
    }, v16.children);
end;