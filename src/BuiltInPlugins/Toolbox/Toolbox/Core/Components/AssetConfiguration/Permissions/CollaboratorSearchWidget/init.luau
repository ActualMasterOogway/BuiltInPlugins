local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.RoactRodux);
local l_Util_0 = l_Parent_0.Core.Util;
local l_LoadingInProgress_0 = require(l_Util_0.Keys).LoadingInProgress;
local v7 = require(l_Util_0.Urls);
local v8 = require(l_Util_0.Constants);
local v9 = require(l_Util_0.AssetConfigConstants);
local l_Permissions_0 = l_Parent_0.Core.Components.AssetConfiguration.Permissions;
local v11 = require(l_Permissions_0.CollaboratorSearchBar);
local v12 = require(l_Permissions_0.PermissionsConstants);
local v13 = require(l_Permissions_0.CollaboratorThumbnail);
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v16 = require(l_Parent_0.Core.ContextServices.NetworkContext);
local l_UseViewKey_0 = v12.UseViewKey;
local function v23(v18, v19) --[[ Line: 43 ]] --[[ Name: getMatchesFromTable ]]
    -- upvalues: v12 (copy)
    local v20 = {};
    for _, v22 in pairs(v19) do
        if v22[v12.SubjectNameKey]:lower():find(v18:lower(), 1, true) then
            table.insert(v20, v22);
        end;
    end;
    return v20;
end;
local function _(v24) --[[ Line: 55 ]] --[[ Name: getIsLoading ]]
    -- upvalues: l_LoadingInProgress_0 (copy)
    return v24.localUserFriends == l_LoadingInProgress_0;
