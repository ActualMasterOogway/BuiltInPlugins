local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local l_VoxelResolution_0 = require(l_script_FirstAncestor_0.Src.Resources.Constants).VoxelResolution;
local v2 = require(l_script_FirstAncestor_0.Src.Types);
local l_BuildSettings_0 = v2.BuildSettings;
local l_Category_0 = v2.Category;
local l_Generation_0 = l_script_FirstAncestor_0.Src.Util.Generation;
local v6 = require(l_Generation_0.GetBlendingFactorMap);
local v7 = require(l_Generation_0.RotatePointInRectangle);
local v8 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorDebugMode);
local v9 = require(l_script_FirstAncestor_0.Src.Util.AnalyticsHelper);
local v10 = {};
local l_StarterGui_0 = game:GetService("StarterGui");
v10.__index = v10;
v10.new = function(v12, v13) --[[ Line: 24 ]] --[[ Name: new ]]
    local v14 = {
        _terrainType = v13
    };
    setmetatable(v14, v12);
    v12.__index = v12;
    return v14;
end;
v10.init = function(v15, v16, v17) --[[ Line: 34 ]] --[[ Name: init ]]
    v15._services = v17;
    v15._payload = v16;
    v15._time = 0;
    v15._timeTotals = 0;
    v15:setupRegion();
    return v15;
end;
v10.update = function(v18, v19, v20) --[[ Line: 46 ]] --[[ Name: update ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), v7 (copy), v9 (copy)
    local v21 = os.clock();
    local v22 = if v20 then v20[l_Category_0.BuildSettings] else nil;
    if v22 and v22[l_BuildSettings_0.Transform] == v18._payload[l_Category_0.BuildSettings][l_BuildSettings_0.Transform] and v22[l_BuildSettings_0.Size] == v18._payload[l_Category_0.BuildSettings][l_BuildSettings_0.Size] then
        return;
    else
        v18._payload = v19;
        local v23 = {
            noiseMap = true, 
            heightMap = true, 
            heightMapCacheTopDown = true, 
            heightMapCacheBottomUp = true, 
            heightMapSnappingUpdate = true
        };
        if v22 then
            local v24 = true;
            local v25 = true;
            if v22[l_BuildSettings_0.Transform] or v22[l_BuildSettings_0.Size] then
                local l_Size_0 = v18._region.Size;
                v18:revertRegion(v18._region);
                v18:setupRegion();
                if l_Size_0 == v18._region.Size then
                    v24 = false;
                    v25 = false;
                elseif l_Size_0.X == v18._region.Size.X and l_Size_0.Z == v18._region.Size.Z then
                    v25 = false;
                end;
            else
                v23.heightMapCacheTopDown = false;
                v23.heightMapCacheBottomUp = false;
            end;
            if not v22[l_BuildSettings_0.Transform] then
                v23.heightMapSnappingUpdate = false;
            end;
            local v27 = v22[l_BuildSettings_0.BlendingEdge];
            if v27 then
                v18._addBlending = v27 > 0;
                v18:updateBlendingFactorMap(v27);
            end;
            if not v24 then
                v23.noiseMap = false;
                v23.heightMap = false;
            end;
            if not v25 then
                v23.noiseMap = false;
            end;
            if v22[l_BuildSettings_0.Material] or v22[l_BuildSettings_0.MaterialLUT] or v22[l_BuildSettings_0.WaterLevel] or v22[l_BuildSettings_0.BlendingEdge] then
                v23.noiseMap = false;
                v23.heightMap = false;
            end;
            v23.heightMapCacheBottomUp = v23.heightMap or v23.heightMapCacheBottomUp;
        else
            local v28 = v19[l_Category_0.BuildSettings][l_BuildSettings_0.BlendingEdge];
            if v28 then
                v18._addBlending = v28 > 0;
                v18:updateBlendingFactorMap(v28);
            end;
        end;
        local v29 = v18._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Rotation];
        v18._rotationY = if v29 and v29 > 0 and v29 < 360 then v29 else 0;
        v18._getRotatedPoint = v7(v18._sliceX, v18._sliceZ, (math.rad(v18._rotationY)));
        v18:generateStamp(v23);
        v18._time = v18._time + v9.NormalizeRegionTimer(v21, v18._payload[l_Category_0.BuildSettings][l_BuildSettings_0.Size]);
        v18._timeTotals = v18._timeTotals + 1;
        return;
    end;
