local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.enumerate);
return {
    getEnumAsList = function(v2) --[[ Line: 14 ]]
        local v3 = {};
        for _, v5 in v2 do
            table.insert(v3, v5);
        end;
        return v3;
    end, 
    Scope = {
        User = "User", 
        Group = "Group", 
        Universe = "Universe"
    }, 
    AssetType = {
        Model = "Model", 
        Package = "Package", 
        Decal = "Decal", 
        Audio = "Audio", 
        Animation = "Animation", 
        Plugin = "Plugin", 
        MeshPart = "MeshPart", 
        Video = "Video", 
        FontFamily = "FontFamily", 
        Image = "Image", 
        Mesh = "Mesh"
    }, 
    ModerationStatus = {
        Reviewing = "MODERATION_STATE_REVIEWING", 
        Rejected = "MODERATION_STATE_REJECTED", 
        Approved = "MODERATION_STATE_APPROVED"
    }, 
    AssetInfoField = {
        AssetId = "AssetId", 
        AssetType = "AssetType", 
        DisplayName = "DisplayName", 
        VersionNumber = "VersionNumber", 
        Created = "Created", 
        Modified = "Modified", 
        ModerationStatus = "ModerationStatus", 
        Creator = "Creator"
    }, 
    ViewType = v1("ViewType", {
        List = 1, 
        Grid = 2, 
        Unsupported = 3
    }), 
    MenuContext = {
        Asset = "Asset", 
        Scope = "Scope", 
        Column = "Column", 
        Sidebar = "Sidebar"
    }
};