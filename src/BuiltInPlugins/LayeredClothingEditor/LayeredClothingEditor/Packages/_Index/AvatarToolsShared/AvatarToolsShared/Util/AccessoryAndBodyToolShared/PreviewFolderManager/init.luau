local v0 = require(script.Parent.Constants);
local v1 = require(script.Parent.PreviewConstants);
local v2 = {};
v2.__index = v2;
local function v7(v3, v4) --[[ Line: 9 ]] --[[ Name: separatePathComponents ]]
    if not v4 then
        v4 = ".";
    end;
    local v5 = {};
    for v6 in string.gmatch(v3, "([^" .. v4 .. "]+)") do
        table.insert(v5, v6);
    end;
    return v5;
end;
local function _(v8, v9) --[[ Line: 22 ]] --[[ Name: containsPath ]]
    for v10 = 1, #v8 do
        if not v9[v10] then
            return true;
        elseif v8[v10] ~= v9[v10] then
            return false;
        end;
    end;
    return true;
end;
local function _(v12) --[[ Line: 34 ]] --[[ Name: wasModified ]]
    return function() --[[ Line: 35 ]]
        -- upvalues: v12 (copy)
        v12:SetAttribute("WasModified", true);
    end;
end;
v2.new = function() --[[ Line: 40 ]] --[[ Name: new ]]
    -- upvalues: v2 (copy), v0 (copy), v1 (copy), v7 (copy)
    local v14 = setmetatable({}, v2);
    local l_FirstChild_0 = game:GetService("Workspace"):FindFirstChild(v0.PREVIEW_ASSETS_FOLDER);
    local v16 = {};
    local function v20(v17, v18) --[[ Line: 46 ]] --[[ Name: addConnections ]]
        -- upvalues: v16 (copy)
        if v16[v17.Name] then
            return;
        else
            local v19 = {
                DescendantAddedConnection = v18.DescendantAdded:Connect(function() --[[ Line: 35 ]]
                    -- upvalues: v17 (copy)
                    v17:SetAttribute("WasModified", true);
                end), 
                DescendantRemovingConnection = v18.DescendantRemoving:Connect(function() --[[ Line: 35 ]]
                    -- upvalues: v17 (copy)
                    v17:SetAttribute("WasModified", true);
                end), 
                AncestryChangedConnection = v18.AncestryChanged:Connect(function() --[[ Line: 35 ]]
                    -- upvalues: v17 (copy)
                    v17:SetAttribute("WasModified", true);
                end)
            };
            v16[v17.Name] = v19;
            return;
        end;
    end;
    local _ = function(v21) --[[ Line: 57 ]] --[[ Name: removeConnections ]]
        -- upvalues: v16 (copy)
        if v16[v21.Name] then
            for _, v23 in pairs(v16[v21.Name]) do
                v23:Disconnect();
            end;
            v16[v21.Name] = nil;
        end;
    end;
    local function _(v25) --[[ Line: 66 ]] --[[ Name: _createChildFolderWitName ]]
        -- upvalues: l_FirstChild_0 (ref)
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Parent = l_FirstChild_0;
        l_Folder_0.Name = v25;
        l_Folder_0:SetAttribute("WasModified", true);
        return l_Folder_0;
    end;
    local function _(v28, v29, v30) --[[ Line: 74 ]] --[[ Name: _deleteUserAddedAsset ]]
        if v28[v29] and v28[v29][v30] then
            v28[v29][v30] = nil;
        end;
    end;
    local function v41(v32, v33, v34) --[[ Line: 82 ]] --[[ Name: _cleanAssetsFromFolder ]]
        -- upvalues: v1 (ref)
        local v35 = {};
        for _, v37 in pairs(v1.TABS_KEYS) do
            local l_v32_Attribute_0 = v32:GetAttribute(v37 .. "Start");
            local l_v32_Attribute_1 = v32:GetAttribute(v37 .. "End");
            if l_v32_Attribute_0 and l_v32_Attribute_1 then
                v35[v37] = {
                    l_v32_Attribute_0, 
                    l_v32_Attribute_1
                };
                for v40 = l_v32_Attribute_0 + 1, l_v32_Attribute_1 do
                    if v33[v37] and v33[v37][v40] then
                        v33[v37][v40] = nil;
                    end;
                    v34(v37, v40);
                end;
            end;
            v32:SetAttribute(v37 .. "Start", nil);
            v32:SetAttribute(v37 .. "End", nil);
        end;
        return v35;
    end;
    local function v42(v43, v44, v45) --[[ Line: 100 ]] --[[ Name: _addAssetsFromFolderHelper ]]
        -- upvalues: v1 (ref), v42 (copy)
        local v46 = {};
        for _, v48 in pairs(v1.TABS_KEYS) do
            if v44(v48, v43) then
                v45(v48, v43);
                v46[v48] = 1;
            else
                v46[v48] = 0;
            end;
        end;
        if not v43:IsA("Folder") then
            return v46;
        else
            for _, v50 in pairs(v43:GetChildren()) do
                local v51 = v42(v50, v44, v45);
                for v52, v53 in pairs(v51) do
                    v46[v52] = v46[v52] + v53;
                end;
            end;
            return v46;
        end;
    end;
    local function v58(v54) --[[ Line: 123 ]] --[[ Name: _getCounts ]]
        -- upvalues: v1 (ref)
        local v55 = {};
        for _, v57 in pairs(v1.TABS_KEYS) do
            if v54 and v54[v57] then
                v55[v57] = #v54[v57];
            else
                v55[v57] = 0;
            end;
        end;
        return v55;
    end;
    v14.addFolderPath = function(_, v60) --[[ Line: 135 ]] --[[ Name: addFolderPath ]]
        -- upvalues: l_FirstChild_0 (ref), v0 (ref), v7 (ref), v20 (copy), v16 (copy)
        local v61 = false;
        if not l_FirstChild_0 then
            l_FirstChild_0 = Instance.new("Folder");
            l_FirstChild_0.Name = v0.PREVIEW_ASSETS_FOLDER;
            l_FirstChild_0.Parent = game:GetService("Workspace");
        end;
        local l_v60_FullName_0 = v60:GetFullName();
        local v63 = v7(l_v60_FullName_0);
        for _, v65 in pairs(l_FirstChild_0:GetChildren()) do
            if v65.Name == l_v60_FullName_0 then
                return false;
            else
                local v66 = v7(v65.Name);
                local v67;
                for v68 = 1, #v63 do
                    if not v66[v68] then
                        v67 = true;
                        v61 = true;
                    elseif v63[v68] ~= v66[v68] then
                        v67 = false;
                        v61 = true;
                    end;
                    if v61 then
                        break;
                    end;
                    if v61 then
                        break;
                    end;
                end;
                if not v61 then
                    if not v61 then
                        v67 = true;
                    end;
                end;
                v61 = false;
                if v67 then
                    if #v63 < #v66 then
                        local l_Folder_1 = Instance.new("Folder");
                        l_Folder_1.Parent = l_FirstChild_0;
                        l_Folder_1.Name = l_v60_FullName_0;
                        l_Folder_1:SetAttribute("WasModified", true);
                        v67 = l_Folder_1;
                        v20(v67, v60);
                        if v16[v65.Name] then
                            for _, v71 in pairs(v16[v65.Name]) do
                                v71:Disconnect();
                            end;
                            v16[v65.Name] = nil;
                        end;
                        v65:Destroy();
                        return v67;
                    elseif #v63 > #v66 then
                        return nil;
                    end;
                end;
            end;
        end;
        local l_Folder_2 = Instance.new("Folder");
        l_Folder_2.Parent = l_FirstChild_0;
        l_Folder_2.Name = l_v60_FullName_0;
        l_Folder_2:SetAttribute("WasModified", true);
        local l_l_Folder_2_0 = l_Folder_2;
        v20(l_l_Folder_2_0, v60);
        return l_l_Folder_2_0;
    end;
    v14.resetAllFoldersAttributes = function(_) --[[ Line: 166 ]] --[[ Name: resetAllFoldersAttributes ]]
        -- upvalues: l_FirstChild_0 (ref)
        if not l_FirstChild_0 then
            return;
        else
            for _, v76 in pairs(l_FirstChild_0:GetChildren()) do
                for v77, _ in pairs(v76:GetAttributes()) do
                    v76:SetAttribute(v77, nil);
                end;
                v76:SetAttribute("WasModified", true);
            end;
            return;
        end;
    end;
    v14.addAssetsFromFolder = function(_, v80, v81, v82, v83) --[[ Line: 178 ]] --[[ Name: addAssetsFromFolder ]]
        -- upvalues: v7 (ref), v16 (copy), v42 (copy), v20 (copy)
        local v84 = v7(v80.Name);
        local l_game_0 = game;
        for _, v87 in pairs(v84) do
            if l_game_0 then
                l_game_0 = l_game_0:FindFirstChild(v87);
            else
                break;
            end;
        end;
        if not l_game_0 then
            if v16[v80.Name] then
                for _, v89 in pairs(v16[v80.Name]) do
                    v89:Disconnect();
                end;
                v16[v80.Name] = nil;
            end;
            v80:Destroy();
            return;
        else
            local v90 = v42(l_game_0, v82, v83);
            for v91, v92 in pairs(v81) do
                v80:SetAttribute(v91 .. "Start", v92);
                v80:SetAttribute(v91 .. "End", v92 + v90[v91]);
                v81[v91] = v81[v91] + v90[v91];
            end;
            v20(v80, l_game_0);
            v80:SetAttribute("WasModified", false);
            return;
        end;
    end;
    v14.addDirtyFolders = function(v93, v94, v95, v96) --[[ Line: 202 ]] --[[ Name: addDirtyFolders ]]
        -- upvalues: l_FirstChild_0 (ref), v58 (copy)
        if not l_FirstChild_0 then
            return;
        else
            local v97 = v58(v94);
            for _, v99 in pairs(l_FirstChild_0:GetChildren()) do
                if v99:GetAttribute("WasModified") then
                    v93:addAssetsFromFolder(v99, v97, v95, v96);
                end;
            end;
            return;
        end;
    end;
    v14.cleanDirtyFolders = function(_, v101, v102) --[[ Line: 215 ]] --[[ Name: cleanDirtyFolders ]]
        -- upvalues: l_FirstChild_0 (ref), v41 (copy)
        if not l_FirstChild_0 then
            return;
        else
            for _, v104 in pairs(l_FirstChild_0:GetChildren()) do
                if v104:GetAttribute("WasModified") then
                    v41(v104, v101, v102);
                end;
            end;
            return;
        end;
    end;
    return v14;
end;
return v2;