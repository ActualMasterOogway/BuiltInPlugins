local v0 = require(script.Parent.Parent.Parent.utils.getSceneIndicesForInterpolationInputRange);
local v1 = require(script.Parent.Parent.Parent.utils.lerp);
local function v5(v2) --[[ Line: 31 ]] --[[ Name: forInitial ]]
    local v3 = v2.initialPositionValue ~= v2.scene.index;
    local v4 = v3 and 1000000 or 0;
    return {
        forceHidden = v3, 
        initialPosition = UDim2.new(0, v4, 0, v4), 
        positionStep = nil
    };
end;
return {
    forHorizontal = function(v6) --[[ Line: 46 ]] --[[ Name: forHorizontal ]]
        -- upvalues: v5 (copy), v0 (copy), v1 (copy)
        local l_initialPositionValue_0 = v6.initialPositionValue;
        local l_layout_0 = v6.layout;
        local l_scene_0 = v6.scene;
        if not l_layout_0.isMeasured then
            return (v5(v6));
        else
            local v10 = v0(v6);
            if not v10 then
                return {
                    forceHidden = true, 
                    initialPosition = UDim2.new(0, 100000, 0, 100000), 
                    positionStep = nil
                };
            else
                local l_first_0 = v10.first;
                local l_last_0 = v10.last;
                local l_index_0 = l_scene_0.index;
                local l_initWidth_0 = l_layout_0.initWidth;
                local function _(v15) --[[ Line: 73 ]] --[[ Name: calculate ]]
                    -- upvalues: l_first_0 (copy), l_initWidth_0 (copy), l_index_0 (copy), v1 (ref), l_last_0 (copy)
                    if v15 < l_first_0 then
                        return l_initWidth_0;
                    elseif v15 < l_index_0 then
                        return v1(l_initWidth_0, 0, (v15 - l_first_0) / (l_index_0 - l_first_0));
                    elseif v15 == l_index_0 then
                        return 0;
                    elseif v15 < l_last_0 then
                        return v1(0, -l_initWidth_0, (v15 - l_index_0) / (l_last_0 - l_index_0));
                    else
                        return -l_initWidth_0;
                    end;
                end;
                local function v21(v17, v18) --[[ Line: 88 ]] --[[ Name: stepper ]]
                    -- upvalues: l_first_0 (copy), l_initWidth_0 (copy), l_index_0 (copy), v1 (ref), l_last_0 (copy)
                    local l_current_0 = v17.current;
                    if not l_current_0 then
                        return;
                    else
                        local l_Position_0 = l_current_0.Position;
                        l_current_0.Position = UDim2.new(l_Position_0.X.Scale, if v18 < l_first_0 then l_initWidth_0 else if v18 < l_index_0 then v1(l_initWidth_0, 0, (v18 - l_first_0) / (l_index_0 - l_first_0)) else v18 == l_index_0 and 0 or if v18 < l_last_0 then v1(0, -l_initWidth_0, (v18 - l_index_0) / (l_last_0 - l_index_0)) else -l_initWidth_0, l_Position_0.Y.Scale, l_Position_0.Y.Offset);
                        return;
                    end;
                end;
                return {
                    initialPosition = UDim2.new(0, if l_initialPositionValue_0 < l_first_0 then l_initWidth_0 else if l_initialPositionValue_0 < l_index_0 then v1(l_initWidth_0, 0, (l_initialPositionValue_0 - l_first_0) / (l_index_0 - l_first_0)) else l_initialPositionValue_0 == l_index_0 and 0 or if l_initialPositionValue_0 < l_last_0 then v1(0, -l_initWidth_0, (l_initialPositionValue_0 - l_index_0) / (l_last_0 - l_index_0)) else -l_initWidth_0, 0, 0), 
                    positionStep = v21
                };
            end;
        end;
    end, 
    forVertical = function(v22) --[[ Line: 112 ]] --[[ Name: forVertical ]]
        -- upvalues: v5 (copy), v0 (copy), v1 (copy)
        local l_initialPositionValue_1 = v22.initialPositionValue;
        local l_layout_1 = v22.layout;
        local l_scene_1 = v22.scene;
        if not l_layout_1.isMeasured then
            return (v5(v22));
        else
            local v26 = v0(v22);
            if not v26 then
                return {
                    forceHidden = true, 
                    initialPosition = UDim2.new(0, 100000, 0, 100000), 
                    positionStep = nil
                };
            else
                local l_first_1 = v26.first;
                local l_index_1 = l_scene_1.index;
                local l_initHeight_0 = l_layout_1.initHeight;
                local function v31(v30) --[[ Line: 135 ]] --[[ Name: calculate ]]
                    -- upvalues: l_first_1 (copy), l_initHeight_0 (copy), l_index_1 (copy), v1 (ref)
                    if v30 < l_first_1 then
                        return l_initHeight_0;
                    elseif v30 < l_index_1 then
                        return v1(l_initHeight_0, 0, (v30 - l_first_1) / (l_index_1 - l_first_1));
                    else
                        return 0;
                    end;
                end;
                return {
                    initialPosition = UDim2.new(0, 0, 0, v31(l_initialPositionValue_1)), 
                    positionStep = function(v32, v33) --[[ Line: 146 ]] --[[ Name: stepper ]]
                        -- upvalues: v31 (copy)
                        local l_current_1 = v32.current;
                        if not l_current_1 then
                            return;
                        else
                            local l_Position_1 = l_current_1.Position;
                            l_current_1.Position = UDim2.new(l_Position_1.X.Scale, l_Position_1.X.Offset, l_Position_1.Y.Scale, v31(v33));
                            return;
                        end;
                    end
                };
            end;
        end;
    end, 
    forFade = function(v36) --[[ Line: 171 ]] --[[ Name: forFade ]]
        -- upvalues: v5 (copy), v0 (copy)
        local l_initialPositionValue_2 = v36.initialPositionValue;
        local l_layout_2 = v36.layout;
        local l_scene_2 = v36.scene;
        if not l_layout_2.isMeasured then
            return (v5(v36));
        elseif not v0(v36) then
            return {
                forceHidden = true, 
                initialPosition = UDim2.new(0, 100000, 0, 100000), 
                positionStep = nil
            };
        else
            local l_index_2 = l_scene_2.index;
            local function _(v41) --[[ Line: 192 ]] --[[ Name: calculate ]]
                -- upvalues: l_index_2 (copy)
                return l_index_2 - 0.5 <= v41;
            end;
            return {
                forceHidden = not (l_index_2 - 0.5 <= l_initialPositionValue_2), 
                initialPosition = UDim2.new(0, 0, 0, 0), 
                positionStep = function(v43, v44) --[[ Line: 196 ]] --[[ Name: stepper ]]
                    -- upvalues: l_index_2 (copy)
                    local l_current_2 = v43.current;
                    if not l_current_2 then
                        return;
                    else
                        l_current_2.Visible = l_index_2 - 0.5 <= v44;
                        return;
                    end;
                end
            };
        end;
    end
};