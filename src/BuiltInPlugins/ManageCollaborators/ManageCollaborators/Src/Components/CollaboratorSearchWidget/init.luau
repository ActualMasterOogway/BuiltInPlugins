local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Stylizer_0 = v4.Style.Stylizer;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local v9 = require(l_Parent_0.Src.Util.PermissionsConstants);
local v10 = require(l_Parent_0.Src.Keys.loadingInProgress);
local l_PlayKey_0 = v9.PlayKey;
local l_EditKey_0 = v9.EditKey;
local v13 = require(l_Parent_0.Src.Util.Constants);
local l_COLLABORATORTYPE_USER_0 = v13.COLLABORATORTYPE_USER;
local l_COLLABORATORTYPE_GROUP_0 = v13.COLLABORATORTYPE_GROUP;
local v16 = require(l_Parent_0.Src.Components.Thumbnails.UserHeadshotThumbnail);
local v17 = require(l_Parent_0.Src.Components.Thumbnails.GroupIconThumbnail);
local v18 = require(l_Parent_0.Src.Components.SearchBar);
local v19 = require(l_Parent_0.Src.Util.CreateFitToContent);
local v20 = require(l_Parent_0.Src.Selectors.GetUserCollaborators);
local v21 = require(l_Parent_0.Src.Selectors.GetGroupCollaborators);
local v22 = require(l_Parent_0.Src.Thunks.AddUserCollaborator);
local v23 = require(l_Parent_0.Src.Thunks.AddGroupCollaborator);
local v24 = require(l_Parent_0.Src.Thunks.SearchCollaborators);
local v25 = require(l_Parent_0.Src.Thunks.PermissionsLoader);
local v26 = require(l_Parent_0.Src.Selectors.IsGroupGame);
local v27 = require(l_Parent_0.Src.Selectors.IsGame17Plus);
local v28 = v19("Frame", "UIListLayout", {
    SortOrder = Enum.SortOrder.LayoutOrder, 
    Padding = UDim.new(0, 32), 
    HorizontalAlignment = Enum.HorizontalAlignment.Center
});
local v29 = v1.PureComponent:extend("CollaboratorSearchWidget");
v29.isLoading = function(v30) --[[ Line: 47 ]] --[[ Name: isLoading ]]
    -- upvalues: v10 (copy)
    local l_SearchData_0 = v30.props.SearchData;
    local l_CachedSearchResults_0 = l_SearchData_0.CachedSearchResults;
    local l_SearchText_0 = l_SearchData_0.SearchText;
    local v34 = true;
    if l_SearchData_0.LocalUserGroups ~= v10 then
        v34 = true;
        if l_SearchData_0.LocalUserFriends ~= v10 then
            v34 = true;
            if l_CachedSearchResults_0[l_SearchText_0] ~= v10 then
                v34 = false;
                if l_CachedSearchResults_0[l_SearchText_0] == nil then
                    v34 = l_SearchText_0 ~= "";
                end;
            end;
        end;
    end;
    return v34;
end;
v29.isFriend = function(v35, v36) --[[ Line: 60 ]] --[[ Name: isFriend ]]
    local l_props_0 = v35.props;
    local l_ownerType_0 = l_props_0.ownerType;
    local l_ownerFriends_0 = l_props_0.ownerFriends;
    if l_ownerType_0 == Enum.CreatorType.User then
        for _, v41 in ipairs(l_ownerFriends_0) do
            if v41 == v36 then
                return true;
            end;
        end;
    end;
    return false;
