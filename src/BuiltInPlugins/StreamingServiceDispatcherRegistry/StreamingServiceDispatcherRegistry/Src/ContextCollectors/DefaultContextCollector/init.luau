local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v2 = v1.GetService("StreamingService");
local v3 = v1.GetService("ChatbotUIService");
local v4 = v1.GetService("ConversationalAIAcceptanceService");
local v5 = v1.GetService("Selection");
local v6 = v1.GetService("HttpService");
local v7 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local v8 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v9 = require(script.Parent.RecentInstancesContext);
local v10 = {};
local v11 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagShowViewportContextVisualization);
local v12 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDebugConvAIEnableAudioCapabilities);
local v13 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPRecentSelectedInstanceCount);
local v14 = require(l_script_FirstAncestor_0.Src.Flags.getFIntViewportContextCollectionHeight);
local v15 = require(l_script_FirstAncestor_0.Src.Flags.getFIntMaxContextAllowedFromSelection);
local v16 = require(l_script_FirstAncestor_0.Src.Flags.getFIntMaxContextAllowedFromViewport);
local v17 = require(l_script_FirstAncestor_0.Src.Flags.getFIntViewportRootMaxAreaFactor);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPDMHierarchySelectedMaxDepth);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPDMHierarchyDefaultDepth);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPDMHierarchyGlobalContainerDepth);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPDMHierarchyMaxBytes);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPCodeRunnerDMHierarchyMaxBytes);
local v23 = require(l_script_FirstAncestor_0.Src.Flags.getFIntCAPCodeRunnerDMHierarchyDepth);
local v24 = require(l_script_FirstAncestor_0.Src.Flags.getFStringCodeRunnerGlobalContainerProportion);
local v25 = OverlapParams.new();
v25.BruteForceAllSlow = true;
local v26 = {
    ServerScriptService = true, 
    ReplicatedStorage = true, 
    ReplicatedFirst = true, 
    Workspace = true, 
    StarterGui = true, 
    StarterPlayer = true
};
local function v31(v27, v28) --[[ Line: 49 ]] --[[ Name: getPositionAndSize ]]
    -- upvalues: v7 (copy)
    local v29, v30 = v7.getPositionAndSize(v27, v28);
    if not v29 or not v30 then
        return;
    else
        return {
            x = math.ceil(v29.X * 100) / 100, 
            y = math.ceil(v29.Y * 100) / 100, 
            z = math.ceil(v29.Z * 100) / 100
        }, {
            x = math.ceil(v30.X * 100) / 100, 
            y = math.ceil(v30.Y * 100) / 100, 
            z = math.ceil(v30.Z * 100) / 100
        };
    end;
end;
local function v38(v32, v33, v34) --[[ Line: 68 ]] --[[ Name: visualizeRoots ]]
    -- upvalues: v11 (copy), v7 (copy)
    if v11() then
        local v35, v36 = v7.getPositionAndSize(v33, v34);
        if v35 and v36 then
            local v37 = v34:ToWorldSpace(CFrame.new(v35));
            v7.addConstraintVisualization(v32, v37, v36, true, Color3.fromRGB(0, 170, 255));
        end;
    end;
end;
local function _(v39, v40) --[[ Line: 78 ]] --[[ Name: shouldIncludeScriptSource ]]
    local v41 = v40.isSelected or v40.isRecent;
    return (not not v39:IsA("Script") or v39:IsA("ModuleScript")) and v41;
end;
local function v56(v43, v44, v45) --[[ Line: 83 ]] --[[ Name: findRootsForParts ]]
    -- upvalues: v16 (copy), v17 (copy), v31 (copy)
    local v46 = v16();
    local v47 = v17() / 100;
    local v48 = {};
    local v49 = 0;
    for _, v51 in v43 do
        if v46 > v49 then
            local l_v51_0 = v51;
            if l_v51_0.Size.X * l_v51_0.Size.Z / v44 <= 1 then
                while true do
                    local l_Parent_0 = l_v51_0.Parent;
                    if l_Parent_0 and l_Parent_0 ~= workspace then
                        local _, v55 = v31(l_Parent_0, v45);
                        if v47 >= v55.x * v55.z / v44 then
                            l_v51_0 = l_Parent_0;
                        else
                            break;
                        end;
                    else
                        break;
                    end;
                end;
                if not v48[l_v51_0] then
                    v48[l_v51_0] = l_v51_0;
                    v49 = v49 + 1;
                end;
            end;
        else
            break;
        end;
    end;
    return v48;
