public class RecordTypeContainer{

    private Schema.sObjectType baseType {get; set;}
    private static Map<String, Id> typeMap;

    public RecordTypeContainer(Schema.sObjectType baseType){
        this.baseType = baseType;
    }

    public void saveTypeMap(){
        typeMap = new Map<string, Id>();
        
        Map<string, RecordTypeInfo> rtis = baseType.getDescribe().getRecordTypeInfosByName();
        
        for(string name : rtis.keySet())
            typeMap.put(rtis.get(name).getName().toLowerCase(), rtis.get(name).getRecordTypeId());
        
    }

    public Id getRecordTypeId(string name){
        if(typeMap == null)
            saveTypeMap();

        Id ret = typeMap.get(name.toLowerCase());

        if(ret == null)
            throw new UnknownRecordTypeException();

        return ret;
    }
    
    public class UnknownRecordTypeException extends Exception{
    }
}
