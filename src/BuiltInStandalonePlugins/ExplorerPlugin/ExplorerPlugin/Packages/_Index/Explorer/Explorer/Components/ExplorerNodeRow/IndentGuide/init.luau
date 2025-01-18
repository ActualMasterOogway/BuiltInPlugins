local l_script_FirstAncestor_0 = script:FindFirstAncestor("Explorer");
local v1 = require(l_script_FirstAncestor_0.Util.Constants);
local v2 = require(l_script_FirstAncestor_0.Util.ImageUrl);
local _ = require(l_script_FirstAncestor_0.Util.Observable);
local v4 = require(l_script_FirstAncestor_0.Parent.React);
local _ = require(l_script_FirstAncestor_0.Hooks.useVisibleExplorerNodeRange);
local l_createElement_0 = v4.createElement;
return function(v7) --[[ Line: 15 ]] --[[ Name: IndentGuides ]]
    -- upvalues: l_createElement_0 (copy), v1 (copy), v2 (copy), v4 (copy)
    return l_createElement_0("ImageLabel", {
        BackgroundTransparency = 1, 
        LayoutOrder = v7.layoutOrder, 
        Size = v7.visibleNodeObservable.getBinding():map(function(v8) --[[ Line: 24 ]]
            -- upvalues: v1 (ref)
            return UDim2.new(0, v8.depth * v1.indentWidth, 1, 0);
        end), 
        Image = v2.standard("indentGuide"), 
        ScaleType = Enum.ScaleType.Tile, 
        TileSize = UDim2.new(0, v1.indentWidth, 1, 0), 
        [v4.Tag] = "Explorer-Content-Surface-Outline"
    });
end;