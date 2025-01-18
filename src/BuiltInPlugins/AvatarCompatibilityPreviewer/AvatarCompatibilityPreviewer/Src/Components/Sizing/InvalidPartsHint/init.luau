local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local _ = require(l_script_FirstAncestor_0.Src.Components.Sizing.AvatarSizeSpecificationUtils);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Src.Components.Sizing.AvatarSizeRulerRender);
local v4 = require(l_script_FirstAncestor_0.Packages.Framework);
local function v9(v5) --[[ Line: 13 ]] --[[ Name: InvalidHighlight ]]
    -- upvalues: v2 (copy)
    local v6 = {};
    for _, v8 in v5.segmentParts do
        v6[v8.Name] = v2.createElement("Highlight", {
            Adornee = v8, 
            FillTransparency = 0.5, 
            OutlineTransparency = 0, 
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        });
    end;
    return v2.createElement("Folder", {
        Archivable = false
    }, v6);
end;
return function(v10) --[[ Line: 30 ]] --[[ Name: InvalidPartsHint ]]
    -- upvalues: v4 (copy), v2 (copy), v3 (copy), v9 (copy)
    local v11 = v4.ContextServices.Localization:use();
    local v12 = {};
    local v13 = false;
    for _, v15 in v10.invalidBodyParts do
        v12[v15.key] = v2.createElement("Folder", {}, {
            Ruler = if not v13 then v2.createElement(v3, {
                ItemName = v11:getText("BodySegmentTypes", v15.bodySegmentType), 
                Size = v15.size, 
                CFrame = v15.cframe, 
                SizeBounds = v15.sizeBounds
            }) else nil, 
            Highlights = v2.createElement(v9, v15)
        });
        v13 = true;
    end;
    return v2.createElement("Folder", {
        Archivable = false
    }, v12);
end;