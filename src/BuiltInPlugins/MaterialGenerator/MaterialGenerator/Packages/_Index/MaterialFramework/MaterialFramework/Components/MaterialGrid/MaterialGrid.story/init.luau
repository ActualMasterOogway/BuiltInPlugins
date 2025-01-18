local l_select_0 = select;
local function v6(v1, v2, ...)
    local v3, v4 = {
        ...
    }, l_select_0("#", ...);
    for v5 = v2, v2 + v4 - 1 do
        v1[v5] = v3[v5 - v2 + 1];
    end;
end;
local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Types);
local l_Parent_1 = l_Parent_0.Parent;
local v10 = require(l_Parent_1.Dash);
local v11 = require(l_Parent_1.React);
local v12 = require(l_Parent_0.Components.MaterialGrid);
local v13 = require(l_Parent_0.Enums.MaterialPreviewGeometryType);
local v14 = require(l_Parent_0.Enums.ViewType);
local v15 = require(l_Parent_0.TestHelpers.createMaterialVariants);
local function v21() --[[ Line: 13 ]] --[[ Name: getTestMaterials ]]
    -- upvalues: v10 (copy)
    local v18 = v10.filter(Enum.Material:GetEnumItems(), function(v16) --[[ Line: 14 ]]
        local v17 = false;
        if v16 ~= Enum.Material.Air then
            v17 = v16 ~= Enum.Material.Water;
        end;
        return v17;
    end);
    table.sort(v18, function(v19, v20) --[[ Line: 17 ]]
        return v19.Name < v20.Name;
    end);
    return v18;
end;
local v22 = UDim2.new(1, 0, 0, 150);
local v23 = v15();
local v24 = v21();
local v25 = {
    {
        Loading = true, 
        Material = Enum.Material.Brick
    }, 
    Enum.Material.Basalt, 
    Enum.Material.Grass
};
local function v28(v26) --[[ Line: 35 ]] --[[ Name: createSimpleGrid ]]
    -- upvalues: v10 (copy), v14 (copy), v11 (copy), v12 (copy)
    local v27 = v10.join({
        Items = {}, 
        ShowGridLabels = false, 
        ViewType = v14.Grid
    }, v26);
    return v11.createElement(v12, v27);
end;
local _ = function(v29) --[[ Line: 44 ]] --[[ Name: createGridStory ]]
    -- upvalues: v24 (copy), v11 (copy), v28 (copy), v10 (copy)
    local v30 = v29.Items or v24;
    return function() --[[ Line: 47 ]]
        -- upvalues: v11 (ref), v30 (copy), v28 (ref), v10 (ref), v24 (ref), v29 (copy)
        local v31, v32 = v11.useState(false);
        v11.useEffect(function() --[[ Line: 49 ]]
            -- upvalues: v30 (ref)
            for _, v34 in v30 do
                if typeof(v34) == "Instance" and v34:IsA("MaterialVariant") then
                    v34.Parent = game:GetService("MaterialService");
                end;
            end;
            return function() --[[ Line: 56 ]]
                -- upvalues: v30 (ref)
                for _, v36 in v30 do
                    if typeof(v36) == "Instance" and v36:IsA("MaterialVariant") then
                        v36.Parent = nil;
                    end;
                end;
            end;
        end, {
            v30
        });
        return v28(v10.join({
            Items = v24, 
            OnClick = function(v37) --[[ Line: 67 ]] --[[ Name: OnClick ]]
                -- upvalues: v32 (copy)
                v32(v37);
            end, 
            SelectedItem = v31
        }, v29));
    end;
end;
local v39 = {};
local v40 = {};
local v41 = {
    name = "Grid", 
    summary = "The item size can be set using props or style"
};
local v42 = {
    Size = UDim2.new(1, 0, 0, 400), 
    ViewType = v14.Grid
};
local v43 = v42.Items or v24;
local l_v43_0 = v43 --[[ copy: 21 -> 26 ]];
local l_v42_0 = v42 --[[ copy: 20 -> 27 ]];
v41.story = function() --[[ Line: 47 ]]
    -- upvalues: v11 (copy), l_v43_0 (copy), v28 (copy), v10 (copy), v24 (copy), l_v42_0 (copy)
    local v46, v47 = v11.useState(false);
    v11.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: l_v43_0 (ref)
        for _, v49 in l_v43_0 do
            if typeof(v49) == "Instance" and v49:IsA("MaterialVariant") then
                v49.Parent = game:GetService("MaterialService");
            end;
        end;
        return function() --[[ Line: 56 ]]
            -- upvalues: l_v43_0 (ref)
            for _, v51 in l_v43_0 do
                if typeof(v51) == "Instance" and v51:IsA("MaterialVariant") then
                    v51.Parent = nil;
                end;
            end;
        end;
    end, {
        l_v43_0
    });
    return v28(v10.join({
        Items = v24, 
        OnClick = function(v52) --[[ Line: 67 ]] --[[ Name: OnClick ]]
            -- upvalues: v47 (copy)
            v47(v52);
        end, 
        SelectedItem = v46
    }, l_v42_0));
