local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Src.Util.getStudioTheme);
local function _(v3, v4, v5) --[[ Line: 10 ]] --[[ Name: luaIcon ]]
    -- upvalues: v2 (copy)
    return function() --[[ Line: 11 ]]
        -- upvalues: v2 (ref), v3 (copy), v4 (copy), v5 (copy)
        local v6 = v2();
        return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(v3, v6, v4, v5));
    end;
end;
local function _(v8, v9, v10) --[[ Line: 17 ]] --[[ Name: sharedIcon ]]
    -- upvalues: v2 (copy)
    return function() --[[ Line: 18 ]]
        -- upvalues: v2 (ref), v8 (copy), v9 (copy), v10 (copy)
        local v11 = v2();
        return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(v8, v11, v9, v10));
    end;
end;
local function _(v13) --[[ Line: 24 ]] --[[ Name: styleSharedIcon ]]
    return function() --[[ Line: 25 ]]
        -- upvalues: v13 (copy)
        return (("rbxasset://textures/StyleEditor/%*.png"):format(v13));
    end;
end;
local v15 = {};
local v16 = {};
local v17 = "StyleEditor";
local v18 = "Standard";
local v19 = "StyleSheetDesign";
local l_v17_0 = v17 --[[ copy: 9 -> 12 ]];
local l_v18_0 = v18 --[[ copy: 10 -> 13 ]];
local l_v19_0 = v19 --[[ copy: 11 -> 14 ]];
v16.DesignSheet = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_0 (copy), l_v18_0 (copy), l_v19_0 (copy)
    local v23 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_0, v23, l_v18_0, l_v19_0));
end;
v17 = "StyleEditor";
v18 = "Standard";
v19 = "StyleSheetToken";
local l_v17_1 = v17 --[[ copy: 9 -> 15 ]];
local l_v18_1 = v18 --[[ copy: 10 -> 16 ]];
local l_v19_1 = v19 --[[ copy: 11 -> 17 ]];
v16.TokenSheet = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_1 (copy), l_v18_1 (copy), l_v19_1 (copy)
    local v27 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_1, v27, l_v18_1, l_v19_1));
end;
v17 = "StyleEditor";
v18 = "Standard";
v19 = "StyleSheetTheme";
local l_v17_2 = v17 --[[ copy: 9 -> 18 ]];
local l_v18_2 = v18 --[[ copy: 10 -> 19 ]];
local l_v19_2 = v19 --[[ copy: 11 -> 20 ]];
v16.ThemeSheet = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_2 (copy), l_v18_2 (copy), l_v19_2 (copy)
    local v31 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_2, v31, l_v18_2, l_v19_2));
end;
v15.Standard = v16;
v16 = {};
v17 = "WidgetIcons";
v18 = "Large";
v19 = "StyleEditor";
local l_v17_3 = v17 --[[ copy: 9 -> 21 ]];
local l_v18_3 = v18 --[[ copy: 10 -> 22 ]];
local l_v19_3 = v19 --[[ copy: 11 -> 23 ]];
v16.StyleEditor = function() --[[ Line: 18 ]]
    -- upvalues: v2 (copy), l_v17_3 (copy), l_v18_3 (copy), l_v19_3 (copy)
    local v35 = v2();
    return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(l_v17_3, v35, l_v18_3, l_v19_3));
end;
v15.Large = v16;
v16 = {};
v17 = "StyleEditor";
v18 = "Standard";
v19 = "UI";
local l_v17_4 = v17 --[[ copy: 9 -> 24 ]];
local l_v18_4 = v18 --[[ copy: 10 -> 25 ]];
local l_v19_4 = v19 --[[ copy: 11 -> 26 ]];
v16.Class = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_4 (copy), l_v18_4 (copy), l_v19_4 (copy)
    local v39 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_4, v39, l_v18_4, l_v19_4));
end;
v17 = "StyleEditor";
v18 = "Standard";
v19 = "StyleSheetChild";
local l_v17_5 = v17 --[[ copy: 9 -> 27 ]];
local l_v18_5 = v18 --[[ copy: 10 -> 28 ]];
local l_v19_5 = v19 --[[ copy: 11 -> 29 ]];
v16.Child = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_5 (copy), l_v18_5 (copy), l_v19_5 (copy)
    local v43 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_5, v43, l_v18_5, l_v19_5));
