local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_Promise_0 = v2.Util.Promise;
local l_Pane_0 = v2.UI.Pane;
local l_Button_0 = v2.UI.Button;
local l_game_FastFlag_0 = game:GetFastFlag("TurnOffNPPThrottling", false);
local v12 = v1.PureComponent:extend("PublishFrame");
local _, l_result_0 = pcall(function() --[[ Line: 42 ]]
    return game:GetService("PackageUIService");
end);
local l_Selection_0 = game:GetService("Selection");
local l_game_FastInt_0 = game:GetFastInt("PackageUploadThrottleTimeMin", 2);
local l_game_FastInt_1 = game:GetFastInt("PackageUploadThrottleAllowedPackages", 180);
local v18 = {
    PackagePublishSuccess = "Package published! {%s, %s}", 
    PackagePublishFailure = "Failed to publish package. Retrying... {%s, %s}", 
    PackagePublishSkipped = "Package skipped due to no changes detected. {%s, %s}", 
    TempContainerName = "NPP_Cloned_Instances", 
    UpToDateString = "Up To Date", 
    NewVersionString = "New Version Available", 
    OperationEnded = "Hierarchical Publish Operation completed!", 
    OperationCancelled = "Hierarchal Publish Operation cancelled.", 
    LatestVersionFailure = "There was an issue getting the latest version of a package. Ending process."
};
local v19 = {
    Ready = 0, 
    Pending = 1, 
    Updating = 2, 
    Failed = 3, 
    Success = 4, 
    Skipped = 5
};
local v20 = {
    [v19.Updating] = 0.3, 
    [v19.Pending] = 0.7, 
    [v19.Failed] = 0.7, 
    [v19.Success] = 1, 
    [v19.Skipped] = 1
};
local v21 = {
    [v19.Updating] = Color3.fromRGB(145, 50, 235), 
    [v19.Pending] = Color3.fromRGB(255, 185, 0), 
    [v19.Failed] = Color3.fromRGB(225, 50, 25), 
    [v19.Success] = Color3.fromRGB(25, 225, 40), 
    [v19.Skipped] = Color3.fromRGB(44, 101, 29)
};
local function _(v22) --[[ Line: 91 ]] --[[ Name: getPackageLink ]]
    if not v22 then
        return;
    else
        return v22:FindFirstChildOfClass("PackageLink");
    end;
end;
local function v25(v24) --[[ Line: 98 ]] --[[ Name: getName ]]
    return v24.Name;
end;
local function _(v26) --[[ Line: 101 ]] --[[ Name: isRestricted ]]
    -- upvalues: v25 (copy)
    return not pcall(v25, v26);
end;
local function v28(v29, v30, v31) --[[ Line: 105 ]] --[[ Name: _recursiveChangedPackageScan ]]
    -- upvalues: v25 (copy), v28 (copy)
    if not pcall(v25, v30) then
        return;
    else
        local v32 = if not v30 then nil else v30:FindFirstChildOfClass("PackageLink");
        if v32 then
            local v33 = v31[v32.PackageId];
            if v33 and v33.oldVersionId == v32.VersionNumber then
                table.insert(v29, v30);
                return;
            end;
        end;
        for _, v35 in v30:GetChildren() do
            v28(v29, v35, v31);
        end;
        return;
    end;
end;
local function _(v36, v37) --[[ Line: 127 ]] --[[ Name: getChangedPackageInstances ]]
    -- upvalues: v28 (copy)
    local v38 = {};
    v28(v38, v36, v37);
    return v38;
end;
local function v40(v41, v42, v43) --[[ Line: 133 ]] --[[ Name: _recursivePackageRelationScan ]]
    -- upvalues: v25 (copy), v40 (copy)
    if not pcall(v25, v42) then
        return;
    else
        local v44 = if not v42 then nil else v42:FindFirstChildOfClass("PackageLink");
        if v44 then
            if not v41[v44.PackageId] then
                v41[v44.PackageId] = {
                    instance = v42, 
                    parents = {}
                };
            end;
            if v43 then
                v41[v44.PackageId].parents[v43] = v41[v43];
            end;
            v43 = v44.PackageId;
        end;
        for _, v46 in v42:GetChildren() do
            v40(v41, v46, v43);
        end;
        return;
    end;
