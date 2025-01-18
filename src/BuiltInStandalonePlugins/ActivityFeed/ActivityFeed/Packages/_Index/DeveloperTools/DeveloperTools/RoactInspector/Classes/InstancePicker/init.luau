local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_RunService_0 = game:GetService("RunService");
local v2 = require(l_Parent_0.Dash);
local l_class_0 = v2.class;
local l_format_0 = v2.format;
local l_reduce_0 = v2.reduce;
local v6 = UDim2.fromScale(0, 0);
local function v14(v7, v8, v9) --[[ Line: 21 ]] --[[ Name: tweenUDim2 ]]
    local v10 = v7.X.Scale * (1 - v9) + v8.X.Scale * v9;
    local v11 = v7.X.Offset * (1 - v9) + v8.X.Offset * v9;
    local v12 = v7.Y.Scale * (1 - v9) + v8.Y.Scale * v9;
    local v13 = v7.Y.Offset * (1 - v9) + v8.Y.Offset * v9;
    return UDim2.new(v10, v11, v12, v13);
end;
local function v16() --[[ Line: 29 ]] --[[ Name: createPickerArea ]]
    local l_ImageButton_0 = Instance.new("ImageButton");
    l_ImageButton_0.Name = "InspectorHover";
    l_ImageButton_0.Active = true;
    l_ImageButton_0.AutoButtonColor = false;
    l_ImageButton_0.BorderSizePixel = 1;
    l_ImageButton_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_ImageButton_0.BackgroundColor3 = Color3.fromRGB(220, 230, 255);
    l_ImageButton_0.BackgroundTransparency = 0.2;
    l_ImageButton_0.ZIndex = 1100000;
    return l_ImageButton_0;
end;
local function v19() --[[ Line: 42 ]] --[[ Name: createHighlightArea ]]
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.Name = "InspectorHover";
    l_Frame_0.BorderSizePixel = 1;
    l_Frame_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_Frame_0.BackgroundColor3 = Color3.fromRGB(220, 230, 255);
    l_Frame_0.BackgroundTransparency = 0.2;
    l_Frame_0.ZIndex = 1100000;
    local l_TextLabel_0 = Instance.new("TextLabel");
    l_TextLabel_0.Name = "Dimensions";
    l_TextLabel_0.Size = UDim2.new(0, 60, 0, 24);
    l_TextLabel_0.Parent = l_Frame_0;
    l_TextLabel_0.BorderColor3 = Color3.fromRGB(0, 0, 0);
    l_TextLabel_0.BorderSizePixel = 1;
    l_TextLabel_0.BackgroundColor3 = Color3.fromRGB(255, 255, 255);
    l_TextLabel_0.BackgroundTransparency = 0.2;
    l_TextLabel_0.ZIndex = 1100001;
    return l_Frame_0;
end;
local v22 = l_class_0("InstancePicker", function(v20, v21) --[[ Line: 64 ]]
    -- upvalues: v16 (copy), v19 (copy), v6 (copy)
    return {
        debugInterface = v20, 
        onSelect = v21, 
        active = false, 
        connection = nil, 
        selectedObject = nil, 
        pickerArea = v16(), 
        highlightArea = v19(), 
        selectedTime = os.clock(), 
        nextPosition = v6, 
        nextSize = v6, 
        prevPosition = v6, 
        prevSize = v6
    };
end);
v22.getRoot = function(v23) --[[ Line: 81 ]] --[[ Name: getRoot ]]
    return v23.debugInterface.rootInstance;
end;
v22.getPickerParent = function(v24, v25) --[[ Line: 85 ]] --[[ Name: getPickerParent ]]
    return v25 and v25:FindFirstAncestorWhichIsA("ScreenGui") or v24.debugInterface.pickerParent or v24:getRoot();
end;
v22.getRelativeMousePosition = function(v26) --[[ Line: 91 ]] --[[ Name: getRelativeMousePosition ]]
    local v27 = v26:getRoot();
    if not v27 then
        return nil;
    elseif v27:IsA("PluginGui") then
        return v27:GetRelativeMousePosition();
    else
        local l_Mouse_0 = game:GetService("Players").LocalPlayer:GetMouse();
        return Vector2.new(l_Mouse_0.X, l_Mouse_0.Y);
    end;
end;
v22._init = function(v29) --[[ Line: 104 ]] --[[ Name: _init ]]
    v29.pickerArea.Activated:Connect(function() --[[ Line: 105 ]]
        -- upvalues: v29 (copy)
        v29.onSelect(v29.selectedObject);
    end);
end;
v22.setActive = function(v30, v31) --[[ Line: 110 ]] --[[ Name: setActive ]]
    -- upvalues: l_RunService_0 (copy)
    v30.active = v31;
    if not v30:getRoot() then
        return;
    elseif v31 then
        v30.pickerArea.Parent = v30:getPickerParent();
        local v32 = nil;
        v32 = function() --[[ Line: 119 ]]
            -- upvalues: v30 (copy), v32 (ref)
            if not v30.active then
                return;
            else
                v30:calculateFramePosition();
                delay(0.2, v32);
                return;
            end;
        end;
        v32();
        v30.connection = l_RunService_0.RenderStepped:Connect(function() --[[ Line: 127 ]]
            -- upvalues: v30 (copy)
            v30:updateFrame();
        end);
        return;
    else
        if v30.connection then
            v30.connection:Disconnect();
            v30.connection = nil;
            v30.pickerArea.Parent = nil;
        end;
        return;
    end;
