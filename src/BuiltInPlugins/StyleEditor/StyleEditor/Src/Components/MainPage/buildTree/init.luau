local l_ReplicatedStorage_0 = game:GetService("ReplicatedStorage");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Util.DesignHelpers);
local v3 = require(l_Parent_0.Src.Util.MenuHelpers);
local v4 = require(l_Parent_0.Src.Util.StyleSchema);
local v5 = require(l_Parent_0.Src.Resources.ModernIcons);
local v6 = require(l_Parent_0.Src.Util.TreeTableHelpers);
local v7 = require(l_Parent_0.Packages.Dash);
local l_collectArray_0 = v7.collectArray;
local l_forEach_0 = v7.forEach;
local l_join_0 = v7.join;
local l_map_0 = v7.map;
local l_startsWith_0 = v7.startsWith;
local l_insert_0 = table.insert;
local l_Attribute_0 = require(l_Parent_0.Src.Resources.PluginStyles):GetAttribute("Icon16");
local function v15(v16) --[[ Line: 23 ]] --[[ Name: getChildrenStyleRules ]]
    -- upvalues: l_collectArray_0 (copy), v4 (copy), l_join_0 (copy), v3 (copy), v6 (copy), v15 (copy)
    if not v16 then
        return {};
    else
        return l_collectArray_0(v16:GetChildren(), function(_, v18) --[[ Line: 28 ]]
            -- upvalues: v4 (ref), l_join_0 (ref), v3 (ref), v6 (ref), v15 (ref)
            if not v18:IsA("StyleRule") then
                return nil;
            else
                local l_SelectorSchema_0 = v4.SelectorSchema;
                if v18.Selector == "" then
                    l_SelectorSchema_0 = l_join_0(v4.SelectorSchema, {
                        Editing = true
                    });
                end;
                return {
                    Name = {
                        Actions = v3.MoreAction, 
                        ErrorMessage = if v18 then v18.SelectorError else "", 
                        Schema = l_SelectorSchema_0, 
                        Value = v18.Selector
                    }, 
                    Id = v6.createItemId(v18), 
                    Instance = v18, 
                    Children = v15(v18)
                };
            end;
        end);
    end;
end;
local function v30(v20) --[[ Line: 50 ]] --[[ Name: getStyleRules ]]
    -- upvalues: l_forEach_0 (copy), v2 (copy), l_insert_0 (copy), l_collectArray_0 (copy), v6 (copy), v3 (copy), v5 (copy), l_Attribute_0 (copy), l_map_0 (copy), v4 (copy), l_join_0 (copy), v15 (copy)
    if v20 == nil then
        return {};
    else
        local v21 = {
            ["UI Elements"] = {}, 
            Tags = {}, 
            Components = {}
        };
        local v22 = {
            "UI Elements", 
            "Tags", 
            "Components"
        };
        l_forEach_0(v20:GetStyleRules(), function(v23) --[[ Line: 60 ]]
            -- upvalues: v2 (ref), v21 (copy), v22 (copy), l_insert_0 (ref)
            if v23:IsA("StyleRule") then
                local v24 = v23:GetAttribute("StyleCategory") or v2.getSelectorCategory(v23.Selector);
                if not v21[v24] then
                    v21[v24] = {};
                    l_insert_0(v22, v24);
                end;
                l_insert_0(v21[v24], v23);
            end;
        end);
        return (l_collectArray_0(v22, function(_, v26) --[[ Line: 73 ]]
            -- upvalues: v21 (copy), v6 (ref), v20 (copy), v3 (ref), v5 (ref), l_Attribute_0 (ref), l_map_0 (ref), v4 (ref), l_join_0 (ref), v15 (ref)
            local v27 = v21[v26];
            if #v27 == 0 then
                return nil;
            else
                return {
                    Id = v6.createItemId(v20, v26), 
                    Name = {
                        Actions = v3.MoreAction, 
                        LeftIcon = {
                            Image = if v26 == "UI Elements" then v5.Selectors.Class() else if v26 == "Tags" then v5.Selectors.Tag() else v5.folder(), 
                            Size = l_Attribute_0
                        }, 
                        Value = v26
                    }, 
                    Children = l_map_0(v27, function(v28) --[[ Line: 93 ]]
                        -- upvalues: v4 (ref), l_join_0 (ref), v3 (ref), v6 (ref), v15 (ref)
                        local l_SelectorSchema_1 = v4.SelectorSchema;
                        if v28.Selector == "" then
                            l_SelectorSchema_1 = l_join_0(v4.SelectorSchema, {
                                Editing = true
                            });
                        end;
                        return {
                            Name = {
                                Actions = v3.MoreAction, 
                                ErrorMessage = if v28 then v28.SelectorError else "", 
                                Schema = l_SelectorSchema_1, 
                                Value = v28.Selector
                            }, 
                            Id = v6.createItemId(v28), 
                            Instance = v28, 
                            Children = v15(v28)
                        };
                    end)
                };
            end;
        end));
    end;