end;
v29.getMatches = function(v42) --[[ Line: 77 ]] --[[ Name: getMatches ]]
    -- upvalues: v10 (copy), v9 (copy)
    local l_props_1 = v42.props;
    local l_SearchData_1 = l_props_1.SearchData;
    local l_UserCollaborators_0 = l_props_1.UserCollaborators;
    local l_GroupCollaborators_0 = l_props_1.GroupCollaborators;
    local l_CachedSearchResults_1 = l_SearchData_1.CachedSearchResults;
    local l_SearchText_1 = l_SearchData_1.SearchText;
    local v49 = {};
    for _, v51 in ipairs(l_UserCollaborators_0) do
        v49[v51] = true;
    end;
    local function _(v52) --[[ Line: 91 ]] --[[ Name: userAlreadyCollaborator ]]
        -- upvalues: v49 (copy)
        return v49[v52] ~= nil;
    end;
    local v54 = {};
    for _, v56 in ipairs(l_GroupCollaborators_0) do
        v54[v56] = true;
    end;
    local function _(v57) --[[ Line: 99 ]] --[[ Name: groupAlreadyCollaborator ]]
        -- upvalues: v54 (copy)
        return v54[v57] ~= nil;
    end;
    local v59 = {
        Users = {}, 
        Groups = {}
    };
    if l_CachedSearchResults_1[l_SearchText_1] and l_CachedSearchResults_1[l_SearchText_1] ~= v10 then
        local v60 = l_CachedSearchResults_1[l_SearchText_1][v9.UserSubjectKey];
        local v61 = l_CachedSearchResults_1[l_SearchText_1][v9.GroupSubjectKey];
        local v62 = {};
        for _, v64 in pairs(v60) do
            if not (v49[v64[v9.SubjectIdKey]] ~= nil) then
                table.insert(v62, v64);
            end;
        end;
        local v65 = {};
        for _, v67 in pairs(v61) do
            if not (v54[v67[v9.GroupIdKey]] ~= nil) then
                table.insert(v65, v67);
            end;
        end;
        v59.Users = v62;
        v59.Groups = v65;
    end;
    return v59;
end;
v29.getResults = function(v68) --[[ Line: 130 ]] --[[ Name: getResults ]]
    -- upvalues: v9 (copy), v1 (copy), v16 (copy), l_COLLABORATORTYPE_USER_0 (copy), v17 (copy), l_COLLABORATORTYPE_GROUP_0 (copy)
    local l_props_2 = v68.props;
    local l_SearchData_2 = l_props_2.SearchData;
    local l_IsGroupGame_0 = l_props_2.IsGroupGame;
    if l_SearchData_2.SearchText == "" then
        return {};
    else
        local v72 = v68:getMatches();
        local v73 = {};
        local l_MaxSearchResultsPerSubjectTypeUsers_0 = v9.MaxSearchResultsPerSubjectTypeUsers;
        local l_MaxSearchResultsPerSubjectTypeGroups_0 = v9.MaxSearchResultsPerSubjectTypeGroups;
        local v76 = v9.MaxSearchResultsPerSubjectTypeUsers - #v72.Users;
        local v77 = v9.MaxSearchResultsPerSubjectTypeGroups - #v72.Groups;
        if v77 > 0 then
            local v78 = false;
            if v77 > 0 then
                v78 = v9.MaxSearchResultsPerSubjectTypeUsers + v77;
            end;
            l_MaxSearchResultsPerSubjectTypeUsers_0 = v78;
        end;
        if v76 > 0 then
            local v79 = false;
            if v76 > 0 then
                v79 = v9.MaxSearchResultsPerSubjectTypeGroups + v76;
            end;
            l_MaxSearchResultsPerSubjectTypeGroups_0 = v79;
        end;
        if #v72.Users > 0 then
            local v80 = {};
            local v81 = {};
            for _, v83 in pairs(v72.Users) do
                if l_MaxSearchResultsPerSubjectTypeUsers_0 >= #v80 + #v81 + 1 then
                    local v84 = v83[v9.SubjectIdKey];
                    local v85 = {
                        Icon = v1.createElement(v16, {
                            Id = v84, 
                            Size = UDim2.new(1, 0, 1, 0)
                        }), 
                        Name = v83[v9.SubjectNameKey], 
                        Key = {
                            Type = v9.UserSubjectKey, 
                            Id = v84, 
                            Name = v83[v9.SubjectNameKey], 
                            IsEligible = v83[v9.IsEligibleKey], 
                            EligibilityText = v83[v9.EligibilityTextKey]
                        }
                    };
                    if v68:isFriend(v84) then
                        v85.IsFriend = true;
                        table.insert(v80, v85);
                    else
                        table.insert(v81, v85);
                    end;
                else
                    break;
                end;
            end;
            for _, v87 in v81 do
                table.insert(v80, v87);
            end;
            v80.LayoutOrder = 0;
            v73[l_COLLABORATORTYPE_USER_0] = v80;
        end;
        if #v72.Groups > 0 and not l_IsGroupGame_0 then
            local v88 = {};
            for _, v90 in pairs(v72.Groups) do
                if l_MaxSearchResultsPerSubjectTypeGroups_0 >= #v88 + 1 then
                    table.insert(v88, {
                        Icon = v1.createElement(v17, {
                            Id = v90[v9.GroupIdKey], 
                            Size = UDim2.new(1, 0, 1, 0)
                        }), 
                        Name = v90[v9.GroupNameKey], 
                        Key = {
                            Type = v9.GroupSubjectKey, 
                            Id = v90[v9.GroupIdKey], 
                            Name = v90[v9.GroupNameKey], 
                            IsEligible = true
                        }
                    });
                else
                    break;
                end;
            end;
            v88.LayoutOrder = 0;
            v73[l_COLLABORATORTYPE_GROUP_0] = v88;
        end;
        return v73;
    end;