end;
local function v66(v57, v58, v59) --[[ Line: 117 ]] --[[ Name: serializeInstancesInBox ]]
    -- upvalues: v25 (copy), v56 (copy), v38 (copy), v31 (copy), v8 (copy)
    local v60 = {};
    local l_workspace_PartBoundsInBox_0 = workspace:GetPartBoundsInBox(v58, v59, v25);
    for _, v63 in (v56(l_workspace_PartBoundsInBox_0, v59.X * v59.Z, v58)) do
        v38(v57, v63, v58);
        local v64, v65 = v31(v63, v58);
        table.insert(v60, {
            instanceId = v63, 
            assetId = if v63.SourceAssetId > 0 then v63.SourceAssetId else nil, 
            size = {
                x = v65.x, 
                z = v65.z
            }, 
            pos = {
                x = v64.x, 
                z = v64.z
            }
        });
        v8.guid2instance[v63:GetDebugId()] = v63;
    end;
    return v60;
end;
local v67 = 0;
local v68 = 0;
v10.parseContainerCapString = function(v69) --[[ Line: 144 ]] --[[ Name: parseContainerCapString ]]
    local v70 = {};
    for v71, v72 in string.gmatch(v69, "%s*(%w+)%s*:%s*([%d%.]+)%s*") do
        v70[v71] = tonumber(v72);
    end;
    return v70;
end;
generateHierarchy = function(v73, v74, v75, v76) --[[ Line: 153 ]] --[[ Name: generateHierarchy ]]
    -- upvalues: v7 (copy)
    local v77 = {};
    if utf8.len(v73.Name) == nil then
        return nil;
    else
        v77.instanceId = v73;
        v77.instanceName = v73.Name;
        v77.className = v73.ClassName;
        v77.assetId = if v73.SourceAssetId > 0 then v73.SourceAssetId else nil;
        v77.attributes = v7.getInstanceAttributes(v73);
        if v74[v73] then
            v77.isSelected = true;
        end;
        if v76 and v76[v73] and not v77.isSelected then
            v77.isRecent = true;
        end;
        local v78 = v77.isSelected or v77.isRecent;
        if (not not v73:IsA("Script") or v73:IsA("ModuleScript")) and v78 then
            v77.scriptSource = v73.Source;
        end;
        if v77.scriptSource and utf8.len(v77.scriptSource) == nil then
            v77.scriptSource = nil;
        end;
        v77.children = {};
        local v79 = false;
        for _, v81 in ipairs(v73:GetChildren()) do
            local v82 = generateHierarchy(v81, v74, v75, v76);
            if v82 then
                table.insert(v77.children, v82);
                v79 = true;
            end;
        end;
        if v77.isSelected or v77.isRecent or v79 then
            return v77;
        else
            return nil;
        end;
    end;
end;
populateChildren = function(v83, v84, v85, v86) --[[ Line: 203 ]] --[[ Name: populateChildren ]]
    if not v83 then
        return;
    elseif v83.isSelected or v83.isRecent then
        local v87 = {};
        for _, v89 in ipairs(v83.children) do
            table.insert(v87, v89);
        end;
        populateChildrenRecursive(v83, v84, v85, v86);
        for _, v91 in ipairs(v87) do
            populateChildren(v91, v91.instanceId, v85, v86);
        end;
        return;
    else
        for _, v93 in ipairs(v83.children) do
            populateChildren(v93, v93.instanceId, v85, v86);
        end;
        return;
    end;
end;
populateChildrenRecursive = function(v94, v95, v96, v97) --[[ Line: 230 ]] --[[ Name: populateChildrenRecursive ]]
    -- upvalues: v7 (copy), v6 (copy), v67 (ref), v21 (copy)
    if v97 <= 0 then
        return;
    else
        local v98 = {};
        for _, v100 in ipairs(v94.children) do
            v98[v100.instanceId] = v100;
        end;
        for _, v102 in ipairs(v95:GetChildren()) do
            local v103 = {};
            if utf8.len(v102.Name) ~= nil then
                v103.instanceId = v102;
                v103.instanceName = v102.Name;
                v103.className = v102.ClassName;
                v103.assetId = v102.SourceAssetId > 0 and v102.SourceAssetId or nil;
                v103.attributes = v7.getInstanceAttributes(v102);
                local v104 = v103.isSelected or v103.isRecent;
                if (not not v102:IsA("Script") or v102:IsA("ModuleScript")) and v104 then
                    v103.scriptSource = v102.Source;
                end;
                if v103.scriptSource and utf8.len(v103.scriptSource) == nil then
                    v103.scriptSource = nil;
                end;
                v103.children = {};
                local v105 = string.len((v6:JSONEncode(v103)));
                if not v98[v102] then
                    if v67 + v105 > v21() then
                        return;
                    else
                        table.insert(v94.children, v103);
                        v67 = v67 + v105;
                        populateChildrenRecursive(v103, v102, v96, v97 - 1);
                    end;
                else
                    populateChildrenRecursive(v98[v102], v102, v96, v97 - 1);
                end;
            end;
        end;
        return;
    end;
