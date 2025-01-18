local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".ItemRow", {
    Size = UDim2.new(1, 0, 0, 50), 
    BackgroundColor3 = "$ForegroundMain", 
    BackgroundTransparency = 0
}, {
    l_createStyleRule_0(":hover", {
        BackgroundColor3 = "$ActionHover"
    }), 
    l_createStyleRule_0(".ContrastRow", {
        BackgroundColor3 = "$BackgroundPaper"
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$ActionHover"
        })
    }), 
    l_createStyleRule_0(".SelectedRow", {
        BackgroundColor3 = "$ActionSelected"
    }), 
    l_createStyleRule_0(".FocusedRow ::UIStroke", {
        ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
        Color = "$ActionFocusBorder", 
        Thickness = 1
    }), 
    l_createStyleRule_0(">> .ThumbnailContainer", {
        Size = UDim2.fromOffset(35, 35), 
        BackgroundColor3 = "$ForegroundContrast"
    }), 
    l_createStyleRule_0("> .ThumbnailPadding ::UIPadding", {
        PaddingLeft = UDim.new(0, 10)
    }), 
    l_createStyleRule_0(">> TextLabel", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 10), 
            PaddingRight = UDim.new(0, 10)
        })
    })
}, {
    ThumbnailSize = 35, 
    CellContentPadding = 10
});