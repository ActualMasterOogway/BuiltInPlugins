local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v5 = require(l_script_FirstAncestor_0.Src.Resources.CatalogItems);
local v6 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v7 = require(l_script_FirstAncestor_0.Src.Hooks.useAddInstancesToUserCatalogAndEquip);
local v8 = require(l_script_FirstAncestor_0.Src.Hooks.useSerializedState);
local v9 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerBetterUseSerializedState);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerEquipIdleOnInit);
return function(v11) --[[ Line: 20 ]] --[[ Name: useInitialImportController ]]
    -- upvalues: v7 (copy), v8 (copy), v2 (copy), v6 (copy), v10 (copy), v5 (copy), v3 (copy), v1 (copy), v9 (copy)
    local v12 = v7();
    local v13, v14 = v8(v11, "initialImportComplete", false);
    local v15 = v2.useContext(v6);
    v2.useEffect(function() --[[ Line: 29 ]]
        -- upvalues: v13 (copy), v14 (copy), v10 (ref), v15 (copy), v5 (ref), v3 (ref), v12 (copy), v1 (ref), v11 (copy)
        if v13 then
            return;
        else
            v14(true);
            if v10() then
                v15.removeAllEquippedItems();
            end;
            task.defer(function() --[[ Line: 41 ]]
                -- upvalues: v10 (ref), v5 (ref), v3 (ref), v15 (ref), v12 (ref), v1 (ref), v11 (ref)
                if v10() then
                    local v16 = {
                        palette = v5.animations[1], 
                        item = {
                            source = "builtin", 
                            builtinItem = v3.IDLE_ANIMATION_ID
                        }
                    };
                    v15.addEquippedItem(v16);
                end;
                v12(v1.filter(v11:GetChildren(), function(v17) --[[ Line: 54 ]]
                    return v17:IsA("Accessory") or v17:IsA("MeshPart") and v17.Name ~= "Head";
                end));
            end);
            return;
        end;
    end, {
        v12, 
        v13, 
        v11, 
        if v9() then v14 else nil
    });
end;