end;
v10.getAverageFrameTime = function(v30) --[[ Line: 151 ]] --[[ Name: getAverageFrameTime ]]
    if v30._time and v30._timeTotals then
        return v30._time / v30._timeTotals;
    else
        return nil;
    end;
end;
v10.getTerrainType = function(v31) --[[ Line: 159 ]] --[[ Name: getTerrainType ]]
    return v31._terrainType;
end;
v10.setupRegion = function(v32) --[[ Line: 163 ]] --[[ Name: setupRegion ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), l_VoxelResolution_0 (copy)
    local l_Position_0 = v32._payload[l_Category_0.BuildSettings][l_BuildSettings_0.Transform].Position;
    local v34 = v32._payload[l_Category_0.BuildSettings][l_BuildSettings_0.Size] / 2;
    v32._region = Region3.new(l_Position_0 - v34, l_Position_0 + v34);
    v32._region = v32._region:ExpandToGrid(l_VoxelResolution_0);
    v32._sliceX = v32._region.Size.X / l_VoxelResolution_0;
    v32._sliceY = v32._region.Size.Y / l_VoxelResolution_0;
    v32._sliceZ = v32._region.Size.Z / l_VoxelResolution_0;
    v32._mapSize = v32._sliceX * v32._sliceZ;
    v32:cacheRegion(v32._region);
    v32:updateBlendingFactorMap(v32._payload[l_Category_0.BuildSettings][l_BuildSettings_0.BlendingEdge] or 0);
end;
v10.getIndex = function(v35, v36, v37) --[[ Line: 180 ]] --[[ Name: getIndex ]]
    return v35._sliceZ * (v36 - 1) + v37;
end;
v10.generateStamp = function(v38, v39) --[[ Line: 184 ]] --[[ Name: generateStamp ]]
    -- upvalues: v8 (copy), l_VoxelResolution_0 (copy)
    if not v38._region or v38._region.Size == Vector3.zero then
        return;
    else
        if v39.heightMapCacheTopDown then
            debug.profilebegin("TG_GenerateHeightCacheTopDown");
            v38:generateHeightMapCacheTopDown();
            debug.profileend();
        end;
        if v39.noiseMap then
            debug.profilebegin("TG_GenerateNoise");
            v38:generateNoiseMap();
            debug.profileend();
        end;
        if v39.heightMap then
            debug.profilebegin("TG_GenerateHeight");
            v38:generateHeightMap();
            debug.profileend();
        end;
        if v39.heightMapCacheBottomUp then
            debug.profilebegin("TG_GenerateHeightCacheBottomUp");
            v38:generateHeightMapCacheBottomUp();
            debug.profileend();
        end;
        debug.profilebegin("TG_BlendHeight");
        v38:blendHeightMap();
        debug.profileend();
        debug.profilebegin("TG_GenerateOccupancyMap");
        v38:generateOccupancyMap();
        debug.profileend();
        debug.profilebegin("TG_GenerateSlopeMap");
        v38:generateSlopeMap();
        debug.profileend();
        debug.profilebegin("TG_GenerateMaterial");
        v38:generateMaterialMap();
        debug.profileend();
        debug.profilebegin("TG_BlendMaterialMap");
        v38:blendMaterialMap();
        debug.profileend();
        debug.profilebegin("TG_PostProcessing");
        v38:postProcessing();
        debug.profileend();
        if v8() then
            v38:debugDraw();
        end;
        v38._services.Terrain:WriteVoxelChannels(v38._region, l_VoxelResolution_0, {
            SolidMaterial = v38._materialMap, 
            SolidOccupancy = v38._occupancyMap
        });
        if v38._waterMap then
            v38._services.Terrain:WriteVoxelChannels(v38._region, l_VoxelResolution_0, {
                LiquidOccupancy = v38._waterMap
            });
        end;
        return;
    end;
end;
v10.generateNoiseMap = function(v40) --[[ Line: 257 ]] --[[ Name: generateNoiseMap ]]
    v40._noiseMap = table.create(v40._mapSize, 0);
end;
v10.generateHeightMap = function(v41) --[[ Line: 261 ]] --[[ Name: generateHeightMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy)
    local v42 = v41._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseScale];
    local v43 = v41._payload[l_Category_0.BuildSettings][l_BuildSettings_0.NoiseStrength];
    local v44 = if v42 > 0 then v43 / 2 else 0;
    local v45 = v41._sliceY * (1 - v44);
    v41._heightMapFromNoise = table.create(v41._mapSize, 0);
    for v46 = 1, v41._mapSize do
        local v47 = v41._noiseMap[v46];
        local v48 = v45 + v41._sliceY * v44 * v47;
        v41._heightMapFromNoise[v46] = math.clamp(v48, 0, v41._sliceY);
    end;
end;
v10.generateSlopeMap = function(v49) --[[ Line: 277 ]] --[[ Name: generateSlopeMap ]]
    v49._slopeMap = table.create(v49._mapSize, 0);
    v49._minNeighborHeight = table.create(v49._mapSize, 0);
    local v50 = {
        {
            -1, 
            0
        }, 
        {
            1, 
            0
        }, 
        {
            0, 
            -1
        }, 
        {
            0, 
            1
        }, 
        {
            -1, 
            -1
        }, 
        {
            -1, 
            1
        }, 
        {
            1, 
            -1
        }, 
        {
            1, 
            1
        }
    };
    for v51 = 1, v49._sliceX do
        for v52 = 1, v49._sliceZ do
            local v53 = v49:getIndex(v51, v52);
            local v54 = v49._heightMap[v53];
            local v55 = math.floor(v54);
            local v56 = 0;
            local v57 = 0;
            local v58 = 0;
            local v59 = 0;
            local v60 = 0;
            local v61 = 0;
            v49._minNeighborHeight[v53] = v55;
            for _, v63 in v50 do
                local v64 = v51 + v63[1];
                local v65 = v52 + v63[2];
                local v66 = false;
                if v64 > 0 then
                    v66 = false;
                    if v64 <= v49._sliceX then
                        v66 = false;
                        if v65 > 0 then
                            v66 = v65 <= v49._sliceZ;
                        end;
                    end;
                end;
                local v67 = if v66 then v49._heightMap[v49:getIndex(v64, v65)] else 0;
                local v68 = math.floor(v67);
                v49._minNeighborHeight[v53] = math.min(v49._minNeighborHeight[v53], v68);
                if v66 then
                    if v63[1] == 0 then
                        v56 = v56 + math.abs(v67 - v54);
                        v57 = v57 + 1;
                    elseif v63[2] == 0 then
                        v58 = v58 + math.abs(v67 - v54);
                        v59 = v59 + 1;
                    else
                        v60 = v60 + math.abs(v67 - v54);
                        v61 = v61 + 1;
                    end;
                end;
            end;
            v56 = v57 == 0 and 0 or v56 / v57;
            v58 = v59 == 0 and 0 or v58 / v59;
            v60 = v61 == 0 and 0 or v60 / v61;
            v49._slopeMap[v53] = math.atan((math.sqrt((v56 * v56 + v58 * v58 + v60 * v60) / 4)));
        end;
    end;
end;
v10.generateOccupancyMap = function(v69) --[[ Line: 329 ]] --[[ Name: generateOccupancyMap ]]
    v69._occupancyMap = table.create(v69._sliceX);
    for v70 = 1, v69._sliceX do
        v69._occupancyMap[v70] = table.create(v69._sliceY);
        for v71 = 1, v69._sliceY do
            v69._occupancyMap[v70][v71] = table.clone(v69._occupancyCache[v70][v71]);
        end;
    end;
    for v72 = 1, v69._sliceX do
        local v73 = v69._occupancyMap[v72];
        for v74 = 1, v69._sliceZ do
            local v75 = v69:getIndex(v72, v74);
            local v76 = v69._heightMap[v75];
            local v77 = math.floor(v76);
            local v78 = math.ceil(v76) + 1;
            for v79 = 1, v77 do
                v73[v79][v74] = 1;
            end;
            if v76 - v77 > 0 then
                v73[math.min(v77 + 1, v69._sliceY)][v74] = v76 - v77;
            end;
            if v69._fillBottomPositions and v69._fillBottomPositions[v75] then
                for v80 = v78, v69._sliceY do
                    v73[v80][v74] = 0;
                end;
            end;
        end;
    end;
end;
v10.generateMaterialMap = function(v81) --[[ Line: 362 ]] --[[ Name: generateMaterialMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy)
    local v82 = v81._payload[l_Category_0.BuildSettings][l_BuildSettings_0.MaterialLUT];
    v81._materialMap = table.create(v81._sliceX);
    for v83 = 1, v81._sliceX do
        v81._materialMap[v83] = table.create(v81._sliceY);
        for v84 = 1, v81._sliceY do
            v81._materialMap[v83][v84] = table.clone(v81._materialCache[v83][v84]);
        end;
    end;
    for v85 = 1, v81._sliceX do
        local v86 = v81._materialMap[v85];
        for v87 = 1, v81._sliceZ do
            local v88 = v81:getIndex(v85, v87);
            local v89 = math.max(1, v81._minNeighborHeight[v88] - 1);
            local v90 = math.min(math.ceil(v81._heightMap[v88]), v81._sliceY);
            local l_v82_SlopeIndex_0 = v82:GetSlopeIndex(v81._slopeMap[v88]);
            if v81._fillBottomPositions and v81._fillBottomPositions[v88] and v82.fillMaterial then
                for v92 = 1, v90 do
                    v86[v92][v87] = v82.fillMaterial;
                end;
            else
                for v93 = 1, v89 - 1 do
                    v86[v93][v87] = v82.fallbackMaterial;
                end;
                for v94 = v89, v90 do
                    v86[v94][v87] = v82:GetValueByIndex(v94, v81._sliceY, l_v82_SlopeIndex_0);
                end;
            end;
        end;
    end;
end;
v10.fillInternalMaterial = function(v95) --[[ Line: 398 ]] --[[ Name: fillInternalMaterial ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy), l_VoxelResolution_0 (copy)
    local v96 = v95._payload[l_Category_0.BuildSettings][l_BuildSettings_0.MaterialLUT];
    for v97 = 1, v95._sliceX do
        local v98 = v95._materialMap[v97];
        for v99 = 1, v95._sliceZ do
            local v100 = v95:getIndex(v97, v99);
            local v101 = v95._minNeighborHeight[v100] - 2;
            if v101 >= 1 then
                local l_v96_SlopeIndex_0 = v96:GetSlopeIndex(v95._slopeMap[v100]);
                if not v95._fillBottomPositions or not v95._fillBottomPositions[v100] then
                    for v103 = 1, v101 do
                        v98[v103][v99] = v96:GetValueByIndex(v103, v95._sliceY, l_v96_SlopeIndex_0);
                    end;
                end;
            end;
        end;
    end;
    v95._services.Terrain:WriteVoxelChannels(v95._region, l_VoxelResolution_0, {
        SolidMaterial = v95._materialMap, 
        SolidOccupancy = v95._occupancyMap
    });
    if v95._waterMap then
        v95._services.Terrain:WriteVoxelChannels(v95._region, l_VoxelResolution_0, {
            LiquidOccupancy = v95._waterMap
        });
    end;
end;
v10.updateBlendingFactorMap = function(v104, v105) --[[ Line: 427 ]] --[[ Name: updateBlendingFactorMap ]]
    -- upvalues: v6 (copy)
    v104._blendingFactorMap = table.create(v104._mapSize, 0);
    if v105 > 0 then
        local v106 = {
            PreserveDistance = 1, 
            PreserveRatio = 0.2, 
            BlendingStrength = v105
        };
        v104._blendingFactorMap = v6(Vector2.new(v104._sliceX, v104._sliceZ), v106);
    end;
end;
v10.blendHeightMap = function(v107) --[[ Line: 439 ]] --[[ Name: blendHeightMap ]]
    v107._heightMap = table.clone(v107._heightMapFromNoise);
    if not v107._addBlending then
        return;
    else
        for v108 = 1, v107._mapSize do
            local v109 = v107._heightMapFromNoise[v108];
            local v110 = v107._heightmapCache[v108];
            local v111 = v107._blendingFactorMap[v108];
            v107._heightMap[v108] = (1 - v111) * v109 + v111 * v110;
        end;
        return;
    end;
end;
v10.blendMaterialMap = function(v112) --[[ Line: 452 ]] --[[ Name: blendMaterialMap ]]
    -- upvalues: l_Category_0 (copy), l_BuildSettings_0 (copy)
    if not v112._addBlending then
        return;
    else
        local v113 = v112._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Seed] * 3.141592653589793;
        local v114 = v112._payload[l_Category_0.BuildSettings][l_BuildSettings_0.AdvancedNoise].Children[l_BuildSettings_0.Offset];
        for v115 = 1, v112._sliceX do
            for v116 = 1, v112._sliceZ do
                local v117 = v112:getIndex(v115, v116);
                for v118 = math.max(1, v112._minNeighborHeight[v117] - 1), math.min(math.ceil(v112._heightMap[v117]), v112._sliceY) do
                    local v119 = v112._materialMap[v115][v118][v116];
                    local v120 = v112._materialCache[v115][v118][v116];
                    if v120 ~= Enum.Material.Air then
                        local v121, v122 = v112._getRotatedPoint(v115 - 0.5, v116 - 0.5);
                        local v123 = v121 - v114.X;
                        local v124 = v122 - v114.Y;
                        local v125 = math.abs((math.noise(v123 / v112._sliceX, v113, v124 / v112._sliceZ)));
                        v112._materialMap[v115][v118][v116] = if v125 > v112._blendingFactorMap[v117] then v119 else v120;
                    end;
                end;
            end;
        end;
        return;
    end;
end;
v10.postProcessing = function(_) --[[ Line: 480 ]] --[[ Name: postProcessing ]]

end;
v10.commit = function(v127) --[[ Line: 482 ]] --[[ Name: commit ]]
    v127:fillInternalMaterial();
    v127:clearRegionCache();
end;
v10.destroy = function(v128) --[[ Line: 487 ]] --[[ Name: destroy ]]
    v128:revertRegion(v128._region);
    v128:clearRegionCache();
end;
v10.generateHeightMapCacheTopDown = function(_) --[[ Line: 492 ]] --[[ Name: generateHeightMapCacheTopDown ]]

end;
v10.generateHeightMapCacheBottomUp = function(v130) --[[ Line: 497 ]] --[[ Name: generateHeightMapCacheBottomUp ]]
    v130:_getHeightMapCacheBottomUp();
end;
v10._getHeightMapCacheBottomUp = function(v131) --[[ Line: 503 ]] --[[ Name: _getHeightMapCacheBottomUp ]]
    v131._heightmapCache = table.create(v131._mapSize, 0);
    for v132 = 1, v131._sliceX do
        for v133 = 1, v131._sliceZ do
            local v134 = v131:getIndex(v132, v133);
            local v135 = v131._heightMapFromNoise[v134];
            for v136 = 1, math.min(v131._sliceY, (math.ceil(v135))) do
                if v131._occupancyCache[v132][v136][v133] ~= 0 and v131._materialCache[v132][v136][v133] ~= Enum.Material.Air then
                    local l__heightmapCache_0 = v131._heightmapCache;
                    l__heightmapCache_0[v134] = l__heightmapCache_0[v134] + v131._occupancyCache[v132][v136][v133];
                else
                    break;
                end;
            end;
        end;
    end;
end;
v10._getHeightMapCacheTopDown = function(v138) --[[ Line: 526 ]] --[[ Name: _getHeightMapCacheTopDown ]]
    v138._heightmapCache = table.create(v138._mapSize, 0);
    local v139 = table.create(v138._mapSize, 0);
    local v140 = 0;
    for v141 = 1, v138._sliceX do
        for v142 = 1, v138._sliceZ do
            local v143 = v138:getIndex(v141, v142);
            for v144 = v138._sliceY, 1, -1 do
                if v138._occupancyCache[v141][v144][v142] ~= 0 and v138._materialCache[v141][v144][v142] ~= Enum.Material.Air then
                    v138._heightmapCache[v143] = v144;
                    break;
                end;
            end;
            v139[v143] = v138._heightmapCache[v143];
            v140 = v140 + v139[v143];
        end;
    end;
    table.sort(v139);
    v138._medianHeightCache = v139[math.max(1, (math.floor(#v139 / 2)))];
    v138._meanHeightCache = v140 / v138._mapSize;
end;
v10.cacheRegion = function(v145, v146) --[[ Line: 554 ]] --[[ Name: cacheRegion ]]
    -- upvalues: l_VoxelResolution_0 (copy)
    local v147 = v145._services.Terrain:ReadVoxelChannels(v146, l_VoxelResolution_0, {
        "SolidMaterial", 
        "SolidOccupancy", 
        "LiquidOccupancy"
    });
    v145._materialCache = v147.SolidMaterial;
    v145._occupancyCache = v147.SolidOccupancy;
    v145._waterCache = v147.LiquidOccupancy;
end;
v10.revertRegion = function(v148, v149) --[[ Line: 565 ]] --[[ Name: revertRegion ]]
    -- upvalues: l_VoxelResolution_0 (copy)
    if v149 and v148._materialCache and v148._occupancyCache and v148._waterCache then
        v148._services.Terrain:WriteVoxelChannels(v149, l_VoxelResolution_0, {
            SolidMaterial = v148._materialCache, 
            SolidOccupancy = v148._occupancyCache, 
            LiquidOccupancy = v148._waterCache
        });
    end;
end;
v10.clearRegionCache = function(v150) --[[ Line: 575 ]] --[[ Name: clearRegionCache ]]
    local v151 = nil;
    local v152 = nil;
    v150._materialCache = v151;
    v150._occupancyCache = v152;
    v150._heightmapCache = nil;
end;
v10.debugDrawArray = function(v153, v154, v155, v156) --[[ Line: 580 ]] --[[ Name: debugDrawArray ]]
    -- upvalues: l_StarterGui_0 (copy)
    if not v155 then
        return;
    else
        local l_TG_DEBUG_DRAW_UI_0 = l_StarterGui_0:FindFirstChild("TG_DEBUG_DRAW_UI");
        local l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0 = l_TG_DEBUG_DRAW_UI_0:FindFirstChild(v154 .. "Frame");
        if not l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0 then
            l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0 = Instance.new("Frame");
            l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0.Name = v154 .. "Frame";
            l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0.Parent = l_TG_DEBUG_DRAW_UI_0;
            l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0.AutomaticSize = Enum.AutomaticSize.XY;
            local l_UIListLayout_0 = Instance.new("UIListLayout");
            l_UIListLayout_0.Parent = l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0;
            l_UIListLayout_0.FillDirection = Enum.FillDirection.Horizontal;
        end;
        if not l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0:FindFirstChild(v154 .. "Text") then
            local l_TextLabel_0 = Instance.new("TextLabel");
            l_TextLabel_0.Name = v154 .. "Text";
            l_TextLabel_0.Parent = l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0;
            l_TextLabel_0.Text = v154;
            l_TextLabel_0.Size = UDim2.new(0, 150, 0, 20);
        end;
        local v161 = v154 .. "Label";
        local l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0 = l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0:FindFirstChild(v161);
        if not l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0 then
            l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0 = Instance.new("ImageLabel");
            l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.Name = v161;
            l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.Position = UDim2.new(0, 0, 0, 0);
            l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.BackgroundTransparency = 1;
            l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.Parent = l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0;
        end;
        local l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0 = l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0:FindFirstChild(v154);
        if not l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0 then
            l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0 = Instance.new("EditableImage");
            l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Name = v154;
        end;
        l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0:Resize(Vector2.new(v153._sliceX, v153._sliceZ));
        l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.Size = UDim2.new(0, v153._sliceX, 0, v153._sliceZ);
        local v164 = table.create(v153._mapSize * 4, 1);
        for v165 = 1, l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Size.X do
            for v166 = 1, l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Size.Y do
                local v167 = v153:getIndex(v165, v166);
                local v168 = 1 + ((v166 - 1) * l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Size.X + v165 - 1) * 4;
                local v169 = 0;
                v169 = if typeof(v155[v167]) == "boolean" then v155[v167] and 1 or 0 else v155[v167] / v156;
                if v169 > 1 then
                    v164[v168] = v169 - 1;
                    v164[v168 + 1] = 0;
                    v164[v168 + 2] = 0;
                elseif v169 < 0 then
                    v164[v168] = 0;
                    v164[v168 + 1] = 0;
                    v164[v168 + 2] = -v169;
                else
                    v164[v168] = v169;
                    v164[v168 + 1] = v169;
                    v164[v168 + 2] = v169;
                end;
            end;
        end;
        l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0:WritePixels(Vector2.zero, l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Size, v164);
        l_l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0_FirstChild_0.Parent = l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0;
        l_l_l_TG_DEBUG_DRAW_UI_0_FirstChild_0_FirstChild_0.Size = UDim2.new(0, 200, 0, 200);
        return;
    end;
end;
v10.debugDraw = function(v170) --[[ Line: 662 ]] --[[ Name: debugDraw ]]
    -- upvalues: l_StarterGui_0 (copy)
    if not l_StarterGui_0:FindFirstChild("TG_DEBUG_DRAW_UI") then
        local l_ScreenGui_0 = Instance.new("ScreenGui");
        l_ScreenGui_0.Name = "TG_DEBUG_DRAW_UI";
        l_ScreenGui_0.Parent = l_StarterGui_0;
        local l_UIListLayout_1 = Instance.new("UIListLayout");
        l_UIListLayout_1.HorizontalAlignment = Enum.HorizontalAlignment.Left;
        l_UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Bottom;
        l_UIListLayout_1.FillDirection = Enum.FillDirection.Horizontal;
        l_UIListLayout_1.Parent = l_ScreenGui_0;
    end;
    v170:debugDrawArray("Noisemap", v170._noiseMap, 1, 0);
    v170:debugDrawArray("Heightmap", v170._heightMap, v170._sliceY);
    v170:debugDrawArray("NeighborHeightMap", v170._minNeighborHeight, v170._sliceY);
    v170:debugDrawArray("SlopeMap", v170._slopeMap, 1.5707963267948966);
    v170:debugDrawArray("Blending", v170._blendingFactorMap, 1);
    v170:debugDrawArray("HeightMapCache", v170._heightmapCache, v170._sliceY);
    v170:debugDrawArray("FillBottom", v170._fillBottomPositions, 1);
    v170:debugDrawArray("LakeArea", v170._lakeAreaPositions, 4);
end;
return v10;