end;
local function _(v47) --[[ Line: 158 ]] --[[ Name: getAllPackageRelationships ]]
    -- upvalues: v40 (copy)
    local v48 = {};
    v40(v48, v47, nil);
    return v48;
end;
local function v54(v50, v51) --[[ Line: 165 ]] --[[ Name: setPackageToVersion ]]
    -- upvalues: l_result_0 (copy)
    if not if not v50 then nil else v50:FindFirstChildOfClass("PackageLink") then
        return;
    elseif typeof(v51) ~= "number" then
        return;
    else
        local l_status_1, l_result_1 = pcall(function() --[[ Line: 173 ]]
            -- upvalues: l_result_0 (ref), v50 (copy), v51 (copy)
            return l_result_0:SetPackageVersion(v50, v51);
        end);
        if not l_status_1 or not l_result_1 then
            warn(l_result_1);
            return;
        else
            return l_result_1;
        end;
    end;
end;
local function v55(v56) --[[ Line: 185 ]] --[[ Name: getParentPackage ]]
    -- upvalues: v55 (copy)
    if not v56 then
        return;
    else
        local l_Parent_1 = v56.Parent;
        if not l_Parent_1 then
            return;
        elseif if not l_Parent_1 then nil else l_Parent_1:FindFirstChildOfClass("PackageLink") then
            return l_Parent_1;
        else
            return v55(l_Parent_1);
        end;
    end;
end;
local function v60(v58, v59) --[[ Line: 203 ]] --[[ Name: sortByPackageDepth ]]
    if v58.Depth == v59.Depth then
        return v58.PackageId < v59.PackageId;
    else
        return v58.Depth < v59.Depth;
    end;
end;
local function v79(v61, v62) --[[ Line: 210 ]] --[[ Name: scanForRelatedPackages ]]
    -- upvalues: v40 (copy), l_result_0 (copy)
    assert(v61);
    assert(v62);
    local v63 = if not v61 then nil else v61:FindFirstChildOfClass("PackageLink");
    assert(v63);
    local v64 = {};
    v40(v64, v62, nil);
    local l_v64_0 = v64;
    v64 = {};
    local v66 = {};
    local function v67(v68, v69, v70) --[[ Line: 221 ]] --[[ Name: recurse ]]
        -- upvalues: l_v64_0 (copy), v67 (copy), v64 (copy), l_result_0 (ref), v61 (copy), v66 (copy)
        local v71 = l_v64_0[v68];
        if v70[v71] then
            return;
        else
            v70[v71] = true;
            for v72, _ in pairs(v71.parents) do
                v67(v72, v69 + 1, table.clone(v70));
            end;
            if v64[v68] then
                v64[v68].Depth = math.max(v64[v68].Depth, v69);
                return;
            else
                local l_status_2, l_result_2 = pcall(function() --[[ Line: 237 ]]
                    -- upvalues: v68 (copy), l_result_0 (ref)
                    local v74 = string.match(v68, "%d+");
                    return l_result_0:GetPackageInfo(v74);
                end);
                if not l_status_2 then
                    error(l_result_2);
                end;
                local v77 = v69 == 0;
                local v78 = {
                    PackageId = v68, 
                    FoundInstance = if v77 then v61 else v71.instance, 
                    Depth = v69, 
                    Changed = v77, 
                    IsSelected = v77, 
                    LatestVersionNumber = l_result_2.LatestVersionNumber, 
                    PackageAssetName = l_result_2.PackageAssetName, 
                    HasEditPermission = l_result_2.PermissionLevel.Value >= Enum.PackagePermission.Edit.Value
                };
                v64[v68] = v78;
                table.insert(v66, v78);
                return;
            end;
        end;
    end;
    v67(v63.PackageId, 0, {});
    return v66;
end;
v12.runScopedMassUpdate = function(v80, v81, v82, v83) --[[ Line: 264 ]] --[[ Name: runScopedMassUpdate ]]
    -- upvalues: v28 (copy), v19 (copy), v54 (copy)
    local v84 = {};
    v28(v84, v82, v83);
    local l_v84_0 = v84;
    if #l_v84_0 > 0 then
        v81.PublishStatus = v19.Updating;
        v80:setState({});
        for _, v87 in ipairs(l_v84_0) do
            local v88 = v83[(if not v87 then nil else v87:FindFirstChildOfClass("PackageLink")).PackageId];
            local v89 = 0;
            while true do
                if v80.state.isCancelling then
                    return;
                elseif v54(v87, v88.newVersionId) then
                    v81.Changed = true;
                    break;
                else
                    v80:setState({
                        canCancel = v89 >= 3
                    });
                    v89 = v89 + 1;
                    task.wait(0.5);
                end;
            end;
        end;
    end;
