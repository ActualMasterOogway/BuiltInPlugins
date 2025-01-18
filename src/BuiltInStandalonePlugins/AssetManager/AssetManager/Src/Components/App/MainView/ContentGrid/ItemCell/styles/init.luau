local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local l_createStyleRule_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.createStyleRule;
return l_createStyleRule_0(".ItemCell", {}, {
    l_createStyleRule_0("> .ThumbnailContainer", {
        BackgroundColor3 = "$ForegroundContrast", 
        BackgroundTransparency = 0
    }, {
        l_createStyleRule_0(":hover", {
            BackgroundColor3 = "$ActionHover"
        }), 
        l_createStyleRule_0(".SelectedCell", {
            BackgroundColor3 = "$ActionSelected"
        }), 
        l_createStyleRule_0(".FocusedCell ::UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = "$ActionFocusBorder", 
            Thickness = 1
        })
    }), 
    l_createStyleRule_0("> .TagContainer", {}, {
        l_createStyleRule_0("::UIPadding", {
            PaddingLeft = UDim.new(0, 5), 
            PaddingRight = UDim.new(0, 5), 
            PaddingTop = UDim.new(0, 5), 
            PaddingBottom = UDim.new(0, 10)
        })
    })
}, {
    ThumbnailSize = 50, 
    CellTagPadding = 5
});