local l_CollectionService_0 = game:GetService("CollectionService");
local l_Selection_0 = game:GetService("Selection");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local v3 = require(script.Parent.Actions);
local v4 = require(script.Parent.Maid);
local _ = require(script.Parent.Types);
local l_ServerStorage_0 = game:GetService("ServerStorage");
local l_TagEditorShowTextSeparately_0 = game:GetFastFlag("TagEditorShowTextSeparately");
local l_TagEditorExternalUpdate_0 = game:GetFastFlag("TagEditorExternalUpdate");
local v9 = {};
v9.__index = v9;
local v10 = {
    Icon = "rbxasset://textures/TagEditor/Tag.png", 
    Visible = true, 
    DrawType = "Box", 
    ShowText = not l_TagEditorShowTextSeparately_0 and nil, 
    AlwaysOnTop = false, 
    Group = ""
};
v9._global = nil;
local function _(v11, v12, v13) --[[ Line: 38 ]] --[[ Name: lerp ]]
    return (v12 - v11) * v13 + v11;
end;
local function v21(v15) --[[ Line: 42 ]] --[[ Name: genColor ]]
    local v16 = 2166136261;
    for v17 = 1, #v15 do
        v16 = (v16 * 16777619 % 4294967296 + v15:byte(v17)) % 4294967296;
    end;
    local v18 = v16 / 65536 % 256 / 255;
    local v19 = v16 / 256 % 256 / 255;
    local v20 = 0.7 * (v16 / 1 % 256 / 255) + 0.3;
    v19 = 0.5 * v19 + 0.5;
    return Color3.fromHSV(v18, v19, v20);
end;
local _ = function(v22) --[[ Line: 61 ]] --[[ Name: needsMigration ]]
    if not v22 then
        return false;
    else
        for _, v24 in v22:GetChildren() do
            if v24:IsA("Folder") then
                return true;
            end;
        end;
        return false;
    end;
end;
v9.new = function(v26, v27) --[[ Line: 78 ]] --[[ Name: new ]]
    -- upvalues: l_ServerStorage_0 (copy), v4 (copy), v9 (copy), l_ChangeHistoryService_0 (copy), v10 (copy), l_CollectionService_0 (copy), l_Selection_0 (copy)
    local v28 = false;
    local v29 = setmetatable({
        store = v26, 
        analytics = v27, 
        updateTriggered = false, 
        enabled = false, 
        tags = {}, 
        onUpdate = {}, 
        _tagFolderSet = {}, 
        _defaultTagsFolder = l_ServerStorage_0:FindFirstChild("TagList"), 
        _maid = v4.new(), 
        _gaveDuplicateWarningsFor = {}
    }, v9);
    v9._global = v29;
    local l__defaultTagsFolder_0 = v29._defaultTagsFolder;
    local v31;
    if not l__defaultTagsFolder_0 then
        v31 = false;
    else
        for _, v33 in l__defaultTagsFolder_0:GetChildren() do
            if v33:IsA("Folder") then
                v31 = true;
                v28 = true;
            end;
            if v28 then
                break;
            end;
        end;
        if not v28 then
            v31 = false;
        end;
    end;
    v28 = false;
    if v31 then
        l_ChangeHistoryService_0:SetWaypoint("Migrating tags folder");
        v31 = 0;
        for _, v35 in pairs(v29._defaultTagsFolder:GetChildren()) do
            if v35:IsA("Folder") then
                local l_Configuration_0 = Instance.new("Configuration");
                l_Configuration_0.Name = v35.Name;
                local v37 = {};
                for _, v39 in pairs(v35:GetChildren()) do
                    if v39:IsA("ValueBase") then
                        l_Configuration_0:SetAttribute(v39.Name, v39.Value);
                        v37[v39.Name] = true;
                    end;
                end;
                for v40, v41 in pairs(v10) do
                    if not v37[v40] then
                        l_Configuration_0:SetAttribute(v40, v41);
                    end;
                end;
                l_Configuration_0.Parent = v29._defaultTagsFolder;
                v35.Parent = nil;
                v31 = v31 + 1;
            end;
        end;
        if v31 > 0 then
            print(string.format("TagEditor: Converted %d tags to attribute-based format.", v31));
        end;
        l_CollectionService_0:AddTag(v29._defaultTagsFolder, "TagEditorTagContainer");
        l_ChangeHistoryService_0:SetWaypoint("Migrated tags folder");
    end;
    v29:_updateStore();
    v29._maid:give(l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 133 ]]
        -- upvalues: v29 (copy)
        if not v29.enabled then
            return;
        else
            v29:_updateStore();
            v29:_updateUnknownTags();
            return;
        end;
    end));
    if v29._defaultTagsFolder then
        v29:_watchFolder(v29._defaultTagsFolder);
    end;
    v29._maid:give(l_CollectionService_0:GetInstanceAddedSignal("TagEditorTagContainer"):Connect(function(v42) --[[ Line: 146 ]]
        -- upvalues: v29 (copy)
        v29:_watchFolder(v42);
    end));
    v29._maid:give(l_CollectionService_0:GetInstanceRemovedSignal("TagEditorTagContainer"):Connect(function(v43) --[[ Line: 149 ]]
        -- upvalues: v29 (copy)
        if v43 ~= v29._defaultTagsFolder then
            v29:_stopWatchingFolder(v43);
        end;
    end));
    for _, v45 in pairs(l_CollectionService_0:GetTagged("TagEditorTagContainer")) do
        v29:_watchFolder(v45);
    end;
    return v29;