end;
local v53 = {
    name = "List", 
    summary = "The item height can be set using props or style"
};
v43 = {
    Size = UDim2.new(0, 200, 0, 400), 
    ViewType = v14.List
};
local v54 = v43.Items or v24;
local l_v54_0 = v54 --[[ copy: 22 -> 28 ]];
local l_v43_1 = v43 --[[ copy: 21 -> 29 ]];
v53.story = function() --[[ Line: 47 ]]
    -- upvalues: v11 (copy), l_v54_0 (copy), v28 (copy), v10 (copy), v24 (copy), l_v43_1 (copy)
    local v57, v58 = v11.useState(false);
    v11.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: l_v54_0 (ref)
        for _, v60 in l_v54_0 do
            if typeof(v60) == "Instance" and v60:IsA("MaterialVariant") then
                v60.Parent = game:GetService("MaterialService");
            end;
        end;
        return function() --[[ Line: 56 ]]
            -- upvalues: l_v54_0 (ref)
            for _, v62 in l_v54_0 do
                if typeof(v62) == "Instance" and v62:IsA("MaterialVariant") then
                    v62.Parent = nil;
                end;
            end;
        end;
    end, {
        l_v54_0
    });
    return v28(v10.join({
        Items = v24, 
        OnClick = function(v63) --[[ Line: 67 ]] --[[ Name: OnClick ]]
            -- upvalues: v58 (copy)
            v58(v63);
        end, 
        SelectedItem = v57
    }, l_v43_1));
end;
v42 = {
    name = "Loading", 
    summary = "Show items with a shimmer effect"
};
v54 = {
    Items = v25, 
    ShowGridLabels = true, 
    Size = v22, 
    ViewType = v14.Grid
};
local v64 = v54.Items or v24;
local l_v64_0 = v64 --[[ copy: 23 -> 30 ]];
local l_v54_1 = v54 --[[ copy: 22 -> 31 ]];
v42.story = function() --[[ Line: 47 ]]
    -- upvalues: v11 (copy), l_v64_0 (copy), v28 (copy), v10 (copy), v24 (copy), l_v54_1 (copy)
    local v67, v68 = v11.useState(false);
    v11.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: l_v64_0 (ref)
        for _, v70 in l_v64_0 do
            if typeof(v70) == "Instance" and v70:IsA("MaterialVariant") then
                v70.Parent = game:GetService("MaterialService");
            end;
        end;
        return function() --[[ Line: 56 ]]
            -- upvalues: l_v64_0 (ref)
            for _, v72 in l_v64_0 do
                if typeof(v72) == "Instance" and v72:IsA("MaterialVariant") then
                    v72.Parent = nil;
                end;
            end;
        end;
    end, {
        l_v64_0
    });
    return v28(v10.join({
        Items = v24, 
        OnClick = function(v73) --[[ Line: 67 ]] --[[ Name: OnClick ]]
            -- upvalues: v68 (copy)
            v68(v73);
        end, 
        SelectedItem = v67
    }, l_v54_1));
end;
v43 = {
    name = "Plane", 
    summary = "Shows item as a Plane."
};
v64 = {
    Items = v23, 
    MaterialPreviewGeometryType = v13.Plane, 
    Size = v22
};
local v74 = v64.Items or v24;
local l_v74_0 = v74 --[[ copy: 24 -> 32 ]];
v43.story = function() --[[ Line: 47 ]]
    -- upvalues: v11 (copy), l_v74_0 (copy), v28 (copy), v10 (copy), v24 (copy), v64 (copy)
    local v76, v77 = v11.useState(false);
    v11.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: l_v74_0 (ref)
        for _, v79 in l_v74_0 do
            if typeof(v79) == "Instance" and v79:IsA("MaterialVariant") then
                v79.Parent = game:GetService("MaterialService");
            end;
        end;
        return function() --[[ Line: 56 ]]
            -- upvalues: l_v74_0 (ref)
            for _, v81 in l_v74_0 do
                if typeof(v81) == "Instance" and v81:IsA("MaterialVariant") then
                    v81.Parent = nil;
                end;
            end;
        end;
    end, {
        l_v74_0
    });
    return v28(v10.join({
        Items = v24, 
        OnClick = function(v82) --[[ Line: 67 ]] --[[ Name: OnClick ]]
            -- upvalues: v77 (copy)
            v77(v82);
        end, 
        SelectedItem = v76
    }, v64));
end;
v54 = {
    name = "Dominus", 
    summary = "Shows item as a Dominus."
};
v74 = {
    MaterialPreviewGeometryType = v13.Dominus, 
    Size = v22
};
local v83 = v74.Items or v24;
v54.story = function() --[[ Line: 47 ]]
    -- upvalues: v11 (copy), v83 (copy), v28 (copy), v10 (copy), v24 (copy), v74 (copy)
    local v84, v85 = v11.useState(false);
    v11.useEffect(function() --[[ Line: 49 ]]
        -- upvalues: v83 (ref)
        for _, v87 in v83 do
            if typeof(v87) == "Instance" and v87:IsA("MaterialVariant") then
                v87.Parent = game:GetService("MaterialService");
            end;
        end;
        return function() --[[ Line: 56 ]]
            -- upvalues: v83 (ref)
            for _, v89 in v83 do
                if typeof(v89) == "Instance" and v89:IsA("MaterialVariant") then
                    v89.Parent = nil;
                end;
            end;
        end;
    end, {
        v83
    });
    return v28(v10.join({
        Items = v24, 
        OnClick = function(v90) --[[ Line: 67 ]] --[[ Name: OnClick ]]
            -- upvalues: v85 (copy)
            v85(v90);
        end, 
        SelectedItem = v84
    }, v74));
end;
v6(v40, 1, v41, v53, v42, v43, v54);
v39.stories = v40;
return v39;