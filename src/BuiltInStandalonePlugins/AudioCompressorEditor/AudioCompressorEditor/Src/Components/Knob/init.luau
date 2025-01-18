local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioCompressorEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_DragListener_0 = v2.UI.DragListener;
local l_HoverArea_0 = v2.UI.HoverArea;
local l_Pane_0 = v2.UI.Pane;
local l_PropertyCell_0 = v2.UI.PropertyCell;
local l_TextLabel_0 = v2.UI.TextLabel;
local l_isInputMainPress_0 = v2.Util.isInputMainPress;
local v9 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v9.useCallback;
local l_useMemo_0 = v9.useMemo;
local l_useState_0 = v9.useState;
local v13 = require(l_script_FirstAncestor_0.Src.Resources.PluginStyles);
local l_v13_Attribute_0 = v13:GetAttribute("CursorHorizontal");
local l_v13_Attribute_1 = v13:GetAttribute("CursorVertical");
local v16 = require(l_Parent_0.Path2DWrapper);
local v17 = Vector2.new(60, 25);
local v18 = Vector2.new(60, 25);
local function v22(v19) --[[ Line: 53 ]] --[[ Name: toPolar ]]
    local v20 = Vector2.new(0.5, 0.5);
    local v21 = v19.Y * 0.5;
    return v20 + Vector2.new(math.sin(v19.X * 3.141592653589793 / 180), -math.cos(v19.X * 3.141592653589793 / 180)) * v21;
end;
local function v26(v23, v24, v25) --[[ Line: 60 ]] --[[ Name: makeControlPoint ]]
    if not v23 then
        return Path2DControlPoint.new();
    elseif not v24 or not v25 then
        return Path2DControlPoint.new(UDim2.fromScale(v23.X, v23.Y));
    else
        return Path2DControlPoint.new(UDim2.fromScale(v23.X, v23.Y), UDim2.fromScale(v24.X, v24.Y), UDim2.fromScale(v25.X, v25.Y));
    end;
end;
local function v45(v27) --[[ Line: 74 ]] --[[ Name: createArc ]]
    -- upvalues: v22 (copy), v26 (copy)
    local v28 = {};
    local v29 = 0;
    local v30 = #v27;
    local v31 = 1;
    local v32 = v27[1];
    while v31 <= v30 do
        local v33 = v27[v31];
        local v34 = v22(v33);
        if v31 == 1 then
            table.insert(v28, v26(v34));
            v29 = v29 + 1;
            v31 = v31 + 1;
            v32 = v33;
        else
            local l_v32_0 = v32;
            if l_v32_0.X == v33.X then
                table.insert(v28, v26(v34));
                v29 = v29 + 1;
                v31 = v31 + 1;
                v32 = v33;
            else
                local v36 = false;
                while v33.X > l_v32_0.X + 90 do
                    v36 = true;
                    v33 = (l_v32_0 + v33) / 2;
                    v34 = v22(v33);
                end;
                local v37 = v22(l_v32_0);
                local v38 = Vector2.new(0.5, 0.5);
                local v39 = v37 - v38;
                local v40 = v34 - v38;
                local l_Unit_0 = (v22(l_v32_0 + (v33 - l_v32_0) * 0.001) - v37).Unit;
                local l_Unit_1 = (v22(v33 + (v33 - l_v32_0) * 0.001) - v34).Unit;
                local v43 = l_Unit_0 * v39.Magnitude * 1.3333333333333333 * math.tan(3.141592653589793 / (2 * (360 / math.abs(l_v32_0.X - v33.X))));
                local v44 = l_Unit_1 * v40.Magnitude * 1.3333333333333333 * math.tan(3.141592653589793 / (2 * (360 / math.abs(l_v32_0.X - v33.X))));
                v28[v29] = v26(v37, Vector2.new(v28[v29].LeftTangent.X.Scale, v28[v29].LeftTangent.Y.Scale), v43);
                table.insert(v28, v26(v34, -v44, v44));
                v29 = v29 + 1;
                if not v36 then
                    v31 = v31 + 1;
                end;
                v32 = v33;
            end;
        end;
    end;
    return v28;