end;
v9.Destroy = function(v46) --[[ Line: 162 ]] --[[ Name: Destroy ]]
    v46._maid:destroy();
end;
v9.Get = function() --[[ Line: 166 ]] --[[ Name: Get ]]
    -- upvalues: v9 (copy)
    return v9._global;
end;
v9.GetTags = function(v47) --[[ Line: 170 ]] --[[ Name: GetTags ]]
    return v47.tags;
end;
v9.OnTagsUpdated = function(v48, v49) --[[ Line: 174 ]] --[[ Name: OnTagsUpdated ]]
    local v51 = {
        Disconnect = function(v50) --[[ Line: 176 ]] --[[ Name: Disconnect ]]
            -- upvalues: v48 (copy)
            v48.onUpdate[v50] = nil;
        end
    };
    v48.onUpdate[v51] = v49;
    return v51;
end;
v9._stopWatchingFolder = function(v52, v53) --[[ Line: 184 ]] --[[ Name: _stopWatchingFolder ]]
    if v52._maid[v53] then
        v52._maid[v53] = nil;
        v52:_updateStore(true);
    end;
end;
v9._watchFolder = function(v54, v55) --[[ Line: 191 ]] --[[ Name: _watchFolder ]]
    -- upvalues: v4 (copy)
    if v54._maid[v55] then
        return;
    else
        local v56 = v4.new();
        v54._tagFolderSet[v55] = true;
        v56:give(function() --[[ Line: 199 ]]
            -- upvalues: v54 (copy), v55 (copy)
            v54._tagFolderSet[v55] = nil;
        end);
        for _, v58 in pairs(v55:GetChildren()) do
            if v58:IsA("Configuration") then
                v56[v58] = v54:_watchChild(v58);
            end;
        end;
        v56:give(v55.ChildAdded:Connect(function(v59) --[[ Line: 209 ]]
            -- upvalues: v56 (copy), v54 (copy)
            if v59:IsA("Configuration") then
                v56[v59] = v54:_watchChild(v59);
            end;
        end));
        v56:give(v55.ChildRemoved:Connect(function(v60) --[[ Line: 215 ]]
            -- upvalues: v56 (copy), v54 (copy)
            if v60:IsA("Configuration") then
                v56[v60] = nil;
                v54:_updateStore();
            end;
        end));
        v54._maid[v55] = v56;
        return;
    end;
end;
v9._watchChild = function(v61, v62) --[[ Line: 225 ]] --[[ Name: _watchChild ]]
    -- upvalues: v4 (copy), l_CollectionService_0 (copy), l_TagEditorExternalUpdate_0 (copy)
    local v63 = v4.new();
    v61:_updateStore(true);
    local function v67() --[[ Line: 230 ]] --[[ Name: listenForAddedAndRemoved ]]
        -- upvalues: v4 (ref), l_CollectionService_0 (ref), v62 (copy), v61 (copy)
        local v64 = v4.new();
        v64:give(l_CollectionService_0:GetInstanceAddedSignal(v62.Name):Connect(function(_) --[[ Line: 233 ]]
            -- upvalues: v61 (ref)
            v61:_updateStore();
        end));
        v64:give(l_CollectionService_0:GetInstanceRemovedSignal(v62.Name):Connect(function(_) --[[ Line: 237 ]]
            -- upvalues: v61 (ref)
            v61:_updateStore();
        end));
        return v64;
    end;
    v63:give(v62.AttributeChanged:Connect(function(_) --[[ Line: 244 ]]
        -- upvalues: v61 (copy)
        v61:_updateStore();
    end));
    local v69 = nil;
    if l_TagEditorExternalUpdate_0 then
        v69 = v67();
    end;
    v63:give(v62:GetPropertyChangedSignal("Name"):Connect(function(_) --[[ Line: 254 ]]
        -- upvalues: v61 (copy), l_TagEditorExternalUpdate_0 (ref), v69 (ref), v67 (copy)
        v61:_updateStore(true);
        if l_TagEditorExternalUpdate_0 then
            v69:destroy();
            v69 = v67();
        end;
    end));
    if l_TagEditorExternalUpdate_0 then
        v63:give(function() --[[ Line: 263 ]]
            -- upvalues: v69 (ref)
            v69:destroy();
        end);
    end;
    return v63;
