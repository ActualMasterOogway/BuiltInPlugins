local l_script_FirstAncestor_0 = script:FindFirstAncestor("MaterialPicker");
local v1 = require(l_script_FirstAncestor_0.SharedPluginConstants);
local v2 = require(l_script_FirstAncestor_0.Src.Constants.BASE_MATERIALS);
local v3 = require(l_script_FirstAncestor_0.Src.Util.applyToSelection);
local v4 = require(l_script_FirstAncestor_0.Src.Util.isMaterialVariantByIdentifier);
local v5 = require(l_script_FirstAncestor_0.Src.Util.setCurrentMaterial);
local v6 = require(l_script_FirstAncestor_0.Src.Util.updateRecentlyUsedList);
local v7 = require(l_script_FirstAncestor_0.Packages.Dash);
local v8 = require(l_script_FirstAncestor_0.Packages.Framework);
local v9 = require(l_script_FirstAncestor_0.Packages.MaterialFramework);
local v10 = require(l_script_FirstAncestor_0.Packages.React);
local l_append_0 = v7.append;
local l_copy_0 = v7.copy;
local l_filter_0 = v7.filter;
local l_keys_0 = v7.keys;
local l_Stylizer_0 = v8.Style.Stylizer;
local l_ContextServices_0 = v8.ContextServices;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_StudioServices_0 = v9.Context.StudioServices;
local l_MaterialGrid_0 = v9.Components.MaterialGrid;
local l_levenshteinDistance_0 = v9.Util.levenshteinDistance;
local l_getSerializedMaterialIdentifier_0 = v9.Util.getSerializedMaterialIdentifier;
local l_ViewType_0 = v9.Enums.ViewType;
local l_createElement_0 = v10.createElement;
local l_useRef_0 = v10.useRef;
local l_useEffect_0 = v10.useEffect;
local l_useState_0 = v10.useState;
local l_UI_0 = v8.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_SearchBar_0 = l_UI_0.SearchBar;
local v33 = require(script.Parent.FilterChip);
local v34 = require(script.Parent.FilterChipGroup);
local v35 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagInsertPartWithMaterial);
local v36 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagEnableMaterialGenerator);
local v37 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixMaterialSearchCrash);
local v38 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagDropdownIconCanOpenPlugin);
local v39 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialPickerRemoveToggles);
local v40 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialPickerSearchPreviewer);
local v41 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagMaterialPickerFilterChipGroup);
local l_MaterialGeneratorHideTempMaterialVariants_0 = game:GetFastFlag("MaterialGeneratorHideTempMaterialVariants");
local v43 = {};
if v40() then
    for _, v45 in ipairs(v2) do
        v43[string.lower(v45.Name)] = v45;
    end;
