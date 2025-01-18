local l_Parent_0 = script.Parent.Parent;
require(l_Parent_0.Common.commonInit)();
local l_PhysicsService_0 = game:GetService("PhysicsService");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v3 = require(l_Parent_0.Plugin.getSelectedParts);
local v4 = require(l_Parent_0.Plugin.getPartsInGroup);
local v5 = require(l_Parent_0.Plugin.getGroups);
local v6 = require(l_Parent_0.Plugin.getSelectedGroupIds);
local v7 = game:GetService("StudioService"):HasInternalPermission();
local v8 = nil;
local v9 = nil;
local function _(v10) --[[ Line: 30 ]] --[[ Name: getNamesChanged ]]
    -- upvalues: v9 (ref)
    for v11 = 1, #v10 do
        local v12 = v9[v11];
        local v13 = v10[v11];
        if v12.name ~= v13.name then
            return true;
        end;
    end;
    return false;
end;
v8 = function() --[[ Line: 41 ]]
    -- upvalues: v9 (ref), l_PhysicsService_0 (copy)
    local v15 = false;
    if not v9 then
        v9 = l_PhysicsService_0:GetRegisteredCollisionGroups();
        return false;
    else
        local l_l_PhysicsService_0_RegisteredCollisionGroups_0 = l_PhysicsService_0:GetRegisteredCollisionGroups();
        local v17 = false;
        if #l_l_PhysicsService_0_RegisteredCollisionGroups_0 ~= #v9 then
            v17 = true;
        end;
        if not v17 then
            local v18;
            for v19 = 1, #l_l_PhysicsService_0_RegisteredCollisionGroups_0 do
                local v20 = v9[v19];
                local v21 = l_l_PhysicsService_0_RegisteredCollisionGroups_0[v19];
                if v20.name ~= v21.name then
                    v18 = true;
                    v15 = true;
                end;
                if v15 then
                    break;
                end;
            end;
            if not v15 then
                v18 = false;
            end;
            v15 = false;
            if v18 then
                v17 = true;
            end;
        end;
        v9 = l_l_PhysicsService_0_RegisteredCollisionGroups_0;
        return v17;
    end;
end;
local function _() --[[ Line: 62 ]] --[[ Name: UpdateGroupsAndSelectedGroups ]]
    -- upvalues: v5 (copy), v6 (copy)
    local v22 = v5();
    local v23 = v6(v22);
    plugin:SetItem("Groups", v22);
    plugin:SetItem("SelectedGroupIds", v23);
end;
local function _(v25) --[[ Line: 71 ]] --[[ Name: SetStateAndRefresh ]]
    -- upvalues: v5 (copy), v6 (copy)
    local v26 = v5();
    local v27 = v6(v26);
    plugin:SetItem("Groups", v26);
    plugin:SetItem("SelectedGroupIds", v27);
    plugin:Invoke("SetStateAndRefresh", v25);
end;
local v29 = {};
local function v39() --[[ Line: 80 ]] --[[ Name: bindToAssetDMEvents ]]
    -- upvalues: v29 (copy), v5 (copy), v6 (copy), l_ChangeHistoryService_0 (copy)
    table.insert(v29, game:GetService("Selection").SelectionChanged:Connect(function() --[[ Line: 84 ]]
        -- upvalues: v5 (ref), v6 (ref)
        local v30 = {};
        local v31 = v5();
        local v32 = v6(v31);
        plugin:SetItem("Groups", v31);
        plugin:SetItem("SelectedGroupIds", v32);
        plugin:Invoke("SetStateAndRefresh", v30);
    end));
    table.insert(v29, l_ChangeHistoryService_0.OnUndo:Connect(function() --[[ Line: 91 ]]
        -- upvalues: v5 (ref), v6 (ref)
        local v33 = {};
        local v34 = v5();
        local v35 = v6(v34);
        plugin:SetItem("Groups", v34);
        plugin:SetItem("SelectedGroupIds", v35);
        plugin:Invoke("SetStateAndRefresh", v33);
    end));
    table.insert(v29, l_ChangeHistoryService_0.OnRedo:Connect(function() --[[ Line: 98 ]]
        -- upvalues: v5 (ref), v6 (ref)
        local v36 = {};
        local v37 = v5();
        local v38 = v6(v37);
        plugin:SetItem("Groups", v37);
        plugin:SetItem("SelectedGroupIds", v38);
        plugin:Invoke("SetStateAndRefresh", v36);
    end));
end;
local _ = function() --[[ Line: 104 ]] --[[ Name: unbindFromAssetDmEvents ]]
    -- upvalues: v29 (copy)
    for _, v41 in ipairs(v29) do
        v41:Disconnect();
    end;
end;
local _ = function(v43) --[[ Line: 111 ]] --[[ Name: ensureGroupExists ]]
    -- upvalues: l_PhysicsService_0 (copy)
    if l_PhysicsService_0:IsCollisionGroupRegistered(v43) then
        return true;
    else
        local l_status_0, _ = pcall(l_PhysicsService_0.RegisterCollisionGroup, l_PhysicsService_0, v43);
        return l_status_0;
    end;
