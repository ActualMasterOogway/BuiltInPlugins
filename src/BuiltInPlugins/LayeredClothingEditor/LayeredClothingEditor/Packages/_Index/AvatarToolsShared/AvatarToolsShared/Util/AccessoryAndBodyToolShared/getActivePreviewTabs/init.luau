local v0 = require(script.Parent.ItemCharacteristics);
local v1 = require(script.Parent.PreviewConstantsInterface);
return function(v2) --[[ Line: 6 ]] --[[ Name: getActivePreviewTabs ]]
    -- upvalues: v0 (copy), v1 (copy)
    if v0.isAvatar(v2) then
        return v1.getTabsForAvatarEditing();
    elseif v0.isClothes(v2) then
        return v1.getTabsForClothesEditing();
    else
        return {};
    end;
end;