end;
v29.render = function(v91) --[[ Line: 236 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v28 (copy), v3 (copy), v18 (copy), v9 (copy), l_EditKey_0 (copy), l_PlayKey_0 (copy)
    local l_props_3 = v91.props;
    local l_LayoutOrder_0 = l_props_3.LayoutOrder;
    local l_Writable_0 = l_props_3.Writable;
    local l_UserCollaborators_1 = l_props_3.UserCollaborators;
    local l_AddUserCollaborator_0 = l_props_3.AddUserCollaborator;
    local l_AddGroupCollaborator_0 = l_props_3.AddGroupCollaborator;
    local l_SearchCollaborators_0 = l_props_3.SearchCollaborators;
    local l_IsGroupGame_1 = l_props_3.IsGroupGame;
    local l_Is17PlusGame_0 = l_props_3.Is17PlusGame;
    local l_Stylizer_1 = l_props_3.Stylizer;
    local l_Localization_1 = l_props_3.Localization;
    local v103 = v91:getResults();
    local v104 = v91:isLoading();
    local v105 = #l_UserCollaborators_1;
    local l_game_FastInt_0 = game:GetFastInt("TeamCreateMaxCollaborators");
    local v107 = l_game_FastInt_0 <= v105;
    local v108 = l_Localization_1:getText("SearchBar", "TooManyResultsText", {
        maxNumCollaborators = l_game_FastInt_0
    });
    local v109 = if l_IsGroupGame_1 then l_Localization_1:getText("SearchBar", "AgeWarningGroups") else l_Localization_1:getText("SearchBar", "AgeWarningUsers");
    return v1.createElement(v28, {
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        Padding = v1.createElement("UIPadding", {
            PaddingTop = l_Stylizer_1.searchWidget.paddingTop, 
            PaddingLeft = l_Stylizer_1.searchWidget.paddingHorizontal, 
            PaddingRight = l_Stylizer_1.searchWidget.paddingHorizontal
        }), 
        AgeWarningFrame = l_Is17PlusGame_0 and v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = 1, 
            Size = UDim2.new(1, 0, 0, l_Stylizer_1.searchWidget.ageWarning.Height), 
            BorderSizePixel = 0
        }, {
            AgeWarning = v1.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_1.searchWidget.ageWarning.fontStyle, {
                Text = v109, 
                TextXAlignment = Enum.TextXAlignment.Left
            }))
        }), 
        Searchbar = v1.createElement(v18, {
            LayoutOrder = 2, 
            Enabled = l_Writable_0 and not v107, 
            HeaderHeight = l_Stylizer_1.searchBar.headerHeight, 
            ItemHeight = l_Stylizer_1.searchBar.itemHeight, 
            ErrorText = v107 and v108 or nil, 
            DefaultText = l_Localization_1:getText("SearchBar", l_IsGroupGame_1 and "AddUsers" or "AddUsersGroups"), 
            NoResultsText = l_Localization_1:getText("SearchBar", "NoResultsText"), 
            LoadingMore = v104, 
            IsGroupGame = l_IsGroupGame_1, 
            onSearchRequested = function(v110) --[[ Line: 304 ]] --[[ Name: onSearchRequested ]]
                -- upvalues: l_SearchCollaborators_0 (copy)
                l_SearchCollaborators_0(v110, true);
            end, 
            onTextChanged = function(v111) --[[ Line: 307 ]] --[[ Name: onTextChanged ]]
                -- upvalues: l_SearchCollaborators_0 (copy)
                l_SearchCollaborators_0(v111, false);
            end, 
            OnItemClicked = function(v112) --[[ Line: 310 ]] --[[ Name: OnItemClicked ]]
                -- upvalues: l_props_3 (copy), v9 (ref), v91 (copy), l_AddUserCollaborator_0 (copy), l_EditKey_0 (ref), l_PlayKey_0 (ref), l_AddGroupCollaborator_0 (copy)
                l_props_3.LoadFriends();
                if v112.Type == v9.UserSubjectKey and v112.IsEligible then
                    if v91:isFriend(v112.Id) then
                        l_AddUserCollaborator_0(v112.Id, v112.Name, l_EditKey_0);
                        return;
                    else
                        l_AddUserCollaborator_0(v112.Id, v112.Name, l_PlayKey_0);
                        return;
                    end;
                elseif v112.Type == v9.GroupSubjectKey then
                    l_AddGroupCollaborator_0(v112.Id, l_PlayKey_0);
                    return;
                else
                    assert(false);
                    return;
                end;
            end, 
            Results = v103, 
            Is17PlusGame = l_Is17PlusGame_0
        })
    });
