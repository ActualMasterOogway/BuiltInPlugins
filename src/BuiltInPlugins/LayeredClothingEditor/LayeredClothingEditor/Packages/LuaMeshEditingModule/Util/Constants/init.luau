local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Flags.getFFlagAvatarPreviewerCageEditingTools);
return {
    ControlPoint = {
        DefaultColor = Color3.new(0, 1, 1), 
        HoveredCenterColor = Color3.new(0, 1, 0), 
        HoveredColor = Color3.new(1, 1, 0), 
        SelectedColor = Color3.new(1, 1, 0), 
        SelectedColorNoWeight = Color3.new(1, 0, 0), 
        Size = v1() and 0.012 or 0.015
    }, 
    ControlEdge = {
        DefaultThickness = 2
    }, 
    ControlPointsFolderName = "MeshEditingModuleControlPoints", 
    ToolAdorneesFolderName = "MeshEditingModuleToolAdornees", 
    ControlPointsAdornmentsFolderName = "MeshEditingModuleControlPointsAdornments", 
    DefaultRadiusThickness = 3, 
    DefaultInnerRadiusThickness = 1, 
    FalloffCursorAdjustment = 0.7, 
    MinimumBrushRadius = 0.001, 
    VertexToolBase = {
        DefaultWireframeColor = Color3.fromRGB(140, 65, 168), 
        DefaultWireframeSegmentsColor = Color3.fromRGB(255, 165, 0)
    }
};