end;
v17 = "StyleEditor";
v18 = "Standard";
v19 = "StyleSheetDescendant";
local l_v17_6 = v17 --[[ copy: 9 -> 30 ]];
local l_v18_6 = v18 --[[ copy: 10 -> 31 ]];
local l_v19_6 = v19 --[[ copy: 11 -> 32 ]];
v16.Descendant = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_6 (copy), l_v18_6 (copy), l_v19_6 (copy)
    local v47 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_6, v47, l_v18_6, l_v19_6));
end;
v17 = "StyleEditor";
v18 = "Standard";
v19 = "StyleSheetEnumerator";
local l_v17_7 = v17 --[[ copy: 9 -> 33 ]];
local l_v18_7 = v18 --[[ copy: 10 -> 34 ]];
local l_v19_7 = v19 --[[ copy: 11 -> 35 ]];
v16.Enumerator = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_7 (copy), l_v18_7 (copy), l_v19_7 (copy)
    local v51 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_7, v51, l_v18_7, l_v19_7));
end;
v17 = "StyleEditor";
v18 = "Standard";
v19 = "StyleSheetGuiState";
local l_v17_8 = v17 --[[ copy: 9 -> 36 ]];
local l_v18_8 = v18 --[[ copy: 10 -> 37 ]];
local l_v19_8 = v19 --[[ copy: 11 -> 38 ]];
v16.GuiState = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_8 (copy), l_v18_8 (copy), l_v19_8 (copy)
    local v55 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_8, v55, l_v18_8, l_v19_8));
end;
v17 = "StyleEditor";
v18 = "Standard";
v19 = "StyleSheetName";
local l_v17_9 = v17 --[[ copy: 9 -> 39 ]];
local l_v18_9 = v18 --[[ copy: 10 -> 40 ]];
local l_v19_9 = v19 --[[ copy: 11 -> 41 ]];
v16.Name = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_9 (copy), l_v18_9 (copy), l_v19_9 (copy)
    local v59 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_9, v59, l_v18_9, l_v19_9));
end;
v17 = "StyleEditor";
v18 = "Standard";
v19 = "StyleSheetPseudoInstance";
local l_v17_10 = v17 --[[ copy: 9 -> 42 ]];
local l_v18_10 = v18 --[[ copy: 10 -> 43 ]];
local l_v19_10 = v19 --[[ copy: 11 -> 44 ]];
v16.PseudoInstance = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_10 (copy), l_v18_10 (copy), l_v19_10 (copy)
    local v63 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_10, v63, l_v18_10, l_v19_10));
end;
v17 = "TagEditor";
v18 = "Standard";
v19 = "Tag";
local l_v17_11 = v17 --[[ copy: 9 -> 45 ]];
local l_v18_11 = v18 --[[ copy: 10 -> 46 ]];
v16.Tag = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v17_11 (copy), l_v18_11 (copy), v19 (copy)
    local v66 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v17_11, v66, l_v18_11, v19));
end;
v15.Selectors = v16;
local v67 = "Navigation";
v17 = "Standard";
v18 = "CloseWidget";
local l_v67_0 = v67 --[[ copy: 8 -> 47 ]];
local l_v17_12 = v17 --[[ copy: 9 -> 48 ]];
local l_v18_12 = v18 --[[ copy: 10 -> 49 ]];
v15.close = function() --[[ Line: 18 ]]
    -- upvalues: v2 (copy), l_v67_0 (copy), l_v17_12 (copy), l_v18_12 (copy)
    local v71 = v2();
    return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(l_v67_0, v71, l_v17_12, l_v18_12));
end;
v67 = "StyleEditor";
v17 = "Large";
v18 = "Color";
local l_v67_1 = v67 --[[ copy: 8 -> 50 ]];
local l_v17_13 = v17 --[[ copy: 9 -> 51 ]];
local l_v18_13 = v18 --[[ copy: 10 -> 52 ]];
v15.colors = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_1 (copy), l_v17_13 (copy), l_v18_13 (copy)
    local v75 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_1, v75, l_v17_13, l_v18_13));
