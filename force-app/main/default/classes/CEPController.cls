public class CEPController {

    // private static final CEPController instance= new CEPController();
    // public static CEPController getInstance() {
    //     return instance;
    // }
    public static SearchCEPService  searchCep= new SearchCEPService();
    public class CEPControllerException extends Exception {}

    public CEPController() {}

    // não consegue usar no LWC e no VisualForce sem
    @AuraEnabled
    public static CEPDTO.CEPResponse findCEP(String cep) {
        try {
            // CEPDTO.CEPResponse resp= SearchCEPService.getInstance().searchCEP(cep);
            CEPDTO.CEPResponse resp= searchCep.searchCEP(cep);

            // return JSON.serialize(resp);
            return resp;
        } catch (CEPControllerException e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}

// System.debug(CEPController.findCEP('35500-085'));