end;
v9._ensureDefaultFolder = function(v71) --[[ Line: 271 ]] --[[ Name: _ensureDefaultFolder ]]
    -- upvalues: l_ServerStorage_0 (copy), l_CollectionService_0 (copy)
    if not v71._defaultTagsFolder then
        v71._defaultTagsFolder = Instance.new("Folder");
        v71._defaultTagsFolder.Name = "TagList";
        v71._defaultTagsFolder.Parent = l_ServerStorage_0;
        l_CollectionService_0:AddTag(v71._defaultTagsFolder, "TagEditorTagContainer");
        v71:_watchFolder(v71._defaultTagsFolder);
    end;
    return v71._defaultTagsFolder;
end;
v9._updateStore = function(v72, v73) --[[ Line: 285 ]] --[[ Name: _updateStore ]]
    if not v72.updateTriggered then
        v72.updateTriggered = true;
        task.spawn(function() --[[ Line: 288 ]]
            -- upvalues: v72 (copy), v73 (copy)
            v72:_doUpdateStore();
            if v73 then
                v72:_updateUnknownTags();
            end;
        end);
    end;
end;
v9._doUpdateStore = function(v74) --[[ Line: 297 ]] --[[ Name: _doUpdateStore ]]
    -- upvalues: l_Selection_0 (copy), v10 (copy), l_TagEditorShowTextSeparately_0 (copy), v21 (copy), l_CollectionService_0 (copy), v3 (copy)
    v74.updateTriggered = false;
    local v75 = {};
    local v76 = {};
    local v77 = l_Selection_0:Get();
    local function v87(v78) --[[ Line: 303 ]] --[[ Name: update ]]
        -- upvalues: v74 (copy), v10 (ref), l_TagEditorShowTextSeparately_0 (ref), v21 (ref), v77 (copy), l_CollectionService_0 (ref), v75 (copy), v76 (copy)
        local v79 = {};
        for _, v81 in pairs(v78:GetChildren()) do
            if v81:IsA("Configuration") then
                if v79[v81.Name] then
                    if not v74._gaveDuplicateWarningsFor[v81.Name] then
                        warn(string.format("Multiple tags in %s are named %q, consider removing the duplicates.", v78:GetFullName(), v81.Name));
                        v74._gaveDuplicateWarningsFor[v81.Name] = true;
                    end;
                else
                    v79[v81.Name] = true;
                    local v82 = false;
                    local v83 = false;
                    local v84 = {
                        Name = v81.Name, 
                        Icon = v81:GetAttribute("Icon") or v10.Icon, 
                        Visible = v81:GetAttribute("Visible") or false, 
                        DrawType = v81:GetAttribute("DrawType") or v10.DrawType, 
                        ShowText = if l_TagEditorShowTextSeparately_0 then v81:GetAttribute("ShowText") or v10.ShowText else nil, 
                        AlwaysOnTop = v81:GetAttribute("AlwaysOnTop") or v10.AlwaysOnTop, 
                        Group = v81:GetAttribute("Group") or v10.Group, 
                        Color = v81:GetAttribute("Color") or v21(v81.Name), 
                        HasAll = false, 
                        HasSome = false
                    };
                    if v84.Group == "" then
                        v84.Group = nil;
                    end;
                    if v84.Icon == "" then
                        v84.Icon = v10.Icon;
                    end;
                    for v85 = 1, #v77 do
                        local v86 = v77[v85];
                        if l_CollectionService_0:HasTag(v86, v84.Name) then
                            v82 = true;
                        else
                            v83 = true;
                        end;
                    end;
                    v84.HasAll = v82 and not v83;
                    v84.HasSome = v82 and v83;
                    v75[#v75 + 1] = v84;
                    if v84.Group then
                        v76[v84.Group] = true;
                    end;
                end;
            end;
        end;
    end;
    if v74._defaultTagsFolder then
        v87(v74._defaultTagsFolder);
    end;
    for v88, _ in pairs(v74._tagFolderSet) do
        if v88 ~= v74._defaultTagsFolder then
            v87(v88);
        end;
    end;
    table.sort(v75, function(v90, v91) --[[ Line: 376 ]]
        return v90.Name < v91.Name;
    end);
    local l_tags_0 = v74.tags;
    v74.tags = v75;
    v74.store:dispatch(v3.SetTagData(v75));
    local v93 = {};
    for v94, _ in pairs(v76) do
        table.insert(v93, v94);
    end;
    table.sort(v93);
    v74.groups = v76;
    v74.store:dispatch(v3.SetGroupData(v93));
    for _, v97 in pairs(v74.onUpdate) do
        v97(v75, l_tags_0);
    end;
end;
v9._updateUnknownTags = function(v98) --[[ Line: 403 ]] --[[ Name: _updateUnknownTags ]]
    -- upvalues: l_Selection_0 (copy), l_CollectionService_0 (copy), v3 (copy)
    local v99 = l_Selection_0:Get();
    if #v99 ~= 0 then
        local v100 = {};
        for _, v102 in pairs(v98.tags) do
            v100[v102.Name] = true;
        end;
        local v103 = {};
        for _, v105 in pairs(v99) do
            local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v105);
            for _, v108 in pairs(l_l_CollectionService_0_Tags_0) do
                if not v100[v108] and v108:sub(1, 1) ~= "." then
                    v103[v108] = true;
                end;
            end;
        end;
        local v109 = {};
        for v110, _ in pairs(v103) do
            table.insert(v109, v110);
        end;
        table.sort(v109);
        v98.store:dispatch(v3.SetUnknownTags(v109));
    end;
