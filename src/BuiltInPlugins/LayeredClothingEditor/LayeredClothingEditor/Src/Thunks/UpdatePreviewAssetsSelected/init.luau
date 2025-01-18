local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Framework);
local l_AccessoryAndBodyToolShared_0 = require(l_Parent_0.Packages.AvatarToolsShared).Util.AccessoryAndBodyToolShared;
local l_PreviewConstants_0 = l_AccessoryAndBodyToolShared_0.PreviewConstants;
local l_PreviewConstantsInterface_0 = l_AccessoryAndBodyToolShared_0.PreviewConstantsInterface;
local v6 = require(l_Parent_0.Src.Actions.SetPreviewAssetsSelected);
local v7 = require(l_Parent_0.Src.Util.AnalyticsGlobals);
local l_deepCopy_0 = v2.Util.deepCopy;
local function v13(v9, v10, v11, v12) --[[ Line: 25 ]] --[[ Name: getUpdatedSelectedAssetsForTab ]]
    -- upvalues: v1 (copy)
    if v10 then
        if v11 then
            v12 = v12 or {};
            table.insert(v12, v9);
            return v12;
        else
            return {
                v9
            };
        end;
    elseif v12 then
        return v1.List.removeValue(v12, v9);
    else
        return nil;
    end;
end;
local function _(v14) --[[ Line: 41 ]] --[[ Name: hasASelectedAvatar ]]
    -- upvalues: l_PreviewConstants_0 (copy)
    local v15 = v14[l_PreviewConstants_0.TABS_KEYS.Avatars];
    if not v15 then
        return false;
    elseif next(v15) then
        return true;
    else
        return false;
    end;
end;
return function(v17, v18) --[[ Line: 54 ]]
    -- upvalues: l_deepCopy_0 (copy), l_PreviewConstantsInterface_0 (copy), v13 (copy), l_PreviewConstants_0 (copy), v7 (copy), v6 (copy)
    return function(v19) --[[ Line: 55 ]]
        -- upvalues: l_deepCopy_0 (ref), v17 (copy), l_PreviewConstantsInterface_0 (ref), v13 (ref), v18 (copy), l_PreviewConstants_0 (ref), v7 (ref), v6 (ref)
        local v20 = v19:getState();
        local l_selectedTab_0 = v20.previewStatus.selectedTab;
        local v22 = l_deepCopy_0(v20.previewStatus.selectedAssets);
        if v17 then
            local v23 = l_PreviewConstantsInterface_0.isTabMultiSelect(l_selectedTab_0);
            v22[l_selectedTab_0] = v13(v17, v18, v23, v22[l_selectedTab_0]);
            if v18 then
                if l_selectedTab_0 == l_PreviewConstants_0.TABS_KEYS.Avatars then
                    local l_v7_0 = v7;
                    l_v7_0.TotalAvatars = l_v7_0.TotalAvatars + 1;
                elseif l_selectedTab_0 == l_PreviewConstants_0.TABS_KEYS.Clothing then
                    local l_v7_1 = v7;
                    l_v7_1.TotalLayers = l_v7_1.TotalLayers + 1;
                end;
            end;
        end;
        local v26 = v22[l_PreviewConstants_0.TABS_KEYS.Avatars];
        if not (not not v26 and (next(v26) and true or false)) then
            local l_Avatars_0 = l_PreviewConstants_0.TABS_KEYS.Avatars;
            v26 = l_PreviewConstantsInterface_0.getTabInfo(l_Avatars_0);
            if not v22[l_Avatars_0] then
                v22[l_Avatars_0] = {};
            end;
            local _, v29 = next(v26.BundleIds);
            v22[l_Avatars_0] = {
                v29
            };
        end;
        v19:dispatch(v6(v22));
    end;
end;