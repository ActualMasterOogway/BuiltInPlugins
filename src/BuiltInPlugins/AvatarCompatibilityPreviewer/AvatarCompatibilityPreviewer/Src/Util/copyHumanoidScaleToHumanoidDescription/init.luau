return function(v0, v1) --[[ Line: 4 ]] --[[ Name: copyHumanoidScaleToHumanoidDescription ]]
    local function _(v2, v3) --[[ Line: 8 ]] --[[ Name: copy ]]
        -- upvalues: v1 (copy), v0 (copy)
        local l_v1_FirstChild_0 = v1:FindFirstChild(v2);
        if l_v1_FirstChild_0 == nil or not l_v1_FirstChild_0:IsA("NumberValue") then
            return;
        else
            v0[v3] = l_v1_FirstChild_0.Value;
            return;
        end;
    end;
    local l_BodyDepthScale_0 = v1:FindFirstChild("BodyDepthScale");
    if l_BodyDepthScale_0 ~= nil and l_BodyDepthScale_0:IsA("NumberValue") then
        v0.DepthScale = l_BodyDepthScale_0.Value;
    end;
    l_BodyDepthScale_0 = v1:FindFirstChild("BodyHeightScale");
    if l_BodyDepthScale_0 ~= nil and l_BodyDepthScale_0:IsA("NumberValue") then
        v0.HeightScale = l_BodyDepthScale_0.Value;
    end;
    l_BodyDepthScale_0 = v1:FindFirstChild("BodyProportionScale");
    if l_BodyDepthScale_0 ~= nil and l_BodyDepthScale_0:IsA("NumberValue") then
        v0.ProportionScale = l_BodyDepthScale_0.Value;
    end;
    l_BodyDepthScale_0 = v1:FindFirstChild("BodyWidthScale");
    if l_BodyDepthScale_0 ~= nil and l_BodyDepthScale_0:IsA("NumberValue") then
        v0.WidthScale = l_BodyDepthScale_0.Value;
    end;
    l_BodyDepthScale_0 = v1:FindFirstChild("BodyTypeScale");
    if l_BodyDepthScale_0 ~= nil and l_BodyDepthScale_0:IsA("NumberValue") then
        v0.BodyTypeScale = l_BodyDepthScale_0.Value;
    end;
    l_BodyDepthScale_0 = v1:FindFirstChild("HeadScale");
    if l_BodyDepthScale_0 ~= nil then
        if not l_BodyDepthScale_0:IsA("NumberValue") then
            return;
        else
            v0.HeadScale = l_BodyDepthScale_0.Value;
        end;
    end;
end;