local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useRef_0 = v1.useRef;
local l_useEffect_0 = v1.useEffect;
local v5 = require(l_Parent_0.Packages.Framework);
local l_Pane_0 = v5.UI.Pane;
local l_TextInput_0 = v5.UI.TextInput;
local l_Tooltip_0 = v5.UI.Tooltip;
local v9 = require(l_Parent_0.Packages.Dash);
local l_join_0 = v9.join;
local l_map_0 = v9.map;
local v12 = require(l_Parent_0.Src.Renderers.SequenceRenderers.PreviewButton);
local v13 = require(script.SequenceLine);
local v14 = require(script.KeypointControls);
local v15 = require(l_Parent_0.Src.Util.bind);
local v16 = require(l_Parent_0.Src.Renderers.SequenceRenderers.mouseCoordsRelativeToElement);
local v17 = require(l_Parent_0.Src.Renderers.SequenceRenderers.useKeypointSequence);
local v18 = require(l_Parent_0.Src.Renderers.SequenceRenderers.Keypoint);
local v19 = require(l_Parent_0.Src.Renderers.Modal);
local v20 = require(l_Parent_0.Src.Util.roundDecimal);
local _ = require(l_Parent_0.Src.Types);
local _ = require(l_Parent_0.Src.Renderers.RendererTypes);
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
local v24 = ColorSequence.new(Color3.fromRGB(255, 255, 255));
local function _(v25) --[[ Line: 52 ]] --[[ Name: sequenceToCellText ]]
    -- upvalues: v20 (copy)
    local l_Keypoints_0 = v25.Keypoints;
    if #l_Keypoints_0 > 2 then
        return "<NumberSequence>";
    elseif l_Keypoints_0[1].Value ~= l_Keypoints_0[2].Value then
        return "<NumberSequence>";
    else
        return (tostring(v20(l_Keypoints_0[1].Value, 3)));
    end;
end;
local function _(v28) --[[ Line: 66 ]] --[[ Name: keypointsToSequence ]]
    -- upvalues: l_map_0 (copy)
    return NumberSequence.new(l_map_0(v28, function(v29) --[[ Line: 67 ]]
        return NumberSequenceKeypoint.new(v29.Time, v29.Value, v29.Envelope);
    end));
end;
local function _(v31) --[[ Line: 72 ]] --[[ Name: mapInitialSequence ]]
    -- upvalues: l_map_0 (copy)
    return (l_map_0(v31.Keypoints, function(v32) --[[ Line: 73 ]]
        return {
            Time = v32.Time, 
            Value = v32.Value, 
            Envelope = v32.Envelope
        };
    end));
end;
local function v38(v34) --[[ Line: 78 ]] --[[ Name: validateText ]]
    local v35 = tonumber(v34);
    if not v35 then
        return nil, "Error: invalid number";
    else
        assert(typeof(v35) == "number", "expecting a number");
        if v35 < 0 or v35 > 1 then
            return nil, "Error: number out of range, expecting 0 < num < 1";
        else
            local l_status_0, l_result_0 = pcall(function() --[[ Line: 91 ]]
                -- upvalues: v35 (copy)
                return NumberSequence.new(v35);
            end);
            if not l_status_0 then
                return nil, "Error: something went wrong";
            else
                return l_result_0;
            end;
        end;
    end;
