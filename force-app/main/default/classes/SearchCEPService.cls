public class SearchCEPService {

    private static final SearchCEPService instance= new SearchCEPService();
    public static SearchCEPService getInstance() {
        return instance;
    }    

    public class SearchCEPServiceException extends Exception {}

    public SearchCEPService() {}

    public CEPDTO.CEPResponse searchCEP(String cep) {
        CEPDTO.CEPRequest request= new CEPDTO.CEPRequest(cep);
        CEPDTO.CEPResponse response= new CEPDTO.CEPResponse();

        IntegrationService iService= IntegrationService.getInstance();
        Integration__mdt integration= [SELECT Id, endPoint__c FROM Integration__mdt WHERE DeveloperName = 'ViaCep' limit 1];

        HttpResponse resp= iService.executeHttpRequest(integration.endPoint__c + request.cep + '/json', 'GET', null, null, 120000);
        String body= resp.getBody();
        response= response.parse(body);

        return response;
    }
}


// System.debug(SearchCEPService.getInstance().searchCEP('35500085'));