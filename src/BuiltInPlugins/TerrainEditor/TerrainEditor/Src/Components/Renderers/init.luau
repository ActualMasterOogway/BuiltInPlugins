local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorGenerationFeature);
return {
    BrushSize = require(script.BrushSize), 
    Button = require(script.Button), 
    ConfirmGeneration = if v1() then require(script.ConfirmGeneration) else nil, 
    DelayedSlider = if v1() then require(script.DelayedSlider) else nil, 
    Label = require(script.Label), 
    Image = require(script.Image), 
    Material = require(script.Material), 
    MaterialRanges = if v1() then require(script.MaterialRanges) else nil, 
    MultiSelection = require(script.MultiSelection), 
    PlaneLock = require(script.PlaneLock), 
    Seed = require(script.Seed), 
    TerrainType = require(script.TerrainType), 
    Upgrade = require(script.Upgrade)
};