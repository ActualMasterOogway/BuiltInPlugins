local v0 = require(script.Parent.FuzzyMath);
local v1 = require(script.Parent.List);
local v2 = require(script.Parent.Extent);
local _ = require(script.Parent.FFlag);
local v4 = {};
local function _(v5) --[[ Line: 9 ]] --[[ Name: checkIsWrapped ]]
    if v5 == nil or typeof(v5) ~= "table" then
        return false;
    else
        return v5.IsWrapped == true;
    end;
end;
local function _(v7) --[[ Line: 17 ]] --[[ Name: itemHasChanged ]]
    -- upvalues: v4 (copy)
    return v7.CFrame ~= v4[v7];
end;
local v9 = {};
local function v10(v11) --[[ Line: 23 ]] --[[ Name: getAllRoots ]]
    -- upvalues: v9 (ref), v10 (copy)
    if v11:IsA("BasePart") then
        local l_v11_RootPart_0 = v11:GetRootPart();
        if l_v11_RootPart_0 then
            v9[l_v11_RootPart_0] = true;
        end;
    end;
    local l_v11_Children_0 = v11:GetChildren();
    for _, v15 in ipairs(l_v11_Children_0) do
        v10(v15);
    end;
end;
local function v21(v16) --[[ Line: 37 ]] --[[ Name: getAllRootsFromTable ]]
    -- upvalues: v9 (ref), v10 (copy)
    v9 = {};
    for v17 = 1, #v16 do
        v10(v16[v17]);
    end;
    local v18 = {};
    for v19, _ in pairs(v9) do
        table.insert(v18, v19);
    end;
    return v18;
end;
local function v22(v23, v24) --[[ Line: 51 ]] --[[ Name: getAllChildren ]]
    -- upvalues: v22 (copy)
    if not v24 then
        v24 = {};
    end;
    if v23:IsA("BasePart") then
        table.insert(v24, v23);
    end;
    local l_v23_Children_0 = v23:GetChildren();
    for v26 = 1, #l_v23_Children_0 do
        v24 = v22(l_v23_Children_0[v26], v24);
    end;
    return v24;
end;
local function v30(v27) --[[ Line: 68 ]] --[[ Name: getAllChildrenFromTable ]]
    -- upvalues: v22 (copy)
    local v28 = {};
    for v29 = 1, #v27 do
        v28 = v22(v27[v29], v28);
    end;
    return v28;
end;
local function v35(v31, v32) --[[ Line: 77 ]] --[[ Name: getAllModels ]]
    if v31:IsA("Model") then
        table.insert(v32, v31);
    end;
    for _, v34 in ipairs(v31:GetDescendants()) do
        if v34:IsA("Model") then
            table.insert(v32, v34);
        end;
    end;
end;
local function v40(v36) --[[ Line: 88 ]] --[[ Name: getAllModelsFromTable ]]
    -- upvalues: v35 (copy)
    local v37 = {};
    for _, v39 in ipairs(v36) do
        v35(v39, v37);
    end;
    return v37;
end;
forcePrimaryPart = function(v41) --[[ Line: 97 ]] --[[ Name: forcePrimaryPart ]]
    -- upvalues: v0 (copy)
    if not v41.PrimaryPart then
        local v42 = nil;
        local l_v41_Children_0 = v41:GetChildren();
        for v44 = 1, #l_v41_Children_0 do
            if l_v41_Children_0[v44]:IsA("BasePart") then
                v42 = l_v41_Children_0[v44];
                local _ = v42.CFrame.p;
                if v0.visiblyIdentityCFrame(v42.CFrame, 1.0E-5) then
                    break;
                end;
            elseif l_v41_Children_0[v44]:IsA("Model") and not l_v41_Children_0[v44]:IsA("Workspace") then
                local v46 = l_v41_Children_0[v44];
                forcePrimaryPart(l_v41_Children_0[v44]);
                if v46.PrimaryPart then
                    v42 = v46.PrimaryPart;
                    if v0.visiblyIdentityCFrame(v42.CFrame, 1.0E-5) then
                        break;
                    end;
                end;
            end;
        end;
        if v42 then
            v41.PrimaryPart = v42;
        end;
    end;
end;
local function _(v47) --[[ Line: 131 ]] --[[ Name: sanitizeFloat ]]
    return v47 > 0 and math.ceil(v47 * 1000000 - 0.5) / 1000000 or math.floor(v47 * 1000000 + 0.5) / 1000000;
