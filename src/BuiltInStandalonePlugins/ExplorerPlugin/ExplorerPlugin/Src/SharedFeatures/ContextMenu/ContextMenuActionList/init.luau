local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Selection_0 = game:GetService("Selection");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExplorerPlugin");
local _ = require(l_script_FirstAncestor_0.Src.SharedFeatures.ContextMenu.ContextMenuTypes);
local v10 = require(l_script_FirstAncestor_0.Packages.Explorer);
local l_StudioUri_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.StudioUri;
local function v16(v12, v13, v14, v15) --[[ Line: 30 ]] --[[ Name: studioAction ]]
    -- upvalues: l_StudioUri_0 (copy)
    return {
        key = v15 or l_StudioUri_0.toString(v12), 
        source = {
            type = "studioAction", 
            uri = v12, 
            expectation = v13, 
            shouldShow = v14
        }
    };
end;
local function _(v17, v18) --[[ Line: 48 ]] --[[ Name: category ]]
    return {
        key = v17, 
        source = {
            type = "submenu", 
            submenuCategories = v18
        }
    };
end;
local function _(v20, v21) --[[ Line: 64 ]] --[[ Name: uri ]]
    -- upvalues: l_StudioUri_0 (copy)
    return l_StudioUri_0.fromAction(v20, v21);
end;
local v25 = {
    hasChildren = function(v23) --[[ Line: 70 ]] --[[ Name: hasChildren ]]
        return #v23:GetChildren() > 0;
    end, 
    hasPackageLink = function(v24) --[[ Line: 74 ]] --[[ Name: hasPackageLink ]]
        return v24:FindFirstChildWhichIsA("PackageLink") ~= nil;
    end
};
v25.canConvertToPackage = function(v26) --[[ Line: 78 ]] --[[ Name: canConvertToPackage ]]
    -- upvalues: v25 (copy)
    return not v25.hasPackageLink(v26);
end;
v25.createInstanceIsA = function(v27) --[[ Line: 82 ]] --[[ Name: createInstanceIsA ]]
    return function(v28) --[[ Line: 83 ]]
        -- upvalues: v27 (copy)
        return v28:IsA(v27);
    end;
end;
v25.isAPart = function(v29) --[[ Line: 88 ]] --[[ Name: isAPart ]]
    return v29:IsA("BasePart") and not v29:IsA("Terrain");
end;
v25.isSingleSelection = function() --[[ Line: 92 ]] --[[ Name: isSingleSelection ]]
    -- upvalues: l_Selection_0 (copy)
    return #l_Selection_0:Get() == 1;