end;
local _ = function(v31) --[[ Line: 120 ]] --[[ Name: getThemes ]]
    -- upvalues: l_collectArray_0 (copy), v3 (copy), v4 (copy), v6 (copy), v30 (copy)
    return (l_collectArray_0(v31, function(v32, v33) --[[ Line: 121 ]]
        -- upvalues: v3 (ref), v4 (ref), v6 (ref), l_collectArray_0 (ref), v30 (ref)
        local v34 = v32.Name or v32;
        return {
            Name = {
                Actions = v3.MoreAction, 
                Schema = v4.FolderSchema, 
                Value = v34
            }, 
            Id = v6.createItemId(v32), 
            Instance = if typeof(v32) == "Instance" then v32 else nil, 
            Children = l_collectArray_0(v33, function(_, v36) --[[ Line: 131 ]]
                -- upvalues: v3 (ref), v4 (ref), v6 (ref), v30 (ref)
                return {
                    Name = {
                        Actions = v3.MoreAction, 
                        Schema = v4.StyleSheetSchema, 
                        Value = v36.Name
                    }, 
                    Id = v6.createItemId(v36), 
                    Children = v30(v36), 
                    Instance = v36
                };
            end)
        };
    end));
end;
return function(v38, v39) --[[ Line: 148 ]] --[[ Name: buildTree ]]
    -- upvalues: v6 (copy), v3 (copy), l_ReplicatedStorage_0 (copy), l_forEach_0 (copy), l_startsWith_0 (copy), v2 (copy), l_insert_0 (copy), l_collectArray_0 (copy), l_join_0 (copy), v4 (copy), v7 (copy), v5 (copy), l_Attribute_0 (copy), v30 (copy), l_map_0 (copy)
    if not v39 or not v39.Parent then
        return {
            {
                Id = v6.createItemId("Design"), 
                Name = {
                    Actions = v3.FullSpanMoreAction, 
                    FullSpan = true, 
                    Value = "Design"
                }
            }
        };
    else
        if not v38 then
            v38 = {
                l_ReplicatedStorage_0
            };
        end;
        local v40 = {
            Tokens = {}, 
            Designs = {}
        };
        local v41 = {};
        local v42 = {
            "Designs", 
            "Tokens", 
            "Themes"
        };
        l_forEach_0(v38, function(v43) --[[ Line: 175 ]]
            -- upvalues: l_forEach_0 (ref), l_startsWith_0 (ref), v41 (copy), v2 (ref), v39 (copy), l_insert_0 (ref), v40 (copy), v42 (copy)
            l_forEach_0(v43:GetDescendants(), function(v44) --[[ Line: 176 ]]
                -- upvalues: l_startsWith_0 (ref), v41 (ref), v2 (ref), v39 (ref), l_insert_0 (ref), v40 (ref), v42 (ref)
                local l_v44_Attribute_0 = v44:GetAttribute("StyleCategory");
                if v44:IsA("Folder") and l_v44_Attribute_0 then
                    if l_startsWith_0(l_v44_Attribute_0, "Themes") and not v41[v44] then
                        v41[v44] = {};
                        return;
                    end;
                elseif v44:IsA("StyleSheet") then
                    local l_Parent_1 = v44.Parent;
                    if not l_v44_Attribute_0 then
                        l_v44_Attribute_0 = v2.isTheme(v44) and "Themes" or "Other";
                    end;
                    if v39 == v44 then
                        l_v44_Attribute_0 = "Designs";
                    end;
                    if l_v44_Attribute_0 == "Themes" then
                        local v47 = if l_Parent_1:IsA("Folder") then l_Parent_1 else "Other";
                        if not v41[v47] then
                            v41[v47] = {};
                        end;
                        l_insert_0(v41[v47], v44);
                        return;
                    else
                        if not v40[l_v44_Attribute_0] then
                            v40[l_v44_Attribute_0] = {};
                            l_insert_0(v42, l_v44_Attribute_0);
                        end;
                        l_insert_0(v40[l_v44_Attribute_0], v44);
                    end;
                end;
            end);
        end);
        return (l_collectArray_0(v42, function(_, v49) --[[ Line: 214 ]]
            -- upvalues: v40 (copy), v3 (ref), l_join_0 (ref), v4 (ref), v7 (ref), v5 (ref), l_Attribute_0 (ref), v6 (ref), v30 (ref), l_startsWith_0 (ref), v41 (copy), l_collectArray_0 (ref), l_map_0 (ref)
            local v50 = v40[v49];
            if v49 == "Designs" and #v50 > 0 then
                local v51 = v50[1];
                local l_Name_0 = v51.Name;
                if not l_Name_0:match("StyleSheet") then
                    l_Name_0 = l_Name_0 .. " StyleSheet";
                end;
                if v51 then
                    return {
                        Name = {
                            Actions = v3.FullSpanMoreAction, 
                            ExpandByDefault = true, 
                            FullSpan = true, 
                            Schema = l_join_0(v4.StyleSheetSchema, {
                                GetImageProps = v7.None
                            }), 
                            Value = l_Name_0, 
                            LeftIcon = {
                                Image = v5.Standard.DesignSheet(), 
                                Size = l_Attribute_0
                            }
                        }, 
                        Id = v6.createItemId(v51), 
                        Children = v30(v51), 
                        Instance = v51
                    };
                else
                    return nil;
                end;
            else
                local v53 = nil;
                local v54 = nil;
                if l_startsWith_0(v49, "Themes") then
                    v53 = l_collectArray_0(v41, function(v55, v56) --[[ Line: 121 ]]
                        -- upvalues: v3 (ref), v4 (ref), v6 (ref), l_collectArray_0 (ref), v30 (ref)
                        local v57 = v55.Name or v55;
                        return {
                            Name = {
                                Actions = v3.MoreAction, 
                                Schema = v4.FolderSchema, 
                                Value = v57
                            }, 
                            Id = v6.createItemId(v55), 
                            Instance = if typeof(v55) == "Instance" then v55 else nil, 
                            Children = l_collectArray_0(v56, function(_, v59) --[[ Line: 131 ]]
                                -- upvalues: v3 (ref), v4 (ref), v6 (ref), v30 (ref)
                                return {
                                    Name = {
                                        Actions = v3.MoreAction, 
                                        Schema = v4.StyleSheetSchema, 
                                        Value = v59.Name
                                    }, 
                                    Id = v6.createItemId(v59), 
                                    Children = v30(v59), 
                                    Instance = v59
                                };
                            end)
                        };
                    end);
                    v54 = v5.Standard.ThemeSheet();
                else
                    v54 = v5.Standard.TokenSheet();
                    v53 = l_map_0(v50, function(v60) --[[ Line: 253 ]]
                        -- upvalues: v4 (ref), l_join_0 (ref), v3 (ref), v6 (ref), v30 (ref)
                        local l_StyleSheetSchema_0 = v4.StyleSheetSchema;
                        if v60.Name == "" then
                            l_StyleSheetSchema_0 = l_join_0(l_StyleSheetSchema_0, {
                                Editing = true
                            });
                        end;
                        return {
                            Name = {
                                Actions = v3.MoreAction, 
                                Schema = l_StyleSheetSchema_0, 
                                Value = v60.Name
                            }, 
                            Id = v6.createItemId(v60), 
                            Children = v30(v60), 
                            Instance = v60
                        };
                    end);
                end;
                return {
                    Name = {
                        Actions = v3.FullSpanMoreAction, 
                        ExpandByDefault = true, 
                        FullSpan = true, 
                        Value = v49, 
                        LeftIcon = {
                            Image = v54, 
                            Size = l_Attribute_0
                        }
                    }, 
                    Id = v6.createItemId(v49), 
                    Children = v53
                };
            end;
        end));
    end;
end;