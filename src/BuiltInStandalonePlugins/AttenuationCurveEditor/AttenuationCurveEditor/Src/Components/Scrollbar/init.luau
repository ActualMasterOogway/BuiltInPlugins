local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useCallback_0 = v2.useCallback;
local l_useEffect_0 = v2.useEffect;
local l_useRef_0 = v2.useRef;
local l_useState_0 = v2.useState;
local l_Pane_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI.Pane;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_Parent_0.ScrollbarButton);
local l_RunService_0 = game:GetService("RunService");
return function(v11) --[[ Line: 45 ]] --[[ Name: Scrollbar ]]
    -- upvalues: l_useRef_0 (copy), l_useState_0 (copy), l_useCallback_0 (copy), l_useEffect_0 (copy), l_RunService_0 (copy), v2 (copy), l_Pane_0 (copy), v9 (copy)
    local v12 = math.max(v11.XRange.Max, v11.DefaultXMax);
    local v13 = UDim2.fromScale((v11.XRange.Min - 0) / (v12 - 0), 0);
    local v14 = UDim2.fromScale((v11.XRange.Max - v11.XRange.Min) / (v12 - 0), 1);
    local v15 = l_useRef_0(nil);
    local v16, v17 = l_useState_0("");
    local v18, v19 = l_useState_0(0);
    local v23 = l_useCallback_0(function(v20, v21, v22) --[[ Line: 56 ]]
        -- upvalues: v17 (copy), v19 (copy)
        v17(v20);
        v19(v22.Position.X - v21.AbsolutePosition.X);
    end, {
        v17, 
        v19
    });
    local v24 = l_useCallback_0(function() --[[ Line: 61 ]]
        -- upvalues: v17 (copy)
        v17("");
    end, {
        v17
    });
    local v30 = l_useCallback_0(function(v25) --[[ Line: 65 ]]
        -- upvalues: v11 (copy)
        if v25 < 0 then
            local v26 = math.max(v11.XRange.Min + v25, 0);
            local v27 = v11.XRange.Max + (v26 - v11.XRange.Min);
            v11.SetXRange(NumberRange.new(v26, v27));
            v11.XRange = NumberRange.new(v26, v27);
            return;
        else
            if v25 > 0 then
                local v28 = math.min(v11.XRange.Max + v25, 4294967296);
                local v29 = v11.XRange.Min + (v28 - v11.XRange.Max);
                v11.SetXRange(NumberRange.new(v29, v28));
                v11.XRange = NumberRange.new(v29, v28);
            end;
            return;
        end;
    end, {
        v11
    });
    local v33 = l_useCallback_0(function(v31) --[[ Line: 84 ]]
        -- upvalues: v15 (copy), v18 (copy), v12 (copy), v30 (copy), v11 (copy)
        if not v15.current then
            return;
        else
            assert(v15.current, "frameRef.current was nil");
            local v32 = 0 + math.clamp((v31.Position.X - v18 - v15.current.AbsolutePosition.X) / v15.current.AbsoluteSize.X, 0, 1) * (v12 - 0);
            v30(v32 - v11.XRange.Min);
            return;
        end;
    end, {
        v15, 
        v18, 
        v11
    });
    local v36 = l_useCallback_0(function(v34) --[[ Line: 97 ]]
        -- upvalues: v15 (copy), v18 (copy), v12 (copy), v11 (copy)
        if not v15.current then
            return;
        else
            assert(v15.current, "frameRef.current was nil");
            local v35 = math.clamp(0 + math.clamp((v34.Position.X - v18 + 15 - v15.current.AbsolutePosition.X) / v15.current.AbsoluteSize.X, 0, 1) * (v12 - 0), 0, v11.XRange.Max - 1);
            v11.SetXRange(NumberRange.new(v35, v11.XRange.Max));
            return;
        end;
    end, {
        v15, 
        v18, 
        v11
    });
    local v39 = l_useCallback_0(function(v37) --[[ Line: 111 ]]
        -- upvalues: v15 (copy), v18 (copy), v12 (copy), v11 (copy)
        if not v15.current then
            return;
        else
            assert(v15.current, "frameRef.current was nil");
            local v38 = math.clamp(0 + math.clamp((v37.Position.X - v18 - v15.current.AbsolutePosition.X) / v15.current.AbsoluteSize.X, 0, 1) * (v12 - 0), v11.XRange.Min + 1, 4294967296);
            v11.SetXRange(NumberRange.new(v11.XRange.Min, v38));
            return;
        end;
    end, {
        v15, 
        v18, 
        v11
    });
    local v40, v41 = l_useState_0(nil);
    l_useEffect_0(function() --[[ Line: 126 ]]
        -- upvalues: v40 (copy), v16 (copy), v41 (copy), l_RunService_0 (ref), v30 (copy), v11 (copy)
        if v40 ~= nil then
            v40:Disconnect();
        end;
        local v42 = 0;
        if v16 == "SL" then
            v42 = -0.04;
        elseif v16 == "SR" then
            v42 = 0.04;
        else
            v41(nil);
            return;
        end;
        local v43 = 0;
        v41(l_RunService_0.Heartbeat:Connect(function() --[[ Line: 142 ]]
            -- upvalues: v43 (ref), v30 (ref), v11 (ref), v42 (ref)
            if v43 == 0 or v43 > 20 then
                v30((v11.XRange.Max - v11.XRange.Min) * v42);
            end;
            v43 = v43 + 1;
        end));
    end, {
        v16
    });
    return v2.createElement(l_Pane_0, {
        LayoutOrder = 2, 
        Position = UDim2.new(0, 35, 1, -20), 
        Size = UDim2.new(1, -70, 0, 20), 
        [v2.Tag] = "ScrollbarFrame"
    }, {
        LeftButton = v2.createElement(v9, {
            AnchorPoint = Vector2.new(1, 0), 
            Size = UDim2.new(0, 20, 1, 0), 
            Text = "<<", 
            ControlId = "SL", 
            DragTarget = v16, 
            OnDragBegan = v23, 
            OnDragEnded = v24
        }), 
        RightButton = v2.createElement(v9, {
            Position = UDim2.new(1, 0, 0, 0), 
            Size = UDim2.new(0, 20, 1, 0), 
            Text = ">>", 
            ControlId = "SR", 
            DragTarget = v16, 
            OnDragBegan = v23, 
            OnDragEnded = v24
        }), 
        Inner = v2.createElement(l_Pane_0, {
            Position = UDim2.new(0, 15, 0, 0), 
            Size = UDim2.new(1, -30, 1, 0), 
            ForwardRef = v15
        }, {
            Body = v2.createElement(l_Pane_0, {
                Position = v13, 
                Size = v14
            }, {
                MainButton = v2.createElement(v9, {
                    Size = UDim2.fromScale(1, 1), 
                    ControlId = "M", 
                    DragTarget = v16, 
                    OnDragBegan = v23, 
                    OnDragMoved = v33, 
                    OnDragEnded = v24
                }), 
                LeftButton = v2.createElement(v9, {
                    AnchorPoint = Vector2.new(1, 0), 
                    Size = UDim2.new(0, 15, 1, 0), 
                    Text = "::", 
                    ControlId = "L", 
                    DragTarget = v16, 
                    OnDragBegan = v23, 
                    OnDragMoved = v36, 
                    OnDragEnded = v24
                }), 
                RightButton = v2.createElement(v9, {
                    Position = UDim2.new(1, 0, 0, 0), 
                    Size = UDim2.new(0, 15, 1, 0), 
                    Text = "::", 
                    ControlId = "R'", 
                    DragTarget = v16, 
                    OnDragBegan = v23, 
                    OnDragMoved = v39, 
                    OnDragEnded = v24
                })
            })
        })
    });
end;