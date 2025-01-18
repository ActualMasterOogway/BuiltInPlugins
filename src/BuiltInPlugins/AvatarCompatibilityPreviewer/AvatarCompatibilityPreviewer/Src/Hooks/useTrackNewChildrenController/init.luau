local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useAddInstancesToUserCatalogAndEquip);
local v5 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
return function(v6) --[[ Line: 11 ]] --[[ Name: useTrackNewChildrenController ]]
    -- upvalues: v4 (copy), v1 (copy), v3 (copy), v5 (copy)
    local v7 = v4();
    local v8 = v1.useContext(v3);
    v5(v6.ChildAdded, function(v9) --[[ Line: 15 ]]
        -- upvalues: v8 (copy), v7 (copy)
        if v8.isIgnoringChildren then
            return;
        elseif not v9:IsA("Accessory") then
            return;
        else
            v7({
                v9
            });
            return;
        end;
    end, {
        v7, 
        v6, 
        v8.isIgnoringChildren
    });
end;