end;
v9._setProp = function(v112, v113, v114, v115) --[[ Line: 432 ]] --[[ Name: _setProp ]]
    -- upvalues: l_ChangeHistoryService_0 (copy)
    local v116 = v112:_findTagInst(v113);
    if not v116 then
        warn("Setting property of non-existent tag `" .. tostring(v113) .. "`");
        return false;
    elseif v116:GetAttribute(v114) == v115 then
        return false;
    else
        l_ChangeHistoryService_0:SetWaypoint(string.format("Setting property %q of tag %q", v114, v113));
        v116:SetAttribute(v114, v115);
        l_ChangeHistoryService_0:SetWaypoint(string.format("Set property %q of tag %q", v114, v113));
        return true;
    end;
end;
v9._getProp = function(v117, v118, v119) --[[ Line: 451 ]] --[[ Name: _getProp ]]
    local v120 = v117:_findTagInst(v118);
    if not v120 then
        return nil;
    else
        return v120:GetAttribute(v119);
    end;
end;
v9._findTagInst = function(v121, v122) --[[ Line: 460 ]] --[[ Name: _findTagInst ]]
    if v121._defaultTagsFolder then
        local l_FirstChild_0 = v121._defaultTagsFolder:FindFirstChild(v122);
        if l_FirstChild_0 then
            return l_FirstChild_0;
        end;
    end;
    for v124, _ in pairs(v121._tagFolderSet) do
        local l_v124_FirstChild_0 = v124:FindFirstChild(v122);
        if l_v124_FirstChild_0 then
            return l_v124_FirstChild_0;
        end;
    end;
    return nil;
end;
v9.AddTag = function(v127, v128) --[[ Line: 480 ]] --[[ Name: AddTag ]]
    -- upvalues: l_ChangeHistoryService_0 (copy), v10 (copy), l_TagEditorShowTextSeparately_0 (copy), v21 (copy)
    if v127:_findTagInst(v128) then
        return;
    else
        l_ChangeHistoryService_0:SetWaypoint(string.format("Creating tag %q", v128));
        local v129 = v127:_ensureDefaultFolder();
        local l_Configuration_1 = Instance.new("Configuration");
        l_Configuration_1.Name = v128;
        l_Configuration_1:SetAttribute("Icon", v10.Icon);
        l_Configuration_1:SetAttribute("Visible", v10.Visible);
        l_Configuration_1:SetAttribute("DrawType", v10.DrawType);
        if l_TagEditorShowTextSeparately_0 then
            l_Configuration_1:SetAttribute("ShowText", v10.ShowText);
        end;
        l_Configuration_1:SetAttribute("AlwaysOnTop", v10.AlwaysOnTop);
        l_Configuration_1:SetAttribute("Group", v10.Group);
        l_Configuration_1:SetAttribute("Color", v21(v128));
        l_Configuration_1.Parent = v129;
        v127.analytics:report("tagCreated");
        l_ChangeHistoryService_0:SetWaypoint(string.format("Created tag %q", v128));
        return;
    end;