end;
local function v63(v49, v50) --[[ Line: 136 ]] --[[ Name: sanitizeCFrame ]]
    local v51, v52, v53, v54, v55, v56, v57, v58, v59, v60, v61, v62 = v49:components();
    return CFrame.new(v51 > 0 and math.ceil(v51 * 1000000 - 0.5) / 1000000 or math.floor(v51 * 1000000 + 0.5) / 1000000, v52 > 0 and math.ceil(v52 * 1000000 - 0.5) / 1000000 or math.floor(v52 * 1000000 + 0.5) / 1000000, v53 > 0 and math.ceil(v53 * 1000000 - 0.5) / 1000000 or math.floor(v53 * 1000000 + 0.5) / 1000000, v50 and (v54 > 0 and math.ceil(v54 * 1000000 - 0.5) / 1000000 or math.floor(v54 * 1000000 + 0.5) / 1000000) or v54, v50 and (v55 > 0 and math.ceil(v55 * 1000000 - 0.5) / 1000000 or math.floor(v55 * 1000000 + 0.5) / 1000000) or v55, v50 and (v56 > 0 and math.ceil(v56 * 1000000 - 0.5) / 1000000 or math.floor(v56 * 1000000 + 0.5) / 1000000) or v56, v50 and (v57 > 0 and math.ceil(v57 * 1000000 - 0.5) / 1000000 or math.floor(v57 * 1000000 + 0.5) / 1000000) or v57, v50 and (v58 > 0 and math.ceil(v58 * 1000000 - 0.5) / 1000000 or math.floor(v58 * 1000000 + 0.5) / 1000000) or v58, v50 and (v59 > 0 and math.ceil(v59 * 1000000 - 0.5) / 1000000 or math.floor(v59 * 1000000 + 0.5) / 1000000) or v59, v50 and (v60 > 0 and math.ceil(v60 * 1000000 - 0.5) / 1000000 or math.floor(v60 * 1000000 + 0.5) / 1000000) or v60, v50 and (v61 > 0 and math.ceil(v61 * 1000000 - 0.5) / 1000000 or math.floor(v61 * 1000000 + 0.5) / 1000000) or v61, v50 and (v62 > 0 and math.ceil(v62 * 1000000 - 0.5) / 1000000 or math.floor(v62 * 1000000 + 0.5) / 1000000) or v62);
end;
local function v64(v65, v66) --[[ Line: 154 ]] --[[ Name: collectPVInstancesRecursive ]]
    -- upvalues: v64 (copy)
    if v65:IsA("PVInstance") then
        if v66[v65] then
            return;
        else
            v66[v65] = v65;
            for _, v68 in v65:GetDescendants() do
                if v68:IsA("PVInstance") then
                    v66[v68] = v65;
                end;
            end;
            return;
        end;
    else
        for _, v70 in v65:GetChildren() do
            v64(v70, v66);
        end;
        return;
    end;
end;
local function v77(v71, v72) --[[ Line: 183 ]] --[[ Name: getCounterpart ]]
    if v72:IsA("Constraint") then
        local l_Attachment0_0 = v72.Attachment0;
        if l_Attachment0_0 then
            local l_Parent_0 = l_Attachment0_0.Parent;
            if l_Parent_0 == v71 then
                local l_Attachment1_0 = v72.Attachment1;
                return l_Attachment1_0 and l_Attachment1_0.Parent;
            else
                return l_Parent_0;
            end;
        else
            local l_Attachment1_1 = v72.Attachment1;
            return l_Attachment1_1 and l_Attachment1_1.Parent;
        end;
    elseif v72:IsA("JointInstance") or v72:IsA("WeldConstraint") then
        if v72.Part0 == v71 then
            return v72.Part1;
        else
            return v72.Part0;
        end;
    else
        return nil;
    end;
end;
local function v89(v78) --[[ Line: 214 ]] --[[ Name: preparePVs ]]
    -- upvalues: v64 (copy), v77 (copy)
    local v79 = {};
    for _, v81 in v78 do
        v64(v81, v79);
    end;
    local v82 = {};
    local v83 = {};
    for v84, v85 in v79 do
        if v84 == v85 then
            table.insert(v82, v84);
        end;
        if v84:IsA("BasePart") then
            for _, v87 in v84:GetJoints() do
                local v88 = v79[v77(v84, v87)];
                if v88 and v88 ~= v85 then
                    table.insert(v83, v87);
                end;
            end;
        end;
    end;
    return v82, v83;
