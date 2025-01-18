game:DefineFastFlag("AnnotationsModernColors", false);
game:DefineFastFlag("AnnotationsFocusTextBox", false);
game:DefineFastFlag("AnnotationsSubmitOnEnter", false);
game:DefineFastInt("AnnotationsMaxTextLength", 512);
return {
    fflagCOLLAB6176PlaceAnnotations = game:GetFastFlag("COLLAB6176PlaceAnnotations") and game:GetFastFlag("COLLAB6176PlaceAnnotationsStudio"), 
    fflagAnnotationsModernColors = game:GetFastFlag("AnnotationsModernColors"), 
    fflagAnnotationsMaxTextLength = game:GetFastInt("AnnotationsMaxTextLength"), 
    fflagPlaceAnnotationsHotkey = game:GetFastFlag("PlaceAnnotationsHotkey"), 
    fflagAnnotationsFocusTextBox = game:GetFastFlag("AnnotationsFocusTextBox"), 
    fflagAnnotationsSubmitOnEnter = game:GetFastFlag("AnnotationsSubmitOnEnter"), 
    fflagPlaceAnnotationsPublicRelease = game:GetFastFlag("PlaceAnnotationsPublicRelease")
};