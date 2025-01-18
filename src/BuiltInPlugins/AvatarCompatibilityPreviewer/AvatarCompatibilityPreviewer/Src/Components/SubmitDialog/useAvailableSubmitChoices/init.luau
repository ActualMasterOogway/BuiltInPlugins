local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Packages.React);
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v6 = require(l_script_FirstAncestor_0.Src.Util.filterDescendants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local l_Localization_0 = v2.ContextServices.Localization;
local function _(v9) --[[ Line: 16 ]] --[[ Name: realInstanceName ]]
    -- upvalues: v4 (copy)
    local l_v9_FirstChild_0 = v9:FindFirstChild(v4.REFERENCE_VALUE_NAME);
    if l_v9_FirstChild_0 == nil or not l_v9_FirstChild_0:IsA("ObjectValue") then
        return nil;
    else
        assert(l_v9_FirstChild_0:IsA("ObjectValue"), v4.LUAU_ANALYZE_ERROR);
        return l_v9_FirstChild_0.Value and l_v9_FirstChild_0.Value.Name;
    end;
end;
return function(v12) --[[ Line: 26 ]] --[[ Name: useAvailableSubmitChoices ]]
    -- upvalues: l_Localization_0 (copy), v3 (copy), v5 (copy), v6 (copy), v1 (copy), v4 (copy)
    local v13 = l_Localization_0:use();
    local v14 = v3.useContext(v5);
    return v3.useMemo(function() --[[ Line: 30 ]]
        -- upvalues: v12 (copy), v6 (ref), v1 (ref), v4 (ref), v14 (copy), v13 (copy)
        local v15 = {};
        local v16 = v12.WorldModel:Clone();
        v6(v16, v1.List.join(v4.LIMBS, {
            "HumanoidRootPart"
        }));
        table.insert(v15, {
            instance = v16, 
            assetType = "Body"
        });
        for _, v18 in v14.equippedItems do
            if v18.item.source == v4.SOURCE_INSTANCE then
                assert(v18.item.source == v4.SOURCE_INSTANCE, v4.LUAU_ANALYZE_ERROR);
                if v18.palette.PublishAssetType ~= nil then
                    assert(v18.palette.PublishAssetType ~= nil, v4.LUAU_ANALYZE_ERROR);
                    local v19 = v18.item.instance:Clone();
                    v6(v19, {
                        "Handle"
                    });
                    local l_v19_FirstChild_0 = v19:FindFirstChild(v4.REFERENCE_VALUE_NAME);
                    local v21;
                    if l_v19_FirstChild_0 == nil or not l_v19_FirstChild_0:IsA("ObjectValue") then
                        v21 = nil;
                    else
                        assert(l_v19_FirstChild_0:IsA("ObjectValue"), v4.LUAU_ANALYZE_ERROR);
                        v21 = l_v19_FirstChild_0.Value and l_v19_FirstChild_0.Value.Name;
                    end;
                    if v21 ~= nil then
                        v19.Name = v21;
                    end;
                    while true do
                        l_v19_FirstChild_0 = v19:FindFirstChildWhichIsA("ValueBase", true);
                        if l_v19_FirstChild_0 ~= nil then
                            l_v19_FirstChild_0:Destroy();
                        else
                            break;
                        end;
                    end;
                    for v22 in v19:GetAttributes() do
                        v19:SetAttribute(v22, nil);
                    end;
                    table.insert(v15, {
                        instance = v19, 
                        assetType = v18.palette.PublishAssetType
                    });
                end;
            end;
        end;
        table.sort(v15, function(v23, v24) --[[ Line: 80 ]]
            -- upvalues: v13 (ref)
            if v23.assetType == "Body" then
                return true;
            elseif v24.assetType == "Body" then
                return false;
            else
                return v13:getText("AssetType", v23.assetType.Name) < v13:getText("AssetType", v24.assetType.Name);
            end;
        end);
        return v15;
    end, {
        v14.equippedItems
    });
end;