public class CEPDTO {
    public class CEPDTOException extends Exception {}

    public CEPDTO() {}

    public class CEPRequest {
        public String cep {get;set;}

        public CEPRequest(String cep) {
            this.cep= Utility.CEPFormat(cep);
        }
    }

    public class CEPResponse {
        @AuraEnabled public String cep {get;set;}
        @AuraEnabled public String logradouro {get;set;}
        @AuraEnabled public String complemento {get;set;}
        @AuraEnabled public String bairro {get;set;}
        @AuraEnabled public String localidade {get;set;}
        @AuraEnabled public String uf {get;set;}
        @AuraEnabled public String ddd {get;set;}

        public CEPResponse parse(String entrance) {
            CEPResponse cep= new CEPResponse();

            try {
                cep= (CEPResponse) JSON.deserialize(entrance, CEPResponse.class);
            } catch (Exception e) {
                throw new CEPDTOException('Error on CEPResponse.parse - '+e.getMessage());
            }

            return cep;
        }
    }
}