end;
v12.getLatestVersionClone = function(v90, v91) --[[ Line: 294 ]] --[[ Name: getLatestVersionClone ]]
    -- upvalues: v18 (copy), v54 (copy)
    local l_FoundInstance_0 = v91.FoundInstance;
    if not l_FoundInstance_0 then
        warn(v18.LatestVersionFailure);
        return;
    else
        l_FoundInstance_0 = l_FoundInstance_0:Clone();
        l_FoundInstance_0.Parent = v90.state.tempContainer;
        if v91.IsSelected then
            return l_FoundInstance_0;
        else
            local v93 = 0;
            local v94 = nil;
            while true do
                if v90.state.isCancelling then
                    return;
                else
                    v94 = v54(l_FoundInstance_0, v91.LatestVersionNumber);
                    if not v94 then
                        local v95 = v93 >= 3;
                        if v90.state.canCancel ~= v95 then
                            v90:setState({
                                canCancel = v95
                            });
                        end;
                        warn(string.format(v18.PackagePublishFailure, v91.PackageAssetName, v91.PackageId));
                        task.wait(2 ^ math.min(v93, 2));
                        v93 = v93 + 1;
                    end;
                    if v94 then
                        return v94;
                    end;
                end;
            end;
        end;
    end;
end;
v12.promiseToPublishPackage = function(v96, v97, v98) --[[ Line: 333 ]] --[[ Name: promiseToPublishPackage ]]
    -- upvalues: l_Promise_0 (copy), v19 (copy), v18 (copy), l_result_0 (copy)
    return l_Promise_0.new(function(v99, v100) --[[ Line: 334 ]]
        -- upvalues: v96 (copy), v97 (copy), v98 (copy), v19 (ref), v18 (ref), l_result_0 (ref)
        task.spawn(function() --[[ Line: 335 ]]
            -- upvalues: v96 (ref), v100 (copy), v97 (ref), v98 (ref), v19 (ref), v18 (ref), v99 (copy), l_result_0 (ref)
            if v96.state.isCancelling then
                return v100();
            else
                v96:setState({
                    canCancel = false
                });
                local v101 = v96:getLatestVersionClone(v97);
                if not v101 then
                    return v100();
                else
                    if not v97.IsSelected then
                        v96:runScopedMassUpdate(v97, v101, v98);
                    end;
                    if not v97.Changed then
                        v97.PublishStatus = v19.Skipped;
                        v96:setState({});
                        warn(string.format(v18.PackagePublishSkipped, v97.PackageAssetName, v97.PackageId));
                        return v99();
                    else
                        local v102 = v101:Clone();
                        v102.Archivable = false;
                        v102.Parent = v101.Parent;
                        local v103 = if not v102 then nil else v102:FindFirstChildOfClass("PackageLink");
                        local v104 = if not v101 then nil else v101:FindFirstChildOfClass("PackageLink");
                        if v104.Status == v18.UpToDateString then
                            v104:GetPropertyChangedSignal("Status"):Wait();
                        end;
                        v97.PublishStatus = v19.Pending;
                        v96:setState({});
                        local v105 = 0;
                        local v106 = nil;
                        local v107 = nil;
                        while true do
                            if v96.state.isCancelling then
                                return v100();
                            else
                                local l_status_3, l_result_3 = pcall(function() --[[ Line: 380 ]]
                                    -- upvalues: l_result_0 (ref), v101 (copy)
                                    l_result_0:PublishPackage(v101, false);
                                end);
                                v106 = l_status_3;
                                v107 = l_result_3;
                                if v106 then
                                    warn(string.format(v18.PackagePublishSuccess, v97.PackageAssetName, v97.PackageId));
                                    if not string.find(v103.Status, v18.NewVersionString) then
                                        v103:GetPropertyChangedSignal("Status"):Wait();
                                    end;
                                    l_status_3 = (if not v101 then nil else v101:FindFirstChildOfClass("PackageLink")).VersionNumber;
                                    v98[v97.PackageId] = {
                                        oldVersionId = v97.LatestVersionNumber, 
                                        newVersionId = l_status_3
                                    };
                                    v97.PublishStatus = v19.Success;
                                    v96:setState({});
                                else
                                    warn(v107);
                                    v97.PublishStatus = v19.Failed;
                                    v96:setState({
                                        canCancel = v105 >= 3
                                    });
                                    warn(string.format(v18.PackagePublishFailure, v97.PackageAssetName, v97.PackageId));
                                    task.wait(2 ^ math.min(v105, 2));
                                    v105 = v105 + 1;
                                    v97.PublishStatus = v19.Pending;
                                    v96:setState({});
                                end;
                                if v106 then
                                    v101:Destroy();
                                    v102:Destroy();
                                    return v99();
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end);
    end);
