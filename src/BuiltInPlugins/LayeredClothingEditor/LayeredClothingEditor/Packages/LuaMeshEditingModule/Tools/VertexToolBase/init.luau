local l_Parent_0 = script.Parent.Parent;
local l_Util_0 = l_Parent_0.Util;
local v2 = require(l_Util_0.deepCopy);
local v3 = require(l_Util_0.Signal);
local v4 = require(l_Util_0.applySymmetryMap);
local v5 = require(l_Util_0.softSelectPoints);
local v6 = require(l_Util_0.TransformPointsHelpers);
local v7 = require(l_Util_0.Constants);
local l_Views_0 = l_Parent_0.Views;
local v9 = require(l_Views_0.ControlEdgeViews);
local v10 = require(l_Views_0.ControlPointViews);
local v11 = require(l_Views_0.ToolAdornees);
local v12 = require(l_Views_0.WireframeMeshView);
local v13 = require(l_Parent_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
local l_DefaultWireframeColor_0 = v7.VertexToolBase.DefaultWireframeColor;
local l_DefaultWireframeSegmentsColor_0 = v7.VertexToolBase.DefaultWireframeSegmentsColor;
local v16 = {};
v16.__index = v16;
v16.new = function() --[[ Line: 35 ]] --[[ Name: new ]]
    -- upvalues: v16 (copy), v3 (copy), v6 (copy), v5 (copy), v13 (copy), v4 (copy), v11 (copy), v10 (copy), v9 (copy), v12 (copy), v2 (copy), l_DefaultWireframeColor_0 (copy), l_DefaultWireframeSegmentsColor_0 (copy)
    local v17 = setmetatable({}, v16);
    local v18 = nil;
    local v19 = v3.new();
    local v20 = {};
    local v21 = {};
    local v22 = nil;
    local l_Select_0 = Enum.RibbonTool.Select;
    local v24 = nil;
    local v25 = false;
    local v26 = 0;
    local v27 = {};
    local v28 = v3.new();
    local v29 = nil;
    local v30 = nil;
    local v31 = nil;
    local v32 = nil;
    local v33 = nil;
    local v34 = {};
    local v35 = nil;
    local v36 = nil;
    local v37 = {};
    local v38 = {};
    local v39 = nil;
    local v40 = v3.new();
    local v41 = v3.new();
    local v42 = {};
    local v43 = 0;
    local v44 = true;
    local v45 = nil;
    local function v49(v46, v47) --[[ Line: 69 ]] --[[ Name: _isHovered ]]
        -- upvalues: v29 (ref)
        local v48 = false;
        if v29 ~= nil then
            v48 = false;
            if v29.MeshName == v46 then
                v48 = v29.Index == v47;
            end;
        end;
        return v48;
    end;
    local function v52(v50, v51) --[[ Line: 75 ]] --[[ Name: _isSelected ]]
        -- upvalues: v38 (ref)
        if v38[v50] then
            return v38[v50][v51];
        else
            return nil;
        end;
    end;
    local function v55(v53) --[[ Line: 82 ]] --[[ Name: _transformHelper ]]
        -- upvalues: v36 (ref), v6 (ref), v22 (ref), v20 (ref), v38 (ref), v17 (copy)
        local v54 = if v36 then v36.ToolStateData else nil;
        assert(v54 and v54.ControlPointLocationData and v36.VertexData, "Invalid save state, could not transform points.");
        v6.transformControlPoints(v22, v54.ControlPointLocationData.Positions, v20.Positions, v38, v53);
        v6.transformVertices(v22, v36.VertexData, v17:getVertexWeights(), v53);
        v17:render();
    end;
    local function v57() --[[ Line: 105 ]] --[[ Name: _softSelect ]]
        -- upvalues: v38 (ref), v5 (ref), v22 (ref), v37 (ref), v26 (ref), v13 (ref), v4 (ref), v17 (copy), v40 (copy)
        v38 = v5(v22, v37, v26);
        if v13() and v22 ~= nil then
            local v56 = v22:getSymmetryMap();
            if v56 ~= nil then
                v4(v56, v38);
            end;
        end;
        v17:render();
        v40:Fire();
    end;
    local function v63() --[[ Line: 121 ]] --[[ Name: _cleanupViews ]]
        -- upvalues: v24 (ref), v35 (ref), v18 (ref), v45 (ref)
        local v58 = {
            v24, 
            v35, 
            v18, 
            v45
        };
        for _, v60 in pairs(v58) do
            if v60 then
                v60:disconnect();
            end;
        end;
        for _, v62 in pairs(v58) do
            if v62 then
                v62:cleanup();
            end;
        end;
        v24 = nil;
        v35 = nil;
        v18 = nil;
        v45 = nil;
    end;
    local function _() --[[ Line: 141 ]] --[[ Name: _initViews ]]
        -- upvalues: v18 (ref), v11 (ref), v22 (ref), v35 (ref), v10 (ref), v24 (ref), v9 (ref), v45 (ref), v12 (ref)
        v18 = v11.new(v22);
        v35 = v10.new(v22);
        v24 = v9.new(v22);
        v45 = v12.new();
    end;
    local function v65() --[[ Line: 148 ]] --[[ Name: _onExternalChange ]]
        -- upvalues: v63 (copy), v18 (ref), v11 (ref), v22 (ref), v35 (ref), v10 (ref), v24 (ref), v9 (ref), v45 (ref), v12 (ref), v17 (copy)
        v63();
        v18 = v11.new(v22);
        v35 = v10.new(v22);
        v24 = v9.new(v22);
        v45 = v12.new();
        v17:render();
    end;
    local function v69(v66, v67, v68) --[[ Line: 154 ]] --[[ Name: _onContextChanged ]]
        -- upvalues: v63 (copy), v37 (ref), v38 (ref), v39 (ref), v40 (copy), v27 (ref), v34 (ref), v36 (ref), v22 (ref), v20 (ref), v21 (ref)
        v63();
        v37 = {};
        v38 = {};
        v39 = nil;
        v40:Fire();
        v27 = {};
        v34 = {};
        v36 = nil;
        v22 = v66;
        v20 = v67;
        v21 = v68;
    end;
    local function v75(v70, v71) --[[ Line: 170 ]] --[[ Name: _setCurrentToolStateDataInternal ]]
        -- upvalues: v22 (ref), v42 (ref), v2 (ref), v20 (ref), v21 (ref), v17 (copy)
        if not v22 then
            error("Tool has no active context. Data was not updated.");
            return;
        else
            local v72 = v42[v22];
            if not v72 then
                error("No tool state found for the current context. Data was not updated.");
                return;
            else
                for v73, v74 in pairs(v70) do
                    if v71 and v73 == "ControlPointLocationDataBackup" then
                        warn("ControlPointLocationDataBackup" .. " in tool state cannot be overridden. Data was skipped in _setCurrentToolStateData.");
                    else
                        v72[v73] = v2(v74);
                        if v73 == "ControlPointLocationData" then
                            v20 = v72[v73];
                            if v71 then
                                v21 = v2(v20);
                                v72.ControlPointLocationDataBackup = v21;
                            end;
                        elseif v73 == "ControlPointLocationDataBackup" and not v71 then
                            v21 = v72[v73];
                        end;
                    end;
                end;
                v17:render();
                return;
            end;
        end;
    end;
    v17._setCurrentToolStateData = function(_, v77) --[[ Line: 208 ]] --[[ Name: _setCurrentToolStateData ]]
        -- upvalues: v75 (copy)
        v75(v77, true);
    end;
    v17.updateCurrentToolStateData = function(_) --[[ Line: 212 ]] --[[ Name: updateCurrentToolStateData ]]
        -- upvalues: v20 (ref), v2 (ref), v75 (copy)
        local v79 = {
            ControlPointLocationData = v20, 
            ControlPointLocationDataBackup = v2(v20)
        };
        v75(v79, false);
    end;
    v17._getCurrentToolStateData = function(_) --[[ Line: 220 ]] --[[ Name: _getCurrentToolStateData ]]
        -- upvalues: v22 (ref), v42 (ref), v2 (ref)
        if not v22 then
            error("Tool has no active context. State was not returned.");
            return {};
        else
            local v81 = v42[v22];
            assert(v81, "No state found for current context.");
            return v2(v81);
        end;
    end;
    v17._getSelectedControlWeights = function(_) --[[ Line: 232 ]] --[[ Name: _getSelectedControlWeights ]]
        -- upvalues: v2 (ref), v38 (ref)
        return v2(v38);
    end;
    v17._getcontrolPointLocationData = function(_) --[[ Line: 236 ]] --[[ Name: _getcontrolPointLocationData ]]
        -- upvalues: v2 (ref), v20 (ref)
        return v2(v20);
    end;
    v17._setSelectedControlWeights = function(_, v85) --[[ Line: 240 ]] --[[ Name: _setSelectedControlWeights ]]
        -- upvalues: v38 (ref), v2 (ref)
        v38 = v2(v85);
    end;
    v17._setControlPointLocationData = function(_, v87) --[[ Line: 244 ]] --[[ Name: _setControlPointLocationData ]]
        -- upvalues: v20 (ref), v2 (ref)
        v20 = v2(v87);
    end;
    v17.setHoveredPoint = function(_, v89) --[[ Line: 248 ]] --[[ Name: setHoveredPoint ]]
        -- upvalues: v13 (ref), v30 (ref), v33 (ref)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        v30 = v89;
        if v33 ~= nil then
            v33({
                v89 and v89.Adornee.CFrame:ToWorldSpace(v89.CFrame).Position
            });
        end;
    end;
    v17.setMannequin = function(_, v91) --[[ Line: 258 ]] --[[ Name: setMannequin ]]
        -- upvalues: v13 (ref), v31 (ref)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        v31 = v91;
    end;
    v17.getMannequin = function(_) --[[ Line: 263 ]] --[[ Name: getMannequin ]]
        -- upvalues: v13 (ref), v31 (ref)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        return v31;
    end;
    v17.setOnChangeSelectedPositions = function(_, v94) --[[ Line: 268 ]] --[[ Name: setOnChangeSelectedPositions ]]
        -- upvalues: v13 (ref), v33 (ref)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        v33 = v94;
    end;
    v17.getDedupedPositionsFromContext = function(_, v96) --[[ Line: 273 ]] --[[ Name: getDedupedPositionsFromContext ]]
        -- upvalues: v13 (ref)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        assert(v96 ~= nil, "Could not get positions: Context was nil.");
        local function _(v97, v98, v99) --[[ Line: 277 ]] --[[ Name: _checkPointVisited ]]
            return v97[v98] and v97[v98][v99];
        end;
        local function v108(v101, v102, v103, v104) --[[ Line: 281 ]] --[[ Name: _visitPoint ]]
            local v105 = v104[v102] and v104[v102][v103];
            if v105 then
                for _, v107 in v105 do
                    if not v101[v107.MeshName] then
                        v101[v107.MeshName] = {};
                    end;
                    v101[v107.MeshName][v107.Index] = true;
                end;
            end;
            if not v101[v102] then
                v101[v102] = {};
            end;
            v101[v102][v103] = true;
        end;
        local v109 = {
            Positions = {}, 
            Edges = {}
        };
        local v110 = v96:getVertexData();
        local v111 = v96:getSeamData();
        local v112 = {};
        for v113 in v110 do
            table.insert(v112, v113);
        end;
        table.sort(v112);
        local v114 = {};
        for _, v116 in v112 do
            local v117 = v110[v116];
            v109.Positions[v116] = {};
            for v118, v119 in v117 do
                if not (v114[v116] and v114[v116][v118]) then
                    v108(v114, v116, v118, v111);
                    v109.Positions[v116][v118] = v119;
                end;
            end;
        end;
        return v109;
    end;
    v17.addContext = function(_, v121, v122) --[[ Line: 329 ]] --[[ Name: addContext ]]
        -- upvalues: v42 (ref), v2 (ref)
        if not v121 then
            error("Could not add context: Context was nil.");
            return;
        else
            assert(v122.Positions, "ControlPointLocationData missing array at key: Positions");
            assert(v122.Edges, "ControlPointLocationData missing array at key: Edges");
            if v42[v121] then
                error("Context was already added to the tool.");
                return;
            else
                v42[v121] = {
                    ControlPointLocationData = v122, 
                    ControlPointLocationDataBackup = v2(v122)
                };
                return;
            end;
        end;
    end;
    v17.setMouse = function(_, v124) --[[ Line: 349 ]] --[[ Name: setMouse ]]
        _mouse = v124;
    end;
    v17.getMouse = function(_) --[[ Line: 353 ]] --[[ Name: getMouse ]]
        return _mouse;
    end;
    v17.setRadius = function(_, v127) --[[ Line: 357 ]] --[[ Name: setRadius ]]
        _radius = v127;
    end;
    v17.getRadius = function(_) --[[ Line: 361 ]] --[[ Name: getRadius ]]
        return _radius;
    end;
    v17.getCurrentContext = function(_) --[[ Line: 365 ]] --[[ Name: getCurrentContext ]]
        -- upvalues: v22 (ref)
        return v22;
    end;
    v17.setCurrentContext = function(v130, v131) --[[ Line: 369 ]] --[[ Name: setCurrentContext ]]
        -- upvalues: v69 (copy), v42 (ref), v22 (ref), v25 (ref), v18 (ref), v11 (ref), v35 (ref), v10 (ref), v24 (ref), v9 (ref), v45 (ref), v12 (ref)
        if not v131 then
            v69();
            return;
        else
            local v132 = v42[v131];
            if not v132 then
                error("No tool state found for this context. Context was not changed. " .. "Try calling AddContext(context, controlPointLocationData) before invoking this method.");
                return;
            else
                if v131 ~= v22 then
                    v69(v131, v132.ControlPointLocationData, v132.ControlPointLocationDataBackup);
                    v130:saveState();
                    if v25 then
                        v18 = v11.new(v22);
                        v35 = v10.new(v22);
                        v24 = v9.new(v22);
                        v45 = v12.new();
                        v130:render();
                    end;
                end;
                return;
            end;
        end;
    end;
    v17.getEnabled = function(_) --[[ Line: 399 ]] --[[ Name: getEnabled ]]
        -- upvalues: v25 (ref)
        return v25;
    end;
    v17.setEnabled = function(v134, v135) --[[ Line: 403 ]] --[[ Name: setEnabled ]]
        -- upvalues: v25 (ref), v63 (copy), v22 (ref), v18 (ref), v11 (ref), v35 (ref), v10 (ref), v24 (ref), v9 (ref), v45 (ref), v12 (ref)
        v25 = v135;
        if not v25 then
            v63();
            return;
        else
            if v22 then
                v18 = v11.new(v22);
                v35 = v10.new(v22);
                v24 = v9.new(v22);
                v45 = v12.new();
                v134:render();
            end;
            return;
        end;
    end;
    v17.removeContext = function(_, v137) --[[ Line: 413 ]] --[[ Name: removeContext ]]
        -- upvalues: v42 (ref), v22 (ref), v69 (copy)
        if not v137 then
            error("Could not remove context: Context was nil.");
            return;
        elseif not v42[v137] then
            error("Context not found in tool.");
            return;
        else
            if v137 == v22 then
                v69();
            end;
            v42[v137] = nil;
            return;
        end;
    end;
    v17.resetCurrentContext = function(v138) --[[ Line: 431 ]] --[[ Name: resetCurrentContext ]]
        -- upvalues: v22 (ref), v75 (copy), v2 (ref), v21 (ref), v19 (copy)
        if not v22 then
            return;
        else
            v22:resetVertexData();
            v75({
                ControlPointLocationData = v2(v21)
            }, false);
            v138:addWaypoint();
            v138:render();
            v19:Fire();
            return;
        end;
    end;
    v17.resetCurrentContextTo = function(v139, v140) --[[ Line: 447 ]] --[[ Name: resetCurrentContextTo ]]
        -- upvalues: v13 (ref), v22 (ref), v75 (copy), v2 (ref), v19 (copy)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        if not v22 then
            return;
        else
            v22:resetVertexDataTo(v140);
            v75({
                ControlPointLocationData = v2(v139:getDedupedPositionsFromContext(v22))
            }, false);
            v139:addWaypoint();
            v139:render();
            v19:Fire();
            return;
        end;
    end;
    v17.getCurrentHandle = function(_) --[[ Line: 465 ]] --[[ Name: getCurrentHandle ]]
        -- upvalues: l_Select_0 (ref)
        return l_Select_0;
    end;
    v17.setCurrentHandle = function(_, v143) --[[ Line: 469 ]] --[[ Name: setCurrentHandle ]]
        -- upvalues: l_Select_0 (ref), v28 (copy)
        l_Select_0 = v143;
        v28:Fire();
    end;
    v17.shouldRender = function(_) --[[ Line: 474 ]] --[[ Name: shouldRender ]]
        -- upvalues: v22 (ref), v25 (ref), v18 (ref), v35 (ref), v24 (ref), v45 (ref)
        local v145 = false;
        if v22 ~= nil then
            v145 = false;
            if v25 ~= false then
                v145 = false;
                if v18 ~= nil then
                    v145 = false;
                    if v35 ~= nil then
                        v145 = false;
                        if v24 ~= nil then
                            v145 = v45 ~= nil;
                        end;
                    end;
                end;
            end;
        end;
        return v145;
    end;
    v17.render = function(v146) --[[ Line: 483 ]] --[[ Name: render ]]
        -- upvalues: v18 (ref), v65 (copy), v35 (ref), v20 (ref), v43 (ref), v52 (copy), v49 (copy), v39 (ref), v30 (ref), v24 (ref), v45 (ref), v22 (ref), l_DefaultWireframeColor_0 (ref), l_DefaultWireframeSegmentsColor_0 (ref), v44 (ref)
        if not v146:shouldRender() then
            return;
        else
            v18:render({
                FolderChangedCallback = v65
            });
            v35:render({
                ControlPointPositions = v20.Positions, 
                Adornees = v18, 
                Transparency = v43, 
                IsSelected = v52, 
                IsHovered = v49, 
                SelectedMesh = v39, 
                FolderChangedCallback = v65, 
                CenterHoveredPoint = v30
            });
            v24:render({
                ControlPointPositions = v20.Positions, 
                ControlPointEdges = v20.Edges, 
                Adornees = v18, 
                Transparency = v43, 
                SelectedMesh = v39, 
                FolderChangedCallback = v65
            });
            v45:render({
                Context = v22, 
                Transparency = v43, 
                WireColor = l_DefaultWireframeColor_0, 
                SegmentColor = l_DefaultWireframeSegmentsColor_0, 
                ToolAdornees = v18, 
                Visible = v44, 
                FolderChangedCallback = v65
            });
            return;
        end;
    end;
    v17.getSelectedMesh = function(_) --[[ Line: 520 ]] --[[ Name: getSelectedMesh ]]
        -- upvalues: v39 (ref)
        return v39;
    end;
    v17.setSelectedMesh = function(v148, v149) --[[ Line: 524 ]] --[[ Name: setSelectedMesh ]]
        -- upvalues: v39 (ref), v41 (copy)
        if v39 ~= v149 then
            v39 = v149;
            v148:render();
            v41:Fire();
        end;
    end;
    v17.cleanup = function(_) --[[ Line: 532 ]] --[[ Name: cleanup ]]
        -- upvalues: v69 (copy), v42 (ref)
        v69();
        v42 = {};
    end;
    v17.getWireframeEnabled = function(_) --[[ Line: 537 ]] --[[ Name: getWireframeEnabled ]]
        -- upvalues: v44 (ref)
        return v44;
    end;
    v17.setWireframeEnabled = function(v152, v153) --[[ Line: 541 ]] --[[ Name: setWireframeEnabled ]]
        -- upvalues: v44 (ref), v41 (copy)
        if v44 ~= v153 then
            v44 = v153;
            v152:render();
            v41:Fire();
        end;
    end;
    v17.getTransparency = function(_) --[[ Line: 549 ]] --[[ Name: getTransparency ]]
        -- upvalues: v43 (ref)
        return v43;
    end;
    v17.setTransparency = function(v155, v156) --[[ Line: 553 ]] --[[ Name: setTransparency ]]
        -- upvalues: v43 (ref), v41 (copy)
        if v43 ~= v156 then
            v43 = v156;
            v155:render();
            v41:Fire();
        end;
    end;
    v17.getFalloff = function(_) --[[ Line: 561 ]] --[[ Name: getFalloff ]]
        -- upvalues: v26 (ref)
        return v26;
    end;
    v17.setFalloff = function(_, v159) --[[ Line: 565 ]] --[[ Name: setFalloff ]]
        -- upvalues: v26 (ref), v57 (copy), v41 (copy)
        if v26 ~= v159 then
            v26 = v159;
            v57();
            v41:Fire();
        end;
    end;
    v17.setMirrorPlane = function(_, _, _) --[[ Line: 573 ]] --[[ Name: setMirrorPlane ]]

    end;
    v17.getMirrorPlane = function(_) --[[ Line: 577 ]] --[[ Name: getMirrorPlane ]]

    end;
    v17.setMirroringEnabled = function(_, _) --[[ Line: 581 ]] --[[ Name: setMirroringEnabled ]]

    end;
    v17.getMirroringEnabled = function(_) --[[ Line: 585 ]] --[[ Name: getMirroringEnabled ]]

    end;
    v17.saveState = function(v167) --[[ Line: 589 ]] --[[ Name: saveState ]]
        -- upvalues: v36 (ref), v22 (ref)
        v36 = {
            ToolStateData = v167:_getCurrentToolStateData(), 
            VertexData = v22:getVertexData()
        };
    end;
    v17.getState = function(_) --[[ Line: 596 ]] --[[ Name: getState ]]
        -- upvalues: v36 (ref)
        return v36;
    end;
    v17.addWaypoint = function(v169) --[[ Line: 600 ]] --[[ Name: addWaypoint ]]
        -- upvalues: v36 (ref), v34 (ref), v27 (ref)
        assert(v36 ~= nil, "Saved State cannot be nil. Is there an active context?");
        table.insert(v34, v36);
        v27 = {};
        v169:saveState();
    end;
    v17.undo = function(v170) --[[ Line: 610 ]] --[[ Name: undo ]]
        -- upvalues: v34 (ref), v27 (ref), v22 (ref), v75 (copy), v19 (copy)
        if #v34 > 0 then
            table.insert(v27, {
                ToolStateData = v170:_getCurrentToolStateData(), 
                VertexData = v22:getVertexData()
            });
            local v171 = v34[#v34];
            v22:updateVertexData(v171.VertexData);
            v75(v171.ToolStateData, false);
            v170:saveState();
            v34[#v34] = nil;
            v19:Fire();
        end;
    end;
    v17.redo = function(v172) --[[ Line: 627 ]] --[[ Name: redo ]]
        -- upvalues: v27 (ref), v34 (ref), v22 (ref), v75 (copy), v19 (copy)
        if #v27 > 0 then
            table.insert(v34, {
                ToolStateData = v172:_getCurrentToolStateData(), 
                VertexData = v22:getVertexData()
            });
            local v173 = v27[#v27];
            v22:updateVertexData(v173.VertexData);
            v75(v173.ToolStateData, false);
            v172:saveState();
            v27[#v27] = nil;
            v19:Fire();
        end;
    end;
    v17.getUndoRedoStack = function(_) --[[ Line: 644 ]] --[[ Name: getUndoRedoStack ]]
        -- upvalues: v13 (ref), v34 (ref), v27 (ref)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        return v34, v27;
    end;
    v17.restoreUndoRedoStack = function(_, v176, v177) --[[ Line: 649 ]] --[[ Name: restoreUndoRedoStack ]]
        -- upvalues: v13 (ref), v34 (ref), v27 (ref)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        local function _(v178) --[[ Line: 652 ]] --[[ Name: isNilOrEmpty ]]
            local v179 = true;
            if v178 ~= nil then
                v179 = #v178 == 0;
            end;
            return v179;
        end;
        local l_v34_0 = v34;
        local v182 = true;
        if l_v34_0 ~= nil then
            v182 = #l_v34_0 == 0;
        end;
        if v182 then
            l_v34_0 = v27;
            v182 = true;
            if l_v34_0 ~= nil then
                v182 = #l_v34_0 == 0;
            end;
        end;
        assert(v182, "Trying to restore edit history when existing edit history is not empty!");
        v34 = v176;
        v27 = v177;
    end;
    v17.getSelectionChangedSignal = function(_) --[[ Line: 665 ]] --[[ Name: getSelectionChangedSignal ]]
        -- upvalues: v40 (copy)
        return v40;
    end;
    v17.getToolDisplayChangedSignal = function(_) --[[ Line: 669 ]] --[[ Name: getToolDisplayChangedSignal ]]
        -- upvalues: v41 (copy)
        return v41;
    end;
    v17.getDraggerHandleChangedSignal = function(_) --[[ Line: 673 ]] --[[ Name: getDraggerHandleChangedSignal ]]
        -- upvalues: v28 (copy)
        return v28;
    end;
    v17.getBoundsChangedSignal = function(_) --[[ Line: 677 ]] --[[ Name: getBoundsChangedSignal ]]
        -- upvalues: v19 (copy)
        return v19;
    end;
    v17.getVertexWeights = function(_) --[[ Line: 681 ]] --[[ Name: getVertexWeights ]]
        assert("GetVertexWeights must be implemented for VertexToolBase child classes.");
    end;
    v17.getSelected = function(_) --[[ Line: 687 ]] --[[ Name: getSelected ]]
        -- upvalues: v2 (ref), v37 (ref)
        return v2(v37);
    end;
    v17.setSelected = function(_, v190) --[[ Line: 691 ]] --[[ Name: setSelected ]]
        -- upvalues: v37 (ref), v2 (ref), v57 (copy)
        v37 = v2(v190);
        v57();
    end;
    v17.getSelectablesForMesh = function(_, v192) --[[ Line: 696 ]] --[[ Name: getSelectablesForMesh ]]
        -- upvalues: v35 (ref), v13 (ref)
        local v193 = {};
        if v35 then
            if v13() then
                v35:getSelectablesForMesh(v192, {});
                return v193;
            else
                v35:getSelectablesForMesh(v192);
            end;
        end;
        return v193;
    end;
    v17.getSelectables = function(_) --[[ Line: 708 ]] --[[ Name: getSelectables ]]
        -- upvalues: v35 (ref)
        if v35 then
            return v35:getSelectables();
        else
            error("No Control_pointViews exist that can be selected.");
            return {};
        end;
    end;
    v17.getHoveredPoint = function(_) --[[ Line: 717 ]] --[[ Name: getHoveredPoint ]]
        -- upvalues: v13 (ref), v30 (ref)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        return v30;
    end;
    v17.setHovered = function(v196, v197) --[[ Line: 722 ]] --[[ Name: setHovered ]]
        -- upvalues: v29 (ref)
        v29 = v197;
        v196:render();
    end;
    v17.transformSelected = function(_, v199, v200, v201, v202) --[[ Line: 727 ]] --[[ Name: transformSelected ]]
        -- upvalues: l_Select_0 (ref), v55 (copy), v6 (ref)
        if l_Select_0 == Enum.RibbonTool.Move then
            v55(function(v203, v204, v205) --[[ Line: 729 ]]
                -- upvalues: v6 (ref), v199 (copy)
                return v6.translatePoint(v204, v199, v203, v205);
            end);
            return;
        elseif l_Select_0 == Enum.RibbonTool.Rotate then
            v55(function(v206, v207, v208) --[[ Line: 733 ]]
                -- upvalues: v6 (ref), v201 (copy), v202 (copy), v200 (copy)
                return v6.rotatePoint(v207, v201, v202, v200, v206, v208);
            end);
            return;
        else
            v55(function(v209, v210, v211) --[[ Line: 737 ]]
                -- upvalues: v6 (ref), v199 (copy)
                return v6.translatePoint(v210, v199, v209, v211);
            end);
            return;
        end;
    end;
    v17.scaleSelected = function(_, v213, v214) --[[ Line: 743 ]] --[[ Name: scaleSelected ]]
        -- upvalues: v55 (copy), v6 (ref)
        v55(function(v215, v216, v217) --[[ Line: 744 ]]
            -- upvalues: v6 (ref), v214 (copy), v213 (copy)
            return v6.scalePoint(v216, v214, v213, v215, v217);
        end);
    end;
    v17.setMouseStartPosition = function(_, v219) --[[ Line: 749 ]] --[[ Name: setMouseStartPosition ]]
        -- upvalues: v13 (ref), v32 (ref)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        v32 = v219;
    end;
    v17.getMouseStartPosition = function(_) --[[ Line: 754 ]] --[[ Name: getMouseStartPosition ]]
        -- upvalues: v13 (ref), v32 (ref)
        assert(v13(), "FFlagAvatarPreviewerCageEditingTools is not enabled!");
        return v32;
    end;
    return v17;
end;
return v16;