end;
return function(v39) --[[ Line: 102 ]] --[[ Name: NumberSequenceRenderer ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), v20 (copy), v17 (copy), l_map_0 (copy), l_useEffect_0 (copy), v16 (copy), l_join_0 (copy), v38 (copy), v1 (copy), v18 (copy), v15 (copy), v13 (copy), l_Pane_0 (copy), l_TextInput_0 (copy), v12 (copy), v24 (copy), l_Tooltip_0 (copy), v19 (copy), v14 (copy)
    local v40 = l_useRef_0(nil);
    local v41 = l_useRef_0(nil);
    local v42, v43 = l_useState_0(false);
    local l_l_useState_0_0 = l_useState_0;
    local l_Keypoints_1 = v39.Value.Keypoints;
    local v46;
    l_l_useState_0_0, v46 = l_l_useState_0_0(#l_Keypoints_1 > 2 and "<NumberSequence>" or l_Keypoints_1[1].Value ~= l_Keypoints_1[2].Value and "<NumberSequence>" or tostring(v20(l_Keypoints_1[1].Value, 3)));
    local v47;
    v47, l_Keypoints_1 = l_useState_0(nil);
    local v48, v49 = l_useState_0(Vector2.one);
    local l_v17_0 = v17;
    local l_Value_0 = v39.Value;
    l_v17_0 = l_v17_0((l_map_0(l_Value_0.Keypoints, function(v52) --[[ Line: 73 ]]
        return {
            Time = v52.Time, 
            Value = v52.Value, 
            Envelope = v52.Envelope
        };
    end)));
    l_useEffect_0(function() --[[ Line: 112 ]]
        -- upvalues: v39 (copy), l_Keypoints_1 (copy), v46 (copy), v20 (ref)
        if v39.Value then
            l_Keypoints_1(nil);
            local l_v46_0 = v46;
            local l_Keypoints_2 = v39.Value.Keypoints;
            l_v46_0(#l_Keypoints_2 > 2 and "<NumberSequence>" or l_Keypoints_2[1].Value ~= l_Keypoints_2[2].Value and "<NumberSequence>" or tostring(v20(l_Keypoints_2[1].Value, 3)));
        end;
    end, {
        v39.Value, 
        l_Keypoints_1, 
        v46
    });
    local function _() --[[ Line: 119 ]] --[[ Name: saveSequence ]]
        -- upvalues: l_v17_0 (copy), l_map_0 (ref), v39 (copy)
        l_v17_0.save(function(v55) --[[ Line: 120 ]]
            -- upvalues: l_map_0 (ref), v39 (ref)
            local v57 = NumberSequence.new(l_map_0(v55, function(v56) --[[ Line: 67 ]]
                return NumberSequenceKeypoint.new(v56.Time, v56.Value, v56.Envelope);
            end));
            if v57 ~= v39.Value then
                v39.OnChanged(v57);
            end;
        end);
    end;
    l_Value_0 = function() --[[ Line: 129 ]] --[[ Name: onOpen ]]
        -- upvalues: v43 (copy)
        v43(true);
    end;
    local function v62() --[[ Line: 133 ]] --[[ Name: onClose ]]
        -- upvalues: l_v17_0 (copy), l_map_0 (ref), v39 (copy), v43 (copy)
        l_v17_0.save(function(v59) --[[ Line: 120 ]]
            -- upvalues: l_map_0 (ref), v39 (ref)
            local v61 = NumberSequence.new(l_map_0(v59, function(v60) --[[ Line: 67 ]]
                return NumberSequenceKeypoint.new(v60.Time, v60.Value, v60.Envelope);
            end));
            if v61 ~= v39.Value then
                v39.OnChanged(v61);
            end;
        end);
        v43(false);
    end;
    local function v66() --[[ Line: 138 ]] --[[ Name: onDeleteSelectedKeypoint ]]
        -- upvalues: l_v17_0 (copy), l_map_0 (ref), v39 (copy)
        l_v17_0.remove();
        l_v17_0.save(function(v63) --[[ Line: 120 ]]
            -- upvalues: l_map_0 (ref), v39 (ref)
            local v65 = NumberSequence.new(l_map_0(v63, function(v64) --[[ Line: 67 ]]
                return NumberSequenceKeypoint.new(v64.Time, v64.Value, v64.Envelope);
            end));
            if v65 ~= v39.Value then
                v39.OnChanged(v65);
            end;
        end);
    end;
    local function v71(v67) --[[ Line: 143 ]] --[[ Name: onEditSelectedKeypoint ]]
        -- upvalues: l_v17_0 (copy), l_map_0 (ref), v39 (copy)
        l_v17_0.update(v67);
        l_v17_0.save(function(v68) --[[ Line: 120 ]]
            -- upvalues: l_map_0 (ref), v39 (ref)
            local v70 = NumberSequence.new(l_map_0(v68, function(v69) --[[ Line: 67 ]]
                return NumberSequenceKeypoint.new(v69.Time, v69.Value, v69.Envelope);
            end));
            if v70 ~= v39.Value then
                v39.OnChanged(v70);
            end;
        end);
    end;
    local function v73(v72) --[[ Line: 148 ]] --[[ Name: onKeypointHover ]]
        -- upvalues: l_v17_0 (copy)
        l_v17_0.select(v72);
    end;
    local function v78(v74) --[[ Line: 152 ]] --[[ Name: onKeypointMove ]]
        -- upvalues: v40 (copy), l_v17_0 (copy), v16 (ref), l_join_0 (ref)
        if not v40.current then
            return;
        elseif l_v17_0.isFixedKeypointSelected() then
            return;
        else
            local v75 = l_v17_0.getSelectedKeypoint();
            local v76 = v16(v40.current, v74);
            local v77 = l_join_0(v75, {
                Time = v76.X, 
                Value = 1 - v76.Y
            });
            l_v17_0.update(v77);
            return;
        end;
    end;
    local function v87(_, v80) --[[ Line: 172 ]] --[[ Name: onPlotClick ]]
        -- upvalues: v16 (ref), v40 (copy), l_v17_0 (copy), l_map_0 (ref), v39 (copy)
        if v80.UserInputType == Enum.UserInputType.MouseButton1 then
            local v81 = Vector2.new(v80.Position.X, v80.Position.Y);
            local v82 = v16(v40.current, v81);
            local v83 = {
                Time = v82.X, 
                Value = 1 - v82.Y, 
                Envelope = 0
            };
            l_v17_0.add(v83);
            l_v17_0.save(function(v84) --[[ Line: 120 ]]
                -- upvalues: l_map_0 (ref), v39 (ref)
                local v86 = NumberSequence.new(l_map_0(v84, function(v85) --[[ Line: 67 ]]
                    return NumberSequenceKeypoint.new(v85.Time, v85.Value, v85.Envelope);
                end));
                if v86 ~= v39.Value then
                    v39.OnChanged(v86);
                end;
            end);
        end;
    end;
    local function v94(v88, _) --[[ Line: 187 ]] --[[ Name: onTextInputFocusLost ]]
        -- upvalues: v38 (ref), v39 (copy), v46 (copy), v20 (ref)
        if v88 == "<NumberSequence>" then
            return;
        else
            local v90, _ = v38(v88);
            if v90 and v90 ~= v39.Value then
                v39.OnChanged(v90);
                return;
            else
                local l_v46_1 = v46;
                local l_Keypoints_3 = v39.Value.Keypoints;
                l_v46_1(#l_Keypoints_3 > 2 and "<NumberSequence>" or l_Keypoints_3[1].Value ~= l_Keypoints_3[2].Value and "<NumberSequence>" or tostring(v20(l_Keypoints_3[1].Value, 3)));
                return;
            end;
        end;
    end;
    local function v98(v95) --[[ Line: 201 ]] --[[ Name: onTextInputChanged ]]
        -- upvalues: v46 (copy), l_Keypoints_1 (copy), v38 (ref)
        v46(v95);
        if v95 == "<NumberSequence>" then
            l_Keypoints_1(nil);
            return;
        else
            local _, v97 = v38(v95);
            l_Keypoints_1(v97);
            return;
        end;
    end;
    local v99 = {};
    for v100, v101 in l_v17_0.keypoints do
        local v102 = "Keypoint_" .. v100;
        local v103 = v100 == l_v17_0.selectedIndex;
        v99[v102] = v1.createElement(v18, {
            Position = Vector2.new(v101.Time, v101.Value), 
            Selected = v103, 
            Tag = "NumberSequenceKeypoint", 
            OnMoved = v78, 
            OnHoverStart = v15(v73, {
                v100
            }), 
            OnDragEnd = function() --[[ Line: 226 ]] --[[ Name: OnDragEnd ]]
                -- upvalues: l_v17_0 (copy), l_map_0 (ref), v39 (copy)
                l_v17_0.save(function(v104) --[[ Line: 120 ]]
                    -- upvalues: l_map_0 (ref), v39 (ref)
                    local v106 = NumberSequence.new(l_map_0(v104, function(v105) --[[ Line: 67 ]]
                        return NumberSequenceKeypoint.new(v105.Time, v105.Value, v105.Envelope);
                    end));
                    if v106 ~= v39.Value then
                        v39.OnChanged(v106);
                    end;
                end);
            end
        });
    end;
    for v107 = 1, #l_v17_0.keypoints - 1 do
        local v108 = l_v17_0.keypoints[v107];
        local v109 = l_v17_0.keypoints[v107 + 1];
        local v110 = l_v17_0.selectedIndex == v107;
        local v111 = l_v17_0.selectedIndex == v107 + 1;
        v99["SequenceLine_" .. v107 .. "_" .. v107 + 1] = v1.createElement(v13, {
            StartKeypoint = v108, 
            EndKeypoint = v109, 
            PlotAbsoluteSize = v48, 
            StartKeypointSelected = v110, 
            EndKeypointSelected = v111
        });
    end;
    local v112 = v47 ~= nil;
    return v1.createElement(l_Pane_0, {
        [v1.Tag] = "X-Fill"
    }, {
        NumberSequenceInput = v1.createElement(l_TextInput_0, {
            Disabled = v39.Disabled, 
            LeadingComponent = v12, 
            LeadingComponentProps = {
                OnClick = l_Value_0, 
                ForwardRef = v41, 
                Color = v24, 
                Transparency = v39.Value
            }, 
            OnFocusLost = v94, 
            OnTextChanged = v98, 
            Size = if v39.AutomaticSize then UDim2.new(1, 0, 0, v39.MinimumHeight or 24) else UDim2.fromScale(1, 1), 
            Text = l_l_useState_0_0, 
            [v1.Tag] = v112 and "PropertyCellError" or nil
        }), 
        Tooltip = v1.createElement(l_Tooltip_0, {
            Enabled = v112, 
            Text = v47 or ""
        }), 
        NumberSequenceModal = v1.createElement(v19, {
            Open = v42, 
            MaxSize = Vector2.new(800, 275), 
            MinSize = Vector2.new(600, 225), 
            ObjectRef = v41, 
            OnFocusLost = v62
        }, {
            Container = v1.createElement(l_Pane_0, {
                [v1.Tag] = "X-Pad X-ColumnM X-FitY"
            }, {
                Plot = v1.createElement(l_Pane_0, {
                    Active = true, 
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 0, 200), 
                    ForwardRef = v40, 
                    OnClick = v87, 
                    [v1.Tag] = "Contrast X-Clip", 
                    [v1.Change.AbsoluteSize] = function(v113) --[[ Line: 291 ]]
                        -- upvalues: v49 (copy)
                        if v113 then
                            v49(v113.AbsoluteSize);
                        end;
                    end
                }, v99), 
                KeypointControls = v1.createElement(v14, {
                    Keypoint = l_v17_0.getSelectedKeypoint(), 
                    IsKeypointFixed = l_v17_0.isFixedKeypointSelected(), 
                    OnEdit = v71, 
                    OnDelete = v66, 
                    OnSave = v62, 
                    LayoutOrder = 2
                })
            })
        })
    });
end;