end;
populateMissingGlobalContainers = function(v106, v107, v108, v109) --[[ Line: 283 ]] --[[ Name: populateMissingGlobalContainers ]]
    -- upvalues: v26 (copy)
    local v110 = {};
    for _, v112 in ipairs(v106.children) do
        v110[v112.instanceName] = v112;
    end;
    for v113, _ in pairs(v26) do
        local l_v107_FirstChild_0 = v107:FindFirstChild(v113);
        if not v110[v113] and l_v107_FirstChild_0 then
            local v116 = {
                instanceId = l_v107_FirstChild_0, 
                instanceName = v113, 
                className = l_v107_FirstChild_0.ClassName, 
                children = {}
            };
            populateChildrenRecursive(v116, l_v107_FirstChild_0, v108, v109);
            table.insert(v106.children, v116);
        elseif l_v107_FirstChild_0 then
            populateChildrenRecursive(v110[v113], l_v107_FirstChild_0, v108, v109);
        end;
    end;
end;
populateCodeRunnerDMContext = function(v117, v118, v119, v120) --[[ Line: 310 ]] --[[ Name: populateCodeRunnerDMContext ]]
    -- upvalues: v68 (ref), v22 (copy), v10 (copy), v24 (copy)
    v68 = 0;
    local v121 = v22();
    local v122 = v10.parseContainerCapString(v24());
    for _, v124 in {
        "Workspace", 
        "ServerScriptService", 
        "ReplicatedStorage", 
        "ReplicatedFirst", 
        "StarterGui", 
        "StarterPlayer", 
        "Lighting"
    } do
        local l_v118_FirstChild_0 = v118:FindFirstChild(v124);
        if l_v118_FirstChild_0 then
            local v126 = v122[v124] and v122[v124] * v121 or 0;
            v68 = 0;
            local v127 = {
                instanceName = v124, 
                className = l_v118_FirstChild_0.ClassName, 
                children = {}, 
                isSelected = v120[l_v118_FirstChild_0] and true or nil
            };
            populateFullDMTree(v127, l_v118_FirstChild_0, v119, v120, v126);
            table.insert(v117.children, v127);
        end;
    end;
end;
populateFullDMTree = function(v128, v129, v130, v131, v132) --[[ Line: 344 ]] --[[ Name: populateFullDMTree ]]
    -- upvalues: v6 (copy), v4 (copy), v68 (ref)
    if v130 <= 0 then
        return;
    else
        local v133 = {};
        table.insert(v133, {
            result = v128, 
            instance = v129, 
            depth = v130
        });
        while true do
            if #v133 > 0 then
                local v134 = table.remove(v133, 1);
                local l_result_0 = v134.result;
                local l_instance_0 = v134.instance;
                local l_depth_0 = v134.depth;
                for _, v139 in l_instance_0:GetChildren() do
                    local v140 = {};
                    if utf8.len(v139.Name) ~= nil then
                        v140.name = v139.Name;
                        v140.className = v139.ClassName;
                        v140.children = {};
                        if v131[v139] then
                            v140.isSelected = true;
                        end;
                        local l_status_0, l_result_1 = pcall(function() --[[ Line: 371 ]]
                            -- upvalues: v6 (ref), v140 (copy)
                            return (string.len((v6:JSONEncode(v140))));
                        end);
                        if not l_status_0 then
                            v4:ReportJSONEncodeFailure(v139.Name, v139.ClassName);
                        elseif v132 < v68 + l_result_1 then
                            return;
                        else
                            table.insert(l_result_0.children, v140);
                            v68 = v68 + l_result_1;
                            if v139:IsA("Folder") then
                                table.insert(v133, {
                                    result = v140, 
                                    instance = v139, 
                                    depth = l_depth_0
                                });
                            elseif l_depth_0 > 1 then
                                table.insert(v133, {
                                    result = v140, 
                                    instance = v139, 
                                    depth = l_depth_0 - 1
                                });
                            end;
                        end;
                    end;
                end;
            else
                return;
            end;
        end;
    end;
