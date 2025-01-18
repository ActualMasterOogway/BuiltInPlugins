local l_Parent_0 = script:FindFirstAncestor("UI").Parent;
local v1 = require(l_Parent_0.Style.StyleKey);
local v2 = require(l_Parent_0.SharedFlags.getFFlagDevFrameworkAvoidSpawnInCreatePluginWidget);
return {
    FontStyle = {
        SemiBold = {
            Font = Enum.Font.SourceSansSemibold, 
            TextSize = 22, 
            TextColor = if v2() then v1.MainText else nil, 
            TextColor3 = if v2() then nil else v1.MainText
        }
    }, 
    ImageTypes = {
        "jpg", 
        "jpeg", 
        "png"
    }
};