local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Src.Util.AvatarScalingTypes);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Packages.Dash);
local v4 = require(l_script_FirstAncestor_0.Src.Util.HumanoidValueUtil);
local v5 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerUseAnyModel);
local v6 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagHumanoidModelScalingFix);
return function(v7, v8) --[[ Line: 11 ]] --[[ Name: guessProportions ]]
    -- upvalues: v3 (copy), v1 (copy), v5 (copy), v6 (copy), v4 (copy)
    local v9 = v3.keys(v1.types);
    table.sort(v9, function(v10, v11) --[[ Line: 13 ]]
        -- upvalues: v1 (ref)
        return v1.types[v10].GuessMaxHeight < v1.types[v11].GuessMaxHeight;
    end);
    local v12 = nil;
    local v13 = nil;
    if v5() then
        local _, v15 = v7:GetBoundingBox();
        local v16 = v15.Y / v7:GetScale();
        for _, v18 in v9 do
            local v19 = v1.types[v18];
            if v16 < v19.GuessMaxHeight then
                v12 = v18;
                v13 = v19;
                break;
            end;
        end;
    else
        assert(v8 ~= nil, "No reference mesh provided");
        for _, v21 in v9 do
            local v22 = v1.types[v21];
            if v8.ExtentsSize.Y < v22.GuessMaxHeight then
                v12 = v21;
                v13 = v22;
                break;
            end;
        end;
    end;
    assert(v13 ~= nil, "No scaling type info chosen");
    v1.setAvatarPartScaleTypeValueObjects(v7, v12);
    if v5() then
        if v6() then
            v4.setBodyProportionScale(v7.Humanoid, v13.BodyProportionScale);
            v4.setBodyTypeScale(v7.Humanoid, v13.BodyTypeScale);
            return;
        else
            v4.setBodyProportionScale(v7.Humanoid, v13.BodyProportionScale * v7:GetScale());
            v4.setBodyTypeScale(v7.Humanoid, v13.BodyTypeScale * v7:GetScale());
            return;
        end;
    else
        local l_BodyTypeScale_0 = v7.Humanoid:FindFirstChild("BodyTypeScale");
        local v24 = false;
        if l_BodyTypeScale_0 ~= nil then
            v24 = l_BodyTypeScale_0:IsA("NumberValue");
        end;
        assert(v24, "Couldn't find BodyTypeScale");
        l_BodyTypeScale_0.Value = v13.BodyTypeScale;
        local l_BodyProportionScale_0 = v7.Humanoid:FindFirstChild("BodyProportionScale");
        local v26 = false;
        if l_BodyProportionScale_0 ~= nil then
            v26 = l_BodyProportionScale_0:IsA("NumberValue");
        end;
        assert(v26, "Couldn't find BodyProportionScale");
        l_BodyProportionScale_0.Value = v13.BodyProportionScale;
        return;
    end;
end;