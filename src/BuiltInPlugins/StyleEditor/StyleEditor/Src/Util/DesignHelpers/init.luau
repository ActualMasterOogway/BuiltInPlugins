local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Framework);
local v5 = require(l_Parent_0.Src.Util.SelectorHelpers);
local v6 = require(l_Parent_0.Src.Util.recordChange)(l_ChangeHistoryService_0);
local v7 = require(l_Parent_0.Packages.Dash);
local l_includes_0 = v7.includes;
local l_startsWith_0 = v7.startsWith;
local l_insert_0 = table.insert;
local l_createStyleSheet_0 = v4.Styling.createStyleSheet;
local v19 = {
    PATHS = {
        DESIGN = {
            1
        }, 
        UI_ELEMENTS = {
            1, 
            1
        }, 
        THEMES = {
            3
        }, 
        SELECTOR = {
            1
        }
    }, 
    getSelectorCategory = function(v12) --[[ Line: 27 ]] --[[ Name: getSelectorCategory ]]
        -- upvalues: l_startsWith_0 (copy), v5 (copy)
        if l_startsWith_0(v12, ".") then
            return "Tags";
        elseif v5.isElement(v12) then
            return "UI Elements";
        else
            return "Other";
        end;
    end, 
    isUnderPath = function(v13, v14) --[[ Line: 37 ]] --[[ Name: isUnderPath ]]
        if #v14 > #v13 then
            return false;
        else
            for v15, v16 in v14 do
                if v16 ~= v13[v15] then
                    return false;
                end;
            end;
            return true;
        end;
    end, 
    isPartOfDesignSystem = function(v17) --[[ Line: 51 ]] --[[ Name: isPartOfDesignSystem ]]
        local v18 = if v17:IsA("StyleDerive") and v17.Parent then v17.Parent:GetAttribute("StyleCategory") else v17:GetAttribute("StyleCategory");
        return v18 and (v18 == "Themes" or v18 == "Tokens" or v18 == "Designs");
    end
};
v19.setAsToken = function(v20, v21) --[[ Line: 59 ]] --[[ Name: setAsToken ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), v19 (copy)
    local v22 = false;
    for _, v24 in l_ReplicatedStorage_0:GetDescendants() do
        local v25 = v19.isTheme(v24);
        if v24:IsA("StyleSheet") and v25 then
            v22 = true;
            v19.insertDerive(v24, v20);
        end;
    end;
    if v21 and not v22 then
        v19.insertDerive(v21, v20);
    end;
end;
v19.setAsTheme = function(v26, v27) --[[ Line: 76 ]] --[[ Name: setAsTheme ]]
    -- upvalues: l_ReplicatedStorage_0 (copy), l_includes_0 (copy), v19 (copy), l_insert_0 (copy)
    local l_v27_Derives_0 = v27:GetDerives();
    local v29 = {};
    for _, v31 in l_ReplicatedStorage_0:GetDescendants() do
        local l_v31_Attribute_0 = v31:GetAttribute("StyleCategory");
        if v31:IsA("StyleSheet") then
            if l_v31_Attribute_0 == "Tokens" then
                if l_includes_0(l_v27_Derives_0, v31) then
                    v19.removeDerive(v27, v31);
                end;
                v19.insertDerive(v26, v31);
            elseif l_v31_Attribute_0 == "Themes" and not v31.Parent:IsA("Folder") then
                l_insert_0(v29, v31);
            end;
        end;
    end;
    local v33 = if v26.Parent and v26.Parent:IsA("Folder") then v26.Parent else nil;
    local v34 = if v33 then v33:GetChildren() else v29;
    local v35 = false;
    for _, v37 in v34 do
        local l_v37_Attribute_0 = v37:GetAttribute("StyleCategory");
        if v37:IsA("StyleSheet") and l_v37_Attribute_0 ~= "Tokens" and l_v37_Attribute_0 ~= "Designs" and l_includes_0(l_v27_Derives_0, v37) then
            v35 = true;
            break;
        end;
    end;
    if not v35 then
        v19.insertDerive(v27, v26);
    end;
end;
v19.isTheme = function(v39) --[[ Line: 113 ]] --[[ Name: isTheme ]]
    if not v39 or not v39.Parent then
        return false;
    else
        assert(v39 ~= nil, "expecting valid stylesheet");
        if v39:GetAttribute("StyleCategory") == "Themes" then
            return true;
        else
            local l_Parent_1 = v39.Parent;
            if l_Parent_1:IsA("Folder") and l_Parent_1:GetAttribute("StyleCategory") == "Themes" then
                return true;
            else
                return false;
            end;
        end;
    end;
end;
v19.createDesign = function(v41) --[[ Line: 131 ]] --[[ Name: createDesign ]]
    -- upvalues: v6 (copy), l_createStyleSheet_0 (copy), l_ReplicatedStorage_0 (copy)
    local v42 = nil;
    v6({
        Name = "StyleEditor.Add Design", 
        DisplayName = "Style Editor - Add Design", 
        DoChange = function() --[[ Line: 137 ]] --[[ Name: DoChange ]]
            -- upvalues: v42 (ref), l_createStyleSheet_0 (ref), v41 (copy), l_ReplicatedStorage_0 (ref)
            v42 = l_createStyleSheet_0("StyleSheet");
            if not v41 or not v41.Parent then
                v42:SetAttribute("StyleCategory", "Designs");
                v42.Name = "Design";
            end;
            v42.Parent = l_ReplicatedStorage_0;
            return Enum.FinishRecordingOperation.Commit;
        end
    });
    return v42;
end;
v19.isValidDerive = function(v43, v44) --[[ Line: 150 ]] --[[ Name: isValidDerive ]]
    -- upvalues: l_StylingService_0 (copy), l_includes_0 (copy)
    local l_status_0, l_result_0 = pcall(function() --[[ Line: 156 ]]
        -- upvalues: l_StylingService_0 (ref), v44 (copy), v43 (copy), l_includes_0 (ref)
        local l_l_StylingService_0_StyleSheetDerivesChain_0 = l_StylingService_0:GetStyleSheetDerivesChain(v44);
        local l_v43_Derives_0 = v43:GetDerives();
        return not l_includes_0(l_l_StylingService_0_StyleSheetDerivesChain_0, v43) and not l_includes_0(l_v43_Derives_0, v44);
    end);
    if not l_status_0 or not l_result_0 then
        return false;
    else
        return true;
    end;
end;
v19.insertDerive = function(v49, v50) --[[ Line: 169 ]] --[[ Name: insertDerive ]]
    if not v49 or not v50 then
        return;
    else
        local l_StyleDerive_0 = Instance.new("StyleDerive");
        l_StyleDerive_0.Name = "Derive from " .. v50.Name;
        l_StyleDerive_0.Parent = v49;
        l_StyleDerive_0.StyleSheet = v50;
        return;
    end;
end;
v19.removeDerive = function(v52, v53) --[[ Line: 180 ]] --[[ Name: removeDerive ]]
    if not v52 or not v53 then
        return;
    else
        for _, v55 in v52:GetChildren() do
            if v55:IsA("StyleDerive") and v55.StyleSheet == v53 then
                v55:Remove();
            end;
        end;
        return;
    end;
end;
v19.replaceDerive = function(v56, v57, v58) --[[ Line: 192 ]] --[[ Name: replaceDerive ]]
    -- upvalues: v19 (copy)
    if not v56 or not v57 then
        return;
    else
        for _, v60 in v56:GetChildren() do
            if v60:IsA("StyleDerive") and v60.StyleSheet == v58 then
                v60.StyleSheet = v57;
                local v61, v62 = v60.Name:find(v58.Name);
                if v61 and v62 then
                    v60.Name = v60.Name:sub(1, v61 - 1) .. v57.Name .. v60.Name:sub(v62 + 1);
                end;
                return;
            end;
        end;
        v19.insertDerive(v56, v57);
        return;
    end;
end;
return v19;