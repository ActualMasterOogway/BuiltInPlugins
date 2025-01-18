local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v3 = require(l_script_FirstAncestor_0.Src.Util.EquipmentStateContext);
local v4 = require(l_script_FirstAncestor_0.Src.Util.OriginalLimbContext);
local v5 = require(l_script_FirstAncestor_0.Src.Util.filterDescendants);
local v6 = {
    HeadBodyPart = {
        "Head"
    }, 
    Torso = {
        "UpperTorso", 
        "LowerTorso"
    }, 
    LeftArm = {
        "LeftUpperArm", 
        "LeftLowerArm", 
        "LeftHand"
    }, 
    RightArm = {
        "RightUpperArm", 
        "RightLowerArm", 
        "RightHand"
    }, 
    LeftLeg = {
        "LeftUpperLeg", 
        "LeftLowerLeg", 
        "LeftFoot"
    }, 
    RightLeg = {
        "RightUpperLeg", 
        "RightLowerLeg", 
        "RightFoot"
    }
};
return function(v7, v8) --[[ Line: 21 ]] --[[ Name: useBodyPartsFromBase ]]
    -- upvalues: v1 (copy), v3 (copy), v4 (copy), v6 (copy), v5 (copy)
    local v9 = v1.useContext(v3);
    local v10 = v1.useContext(v4);
    v1.useEffect(function() --[[ Line: 25 ]]
        -- upvalues: v7 (copy), v9 (copy), v6 (ref), v10 (copy), v8 (copy), v5 (ref)
        if v7 == nil then
            return;
        else
            assert(v7 ~= nil, "Luau");
            local v11 = {};
            for _, v13 in v9.equippedItems do
                v11[v13.palette.Key] = true;
            end;
            for v14, v15 in v6 do
                if not v11[v14] then
                    for _, v17 in v15 do
                        if not v10.isLimbOriginal(v7:FindFirstChild(v17)) then
                            local l_v8_FirstChild_0 = v8:FindFirstChild(v17);
                            if l_v8_FirstChild_0 ~= nil and l_v8_FirstChild_0:IsA("BasePart") then
                                assert(l_v8_FirstChild_0:IsA("BasePart"), "Luau");
                                local v19 = l_v8_FirstChild_0:Clone();
                                v5(v19);
                                v7.Humanoid:ReplaceBodyPartR15(Enum.BodyPartR15[v17], v19);
                            end;
                        end;
                    end;
                end;
            end;
            return;
        end;
    end, {
        v7, 
        v8, 
        v9.equippedItems
    });
end;