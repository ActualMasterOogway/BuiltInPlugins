local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIAddSavePlaceCommand);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIAddCommandSearchInsertAsset);
local l_Commands_0 = l_script_FirstAncestor_0.Src.Commands;
local l_DisplayRichText_0 = l_Commands_0.DisplayRichText;
local l_DisplaySuggestions_0 = l_Commands_0.DisplaySuggestions;
local l_DisplayError_0 = l_Commands_0.DisplayError;
local l_QueueRichText_0 = l_Commands_0.QueueRichText;
local l_BuilderCommands_0 = l_Commands_0.BuilderCommands;
local l_Instantiate_0 = l_BuilderCommands_0.Instantiate;
local l_InsertAsset_0 = l_BuilderCommands_0.InsertAsset;
local l_SetProperty_0 = l_BuilderCommands_0.SetProperty;
local l_CreateMaterial_0 = l_BuilderCommands_0.CreateMaterial;
local l_SetMaterial_0 = l_BuilderCommands_0.SetMaterial;
local l_RemoveInstance_0 = l_BuilderCommands_0.RemoveInstance;
local l_CloneInstance_0 = l_BuilderCommands_0.CloneInstance;
local l_DisplayRegionAdornments_0 = l_BuilderCommands_0.DisplayRegionAdornments;
local l_DebugBulkPublishToInventory_0 = l_BuilderCommands_0.DebugBulkPublishToInventory;
local l_SetDraftMode_0 = l_BuilderCommands_0.SetDraftMode;
local l_RunDraftCommand_0 = l_BuilderCommands_0.RunDraftCommand;
local l_DebugSleep_0 = l_BuilderCommands_0.DebugSleep;
local l_RunCode_0 = l_BuilderCommands_0.RunCode;
local l_SavePlace_0 = l_BuilderCommands_0.SavePlace;
local l_SearchInsertAsset_0 = l_BuilderCommands_0.SearchInsertAsset;
return {
    DisplayRichText = {
        Command = require(l_DisplayRichText_0), 
        IsSequential = false, 
        IsPublic = false
    }, 
    DisplayError = {
        Command = require(l_DisplayError_0), 
        IsSequential = false, 
        IsPublic = false
    }, 
    DisplayRegionAdornments = {
        Command = require(l_DisplayRegionAdornments_0), 
        IsSequential = false, 
        IsPublic = false
    }, 
    Instantiate = {
        Command = require(l_Instantiate_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    InsertAsset = {
        Command = require(l_InsertAsset_0), 
        IsSequential = true, 
        IsPublic = true
    }, 
    SetProperty = {
        Command = require(l_SetProperty_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    QueueRichText = {
        Command = require(l_QueueRichText_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    CreateMaterial = {
        Command = require(l_CreateMaterial_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    SetMaterial = {
        Command = require(l_SetMaterial_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    DebugBulkPublishToInventory = {
        Command = require(l_DebugBulkPublishToInventory_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    DisplaySuggestions = {
        Command = require(l_DisplaySuggestions_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    RemoveInstance = {
        Command = require(l_RemoveInstance_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    CloneInstance = {
        Command = require(l_CloneInstance_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    SetDraftMode = {
        Command = require(l_SetDraftMode_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    RunDraftCommand = {
        Command = require(l_RunDraftCommand_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    DebugSleep = {
        Command = require(l_DebugSleep_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    RunCode = {
        Command = require(l_RunCode_0), 
        IsSequential = true, 
        IsPublic = false
    }, 
    SavePlace = if v1() then {
        Command = require(l_SavePlace_0), 
        IsSequential = true, 
        IsPublic = false
    } else nil, 
    SearchInsertAsset = if v2() then {
        Command = require(l_SearchInsertAsset_0), 
        IsSequential = true, 
        IsPublic = true
    } else nil
};