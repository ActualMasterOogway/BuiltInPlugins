local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.src.utils.convertArrayToTable);
local v2 = {
    NAME = "AvatarImporter", 
    TITLE = "Avatar Importer", 
    TOOLBAR_NAME = "Avatar", 
    BUTTON_NAME = "Avatar Importer", 
    BUTTON_TOOLTIP = "Import an Avatar with a .fbx file", 
    AVATAR_IMPORTER_DEVHUB = "articles/using-avatar-importer", 
    AVATAR_IMPORTER_DEVHUB_URL = "https://developer.roblox.com/en-us/articles/using-avatar-importer", 
    CLICK_HERE = "Click here to learn more.", 
    AVATAR_TYPE = {
        RTHRO = "Rthro", 
        RTHRO_SLENDER = "RthroSlender", 
        R15 = "R15", 
        CUSTOM = "Custom"
    }, 
    TYPE_TO_SCALE = {
        Rthro = "ProportionsNormal", 
        RthroSlender = "ProportionsSlender", 
        R15 = "Classic"
    }, 
    RTHRO_INFO = {
        title = "Rthro Type", 
        height = 6.25, 
        description = "shoulders wider than hips"
    }, 
    RTHRO_SLENDER_INFO = {
        title = "Rthro Slender Type", 
        height = 5.625, 
        description = "shoulders narrower than hips"
    }, 
    R15_INFO = {
        title = "R15 Type", 
        height = 5
    }, 
    CUSTOM_INFO = {
        title = "Custom Type"
    }, 
    BUTTON_AMT = 4, 
    BUTTON_WIDTH = 146, 
    BUTTON_HEIGHT = 219, 
    BUTTON_SIDE_PADDING = 67, 
    BUTTON_CENTER_PADDING = 37, 
    BUTTON_TOP_PADDING = 63
};
v2.BACKGROUND_WIDTH = v2.BUTTON_SIDE_PADDING + v2.BUTTON_WIDTH * v2.BUTTON_AMT + v2.BUTTON_CENTER_PADDING * (v2.BUTTON_AMT - 1) + v2.BUTTON_SIDE_PADDING;
v2.BACKGROUND_HEIGHT = 413;
v2.SCREENS = v1({
    "AVATAR", 
    "LOADING", 
    "ERROR", 
    "REDIRECT_RIG"
});
v2.SCALE_VALUES_DEFAULTS = {
    [v2.AVATAR_TYPE.R15] = {
        HeadScale = 1, 
        BodyHeightScale = 1, 
        BodyWidthScale = 1, 
        BodyDepthScale = 1, 
        BodyTypeScale = 0, 
        BodyProportionScale = 0
    }, 
    [v2.AVATAR_TYPE.RTHRO] = {
        HeadScale = 1, 
        BodyHeightScale = 1, 
        BodyWidthScale = 1, 
        BodyDepthScale = 1, 
        BodyTypeScale = 1, 
        BodyProportionScale = 0
    }, 
    [v2.AVATAR_TYPE.RTHRO_SLENDER] = {
        HeadScale = 1, 
        BodyHeightScale = 1, 
        BodyWidthScale = 1, 
        BodyDepthScale = 1, 
        BodyTypeScale = 1, 
        BodyProportionScale = 1
    }
};
v2.ERROR_NO_FILE = "No FBX file selected";
v2.FONT = Enum.Font.SourceSans;
v2.FONT_SEMIBOLD = Enum.Font.SourceSansSemibold;
v2.FONT_BOLD = Enum.Font.SourceSansBold;
v2.FONT_SIZE_SMALL = 14;
v2.FONT_SIZE_MEDIUM = 16;
v2.FONT_SIZE_LARGE = 18;
v2.FONT_SIZE_TITLE = 20;
v2.REQUIREMENTS_DESCRIPTION = "Avatar file needs to be FBX file following Avatar types and import requirements";
v2.REQUIREMENTS_LINK_TEXT = "What are Avatar types and import requirements?";
v2.WARNING_COLOR = Color3.fromHex("#FFC107");
v2.WARNING_TEXT_COLOR = Color3.fromHex("#212529");
return v2;