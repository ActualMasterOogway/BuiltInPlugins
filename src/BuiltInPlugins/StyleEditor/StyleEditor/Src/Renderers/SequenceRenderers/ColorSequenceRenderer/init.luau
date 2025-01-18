local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useRef_0 = v1.useRef;
local l_useEffect_0 = v1.useEffect;
local l_useMemo_0 = v1.useMemo;
local v6 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v6.UI.Pane;
local l_TextInput_0 = v6.UI.TextInput;
local l_Tooltip_0 = v6.UI.Tooltip;
local v10 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v10.join;
local l_map_0 = v10.map;
local v13 = require(l_Parent_0.Src.Util.bind);
local v14 = require(l_Parent_0.Src.Util.colorFromString);
local v15 = require(l_Parent_0.Src.Renderers.SequenceRenderers.Keypoint);
local v16 = require(l_Parent_0.Src.Renderers.Modal);
local v17 = require(l_Parent_0.Src.Renderers.SequenceRenderers.mouseCoordsRelativeToElement);
local v18 = require(l_Parent_0.Src.Renderers.SequenceRenderers.PreviewButton);
local v19 = require(l_Parent_0.Src.Renderers.SequenceRenderers.useKeypointSequence);
local v20 = require(script.KeypointControls);
local v21 = require(script.KeypointLine);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local function _(v25) --[[ Line: 48 ]] --[[ Name: sequenceToCellText ]]
    local l_Keypoints_0 = v25.Keypoints;
    if #l_Keypoints_0 > 2 then
        return "<ColorSequence>";
    elseif l_Keypoints_0[1].Value ~= l_Keypoints_0[2].Value then
        return "<ColorSequence>";
    else
        return "#" .. l_Keypoints_0[1].Value:ToHex();
    end;
end;
local function _(v28) --[[ Line: 62 ]] --[[ Name: validateText ]]
    -- upvalues: v14 (copy)
    local v29 = v14(v28);
    if v29 then
        return ColorSequence.new(v29), nil;
    else
        return nil, "Error: invalid color";
    end;
end;
local function _(v31) --[[ Line: 72 ]] --[[ Name: mapInitialSequence ]]
    -- upvalues: l_map_0 (copy)
    return (l_map_0(v31.Keypoints, function(v32) --[[ Line: 73 ]]
        return {
            Time = v32.Time, 
            Value = v32.Value
        };
    end));
end;
local function v36(v34) --[[ Line: 78 ]] --[[ Name: keypointsToSequence ]]
    -- upvalues: l_map_0 (copy)
    return ColorSequence.new(l_map_0(v34, function(v35) --[[ Line: 79 ]]
        return ColorSequenceKeypoint.new(v35.Time, v35.Value);
    end));
