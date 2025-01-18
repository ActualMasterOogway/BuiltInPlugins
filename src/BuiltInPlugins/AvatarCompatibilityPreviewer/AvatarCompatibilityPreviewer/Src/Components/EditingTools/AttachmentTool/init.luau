local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.ViewportToolingFramework);
local v3 = require(l_script_FirstAncestor_0.Src.Components.AvatarScreenContext);
local v4 = require(l_script_FirstAncestor_0.Src.Util.DEPRECATED_AvatarScreenContext);
local v5 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool);
local _ = require(l_script_FirstAncestor_0.Src.Components.EditingTools.BodyPointsTool.Types);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v9 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.findPaletteKeyForAttachmentName);
local v10 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAvatarPreviewerSkinToneAlphaDetection);
local function v39(v11) --[[ Line: 18 ]] --[[ Name: usePoints ]]
    -- upvalues: v1 (copy), v10 (copy), v3 (copy), v4 (copy), v7 (copy), v9 (copy)
    local v12 = v1.useContext(if v10() then v3.Context else v4);
    local v13 = {};
    assert(v1.useRef({}).current ~= nil, v7.LUAU_ANALYZE_ERROR);
    local function v26(v14) --[[ Line: 30 ]] --[[ Name: createPointFromPath ]]
        -- upvalues: v11 (copy), v7 (ref), v9 (ref), v12 (copy)
        local l_v11_0 = v11;
        for _, v17 in v14 do
            l_v11_0 = l_v11_0:FindFirstChild(v17);
            if l_v11_0 == nil then
                return nil;
            end;
        end;
        if not l_v11_0:IsA("Attachment") then
            return nil;
        else
            assert(l_v11_0:IsA("Attachment"), v7.LUAU_ANALYZE_ERROR);
            return {
                name = l_v11_0.Name, 
                limb = l_v11_0.Parent, 
                getCFrame = function() --[[ Line: 48 ]] --[[ Name: getCFrame ]]
                    -- upvalues: v11 (ref), l_v11_0 (ref)
                    return v11.PrimaryPart.CFrame:ToObjectSpace(l_v11_0.WorldCFrame);
                end, 
                onChange = function(v18) --[[ Line: 52 ]] --[[ Name: onChange ]]
                    -- upvalues: l_v11_0 (ref), v11 (ref), v7 (ref)
                    l_v11_0.WorldCFrame = v11.PrimaryPart.CFrame:ToWorldSpace(v18);
                    local l_l_v11_0_FirstChild_0 = l_v11_0:FindFirstChild(v7.ORIGINAL_POSITION_VALUE);
                    if l_l_v11_0_FirstChild_0 ~= nil and l_l_v11_0_FirstChild_0:IsA("Vector3Value") then
                        l_l_v11_0_FirstChild_0.Value = l_v11_0.Position;
                    end;
                end, 
                onSelect = function() --[[ Line: 61 ]] --[[ Name: onSelect ]]
                    -- upvalues: v9 (ref), l_v11_0 (ref), v12 (ref)
                    local v20 = v9(l_v11_0.Name);
                    if v20 ~= nil then
                        v12.openPalette(v20);
                        v12.setFocusedAttachments(function(v21) --[[ Line: 65 ]]
                            -- upvalues: l_v11_0 (ref)
                            v21 = table.clone(v21);
                            table.insert(v21, l_v11_0.Name);
                            return v21;
                        end);
                    end;
                end, 
                onUnselect = function() --[[ Line: 73 ]] --[[ Name: onUnselect ]]
                    -- upvalues: v12 (ref), l_v11_0 (ref), v7 (ref)
                    v12.setFocusedAttachments(function(v22) --[[ Line: 74 ]]
                        -- upvalues: l_v11_0 (ref), v7 (ref)
                        local v23 = table.find(v22, l_v11_0.Name);
                        if v23 == nil then
                            return v22;
                        else
                            assert(v23 ~= nil, v7.LUAU_ANALYZE_ERROR);
                            v22 = table.clone(v22);
                            table.remove(v22, v23);
                            return v22;
                        end;
                    end);
                end, 
                connectChanged = function(v24) --[[ Line: 87 ]] --[[ Name: connectChanged ]]
                    -- upvalues: l_v11_0 (ref)
                    local v25 = l_v11_0:GetPropertyChangedSignal("CFrame"):Connect(v24);
                    return function() --[[ Line: 90 ]]
                        -- upvalues: v25 (copy)
                        v25:Disconnect();
                    end;
                end
            };
        end;
    end;
    local function _(v27, v28) --[[ Line: 97 ]] --[[ Name: addPoint ]]
        -- upvalues: v26 (copy), v7 (ref), v13 (copy)
        local v29 = v26(v27);
        if v29 == nil then
            return;
        else
            assert(v29 ~= nil, v7.LUAU_ANALYZE_ERROR);
            if v28 ~= nil then
                local v30 = v26(v28);
                if v30 ~= nil then
                    v30.symmetricalPartner = v29.name;
                    table.insert(v13, v30);
                    v29.symmetricalPartner = v30.name;
                end;
            end;
            table.insert(v13, v29);
            return;
        end;
    end;
    local v32 = v26({
        "Head", 
        "HatAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    v32 = v26({
        "Head", 
        "HairAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    v32 = v26({
        "Head", 
        "FaceCenterAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    v32 = v26({
        "Head", 
        "FaceFrontAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    v32 = v26({
        "UpperTorso", 
        "BodyFrontAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    v32 = v26({
        "UpperTorso", 
        "BodyBackAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    v32 = v26({
        "UpperTorso", 
        "NeckAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    v32 = v26({
        "UpperTorso", 
        "WristRigAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    v32 = v26({
        "LowerTorso", 
        "WaistBackAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    v32 = v26({
        "LowerTorso", 
        "WaistCenterAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    v32 = v26({
        "LowerTorso", 
        "WaistFrontAttachment"
    });
    if v32 ~= nil then
        assert(v32 ~= nil, v7.LUAU_ANALYZE_ERROR);
        table.insert(v13, v32);
    end;
    local v33 = {
        "UpperTorso", 
        "LeftCollarAttachment"
    };
    v32 = {
        "UpperTorso", 
        "RightCollarAttachment"
    };
    local v34 = v26(v33);
    if v34 ~= nil then
        assert(v34 ~= nil, v7.LUAU_ANALYZE_ERROR);
        if v32 ~= nil then
            local v35 = v26(v32);
            if v35 ~= nil then
                v35.symmetricalPartner = v34.name;
                table.insert(v13, v35);
                v34.symmetricalPartner = v35.name;
            end;
        end;
        table.insert(v13, v34);
    end;
    v33 = {
        "LeftUpperArm", 
        "LeftShoulderAttachment"
    };
    v32 = {
        "RightUpperArm", 
        "RightShoulderAttachment"
    };
    v34 = v26(v33);
    if v34 ~= nil then
        assert(v34 ~= nil, v7.LUAU_ANALYZE_ERROR);
        if v32 ~= nil then
            local v36 = v26(v32);
            if v36 ~= nil then
                v36.symmetricalPartner = v34.name;
                table.insert(v13, v36);
                v34.symmetricalPartner = v36.name;
            end;
        end;
        table.insert(v13, v34);
    end;
    v33 = {
        "LeftHand", 
        "LeftGripAttachment"
    };
    v32 = {
        "RightHand", 
        "RightGripAttachment"
    };
    v34 = v26(v33);
    if v34 ~= nil then
        assert(v34 ~= nil, v7.LUAU_ANALYZE_ERROR);
        if v32 ~= nil then
            local v37 = v26(v32);
            if v37 ~= nil then
                v37.symmetricalPartner = v34.name;
                table.insert(v13, v37);
                v34.symmetricalPartner = v37.name;
            end;
        end;
        table.insert(v13, v34);
    end;
    v33 = {
        "LeftFoot", 
        "LeftFootAttachment"
    };
    v32 = {
        "RightFoot", 
        "RightFootAttachment"
    };
    v34 = v26(v33);
    if v34 == nil then
        return v13;
    else
        assert(v34 ~= nil, v7.LUAU_ANALYZE_ERROR);
        if v32 ~= nil then
            local v38 = v26(v32);
            if v38 ~= nil then
                v38.symmetricalPartner = v34.name;
                table.insert(v13, v38);
                v34.symmetricalPartner = v38.name;
            end;
        end;
        table.insert(v13, v34);
        return v13;
    end;
end;
return function(v40) --[[ Line: 138 ]] --[[ Name: AttachmentTool ]]
    -- upvalues: v39 (copy), v1 (copy), v5 (copy)
    local v41 = v39(v40.worldModel);
    return v1.createElement(v5, {
        name = "AttachmentTool", 
        worldModel = v40.worldModel, 
        points = v41, 
        generallyEquivalentPointNames = {
            {
                "HairAttachment", 
                "HatAttachment"
            }
        }, 
        additionalToolbarItems = v40.additionalToolbarItems
    });
end;