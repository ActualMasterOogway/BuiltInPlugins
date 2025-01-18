local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local v3 = require(script.Parent.Parent.contains);
local v4 = require(script.Parent.Parent.Util.Immutable);
local v5 = require(script.Parent.MainView);
local v6 = require(script.Parent.Parent.Constants);
local v7 = v1.Component:extend("Gui");
v7.init = function(v8) --[[ Line: 16 ]] --[[ Name: init ]]
    v8.state = {
        GroupRenaming = "", 
        GroupRenameDialogOpen = false, 
        Theme = "", 
        UISelectedGroupId = "", 
        InPlayMode = false
    };
    v8.state.Groups = v8:GetGroups();
end;
v7.setStateAndRefresh = function(v9, v10) --[[ Line: 27 ]] --[[ Name: setStateAndRefresh ]]
    -- upvalues: v4 (copy)
    local v11 = v4.JoinDictionaries(v9.state, v10);
    v9:setState(v4.Set(v10, "Groups", v9:GetGroups(v11)));
end;
local _ = function(v12) --[[ Line: 32 ]] --[[ Name: getNonVirtualGroupCount ]]
    local v13 = 0;
    for _, v15 in v12 do
        if not v15.Virtual then
            v13 = v13 + 1;
        end;
    end;
    return v13;
end;
v7.GetGroups = function(v17, v18) --[[ Line: 42 ]] --[[ Name: GetGroups ]]
    -- upvalues: v3 (copy), v6 (copy)
    if v18 == nil then
        v18 = {};
    end;
    local l_plugin_0 = v17.props.plugin;
    local l_l_plugin_0_Item_0 = l_plugin_0:GetItem("Groups");
    if l_l_plugin_0_Item_0 == nil then
        l_l_plugin_0_Item_0 = {};
    end;
    local l_l_plugin_0_Item_1 = l_plugin_0:GetItem("SelectedGroupIds");
    if l_l_plugin_0_Item_1 == nil then
        l_l_plugin_0_Item_1 = {};
    end;
    for _, v23 in pairs(l_l_plugin_0_Item_0) do
        v23.Renaming = v18.GroupRenaming == v23.Name;
        v23.UISelected = v18.UISelectedGroupId == v23.Id;
        v23.Selected = v3(l_l_plugin_0_Item_1, v23.Id);
        v23.OnDeleted = function() --[[ Line: 61 ]]
            -- upvalues: v18 (ref), v17 (copy), v23 (copy), l_plugin_0 (copy)
            if v18.InPlayMode then
                v17.props.OnAttemptModifyInPlayMode();
                return;
            elseif v23.Name == "Default" then
                return;
            else
                l_plugin_0:Invoke("DeleteCollisionGroup", v23.Name);
                return;
            end;
        end;
        v23.OnRenamed = function(v24) --[[ Line: 72 ]]
            -- upvalues: v18 (ref), v17 (copy), v23 (copy), l_plugin_0 (copy)
            if v18.InPlayMode then
                v17.props.OnAttemptModifyInPlayMode();
                return;
            elseif v23.Name == "Default" then
                return;
            elseif v24 then
                v17:setStateAndRefresh({
                    GroupRenameDialogOpen = true
                });
                local v25 = {
                    oldName = v23.Name, 
                    newName = v24
                };
                l_plugin_0:Invoke("RenameCollisionGroup", v25);
                return;
            elseif v17.state.GroupRenaming == "" then
                v17:setStateAndRefresh({
                    GroupRenaming = v23.Name
                });
                return;
            else
                v17:setStateAndRefresh({
                    GroupRenaming = ""
                });
                return;
            end;
        end;
        v23.OnMembershipSet = function() --[[ Line: 95 ]]
            -- upvalues: v18 (ref), v17 (copy), l_plugin_0 (copy), v23 (copy)
            if v18.InPlayMode then
                v17.props.OnAttemptModifyInPlayMode();
                return;
            else
                l_plugin_0:Invoke("AddSelectedPartsToCollisionGroup", v23.Name);
                return;
            end;
        end;
        v23.OnSelected = function(_) --[[ Line: 103 ]]
            -- upvalues: v23 (copy), l_plugin_0 (copy), v17 (copy)
            if v23.Name ~= "Default" then
                l_plugin_0:Invoke("SelectPartsInCollisionGroup", v23.Name);
            end;
            v17:setStateAndRefresh({
                UISelectedGroupId = v23.Id
            });
        end;
        v23.GetCollidesWith = function(v27) --[[ Line: 110 ]]
            -- upvalues: v23 (copy)
            for _, v29 in pairs(v23.Collisions) do
                if v29.Name == v27.Name then
                    return v29.Collides;
                end;
            end;
        end;
        v23.ToggleCollidesWith = function(v30) --[[ Line: 118 ]]
            -- upvalues: v23 (copy), l_l_plugin_0_Item_0 (ref), v6 (ref), v17 (copy), v18 (ref), l_plugin_0 (copy)
            if v23.Virtual or v30.Virtual then
                local l_l_l_plugin_0_Item_0_0 = l_l_plugin_0_Item_0;
                local v32 = 0;
                for _, v34 in l_l_l_plugin_0_Item_0_0 do
                    if not v34.Virtual then
                        v32 = v32 + 1;
                    end;
                end;
                if v32 == v6.GroupCountMax then
                    v17.props.OnCannotConfigureSelection();
                    return;
                end;
            end;
            if v18.InPlayMode then
                v17.props.OnAttemptModifyInPlayMode();
                return;
            else
                local v35 = {
                    groupName = v23.Name, 
                    otherGroupName = v30.Name
                };
                l_plugin_0:Invoke("ToggleCollidesWith", v35);
                return;
            end;
        end;
    end;
    return l_l_plugin_0_Item_0;
