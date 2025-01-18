local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_script_FirstAncestor_0.Src.Util.flatten);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerClothingTypeIcons);
local v11 = {};
local function v17(v12, v13) --[[ Line: 14 ]] --[[ Name: sameAttachments ]]
    local v14 = {};
    for _, v16 in v13 do
        table.insert(v14, {
            id = v16, 
            attachment = v12, 
            accessoryType = "rigid"
        });
    end;
    return v14;
end;
local function _(v18) --[[ Line: 28 ]] --[[ Name: createBuiltinItemFromIdWithAttachment ]]
    return function(v19) --[[ Line: 29 ]]
        -- upvalues: v18 (copy)
        return {
            id = v19, 
            attachment = v18, 
            accessoryType = "rigid"
        };
    end;
end;
local function _(v21) --[[ Line: 38 ]] --[[ Name: layered ]]
    v21.accessoryType = "layered";
    return v21;
end;
local function v27(v23) --[[ Line: 43 ]] --[[ Name: allLayered ]]
    local v24 = {};
    for _, v26 in v23 do
        table.insert(v24, {
            id = v26, 
            accessoryType = "layered"
        });
    end;
    return v24;
end;
if v10() then
    local v28 = "HairAttachment";
    local l_v28_0 = v28 --[[ copy: 10 -> 31 ]];
    local function v31(v30) --[[ Line: 29 ]]
        -- upvalues: l_v28_0 (copy)
        return {
            id = v30, 
            attachment = l_v28_0, 
            accessoryType = "rigid"
        };
    end;
    v28 = {};
    local v32 = v31(13902886383);
    local v33 = v31(11195420056);
    v33.accessoryType = "layered";
    local l_v33_0 = v33;
    v33 = v31(10966682388);
    local v35 = v31(846803597);
    local v36 = v31(9244114211);
    v36.accessoryType = "layered";
    local l_v36_0 = v36;
    local v38 = v31(7193451306);
    v38.accessoryType = "layered";
    v36 = v38;
    local v39 = v31(7193386173);
    v39.accessoryType = "layered";
    v38 = v39;
    local v40 = v31(7193452166);
    v40.accessoryType = "layered";
    v39 = v40;
    v6(v28, 1, v32, l_v33_0, v33, v35, l_v36_0, v36, v38, v39);
    v11.hair = v28;
else
    v11.hair = v17("HairAttachment", {
        13902886383, 
        11195420056, 
        10966682388, 
        846803597, 
        9244114211, 
        7193451306, 
        7193386173, 
        7193452166
    });
end;
v11.head = v17("HatAttachment", {
    9111390490, 
    16018338042, 
    1744330435, 
    3757852497
});
local v41 = "FaceCenterAttachment";
local l_v41_0 = v41 --[[ copy: 10 -> 23 ]];
local function v44(v43) --[[ Line: 29 ]]
    -- upvalues: l_v41_0 (copy)
    return {
        id = v43, 
        attachment = l_v41_0, 
        accessoryType = "rigid"
    };
end;
local v45 = "FaceFrontAttachment";
local l_v45_0 = v45 --[[ copy: 11 -> 24 ]];
v41 = function(v47) --[[ Line: 29 ]]
    -- upvalues: l_v45_0 (copy)
    return {
        id = v47, 
        attachment = l_v45_0, 
        accessoryType = "rigid"
    };
end;
if v10() then
    v45 = {};
    local v48 = v41(16640910727);
    local v49 = v41(16648934240);
    local v50 = v41(9992285857);
    local v51 = v41(14179786408);
    local v52 = v41(12794788453);
    v52.accessoryType = "layered";
    local l_v52_0 = v52;
    local v54 = v41(12796340774);
    v54.accessoryType = "layered";
    v52 = v54;
    local v55 = v41(12794916165);
    v55.accessoryType = "layered";
    v54 = v55;
    local v56 = v41(12796163960);
    v56.accessoryType = "layered";
    v55 = v56;
    v56 = v44(16648984941);
    local v57 = v44(16649071525);
    local v58 = v44(13538969595);
    v6(v45, 1, v48, v49, v50, v51, l_v52_0, v52, v54, v55, v56, v57, v58, v44(16648586095));
    v11.face = v45;
else
    v11.face = {
        v41(16640910727), 
        v41(16648934240), 
        v41(9992285857), 
        v41(14179786408), 
        v41(12794788453), 
        v41(12796340774), 
        v41(12794916165), 
        v41(12796163960), 
        v44(16648984941), 
        v44(16649071525), 
        v44(13538969595), 
        v44(16648586095)
    };
end;
v11.front = v17("BodyFrontAttachment", {
    16648690355, 
    16648652231, 
    16648706823, 
    16648698037
});
v11.neck = v17("NeckAttachment", {
    16648958003, 
    16648625265, 
    3690490960, 
    15696295454
});
local v59 = "LeftCollarAttachment";
local l_v59_0 = v59 --[[ copy: 12 -> 25 ]];
v45 = function(v61) --[[ Line: 29 ]]
    -- upvalues: l_v59_0 (copy)
    return {
        id = v61, 
        attachment = l_v59_0, 
        accessoryType = "rigid"
    };
