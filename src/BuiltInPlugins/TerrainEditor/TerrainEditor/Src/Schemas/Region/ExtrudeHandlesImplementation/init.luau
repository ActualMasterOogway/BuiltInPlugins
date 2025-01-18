local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Util.getBinarySearchedSize);
local v2 = require(l_script_FirstAncestor_0.Src.Util.getVoxelAlignedRegion);
local v3 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorUpdateShortcuts);
local v6 = {};
v6.__index = v6;
v6.new = function(v7, v8) --[[ Line: 19 ]] --[[ Name: new ]]
    -- upvalues: v6 (copy)
    return (setmetatable({
        _draggerContext = v7, 
        _max = if v8 then v8.Max else nil, 
        _volume = if v8 and v8.Max and v8.UseVolume then v8.Max.X * v8.Max.Y * v8.Max.Z else nil
    }, v6));
end;
v6.getBoundingBox = function(_, _, v11) --[[ Line: 32 ]] --[[ Name: getBoundingBox ]]
    return v11:getBoundingBox();
end;
v6.shouldScaleFromCenter = function(v12, _, _, _) --[[ Line: 36 ]] --[[ Name: shouldScaleFromCenter ]]
    return v12._draggerContext:isCtrlKeyDown();
end;
v6.axesToScale = function(v16, _, v18) --[[ Line: 40 ]] --[[ Name: axesToScale ]]
    -- upvalues: v5 (copy)
    if v5() and v16._draggerContext:isAltKeyDown() or not v5() and v16._draggerContext:isShiftKeyDown() then
        return {
            X = true, 
            Y = true, 
            Z = true
        };
    else
        return ({
            {
                X = true
            }, 
            {
                Y = true
            }, 
            {
                Z = true
            }
        })[v18];
    end;
end;
v6.getMinMaxSizes = function(v19, v20, v21, v22) --[[ Line: 52 ]] --[[ Name: getMinMaxSizes ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v23 = Vector3.one * 4;
    local v24 = v19._max or Vector3.one * 4096 * 4;
    if v19._volume then
        if not v20 or not v21 or not v22 then
            return v23, v19._calculatedMax;
        elseif v21.X and v21.Y and v21.Z then
            v24 = v1(v22, v19._volume);
        elseif v21.X then
            local l_Y_0 = v22.Y;
            local l_Z_0 = v22.Z;
            v24 = Vector3.new(v19._volume / (l_Y_0 * l_Z_0), l_Y_0, l_Z_0);
        elseif v21.Y then
            local l_X_0 = v22.X;
            local l_Z_1 = v22.Z;
            v24 = Vector3.new(l_X_0, v19._volume / (l_X_0 * l_Z_1), l_Z_1);
        elseif v21.Z then
            local l_X_1 = v22.X;
            local l_Y_1 = v22.Y;
            v24 = Vector3.new(l_X_1, l_Y_1, v19._volume / (l_X_1 * l_Y_1));
        end;
    end;
    v24 = v24:Min(Vector3.one * v3.MaxRegion);
    v19._calculatedMin = v23;
    v19._calculatedMax = v24;
    return v23, v24;
end;
v6.beginScale = function(v31, v32, v33, _) --[[ Line: 95 ]] --[[ Name: beginScale ]]
    local v35, _, v37 = v31:getBoundingBox(v32, v33);
    v31._originalBoundingBoxCFrame = v35;
    v31._originalBoundingBoxSize = v37;
end;
v6.updateScale = function(v38, v39, v40) --[[ Line: 102 ]] --[[ Name: updateScale ]]
    -- upvalues: v2 (copy), v3 (copy)
    local v41 = v38._originalBoundingBoxCFrame + v38._originalBoundingBoxCFrame.Rotation * v40;
    local v42 = v38._originalBoundingBoxSize + v39;
    local v43, v44 = v38:getMinMaxSizes();
    if v38._draggerContext.SnapToVoxels then
        local v45, v46 = v2(v41, v42, v3.VoxelResolution);
        v41 = v45;
        v42 = v46;
    end;
    if v42.X <= v44.X and v42.Y <= v44.Y and v42.Z <= v44.Z and v42.X >= v43.X and v42.Y >= v43.Y and v42.Z >= v43.Z then
        v38._draggerContext.updateRegion(v41, v42);
        return v39, v40;
    elseif v39.X < 0 or v39.Y < 0 or v39.Z < 0 then
        return v39, Vector3.zero;
    else
        return Vector3.zero, Vector3.zero;
    end;
end;
v6.getPriority = function(_) --[[ Line: 130 ]] --[[ Name: getPriority ]]
    return 1;
end;
v6.endScale = function(_) --[[ Line: 134 ]] --[[ Name: endScale ]]

end;
v6.render = function(_, _, _) --[[ Line: 136 ]] --[[ Name: render ]]

end;
return v6;