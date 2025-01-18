local l_Players_0 = game:GetService("Players");
local v1 = require(script.Parent.clearPrebakedDescriptionAnimations);
local v2 = game:DefineFastFlag("RigBuilderBlockyScalesFix", false);
local v3 = Color3.new(0.5, 0.5, 0.5);
local function _(v4) --[[ Line: 9 ]] --[[ Name: removeSkinTone ]]
    -- upvalues: v3 (copy)
    v4.HeadColor = v3;
    v4.LeftArmColor = v3;
    v4.LeftLegColor = v3;
    v4.RightArmColor = v3;
    v4.RightLegColor = v3;
    v4.TorsoColor = v3;
end;
return function(v6) --[[ Line: 18 ]]
    -- upvalues: v2 (copy), l_Players_0 (copy), v1 (copy), v3 (copy)
    local v7 = nil;
    if v2 then
        if v6 == 0 then
            v7 = Instance.new("HumanoidDescription");
            v7.BodyTypeScale = 0;
            v7.ProportionScale = 0;
        else
            v7 = l_Players_0:GetHumanoidDescriptionFromOutfitId(v6);
        end;
    else
        v7 = if v6 == 0 then Instance.new("HumanoidDescription") else l_Players_0:GetHumanoidDescriptionFromOutfitId(v6);
    end;
    v1(v7);
    local l_v7_0 = v7;
    l_v7_0.HeadColor = v3;
    l_v7_0.LeftArmColor = v3;
    l_v7_0.LeftLegColor = v3;
    l_v7_0.RightArmColor = v3;
    l_v7_0.RightLegColor = v3;
    l_v7_0.TorsoColor = v3;
    return v7;
end;