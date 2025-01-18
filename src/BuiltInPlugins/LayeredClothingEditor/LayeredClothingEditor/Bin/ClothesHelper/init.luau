local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent;
local l_ConfirmDialog_0 = require(l_Parent_0.Packages.AvatarToolsShared).Components.ConfirmDialog;
local l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 = game:GetFastFlag("FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds");
local v4 = require(l_Parent_0.Src.Util.ShowDialog);
local function _(v5, v6) --[[ Line: 17 ]] --[[ Name: endsWith ]]
    local v7 = true;
    if v6 ~= "" then
        v7 = v5:sub(-#v6) == v6;
    end;
    return v7;
end;
local function _(v9) --[[ Line: 21 ]] --[[ Name: fixAttachmentName ]]
    if not (v9.Name:sub(-10) == "Attachment") then
        v9.Name = tostring(v9.Name) .. "Attachment";
    end;
end;
local function v26(v11, v12) --[[ Line: 27 ]] --[[ Name: convertToAccessoryImpl ]]
    local v13 = 0;
    if not v11:IsA("Model") then
        table.insert(v12.IncorrectTypeError, v11.Name);
        return v13;
    else
        local v14 = {};
        for _, v16 in pairs(v11:GetDescendants()) do
            if v16:IsA("WrapLayer") then
                table.insert(v14, v16);
            end;
        end;
        if #v14 == 0 then
            table.insert(v12.NoWrapLayerError, v11.Name);
            return v13;
        else
            for _, v18 in ipairs(v14) do
                local l_Parent_1 = v18.Parent;
                if l_Parent_1 and l_Parent_1:IsA("MeshPart") then
                    local l_Accessory_0 = Instance.new("Accessory");
                    local v21 = string.lower(l_Parent_1.Name);
                    if string.match(v21, "left") then
                        l_Accessory_0.Name = v11.Name .. "_Left";
                    elseif string.match(v21, "right") then
                        l_Accessory_0.Name = v11.Name .. "_Right";
                    else
                        l_Accessory_0.Name = v11.Name;
                    end;
                    local v22 = l_Parent_1:Clone();
                    local v23 = 0;
                    for _, v25 in pairs(v22:GetDescendants()) do
                        if not v25:IsA("WrapLayer") and not v25:IsA("SurfaceAppearance") and not v25:IsA("Attachment") then
                            v25:Destroy();
                        end;
                        if v25:IsA("Attachment") then
                            v23 = v23 + 1;
                            if not (v25.Name:sub(-10) == "Attachment") then
                                v25.Name = tostring(v25.Name) .. "Attachment";
                            end;
                        end;
                    end;
                    v22.Name = "Handle";
                    v22.Parent = l_Accessory_0;
                    l_Accessory_0.Parent = v11.Parent;
                    if v23 == 0 then
                        table.insert(v12.NoAttachmentsError, l_Parent_1.Name);
                        l_Accessory_0:Destroy();
                    else
                        v13 = v13 + 1;
                    end;
                end;
            end;
            return v13;
        end;
    end;
end;
local function v31(v27) --[[ Line: 93 ]] --[[ Name: getErrorInstanceListString ]]
    if not v27 or #v27 == 0 then
        return "";
    else
        local v28 = ":\n";
        for v29, v30 in ipairs(v27) do
            v28 = v28 .. v30;
            if v29 ~= #v27 then
                v28 = v28 .. ",\n";
            end;
        end;
        return v28;
    end;
end;
local function v37(v32, v33, v34, v35) --[[ Line: 108 ]] --[[ Name: showErrorMessage ]]
    -- upvalues: v31 (copy), v4 (copy), l_ConfirmDialog_0 (copy)
    if not v35 or #v35 > 0 then
        local v36 = v31(v35);
        v4(v32, v33, l_ConfirmDialog_0, {
            Text = v34 .. v36, 
            Resizable = true
        });
    end;
end;
local function v48(v38, v39, v40) --[[ Line: 118 ]] --[[ Name: convertToAccessories ]]
    -- upvalues: l_Selection_0 (copy), v37 (copy), v26 (copy)
    local v41 = l_Selection_0:Get();
    if #v41 == 0 then
        v37(v38, v39, v39:getText("ClothesHelper", "NoSelectionError"));
        return;
    else
        local v42 = {
            NoAttachmentsError = {}, 
            NoWrapLayerError = {}, 
            IncorrectTypeError = {}
        };
        local v43 = 0;
        for _, v45 in ipairs(v41) do
            v43 = v43 + v26(v45, v42);
        end;
        v40:getHandler("CreateAccessory")(v43);
        for v46, v47 in pairs(v42) do
            v37(v38, v39, v39:getText("ClothesHelper", v46), v47);
        end;
        return;
    end;
end;
return {
    init = function(_, v50, v51, v52, v53) --[[ Line: 145 ]] --[[ Name: init ]]
        -- upvalues: l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 (copy), v48 (copy)
        local l_v51_Button_0 = v51:CreateButton(l_FixAvatarTabPluginsNotLoadingOnNonEnglishBuilds_0 and "CreateAccessory" or v52:getText("ClothesHelper", "CreateAccessory"), v52:getText("ClothesHelper", "CreateAccessoryTooltip"), "rbxlocaltheme://CreateAccessory");
        l_v51_Button_0.ClickableWhenViewportHidden = true;
        l_v51_Button_0.Click:connect(function() --[[ Line: 154 ]]
            -- upvalues: v48 (ref), v50 (copy), v52 (copy), v53 (copy)
            v48(v50, v52, v53);
        end);
    end
};