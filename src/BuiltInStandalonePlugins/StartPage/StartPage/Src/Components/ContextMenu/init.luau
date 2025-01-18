local l_script_FirstAncestor_0 = script:FindFirstAncestor("StartPage");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageNetworkCache)();
local v3 = require(l_script_FirstAncestor_0.Src.Util.Services);
local l_StartPageManager_0 = v3.StartPageManager;
local l_StudioService_0 = v3.StudioService;
local v6 = if v2 then require(l_script_FirstAncestor_0.Src.Network.ChangeUniverseActivity) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.ChangeUniverseActivity);
local v7 = if v2 then require(l_script_FirstAncestor_0.Src.Network.ChangeArchiveConfiguration) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.ChangeArchiveConfiguration);
local v8 = if v2 then require(l_script_FirstAncestor_0.Src.Network.DeleteUserFromTeamCreateUniverse) else require(l_script_FirstAncestor_0.Src.DEPRECATED_Network.DeleteUserFromTeamCreateUniverse);
local v9 = if v2 then require(l_script_FirstAncestor_0.Src.Network.GameCache) else nil;
local v10 = require(l_script_FirstAncestor_0.Src.Util.RemoveHandlerFromNetworkData);
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
local v12 = require(l_script_FirstAncestor_0.Src.SharedFlags.getFFlagLuaStartPageAtomicTestsFixes);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function v21(v14, v15) --[[ Line: 59 ]] --[[ Name: getKebabActions ]]
    -- upvalues: l_Localization_0 (copy), l_StartPageManager_0 (copy), v2 (copy), v6 (copy), v7 (copy), v8 (copy), l_StudioService_0 (copy), v12 (copy), v9 (copy), v10 (copy)
    assert(not v14.IsPlaceholder, "Cell should not be a placeholder here");
    local v16 = l_Localization_0:use();
    return {
        ConfigureExperience = if v14.Id then {
            Label = v16:getText("Plugin", "ConfigureExperience"), 
            Action = function() --[[ Line: 66 ]] --[[ Name: Action ]]
                -- upvalues: l_StartPageManager_0 (ref), v14 (copy)
                l_StartPageManager_0:openLink("https://create.roblox.com/dashboard/creations/experiences/" .. v14.Id .. "/configure");
            end
        } else nil, 
        ConfigurePlace = if v14.Id and v14.RootPlaceId then {
            Label = v16:getText("Plugin", "ConfigurePlace"), 
            Action = function() --[[ Line: 77 ]] --[[ Name: Action ]]
                -- upvalues: l_StartPageManager_0 (ref), v14 (copy)
                l_StartPageManager_0:openLink("https://create.roblox.com/dashboard/creations/experiences/" .. v14.Id .. "/places/" .. v14.RootPlaceId .. "/configure");
            end
        } else nil, 
        OpenPlace = if v14.RootPlaceId then {
            Label = v16:getText("Plugin", "OpenPlacePage"), 
            Action = function() --[[ Line: 92 ]] --[[ Name: Action ]]
                -- upvalues: l_StartPageManager_0 (ref), v14 (copy)
                l_StartPageManager_0:openLink("https://www.roblox.com/games/" .. v14.RootPlaceId);
            end
        } else nil, 
        PublicPrivateToggle = if v14.Id and v14.PrivacyType and v14.PrivacyType ~= "Draft" then {
            Label = v16:getText("Plugin", "SetPrivacy", {
                privacy = if v14.PrivacyType == "Public" then v16:getText("Plugin", "PrivacyType.Private") else v16:getText("Plugin", "PrivacyType.Public")
            }), 
            Action = function() --[[ Line: 107 ]] --[[ Name: Action ]]
                -- upvalues: v2 (ref), v6 (ref), v14 (copy), v15 (copy)
                if v2 then
                    v6(v14.Id, v14.PrivacyType);
                    return;
                else
                    v6(v14.Id, v14.PrivacyType, v15);
                    return;
                end;
            end
        } else nil, 
        Archive = if v14.Id then {
            Label = v16:getText("Plugin", "Archive"), 
            Action = function() --[[ Line: 120 ]] --[[ Name: Action ]]
                -- upvalues: v2 (ref), v7 (ref), v14 (copy), l_StartPageManager_0 (ref), v15 (copy)
                if v2 then
                    v7(v14.Id, true);
                    l_StartPageManager_0:removeAPIGameFromRegistry(v14.Id);
                    return;
                else
                    v7(v14.Id, true, v15);
                    return;
                end;
            end
        } else nil, 
        RestoreArchive = if v14.Id then {
            Label = v16:getText("Plugin", "Restore"), 
            Action = function() --[[ Line: 134 ]] --[[ Name: Action ]]
                -- upvalues: v2 (ref), v7 (ref), v14 (copy), v15 (copy)
                if v2 then
                    v7(v14.Id, false);
                    return;
                else
                    v7(v14.Id, false, v15);
                    return;
                end;
            end
        } else nil, 
        RemoveShared = if v14.Id then {
            Label = v16:getText("Plugin", "Remove"), 
            Action = function() --[[ Line: 147 ]] --[[ Name: Action ]]
                -- upvalues: v2 (ref), v8 (ref), v14 (copy), l_StudioService_0 (ref), v15 (copy), l_StartPageManager_0 (ref)
                if v2 then
                    v8(v14.Id, l_StudioService_0:GetUserId());
                else
                    v8(v14.Id, l_StudioService_0:GetUserId(), v15);
                end;
                l_StartPageManager_0:removeAPIGameFromRegistry(v14.Id);
            end
        } else nil, 
        RemoveRecent = if not v12() or v14.Id or v14.FilePath then {
            Label = v16:getText("Plugin", "RemoveFromList"), 
            Action = function() --[[ Line: 163 ]] --[[ Name: Action ]]
                -- upvalues: v14 (copy), v2 (ref), v9 (ref), v15 (copy), v10 (ref), l_StartPageManager_0 (ref)
                if v14.FilePath then
                    if v2 then
                        v9:deleteItem(v14.FilePath);
                    else
                        v15(function(v17) --[[ Line: 168 ]]
                            -- upvalues: v10 (ref), v14 (ref)
                            return v10(v17, function(v18) --[[ Line: 169 ]]
                                -- upvalues: v14 (ref)
                                assert(not v18.IsPlaceholder, "Network data cannot be a placeholder here");
                                return v18.FilePath == v14.FilePath;
                            end);
                        end);
                    end;
                    l_StartPageManager_0:removeLocalFileFromRegistry(v14.FilePath);
                    return;
                else
                    if v14.Id then
                        if v2 then
                            v9:deleteItem((tostring(v14.Id)));
                        else
                            v15(function(v19) --[[ Line: 181 ]]
                                -- upvalues: v10 (ref), v14 (ref)
                                return v10(v19, function(v20) --[[ Line: 182 ]]
                                    -- upvalues: v14 (ref)
                                    assert(not v20.IsPlaceholder, "Network data cannot be a placeholder here");
                                    return v20.Id == v14.Id;
                                end);
                            end);
                        end;
                        l_StartPageManager_0:removeAPIGameFromRegistry(v14.Id);
                    end;
                    return;
                end;
            end
        } else nil
    };
