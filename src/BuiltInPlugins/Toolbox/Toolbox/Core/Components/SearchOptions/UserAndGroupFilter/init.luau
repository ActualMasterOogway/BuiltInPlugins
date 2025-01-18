local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local l_Pane_0 = v4.UI.Pane;
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local v7 = require(l_Util_0.Constants);
local v8 = require(l_Util_0.debounce);
local l_withContext_0 = v4.ContextServices.withContext;
local v10 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v11 = require(l_script_FirstAncestor_0.Core.Components.SearchOptions.LiveSearchBar);
local v12 = require(l_script_FirstAncestor_0.Core.Components.CreatorPill);
local l_Requests_0 = l_script_FirstAncestor_0.Core.Networking.Requests;
local v14 = require(l_Requests_0.GetManageableGroupsRequest);
local v15 = require(l_Requests_0.UserAndGroupLiveSearchRequest);
local _ = require(l_script_FirstAncestor_0.Core.Types.CreatorTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.GroupTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.SearchOptionsTypes);
local v19 = require(l_script_FirstAncestor_0.Core.Util.SharedFlags.getFFlagToolboxPillsForCreators);
local l_game_FastInt_0 = game:GetFastInt("ToolboxLiveSearchDebounceWait");
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v22 = v2.PureComponent:extend("UserAndGroupFilter");
v22.init = function(v23) --[[ Line: 74 ]] --[[ Name: init ]]
    -- upvalues: v8 (copy), l_game_FastInt_0 (copy)
    v23.getKey = function(v24) --[[ Line: 75 ]]
        return v24.Type.Value .. "_" .. v24.Id;
    end;
    v23.onClickCreatorPill = function(v25, v26) --[[ Line: 79 ]]
        -- upvalues: v23 (copy)
        v23.props.OnDeleteCreatorPill(v25, v26);
    end;
    v23.onSelectCreator = function(v27) --[[ Line: 84 ]]
        -- upvalues: v23 (copy)
        v23.props.OnSelectCreator(v27);
    end;
    v23.debouncedUserGroupSearchRequest = v8(function(v28, _) --[[ Line: 90 ]]
        -- upvalues: v23 (copy)
        local l_props_0 = v23.props;
        l_props_0.userGroupSearchRequest(l_props_0.Network.networkInterface, v28, l_props_0.manageableGroups);
    end, l_game_FastInt_0);
    v23.updateUserSearch = function(v31, v32) --[[ Line: 97 ]]
        -- upvalues: v23 (copy)
        local l_props_1 = v23.props;
        l_props_1.OnSearchUpdate(v31, v32);
        v23.debouncedUserGroupSearchRequest(v31, l_props_1.manageableGroups);
    end;
end;
v22.didMount = function(v34) --[[ Line: 105 ]] --[[ Name: didMount ]]
    local l_props_2 = v34.props;
    l_props_2.getManageableGroups(l_props_2.Network.networkInterface);
end;
v22.render = function(v36) --[[ Line: 110 ]] --[[ Name: render ]]
    -- upvalues: v19 (copy), v2 (copy), v12 (copy), l_LayoutOrderIterator_0 (copy), l_Pane_0 (copy), v11 (copy), v7 (copy)
    local l_props_3 = v36.props;
    local _ = v36.state;
    local v39 = {};
    local v40 = 0;
    for _, v42 in {
        l_props_3.SelectedUsers, 
        l_props_3.SelectedGroups
    } do
        for _, v44 in v42 do
            local v45 = v36.getKey(v44);
            local v46 = if v44.Index then v44.Index else v40;
            v39[v45] = if v19() then v2.createElement(v12, {
                LayoutOrder = v46, 
                CreatorId = v44.Id, 
                CreatorName = if v44.Name then v44.Name else "", 
                CreatorType = v44.Type, 
                OnActivated = function() --[[ Line: 127 ]] --[[ Name: OnActivated ]]
                    -- upvalues: v36 (copy), v46 (copy), v44 (copy)
                    return v36.onClickCreatorPill(v46, v44);
                end
            }) else v2.createElement("TextButton", {
                LayoutOrder = v46, 
                Size = UDim2.fromOffset(70, 20), 
                Text = v44.Name, 
                [v2.Event.Activated] = function() --[[ Line: 135 ]]
                    -- upvalues: v36 (copy), v46 (copy), v44 (copy)
                    return v36.onClickCreatorPill(v46, v44);
                end
            });
            v40 = v40 + 1;
        end;
    end;
    local v47 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_props_3.LayoutOrder, 
        Spacing = 6
    }, {
        LiveSearchBar = v2.createElement(v11, {
            defaultTextKey = "SearchBarCreatorAndGroupText", 
            GetKey = v36.getKey, 
            LayoutOrder = v47:getNextOrder(), 
            OnSelectItem = v36.onSelectCreator, 
            results = l_props_3.CreatorResults, 
            searchTerm = l_props_3.SearchTerm, 
            updateSearch = v36.updateUserSearch, 
            width = v7.SEARCH_BAR_WIDTH
        }), 
        SelectedPills = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v47:getNextOrder(), 
            Spacing = 6
        }, v39)
    });
end;
v22 = l_withContext_0({
    Network = v10
})(v22);
return v3.connect(function(v48, _) --[[ Line: 177 ]] --[[ Name: mapStateToProps ]]
    return {
        manageableGroups = ((v48 or {}).groups or {}).manageableGroups or {}
    };
end, function(v50) --[[ Line: 186 ]]
    -- upvalues: v14 (copy), v15 (copy)
    return {
        getManageableGroups = function(v51) --[[ Line: 188 ]] --[[ Name: getManageableGroups ]]
            -- upvalues: v50 (copy), v14 (ref)
            v50(v14(v51));
        end, 
        userGroupSearchRequest = function(v52, v53, v54) --[[ Line: 192 ]] --[[ Name: userGroupSearchRequest ]]
            -- upvalues: v50 (copy), v15 (ref)
            v50(v15(v52, v53, v54));
        end
    };
end)(v22);