end;
v12.waitForPromises = function(v110, v111, v112) --[[ Line: 422 ]] --[[ Name: waitForPromises ]]
    -- upvalues: l_game_FastFlag_0 (copy), l_game_FastInt_0 (copy), l_game_FastInt_1 (copy)
    if not v111 or #v111 == 0 then
        return true, nil;
    else
        local l_BindableEvent_0 = Instance.new("BindableEvent");
        local v114 = 0;
        for _, v116 in v111 do
            if not l_game_FastFlag_0 and v114 >= 5 and not l_BindableEvent_0.Event:Wait() then
                return;
            else
                if l_game_FastFlag_0 then
                    local v117 = os.clock();
                    local v118 = l_game_FastInt_0 * 60;
                    if v110.NumPromised == l_game_FastInt_1 and v117 < v110.PublishStartTime + v118 then
                        task.wait(v110.PublishStartTime + v118 - v117 + 5);
                        v110.NumPromised = 0;
                        v110.PublishStartTime = os.clock();
                    end;
                    v110.NumPromised = v110.NumPromised + 1;
                else
                    local v119 = v110.PublishStartTime + v110.NumPromised * 2;
                    local v120 = os.clock() - v119;
                    if v120 < 2 then
                        task.wait(2 - v120);
                    end;
                    v110.NumPromised = v110.NumPromised + 1;
                end;
                v114 = v114 + 1;
                v110:promiseToPublishPackage(v116, v112):andThen(function() --[[ Line: 462 ]]
                    -- upvalues: v114 (ref), l_BindableEvent_0 (copy)
                    v114 = v114 - 1;
                    l_BindableEvent_0:Fire(true);
                end):catch(function() --[[ Line: 466 ]]
                    -- upvalues: l_BindableEvent_0 (copy)
                    l_BindableEvent_0:Fire(false);
                end);
            end;
        end;
        while true do
            if v114 > 0 then
                if not l_BindableEvent_0.Event:Wait() then
                    return;
                end;
            else
                l_BindableEvent_0:Destroy();
                return true;
            end;
        end;
    end;
end;
v12.doPackagePublishing = function(v121, v122) --[[ Line: 483 ]] --[[ Name: doPackagePublishing ]]
    local v123 = {};
    local v124 = nil;
    local v125 = nil;
    v121.PublishStartTime = os.clock();
    v121.NumPromised = 0;
    for v126 = 1, #v122 do
        local v127 = v122[v126];
        if v124 ~= v127.Depth then
            if not v121:waitForPromises(v125, v123) then
                return;
            else
                v124 = v127.Depth;
                v125 = {};
            end;
        end;
        table.insert(v125, v127);
    end;
    v121:waitForPromises(v125, v123);