end;
v29 = l_withContext_0({
    Stylizer = l_Stylizer_0, 
    Localization = l_Localization_0, 
    Mouse = l_ContextServices_0.Mouse
})(v29);
return (v2.connect(function(v113, _) --[[ Line: 340 ]]
    -- upvalues: v20 (copy), v21 (copy), v3 (copy), v26 (copy), v27 (copy)
    local v115, v116 = v20(v113);
    local v117, v118 = v21(v113);
    local v119 = v3.Dictionary.join(v115, v116);
    local v120 = v3.Dictionary.join(v117, v118);
    return {
        IsGroupGame = v26(v113), 
        Is17PlusGame = v27(v113), 
        UserCollaborators = v119, 
        GroupCollaborators = v120, 
        SearchData = v113.CollaboratorSearch, 
        ownerType = v113.GameOwnerMetadata.creatorType, 
        ownerFriends = v113.GameOwnerMetadata.creatorFriends
    };
end, function(v121) --[[ Line: 356 ]]
    -- upvalues: v22 (copy), v23 (copy), v24 (copy), v25 (copy)
    return {
        AddUserCollaborator = function(...) --[[ Line: 358 ]] --[[ Name: AddUserCollaborator ]]
            -- upvalues: v121 (copy), v22 (ref)
            v121(v22(...));
        end, 
        AddGroupCollaborator = function(...) --[[ Line: 361 ]] --[[ Name: AddGroupCollaborator ]]
            -- upvalues: v121 (copy), v23 (ref)
            v121(v23(...));
        end, 
        SearchCollaborators = function(...) --[[ Line: 364 ]] --[[ Name: SearchCollaborators ]]
            -- upvalues: v121 (copy), v24 (ref)
            v121(v24(...));
        end, 
        LoadFriends = function() --[[ Line: 367 ]] --[[ Name: LoadFriends ]]
            -- upvalues: v121 (copy), v25 (ref)
            v121(v25:LoadFriends());
        end
    };
end)(v29));