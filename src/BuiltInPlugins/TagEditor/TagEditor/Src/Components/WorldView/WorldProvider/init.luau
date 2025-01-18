local l_CollectionService_0 = game:GetService("CollectionService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Src.Constants);
local v4 = require(l_Parent_0.Src.TagManager);
local v5 = require(l_Parent_0.Src.Maid);
local l_TagEditorShowTextSeparately_0 = game:GetFastFlag("TagEditorShowTextSeparately");
local v7 = v2.PureComponent:extend("WorldProvider");
local l_TagEditorExternalUpdate_0 = game:GetFastFlag("TagEditorExternalUpdate");
local function _(v9) --[[ Line: 17 ]] --[[ Name: tagShouldntRender ]]
    local v10 = true;
    if v9.Visible ~= false then
        v10 = false;
        if v9.DrawType == "None" then
            v10 = not v9.ShowText;
        end;
    end;
    return v10;
end;
v7.init = function(v12) --[[ Line: 21 ]] --[[ Name: init ]]
    -- upvalues: v5 (copy), v3 (copy)
    v12.state = {
        partsList = {}
    };
    v12.nextId = 0;
    v12.partIds = {};
    v12.trackedParts = {};
    v12.trackedTags = {};
    v12.instanceAddedConns = v5.new();
    v12.instanceRemovedConns = v5.new();
    v12.instanceAncestryChangedConns = v5.new();
    v12.maid = v5.new();
    local function v17(v13) --[[ Line: 35 ]] --[[ Name: cameraChanged ]]
        -- upvalues: v12 (copy), v3 (ref)
        v12.maid.cameraMovedConn = nil;
        if v13 then
            local l_Position_0 = v13.CFrame.Position;
            do
                local l_l_Position_0_0 = l_Position_0;
                v12.maid.cameraMovedConn = v13:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 39 ]]
                    -- upvalues: v13 (copy), l_l_Position_0_0 (ref), v3 (ref), v12 (ref)
                    local l_Position_1 = v13.CFrame.Position;
                    if (l_l_Position_0_0 - l_Position_1).Magnitude > v3.WorldProvider.CameraMinMovementStepForPartUpdate then
                        l_l_Position_0_0 = l_Position_1;
                        v12:updateParts();
                    end;
                end);
            end;
        end;
    end;
    v12.maid.cameraChangedConn = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(v17);
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    v12.maid.cameraMovedConn = nil;
    if l_CurrentCamera_0 then
        local l_Position_2 = l_CurrentCamera_0.CFrame.Position;
        do
            local l_l_Position_2_0 = l_Position_2;
            v12.maid.cameraMovedConn = l_CurrentCamera_0:GetPropertyChangedSignal("CFrame"):Connect(function() --[[ Line: 39 ]]
                -- upvalues: l_CurrentCamera_0 (copy), l_l_Position_2_0 (ref), v3 (ref), v12 (copy)
                local l_Position_3 = l_CurrentCamera_0.CFrame.Position;
                if (l_l_Position_2_0 - l_Position_3).Magnitude > v3.WorldProvider.CameraMinMovementStepForPartUpdate then
                    l_l_Position_2_0 = l_Position_3;
                    v12:updateParts();
                end;
            end);
        end;
    end;
end;
v7.didMount = function(v22) --[[ Line: 52 ]] --[[ Name: didMount ]]
    -- upvalues: v4 (copy)
    local v23 = v4.Get();
    for _, v25 in pairs(v23:GetTags()) do
        local v26 = true;
        if v25.Visible ~= false then
            v26 = false;
            if v25.DrawType == "None" then
                v26 = not v25.ShowText;
            end;
        end;
        if not v26 then
            v22:tagAdded(v25.Name);
        end;
    end;
    v22.onTagsUpdatedConn = v23:OnTagsUpdated(function(v27, v28) --[[ Line: 61 ]]
        -- upvalues: v22 (copy)
        local v29 = {};
        local v30 = {};
        for _, v32 in pairs(v27) do
            local v33 = true;
            if v32.Visible ~= false then
                v33 = false;
                if v32.DrawType == "None" then
                    v33 = not v32.ShowText;
                end;
            end;
            if not v33 then
                v29[v32.Name] = v32;
            end;
        end;
        for _, v35 in pairs(v28) do
            local v36 = true;
            if v35.Visible ~= false then
                v36 = false;
                if v35.DrawType == "None" then
                    v36 = not v35.ShowText;
                end;
            end;
            if not v36 then
                if v29[v35.Name] then
                    v29[v35.Name] = nil;
                else
                    v30[v35.Name] = v35;
                end;
            end;
        end;
        for v37 in pairs(v29) do
            v22:tagAdded(v37);
        end;
        for v38 in pairs(v30) do
            v22:tagRemoved(v38);
        end;
        v22:updateParts();
    end);
    v22:updateParts();
