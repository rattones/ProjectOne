public  class IntegrationService {
    private static final IntegrationService instancia = new IntegrationService();
    public static IntegrationService getInstance() {
        return instancia;
    }
    public class IntegrationServiceException extends Exception {	}

    public IntegrationService() {}


    public static HttpResponse st_executeHttpRequest(String endPoint, String method, Map<String, String> headers, String body, Integer timeout){
        return IntegrationService.getInstance().executeHttpRequest(endPoint,method, headers, body, timeout); 
    }
    public HttpResponse executeHttpRequest(String endPoint, String method, Map<String, String> headers, String body, Integer timeout){
		System.debug('START _____ executeHttpRequest');
        HttpRequest request = new HttpRequest();
        Http h = new Http();

		System.debug('START _____ executeHttpRequest.endPoint = ' + endPoint);
        try {

            request.setEndpoint(endPoint);
            request.setMethod(method);
            request.setTimeout(timeout);

            if(method == 'POST' || method == 'PUT' || method == 'PATCH')
                request.setBody(String.isNotBlank(body) ? body : '');
            else if(body != null)
                request.setBody(body);
            
            if(headers!=null){ 
                for(String nomeHeader : headers.keySet()){
                    request.setHeader(nomeHeader, headers.get(nomeHeader));
                }
            }
            System.debug('BODY ' + body);
            System.debug('HEADER '+headers);
            System.debug('EXECUTED REQUEST '+ request);
            System.debug('END _____ executeHttpRequest');
            return h.send(request);
        } catch (Exception e) {
            throw new IntegrationServiceException('Error on Send Request - '+e.getLineNumber()+' - '+ e.getMessage() +' - ' +e.getCause());
        }
    }
}
