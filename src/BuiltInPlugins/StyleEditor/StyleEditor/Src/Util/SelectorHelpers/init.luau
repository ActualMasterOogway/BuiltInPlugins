local l_StylingService_0 = game:GetService("StylingService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_createStyleLink_0 = require(l_Parent_0.Packages.Framework).Styling.createStyleLink;
local v3 = require(l_Parent_0.Src.Util.MenuHelpers);
local v4 = require(l_Parent_0.Src.Enums.InstancesHaveVariant);
local l_mapOne_0 = require(l_Parent_0.Packages.Dash).mapOne;
local v6 = {
    SelectorSyntax = {
        Blank = "", 
        Child = ">", 
        Descendant = ">>", 
        GuiStateModifier = ":", 
        Name = "#", 
        PseudoInstance = "::", 
        Tag = "."
    }
};
v6.isElement = function(v7) --[[ Line: 29 ]] --[[ Name: isElement ]]
    -- upvalues: l_mapOne_0 (copy), v3 (copy), v6 (copy)
    return l_mapOne_0(v3.Classes, function(v8) --[[ Line: 30 ]]
        -- upvalues: v7 (ref), v6 (ref)
        v7 = v7:gsub("%s+", "");
        local v9, v10 = v7:find(v8);
        if v9 then
            if v9 == 1 then
                return v8;
            elseif v7:sub(math.max(v9 - #v6.SelectorSyntax.Child, 1), v10) == v6.SelectorSyntax.Child .. v8 then
                return v8;
            elseif v7:sub(math.max(v9 - #v6.SelectorSyntax.Descendant, 1), v10) == v6.SelectorSyntax.Descendant .. v8 then
                return v8;
            end;
        end;
        return nil;
    end);
end;
v6.findFirstClassSelector = function(v11) --[[ Line: 59 ]] --[[ Name: findFirstClassSelector ]]
    -- upvalues: v6 (copy)
    if not v11 or not v11:IsA("StyleRule") then
        return "";
    else
        local v12 = false;
        if v11 ~= nil then
            v12 = v11:IsA("StyleRule");
        end;
        assert(v12, "style cannot be nil");
        local v13 = v6.getSelectorChain(v11);
        if v13 and v13.Class ~= "" then
            return v13.Class;
        else
            return "";
        end;
    end;
end;
v6.getSelectorChain = function(v14) --[[ Line: 73 ]] --[[ Name: getSelectorChain ]]
    if v14 == nil or not v14:IsA("StyleRule") then
        return nil;
    else
        local l_status_0, l_result_0 = pcall(function() --[[ Line: 77 ]]
            -- upvalues: v14 (copy)
            return game:GetService("StylingService"):GetStyleInfo(v14).SelectorChains;
        end);
        if l_status_0 then
            local v17 = #l_result_0[1];
            return l_result_0[1][v17];
        else
            return nil;
        end;
    end;
end;
v6.instancesHaveVariant = function(v18, v19) --[[ Line: 89 ]] --[[ Name: instancesHaveVariant ]]
    -- upvalues: v4 (copy), l_StylingService_0 (copy)
    if v18 == nil or #v18 == 0 then
        return v4.None;
    else
        local v20 = 0;
        for _, v22 in pairs(v18) do
            local l_status_1, l_result_1 = pcall(function() --[[ Line: 97 ]]
                -- upvalues: l_StylingService_0 (ref), v22 (copy)
                return l_StylingService_0:GetAppliedStyles(v22);
            end);
            if l_status_1 then
                for _, v26 in pairs(l_result_1) do
                    if v26.Instance == v19 then
                        v20 = v20 + 1;
                        break;
                    end;
                end;
            end;
        end;
        if #v18 <= v20 then
            return v4.All;
        elseif v20 <= 0 then
            return v4.None;
        else
            return v4.Mixed;
        end;
    end;
end;
v6.ruleHasTags = function(v27) --[[ Line: 122 ]] --[[ Name: ruleHasTags ]]
    -- upvalues: v6 (copy)
    if v27 == nil then
        return false;
    else
        local v28 = v6.getSelectorChain(v27);
        if v28 and #v28.Tags > 0 then
            return true;
        else
            return false;
        end;
    end;
end;
v6.canApplyVariant = function(v29, v30) --[[ Line: 136 ]] --[[ Name: canApplyVariant ]]
    -- upvalues: v6 (copy)
    if v29 == nil or v30 == nil or #v30 == 0 then
        return false;
    else
        local v31 = v6.getSelectorChain(v29);
        if not v31 then
            return false;
        elseif v31.Name and v31.Name ~= "" then
            return false;
        elseif not v31.Class or v31.Class == "" then
            return true;
        else
            for _, v33 in pairs(v30) do
                if v31.Class ~= v33.ClassName then
                    return false;
                end;
            end;
            return true;
        end;
    end;
end;
v6.applyVariant = function(v34, v35) --[[ Line: 165 ]] --[[ Name: applyVariant ]]
    -- upvalues: v6 (copy)
    if v34 == nil or v35 == nil then
        return;
    else
        local v36 = v6.getSelectorChain(v34);
        if v36 == nil then
            return;
        else
            for _, v38 in v36.Tags do
                v35:AddTag(v38);
            end;
            return;
        end;
    end;
end;
v6.removeVariant = function(v39, v40) --[[ Line: 180 ]] --[[ Name: removeVariant ]]
    -- upvalues: v6 (copy)
    if v39 == nil or v40 == nil then
        return;
    else
        local v41 = v6.getSelectorChain(v39);
        if v41 == nil then
            return;
        else
            for _, v43 in v41.Tags do
                v40:RemoveTag(v43);
            end;
            return;
        end;
    end;
end;
v6.getStyleLinkRoot = function(v44) --[[ Line: 195 ]] --[[ Name: getStyleLinkRoot ]]
    for _, v46 in {
        "ScreenGui", 
        "SurfaceGui", 
        "BillboardGui", 
        "StarterGui", 
        "Workspace", 
        "PluginGuiService"
    } do
        if v44:IsA(v46) then
            return v44;
        else
            local l_v44_FirstAncestorWhichIsA_0 = v44:FindFirstAncestorWhichIsA(v46);
            if l_v44_FirstAncestorWhichIsA_0 then
                return l_v44_FirstAncestorWhichIsA_0;
            end;
        end;
    end;
    return nil;
end;
v6.addStyleLinkToRoot = function(v48, v49) --[[ Line: 218 ]] --[[ Name: addStyleLinkToRoot ]]
    -- upvalues: v6 (copy), l_createStyleLink_0 (copy)
    if not v48 or not v49 then
        return nil;
    elseif v49:IsA("StyleRule") then
        return v6.addStyleLinkToRoot(v48, v49:FindFirstAncestorWhichIsA("StyleSheet"));
    elseif not v49:IsA("StyleSheet") then
        return nil;
    else
        local v50 = v6.getStyleLinkRoot(v48);
        if v50 and not v50:FindFirstChildWhichIsA("StyleLink") and v49 then
            return l_createStyleLink_0(v50, v49);
        else
            return nil;
        end;
    end;
end;
return v6;