end;
local function v45(v26, v27, _) --[[ Line: 59 ]] --[[ Name: getMatches ]]
    -- upvalues: v12 (copy), v23 (copy)
    local _ = v26.cachedSearchResults;
    local l_searchText_0 = v26.searchText;
    local function v35(v31, v32) --[[ Line: 63 ]] --[[ Name: compare ]]
        -- upvalues: v12 (ref), l_searchText_0 (copy)
        local v33 = v31[v12.SubjectNameKey]:lower();
        local v34 = v32[v12.SubjectNameKey]:lower();
        if v33 == v34 then
            return false;
        elseif v33 == l_searchText_0:lower() then
            return true;
        elseif v34 == l_searchText_0:lower() then
            return false;
        else
            return v33 < v34;
        end;
    end;
    local v36 = {
        Users = {}
    };
    local v37 = {};
    local v38 = {};
    local v39 = typeof(v26.localUserFriends) == "table" and v23(l_searchText_0, v26.localUserFriends) or {};
    table.sort(v39, v35);
    local v40 = false;
    if #v37 > 0 then
        v40 = v37[1][v12.SubjectNameKey]:lower() == l_searchText_0:lower();
    end;
    local v41 = math.min(v40 and 1 or 2, #v38 + 1);
    for _, v43 in pairs(v39) do
        local v44 = v43[v12.SubjectIdKey];
        if (not v27 or not v27[v12.UserSubjectKey][v44] or v27[v12.UserSubjectKey][v44][v12.ActionKey] == v12.NoAccessKey) and not v37[v44] then
            table.insert(v38, v41, v43);
            v41 = v41 + 1;
        end;
    end;
    v36.Users = v38;
    return v36;
end;
local function v52(v46, v47, v48) --[[ Line: 115 ]] --[[ Name: getResults ]]
    -- upvalues: v12 (copy), v3 (copy), v13 (copy), v7 (copy), v9 (copy)
    local v49 = nil;
    if v46 == "" then
        return {};
    else
        v49 = {
            Users = {
                LayoutOrder = 0
            }
        };
        for _, v51 in pairs(v47.Users) do
            if #v49.Users + 1 <= v12.MaxSearchResultsPerSubjectType then
                table.insert(v49.Users, {
                    Icon = v3.createElement(v13, {
                        Image = v7.constructRBXThumbUrl(v9.rbxThumbTypes.AvatarHeadShot, v51[v12.SubjectIdKey], v9.rbxThumbSizes.AvatarHeadshotImageSize), 
                        Size = UDim2.new(1, 0, 1, 0), 
                        UseMask = true
                    }), 
                    Name = v51[v12.SubjectNameKey], 
                    Key = {
                        Type = v12.UserSubjectKey, 
                        Id = v51[v12.SubjectIdKey], 
                        Name = v51[v12.SubjectNameKey]
                    }
                });
            else
                break;
            end;
        end;
        return {
            [v48:getText("AssetConfigPackagePermissions", "UsersCollaboratorType")] = if #v49.Users > 0 then v49.Users else nil
        };
    end;
end;
local v53 = v3.PureComponent:extend("CollaboratorSearchWidget");
v53.render = function(v54) --[[ Line: 158 ]] --[[ Name: render ]]
    -- upvalues: v45 (copy), l_LoadingInProgress_0 (copy), v12 (copy), v2 (copy), v52 (copy), v3 (copy), v8 (copy), v11 (copy), l_UseViewKey_0 (copy)
    local l_props_0 = v54.props;
    local l_SearchData_0 = l_props_0.SearchData;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_SearchText_0 = l_SearchData_0.SearchText;
    local v59 = v45(l_SearchData_0, l_props_0.Permissions, l_props_0.GroupMetadata);
    local v60 = l_SearchData_0.localUserFriends == l_LoadingInProgress_0;
    local v61 = -1;
    if l_props_0.GroupMetadata then
        for _, _ in pairs(l_props_0.GroupMetadata) do
            v61 = v61 + 1;
        end;
    end;
    if l_props_0.Permissions[v12.UserSubjectKey] then
        for _, _ in pairs(l_props_0.Permissions[v12.UserSubjectKey]) do
            v61 = v61 + 1;
        end;
    end;
    local v66 = v61 >= 200;
    local function v72(v67, v68, v69, v70) --[[ Line: 189 ]] --[[ Name: collaboratorAdded ]]
        -- upvalues: v12 (ref), v2 (ref), l_props_0 (copy)
        local v71 = nil;
        if v67 == v12.UserSubjectKey then
            v71 = v2.Dictionary.join(l_props_0.Permissions, {
                [v67] = v2.Dictionary.join(l_props_0.Permissions[v67], {
                    [v68] = {
                        [v12.SubjectNameKey] = v69, 
                        [v12.SubjectIdKey] = v68, 
                        [v12.ActionKey] = v70
                    }
                })
            });
        elseif v67 == v12.GroupSubjectKey then
            l_props_0.GroupCollaboratorAdded(v68, v69, v70);
        else
            error("Unsupported type: " .. tostring(v67));
        end;
        if v71 then
            l_props_0.PermissionsChanged(v71);
        end;
    end;
    local v73 = v52(l_SearchText_0, v59, l_props_0.Localization);
    local v74 = l_props_0.Localization:getText("AssetConfigPackagePermissions", "TooManyCollaboratorsText", {
        maxNumCollaborators = 200
    });
    return v3.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        UIListLayout = v3.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 24)
        }), 
        Title = v3.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            LayoutOrder = 0, 
            Text = l_props_0.Localization:getText("AssetConfigPackagePermissions", "ShareWith"), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            BackgroundTransparency = 1, 
            Font = v8.FONT, 
            TextSize = v8.FONT_SIZE_TITLE, 
            TextColor3 = l_Stylizer_0.assetConfig.packagePermissions.subTextColor
        }), 
        CollaboratorSearchBar = v3.createElement(v11, {
            LayoutOrder = 1, 
            Enabled = l_props_0.Enabled and not v66, 
            HeaderHeight = 25, 
            ErrorText = v66 and v74 or nil, 
            DefaultText = l_props_0.Localization:getText("AssetConfigPackagePermissions", "SearchbarDefault"), 
            NoResultsText = l_props_0.Localization:getText("AssetConfigPackagePermissions", "NoResults"), 
            LoadingMore = v60, 
            onSearchRequested = function(v75) --[[ Line: 252 ]] --[[ Name: onSearchRequested ]]
                -- upvalues: l_props_0 (copy), v54 (copy)
                l_props_0.SearchRequested(v54.props.Network.networkInterface, v75, true);
            end, 
            onTextChanged = function(v76) --[[ Line: 255 ]] --[[ Name: onTextChanged ]]
                -- upvalues: l_props_0 (copy), v54 (copy)
                l_props_0.SearchRequested(v54.props.Network.networkInterface, v76, false);
            end, 
            OnItemClicked = function(v77) --[[ Line: 258 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: v72 (copy), l_UseViewKey_0 (ref)
                if v77 == nil then
                    print("TODO: enable friends option");
                    return;
                else
                    v72(v77.Type, v77.Id, v77.Name, l_UseViewKey_0);
                    return;
                end;
            end, 
            Results = v73
        })
    });
end;
local function v80(v78, _) --[[ Line: 271 ]] --[[ Name: mapStateToProps ]]
    return {
        SearchData = {
            searchText = v78.searchText, 
            cachedSearchResults = v78.cachedSearchResults, 
            localUserFriends = v78.localUserFriends
        }
    };
end;
v53 = l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Network = v16
})(v53);
return v4.connect(v80)(v53);