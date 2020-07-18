function result = judgeFieldValue(StructIn, fieldName, value)

result = false;

%%
if isfield(StructIn, fieldName) && StructIn.(fieldName) == value
    result = true;
end

end