end;
v9.Rename = function(v131, v132, v133) --[[ Line: 506 ]] --[[ Name: Rename ]]
    -- upvalues: l_ChangeHistoryService_0 (copy), l_CollectionService_0 (copy)
    local v134 = v131:_findTagInst(v132);
    if not v134 then
        return;
    else
        l_ChangeHistoryService_0:SetWaypoint(string.format("Renaming tag %q to %q", v132, v133));
        v134.Name = v133;
        for _, v136 in pairs(l_CollectionService_0:GetTagged(v132)) do
            l_CollectionService_0:RemoveTag(v136, v132);
            l_CollectionService_0:AddTag(v136, v133);
        end;
        v131:_updateStore();
        v131:_updateUnknownTags();
        l_ChangeHistoryService_0:SetWaypoint(string.format("Renamed tag %q to %q", v132, v133));
        return;
    end;
end;
v9.ToggleGroupVisibility = function(v137, v138) --[[ Line: 525 ]] --[[ Name: ToggleGroupVisibility ]]
    local v139 = {};
    local v140 = false;
    for _, v142 in pairs(v137.tags) do
        if v142.Group == v138 then
            if not v140 then
                table.insert(v139, v142);
                if not v142.Visible then
                    v140 = true;
                    v137:_setProp(v142.Name, "Visible", true);
                end;
            else
                v137:_setProp(v142.Name, "Visible", true);
            end;
        end;
    end;
    if not v140 then
        for _, v144 in pairs(v139) do
            v137:_setProp(v144.Name, "Visible", false);
        end;
    end;
end;
v9.GetGroups = function(v145) --[[ Line: 554 ]] --[[ Name: GetGroups ]]
    return v145.groups;
end;
v9.RenameGroup = function(v146, v147, v148) --[[ Line: 558 ]] --[[ Name: RenameGroup ]]
    -- upvalues: l_ChangeHistoryService_0 (copy)
    l_ChangeHistoryService_0:SetWaypoint(string.format("Renaming Group %q to %q", v147, v148));
    for _, v150 in pairs(v146.tags) do
        if v150.Group == v147 then
            v146:_setProp(v150.Name, "Group", v148 or "");
        end;
    end;
    l_ChangeHistoryService_0:SetWaypoint(string.format("Renamed Group %q to %q", v147, v148));
end;
v9.DeleteGroup = function(v151, v152) --[[ Line: 570 ]] --[[ Name: DeleteGroup ]]
    -- upvalues: l_ChangeHistoryService_0 (copy)
    l_ChangeHistoryService_0:SetWaypoint(string.format("Deleteing Group %q", v152));
    for _, v154 in pairs(v151.tags) do
        if v154.Group == v152 then
            v151:_setProp(v154.Name, "Group", "");
        end;
    end;
    l_ChangeHistoryService_0:SetWaypoint(string.format("Deleted Group %q", v152));
end;
v9.SelectAll = function(_, v156) --[[ Line: 582 ]] --[[ Name: SelectAll ]]
    -- upvalues: l_Selection_0 (copy), l_CollectionService_0 (copy)
    l_Selection_0:Set(l_CollectionService_0:GetTagged(v156));
end;
v9.GetIcon = function(v157, v158) --[[ Line: 586 ]] --[[ Name: GetIcon ]]
    -- upvalues: v10 (copy)
    return v157:_getProp(v158, "Icon") or v10.Icon;
end;
v9.GetVisible = function(v159, v160) --[[ Line: 590 ]] --[[ Name: GetVisible ]]
    -- upvalues: v10 (copy)
    return v159:_getProp(v160, "Visible") or v10.Visible;
end;
v9.GetDrawType = function(v161, v162) --[[ Line: 594 ]] --[[ Name: GetDrawType ]]
    -- upvalues: v10 (copy)
    return v161:_getProp(v162, "DrawType") or v10.DrawType;
end;
v9.GetColor = function(v163, v164) --[[ Line: 598 ]] --[[ Name: GetColor ]]
    -- upvalues: v10 (copy)
    return v163:_getProp(v164, "Color") or v10.Color;