end;
v7.shouldUpdate = function(v36, v37, v38) --[[ Line: 140 ]] --[[ Name: shouldUpdate ]]
    local v39 = false;
    local v40 = false;
    local v41 = false;
    if v37 ~= v36.props then
        return true;
    elseif #v38.Groups ~= #v36.state.Groups then
        return true;
    else
        local function _(v42, v43, v44) --[[ Line: 152 ]] --[[ Name: different ]]
            for v45, v46 in v42 do
                if v45 ~= v44 and v46 ~= v43[v45] then
                    return true;
                end;
            end;
            return false;
        end;
        local l_state_0 = v36.state;
        local v49;
        for v50, v51 in v38 do
            if v50 ~= "Groups" and v51 ~= l_state_0[v50] then
                v49 = true;
                v39 = true;
            end;
            if v39 then
                break;
            end;
        end;
        if not v39 then
            v49 = false;
        end;
        v39 = false;
        if not v49 then
            for v52, v53 in v36.state do
                if v52 ~= "Groups" and v53 ~= v38[v52] then
                    v49 = true;
                    v40 = true;
                end;
                if v40 then
                    break;
                end;
            end;
            if not v40 then
                v49 = false;
            end;
            v40 = false;
            if not v49 then
                for v54, v55 in v38.Groups do
                    local v56 = v36.state.Groups[v54];
                    if v56.Name ~= v55.Name or v56.Id ~= v55.Id then
                        return true;
                    elseif #v56.Collisions ~= #v55.Collisions then
                        return true;
                    elseif v56.Selected ~= v55.Selected then
                        return true;
                    else
                        for v57, v58 in v55.Collisions do
                            local v59 = v56.Collisions[v57];
                            local v60;
                            for v61, v62 in v58 do
                                if v61 ~= nil and v62 ~= v59[v61] then
                                    v60 = true;
                                    v41 = true;
                                end;
                                if v41 then
                                    break;
                                end;
                            end;
                            if not v41 then
                                v60 = false;
                            end;
                            v41 = false;
                            if v60 then
                                return true;
                            end;
                        end;
                    end;
                end;
                return false;
            end;
        end;
        return true;
    end;
end;
v7.render = function(v63) --[[ Line: 195 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v5 (copy)
    local v64 = v63.props.Plugin:get();
    return v1.createElement(v5, {
        Groups = v63.state.Groups, 
        GroupRenameDialogOpen = v63.state.GroupRenameDialogOpen, 
        OnGroupRenameDialogClosed = function() --[[ Line: 203 ]] --[[ Name: OnGroupRenameDialogClosed ]]
            -- upvalues: v63 (copy)
            v63:setState({
                GroupRenameDialogOpen = false
            });
        end, 
        OnGroupAdded = function(v65) --[[ Line: 207 ]] --[[ Name: OnGroupAdded ]]
            -- upvalues: v63 (copy), v64 (copy)
            if v63.state.InPlayMode then
                v63.props.OnAttemptModifyInPlayMode();
                return;
            else
                v64:Invoke("CreateCollisionGroup", v65);
                return;
            end;
        end, 
        OnGroupDeleted = function() --[[ Line: 214 ]] --[[ Name: OnGroupDeleted ]]
            -- upvalues: v63 (copy)
            for _, v67 in pairs(v63.state.Groups) do
                if v67.Id == v63.state.UISelectedGroupId then
                    v67.OnDeleted();
                    return;
                end;
            end;
        end, 
        OnGroupRenamed = function() --[[ Line: 222 ]] --[[ Name: OnGroupRenamed ]]
            -- upvalues: v63 (copy)
            for _, v69 in pairs(v63.state.Groups) do
                if v69.Id == v63.state.UISelectedGroupId then
                    v69.OnRenamed();
                    return;
                end;
            end;
        end
    });
end;
v7.didMount = function(v70) --[[ Line: 233 ]] --[[ Name: didMount ]]
    v70:setState({
        plugin = v70.props.Plugin:get()
    });
    v70.setStateAndRefreshConnection = v70.props.plugin:OnInvoke("SetStateAndRefresh", function(v71) --[[ Line: 235 ]]
        -- upvalues: v70 (copy)
        if v71 == nil then
            v71 = {};
        end;
        v70:setStateAndRefresh(v71);
    end);
    v70.setStateAndRefreshConnection.Name = "setStateAndRefresh";
end;
v7.willUnmount = function(v72) --[[ Line: 244 ]] --[[ Name: willUnmount ]]
    v72.setStateAndRefreshConnection:Disconnect();
end;
return (l_ContextServices_0.withContext({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v7));