end;
return function(v22) --[[ Line: 196 ]] --[[ Name: ContextMenu ]]
    -- upvalues: v2 (copy), v21 (copy), v1 (copy)
    local v23 = {};
    local v24 = if v2 then v21(v22.Cell) else v21(v22.Cell, v22.SetNetworkResults);
    if v22.KebabMenu and #v22.KebabMenu > 0 then
        for _, v26 in v22.KebabMenu do
            if v24[v26] then
                table.insert(v23, v1.createElement("TextButton", {
                    Size = UDim2.new(0, 153, 0, 28), 
                    Text = v24[v26].Label, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    [v1.Event.Activated] = function() --[[ Line: 215 ]]
                        -- upvalues: v24 (copy), v26 (copy), v22 (copy)
                        v24[v26].Action();
                        v22.OnItemActivated();
                    end, 
                    [v1.Tag] = "X-Fit StartPage-TextColor StartPage-ContextMenuBackground StartPage-RoundedCorner8 StartPage-ContextMenuRowPadding StartPage-Font StartPage-TextSize"
                }));
            end;
        end;
    end;
    return v1.createElement("Frame", {
        Position = v22.Position, 
        Visible = not v22.Hide, 
        [v1.Change.AbsoluteSize] = function(v27) --[[ Line: 228 ]]
            -- upvalues: v22 (copy)
            v22.MenuContainerSizeChanged(v27.AbsoluteSize);
        end, 
        [v1.Tag] = "X-Column X-Fit StartPage-ContextMenuBackground StartPage-RoundedCorner8 StartPage-ContextMenuPadding"
    }, v23);
end;