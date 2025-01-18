local l_Packages_0 = script.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.DraggerSchemaCore.DraggerSchema);
return {
    SelectionInfo = require(script.Parent.SelectionInfo), 
    BoundsChangedTracker = require(script.Parent.BoundsChangedTracker), 
    dispatchWorldClick = require(script.Parent.dispatchWorldClick), 
    MoveHandlesImplementation = require(script.Parent.MoveHandlesImplementation), 
    RotateHandlesImplementation = require(script.Parent.RotateHandlesImplementation), 
    FreeformDragger = require(script.Parent.FreeformDragger), 
    isExclusiveSelectable = v1.isExclusiveSelectable, 
    getMouseTarget = v1.getMouseTarget, 
    getNextSelectables = v1.getNextSelectables, 
    getSelectableWithCache = v1.getSelectableWithCache, 
    Selection = v1.Selection, 
    getSelectionBoxComponent = v1.getSelectionBoxComponent, 
    HoverEscapeDetector = v1.HoverEscapeDetector, 
    setHover = v1.setHover, 
    setActivePoint = v1.setActivePoint, 
    beginBoxSelect = v1.beginBoxSelect, 
    endBoxSelect = v1.endBoxSelect, 
    addUndoWaypoint = v1.addUndoWaypoint
};