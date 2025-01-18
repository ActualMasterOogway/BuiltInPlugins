local l_script_FirstAncestor_0 = script:FindFirstAncestor("Foundation");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_script_FirstAncestor_0.Utility.Flags);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.Cryo);
local v5 = require(l_Parent_0.ReactIs);
local v6 = require(l_Parent_0.FoundationImages);
local v7 = require(l_script_FirstAncestor_0.Components.Interactable);
local l_Images_0 = v6.Images;
local v9 = require(script.Parent.ImageSet.getScaledSlice);
local _ = require(l_script_FirstAncestor_0.Components.Types);
local v11 = require(l_script_FirstAncestor_0.Utility.withDefaults);
local v12 = require(l_script_FirstAncestor_0.Utility.useDefaultTags);
local v13 = require(l_script_FirstAncestor_0.Utility.withGuiObjectProps);
local v14 = require(l_script_FirstAncestor_0.Utility.useStyledDefaults);
local v15 = require(l_script_FirstAncestor_0.Utility.indexBindable);
local v16 = require(l_script_FirstAncestor_0.Utility.GuiObjectChildren);
local v17 = require(l_script_FirstAncestor_0.Providers.Style.useStyleTags);
local v18 = {
    AutoLocalize = false, 
    AutoButtonColor = false, 
    BorderSizePixel = 0, 
    isDisabled = false
};
return v3.memo(v3.forwardRef(function(v19, v20) --[[ Line: 59 ]] --[[ Name: Image ]]
    -- upvalues: v2 (copy), v14 (copy), v18 (copy), v11 (copy), v5 (copy), l_Images_0 (copy), v9 (copy), v12 (copy), v17 (copy), v13 (copy), v15 (copy), v3 (copy), v7 (copy), v4 (copy), v16 (copy)
    local v21 = if v2.FoundationStylingPolyfill then v14("Image", v19.tag, "gui-object-defaults", v18) else nil;
    local v22 = v11(v19, if v2.FoundationStylingPolyfill then v21 else v18);
    local v23 = true;
    if v22.onStateChanged == nil then
        v23 = v22.onActivated ~= nil;
    end;
    local l_Image_0 = v22.Image;
    local v25 = if v5.isBinding(l_Image_0) then l_Image_0:getValue() else l_Image_0;
    local v26 = false;
    if v25 ~= nil then
        v26 = v25:match("^%w+://.*$") == nil;
    end;
    local v27 = if v26 then l_Images_0[v25] else nil;
    local v28 = nil;
    local v29 = nil;
    if v22.imageRect then
        v28 = v22.imageRect.offset;
        v29 = v22.imageRect.size;
    end;
    if v27 then
        l_Image_0 = v27.Image;
        v28 = v27.ImageRectOffset;
        v29 = v27.ImageRectSize;
    end;
    local v30 = nil;
    local v31 = nil;
    local l_ScaleType_0 = v22.ScaleType;
    if v22.slice then
        v30 = v22.slice.center;
        v31 = v22.slice.scale;
        if v26 then
            local v33, v34 = v9(v30, v31);
            v30 = v33;
            v31 = v34;
        end;
        l_ScaleType_0 = Enum.ScaleType.Slice;
    end;
    local v35 = v12(v22.tag, "gui-object-defaults");
    local v36 = v17(v35);
    local v37 = v23 and "ImageButton" or "ImageLabel";
    local v38 = v13(v22, {
        AutoButtonColor = if v37 == "ImageButton" then v22.AutoButtonColor else nil, 
        Image = l_Image_0, 
        ImageColor3 = if v22.imageStyle then v15(v22.imageStyle, "Color3") else nil, 
        ImageTransparency = if v22.imageStyle then v15(v22.imageStyle, "Transparency") else nil, 
        ImageRectOffset = v28, 
        ImageRectSize = v29, 
        ResampleMode = v22.ResampleMode, 
        ScaleType = l_ScaleType_0, 
        SliceCenter = v30, 
        SliceScale = v31, 
        TileSize = v22.TileSize, 
        ref = v20, 
        [v3.Tag] = v36
    });
    local v39 = if v23 then v7 else v37;
    local v40 = if v23 then v4.Dictionary.union(v38, {
        component = v37, 
        onActivated = v22.onActivated, 
        onStateChanged = v22.onStateChanged, 
        stateLayer = v22.stateLayer, 
        isDisabled = v22.isDisabled
    }) else v38;
    return v3.createElement(v39, v40, v16(v22));
end));