end;
v67 = "Clipboard";
v17 = "Standard";
v18 = "Copy";
local l_v67_2 = v67 --[[ copy: 8 -> 53 ]];
local l_v17_14 = v17 --[[ copy: 9 -> 54 ]];
local l_v18_14 = v18 --[[ copy: 10 -> 55 ]];
v15.copy = function() --[[ Line: 18 ]]
    -- upvalues: v2 (copy), l_v67_2 (copy), l_v17_14 (copy), l_v18_14 (copy)
    local v79 = v2();
    return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(l_v67_2, v79, l_v17_14, l_v18_14));
end;
v67 = "TagEditor";
v17 = "Standard";
v18 = "Tag_Delete";
local l_v67_3 = v67 --[[ copy: 8 -> 56 ]];
local l_v17_15 = v17 --[[ copy: 9 -> 57 ]];
local l_v18_15 = v18 --[[ copy: 10 -> 58 ]];
v15.delete = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_3 (copy), l_v17_15 (copy), l_v18_15 (copy)
    local v83 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_3, v83, l_v17_15, l_v18_15));
end;
v67 = "StyleEditor";
v17 = "Standard";
v18 = "Size";
local l_v67_4 = v67 --[[ copy: 8 -> 59 ]];
local l_v17_16 = v17 --[[ copy: 9 -> 60 ]];
local l_v18_16 = v18 --[[ copy: 10 -> 61 ]];
v15.dimensions = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_4 (copy), l_v17_16 (copy), l_v18_16 (copy)
    local v87 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_4, v87, l_v17_16, l_v18_16));
end;
v67 = "Clipboard";
v17 = "Standard";
v18 = "Duplicate";
local l_v67_5 = v67 --[[ copy: 8 -> 62 ]];
local l_v17_17 = v17 --[[ copy: 9 -> 63 ]];
local l_v18_17 = v18 --[[ copy: 10 -> 64 ]];
v15.duplicate = function() --[[ Line: 18 ]]
    -- upvalues: v2 (copy), l_v67_5 (copy), l_v17_17 (copy), l_v18_17 (copy)
    local v91 = v2();
    return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(l_v67_5, v91, l_v17_17, l_v18_17));
end;
v67 = "TagEditor";
v17 = "Standard";
v18 = "Tag_Edit";
local l_v67_6 = v67 --[[ copy: 8 -> 65 ]];
local l_v17_18 = v17 --[[ copy: 9 -> 66 ]];
local l_v18_18 = v18 --[[ copy: 10 -> 67 ]];
v15.edit = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_6 (copy), l_v17_18 (copy), l_v18_18 (copy)
    local v95 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_6, v95, l_v17_18, l_v18_18));
end;
v67 = "StyleEditor";
v17 = "Standard";
v18 = "Folder";
local l_v67_7 = v67 --[[ copy: 8 -> 68 ]];
local l_v17_19 = v17 --[[ copy: 9 -> 69 ]];
local l_v18_19 = v18 --[[ copy: 10 -> 70 ]];
v15.folder = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_7 (copy), l_v17_19 (copy), l_v18_19 (copy)
    local v99 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_7, v99, l_v17_19, l_v18_19));
end;
v67 = "StyleEditor";
v17 = "Standard";
v18 = "Typography";
local l_v67_8 = v67 --[[ copy: 8 -> 71 ]];
local l_v17_20 = v17 --[[ copy: 9 -> 72 ]];
local l_v18_20 = v18 --[[ copy: 10 -> 73 ]];
v15.fonts = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_8 (copy), l_v17_20 (copy), l_v18_20 (copy)
    local v103 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_8, v103, l_v17_20, l_v18_20));
end;
v67 = "StyleEditor";
v17 = "Standard";
v18 = "GridPattern";
local l_v67_9 = v67 --[[ copy: 8 -> 74 ]];
local l_v17_21 = v17 --[[ copy: 9 -> 75 ]];
local l_v18_21 = v18 --[[ copy: 10 -> 76 ]];
v15.gridpattern = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_9 (copy), l_v17_21 (copy), l_v18_21 (copy)
    local v107 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_9, v107, l_v17_21, l_v18_21));
end;
v67 = "StyleEditor";
v17 = "Large";
v18 = "Color";
local l_v67_10 = v67 --[[ copy: 8 -> 77 ]];
local l_v17_22 = v17 --[[ copy: 9 -> 78 ]];
local l_v18_22 = v18 --[[ copy: 10 -> 79 ]];
v15.palette = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_10 (copy), l_v17_22 (copy), l_v18_22 (copy)
    local v111 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_10, v111, l_v17_22, l_v18_22));