end;
MainView = function(v46) --[[ Line: 79 ]] --[[ Name: MainView ]]
    -- upvalues: l_Stylizer_0 (copy), l_Localization_0 (copy), l_StudioServices_0 (copy), l_Analytics_0 (copy), l_useState_0 (copy), v1 (copy), l_filter_0 (copy), l_MaterialGeneratorHideTempMaterialVariants_0 (copy), l_getSerializedMaterialIdentifier_0 (copy), l_keys_0 (copy), l_append_0 (copy), l_copy_0 (copy), v2 (copy), v37 (copy), l_levenshteinDistance_0 (copy), l_useRef_0 (copy), v41 (copy), v43 (copy), v3 (copy), v35 (copy), v6 (copy), v38 (copy), v5 (copy), v4 (copy), l_useEffect_0 (copy), l_ViewType_0 (copy), l_createElement_0 (copy), l_Pane_0 (copy), l_SearchBar_0 (copy), v40 (copy), l_IconButton_0 (copy), l_ScrollingFrame_0 (copy), v33 (copy), v34 (copy), l_MaterialGrid_0 (copy), v36 (copy), v39 (copy)
    local v47 = l_Stylizer_0:use();
    local v48 = l_Localization_0.use();
    local v49 = l_StudioServices_0.use();
    local v50 = l_Analytics_0:use();
    local v51 = v49:getService("Selection");
    local v52 = v49:getService("ChangeHistoryService");
    local l_MemStorageService_0 = game:GetService("MemStorageService");
    local v54 = v49:getServiceInstance("MaterialService");
    local l_Workspace_0 = game:GetService("Workspace");
    local v56, v57 = l_useState_0(l_MemStorageService_0:GetItem(v1.MATERIAL_GENERATOR_ENABLED) == "true");
    local v58, v59 = l_useState_0(l_MemStorageService_0:GetItem(v1.MATERIAL_MANAGER_ENABLED) == "true");
    local v60, v61 = l_useState_0("");
    local v62, v63 = l_useState_0(v46.savedFilterChips or {
        recents = false, 
        appliedInPlace = false, 
        customMaterials = false, 
        defaultMaterials = false
    });
    local function _() --[[ Line: 105 ]] --[[ Name: getMaterialVariants ]]
        -- upvalues: l_filter_0 (ref), v54 (copy), l_MaterialGeneratorHideTempMaterialVariants_0 (ref)
        return l_filter_0(v54:GetDescendants(), function(v64) --[[ Line: 106 ]]
            -- upvalues: l_MaterialGeneratorHideTempMaterialVariants_0 (ref)
            if l_MaterialGeneratorHideTempMaterialVariants_0 then
                return v64:IsA("MaterialVariant") and not v64:FindFirstAncestor("Material Generator");
            else
                return v64:IsA("MaterialVariant");
            end;
        end);
    end;
    local function v75(v66) --[[ Line: 115 ]] --[[ Name: getMaterialsAppliedInPlace ]]
        -- upvalues: l_Workspace_0 (copy), l_getSerializedMaterialIdentifier_0 (ref), l_keys_0 (ref)
        local v67 = {};
        for _, v69 in l_Workspace_0:GetDescendants() do
            if v69:IsA("BasePart") then
                v67[l_getSerializedMaterialIdentifier_0(v69)] = true;
            end;
        end;
        local v70 = l_keys_0(v67);
        local v71 = {};
        for _, v73 in v66 do
            local v74 = l_getSerializedMaterialIdentifier_0(v73);
            if table.find(v70, v74) then
                table.insert(v71, v73);
            end;
        end;
        return v71;
    end;
    local function v88(v76) --[[ Line: 140 ]] --[[ Name: getRecentlyUsedMaterialsFromList ]]
        -- upvalues: v46 (copy), l_getSerializedMaterialIdentifier_0 (ref)
        local v77 = v46.plugin:GetSetting("RecentlyUsed") or {
            "Plastic"
        };
        local v78 = {};
        for v79, v80 in v76 do
            local v81 = l_getSerializedMaterialIdentifier_0(v80);
            local v82 = table.find(v77, v81);
            if v82 then
                table.insert(v78, {
                    indexInRecentlyUsedList = v82, 
                    indexInMaterialList = v79
                });
            end;
        end;
        table.sort(v78, function(v83, v84) --[[ Line: 157 ]]
            return v83.indexInRecentlyUsedList > v84.indexInRecentlyUsedList;
        end);
        local v85 = {};
        for _, v87 in v78 do
            table.insert(v85, v76[v87.indexInMaterialList]);
        end;
        return v85;
    end;
    local function v96() --[[ Line: 170 ]] --[[ Name: getVisibleMaterials_DEPRECATED ]]
        -- upvalues: l_filter_0 (ref), v54 (copy), l_MaterialGeneratorHideTempMaterialVariants_0 (ref), v62 (copy), l_append_0 (ref), l_copy_0 (ref), v2 (ref), v88 (copy), v75 (copy), v60 (ref), v37 (ref), l_levenshteinDistance_0 (ref)
        local v90 = l_filter_0(v54:GetDescendants(), function(v89) --[[ Line: 106 ]]
            -- upvalues: l_MaterialGeneratorHideTempMaterialVariants_0 (ref)
            if l_MaterialGeneratorHideTempMaterialVariants_0 then
                return v89:IsA("MaterialVariant") and not v89:FindFirstAncestor("Material Generator");
            else
                return v89:IsA("MaterialVariant");
            end;
        end);
        if not v62.customMaterials then
            l_append_0(v90, l_copy_0(v2));
        end;
        local l_v90_0 = v90;
        if v62.recents then
            l_v90_0 = v88(l_v90_0);
        end;
        if v62.appliedInPlace then
            l_v90_0 = v75(l_v90_0);
        end;
        if v60 and v60 ~= "" then
            v60 = string.lower(v60);
            l_v90_0 = l_filter_0(l_v90_0, function(v92) --[[ Line: 187 ]]
                -- upvalues: v37 (ref), v60 (ref), l_levenshteinDistance_0 (ref)
                local v93 = string.lower(v92.Name);
                if v37() then
                    return string.find(v93, v60, 1, true) or l_levenshteinDistance_0(v93, v60) <= 1;
                else
                    return string.find(v93, v60) or l_levenshteinDistance_0(v93, v60) <= 1;
                end;
            end);
        end;
        if not v62.recents then
            table.sort(l_v90_0, function(v94, v95) --[[ Line: 199 ]]
                return v94.Name < v95.Name;
            end);
        end;
        return l_v90_0;
    end;
    local v97 = l_useRef_0(0);
    local v98 = l_useRef_0(false);
    local v99 = l_useRef_0({});
    local function _(v100) --[[ Line: 211 ]] --[[ Name: saveOriginalMaterialOfBasePart ]]
        -- upvalues: v99 (copy)
        if v100 and v100:IsA("BasePart") and not v99.current[v100] then
            v99.current[v100] = {
                Material = v100.Material, 
                MaterialVariant = v100.MaterialVariant
            };
        end;
    end;
    local function v106() --[[ Line: 220 ]] --[[ Name: saveOriginalMaterials ]]
        -- upvalues: v51 (copy), v99 (copy)
        for _, v103 in v51:Get() do
            if v103 and v103:IsA("BasePart") and not v99.current[v103] then
                v99.current[v103] = {
                    Material = v103.Material, 
                    MaterialVariant = v103.MaterialVariant
                };
            end;
            if v103:IsA("Model") then
                for _, v105 in v103:GetDescendants() do
                    if v105 and v105:IsA("BasePart") and not v99.current[v105] then
                        v99.current[v105] = {
                            Material = v105.Material, 
                            MaterialVariant = v105.MaterialVariant
                        };
                    end;
                end;
            end;
        end;
    end;
    local function _() --[[ Line: 232 ]] --[[ Name: restoreOriginalMaterials ]]
        -- upvalues: v99 (copy)
        for v107, v108 in pairs(v99.current) do
            v107.Material = v108.Material;
            v107.MaterialVariant = v108.MaterialVariant;
        end;
    end;
    local function v117() --[[ Line: 239 ]] --[[ Name: getCommonAppliedMaterialOfSelectedInstances ]]
        -- upvalues: v51 (copy), l_getSerializedMaterialIdentifier_0 (ref)
        local v110 = nil;
        for _, v112 in v51:Get() do
            if v112:IsA("BasePart") then
                local v113 = l_getSerializedMaterialIdentifier_0(v112);
                if v110 and v110 ~= v113 then
                    return nil;
                else
                    v110 = v113;
                end;
            elseif v112:IsA("Model") then
                for _, v115 in v112:GetDescendants() do
                    if v115:IsA("BasePart") then
                        local v116 = l_getSerializedMaterialIdentifier_0(v115);
                        if v110 and v110 ~= v116 then
                            return nil;
                        else
                            v110 = v116;
                        end;
                    end;
                end;
            end;
        end;
        return v110;
    end;
    local function v142() --[[ Line: 263 ]] --[[ Name: getAndSortVisibleMaterials ]]
        -- upvalues: v41 (ref), v62 (copy), l_copy_0 (ref), v2 (ref), l_filter_0 (ref), v54 (copy), l_MaterialGeneratorHideTempMaterialVariants_0 (ref), l_append_0 (ref), v88 (copy), v75 (copy), v60 (ref), v37 (ref), l_levenshteinDistance_0 (ref), v43 (ref), v106 (copy), v3 (ref), v51 (copy), v98 (copy)
        local v118 = nil;
        if v41() then
            if v62.defaultMaterials then
                v118 = l_copy_0(v2);
            else
                local v120 = l_filter_0(v54:GetDescendants(), function(v119) --[[ Line: 106 ]]
                    -- upvalues: l_MaterialGeneratorHideTempMaterialVariants_0 (ref)
                    if l_MaterialGeneratorHideTempMaterialVariants_0 then
                        return v119:IsA("MaterialVariant") and not v119:FindFirstAncestor("Material Generator");
                    else
                        return v119:IsA("MaterialVariant");
                    end;
                end);
                if not v62.customMaterials then
                    l_append_0(v120, l_copy_0(v2));
                end;
                v118 = v120;
            end;
        else
            local v122 = l_filter_0(v54:GetDescendants(), function(v121) --[[ Line: 106 ]]
                -- upvalues: l_MaterialGeneratorHideTempMaterialVariants_0 (ref)
                if l_MaterialGeneratorHideTempMaterialVariants_0 then
                    return v121:IsA("MaterialVariant") and not v121:FindFirstAncestor("Material Generator");
                else
                    return v121:IsA("MaterialVariant");
                end;
            end);
            if not v62.customMaterials then
                l_append_0(v122, l_copy_0(v2));
            end;
            v118 = v122;
        end;
        if v62.recents then
            v118 = v88(v118);
        end;
        if v62.appliedInPlace then
            v118 = v75(v118);
        end;
        if v60 and v60 ~= "" then
            v60 = string.lower(v60);
            v118 = l_filter_0(v118, function(v123) --[[ Line: 298 ]]
                -- upvalues: v37 (ref), v60 (ref), l_levenshteinDistance_0 (ref)
                local v124 = string.lower(v123.Name);
                if v37() then
                    return string.find(v124, v60, 1, true) or l_levenshteinDistance_0(v124, v60) <= 1;
                else
                    return string.find(v124, v60) or l_levenshteinDistance_0(v124, v60) <= 1;
                end;
            end);
            local v125 = v43[v60];
            if v41() then
                if v125 and not v62.defaultMaterials then
                    for _, v128 in (l_filter_0(v54:GetDescendants(), function(v126) --[[ Line: 314 ]]
                        -- upvalues: v125 (copy)
                        return v126:IsA("MaterialVariant") and v126.BaseMaterial == v125;
                    end)) do
                        if not table.find(v118, v128) then
                            table.insert(v118, v128);
                        end;
                    end;
                end;
            elseif v125 then
                for _, v131 in (l_filter_0(v54:GetDescendants(), function(v129) --[[ Line: 331 ]]
                    -- upvalues: v125 (copy)
                    return v129:IsA("MaterialVariant") and v129.BaseMaterial == v125;
                end)) do
                    if not table.find(v118, v131) then
                        table.insert(v118, v131);
                    end;
                end;
            end;
            if #v118 > 0 then
                table.sort(v118, function(v132, v133) --[[ Line: 348 ]]
                    return v132.Name < v133.Name;
                end);
                table.sort(v118, function(v134, v135) --[[ Line: 352 ]]
                    -- upvalues: v60 (ref), l_levenshteinDistance_0 (ref)
                    local v136 = string.find(string.lower(v134.Name), v60, 1, true) or 999;
                    local v137 = string.find(string.lower(v135.Name), v60, 1, true) or 999;
                    local v138 = l_levenshteinDistance_0(string.lower(v134.Name), v60);
                    local v139 = l_levenshteinDistance_0(string.lower(v135.Name), v60);
                    return v136 * 1000 + v138 < v137 * 1000 + v139;
                end);
                v106();
                v3(v118[1], v51);
                v98.current = true;
                return v118;
            end;
        elseif not v62.recents then
            table.sort(v118, function(v140, v141) --[[ Line: 375 ]]
                return v140.Name < v141.Name;
            end);
        end;
        return v118;
    end;
    local function v146(v143) --[[ Line: 384 ]] --[[ Name: updateSearchText ]]
        -- upvalues: v60 (ref), v99 (copy), v98 (copy), v97 (copy), v61 (copy)
        if v143 == v60 then
            return;
        else
            for v144, v145 in pairs(v99.current) do
                v144.Material = v145.Material;
                v144.MaterialVariant = v145.MaterialVariant;
            end;
            v98.current = false;
            v97.current = 0;
            v61(v143);
            return;
        end;
    end;
    local function v158(v147) --[[ Line: 396 ]] --[[ Name: commitMaterialToSelection ]]
        -- upvalues: l_getSerializedMaterialIdentifier_0 (ref), v99 (copy), v3 (ref), v51 (copy), v35 (ref), v52 (copy), v6 (ref), v46 (copy), v38 (ref), v5 (ref), v54 (copy), v4 (ref), v62 (copy), v60 (ref), v50 (copy)
        local v148 = l_getSerializedMaterialIdentifier_0(v147);
        v99.current = {};
        v3(v147, v51);
        if v35() then
            v52:SetWaypoint((("Applied %* Material to Selection"):format(v148)));
        end;
        v6(v46.plugin, v147);
        if v38() then
            v46.onMaterialSelected(v147);
        else
            v46.onMaterialSelected(v148);
        end;
        if v35() then
            v5(v147, v54);
        else
            v52:SetWaypoint((("Applied %* Material to Selection"):format(v148)));
        end;
        local v149 = #v51:Get();
        if v149 > 0 then
            local v150 = v4(v148) and "MaterialVariant" or "BaseMaterial";
            local v151 = {};
            for v152, v153 in pairs(v62) do
                if v153 then
                    table.insert(v151, v152);
                end;
            end;
            local l_viewType_0 = v46.viewType;
            local v155 = v60 ~= "";
            local v156 = table.concat(v151, ", ");
            local v157 = #v151;
            v50:report("MaterialApplied", "PopupDropdown", v149, v148, v150, {
                viewType = tostring(l_viewType_0), 
                isSearchBarUsed = v155, 
                filterChips = v156, 
                filterChipsCount = v157
            });
        end;
    end;
    l_useEffect_0(function() --[[ Line: 455 ]]
        -- upvalues: v99 (copy)
        return function() --[[ Line: 456 ]]
            -- upvalues: v99 (ref)
            for v159, v160 in pairs(v99.current) do
                v159.Material = v160.Material;
                v159.MaterialVariant = v160.MaterialVariant;
            end;
        end;
    end, {});
    local v161 = v46.viewType == l_ViewType_0.Grid;
    return l_createElement_0(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        l_createElement_0(l_Pane_0, {
            key = "PrimaryTools", 
            Size = v47.PrimaryTools.Size, 
            Spacing = v47.PrimaryTools.Spacing, 
            Padding = v47.PrimaryTools.Padding, 
            Layout = Enum.FillDirection.Horizontal
        }, {
            l_createElement_0(l_SearchBar_0, {
                key = "SearchBar", 
                PlaceholderText = v48:getText("SearchBar", "SearchMaterials"), 
                ShowSearchIcon = true, 
                ShowSearchButton = false, 
                OnSearchRequested = if v40() then v146 else v61, 
                OnTextChanged = if v40() then v146 else v61, 
                OnTextBoxFocusLost = v40() and function(v162) --[[ Line: 482 ]]
                    -- upvalues: v98 (copy), v142 (copy), v158 (copy), v46 (copy)
                    if v162 and v98.current then
                        local v163 = v142()[1];
                        v158(v163);
                        if v46.onClose then
                            v46.onClose();
                        end;
                    end;
                end or nil, 
                Style = "Compact", 
                Size = v47.PrimaryTools.SearchBar.Size, 
                ShouldFocusOnMount = true
            }, {}), 
            l_createElement_0(l_IconButton_0, {
                key = "ViewToggle", 
                BackgroundStyle = "Box", 
                LeftIcon = if v161 then v47.PrimaryTools.ViewToggle.LeftIconList else v47.PrimaryTools.ViewToggle.LeftIconGrid, 
                Size = v47.PrimaryTools.ViewToggle.Size, 
                TooltipText = if v161 then v48:getText("ViewToggle", "ListView") else v48:getText("ViewToggle", "GridView"), 
                OnClick = function() --[[ Line: 507 ]] --[[ Name: OnClick ]]
                    -- upvalues: v161 (copy), l_ViewType_0 (ref), v46 (copy), v50 (copy)
                    local v164 = if v161 then l_ViewType_0.List else l_ViewType_0.Grid;
                    v46.setViewType(v164);
                    v50:report("ViewTypeToggled", (tostring(v164)));
                end
            }, {})
        }), 
        l_createElement_0(l_ScrollingFrame_0, {
            Size = v47.Filters.Size, 
            ScrollingDirection = Enum.ScrollingDirection.X, 
            HorizontalScrollBarInset = Enum.ScrollBarInset.ScrollBar, 
            ScrollBarThickness = v47.MainView.ScrollBarThickness
        }, {
            l_createElement_0(l_Pane_0, {
                key = "Filters", 
                Layout = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                AutomaticSize = Enum.AutomaticSize.XY, 
                Spacing = 4, 
                Padding = {
                    Left = 8, 
                    Top = 1
                }
            }, {
                l_createElement_0(v33, {
                    Text = v48:getText("Filters", "Recents"), 
                    OnClick = function() --[[ Line: 535 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_copy_0 (ref), v62 (copy), v63 (copy), v46 (copy), v50 (copy)
                        local v165 = l_copy_0(v62);
                        v165.recents = not v62.recents;
                        v63(v165);
                        if v46.onFilterChipsUpdate then
                            v46.onFilterChipsUpdate(v165);
                        end;
                        local v166 = v165.recents and "On" or "Off";
                        v50:report("FilterChipToggled", "Recents", v166);
                    end, 
                    selected = v62.recents
                }), 
                l_createElement_0(v33, {
                    Text = v48:getText("Filters", "AppliedInPlace"), 
                    OnClick = function() --[[ Line: 552 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_copy_0 (ref), v62 (copy), v63 (copy), v46 (copy), v50 (copy)
                        local v167 = l_copy_0(v62);
                        v167.appliedInPlace = not v62.appliedInPlace;
                        v63(v167);
                        if v46.onFilterChipsUpdate then
                            v46.onFilterChipsUpdate(v167);
                        end;
                        local v168 = v167.appliedInPlace and "On" or "Off";
                        v50:report("FilterChipToggled", "AppliedInPlace", v168);
                    end, 
                    selected = v62.appliedInPlace
                }), 
                if v41() then l_createElement_0(v34, {
                    LeftText = v48:getText("Filters", "CustomMaterials"), 
                    RightText = v48:getText("Filters", "DefaultMaterials"), 
                    LeftSelected = v62.customMaterials, 
                    RightSelected = v62.defaultMaterials, 
                    OnClickLeft = function() --[[ Line: 573 ]] --[[ Name: OnClickLeft ]]
                        -- upvalues: l_copy_0 (ref), v62 (copy), v63 (copy), v46 (copy), v50 (copy)
                        local v169 = l_copy_0(v62);
                        if v169.defaultMaterials then
                            v169.defaultMaterials = false;
                        end;
                        v169.customMaterials = not v62.customMaterials;
                        v63(v169);
                        if v46.onFilterChipsUpdate then
                            v46.onFilterChipsUpdate(v169);
                        end;
                        local v170 = v169.customMaterials and "On" or "Off";
                        v50:report("FilterChipToggled", "CustomMaterials", v170);
                    end, 
                    OnClickRight = function() --[[ Line: 592 ]] --[[ Name: OnClickRight ]]
                        -- upvalues: l_copy_0 (ref), v62 (copy), v63 (copy), v46 (copy), v50 (copy)
                        local v171 = l_copy_0(v62);
                        v171.defaultMaterials = not v62.defaultMaterials;
                        if v171.customMaterials then
                            v171.customMaterials = false;
                        end;
                        v63(v171);
                        if v46.onFilterChipsUpdate then
                            v46.onFilterChipsUpdate(v171);
                        end;
                        local v172 = v171.defaultMaterials and "On" or "Off";
                        v50:report("FilterChipToggled", "DefaultMaterials", v172);
                    end
                }) else l_createElement_0(v33, {
                    Text = v48:getText("Filters", "CustomMaterials"), 
                    OnClick = function() --[[ Line: 613 ]] --[[ Name: OnClick ]]
                        -- upvalues: l_copy_0 (ref), v62 (copy), v63 (copy), v46 (copy), v50 (copy)
                        local v173 = l_copy_0(v62);
                        v173.customMaterials = not v62.customMaterials;
                        v63(v173);
                        if v46.onFilterChipsUpdate then
                            v46.onFilterChipsUpdate(v173);
                        end;
                        local v174 = v173.customMaterials and "On" or "Off";
                        v50:report("FilterChipToggled", "CustomMaterials", v174);
                    end, 
                    selected = v62.customMaterials
                })
            })
        }), 
        l_createElement_0(l_MaterialGrid_0, {
            key = "MaterialGrid", 
            AppliedItemId = v117(), 
            ShouldCenterTooltip = true, 
            ContainerXBounds = v47.MaterialGrid.ContainerXBounds, 
            ContainerYBounds = v47.MaterialGrid.ContainerYBounds, 
            Size = v47.MaterialGrid.Size, 
            GridItemsPerRow = v47.MaterialGrid.GridItemsPerRow, 
            GridItemSize = v47.MaterialGrid.GridItemSize, 
            Items = if v40() then v142() else v96(), 
            ShowGridLabels = false, 
            OnClick = v40() and function(v175) --[[ Line: 644 ]]
                -- upvalues: v158 (copy)
                v158(v175.Material);
            end or function(v176) --[[ Line: 647 ]]
                -- upvalues: l_getSerializedMaterialIdentifier_0 (ref), v99 (copy), v3 (ref), v51 (copy), v35 (ref), v52 (copy), v6 (ref), v46 (copy), v38 (ref), v5 (ref), v54 (copy), v4 (ref), v62 (copy), v60 (ref), v50 (copy)
                local v177 = l_getSerializedMaterialIdentifier_0(v176.Material);
                v99.current = {};
                v3(v176.Material, v51);
                if v35() then
                    v52:SetWaypoint((("Applied %* Material to Selection"):format(v177)));
                end;
                v6(v46.plugin, v176.Material);
                if v38() then
                    v46.onMaterialSelected(v176.Material);
                else
                    v46.onMaterialSelected(v177);
                end;
                if v35() then
                    v5(v176.Material, v54);
                else
                    v52:SetWaypoint((("Applied %* Material to Selection"):format(v177)));
                end;
                local v178 = #v51:Get();
                if v178 > 0 then
                    local v179 = v4(v177) and "MaterialVariant" or "BaseMaterial";
                    local v180 = {};
                    for v181, v182 in pairs(v62) do
                        if v182 then
                            table.insert(v180, v181);
                        end;
                    end;
                    local l_viewType_1 = v46.viewType;
                    local v184 = v60 ~= "";
                    local v185 = table.concat(v180, ", ");
                    local v186 = #v180;
                    v50:report("MaterialApplied", "PopupDropdown", v178, v177, v179, {
                        viewType = tostring(l_viewType_1), 
                        isSearchBarUsed = v184, 
                        filterChips = v185, 
                        filterChipsCount = v186
                    });
                end;
            end, 
            OnMouseEnter = function(v187) --[[ Line: 705 ]] --[[ Name: OnMouseEnter ]]
                -- upvalues: v97 (copy), v40 (ref), v98 (copy), v106 (copy), v3 (ref), v51 (copy)
                local l_v97_0 = v97;
                l_v97_0.current = l_v97_0.current + 1;
                if v40() then
                    v98.current = false;
                end;
                v106();
                v3(v187.Material, v51);
            end, 
            OnMouseLeave = function() --[[ Line: 715 ]] --[[ Name: OnMouseLeave ]]
                -- upvalues: v97 (copy), v99 (copy)
                local l_v97_1 = v97;
                l_v97_1.current = l_v97_1.current - 1;
                if v97.current == 0 then
                    for v190, v191 in pairs(v99.current) do
                        v190.Material = v191.Material;
                        v190.MaterialVariant = v191.MaterialVariant;
                    end;
                end;
            end, 
            ListPadding = v47.MaterialGrid.ListPadding, 
            OnScrollUpdate = v46.onScrollUpdate, 
            OnSnapshotTaken = v46.onSnapshotTaken, 
            ViewType = v46.viewType, 
            InitialGridCanvasPosition = v46.savedGridCanvasPosition, 
            InitialListCanvasPosition = v46.savedListCanvasPosition, 
            ScrollingDirection = Enum.ScrollingDirection.Y, 
            SelectedItemId = v46.selectedMaterialIdentifier, 
            ShouldSyncScroll = true, 
            SnapshotSize = v47.MaterialGrid.SnapshotSize, 
            SnapshotBorderThickness = v47.MaterialGrid.SnapshotBorderThickness, 
            TooltipDelay = v47.MaterialGrid.TooltipDelay, 
            UseInstantTooltip = true
        }), 
        l_createElement_0(l_Pane_0, {
            key = "Footer", 
            Size = v47.Footer.Size, 
            Layout = Enum.FillDirection.Horizontal, 
            Padding = v47.Footer.Padding, 
            Spacing = v47.Footer.Spacing
        }, {
            v36() and l_createElement_0(l_IconButton_0, {
                Text = v48:getText("MainView", "MaterialGeneratorButton"), 
                Size = v47.Footer.IconButton.MaterialGeneratorButton.Size, 
                LeftIcon = v47.Footer.IconButton.MaterialGeneratorButton.Icon, 
                IconSize = v47.Footer.IconButton.IconSize, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                Spacing = v47.Footer.IconButton.Spacing, 
                Padding = v47.Footer.IconButton.Padding, 
                BackgroundColor = if v39() then v47.Footer.IconButton.BackgroundColor else if v56 then v47.Footer.IconButton.ActiveBackgroundColor else v47.Footer.IconButton.BackgroundColor, 
                OnClick = function() --[[ Line: 755 ]] --[[ Name: OnClick ]]
                    -- upvalues: v39 (ref), v56 (copy), l_MemStorageService_0 (copy), v1 (ref), v57 (copy), v50 (copy), v46 (copy)
                    if v39() then
                        if not v56 then
                            local v192 = nil;
                            do
                                local l_v192_0 = v192;
                                l_v192_0 = l_MemStorageService_0:Bind(v1.MATERIAL_GENERATOR_READY, function() --[[ Line: 761 ]]
                                    -- upvalues: l_v192_0 (ref), l_MemStorageService_0 (ref), v1 (ref), v57 (ref), v50 (ref)
                                    l_v192_0:Disconnect();
                                    l_MemStorageService_0:Fire(v1.SHOW_MATERIAL_GENERATOR_PLUGIN_EVENT);
                                    v57(true);
                                    v50:report("MaterialGeneratorOpened");
                                end);
                                l_MemStorageService_0:Fire(v1.LOAD_MATERIAL_GENERATOR);
                            end;
                        end;
                        if v46.onClose then
                            v46.onClose();
                            return;
                        end;
                    elseif v56 then
                        l_MemStorageService_0:Fire(v1.DEPRECATED_HIDE_MATERIAL_GENERATOR_PLUGIN_EVENT);
                        v57(false);
                        return;
                    else
                        local v194 = nil;
                        do
                            local l_v194_0 = v194;
                            l_v194_0 = l_MemStorageService_0:Bind(v1.MATERIAL_GENERATOR_READY, function() --[[ Line: 785 ]]
                                -- upvalues: l_v194_0 (ref), l_MemStorageService_0 (ref), v1 (ref), v57 (ref), v50 (ref)
                                l_v194_0:Disconnect();
                                l_MemStorageService_0:Fire(v1.SHOW_MATERIAL_GENERATOR_PLUGIN_EVENT);
                                v57(true);
                                v50:report("MaterialGeneratorOpened");
                            end);
                            l_MemStorageService_0:Fire(v1.LOAD_MATERIAL_GENERATOR);
                        end;
                    end;
                end
            }), 
            l_createElement_0(l_IconButton_0, {
                Text = v48:getText("MainView", "MaterialManagerButton"), 
                Size = v47.Footer.IconButton.MaterialManagerButton.Size, 
                LeftIcon = v47.Footer.IconButton.MaterialManagerButton.Icon, 
                IconSize = v47.Footer.IconButton.IconSize, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                Spacing = v47.Footer.IconButton.Spacing, 
                Padding = v47.Footer.IconButton.Padding, 
                BackgroundColor = if v39() then v47.Footer.IconButton.BackgroundColor else if v58 then v47.Footer.IconButton.ActiveBackgroundColor else v47.Footer.IconButton.BackgroundColor, 
                OnClick = function() --[[ Line: 811 ]] --[[ Name: OnClick ]]
                    -- upvalues: v39 (ref), v58 (copy), l_MemStorageService_0 (copy), v1 (ref), v59 (copy), v50 (copy), v46 (copy)
                    if v39() then
                        if not v58 then
                            l_MemStorageService_0:Fire(v1.SHOW_MATERIAL_MANAGER_PLUGIN_EVENT);
                            v59(true);
                            v50:report("MaterialManagerOpened");
                        end;
                        if v46.onClose then
                            v46.onClose();
                            return;
                        end;
                    elseif v58 then
                        l_MemStorageService_0:Fire(v1.DEPRECATED_HIDE_MATERIAL_MANAGER_PLUGIN_EVENT);
                        v59(false);
                        return;
                    else
                        l_MemStorageService_0:Fire(v1.SHOW_MATERIAL_MANAGER_PLUGIN_EVENT);
                        v59(true);
                        v50:report("MaterialManagerOpened");
                    end;
                end
            })
        })
    });
end;
return MainView;