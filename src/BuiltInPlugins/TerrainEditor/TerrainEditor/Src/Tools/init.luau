local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
return {
    if require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature)() then require(script.RegionBuild) else nil, 
    require(script.RegionImport), 
    require(script.RegionGenerate), 
    require(script.Clear), 
    require(script.RegionSelect), 
    require(script.RegionTransform), 
    require(script.RegionFill), 
    require(script.RegionSeaLevel), 
    require(script.BrushDraw), 
    require(script.BrushSculpt), 
    require(script.BrushSmooth), 
    require(script.BrushPaint), 
    require(script.BrushFlatten), 
    require(script.Empty)
};