end;
local function v46(v39, v40, v41, v42) --[[ Line: 93 ]] --[[ Name: sortedInsert ]]
    local v43 = 1;
    local v44 = #v39;
    while v44 - v43 > 1 do
        local v45 = math.floor(v43 + (v44 - v43) / 2);
        if v41(v40, v39[v45]) then
            v44 = v45;
        else
            v43 = v45 + 1;
        end;
    end;
    if v43 < v42 then
        table.insert(v39, v43, v40);
        if v42 <= v44 then
            table.remove(v39, v44);
        end;
    end;
end;
isInFrontOf = function(v47, v48, v49) --[[ Line: 113 ]] --[[ Name: isInFrontOf ]]
    return (v48 - v47):Dot(v49) > 0;
end;
v7.collectParts = function(v50) --[[ Line: 118 ]] --[[ Name: collectParts ]]
    -- upvalues: v46 (copy), v3 (copy)
    local v51 = {};
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    if not l_CurrentCamera_1 then
        return;
    else
        local l_Position_4 = l_CurrentCamera_1.CFrame.Position;
        local function v56(v54, v55) --[[ Line: 127 ]] --[[ Name: sortFunc ]]
            return v54.AngularSize > v55.AngularSize;
        end;
        local function _(v57, v58) --[[ Line: 130 ]] --[[ Name: partAngularSize ]]
            -- upvalues: l_Position_4 (copy)
            local l_Magnitude_0 = (v57 - l_Position_4).Magnitude;
            return v58.Magnitude / l_Magnitude_0;
        end;
        for v61, _ in pairs(v50.trackedParts) do
            local l_ClassName_0 = v61.ClassName;
            local v64 = nil;
            if l_ClassName_0 == "Model" then
                v64 = v61:GetPivot().Position;
                if isInFrontOf(l_CurrentCamera_1.CFrame.Position, v64, l_CurrentCamera_1.CFrame.LookVector) then
                    local v65 = {};
                    local l_v64_0 = v64;
                    local l_v61_ExtentsSize_0 = v61:GetExtentsSize();
                    local l_Magnitude_1 = (l_v64_0 - l_Position_4).Magnitude;
                    v65.AngularSize = l_v61_ExtentsSize_0.Magnitude / l_Magnitude_1;
                    v65.Instance = v61;
                    v46(v51, v65, v56, v3.WorldProvider.AdornedPartLimit);
                end;
            elseif l_ClassName_0 == "Attachment" then
                v64 = v61.WorldPosition;
                if isInFrontOf(l_CurrentCamera_1.CFrame.Position, v64, l_CurrentCamera_1.CFrame.LookVector) then
                    local v69 = {};
                    local l_v64_1 = v64;
                    local v71 = Vector3.new();
                    local l_Magnitude_2 = (l_v64_1 - l_Position_4).Magnitude;
                    v69.AngularSize = v71.Magnitude / l_Magnitude_2;
                    v69.Instance = v61;
                    v46(v51, v69, v56, v3.WorldProvider.AdornedPartLimit);
                end;
            elseif l_ClassName_0 == "Part" then
                v64 = v61.Position;
                if isInFrontOf(l_CurrentCamera_1.CFrame.Position, v64, l_CurrentCamera_1.CFrame.LookVector) then
                    local v73 = {};
                    local l_v64_2 = v64;
                    local l_Size_0 = v61.Size;
                    local l_Magnitude_3 = (l_v64_2 - l_Position_4).Magnitude;
                    v73.AngularSize = l_Size_0.Magnitude / l_Magnitude_3;
                    v73.Instance = v61;
                    v46(v51, v73, v56, v3.WorldProvider.AdornedPartLimit);
                end;
            end;
        end;
        return v51;
    end;