end;
return function(v37) --[[ Line: 86 ]] --[[ Name: ColorSequenceRenderer ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), v19 (copy), l_map_0 (copy), l_useMemo_0 (copy), v36 (copy), l_useEffect_0 (copy), v14 (copy), v17 (copy), l_join_0 (copy), v1 (copy), v21 (copy), v13 (copy), v15 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), v18 (copy), l_Tooltip_0 (copy), v16 (copy), v20 (copy)
    local v38 = l_useRef_0(nil);
    local v39 = l_useRef_0(nil);
    local v40, v41 = l_useState_0(false);
    local l_l_useState_0_0 = l_useState_0;
    local l_Keypoints_1 = v37.Value.Keypoints;
    local v44;
    l_l_useState_0_0, v44 = l_l_useState_0_0(#l_Keypoints_1 > 2 and "<ColorSequence>" or l_Keypoints_1[1].Value ~= l_Keypoints_1[2].Value and "<ColorSequence>" or "#" .. l_Keypoints_1[1].Value:ToHex());
    local v45;
    v45, l_Keypoints_1 = l_useState_0(nil);
    local l_v19_0 = v19;
    local l_Value_0 = v37.Value;
    l_v19_0 = l_v19_0((l_map_0(l_Value_0.Keypoints, function(v48) --[[ Line: 73 ]]
        return {
            Time = v48.Time, 
            Value = v48.Value
        };
    end)));
    local v49 = l_useMemo_0(function() --[[ Line: 95 ]]
        -- upvalues: v36 (ref), l_v19_0 (copy)
        return v36(l_v19_0.keypoints);
    end, {
        l_v19_0.keypoints
    });
    l_useEffect_0(function() --[[ Line: 99 ]]
        -- upvalues: l_Keypoints_1 (copy), v44 (copy), v37 (copy)
        l_Keypoints_1(nil);
        local l_v44_0 = v44;
        local l_Keypoints_2 = v37.Value.Keypoints;
        l_v44_0(#l_Keypoints_2 > 2 and "<ColorSequence>" or l_Keypoints_2[1].Value ~= l_Keypoints_2[2].Value and "<ColorSequence>" or "#" .. l_Keypoints_2[1].Value:ToHex());
    end, {
        v37.Value, 
        l_Keypoints_1, 
        v44
    });
    l_Value_0 = function() --[[ Line: 104 ]] --[[ Name: saveSequence ]]
        -- upvalues: l_v19_0 (copy), l_map_0 (ref), v37 (copy)
        l_v19_0.save(function(v52) --[[ Line: 105 ]]
            -- upvalues: l_map_0 (ref), v37 (ref)
            local v54 = ColorSequence.new(l_map_0(v52, function(v53) --[[ Line: 79 ]]
                return ColorSequenceKeypoint.new(v53.Time, v53.Value);
            end));
            if v54 ~= v37.Value then
                v37.OnChanged(v54);
            end;
        end);
    end;
    local function v58() --[[ Line: 114 ]] --[[ Name: onOpen ]]
        -- upvalues: l_v19_0 (copy), v37 (copy), l_map_0 (ref), v41 (copy)
        local l_reset_0 = l_v19_0.reset;
        local l_Value_1 = v37.Value;
        l_reset_0((l_map_0(l_Value_1.Keypoints, function(v57) --[[ Line: 73 ]]
            return {
                Time = v57.Time, 
                Value = v57.Value
            };
        end)));
        v41(true);
    end;
    local function v62() --[[ Line: 119 ]] --[[ Name: onClose ]]
        -- upvalues: l_v19_0 (copy), l_map_0 (ref), v37 (copy), v41 (copy)
        l_v19_0.save(function(v59) --[[ Line: 105 ]]
            -- upvalues: l_map_0 (ref), v37 (ref)
            local v61 = ColorSequence.new(l_map_0(v59, function(v60) --[[ Line: 79 ]]
                return ColorSequenceKeypoint.new(v60.Time, v60.Value);
            end));
            if v61 ~= v37.Value then
                v37.OnChanged(v61);
            end;
        end);
        v41(false);
    end;
    local function v66() --[[ Line: 124 ]] --[[ Name: onDeleteSelectedKeypoint ]]
        -- upvalues: l_v19_0 (copy), l_map_0 (ref), v37 (copy)
        l_v19_0.remove();
        l_v19_0.save(function(v63) --[[ Line: 105 ]]
            -- upvalues: l_map_0 (ref), v37 (ref)
            local v65 = ColorSequence.new(l_map_0(v63, function(v64) --[[ Line: 79 ]]
                return ColorSequenceKeypoint.new(v64.Time, v64.Value);
            end));
            if v65 ~= v37.Value then
                v37.OnChanged(v65);
            end;
        end);
    end;
    local function v71(v67) --[[ Line: 129 ]] --[[ Name: onEditSelectedKeypoint ]]
        -- upvalues: l_v19_0 (copy), l_map_0 (ref), v37 (copy)
        l_v19_0.update(v67);
        l_v19_0.save(function(v68) --[[ Line: 105 ]]
            -- upvalues: l_map_0 (ref), v37 (ref)
            local v70 = ColorSequence.new(l_map_0(v68, function(v69) --[[ Line: 79 ]]
                return ColorSequenceKeypoint.new(v69.Time, v69.Value);
            end));
            if v70 ~= v37.Value then
                v37.OnChanged(v70);
            end;
        end);
    end;
    local function v79(v72, _) --[[ Line: 134 ]] --[[ Name: onTextInputFocusLost ]]
        -- upvalues: v14 (ref), v37 (copy), v44 (copy)
        if v72 == "<ColorSequence>" then
            return;
        else
            local v74 = v14(v72);
            local v75;
            if v74 then
                v75 = ColorSequence.new(v74);
                local _ = nil;
            else
                v75 = nil;
                local _ = "Error: invalid color";
            end;
            if v75 and v75 ~= v37.Value then
                v37.OnChanged(v75);
                return;
            else
                v74 = v44;
                local l_Keypoints_3 = v37.Value.Keypoints;
                v74(#l_Keypoints_3 > 2 and "<ColorSequence>" or l_Keypoints_3[1].Value ~= l_Keypoints_3[2].Value and "<ColorSequence>" or "#" .. l_Keypoints_3[1].Value:ToHex());
                return;
            end;
        end;
    end;
    local function v85(v80) --[[ Line: 148 ]] --[[ Name: onTextInputChanged ]]
        -- upvalues: v44 (copy), l_Keypoints_1 (copy), v14 (ref)
        v44(v80);
        if v80 == "<ColorSequence>" then
            l_Keypoints_1(nil);
            return;
        else
            local v81 = v14(v80);
            local v82;
            if v81 then
                local _ = ColorSequence.new(v81);
                v82 = nil;
            else
                local _ = nil;
                v82 = "Error: invalid color";
            end;
            l_Keypoints_1(v82);
            return;
        end;
    end;
    local function v93(v86) --[[ Line: 160 ]] --[[ Name: onKeypointMove ]]
        -- upvalues: v39 (copy), l_v19_0 (copy), v17 (ref), l_join_0 (ref), l_map_0 (ref), v37 (copy)
        if not v39.current then
            return;
        elseif l_v19_0.isFixedKeypointSelected() then
            return;
        else
            local v87 = l_v19_0.getSelectedKeypoint();
            local v88 = v17(v39.current, v86);
            local v89 = l_join_0(v87, {
                Time = v88.X
            });
            l_v19_0.update(v89);
            l_v19_0.save(function(v90) --[[ Line: 105 ]]
                -- upvalues: l_map_0 (ref), v37 (ref)
                local v92 = ColorSequence.new(l_map_0(v90, function(v91) --[[ Line: 79 ]]
                    return ColorSequenceKeypoint.new(v91.Time, v91.Value);
                end));
                if v92 ~= v37.Value then
                    v37.OnChanged(v92);
                end;
            end);
            return;
        end;
    end;
    local function v101(_, v95) --[[ Line: 180 ]] --[[ Name: onTimelineClick ]]
        -- upvalues: v17 (ref), v39 (copy), l_v19_0 (copy), l_map_0 (ref), v37 (copy)
        if v95.UserInputType == Enum.UserInputType.MouseButton1 then
            local v96 = Vector2.new(v95.Position.X, v95.Position.Y);
            local v97 = {
                Time = v17(v39.current, v96).X, 
                Value = l_v19_0.getSelectedKeypoint().Value
            };
            l_v19_0.add(v97);
            l_v19_0.save(function(v98) --[[ Line: 105 ]]
                -- upvalues: l_map_0 (ref), v37 (ref)
                local v100 = ColorSequence.new(l_map_0(v98, function(v99) --[[ Line: 79 ]]
                    return ColorSequenceKeypoint.new(v99.Time, v99.Value);
                end));
                if v100 ~= v37.Value then
                    v37.OnChanged(v100);
                end;
            end);
        end;
    end;
    local function v103(v102) --[[ Line: 194 ]] --[[ Name: onKeypointHover ]]
        -- upvalues: l_v19_0 (copy)
        l_v19_0.select(v102);
    end;
    local v104 = {};
    local v105 = {};
    for v106, v107 in l_v19_0.keypoints do
        local v108 = "Keypoint_" .. tostring(v106);
        local v109 = l_v19_0.selectedIndex == v106;
        v105[v108] = v1.createElement(v21, {
            Position = UDim2.fromScale(v107.Time, 0), 
            Selected = v109, 
            OnHoverStart = v13(v103, {
                v106
            })
        });
        v104[v108] = v1.createElement(v15, {
            Position = Vector2.new(v107.Time, 0), 
            Value = v107.Value, 
            Selected = v109, 
            Tag = "ColorSequenceKeypoint", 
            OnMoved = v93, 
            OnHoverStart = v13(v103, {
                v106
            }), 
            OnDragEnd = function() --[[ Line: 218 ]] --[[ Name: OnDragEnd ]]
                -- upvalues: l_v19_0 (copy), l_map_0 (ref), v37 (copy)
                l_v19_0.save(function(v110) --[[ Line: 105 ]]
                    -- upvalues: l_map_0 (ref), v37 (ref)
                    local v112 = ColorSequence.new(l_map_0(v110, function(v111) --[[ Line: 79 ]]
                        return ColorSequenceKeypoint.new(v111.Time, v111.Value);
                    end));
                    if v112 ~= v37.Value then
                        v37.OnChanged(v112);
                    end;
                end);
            end
        });
    end;
    local v113 = v45 ~= nil;
    return v1.createElement(l_Pane_0, {
        [v1.Tag] = "X-Fill"
    }, {
        Input = v1.createElement(l_TextInput_0, {
            Disabled = v37.Disabled, 
            LeadingComponent = v18, 
            LeadingComponentProps = {
                Color = v37.Value, 
                OnClick = v58, 
                ForwardRef = v38
            }, 
            OnFocusLost = v79, 
            OnTextChanged = v85, 
            Size = if v37.AutomaticSize then UDim2.new(1, 0, 0, v37.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
            Text = l_l_useState_0_0, 
            [v1.Tag] = v113 and "PropertyCellError" or nil
        }), 
        Tooltip = v1.createElement(l_Tooltip_0, {
            Enabled = v113, 
            Text = v45 or ""
        }), 
        SequencePickerModal = v1.createElement(v16, {
            Open = v40, 
            MaxSize = Vector2.new(800, 225), 
            MinSize = Vector2.new(400, 200), 
            ObjectRef = v38, 
            OnFocusLost = v62
        }, {
            SequenceTimelinePane = v1.createElement(l_Pane_0, {
                LayoutOrder = 1, 
                Size = UDim2.new(1, 0, 0, 150), 
                [v1.Tag] = "X-Pad X-Column", 
                OnClick = v101
            }, {
                SequenceTimelineContainer = v1.createElement(l_Pane_0, {
                    LayoutOrder = 1, 
                    BackgroundTransparency = 0, 
                    BackgroundColor3 = Color3.new(1, 1, 1), 
                    ForwardRef = v39, 
                    [v1.Tag] = "X-Fill"
                }, {
                    l_join_0(v105, {
                        UIGradient = v1.createElement("UIGradient", {
                            Color = v49
                        })
                    })
                }), 
                KeypointContainer = v1.createElement(l_Pane_0, {
                    LayoutOrder = 2, 
                    [v1.Tag] = "X-FitY"
                }, v104)
            }), 
            KeypointControls = v1.createElement(v20, {
                LayoutOrder = 2, 
                Keypoint = l_v19_0.getSelectedKeypoint(), 
                IsKeypointFixed = l_v19_0.isFixedKeypointSelected(), 
                OnSave = v62, 
                OnDelete = v66, 
                OnEdit = v71
            })
        })
    });
end;