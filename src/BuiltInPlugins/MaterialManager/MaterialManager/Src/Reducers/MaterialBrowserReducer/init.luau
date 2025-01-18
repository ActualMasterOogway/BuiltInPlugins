local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v5 = require(l_Actions_0.ClearMaterial);
local v6 = require(l_Actions_0.ClearMaterialWrapper);
local v7 = require(l_Actions_0.SetExpandedPane);
local v8 = require(l_Actions_0.SetMaterial);
local v9 = require(l_Actions_0.DEPRECATED_SetMaterialAsTool);
local v10 = require(l_Actions_0.SetMaterialBrowserLayout);
local v11 = require(l_Actions_0.SetMaterialList);
local v12 = require(l_Actions_0.SetMaterialOverride);
local v13 = require(l_Actions_0.SetMaterialOverrides);
local v14 = require(l_Actions_0.SetMaterialStatus);
local v15 = require(l_Actions_0.SetMaterialTileSize);
local v16 = require(l_Actions_0.SetMaterialVariant);
local v17 = require(l_Actions_0.SetMaterialWrapper);
local v18 = require(l_Actions_0.SetMenuHover);
local v19 = require(l_Actions_0.SetPath);
local v20 = require(l_Actions_0.SetSearch);
local v21 = require(l_Actions_0.SetUse2022Materials);
local v22 = require(l_Actions_0.SetViewType);
local l_Util_0 = l_Parent_0.Src.Util;
local v24 = require(l_Util_0.CompareMaterials);
local l_Constants_0 = l_Parent_0.Src.Resources.Constants;
local v26 = require(l_Constants_0.getSettingsNames);
local l_Flags_0 = l_Parent_0.Src.Flags;
local v28 = require(l_Flags_0.getFFlagMaterialActionAsTool);
local v29 = v26();
local v30 = {};
for _, v32 in pairs(v29) do
    v30[v32] = true;
end;
local v33 = {
    DEPRECATED_ActiveAsTool = if v28() then nil else false, 
    ExpandedPane = v30, 
    MaterialBrowserLayout = {
        BaseShowSideBar = true, 
        OverrideShowSideBar = false, 
        SideBarWidth = 200
    }, 
    MaterialOverride = {}, 
    MaterialOverrides = {}, 
    Materials = {}, 
    MaterialStatus = {}, 
    MaterialTileSize = 130, 
    MenuHover = false, 
    Path = {}, 
    Search = "", 
    Use2022Materials = false, 
    ViewType = "Grid"
};
return (v2.createReducer(v33, {
    [v5.name] = function(v34, _) --[[ Line: 82 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v34, {
            Material = v3.None
        });
    end, 
    [v6.name] = function(v36, v37) --[[ Line: 88 ]]
        -- upvalues: v3 (copy), v24 (copy)
        local v38 = if v37.MaterialWrapper.MaterialVariant then v37.MaterialWrapper.MaterialVariant else v37.MaterialWrapper.Material;
        return v3.Dictionary.join(v36, {
            Materials = v3.Dictionary.join(v36.Materials, {
                [v38] = v3.None
            }), 
            Material = if v24(v36.Materials[v38], v36.Material) then v3.None else nil
        });
    end, 
    [v7.name] = function(v39, v40) --[[ Line: 101 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v39, {
            ExpandedPane = v3.Dictionary.join(v39.ExpandedPane, {
                [v40.PaneName] = v40.ExpandedPaneState
            })
        });
    end, 
    [v8.name] = function(v41, v42) --[[ Line: 109 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v41, {
            Material = v42.Material
        });
    end, 
    [v9.name] = if v28() then nil else function(v43, v44) --[[ Line: 117 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v43, {
            DEPRECATED_ActiveAsTool = v44.DEPRECATED_ActiveAsTool
        });
    end, 
    [v10.name] = function(v45, v46) --[[ Line: 123 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v45, {
            MaterialBrowserLayout = v3.Dictionary.join(v45.MaterialBrowserLayout, v46.MaterialBrowserLayout)
        });
    end, 
    [v11.name] = function(v47, v48) --[[ Line: 129 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v47, {
            MaterialList = v48.MaterialList
        });
    end, 
    [v12.name] = function(v49, v50) --[[ Line: 135 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v49, {
            MaterialOverride = v3.Dictionary.join(v49.MaterialOverride, {
                [v50.Material] = v50.Index
            })
        });
    end, 
    [v13.name] = function(v51, v52) --[[ Line: 143 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v51, {
            MaterialOverrides = v3.Dictionary.join(v51.MaterialOverrides, {
                [v52.Material] = v52.Overrides
            })
        });
    end, 
    [v14.name] = function(v53, v54) --[[ Line: 151 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v53, {
            MaterialStatus = v3.Dictionary.join(v53.MaterialStatus, {
                [v54.Material] = v54.MaterialStatus
            })
        });
    end, 
    [v15.name] = function(v55, v56) --[[ Line: 159 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v55, {
            MaterialTileSize = v56.MaterialTileSize
        });
    end, 
    [v16.name] = function(v57, v58) --[[ Line: 165 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v57, {
            Material = v57.Materials[v58.MaterialVariant]
        });
    end, 
    [v17.name] = function(v59, v60) --[[ Line: 171 ]]
        -- upvalues: v3 (copy), v24 (copy)
        local v61 = if v60.MaterialWrapper.MaterialVariant then v60.MaterialWrapper.MaterialVariant else v60.MaterialWrapper.Material;
        local l_Material_0 = v59.Material;
        return v3.Dictionary.join(v59, {
            Materials = v3.Dictionary.join(v59.Materials, {
                [v61] = v60.MaterialWrapper
            }), 
            Material = if l_Material_0 and v24(v59.Materials[v61], v59.Material) then v60.MaterialWrapper else nil
        });
    end, 
    [v18.name] = function(v63, v64) --[[ Line: 187 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v63, {
            MenuHover = v64.MenuHover
        });
    end, 
    [v19.name] = function(v65, v66) --[[ Line: 193 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v65, {
            Path = v66.Path
        });
    end, 
    [v20.name] = function(v67, v68) --[[ Line: 199 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v67, {
            Search = v68.Search
        });
    end, 
    [v22.name] = function(v69, v70) --[[ Line: 205 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v69, {
            ViewType = v70.ViewType
        });
    end, 
    [v21.name] = function(v71, v72) --[[ Line: 211 ]]
        -- upvalues: v3 (copy)
        return v3.Dictionary.join(v71, {
            Use2022Materials = v72.Use2022Materials
        });
    end
}));