end;
v7.prepareAdornmentMap = function(v77, v78) --[[ Line: 171 ]] --[[ Name: prepareAdornmentMap ]]
    -- upvalues: v4 (copy), l_CollectionService_0 (copy), l_TagEditorShowTextSeparately_0 (copy)
    local v79 = {};
    for _, v81 in pairs(v4.Get():GetTags()) do
        v79[v81.Name] = v81;
    end;
    local v82 = {};
    for v83 = 1, #v78 do
        local l_l_CollectionService_0_Tags_0 = l_CollectionService_0:GetTags(v78[v83].Instance);
        local v85 = {};
        local v86 = {};
        local v87 = {};
        local v88 = {};
        local v89 = {};
        local v90 = false;
        for v91 = 1, #l_l_CollectionService_0_Tags_0 do
            local v92 = l_l_CollectionService_0_Tags_0[v91];
            local v93 = v79[v92];
            if v77.trackedTags[v92] and v93 then
                if v93.DrawType == "Outline" then
                    v85[#v85 + 1] = v93.Color;
                elseif v93.DrawType == "Box" then
                    v86[#v86 + 1] = v93.Color;
                elseif v93.DrawType == "Icon" then
                    v87[#v87 + 1] = v93.Icon;
                elseif not l_TagEditorShowTextSeparately_0 and v93.DrawType == "Text" then
                    v88[#v88 + 1] = v92;
                elseif v93.DrawType == "Sphere" then
                    v89[#v89 + 1] = v93.Color;
                end;
                if l_TagEditorShowTextSeparately_0 and v93.ShowText then
                    v88[#v88 + 1] = v92;
                end;
                if v93.AlwaysOnTop then
                    v90 = true;
                end;
            end;
        end;
        local v94 = v77.partIds[v78[v83].Instance];
        if #v85 > 0 then
            local v95 = 0;
            local v96 = 0;
            local v97 = 0;
            for v98 = 1, #v85 do
                v95 = v95 + v85[v98].r;
                v96 = v96 + v85[v98].g;
                v97 = v97 + v85[v98].b;
            end;
            v95 = v95 / #v85;
            v96 = v96 / #v85;
            v97 = v97 / #v85;
            local v99 = Color3.new(v95, v96, v97);
            v82["Outline:" .. v94] = {
                Id = v94, 
                Part = v78[v83].Instance, 
                DrawType = "Outline", 
                Color = v99, 
                AlwaysOnTop = v90
            };
        end;
        if #v86 > 0 then
            local v100 = 0;
            local v101 = 0;
            local v102 = 0;
            for v103 = 1, #v86 do
                v100 = v100 + v86[v103].r;
                v101 = v101 + v86[v103].g;
                v102 = v102 + v86[v103].b;
            end;
            v100 = v100 / #v86;
            v101 = v101 / #v86;
            v102 = v102 / #v86;
            local v104 = Color3.new(v100, v101, v102);
            v82["Box:" .. v94] = {
                Id = v94, 
                Part = v78[v83].Instance, 
                DrawType = "Box", 
                Color = v104, 
                AlwaysOnTop = v90
            };
        end;
        if #v87 > 0 then
            v82["Icon:" .. v94] = {
                Id = v94, 
                Part = v78[v83].Instance, 
                DrawType = "Icon", 
                Icon = v87, 
                AlwaysOnTop = v90
            };
        end;
        if #v88 > 0 then
            table.sort(v88);
            if #v87 > 0 then
                v88[#v88 + 1] = "";
            end;
            v82["Text:" .. v94] = {
                Id = v94, 
                Part = v78[v83].Instance, 
                DrawType = "Text", 
                TagName = v88, 
                AlwaysOnTop = v90
            };
        end;
        if #v89 > 0 then
            local v105 = 0;
            local v106 = 0;
            local v107 = 0;
            for v108 = 1, #v89 do
                v105 = v105 + v89[v108].r;
                v106 = v106 + v89[v108].g;
                v107 = v107 + v89[v108].b;
            end;
            v105 = v105 / #v89;
            v106 = v106 / #v89;
            v107 = v107 / #v89;
            local v109 = Color3.new(v105, v106, v107);
            v82["Sphere:" .. v94] = {
                Id = v94, 
                Part = v78[v83].Instance, 
                DrawType = "Sphere", 
                Color = v109, 
                AlwaysOnTop = v90
            };
        end;
    end;
    return v82;
end;
v7.updateParts = function(v110) --[[ Line: 301 ]] --[[ Name: updateParts ]]
    debug.profilebegin("[Tag Editor] Update WorldProvider");
    v110:setState({
        partsList = v110:prepareAdornmentMap((v110:collectParts()))
    });
    debug.profileend();
end;
v7.instanceAdded = function(v111, v112) --[[ Line: 315 ]] --[[ Name: instanceAdded ]]
    if v111.trackedParts[v112] then
        v111.trackedParts[v112] = v111.trackedParts[v112] + 1;
        return;
    else
        v111.trackedParts[v112] = 1;
        v111.nextId = v111.nextId + 1;
        v111.partIds[v112] = v111.nextId;
        return;
    end;
end;
v7.instanceRemoved = function(v113, v114) --[[ Line: 325 ]] --[[ Name: instanceRemoved ]]
    if not v113.trackedParts[v114] then
        return;
    elseif v113.trackedParts[v114] <= 1 then
        v113:removeInstance(v114);
        return;
    else
        v113.trackedParts[v114] = v113.trackedParts[v114] - 1;
        return;
    end;
end;
v7.removeInstance = function(v115, v116) --[[ Line: 337 ]] --[[ Name: removeInstance ]]
    v115.trackedParts[v116] = nil;
    v115.partIds[v116] = nil;
end;
local function _(v117) --[[ Line: 342 ]] --[[ Name: isTypeAllowed ]]
    if v117.ClassName == "Model" then
        return true;
    elseif v117.ClassName == "Attachment" then
        return true;
    elseif v117:IsA("BasePart") then
        return true;
    else
        return false;
    end;
end;
v7.tagAdded = function(v119, v120) --[[ Line: 355 ]] --[[ Name: tagAdded ]]
    -- upvalues: l_CollectionService_0 (copy), l_TagEditorExternalUpdate_0 (copy)
    assert(not v119.trackedTags[v120], "Newly added tag must not already be tracked");
    v119.trackedTags[v120] = true;
    for _, v122 in pairs(l_CollectionService_0:GetTagged(v120)) do
        if v122.ClassName == "Model" or v122.ClassName == "Attachment" or v122:IsA("BasePart") and true or false then
            if v122:IsDescendantOf(workspace) then
                v119:instanceAdded(v122);
            end;
            if not v119.instanceAncestryChangedConns[v122] then
                v119.instanceAncestryChangedConns[v122] = v122.AncestryChanged:Connect(function() --[[ Line: 364 ]]
                    -- upvalues: v119 (copy), v122 (copy)
                    if not v119.trackedParts[v122] and v122:IsDescendantOf(workspace) then
                        v119:instanceAdded(v122);
                        v119:updateParts();
                        return;
                    else
                        if v119.trackedParts[v122] and not v122:IsDescendantOf(workspace) then
                            v119:removeInstance(v122);
                            v119:updateParts();
                        end;
                        return;
                    end;
                end);
            end;
        end;
    end;
    if not l_TagEditorExternalUpdate_0 then
        v119.instanceAddedConns[v120] = l_CollectionService_0:GetInstanceAddedSignal(v120):Connect(function(v123) --[[ Line: 377 ]]
            -- upvalues: v119 (copy)
            if not (v123.ClassName == "Model" or v123.ClassName == "Attachment" or v123:IsA("BasePart") and true or false) then
                return;
            else
                if v123:IsDescendantOf(workspace) then
                    v119:instanceAdded(v123);
                    v119:updateParts();
                end;
                if not v119.instanceAncestryChangedConns[v123] then
                    v119.instanceAncestryChangedConns[v123] = v123.AncestryChanged:Connect(function() --[[ Line: 386 ]]
                        -- upvalues: v119 (ref), v123 (copy)
                        if not v119.trackedParts[v123] and v123:IsDescendantOf(workspace) then
                            v119:instanceAdded(v123);
                            v119:updateParts();
                            return;
                        else
                            if v119.trackedParts[v123] and not v123:IsDescendantOf(workspace) then
                                v119:removeInstance(v123);
                                v119:updateParts();
                            end;
                            return;
                        end;
                    end);
                end;
                return;
            end;
        end);
        v119.instanceRemovedConns[v120] = l_CollectionService_0:GetInstanceRemovedSignal(v120):Connect(function(v124) --[[ Line: 397 ]]
            -- upvalues: v119 (copy)
            if not (v124.ClassName == "Model" or v124.ClassName == "Attachment" or v124:IsA("BasePart") and true or false) then
                return;
            else
                v119:instanceRemoved(v124);
                v119:updateParts();
                return;
            end;
        end);
    end;
end;
v7.tagRemoved = function(v125, v126) --[[ Line: 407 ]] --[[ Name: tagRemoved ]]
    -- upvalues: l_CollectionService_0 (copy)
    assert(v125.trackedTags[v126], "Attempted to remove a tag that isn't tracked");
    v125.trackedTags[v126] = nil;
    for _, v128 in pairs(l_CollectionService_0:GetTagged(v126)) do
        if v128:IsDescendantOf(workspace) then
            v125:instanceRemoved(v128);
        end;
    end;
    v125.instanceAddedConns[v126] = nil;
    v125.instanceRemovedConns[v126] = nil;
end;
v7.willUnmount = function(v129) --[[ Line: 419 ]] --[[ Name: willUnmount ]]
    v129.onTagsUpdatedConn:Disconnect();
    v129.instanceAddedConns:clean();
    v129.instanceRemovedConns:clean();
    v129.instanceAncestryChangedConns:clean();
    v129.maid:clean();
end;
v7.render = function(v130) --[[ Line: 428 ]] --[[ Name: render ]]
    -- upvalues: v2 (copy)
    return v2.oneChild(v130.props[v2.Children])(v130.state.partsList);
end;
return v7;