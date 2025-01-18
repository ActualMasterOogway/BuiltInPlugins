local l_CoreGui_0 = game:GetService("CoreGui");
local v1 = require(script.Parent.Parent.Util.Constants);
local _ = require(script.Parent.types);
local v3 = {};
v3.index = v3;
local l_DefaultRadiusThickness_0 = v1.DefaultRadiusThickness;
local l_DefaultInnerRadiusThickness_0 = v1.DefaultInnerRadiusThickness;
local l_FalloffCursorAdjustment_0 = v1.FalloffCursorAdjustment;
v3.new = function() --[[ Line: 16 ]] --[[ Name: new ]]
    -- upvalues: v3 (copy), l_DefaultRadiusThickness_0 (copy), l_DefaultInnerRadiusThickness_0 (copy), l_CoreGui_0 (copy), l_FalloffCursorAdjustment_0 (copy)
    local v7 = setmetatable({}, v3);
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "FreeformRadius";
    local l_Frame_0 = Instance.new("Frame");
    l_Frame_0.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_0.BackgroundTransparency = 1;
    l_Frame_0.Parent = l_ScreenGui_0;
    local l_UICorner_0 = Instance.new("UICorner");
    l_UICorner_0.Parent = l_Frame_0;
    local l_UIStroke_0 = Instance.new("UIStroke");
    l_UIStroke_0.Thickness = l_DefaultRadiusThickness_0;
    l_UIStroke_0.Parent = l_Frame_0;
    local l_Frame_1 = Instance.new("Frame");
    l_Frame_1.AnchorPoint = Vector2.new(0.5, 0.5);
    l_Frame_1.BackgroundTransparency = 1;
    l_Frame_1.Parent = l_ScreenGui_0;
    local l_UICorner_1 = Instance.new("UICorner");
    l_UICorner_1.Parent = l_Frame_1;
    local l_UIStroke_1 = Instance.new("UIStroke");
    l_UIStroke_1.Thickness = l_DefaultInnerRadiusThickness_0;
    l_UIStroke_1.Parent = l_Frame_1;
    l_ScreenGui_0.Parent = l_CoreGui_0;
    v7.render = function(_, v16) --[[ Line: 49 ]] --[[ Name: render ]]
        -- upvalues: l_Frame_0 (copy), l_UICorner_0 (copy), l_FalloffCursorAdjustment_0 (ref), l_Frame_1 (copy), l_UICorner_1 (copy), l_UIStroke_0 (copy), l_UIStroke_1 (copy)
        local l_CurrRadius_0 = v16.CurrRadius;
        local l_Mouse_0 = v16.Mouse;
        l_Frame_0.Position = UDim2.fromOffset(l_Mouse_0.X, l_Mouse_0.Y);
        l_Frame_0.Size = UDim2.fromOffset(l_CurrRadius_0, l_CurrRadius_0);
        l_UICorner_0.CornerRadius = UDim.new(l_CurrRadius_0 / 2, l_CurrRadius_0 / 2);
        local v19 = math.max(v16.CurrRadius - v16.CurrFalloff * l_FalloffCursorAdjustment_0, 0);
        l_Frame_1.Position = UDim2.fromOffset(l_Mouse_0.X, l_Mouse_0.Y);
        l_Frame_1.Size = UDim2.fromOffset(v19, v19);
        l_UICorner_1.CornerRadius = UDim.new(v19 / 2, v19 / 2);
        if v16.Shown then
            l_UIStroke_0.Transparency = 0;
            l_UIStroke_1.Transparency = 0;
            return;
        else
            l_UIStroke_0.Transparency = 1;
            l_UIStroke_1.Transparency = 1;
            return;
        end;
    end;
    v7.cleanup = function(_) --[[ Line: 72 ]] --[[ Name: cleanup ]]
        -- upvalues: l_ScreenGui_0 (ref)
        if l_ScreenGui_0 then
            l_ScreenGui_0:Destroy();
            l_ScreenGui_0 = nil;
        end;
    end;
    return v7;
end;
return v3;