end;
local v62 = "RightCollarAttachment";
local l_v62_0 = v62 --[[ copy: 13 -> 26 ]];
v59 = function(v64) --[[ Line: 29 ]]
    -- upvalues: l_v62_0 (copy)
    return {
        id = v64, 
        attachment = l_v62_0, 
        accessoryType = "rigid"
    };
end;
local v65 = "LeftShoulderAttachment";
local l_v65_0 = v65 --[[ copy: 14 -> 27 ]];
v62 = function(v67) --[[ Line: 29 ]]
    -- upvalues: l_v65_0 (copy)
    return {
        id = v67, 
        attachment = l_v65_0, 
        accessoryType = "rigid"
    };
end;
local v68 = "RightShoulderAttachment";
local l_v68_0 = v68 --[[ copy: 15 -> 28 ]];
v65 = function(v70) --[[ Line: 29 ]]
    -- upvalues: l_v68_0 (copy)
    return {
        id = v70, 
        attachment = l_v68_0, 
        accessoryType = "rigid"
    };
end;
v11.shoulder = {
    v62(16648897492), 
    v65(16648905400), 
    v62(16648604510), 
    v65(16648615805), 
    v62(16649028183), 
    v65(16649036767), 
    v62(9175325868), 
    v65(9175327271), 
    v45(16648502798), 
    v59(16648553830), 
    v45(16648441318), 
    v59(16648488869), 
    v45(16648993618), 
    v59(16649003855), 
    v45(16648866296), 
    v59(16648873760)
};
v11.back = v17("BodyBackAttachment", {
    9111378574, 
    11774181392, 
    10685856744, 
    9175323644
});
local v71 = "WaistBackAttachment";
local l_v71_0 = v71 --[[ copy: 16 -> 29 ]];
v68 = function(v73) --[[ Line: 29 ]]
    -- upvalues: l_v71_0 (copy)
    return {
        id = v73, 
        attachment = l_v71_0, 
        accessoryType = "rigid"
    };
end;
local v74 = "WaistCenterAttachment";
local l_v74_0 = v74 --[[ copy: 17 -> 30 ]];
v71 = function(v76) --[[ Line: 29 ]]
    -- upvalues: l_v74_0 (copy)
    return {
        id = v76, 
        attachment = l_v74_0, 
        accessoryType = "rigid"
    };
end;
local v77 = "WaistFrontAttachment";
v74 = function(v78) --[[ Line: 29 ]]
    -- upvalues: v77 (copy)
    return {
        id = v78, 
        attachment = v77, 
        accessoryType = "rigid"
    };
end;
v11.waist = {
    v74(16648852016), 
    v74(16648681897), 
    v74(7065897530), 
    v74(6494274794), 
    v71(16648672949), 
    v71(16649078388), 
    v71(8697885688), 
    v71(3230476122), 
    v68(10616839810), 
    v68(13902900757), 
    v68(13207223896), 
    v68(4707869391)
};
if v10() then
    v11.shirts = v27({
        7178736794, 
        7178735702, 
        6984729814, 
        7178740556, 
        9620950227, 
        9620976296
    });
    v11.tshirts = v27({
        9112474888, 
        7178736794, 
        7178737816
    });
    v11.jackets = v27({
        6984765766, 
        6984767443, 
        7272485361, 
        7192535654, 
        7192544729
    });
    v11.sweaters = v27({
        9240758221, 
        9913119150, 
        9913110927, 
        9174379982, 
        6984769289, 
        6984771334, 
        9240757332, 
        9274353324
    });
    v11.pants = v27({
        6984763785, 
        6984740059, 
        7192673981, 
        7192681239, 
        7192679765
    });
    v11.shorts = v27({
        6984773235, 
        7192683061, 
        7192685245
    });
    v11.skirts = v27({
        7192691582, 
        7192690731, 
        9284466791, 
        10278865927, 
        7192695838
    });
    v11.shoes = v27({
        8722031289, 
        7193170137, 
        7193104827
    });
    v11.eyebrows = v27({
        11572097774
    });
    v11.eyelashes = v27({
        11572100557
    });
    v11.allItems = v9(v11.hair, v11.head, v11.face, v11.front, v11.neck, v11.shoulder, v11.back, v11.waist, v11.shirts, v11.tshirts, v11.jackets, v11.sweaters, v11.pants, v11.shorts, v11.skirts, v11.shoes, v11.eyebrows, v11.eyelashes);
    return v11;
else
    v11.allItems = v9(v11.hair, v11.head, v11.face, v11.front, v11.neck, v11.shoulder, v11.back, v11.waist);
    return v11;
end;