end;
createMetaPart = function(v90, v91) --[[ Line: 240 ]] --[[ Name: createMetaPart ]]
    -- upvalues: v30 (copy), v21 (copy), v40 (copy), v89 (copy), v2 (copy), v63 (copy), v1 (copy), v22 (copy)
    if not v90 then
        return nil;
    elseif v90 ~= nil and not (typeof(v90) ~= "table") and v90.IsWrapped == true then
        return v90;
    else
        if not v91 then
            v91 = false;
        end;
        if type(v90) == "table" then
            if #v90 == 0 then
                return nil;
            else
                local v92 = {
                    objects = v90, 
                    mt = {}, 
                    info = {}
                };
                v92.info.oCFrame = nil;
                v92.info.oSize = nil;
                v92.info.pCFrame = nil;
                v92.info.pSize = nil;
                v92.info.lastPlaneCFrame = nil;
                v92.children = v30(v92.objects);
                v92.roots = v21(v92.objects);
                v92.models = v40(v92.objects);
                v92.IsWrapped = true;
                local v93, v94 = v89(v90);
                v92.rootPVs = v93;
                v92.activeInterPVJoints = v94;
                v92.info.expectingChanged = false;
                v92.info.updateRequired = false;
                v93 = function(v95) --[[ Line: 278 ]] --[[ Name: transformSelectionBy ]]
                    -- upvalues: v92 (copy)
                    for _, v97 in v92.activeInterPVJoints do
                        v97.Enabled = false;
                    end;
                    for _, v99 in v92.rootPVs do
                        v99:PivotTo(v95 * v99:GetPivot());
                    end;
                    for _, v101 in v92.activeInterPVJoints do
                        v101.Enabled = true;
                    end;
                end;
                v94 = function(v102) --[[ Line: 290 ]] --[[ Name: subscribeToParts ]]
                    -- upvalues: v92 (copy)
                    local v103 = {};
                    for v104, v105 in ipairs(v102) do
                        v103[v104] = v105.Changed:connect(function() --[[ Line: 293 ]]
                            -- upvalues: v92 (ref)
                            if not v92.info.expectingChanged then
                                v92.info.updateRequired = true;
                            end;
                        end);
                    end;
                    return v103;
                end;
                if v91 then
                    v92.subscribe = v94(v92.children);
                end;
                setmetatable(v92, v92.mt);
                local function _() --[[ Line: 310 ]] --[[ Name: reRoot ]]
                    -- upvalues: v92 (copy), v21 (ref)
                    v92.roots = v21(v92.objects);
                end;
                local function _() --[[ Line: 314 ]] --[[ Name: recalculateCFrameAndSize ]]
                    -- upvalues: v92 (copy), v2 (ref), v63 (ref)
                    local l_info_0 = v92.info;
                    local l_info_1 = v92.info;
                    local v109, v110 = v2.getCFrameAndSizeOfList(v92.children, createMetaPart(v92.objects[1]).CFrame);
                    l_info_0.oCFrame = v109;
                    l_info_1.oSize = v110;
                    v92.info.oCFrame = v63(v92.info.oCFrame);
                end;
                local function v116() --[[ Line: 320 ]] --[[ Name: getTouchingParts ]]
                    -- upvalues: v92 (copy), v1 (ref)
                    local v112 = {};
                    local l_children_0 = v92.children;
                    if #l_children_0 > 10 then
                        return {};
                    else
                        for v114 = 1, #l_children_0 do
                            local l_TouchingParts_0 = l_children_0[v114]:GetTouchingParts();
                            v112 = v1.combineLists(v112, v1.filterOutItems(l_children_0, l_TouchingParts_0));
                        end;
                        return (v1.removeDuplicates(v112));
                    end;
                end;
                v92.mt.__index = function(_, v118) --[[ Line: 339 ]]
                    -- upvalues: v92 (copy), v2 (ref), v63 (ref), v21 (ref), v93 (copy), v116 (copy)
                    if v118 == "IsA" then
                        return function(_, v120) --[[ Line: 341 ]]
                            local v121 = true;
                            if v120 ~= "Grouping" then
                                v121 = v120 == "Wrapped";
                            end;
                            return v121;
                        end;
                    elseif v118 == "Unsubscribe" then
                        return function() --[[ Line: 347 ]]
                            -- upvalues: v92 (ref)
                            if v92.subscribe then
                                for _, v123 in ipairs(v92.subscribe) do
                                    v123:disconnect();
                                end;
                            end;
                        end;
                    elseif v118 == "CanSimulate" then
                        return #v92.children < 10;
                    elseif v118 == "IsUpdateRequired" then
                        local l_updateRequired_0 = v92.info.updateRequired;
                        v92.info.updateRequired = false;
                        return l_updateRequired_0;
                    elseif v118 == "ClearCache" then
                        return function() --[[ Line: 367 ]]
                            -- upvalues: v92 (ref)
                            v92.info.oCFrame = nil;
                            v92.info.oSize = nil;
                            v92.info.pCFrame = nil;
                            v92.info.pSize = nil;
                            v92.info.lastPlaneCFrame = nil;
                        end;
                    elseif v118 == "TranslateFromTo" then
                        return function(v125, v126) --[[ Line: 377 ]]
                            -- upvalues: v92 (ref), v2 (ref), v63 (ref), v21 (ref), v93 (ref)
                            v92.info.expectingChanged = true;
                            if not v92.info.oCFrame then
                                local l_info_2 = v92.info;
                                local l_info_3 = v92.info;
                                local v129, v130 = v2.getCFrameAndSizeOfList(v92.children, createMetaPart(v92.objects[1]).CFrame);
                                l_info_2.oCFrame = v129;
                                l_info_3.oSize = v130;
                                v92.info.oCFrame = v63(v92.info.oCFrame);
                            end;
                            v92.roots = v21(v92.objects);
                            local v131 = v126.p - v125.p;
                            v93(CFrame.new(v131));
                            v92.info.pCFrame = v92.info.pCFrame + v131;
                            v92.info.oCFrame = v63(v92.info.oCFrame + v131);
                            v92.info.expectingChanged = false;
                        end;
                    elseif v118 == "Children" then
                        return v92.children;
                    elseif v118 == "Size" then
                        if v92.info.oSize then
                            return v92.info.oSize;
                        else
                            local l_info_4 = v92.info;
                            local l_info_5 = v92.info;
                            local v134, v135 = v2.getCFrameAndSizeOfList(v92.children, createMetaPart(v92.objects[1]).CFrame);
                            l_info_4.oCFrame = v134;
                            l_info_5.oSize = v135;
                            v92.info.oCFrame = v63(v92.info.oCFrame);
                            return v92.info.oSize;
                        end;
                    elseif v118 == "CFrame" then
                        if v92.info.oCFrame then
                            return v92.info.oCFrame;
                        else
                            local l_info_6 = v92.info;
                            local l_info_7 = v92.info;
                            local v138, v139 = v2.getCFrameAndSizeOfList(v92.children, createMetaPart(v92.objects[1]).CFrame);
                            l_info_6.oCFrame = v138;
                            l_info_7.oSize = v139;
                            v92.info.oCFrame = v63(v92.info.oCFrame);
                            return v92.info.oCFrame;
                        end;
                    elseif v118 == "PlaneAlignedSize" then
                        if v92.info.pSize then
                            return v92.info.pSize;
                        else
                            return nil;
                        end;
                    elseif v118 == "PlaneAlignedCFrame" then
                        if v92.info.pCFrame then
                            return v92.info.pCFrame;
                        else
                            return nil;
                        end;
                    elseif v118 == "GetTouchingParts" then
                        return function() --[[ Line: 429 ]]
                            -- upvalues: v116 (ref)
                            return (v116());
                        end;
                    elseif v118 == "PlaneSet" then
                        return v92.info.lastPlaneCFrame ~= nil;
                    else
                        return;
                    end;
                end;
                v92.mt.__newindex = function(_, v141, v142) --[[ Line: 440 ]]
                    -- upvalues: v92 (copy), v2 (ref), v63 (ref), v21 (ref), v93 (copy)
                    if v141 == "UpdatePlaneCFrame" then
                        if v92.info.lastPlaneCFrame == v142 then
                            return;
                        else
                            v92.info.lastPlaneCFrame = v142;
                            local l_info_8 = v92.info;
                            local l_info_9 = v92.info;
                            local v145, v146 = v2.getCFrameAndSizeOfList(v92.objects, v142);
                            l_info_8.pCFrame = v145;
                            l_info_9.pSize = v146;
                        end;
                    end;
                    if v141 == "CFrame" then
                        v92.info.expectingChanged = true;
                        if not v92.info.oCFrame then
                            local l_info_10 = v92.info;
                            local l_info_11 = v92.info;
                            local v149, v150 = v2.getCFrameAndSizeOfList(v92.children, createMetaPart(v92.objects[1]).CFrame);
                            l_info_10.oCFrame = v149;
                            l_info_11.oSize = v150;
                            v92.info.oCFrame = v63(v92.info.oCFrame);
                        end;
                        v92.roots = v21(v92.objects);
                        local v151 = v142 * v92.info.oCFrame:Inverse();
                        v93(v151);
                        if v92.info.oCFrame - v92.info.oCFrame.p ~= v142 - v142.p then
                            v92.info.pCFrame = nil;
                            v92.info.pSize = nil;
                            v92.info.lastPlaneCFrame = nil;
                        elseif v92.info.pCFrame then
                            v92.info.pCFrame = v92.info.pCFrame - v92.info.oCFrame.p + v142.p;
                        end;
                        v92.info.oCFrame = v63(v142);
                        v92.info.expectingChanged = false;
                    end;
                end;
                return v92;
            end;
        elseif v90:IsA("Model") and not v90:IsA("Workspace") then
            if v90 ~= nil and not (typeof(v90) ~= "table") and v90.IsWrapped == true then
                return v90;
            else
                local v152 = {
                    object = v90, 
                    mt = {}, 
                    info = {}
                };
                v152.info.oCFrame = nil;
                v152.info.oSize = nil;
                v152.info.pCFrame = nil;
                v152.info.pSize = nil;
                v152.info.lastPlaneCFrame = nil;
                v152.children = v30({
                    v152.object
                });
                v152.roots = v21({
                    v152.object
                });
                v152.models = v40({
                    v152.object
                });
                v152.IsWrapped = true;
                v152.info.expectingChanged = false;
                v152.info.updateRequired = false;
                local function v157(v153) --[[ Line: 497 ]] --[[ Name: subscribeToParts ]]
                    -- upvalues: v152 (copy)
                    local v154 = {};
                    for v155, v156 in ipairs(v153) do
                        v154[v155] = v156.Changed:connect(function() --[[ Line: 500 ]]
                            -- upvalues: v152 (ref)
                            if not v152.info.expectingChanged then
                                v152.info.updateRequired = true;
                            end;
                        end);
                    end;
                    return v154;
                end;
                if v91 then
                    v152.subscribe = v157(v152.children);
                end;
                setmetatable(v152, v152.mt);
                local function _() --[[ Line: 517 ]] --[[ Name: reRoot ]]
                    -- upvalues: v152 (copy), v21 (ref)
                    v152.roots = v21({
                        v152.object
                    });
                end;
                local function _() --[[ Line: 521 ]] --[[ Name: getCurrentCFrame ]]
                    -- upvalues: v152 (copy)
                    return v152.object:GetModelCFrame();
                end;
                local function v164() --[[ Line: 525 ]] --[[ Name: getTouchingParts ]]
                    -- upvalues: v22 (ref), v152 (copy), v1 (ref)
                    local v160 = v22(v152.object);
                    local v161 = {};
                    for v162 = 1, #v160 do
                        local l_TouchingParts_1 = v160[v162]:GetTouchingParts();
                        v161 = v1.combineLists(v161, v1.filterOutItems(v160, l_TouchingParts_1));
                    end;
                    return (v1.removeDuplicates(v161));
                end;
                v152.mt.__eq = function(v165, v166) --[[ Line: 538 ]]
                    return pcall(function() --[[ Line: 539 ]]
                        -- upvalues: v165 (copy), v166 (copy)
                        return createMetaPart(v165).Object == createMetaPart(v166).Object;
                    end);
                end;
                local function v172() --[[ Line: 544 ]] --[[ Name: recalculateCFrameAndSize ]]
                    -- upvalues: v152 (copy), v2 (ref), v63 (ref)
                    local v167 = nil;
                    v167 = if v152.object.PrimaryPart then v152.object.PrimaryPart.CFrame else if #v152.children > 0 then v152.children[1].CFrame else CFrame.new();
                    local l_info_12 = v152.info;
                    local l_info_13 = v152.info;
                    local v170, v171 = v2.getCFrameAndSizeOfList(v152.children, v167);
                    l_info_12.oCFrame = v170;
                    l_info_13.oSize = v171;
                    v152.info.oCFrame = v63(v152.info.oCFrame);
                end;
                v152.mt.__index = function(_, v174) --[[ Line: 559 ]]
                    -- upvalues: v152 (copy), v172 (copy), v21 (ref), v164 (copy)
                    if v174 == "IsA" then
                        return function(_, v176) --[[ Line: 561 ]]
                            -- upvalues: v152 (ref)
                            return v152.object:IsA(v176) or v176 == "Wrapped";
                        end;
                    elseif v174 == "Unsubscribe" then
                        return function() --[[ Line: 567 ]]
                            -- upvalues: v152 (ref)
                            if v152.subscribe then
                                for _, v178 in ipairs(v152.subscribe) do
                                    v178:disconnect();
                                end;
                            end;
                        end;
                    elseif v174 == "IsUpdateRequired" then
                        local l_updateRequired_1 = v152.info.updateRequired;
                        v152.info.updateRequired = false;
                        return l_updateRequired_1;
                    elseif v174 == "CanSimulate" then
                        return #v152.children < 10;
                    elseif v174 == "ClearCache" then
                        return function() --[[ Line: 587 ]]
                            -- upvalues: v152 (ref)
                            v152.info.oCFrame = nil;
                            v152.info.oSize = nil;
                            v152.info.pCFrame = nil;
                            v152.info.pSize = nil;
                            v152.info.lastPlaneCFrame = nil;
                        end;
                    elseif v174 == "TranslateFromTo" then
                        return function(v180, v181) --[[ Line: 597 ]]
                            -- upvalues: v152 (ref), v172 (ref), v21 (ref)
                            v152.info.expectingChanged = true;
                            if not v152.info.oCFrame then
                                v172();
                            end;
                            v152.roots = v21({
                                v152.object
                            });
                            local v182 = v181.p - v180.p;
                            v152.object:PivotTo(v152.object:GetPivot() + v182);
                            v152.info.pCFrame = v152.info.pCFrame + v182;
                            v152.info.oCFrame = v152.info.oCFrame + v182;
                            v152.info.expectingChanged = false;
                        end;
                    elseif v174 == "BreakImplicitJoints" then
                        return function() --[[ Line: 614 ]]

                        end;
                    elseif v174 == "IsColliding" then
                        return function() --[[ Line: 618 ]]
                            return false;
                        end;
                    elseif v174 == "GetTouchingParts" then
                        return function() --[[ Line: 624 ]]
                            -- upvalues: v164 (ref)
                            return (v164());
                        end;
                    elseif v174 == "SafeRotate" then
                        return function() --[[ Line: 630 ]]

                        end;
                    elseif v174 == "Children" then
                        return v152.children;
                    elseif v174 == "Size" then
                        if v152.info.oSize then
                            return v152.info.oSize;
                        else
                            v172();
                            return v152.info.oSize;
                        end;
                    elseif v174 == "CFrame" then
                        if v152.info.oCFrame then
                            return v152.info.oCFrame;
                        else
                            v172();
                            return v152.info.oCFrame;
                        end;
                    elseif v174 == "PlaneAlignedSize" then
                        if v152.info.pSize then
                            return v152.info.pSize;
                        else
                            return nil;
                        end;
                    elseif v174 == "PlaneAlignedCFrame" then
                        if v152.info.pCFrame then
                            return v152.info.pCFrame;
                        else
                            return nil;
                        end;
                    elseif v174 == "Position" then
                        if v152.info.oCFrame then
                            return v152.info.oCFrame.p;
                        else
                            v172();
                            return v152.info.oCFrame.p;
                        end;
                    elseif v174 == "Object" then
                        return v152.object;
                    elseif pcall(function() --[[ Line: 681 ]]
                        -- upvalues: v152 (ref), v174 (copy)
                        local _ = v152.object[v174];
                    end) then
                        if type(v152.object[v174]) == "function" then
                            return function(_, ...) --[[ Line: 685 ]]
                                -- upvalues: v152 (ref), v174 (copy)
                                return v152.object[v174](v152.object, ...);
                            end;
                        else
                            return v152.object[v174];
                        end;
                    else
                        return nil;
                    end;
                end;
                v152.mt.__newindex = function(_, v186, v187) --[[ Line: 695 ]]
                    -- upvalues: v152 (copy), v2 (ref), v172 (copy), v21 (ref), v63 (ref)
                    if v186 == "UpdatePlaneCFrame" then
                        v152.info.lastPlaneCFrame = v187;
                        local l_info_14 = v152.info;
                        local l_info_15 = v152.info;
                        local v190, v191 = v2.getCFrameAndSizeOfList(v152.children, v187);
                        l_info_14.pCFrame = v190;
                        l_info_15.pSize = v191;
                        return;
                    elseif v186 == "CFrame" then
                        v152.info.expectingChanged = true;
                        if not v152.info.oCFrame then
                            v172();
                        end;
                        v152.roots = v21({
                            v152.object
                        });
                        v187 = v63(v187, true);
                        local v192 = v187 * v152.info.oCFrame:Inverse();
                        v152.object:PivotTo(v192 * v152.object:GetPivot());
                        if v152.info.oCFrame - v152.info.oCFrame.p ~= v187 - v187.p then
                            v152.info.pCFrame = nil;
                            v152.info.pSize = nil;
                            v152.info.lastPlaneCFrame = nil;
                        elseif v152.info.pCFrame then
                            v152.info.pCFrame = v152.info.pCFrame - v152.info.oCFrame.p + v187.p;
                        end;
                        v152.info.oCFrame = v187;
                        v152.info.expectingChanged = false;
                        return;
                    elseif v186 == "BreakImplicitJoints" then
                        return function() --[[ Line: 730 ]]

                        end;
                    elseif v186 == "Size" then
                        return;
                    elseif v186 == "Position" then
                        v152.info.expectingChanged = true;
                        local l_ModelCFrame_0 = v152.object:GetModelCFrame();
                        local v194 = (l_ModelCFrame_0 - l_ModelCFrame_0.p + v187) * l_ModelCFrame_0:Inverse();
                        v152.object:PivotTo(v194 * v152.object:GetPivot());
                        v152.info.expectingChanged = false;
                        return;
                    else
                        v152.info.expectingChanged = true;
                        if pcall(function() --[[ Line: 746 ]]
                            -- upvalues: v152 (ref), v186 (copy)
                            local _ = v152.object[v186];
                        end) then
                            v152.object[v186] = v187;
                        end;
                        v152.info.expectingChanged = false;
                        return;
                    end;
                end;
                return v152;
            end;
        elseif v90:IsA("BasePart") then
            if v90 ~= nil and not (typeof(v90) ~= "table") and v90.IsWrapped == true then
                return v90;
            else
                local v196 = {
                    object = v90, 
                    mt = {}, 
                    info = {}
                };
                v196.info.pCFrame = nil;
                v196.info.pSize = nil;
                v196.info.lastPlaneCFrame = nil;
                v196.children = {
                    v90
                };
                v196.roots = v21({
                    v196.object
                });
                v196.models = v40({
                    v196.object
                });
                v196.IsWrapped = true;
                v196.info.expectingChanged = false;
                v196.info.updateRequired = false;
                local function v201(v197) --[[ Line: 776 ]] --[[ Name: subscribeToParts ]]
                    -- upvalues: v196 (copy)
                    local v198 = {};
                    for v199, v200 in ipairs(v197) do
                        v198[v199] = v200.Changed:connect(function() --[[ Line: 779 ]]
                            -- upvalues: v196 (ref)
                            if not v196.info.expectingChanged then
                                v196.info.updateRequired = true;
                            end;
                        end);
                    end;
                    return v198;
                end;
                if v91 then
                    v196.subscribe = v201(v196.children);
                end;
                local function _() --[[ Line: 794 ]] --[[ Name: reRoot ]]
                    -- upvalues: v196 (copy), v21 (ref)
                    v196.roots = v21({
                        v196.object
                    });
                end;
                setmetatable(v196, v196.mt);
                local function _() --[[ Line: 800 ]] --[[ Name: getCurrentCFrame ]]
                    -- upvalues: v196 (copy)
                    return v196.object:GetModelCFrame();
                end;
                v196.mt.__eq = function(v204, v205) --[[ Line: 804 ]]
                    return pcall(function() --[[ Line: 805 ]]
                        -- upvalues: v204 (copy), v205 (copy)
                        return createMetaPart(v204).Object == createMetaPart(v205).Object;
                    end);
                end;
                v196.mt.__index = function(_, v207) --[[ Line: 810 ]]
                    -- upvalues: v196 (copy), v21 (ref)
                    if v207 == "IsA" then
                        return function(_, v209) --[[ Line: 812 ]]
                            -- upvalues: v196 (ref)
                            return v196.object:IsA(v209) or v209 == "Wrapped";
                        end;
                    elseif v207 == "UpdatePivot" then
                        return function(_, v211, v212) --[[ Line: 818 ]]
                            -- upvalues: v196 (ref)
                            local v213 = v212 / v211;
                            local l_PivotOffset_0 = v196.object.PivotOffset;
                            local l_Position_0 = l_PivotOffset_0.Position;
                            local v216 = l_PivotOffset_0 - l_Position_0;
                            v196.object.PivotOffset = v216 + v213 * l_Position_0;
                        end;
                    elseif v207 == "TranslateFromTo" then
                        return function(v217, v218) --[[ Line: 828 ]]
                            -- upvalues: v196 (ref), v21 (ref)
                            v196.roots = v21({
                                v196.object
                            });
                            v196.info.expectingChanged = true;
                            local v219 = v218.p - v217.p;
                            for _, v221 in ipairs(v196.models) do
                                v221.WorldPivot = v221:GetPivot() + v219;
                            end;
                            for v222 = 1, #v196.roots do
                                v196.roots[v222].CFrame = v196.roots[v222].CFrame + v219;
                            end;
                            v196.info.pCFrame = v196.info.pCFrame + v219;
                            v196.info.expectingChanged = false;
                        end;
                    elseif v207 == "Unsubscribe" then
                        return function() --[[ Line: 847 ]]
                            -- upvalues: v196 (ref)
                            if v196.subscribe then
                                for _, v224 in ipairs(v196.subscribe) do
                                    v224:disconnect();
                                end;
                            end;
                        end;
                    elseif v207 == "CanSimulate" then
                        return true;
                    elseif v207 == "ClearCache" then
                        return function() --[[ Line: 861 ]]
                            -- upvalues: v196 (ref)
                            v196.info.oCFrame = nil;
                            v196.info.oSize = nil;
                            v196.info.pCFrame = nil;
                            v196.info.pSize = nil;
                            v196.info.lastPlaneCFrame = nil;
                        end;
                    elseif v207 == "IsUpdateRequired" then
                        local l_updateRequired_2 = v196.info.updateRequired;
                        v196.info.updateRequired = false;
                        return l_updateRequired_2;
                    elseif v207 == "Children" then
                        return v196.children;
                    elseif v207 == "CFrame" then
                        return v196.object.CFrame;
                    elseif v207 == "Size" then
                        return v196.object.Size;
                    elseif v207 == "Position" then
                        return v196.object.CFrame.p;
                    elseif v207 == "Object" then
                        return v196.object;
                    elseif v207 == "PlaneAlignedSize" then
                        if v196.info.pSize then
                            return v196.info.pSize;
                        else
                            return nil;
                        end;
                    elseif v207 == "PlaneAlignedCFrame" then
                        if v196.info.pCFrame then
                            return v196.info.pCFrame;
                        else
                            return nil;
                        end;
                    elseif pcall(function() --[[ Line: 903 ]]
                        -- upvalues: v196 (ref), v207 (copy)
                        local _ = v196.object[v207];
                    end) then
                        if type(v196.object[v207]) == "function" then
                            return function(_, ...) --[[ Line: 907 ]]
                                -- upvalues: v196 (ref), v207 (copy)
                                return v196.object[v207](v196.object, ...);
                            end;
                        else
                            return v196.object[v207];
                        end;
                    else
                        return nil;
                    end;
                end;
                v196.mt.__newindex = function(_, v229, v230) --[[ Line: 917 ]]
                    -- upvalues: v196 (copy), v2 (ref), v63 (ref)
                    v196.info.expectingChanged = true;
                    if v229 == "UpdatePlaneCFrame" then
                        v196.info.lastPlaneCFrame = v230;
                        local l_info_16 = v196.info;
                        local l_info_17 = v196.info;
                        local v233, v234 = v2.getCFrameAndSizeOfList({
                            v196.object
                        }, v230);
                        l_info_16.pCFrame = v233;
                        l_info_17.pSize = v234;
                        v196.info.expectingChanged = false;
                        return;
                    else
                        if v229 == "CFrame" then
                            v230 = v63(v230);
                            v196.info.lastPlaneCFrame = nil;
                        end;
                        if v229 == "Size" then
                            v196.info.lastPlaneCFrame = nil;
                        end;
                        if v229 == "Position" then
                            v196.info.lastPlaneCFrame = nil;
                        end;
                        if pcall(function() --[[ Line: 940 ]]
                            -- upvalues: v196 (ref), v229 (copy)
                            local _ = v196.object[v229];
                        end) then
                            v196.object[v229] = v230;
                        end;
                        v196.info.expectingChanged = false;
                        return;
                    end;
                end;
                return v196;
            end;
        elseif v90 ~= nil and not (typeof(v90) ~= "table") and v90.IsWrapped == true then
            return v90;
        else
            local v236 = {
                object = v90, 
                mt = {}, 
                info = {}, 
                IsWrapped = true
            };
            setmetatable(v236, v236.mt);
            v236.mt.__eq = function(v237, v238) --[[ Line: 963 ]]
                return pcall(function() --[[ Line: 964 ]]
                    -- upvalues: v237 (copy), v238 (copy)
                    return createMetaPart(v237).Object == createMetaPart(v238).Object;
                end);
            end;
            v236.mt.__index = function(_, v240) --[[ Line: 969 ]]
                -- upvalues: v236 (copy)
                if v240 == "IsA" then
                    return function(_, v242) --[[ Line: 971 ]]
                        -- upvalues: v236 (ref)
                        return v236.object:IsA(v242) or v242 == "Wrapped";
                    end;
                elseif v240 == "CFrame" then
                    return CFrame.new();
                elseif v240 == "Size" then
                    return (Vector3.new(0, 0, 0, 0));
                elseif v240 == "Position" then
                    return (Vector3.new(0, 0, 0, 0));
                elseif v240 == "Object" then
                    return v236.object;
                elseif v240 == "PlaneAlignedSize" then
                    return (Vector3.new(0, 0, 0, 0));
                elseif v240 == "PlaneAlignedCFrame" then
                    return CFrame.new();
                elseif pcall(function() --[[ Line: 990 ]]
                    -- upvalues: v236 (ref), v240 (copy)
                    local _ = v236.object[v240];
                end) then
                    if type(v236.object[v240]) == "function" then
                        return function(_, ...) --[[ Line: 994 ]]
                            -- upvalues: v236 (ref), v240 (copy)
                            return v236.object[v240](v236.object, ...);
                        end;
                    else
                        return v236.object[v240];
                    end;
                else
                    return nil;
                end;
            end;
            v236.mt.__newindex = function(_, v246, v247) --[[ Line: 1004 ]]
                -- upvalues: v236 (copy)
                if v246 == "UpdatePlaneCFrame" then
                    return;
                elseif v246 == "CFrame" then
                    return;
                elseif v246 == "Size" then
                    return;
                elseif v246 == "Position" then
                    return;
                else
                    if pcall(function() --[[ Line: 1021 ]]
                        -- upvalues: v236 (ref), v246 (copy)
                        local _ = v236.object[v246];
                    end) then
                        v236.object[v246] = v247;
                    end;
                    return;
                end;
            end;
            return v236;
        end;
    end;
end;
return {
    convertToPart = createMetaPart, 
    forcePrimaryPart = forcePrimaryPart
};