end;
local v47 = {};
local function v85() --[[ Line: 122 ]] --[[ Name: bindToPluginEvents ]]
    -- upvalues: v47 (copy), v39 (copy), v5 (copy), v6 (copy), v29 (copy), l_ChangeHistoryService_0 (copy), l_PhysicsService_0 (copy), v4 (copy), v3 (copy)
    table.insert(v47, plugin:OnInvoke("WindowEnabledChanged", function(v48) --[[ Line: 126 ]]
        -- upvalues: v39 (ref), v5 (ref), v6 (ref), v29 (ref)
        if v48 then
            v39();
            local v49 = {};
            local v50 = v5();
            local v51 = v6(v50);
            plugin:SetItem("Groups", v50);
            plugin:SetItem("SelectedGroupIds", v51);
            plugin:Invoke("SetStateAndRefresh", v49);
            return;
        else
            for _, v53 in ipairs(v29) do
                v53:Disconnect();
            end;
            return;
        end;
    end));
    table.insert(v47, plugin:OnInvoke("DeleteCollisionGroup", function(v54) --[[ Line: 138 ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), l_PhysicsService_0 (ref), v5 (ref), v6 (ref)
        l_ChangeHistoryService_0:SetWaypoint("Deleting collision group");
        l_PhysicsService_0:UnregisterCollisionGroup(v54);
        l_ChangeHistoryService_0:SetWaypoint("Deleted collision group");
        local v55 = {};
        local v56 = v5();
        local v57 = v6(v56);
        plugin:SetItem("Groups", v56);
        plugin:SetItem("SelectedGroupIds", v57);
        plugin:Invoke("SetStateAndRefresh", v55);
    end));
    table.insert(v47, plugin:OnInvoke("RenameCollisionGroup", function(v58) --[[ Line: 148 ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), l_PhysicsService_0 (ref), v4 (ref), v5 (ref), v6 (ref)
        l_ChangeHistoryService_0:SetWaypoint("Renaming collision group");
        l_PhysicsService_0:RenameCollisionGroup(v58.oldName, v58.newName);
        for _, v60 in pairs(v4(v58.oldName)) do
            if v60.CollisionGroup == v58.oldName then
                v60.CollisionGroup = v58.newName;
            end;
        end;
        l_ChangeHistoryService_0:SetWaypoint("Renamed collision group");
        local v61 = {
            GroupRenaming = ""
        };
        local v62 = v5();
        local v63 = v6(v62);
        plugin:SetItem("Groups", v62);
        plugin:SetItem("SelectedGroupIds", v63);
        plugin:Invoke("SetStateAndRefresh", v61);
    end));
    table.insert(v47, plugin:OnInvoke("AddSelectedPartsToCollisionGroup", function(v64) --[[ Line: 163 ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), v3 (ref), v5 (ref), v6 (ref)
        l_ChangeHistoryService_0:SetWaypoint("Setting part membership to collision group");
        for _, v66 in pairs(v3()) do
            v66.CollisionGroup = v64;
        end;
        l_ChangeHistoryService_0:SetWaypoint("Set part membership to collision group");
        local v67 = {};
        local v68 = v5();
        local v69 = v6(v68);
        plugin:SetItem("Groups", v68);
        plugin:SetItem("SelectedGroupIds", v69);
        plugin:Invoke("SetStateAndRefresh", v67);
    end));
    table.insert(v47, plugin:OnInvoke("ToggleCollidesWith", function(v70) --[[ Line: 175 ]]
        -- upvalues: l_PhysicsService_0 (ref), l_ChangeHistoryService_0 (ref), v5 (ref), v6 (ref)
        local l_groupName_0 = v70.groupName;
        local v72;
        if l_PhysicsService_0:IsCollisionGroupRegistered(l_groupName_0) then
            v72 = true;
        else
            local l_status_1, _ = pcall(l_PhysicsService_0.RegisterCollisionGroup, l_PhysicsService_0, l_groupName_0);
            v72 = l_status_1;
        end;
        if v72 then
            l_groupName_0 = v70.otherGroupName;
            if l_PhysicsService_0:IsCollisionGroupRegistered(l_groupName_0) then
                v72 = true;
            else
                local l_status_2, _ = pcall(l_PhysicsService_0.RegisterCollisionGroup, l_PhysicsService_0, l_groupName_0);
                v72 = l_status_2;
            end;
        end;
        if not v72 then
            warn((("Could not toggle collision between \"%*\" and \"%*\""):format(v70.groupName, v70.otherGroupName)));
            return;
        else
            l_groupName_0 = not l_PhysicsService_0:CollisionGroupsAreCollidable(v70.groupName, v70.otherGroupName);
            l_ChangeHistoryService_0:SetWaypoint("Setting group collision state");
            l_PhysicsService_0:CollisionGroupSetCollidable(v70.groupName, v70.otherGroupName, l_groupName_0);
            l_ChangeHistoryService_0:SetWaypoint("Set group collision state");
            local v77 = {};
            local v78 = v5();
            local v79 = v6(v78);
            plugin:SetItem("Groups", v78);
            plugin:SetItem("SelectedGroupIds", v79);
            plugin:Invoke("SetStateAndRefresh", v77);
            return;
        end;
    end));
    table.insert(v47, plugin:OnInvoke("CreateCollisionGroup", function(v80) --[[ Line: 208 ]]
        -- upvalues: l_ChangeHistoryService_0 (ref), l_PhysicsService_0 (ref), v5 (ref), v6 (ref)
        l_ChangeHistoryService_0:SetWaypoint("Creating collision group");
        l_PhysicsService_0:RegisterCollisionGroup(v80);
        l_ChangeHistoryService_0:SetWaypoint("Created collision group");
        local v81 = {};
        local v82 = v5();
        local v83 = v6(v82);
        plugin:SetItem("Groups", v82);
        plugin:SetItem("SelectedGroupIds", v83);
        plugin:Invoke("SetStateAndRefresh", v81);
    end));
    table.insert(v47, plugin:OnInvoke("SelectPartsInCollisionGroup", function(v84) --[[ Line: 218 ]]
        -- upvalues: v4 (ref)
        game:GetService("Selection"):Set(v4(v84));
    end));
end;
local _ = function() --[[ Line: 224 ]] --[[ Name: unbindFromPluginEvents ]]
    -- upvalues: v47 (copy)
    for _, v87 in ipairs(v47) do
        v87:Disconnect();
    end;
end;
local v89 = false;
local function _() --[[ Line: 232 ]] --[[ Name: pollForCollisionGroupChanges ]]
    -- upvalues: v89 (ref), v8 (ref)
    v89 = true;
    spawn(function() --[[ Line: 236 ]]
        -- upvalues: v89 (ref), v8 (ref)
        while v89 do
            if v8() then
                plugin:Invoke("SetStateAndRefresh", nil);
            end;
            wait(1);
        end;
    end);
end;
local function _() --[[ Line: 246 ]] --[[ Name: stopPollingForCollisionGroupChanges ]]
    -- upvalues: v89 (ref)
    v89 = false;
end;
local v92 = nil;
local function v99() --[[ Line: 253 ]] --[[ Name: bindToCurrentDM ]]
    -- upvalues: v5 (copy), v6 (copy), v89 (ref), v8 (ref), v85 (copy), v7 (copy), l_Parent_0 (copy), v92 (ref)
    if plugin.HostDataModelType == Enum.StudioDataModelType.PlayClient then
        local v93 = {
            InPlayMode = true
        };
        local v94 = v5();
        local v95 = v6(v94);
        plugin:SetItem("Groups", v94);
        plugin:SetItem("SelectedGroupIds", v95);
        plugin:Invoke("SetStateAndRefresh", v93);
        return;
    else
        local v96 = {
            InPlayMode = false
        };
        local v97 = v5();
        local v98 = v6(v97);
        plugin:SetItem("Groups", v97);
        plugin:SetItem("SelectedGroupIds", v98);
        plugin:Invoke("SetStateAndRefresh", v96);
        v89 = true;
        spawn(function() --[[ Line: 236 ]]
            -- upvalues: v89 (ref), v8 (ref)
            while v89 do
                if v8() then
                    plugin:Invoke("SetStateAndRefresh", nil);
                end;
                wait(1);
            end;
        end);
        plugin:Invoke("PollGuiEnabled");
        v85();
        if v7 then
            v92 = require(l_Parent_0.Packages.DeveloperTools).forPlugin("CollisionGroupsEditor", plugin);
            v92:addPluginRouter(plugin);
        end;
        return;
    end;
end;
local _ = function() --[[ Line: 274 ]] --[[ Name: unbindFromCurrentDM ]]
    -- upvalues: v47 (copy), v29 (copy), v89 (ref), v92 (ref)
    for _, v101 in ipairs(v47) do
        v101:Disconnect();
    end;
    for _, v103 in ipairs(v29) do
        v103:Disconnect();
    end;
    v89 = false;
    if v92 then
        v92:destroy();
    end;
end;
(function(v105) --[[ Line: 283 ]] --[[ Name: bindToDataModelSession ]]
    -- upvalues: v47 (copy), v29 (copy), v89 (ref), v92 (ref), v99 (copy)
    v105.CurrentDataModelTypeAboutToChange:Connect(function() --[[ Line: 284 ]]
        -- upvalues: v47 (ref), v29 (ref), v89 (ref), v92 (ref)
        if plugin.HostDataModelTypeIsCurrent then
            for _, v107 in ipairs(v47) do
                v107:Disconnect();
            end;
            for _, v109 in ipairs(v29) do
                v109:Disconnect();
            end;
            v89 = false;
            if v92 then
                v92:destroy();
            end;
        end;
    end);
    v105.CurrentDataModelTypeChanged:Connect(function() --[[ Line: 289 ]]
        -- upvalues: v99 (ref)
        if plugin.HostDataModelTypeIsCurrent then
            v99();
        end;
    end);
    if plugin.HostDataModelTypeIsCurrent then
        v99();
    end;
end)(plugin.MultipleDocumentInterfaceInstance.FocusedDataModelSession);