end;
v12.publishSelectedPackageHierarchy = function(v128) --[[ Line: 505 ]] --[[ Name: publishSelectedPackageHierarchy ]]
    -- upvalues: v18 (copy), l_Selection_0 (copy), v55 (copy), v54 (copy), v1 (copy)
    if not v128.state.canPublish then
        return;
    else
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Archivable = false;
        l_Folder_0.Name = v18.TempContainerName;
        l_Folder_0.Parent = game:GetService("ServerStorage");
        v128:setState({
            isPublishing = true, 
            canPublish = false, 
            isCancelling = false, 
            canCancel = false, 
            tempContainer = l_Folder_0
        });
        v128:doPackagePublishing(v128.state.packageLists);
        if not v128.state.isCancelling then
            local l_selectedInstance_0 = v128.state.selectedInstance;
            local v131 = table.find(l_Selection_0:Get(), l_selectedInstance_0);
            while true do
                local l_l_selectedInstance_0_0 = l_selectedInstance_0;
                local v133;
                if not l_l_selectedInstance_0_0 then
                    v133 = nil;
                else
                    local l_Parent_2 = l_l_selectedInstance_0_0.Parent;
                    v133 = if not l_Parent_2 then nil else if if not l_Parent_2 then nil else l_Parent_2:FindFirstChildOfClass("PackageLink") then l_Parent_2 else v55(l_Parent_2);
                end;
                if v133 and string.find((if not v133 then nil else v133:FindFirstChildOfClass("PackageLink")).Status, v18.NewVersionString) then
                    l_selectedInstance_0 = v133;
                else
                    break;
                end;
            end;
            local v135 = v54(l_selectedInstance_0, 0);
            if v131 then
                l_Selection_0:Add({
                    v135
                });
            end;
            warn(v18.OperationEnded);
        else
            warn(v18.OperationCancelled);
        end;
        l_Folder_0:Destroy();
        v128:setState({
            isPublishing = false, 
            isCancelling = false, 
            canCancel = false, 
            tempContainer = v1.None
        });
        v128:onChangeSelection();
        return;
    end;
end;
v12.onChangeSelection = function(v136) --[[ Line: 559 ]] --[[ Name: onChangeSelection ]]
    -- upvalues: l_Selection_0 (copy), v1 (copy), v18 (copy), v79 (copy), v60 (copy), v19 (copy)
    if not v136.props.Enabled then
        return;
    elseif v136.state.isPublishing then
        return;
    else
        local v137 = l_Selection_0:Get();
        if #v137 ~= 1 then
            v136:setState({
                selectedInstance = v1.None, 
                packageLists = v1.None, 
                canPublish = false
            });
            return;
        else
            local v138 = v137[1];
            local v139 = if not v138 then nil else v138:FindFirstChildOfClass("PackageLink");
            if not v139 or v139.Status == v18.UpToDateString then
                v136:setState({
                    selectedInstance = v1.None, 
                    packageLists = v1.None, 
                    canPublish = false
                });
                return;
            else
                local v140 = v79(v138, game);
                table.sort(v140, v60);
                for _, v142 in ipairs(v140) do
                    v142.PublishStatus = v19.Ready;
                end;
                v136:setState({
                    selectedInstance = v138, 
                    packageLists = v140, 
                    canPublish = true
                });
                return;
            end;
        end;
    end;
end;
v12.didMount = function(v143) --[[ Line: 604 ]] --[[ Name: didMount ]]
    -- upvalues: l_Selection_0 (copy)
    l_Selection_0.SelectionChanged:Connect(function() --[[ Line: 605 ]]
        -- upvalues: v143 (copy)
        v143:onChangeSelection();
    end);
end;
v12.didUpdate = function(v144, v145) --[[ Line: 610 ]] --[[ Name: didUpdate ]]
    if v145.Enabled == v144.props.Enabled then
        return;
    else
        if v144.props.Enabled then
            v144:onChangeSelection();
        end;
        return;
    end;
end;
local v146 = v1.PureComponent:extend("ProgressBar");
v146.render = function(v147) --[[ Line: 620 ]] --[[ Name: render ]]
    -- upvalues: v20 (copy), v21 (copy), v1 (copy)
    local l_publishStatus_0 = v147.props.publishStatus;
    local v149 = v20[l_publishStatus_0];
    local v150 = v21[l_publishStatus_0];
    return v149 and v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 1), 
        BackgroundColor3 = Color3.new(0, 0, 0), 
        Size = UDim2.new(0.9, 0, 0.1, 0), 
        Position = UDim2.new(0.5, 0, 1, -3)
    }, {
        uiCorner = v1.createElement("UICorner", {
            CornerRadius = UDim.new(0.5, 0.5)
        }), 
        uiStroke = v1.createElement("UIStroke", {
            Thickness = 2
        }), 
        progressBar = v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundColor3 = v150, 
            Size = UDim2.new(v149, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0.5, 0)
        }, {
            uiCorner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0.5)
            })
        })
    });