end;
v67 = "StyleEditor";
v17 = "Standard";
v18 = "More";
local l_v67_11 = v67 --[[ copy: 8 -> 80 ]];
local l_v17_23 = v17 --[[ copy: 9 -> 81 ]];
local l_v18_23 = v18 --[[ copy: 10 -> 82 ]];
v15.more = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_11 (copy), l_v17_23 (copy), l_v18_23 (copy)
    local v115 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_11, v115, l_v17_23, l_v18_23));
end;
v67 = "StyleEditor";
v17 = "Standard";
v18 = "InsertS";
local l_v67_12 = v67 --[[ copy: 8 -> 83 ]];
local l_v17_24 = v17 --[[ copy: 9 -> 84 ]];
local l_v18_24 = v18 --[[ copy: 10 -> 85 ]];
v15.new = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_12 (copy), l_v17_24 (copy), l_v18_24 (copy)
    local v119 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_12, v119, l_v17_24, l_v18_24));
end;
v67 = "StyleEditor";
v17 = "Standard";
v18 = "QuickOpen";
local l_v67_13 = v67 --[[ copy: 8 -> 86 ]];
local l_v17_25 = v17 --[[ copy: 9 -> 87 ]];
local l_v18_25 = v18 --[[ copy: 10 -> 88 ]];
v15.open = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_13 (copy), l_v17_25 (copy), l_v18_25 (copy)
    local v123 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_13, v123, l_v17_25, l_v18_25));
end;
v67 = "Clipboard";
v17 = "Standard";
v18 = "Paste";
local l_v67_14 = v67 --[[ copy: 8 -> 89 ]];
local l_v17_26 = v17 --[[ copy: 9 -> 90 ]];
local l_v18_26 = v18 --[[ copy: 10 -> 91 ]];
v15.paste = function() --[[ Line: 18 ]]
    -- upvalues: v2 (copy), l_v67_14 (copy), l_v17_26 (copy), l_v18_26 (copy)
    local v127 = v2();
    return (("rbxasset://studio_svg_textures/Shared/%*/%*/%*/%*.png"):format(l_v67_14, v127, l_v17_26, l_v18_26));
end;
v67 = "TagEditor";
v17 = "Standard";
v18 = "Tag_Remove";
local l_v67_15 = v67 --[[ copy: 8 -> 92 ]];
local l_v17_27 = v17 --[[ copy: 9 -> 93 ]];
local l_v18_27 = v18 --[[ copy: 10 -> 94 ]];
v15.remove = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_15 (copy), l_v17_27 (copy), l_v18_27 (copy)
    local v131 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_15, v131, l_v17_27, l_v18_27));
end;
v67 = "StyleEditor";
v17 = "Standard";
v18 = "Size";
local l_v67_16 = v67 --[[ copy: 8 -> 95 ]];
local l_v17_28 = v17 --[[ copy: 9 -> 96 ]];
local l_v18_28 = v18 --[[ copy: 10 -> 97 ]];
v15.sizes = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_16 (copy), l_v17_28 (copy), l_v18_28 (copy)
    local v135 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_16, v135, l_v17_28, l_v18_28));
end;
v67 = "TagEditor";
v17 = "Standard";
v18 = "Tag_Add";
local l_v67_17 = v67 --[[ copy: 8 -> 98 ]];
local l_v17_29 = v17 --[[ copy: 9 -> 99 ]];
local l_v18_29 = v18 --[[ copy: 10 -> 100 ]];
v15.set = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_17 (copy), l_v17_29 (copy), l_v18_29 (copy)
    local v139 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_17, v139, l_v17_29, l_v18_29));
end;
v67 = "StyleEditor";
v17 = "Standard";
v18 = "Typography";
local l_v67_18 = v67 --[[ copy: 8 -> 101 ]];
v15.typography = function() --[[ Line: 11 ]]
    -- upvalues: v2 (copy), l_v67_18 (copy), v17 (copy), v18 (copy)
    local v141 = v2();
    return (("rbxasset://studio_svg_textures/Lua/%*/%*/%*/%*.png"):format(l_v67_18, v141, v17, v18));
end;
v67 = "onboarding";
v15.onboarding = function() --[[ Line: 25 ]]
    -- upvalues: v67 (copy)
    return (("rbxasset://textures/StyleEditor/%*.png"):format(v67));
end;
return v15;