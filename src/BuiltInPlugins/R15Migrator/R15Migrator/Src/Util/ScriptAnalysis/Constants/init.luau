local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
return {
    StartKey = "start", 
    EndKey = "end", 
    CharacterLimit = 199987, 
    AttributeChunkNameBase = v1.AttributePrefix .. "ScriptBackupChunk", 
    AttributeChunkCountName = v1.AttributePrefix .. "ScriptBackupCount", 
    AttributeInitialIssueCountName = v1.AttributePrefix .. "InitialIssueCount", 
    AttributeUnificationScriptName = v1.AttributePrefix .. "UnificationScript", 
    ScriptStatus = {
        AutoConverted = "AutoConverted", 
        Complete = "Complete", 
        Reverted = "Reverted", 
        Warning = "Warning", 
        Error = "Error", 
        VariableError = "VariableError", 
        None = "None"
    }, 
    ReferenceKey = "Reference", 
    ScriptBackupTag = "R15MigratorScriptHasBackup"
};