end;
return function(v46) --[[ Line: 146 ]] --[[ Name: Knob ]]
    -- upvalues: l_useState_0 (copy), l_useMemo_0 (copy), v45 (copy), l_useCallback_0 (copy), l_isInputMainPress_0 (copy), v9 (copy), l_Pane_0 (copy), v18 (copy), v17 (copy), l_TextLabel_0 (copy), l_PropertyCell_0 (copy), l_HoverArea_0 (copy), l_v13_Attribute_0 (copy), l_DragListener_0 (copy), v16 (copy), l_v13_Attribute_1 (copy)
    local _, v48 = l_useState_0(false);
    local v49, v50 = l_useState_0(false);
    local v51, v52 = l_useState_0(false);
    local v53, v54 = l_useState_0(0);
    local v55, v56 = l_useState_0(0);
    local v57, v58 = l_useState_0("");
    local l_Min_0 = v46.Min;
    local l_Max_0 = v46.Max;
    local l_Value_0 = v46.Value;
    if v46.CurveFunction then
        l_Min_0 = v46.CurveFunction(l_Min_0);
        l_Max_0 = v46.CurveFunction(l_Max_0);
        l_Value_0 = v46.CurveFunction(l_Value_0);
    end;
    local _ = (v46.Value - v46.Min) / (v46.Max - v46.Min);
    local v63 = (l_Value_0 - l_Min_0) / (l_Max_0 - l_Min_0);
    local v64 = -135 + 270 * v63;
    local v65 = l_useMemo_0(function() --[[ Line: 167 ]]
        -- upvalues: v45 (ref)
        return (v45({
            Vector2.new(-135, 1.2), 
            Vector2.new(135, 1.2)
        }));
    end, {});
    local v66 = l_useMemo_0(function() --[[ Line: 174 ]]
        -- upvalues: v45 (ref), v64 (copy)
        return (v45({
            Vector2.new(-135, 1.2), 
            Vector2.new(v64, 1.2)
        }));
    end, {
        v46.Value, 
        v46.Min, 
        v46.Max
    });
    local v67 = l_useMemo_0(function() --[[ Line: 181 ]]
        -- upvalues: v45 (ref), v64 (copy)
        return (v45({
            Vector2.new(v64, 0.2), 
            Vector2.new(v64, 1)
        }));
    end, {
        v46.Value, 
        v46.Min, 
        v46.Max
    });
    local v68 = l_useCallback_0(function() --[[ Line: 188 ]]
        -- upvalues: v48 (copy)
        v48(true);
    end, {
        v48
    });
    local v69 = l_useCallback_0(function() --[[ Line: 192 ]]
        -- upvalues: v48 (copy)
        v48(false);
    end, {
        v48
    });
    local v72 = l_useCallback_0(function(_, v71) --[[ Line: 197 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v50 (copy), v54 (copy), v56 (copy), v63 (copy), v58 (copy), v46 (copy)
        if l_isInputMainPress_0(v71) then
            v50(true);
            v54(v71.Position.X);
            v56(v63);
            v58("X");
            if v46.OnInputBegan then
                v46.OnInputBegan();
            end;
        end;
    end, {
        v50, 
        v54, 
        v56, 
        v58, 
        v46.Value, 
        v46.OnInputBegan
    });
    local v75 = l_useCallback_0(function(_, v74) --[[ Line: 212 ]]
        -- upvalues: l_isInputMainPress_0 (ref), v52 (copy), v54 (copy), v56 (copy), v63 (copy), v58 (copy), v46 (copy)
        if l_isInputMainPress_0(v74) then
            v52(true);
            v54(v74.Position.Y);
            v56(v63);
            v58("Y");
            if v46.OnInputBegan then
                v46.OnInputBegan();
            end;
        end;
    end, {
        v52, 
        v54, 
        v56, 
        v58, 
        v46.Value, 
        v46.OnInputBegan
    });
    local v80 = l_useCallback_0(function(v76) --[[ Line: 226 ]]
        -- upvalues: v46 (copy), v57 (copy), v53 (copy), v55 (copy), l_Min_0 (ref), l_Max_0 (ref)
        if not v46.OnInputChanged then
            return;
        else
            local v77 = if v57 == "X" then v76.Position.X - v53 else -(v76.Position.Y - v53);
            local v78 = math.clamp(v55 + v77 / v46.DragRange, 0, 1);
            local v79 = l_Min_0 + v78 * (l_Max_0 - l_Min_0);
            if v46.InverseCurveFunction then
                v79 = v46.InverseCurveFunction(v79);
            end;
            v46.OnInputChanged(v79);
            return;
        end;
    end, {
        v46.OnInputChanged, 
        v46.Min, 
        v46.Max, 
        v46.CurveFunction, 
        v46.InverseCurveFunction, 
        v46.DragRange, 
        v53, 
        v55, 
        v57
    });
    local v82 = l_useCallback_0(function(_) --[[ Line: 256 ]]
        -- upvalues: v50 (copy), v52 (copy), v46 (copy)
        v50(false);
        v52(false);
        if v46.OnInputEnded then
            v46.OnInputEnded();
        end;
    end, {
        v50, 
        v52, 
        v46.OnInputEnded
    });
    return v9.createElement(l_Pane_0, {
        Position = v46.Position, 
        Size = UDim2.fromOffset(v18.X + v46.Size + 10, v17.Y + v46.Size + 10), 
        LayoutOrder = v46.LayoutOrder
    }, {
        Label = v9.createElement(l_TextLabel_0, {
            BackgroundTransparency = 1, 
            Text = v46.Label, 
            Size = UDim2.fromOffset(v17.X, v17.Y), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Bottom
        }), 
        Spinbox = v9.createElement(l_PropertyCell_0, {
            Schema = {
                Type = "Number", 
                Min = v46.Min, 
                Max = v46.Max, 
                Precision = v46.Precision
            }, 
            Value = v46.Value, 
            OnChanged = v46.OnInputChanged, 
            Position = UDim2.fromOffset(0, v17.Y + 10), 
            Size = UDim2.fromOffset(v18.X, v18.Y), 
            Tooltip = v46.Label
        }), 
        Draggable = v9.createElement("ImageButton", {
            Position = UDim2.fromOffset(v18.X - v18.Y, v17.Y + 10), 
            Size = UDim2.fromOffset(v18.Y, v18.Y), 
            ZIndex = 10, 
            BackgroundTransparency = 1, 
            [v9.Tag] = "DoubleArrowButton", 
            [v9.Event.InputBegan] = v72
        }, {
            HoverArea = v9.createElement(l_HoverArea_0, {
                Cursor = l_v13_Attribute_0, 
                MouseEnter = v68, 
                MouseLeave = v69
            }), 
            DragListener = v49 and v9.createElement(l_DragListener_0, {
                OnDragMoved = v80, 
                OnDragEnded = v82
            })
        }), 
        Knob = v9.createElement("ImageButton", {
            Position = UDim2.fromOffset(v18.X + 10, v17.Y + 10), 
            Size = UDim2.fromOffset(v46.Size, v46.Size), 
            [v9.Tag] = "Knob", 
            [v9.Event.InputBegan] = v75
        }, {
            BackArc = v9.createElement(v16, {
                ControlPoints = v65, 
                Tag = "KnobBackArc", 
                ZIndex = 1
            }), 
            Arc = v9.createElement(v16, {
                ControlPoints = v66, 
                Tag = "KnobArc", 
                ZIndex = 2
            }), 
            Tick = v9.createElement(v16, {
                ControlPoints = v67, 
                Tag = "KnobTick"
            }), 
            HoverArea = v9.createElement(l_HoverArea_0, {
                Cursor = l_v13_Attribute_1, 
                MouseEnter = v68, 
                MouseLeave = v69
            }), 
            DragListener = v51 and v9.createElement(l_DragListener_0, {
                OnDragMoved = v80, 
                OnDragEnded = v82
            })
        })
    });
end;