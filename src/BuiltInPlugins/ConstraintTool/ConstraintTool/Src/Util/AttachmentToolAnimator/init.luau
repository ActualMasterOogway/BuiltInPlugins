local l_script_FirstAncestor_0 = script:FindFirstAncestor("ConstraintTool");
local l_SimPreserveOrientationOnFace_0 = game:GetFastFlag("SimPreserveOrientationOnFace");
local l_DraggerFramework_0 = l_script_FirstAncestor_0.Packages.DraggerFramework;
local v3 = require(l_DraggerFramework_0.Utility.AnimationTask);
local v4 = {};
v4.__index = v4;
v4.new = function(v5) --[[ Line: 14 ]] --[[ Name: new ]]
    -- upvalues: v4 (copy), v3 (copy)
    local v6 = setmetatable({
        _constraintToolModel = v5
    }, v4);
    v6._animationTask = v3.new(function(v7, v8) --[[ Line: 19 ]]
        -- upvalues: v6 (copy)
        v6:_animationCallback(v7, v8);
    end);
    return v6;
end;
local function _(v9) --[[ Line: 25 ]] --[[ Name: smoothstep ]]
    v9 = math.clamp(v9, 0, 1);
    return v9 ^ 3 * (v9 * (6 * v9 - 15) + 10);
end;
v4._animationCallback = function(v11, v12, v13) --[[ Line: 30 ]] --[[ Name: _animationCallback ]]
    -- upvalues: l_SimPreserveOrientationOnFace_0 (copy)
    local l__lastDragTarget_0 = v11._constraintToolModel._lastDragTarget;
    if v13 then
        v11._constraintToolModel._attachmentMover:moveTo(l__lastDragTarget_0.mainCFrame, l__lastDragTarget_0.targetPart);
        return;
    else
        local v15 = math.clamp(v12, 0, 1);
        local v16 = v15 ^ 3 * (v15 * (6 * v15 - 15) + 10);
        v15 = v11._animateFrom;
        local v17 = v15.tiltRotate:Lerp(v11._constraintToolModel._tiltRotate, v16);
        local v18 = nil;
        if l_SimPreserveOrientationOnFace_0 then
            v18 = v17 * l__lastDragTarget_0.offsetCFrame;
            if v11._overrideBaseRotation then
                v18 = v11._overrideBaseRotation * v18;
            end;
        else
            local v19 = v15.baseCFrame:Lerp(l__lastDragTarget_0.baseCFrame, v16);
            local v20 = v15.offsetCFrame:Lerp(l__lastDragTarget_0.offsetCFrame, v16);
            v18 = v19 * v17 * v20;
        end;
        v11._constraintToolModel:_orientAttachmentAdornment(v11._constraintToolModel._attachmentAdornment, v18);
        return;
    end;
end;
v4.beginAnimation = function(v21, v22) --[[ Line: 56 ]] --[[ Name: beginAnimation ]]
    local l__lastDragTarget_1 = v21._constraintToolModel._lastDragTarget;
    v21._animateFrom = table.freeze({
        tiltRotate = v21._constraintToolModel._tiltRotate, 
        baseCFrame = l__lastDragTarget_1.baseCFrame, 
        offsetCFrame = l__lastDragTarget_1.offsetCFrame
    });
    v21._constraintToolModel._tiltRotate = v22;
    v21._animationTask:animate(0.13);
end;
v4.inProgress = function(v24) --[[ Line: 67 ]] --[[ Name: inProgress ]]
    return v24._animationTask:inProgress();
end;
v4.forceFinish = function(v25) --[[ Line: 71 ]] --[[ Name: forceFinish ]]
    v25._animationTask:commit();
end;
return v4;