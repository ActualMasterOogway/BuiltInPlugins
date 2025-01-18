local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_PathEditorRotation_0 = game:GetFastFlag("PathEditorRotation");
return v3.connect(function(v5, _) --[[ Line: 46 ]]
    return {
        SelectedObjectGui = v5.PathReducer.SelectedObjectGui
    };
end)(function(v7) --[[ Line: 15 ]] --[[ Name: GuiShim ]]
    -- upvalues: v2 (copy), l_PathEditorRotation_0 (copy)
    if v7.SelectedObjectGui == nil then
        return nil;
    else
        local v8 = nil;
        if v7.SelectedObjectGui:IsA("ScreenGui") then
            return (v2.createElement("ScreenGui", {
                ZIndexBehavior = v7.ZIndexBehavior, 
                DisplayOrder = v7.DisplayOrder
            }, v7.children));
        else
            if v7.SelectedObjectGui:IsA("SurfaceGui") then
                v8 = v2.createElement("SurfaceGui", {
                    ZIndexBehavior = v7.ZIndexBehavior, 
                    ZOffset = if l_PathEditorRotation_0 then nil else v7.SelectedObjectGui.ZOffset + if v7.DisplayOrder then v7.DisplayOrder else 0, 
                    AlwaysOnTop = true, 
                    Face = v7.SelectedObjectGui.Face, 
                    SizingMode = if l_PathEditorRotation_0 then v7.SelectedObjectGui.SizingMode else nil, 
                    PixelsPerStud = if l_PathEditorRotation_0 then v7.SelectedObjectGui.PixelsPerStud else nil, 
                    CanvasSize = if l_PathEditorRotation_0 then v7.SelectedObjectGui.CanvasSize else nil, 
                    Adornee = if v7.SelectedObjectGui.Adornee then v7.SelectedObjectGui.Adornee else v7.SelectedObjectGui.Parent
                }, v7.children);
            end;
            return v8;
        end;
    end;
end);