end;
if l_TagEditorShowTextSeparately_0 then
    v9.GetShowText = function(v165, v166) --[[ Line: 603 ]] --[[ Name: GetShowText ]]
        -- upvalues: v10 (copy)
        return v165:_getProp(v166, "ShowText") or v10.ShowText;
    end;
end;
v9.GetAlwaysOnTop = function(v167, v168) --[[ Line: 608 ]] --[[ Name: GetAlwaysOnTop ]]
    -- upvalues: v10 (copy)
    return v167:_getProp(v168, "AlwaysOnTop") or v10.AlwaysOnTop;
end;
v9.GetGroup = function(v169, v170) --[[ Line: 612 ]] --[[ Name: GetGroup ]]
    -- upvalues: v10 (copy)
    return v169:_getProp(v170, "Group") or v10.Group;
end;
v9.SetIcon = function(v171, v172, v173) --[[ Line: 616 ]] --[[ Name: SetIcon ]]
    v171:_setProp(v172, "Icon", v173 or "");
    v171.analytics:report("iconChanged");
end;
v9.SetVisible = function(v174, v175, v176) --[[ Line: 621 ]] --[[ Name: SetVisible ]]
    v174:_setProp(v175, "Visible", v176);
end;
v9.SetDrawType = function(v177, v178, v179) --[[ Line: 625 ]] --[[ Name: SetDrawType ]]
    v177:_setProp(v178, "DrawType", v179);
end;
v9.SetColor = function(v180, v181, v182) --[[ Line: 629 ]] --[[ Name: SetColor ]]
    v180:_setProp(v181, "Color", v182);
    v180.analytics:report("colorChanged");
end;
if l_TagEditorShowTextSeparately_0 then
    v9.SetShowText = function(v183, v184, v185) --[[ Line: 635 ]] --[[ Name: SetShowText ]]
        v183:_setProp(v184, "ShowText", v185);
    end;
end;
v9.SetAlwaysOnTop = function(v186, v187, v188) --[[ Line: 640 ]] --[[ Name: SetAlwaysOnTop ]]
    v186:_setProp(v187, "AlwaysOnTop", v188);
end;
v9.SetGroup = function(v189, v190, v191) --[[ Line: 644 ]] --[[ Name: SetGroup ]]
    v189:_setProp(v190, "Group", v191 or "");
end;
v9.DelTag = function(v192, v193) --[[ Line: 648 ]] --[[ Name: DelTag ]]
    -- upvalues: l_ChangeHistoryService_0 (copy), l_CollectionService_0 (copy)
    local v194 = v192:_findTagInst(v193);
    if not v194 then
        return;
    else
        l_ChangeHistoryService_0:SetWaypoint(string.format("Deleting tag %q", v193));
        v194.Parent = nil;
        for _, v196 in pairs(l_CollectionService_0:GetTagged(v193)) do
            l_CollectionService_0:RemoveTag(v196, v193);
        end;
        l_ChangeHistoryService_0:SetWaypoint(string.format("Deleted tag %q", v193));
        return;
    end;
end;
v9.SetTag = function(v197, v198, v199) --[[ Line: 665 ]] --[[ Name: SetTag ]]
    -- upvalues: l_ChangeHistoryService_0 (copy), l_Selection_0 (copy), l_CollectionService_0 (copy)
    if v199 then
        l_ChangeHistoryService_0:SetWaypoint(string.format("Applying tag %q to selection", v198));
    else
        l_ChangeHistoryService_0:SetWaypoint(string.format("Removing tag %q from selection", v198));
    end;
    local v200 = l_Selection_0:Get();
    for _, v202 in pairs(v200) do
        if v199 then
            l_CollectionService_0:AddTag(v202, v198);
        else
            l_CollectionService_0:RemoveTag(v202, v198);
        end;
    end;
    v197:_updateStore();
    if v199 then
        l_ChangeHistoryService_0:SetWaypoint(string.format("Applied tag %q to selection", v198));
        v197.analytics:report("objectTagged");
        return;
    else
        l_ChangeHistoryService_0:SetWaypoint(string.format("Removed tag %q from selection", v198));
        return;
    end;
end;
v9.SetEnabled = function(v203, v204) --[[ Line: 692 ]] --[[ Name: SetEnabled ]]
    if v203.enabled == v204 then
        return;
    else
        v203.enabled = v204;
        if v204 then
            v203:_updateStore();
            v203:_updateUnknownTags();
        end;
        return;
    end;
end;
return v9;