end;
v10.register = function() --[[ Line: 395 ]] --[[ Name: register ]]
    -- upvalues: v2 (copy), v67 (ref), v5 (copy), v7 (copy), v15 (copy), v31 (copy), v8 (copy), v9 (copy), v23 (copy), v6 (copy), v21 (copy), v18 (copy), v20 (copy), v19 (copy), v13 (copy), v4 (copy), v3 (copy), v12 (copy), v14 (copy), v66 (copy)
    v2:RegisterContextCollector("DefaultContextCollector", function(v143) --[[ Line: 396 ]]
        -- upvalues: v67 (ref), v5 (ref), v7 (ref), v15 (ref), v31 (ref), v8 (ref), v9 (ref), v23 (ref), v6 (ref), v21 (ref), v18 (ref), v20 (ref), v19 (ref), v13 (ref), v4 (ref), v3 (ref), v12 (ref)
        v67 = 0;
        local v144 = {};
        local v145 = v5:Get();
        local v146 = v7.getRequestCFrame(v143);
        local v147 = {};
        if #v145 > 0 then
            local v148 = v15();
            v144.Selected = {};
            for v149, v150 in v145 do
                if v148 >= v149 then
                    v147[v150] = true;
                    local v151, v152 = v31(v150, v146);
                    v8.guid2instance[v150:GetDebugId()] = v150;
                    if utf8.len(v150.Name) ~= nil then
                        table.insert(v144.Selected, {
                            instanceId = v150, 
                            className = v150.ClassName, 
                            instanceName = v150.Name, 
                            assetId = if v150.SourceAssetId > 0 then v150.SourceAssetId else nil, 
                            attributes = v7.getInstanceAttributes(v150), 
                            size = v152, 
                            pos = v151
                        });
                    end;
                else
                    break;
                end;
            end;
        end;
        local v153 = {};
        v9.syncContext();
        v153 = v9.fetchContextV2();
        local v154 = nil;
        local _ = nil;
        v154 = tick();
        local v156 = {};
        for _, v158 in ipairs(v153) do
            v156[v158.instanceId] = true;
        end;
        v144.CRHierarchy = {
            instanceName = game.Name, 
            className = game.ClassName, 
            children = {}
        };
        populateCodeRunnerDMContext(v144.CRHierarchy, game, v23(), v147);
        if next(v147) ~= nil or next(v156) ~= nil then
            v144.Hierarchy = generateHierarchy(game, v147, v146, v156);
            v67 = string.len((v6:JSONEncode(v144.Hierarchy)));
            if v67 > v21() then
                v144.Hierarchy = nil;
                v67 = 0;
            end;
            populateChildren(v144.Hierarchy, game, v146, v18());
            if not v144.Hierarchy then
                v144.Hierarchy = {
                    instanceId = game, 
                    instanceName = game.Name, 
                    className = game.ClassName, 
                    children = {}
                };
            end;
            populateMissingGlobalContainers(v144.Hierarchy, game, v146, v20());
        else
            local v159 = {
                instanceId = game, 
                instanceName = game.Name, 
                className = game.ClassName, 
                children = {}
            };
            populateMissingGlobalContainers(v159, game, v146, v19());
            v144.Hierarchy = v159;
        end;
        local v160 = v9.getInstanceTypes();
        local v161 = 0;
        for v162, _ in pairs(v147) do
            if v13() > v161 then
                v9.registerInstanceV2(v162, v143, v160.Selected);
                v161 = v161 + 1;
            else
                break;
            end;
        end;
        local v164 = tick() - v154;
        v4:DataModelHierarchyLatency(v143, v164);
        v144.use_inventory_assets = v3:GetSettings().UseInventoryAssets;
        v144.enable_audio_capabilities = v12() and true or nil;
        return v144;
    end);
    v2:RegisterContextCollector("ViewportContextCollector", function(v165) --[[ Line: 517 ]]
        -- upvalues: v7 (ref), v8 (ref), v14 (ref), v66 (ref)
        v7.getRequestCFrame(v165);
        local v166 = v8.GetRequestMetadata(v165, "RequestCFrame");
        local v167 = v8.GetRequestMetadata(v165, "PlacementSize");
        local v168 = Vector3.new(v167.X, v14(), v167.Z);
        local v169 = v66(v165, v166, v168);
        return {
            placement_area = {
                x = v167.X, 
                z = v167.Z
            }, 
            viewport_instances = v169
        };
    end);
end;
v10.unregister = function() --[[ Line: 533 ]] --[[ Name: unregister ]]
    -- upvalues: v2 (copy)
    v2:UnregisterContextCollector("DefaultContextCollector");
    v2:UnregisterContextCollector("ViewportContextCollector");
end;
return v10;