end;
v22.updateFrame = function(v33) --[[ Line: 137 ]] --[[ Name: updateFrame ]]
    -- upvalues: v14 (copy)
    local v34 = math.min(1, (os.clock() - v33.selectedTime) / 0.1);
    v33.pickerArea.Position = v14(v33.prevPosition, v33.nextPosition, v34);
    v33.pickerArea.Size = v14(v33.prevSize, v33.nextSize, v34);
end;
v22.intersectMouse = function(v35, v36, v37) --[[ Line: 143 ]] --[[ Name: intersectMouse ]]
    -- upvalues: l_reduce_0 (copy)
    local l_v36_Descendants_0 = v36:GetDescendants();
    return l_reduce_0(l_v36_Descendants_0, function(v39, v40) --[[ Line: 145 ]]
        -- upvalues: v35 (copy), v37 (copy)
        if v40 == v35.pickerArea then
            return v39;
        else
            local v41 = false;
            if v40:IsA("GuiBase2d") then
                local v42 = v37 - v40.AbsolutePosition;
                local v43 = false;
                if v42.X >= 0 then
                    v43 = false;
                    if v42.X <= v40.AbsoluteSize.X then
                        v43 = false;
                        if v42.Y >= 0 then
                            v43 = v42.Y <= v40.AbsoluteSize.Y;
                        end;
                    end;
                end;
                v41 = v43;
            end;
            if v40:IsA("GuiObject") and not v40.Visible then
                v41 = false;
            end;
            local l_v40_FirstAncestorWhichIsA_0 = v40:FindFirstAncestorWhichIsA("ScreenGui");
            local v45 = l_v40_FirstAncestorWhichIsA_0 and l_v40_FirstAncestorWhichIsA_0.Enabled == false;
            if v41 and not v45 then
                local v46 = v40.AbsoluteSize.X * v40.AbsoluteSize.Y;
                if v46 < v39.minArea then
                    v39.minArea = v46;
                    v39.instance = v40;
                end;
            end;
            return v39;
        end;
    end, {
        minArea = 1e999
    }).instance;
end;
v22.calculateFramePosition = function(v47) --[[ Line: 177 ]] --[[ Name: calculateFramePosition ]]
    local v48 = v47:getRoot();
    local v49 = v47:getRelativeMousePosition();
    if not v48 or not v49 then
        return;
    else
        if v49 ~= v47.mousePosition then
            v47.mousePosition = v49;
            local v50 = v47:intersectMouse(v48, v49);
            if v50 then
                if v50 ~= v47.selectedObject then
                    v47.pickerArea.Parent = v47:getPickerParent(v50);
                    v47.selectedObject = v50;
                    v47.prevPosition = UDim2.fromOffset(v47.pickerArea.AbsolutePosition.X, v47.pickerArea.AbsolutePosition.Y);
                    v47.prevSize = UDim2.fromOffset(v47.pickerArea.AbsoluteSize.X, v47.pickerArea.AbsoluteSize.Y);
                    v47.nextPosition = UDim2.fromOffset(v50.AbsolutePosition.X, v50.AbsolutePosition.Y);
                    v47.nextSize = UDim2.fromOffset(v50.AbsoluteSize.X, v50.AbsoluteSize.Y);
                    v47.selectedTime = os.clock();
                    return;
                end;
            else
                v47.selectedObject = nil;
            end;
        end;
        return;
    end;
end;
v22.highlight = function(v51, v52) --[[ Line: 202 ]] --[[ Name: highlight ]]
    -- upvalues: l_format_0 (copy)
    pcall(function() --[[ Line: 204 ]]
        -- upvalues: v51 (copy), v52 (copy), l_format_0 (ref)
        v51.highlightArea.Parent = v51:getPickerParent(v52);
        v51.highlightArea.Position = UDim2.fromOffset(v52.AbsolutePosition.X, v52.AbsolutePosition.Y);
        v51.highlightArea.Size = UDim2.fromOffset(v52.AbsoluteSize.X, v52.AbsoluteSize.Y);
        v51.highlightArea:FindFirstChild("Dimensions").Text = l_format_0("{X}x{Y}", v52.AbsoluteSize);
    end);
end;
v22.dehighlight = function(v53) --[[ Line: 213 ]] --[[ Name: dehighlight ]]
    v53.highlightArea.Parent = nil;
end;
v22.destroy = function(v54) --[[ Line: 217 ]] --[[ Name: destroy ]]
    if v54.connection then
        v54.connection:Disconnect();
    end;
    v54.pickerArea:Destroy();
end;
return v22;