local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSafeCharaterEncoding);
local v4 = {};
local function _(v5) --[[ Line: 21 ]] --[[ Name: scalingInfo ]]
    return v5;
end;
v4.types = {
    Classic = {
        BodyTypeScale = 0, 
        BodyProportionScale = 0, 
        GuessMaxHeight = 5.25
    }, 
    ProportionsSlender = {
        BodyTypeScale = 1, 
        BodyProportionScale = 1, 
        GuessMaxHeight = 5.625
    }, 
    ProportionsNormal = {
        BodyTypeScale = 1, 
        BodyProportionScale = 0, 
        GuessMaxHeight = 1e999
    }
};
v4.allAvatarPartScaleTypeValueObjects = function(v7) --[[ Line: 48 ]] --[[ Name: allAvatarPartScaleTypeValueObjects ]]
    -- upvalues: v1 (copy), v3 (copy)
    local v8 = {};
    for _, v10 in v1.LIMBS do
        local l_v7_FirstChild_0 = v7:FindFirstChild(v10);
        if v3() then
            if l_v7_FirstChild_0 == nil then
                continue;
            end;
        else
            assert(l_v7_FirstChild_0 ~= nil, "Avatar must have all limbs");
        end;
        local l_AvatarPartScaleType_0 = l_v7_FirstChild_0:FindFirstChild("AvatarPartScaleType");
        if l_AvatarPartScaleType_0 ~= nil and l_AvatarPartScaleType_0:IsA("StringValue") then
            local v13 = false;
            if l_AvatarPartScaleType_0 ~= nil then
                v13 = l_AvatarPartScaleType_0:IsA("StringValue");
            end;
            assert(v13, v1.LUAU_ANALYZE_ERROR);
            table.insert(v8, l_AvatarPartScaleType_0);
        end;
    end;
    return v8;
end;
v4.computeAvatarPartScaleType = function(v14) --[[ Line: 73 ]] --[[ Name: computeAvatarPartScaleType ]]
    local v15 = nil;
    for _, v17 in v14 do
        if v17 == "ProportionsNormal" or v17 == "ProportionsSlender" or v17 == "Classic" then
            if v15 == nil then
                v15 = v17;
            elseif v15 ~= v17 then
                v15 = "Mixed";
            end;
        else
            v15 = "Mixed";
        end;
    end;
    if v15 == nil then
        return "ProportionsNormal";
    else
        return v15;
    end;
end;
v4.getAvatarPartScaleType = function(v18) --[[ Line: 95 ]] --[[ Name: getAvatarPartScaleType ]]
    local l_AvatarPartScaleType_1 = v18:FindFirstChild("AvatarPartScaleType");
    if not l_AvatarPartScaleType_1 then
        return nil;
    elseif not l_AvatarPartScaleType_1:IsA("StringValue") then
        return nil;
    else
        return l_AvatarPartScaleType_1.Value;
    end;
end;
v4.setAvatarPartScaleTypeValueObjects = function(v20, v21) --[[ Line: 107 ]] --[[ Name: setAvatarPartScaleTypeValueObjects ]]
    -- upvalues: v1 (copy), v3 (copy)
    for _, v23 in v1.LIMBS do
        local l_v20_FirstChild_0 = v20:FindFirstChild(v23);
        if v3() then
            if l_v20_FirstChild_0 == nil then
                continue;
            end;
        else
            assert(l_v20_FirstChild_0 ~= nil, "Avatar must have all limbs");
        end;
        local l_AvatarPartScaleType_2 = l_v20_FirstChild_0:FindFirstChild("AvatarPartScaleType");
        if l_AvatarPartScaleType_2 == nil then
            local l_StringValue_0 = Instance.new("StringValue");
            l_StringValue_0.Name = "AvatarPartScaleType";
            l_StringValue_0.Value = v21;
            l_StringValue_0.Parent = l_v20_FirstChild_0;
        elseif l_AvatarPartScaleType_2:IsA("StringValue") then
            local v27 = false;
            if l_AvatarPartScaleType_2 ~= nil then
                v27 = l_AvatarPartScaleType_2:IsA("StringValue");
            end;
            assert(v27, v1.LUAU_ANALYZE_ERROR);
            l_AvatarPartScaleType_2.Value = v21;
        end;
    end;
end;
return v4;