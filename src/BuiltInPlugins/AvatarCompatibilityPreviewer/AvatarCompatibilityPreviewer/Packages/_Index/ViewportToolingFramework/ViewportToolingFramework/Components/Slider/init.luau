local l_TextService_0 = game:GetService("TextService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ViewportToolingFramework");
local v2 = require(l_script_FirstAncestor_0.Parent.Framework);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Components.Icon);
local v5 = require(l_script_FirstAncestor_0.Components.Tooltip);
local _ = require(l_script_FirstAncestor_0.Types);
local l_Slider_0 = v2.UI.Slider;
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_joinTags_0 = v2.Styling.joinTags;
local function v15(v10, v11, v12) --[[ Line: 24 ]] --[[ Name: getWidestNumberText ]]
    local v13 = math.max(math.floor((math.log10((math.abs(v10))))) + 1, math.floor((math.log10((math.abs(v11))))) + 1, 1);
    local v14 = string.rep("9", v13);
    if v12 > 0 then
        v14 = v14 .. "." .. string.rep("9", v12);
    end;
    if v10 < 0 then
        v14 = ("-%*"):format(v14);
    end;
    return v14;
end;
return function(v16) --[[ Line: 39 ]] --[[ Name: SliderComponent ]]
    -- upvalues: v3 (copy), v15 (copy), l_TextService_0 (copy), l_LayoutOrderIterator_0 (copy), l_joinTags_0 (copy), v5 (copy), v4 (copy), l_Slider_0 (copy)
    local v17 = v16.Item.Enabled ~= false;
    local v18 = v16.Item.InputPrecision or 2;
    local v20 = v3.useCallback(function(v19) --[[ Line: 43 ]]
        -- upvalues: v16 (copy), v18 (copy)
        if v16.Item.DisplayFormat ~= nil then
            return string.format(v16.Item.DisplayFormat, v19);
        else
            return string.format(("%%.%*f"):format(v18), v19);
        end;
    end, {
        v18, 
        v16.Item.DisplayFormat
    });
    local v21 = v15(v16.Item.Min, v16.Item.Max, v18);
    local v23 = v3.useMemo(function() --[[ Line: 53 ]]
        -- upvalues: v21 (copy), l_TextService_0 (ref), v20 (copy)
        local v22 = tonumber(v21);
        assert(v22 ~= nil, "getWidestNumberText did not produce a valid number");
        return l_TextService_0:GetTextSize(v20(v22), 18, Enum.Font.SourceSans, Vector2.new(1e999, 1e999)).X + 12;
    end, {
        v21, 
        v20
    });
    local v24 = v3.useCallback(function() --[[ Line: 65 ]]
        -- upvalues: v16 (copy)
        assert(v16.Item.IncrementStep ~= nil, "Decrement with no IncrementStep");
        v16.Item.OnChange((math.clamp(v16.Item.Value - v16.Item.IncrementStep, v16.Item.Min, v16.Item.Max)));
    end, {
        v16.Item
    });
    local v25 = v3.useCallback(function() --[[ Line: 70 ]]
        -- upvalues: v16 (copy)
        assert(v16.Item.IncrementStep ~= nil, "Increment with no IncrementStep");
        v16.Item.OnChange((math.clamp(v16.Item.Value + v16.Item.IncrementStep, v16.Item.Min, v16.Item.Max)));
    end, {
        v16.Item
    });
    local v27 = v3.useCallback(function(v26) --[[ Line: 75 ]]
        -- upvalues: v17 (copy)
        if not v17 then
            v26:ReleaseFocus();
            return;
        else
            v26.CursorPosition = #v26.Text + 1;
            v26.SelectionStart = -#v26.Text;
            return;
        end;
    end, {
        v17
    });
    local v31 = v3.useCallback(function(v28) --[[ Line: 85 ]]
        -- upvalues: v17 (copy), v20 (copy), v16 (copy)
        if not v17 then
            return;
        else
            local v29 = tonumber(v28.Text);
            if v29 == nil then
                v28.Text = v20(v16.Item.Value);
                return;
            else
                assert(v29 ~= nil, "Luau");
                local v30 = math.clamp(v29, v16.Item.Min, v16.Item.Max);
                v28.Text = v20(v30);
                v16.Item.OnChange(v30);
                return;
            end;
        end;
    end, {
        v17, 
        v16.Item, 
        v20
    });
    local v35 = v3.useCallback(function(v32) --[[ Line: 102 ]]
        -- upvalues: v16 (copy)
        if not v32:IsFocused() then
            return;
        else
            local l_Text_0 = v32.Text;
            local v34 = "([0-9]*)%.?[0-9]*$";
            if v16.Item.Min < 0 then
                v34 = "%-?" .. v34;
            end;
            while #l_Text_0 > 0 and not l_Text_0:match("^" .. v34) do
                l_Text_0 = l_Text_0:sub(1, #l_Text_0 - 1);
            end;
            v32.Text = l_Text_0;
            return;
        end;
    end, {
        v16.Item
    });
    local v36 = l_LayoutOrderIterator_0.new();
    local l_createElement_0 = v3.createElement;
    local v38 = "Frame";
    local v39 = {
        LayoutOrder = v16.NextOrder(), 
        [v3.Tag] = l_joinTags_0("VPF-Slider", v17 and "VPF-Slider--Enabled" or "VPF-Slider--Disabled")
    };
    local v40 = {};
    local v41 = false;
    if v16.Item.Icon ~= nil then
        v41 = v3.createElement;
        local v42 = "Frame";
        local v43 = {
            LayoutOrder = v36:getNextOrder(), 
            [v3.Tag] = "X-Fill VPF-X-Square"
        };
        local v44 = {};
        local v45 = false;
        if v16.Item.Tooltip ~= nil then
            v45 = v3.createElement(v5, {
                Title = v16.Item.Tooltip, 
                Description = v16.Item.TooltipDescription
            });
        end;
        v44.Tooltip = v45;
        v44.Icon = v3.createElement(v4, {
            Icon = v16.Item.Icon
        });
        v41 = v41(v42, v43, v44);
    end;
    v40.Icon = v41;
    v40.Value = if v16.Item.IncrementStep == nil then v3.createElement("TextBox", {
        LayoutOrder = v36:getNextOrder(), 
        Size = UDim2.new(0, v23, 1, 0), 
        Text = v20(v16.Item.Value), 
        [v3.Event.Focused] = v27, 
        [v3.Event.FocusLost] = v31, 
        [v3.Change.Text] = v35, 
        [v3.Tag] = "VPF-Slider__Input"
    }) else v3.createElement("Frame", {
        LayoutOrder = v36:getNextOrder(), 
        Size = UDim2.new(0, v23 + 24, 1, 0)
    }, {
        Decrement = v3.createElement("TextButton", {
            [v3.Event.Activated] = if v17 then v24 else nil, 
            [v3.Tag] = "VPF-Slider__StepButton"
        }, {
            Minus = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(0, 0.5), 
                Position = UDim2.new(0, 3, 0.5, 0), 
                [v3.Tag] = "VPF-Slider__BarSegment"
            })
        }), 
        Input = v3.createElement("TextBox", {
            Position = UDim2.fromOffset(15, 0), 
            Size = UDim2.new(0, v23, 1, 0), 
            Text = v20(v16.Item.Value), 
            ZIndex = 2, 
            [v3.Event.Focused] = v27, 
            [v3.Event.FocusLost] = v31, 
            [v3.Change.Text] = v35, 
            [v3.Tag] = "VPF-Slider__Input"
        }), 
        Increment = v3.createElement("TextButton", {
            Position = UDim2.fromOffset(v23 + 10, 0), 
            [v3.Event.Activated] = if v17 then v25 else nil, 
            [v3.Tag] = "VPF-Slider__StepButton"
        }, {
            Bar1 = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, -3, 0.5, 0), 
                [v3.Tag] = "VPF-Slider__BarSegment"
            }), 
            Bar2 = v3.createElement("Frame", {
                AnchorPoint = Vector2.new(1, 0.5), 
                Position = UDim2.new(1, -3, 0.5, 0), 
                Rotation = 90, 
                [v3.Tag] = "VPF-Slider__BarSegment"
            })
        })
    });
    v40.Slider = v3.createElement("Frame", {
        LayoutOrder = v36:getNextOrder(), 
        [v3.Tag] = "X-FitX"
    }, v3.createElement(l_Slider_0, {
        Size = UDim2.new(0, 145, 1, 0), 
        Min = v16.Item.Min, 
        Max = v16.Item.Max, 
        Value = v16.Item.Value, 
        OnValueChanged = v16.Item.OnChange, 
        Disabled = not v17, 
        VerticalDragTolerance = 24
    }));
    return l_createElement_0(v38, v39, v40);
end;