end;
v25.isAPartIncludingTerrain = v25.createInstanceIsA("BasePart");
v25.isAPVInstance = v25.createInstanceIsA("PVInstance");
v25.isAScript = v25.createInstanceIsA("LuaSourceContainer");
v25.isAUnion = v25.createInstanceIsA("UnionOperation");
local v30 = {};
table.insert(v30, {
    v16(l_StudioUri_0.fromAction("ScriptTools", "Open"), "NonServices", v25.isAScript), 
    v16(l_StudioUri_0.fromAction("ScriptTools", "OpenScriptHistory"), "NonServices", v25.isAScript), 
    (v16(l_StudioUri_0.fromAction("ScriptTools", "ToggleScripts"), "NonServices", v25.isAScript))
});
local v31 = {};
local v32 = v16(l_StudioUri_0.fromAction("Common", "Cut"), "NonServices");
local v33 = v16(l_StudioUri_0.fromAction("Common", "Copy"), "NonServices");
local v34 = v16(l_StudioUri_0.fromAction("Common", "PasteInto"), "All");
local v35 = {
    {
        v16(l_StudioUri_0.fromAction("BuilderTools", "PasteAtOriginalLocation"), "All"), 
        (v16(l_StudioUri_0.fromAction("BuilderTools", "PasteIntoAtOriginalLocation"), "All"))
    }
};
local v36 = {
    key = "morePasteOptions", 
    source = {
        type = "submenu", 
        submenuCategories = v35
    }
};
v35 = v16(l_StudioUri_0.fromAction("Common", "Duplicate"), "NonServices");
local v37 = v16(l_StudioUri_0.fromAction("Common", "Delete"), "NonServices");
local v38 = v16(l_StudioUri_0.fromAction("Explorer", "Rename"), "All", v25.isSingleSelection, v10.Data.ContextMenu.coreItems.rename);
v6(v31, 1, v32, v33, v34, v36, v35, v37, v38);
table.insert(v30, v31);
table.insert(v30, {
    v16(l_StudioUri_0.fromAction("InsertService", "ShowServices"), "ServicesAndBlank"), 
    (v16(l_StudioUri_0.fromAction("InsertService", "HideService"), "Services"))
});
v31 = {};
v32 = v16(l_StudioUri_0.fromAction("BuilderTools", "GroupAsModel"), "NonServices");
v33 = v16(l_StudioUri_0.fromAction("BuilderTools", "GroupAsFolder"), "NonServices");
v36 = {
    {
        v16(l_StudioUri_0.fromAction("BuilderTools", "UnionSelection"), "NonServices", v25.isAPart), 
        v16(l_StudioUri_0.fromAction("BuilderTools", "IntersectSelection"), "NonServices", v25.isAPart), 
        v16(l_StudioUri_0.fromAction("BuilderTools", "NegateSelection"), "NonServices", v25.isAPart), 
        (v16(l_StudioUri_0.fromAction("BuilderTools", "SeparateSelection"), "NonServices", v25.isAPart))
    }
};
v34 = {
    key = "solidModeling", 
    source = {
        type = "submenu", 
        submenuCategories = v36
    }
};
v6(v31, 1, v32, v33, v34);
table.insert(v30, v31);
v31 = {};
v33 = {
    {
        v16(l_StudioUri_0.fromAction("BuilderTools", "InsertPart"), "All"), 
        v16(l_StudioUri_0.fromAction("BuilderTools", "InsertObject"), "All"), 
        (v16(l_StudioUri_0.fromAction("BuilderTools", "InsertFromFile"), "All"))
    }
};
v32 = {
    key = "insert", 
    source = {
        type = "submenu", 
        submenuCategories = v33
    }
};
v34 = {
    {
        v16(l_StudioUri_0.fromAction("Explorer", "ExpandAll"), "All", v25.hasChildren, v10.Data.ContextMenu.coreItems.expandAll), 
        (v16(l_StudioUri_0.fromAction("Explorer", "CollapseAll"), "All", v25.hasChildren, v10.Data.ContextMenu.coreItems.collapseAll))
    }
};
v33 = {
    key = "hierarchy", 
    source = {
        type = "submenu", 
        submenuCategories = v34
    }
};
v34 = v16(l_StudioUri_0.fromAction("BuilderTools", "ZoomExtents"), "NonServices", v25.isAPartIncludingTerrain);
v6(v31, 1, v32, v33, v34);
table.insert(v30, v31);
v31 = {};
v32 = v16(l_StudioUri_0.fromAction("PackageTools", "PublishPackage"), "NonServices", v25.hasPackageLink);
v34 = {
    {
        v16(l_StudioUri_0.fromAction("PackageTools", "MassUpdate"), "NonServices", v25.hasPackageLink), 
        v16(l_StudioUri_0.fromAction("PackageTools", "ShowPackagesDiff"), "NonServices", v25.hasPackageLink), 
        (v16(l_StudioUri_0.fromAction("PackageTools", "PackageDetails"), "NonServices", v25.hasPackageLink))
    }
};
v33 = {
    key = "morePackageOptions", 
    source = {
        type = "submenu", 
        submenuCategories = v34
    }
};
v6(v31, 1, v32, v33);
table.insert(v30, v31);
v31 = {};
v32 = v16(l_StudioUri_0.fromAction("PackageTools", "DEPRECATED_ConvertToPackage"), "NonServices", v25.canConvertToPackage);
v34 = {
    {
        v16(l_StudioUri_0.fromAction("Export", "PublishSelectionToRoblox"), "NonServices"), 
        v16(l_StudioUri_0.fromAction("Export", "SaveSelectionToFile"), "All"), 
        v16(l_StudioUri_0.fromAction("PluginManagement", "SaveAsLocalPlugin"), "All", v25.isAScript), 
        v16(l_StudioUri_0.fromAction("PluginManagement", "PublishToRoblox"), "All"), 
        (v16(l_StudioUri_0.fromAction("Export", "ExportSelection"), "All"))
    }
};
v33 = {
    key = "saveAndExport", 
    source = {
        type = "submenu", 
        submenuCategories = v34
    }
};
v6(v31, 1, v32, v33);
table.insert(v30, v31);
table.insert(v30, {
    (v16(l_StudioUri_0.fromAction("Common", "Help"), "All"))
});
return v30;