end;
local v151 = v1.PureComponent:extend("PackageBoxItem");
v151.render = function(v152) --[[ Line: 654 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v146 (copy)
    local l_props_0 = v152.props;
    local l_packageAssetName_0 = l_props_0.packageAssetName;
    local l_publishStatus_1 = l_props_0.publishStatus;
    local v156 = if l_props_0.hasEditPermission then Color3.fromRGB(200, 200, 200) else Color3.fromRGB(100, 100, 100);
    return v1.createElement("Frame", {
        BackgroundColor3 = v156, 
        Size = UDim2.new(0, 80, 0, 80), 
        Position = UDim2.new(0, 84 * l_props_0.row, 0, 84 * l_props_0.column)
    }, {
        packageName = v1.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = l_packageAssetName_0, 
            TextWrapped = true, 
            TextSize = 16, 
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0.5, 0, 0.5, 0)
        }), 
        progressBar = v1.createElement(v146, {
            publishStatus = l_publishStatus_1
        })
    });
end;
v12.render = function(v157) --[[ Line: 682 ]] --[[ Name: render ]]
    -- upvalues: v1 (copy), v151 (copy), l_Pane_0 (copy), l_Button_0 (copy)
    local l_Localization_1 = v157.props.Localization;
    local l_mainWindow_0 = v157.props.Stylizer.mainWindow;
    local l_canPublish_0 = v157.state.canPublish;
    local l_isPublishing_0 = v157.state.isPublishing;
    local l_canCancel_0 = v157.state.canCancel;
    local l_isCancelling_0 = v157.state.isCancelling;
    local v164 = {};
    local v165 = 0;
    local v166 = 0;
    if l_canPublish_0 or l_isPublishing_0 or l_canCancel_0 or l_isCancelling_0 then
        local v167 = nil;
        local v168 = -1;
        local v169 = 0;
        for _, v171 in ipairs(v157.state.packageLists) do
            if v167 ~= v171.Depth then
                v167 = v171.Depth;
                v168 = v168 + 1;
                v166 = math.max(v166, v169 + 1);
                v169 = 0;
            else
                v169 = v169 + 1;
            end;
            v164[v171.PackageId] = v1.createElement(v151, {
                row = v168, 
                column = v169, 
                packageAssetName = v171.PackageAssetName, 
                publishStatus = v171.PublishStatus, 
                hasEditPermission = v171.HasEditPermission
            });
        end;
        v165 = math.max(0, v168 + 1);
        v166 = math.max(v166, v169 + 1);
    end;
    return v1.createElement(l_Pane_0, {
        BackgroundColor = l_mainWindow_0.backgroundColor
    }, {
        mainDisplay = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 0), 
            Size = UDim2.new(1, 0, 1, -100), 
            Position = UDim2.new(0.5, 0, 0, 0)
        }, {
            scrollFrame = v1.createElement("ScrollingFrame", {
                ScrollingDirection = Enum.ScrollingDirection.XY, 
                BackgroundTransparency = 1, 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Size = UDim2.new(1, -8, 1, -8), 
                Position = UDim2.new(0.5, 0, 0.5, 0), 
                CanvasSize = UDim2.new(0, 80 * v165 + 4 * math.max(0, v165 - 1), 0, 80 * v166 + 4 * math.max(0, v166 - 1))
            }, v164)
        }), 
        bottomBar = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0.5, 1), 
            Size = UDim2.new(1, 0, 0, 100), 
            Position = UDim2.new(0.5, 0, 1, 0)
        }, {
            cancelButton = l_canCancel_0 and v1.createElement(l_Button_0, {
                Text = l_Localization_1:getText("Action", "Cancel"), 
                AnchorPoint = Vector2.new(0, 0.5), 
                Size = UDim2.new(0.3, 0, 1, -8), 
                Position = UDim2.new(0, 4, 0.5, 0), 
                OnClick = function() --[[ Line: 757 ]] --[[ Name: OnClick ]]
                    -- upvalues: v157 (copy)
                    v157:setState({
                        canCancel = false, 
                        isCancelling = true
                    });
                end
            }), 
            publishHierarchyButton = l_canPublish_0 and v1.createElement(l_Button_0, {
                Text = l_Localization_1:getText("Action", "Publish"), 
                AnchorPoint = Vector2.new(1, 0.5), 
                Size = UDim2.new(0.3, 0, 1, -8), 
                Position = UDim2.new(1, -4, 0.5, 0), 
                OnClick = function() --[[ Line: 769 ]] --[[ Name: OnClick ]]
                    -- upvalues: v157 (copy)
                    v157:publishSelectedPackageHierarchy();
                end
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v12));