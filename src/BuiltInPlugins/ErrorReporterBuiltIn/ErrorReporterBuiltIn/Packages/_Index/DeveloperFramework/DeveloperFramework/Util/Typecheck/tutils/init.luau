return require(script.Parent.Parent.strict)({
    checkListConsistency = require(script.checkListConsistency), 
    equalKey = require(script.equalKey), 
    fieldCount = require(script.fieldCount), 
    listDifferences = require(script.listDifferences), 
    print = require(script.print)(print), 
    shallowEqual = require(script.shallowEqual), 
    tableDifference = require(script.tableDifference), 
    toString = require(script.toString)
});