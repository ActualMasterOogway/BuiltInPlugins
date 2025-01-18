local _ = script.Parent.Parent.Parent;
local v1 = {
    MANNEQUIN_PATH = "rbxasset://models/LayeredClothingEditor/mannequin.rbxm", 
    MANNEQUIN_MOCK_PATH = "rbxasset://models/LayeredClothingEditor/mannequin_mock.rbxm", 
    MESH_PART_HEAD_TEMPLATE_PATH = "rbxasset://models/LayeredClothingEditor/MeshPartHeadTemplate.rbxm", 
    HEAD_TEMPLATE_PATH = "rbxasset://models/LayeredClothingEditor/PartHeadTemplate.rbxm", 
    PREVIEW_ASSETS_FOLDER = "AccessoryFittingToolPreviewAssets", 
    LAYER_LIMIT = 5, 
    AVATAR_LIMIT = 3, 
    CUBE_CORNERS = {
        LeftBottomFront = Vector3.new(-0.5, -0.5, -0.5, 0), 
        LeftBottomBack = Vector3.new(-0.5, -0.5, 0.5, 0), 
        RightBottomFront = Vector3.new(0.5, -0.5, -0.5, 0), 
        LeftTopFront = Vector3.new(-0.5, 0.5, -0.5, 0), 
        RightTopFront = Vector3.new(0.5, 0.5, -0.5, 0), 
        LeftTopBack = Vector3.new(-0.5, 0.5, 0.5, 0), 
        RightBottomBack = Vector3.new(0.5, -0.5, 0.5, 0), 
        RightTopBack = Vector3.new(0.5, 0.5, 0.5, 0)
    }
};
v1.CUBE_EDGES = {
    {
        v1.CUBE_CORNERS.LeftBottomFront, 
        v1.CUBE_CORNERS.LeftBottomBack
    }, 
    {
        v1.CUBE_CORNERS.LeftBottomBack, 
        v1.CUBE_CORNERS.RightBottomBack
    }, 
    {
        v1.CUBE_CORNERS.RightBottomBack, 
        v1.CUBE_CORNERS.RightBottomFront
    }, 
    {
        v1.CUBE_CORNERS.RightBottomFront, 
        v1.CUBE_CORNERS.LeftBottomFront
    }, 
    {
        v1.CUBE_CORNERS.LeftTopFront, 
        v1.CUBE_CORNERS.LeftTopBack
    }, 
    {
        v1.CUBE_CORNERS.LeftTopBack, 
        v1.CUBE_CORNERS.RightTopBack
    }, 
    {
        v1.CUBE_CORNERS.RightTopBack, 
        v1.CUBE_CORNERS.RightTopFront
    }, 
    {
        v1.CUBE_CORNERS.RightTopFront, 
        v1.CUBE_CORNERS.LeftTopFront
    }, 
    {
        v1.CUBE_CORNERS.LeftBottomFront, 
        v1.CUBE_CORNERS.LeftTopFront
    }, 
    {
        v1.CUBE_CORNERS.LeftBottomBack, 
        v1.CUBE_CORNERS.LeftTopBack
    }, 
    {
        v1.CUBE_CORNERS.RightBottomFront, 
        v1.CUBE_CORNERS.RightTopFront
    }, 
    {
        v1.CUBE_CORNERS.RightBottomBack, 
        v1.CUBE_CORNERS.RightTopBack
    }
};
v1.MAX_TRANSPARENCY_PERCENT = 100;
v1.LOCALIZATION_KEYS = {
    Editor = "Editor", 
    Preview = "Preview", 
    Avatars = "Avatars", 
    Clothing = "Clothing", 
    Animations = "Animations"
};
v1.SCALE_TYPES = {
    Classic = "Classic", 
    ProportionsNormal = "ProportionsNormal", 
    ProportionsSlender = "ProportionsSlender"
};
return v1;