@isTest
public class SearchCEPServiceTest {
    public SearchCEPServiceTest() {}

    @isTest
    public static void getJSONCEP() {
        StaticResourceCalloutMock mock= new  StaticResourceCalloutMock();
        mock.setStaticResource('ViaCep');
        mock.setStatusCode(200);
        mock.setHeader('Content-Type', 'application/json');
        Test.setMock(HttpCalloutMock.class, mock);
        // Test.startTest(); 
        CEPDTO.CEPResponse resp1= SearchCEPService.getInstance().searchCEP('35500085');
        // CEPDTO.CEPResponse resp2= SearchCEPService.getInstance().searchCEP('35500-085');
        // CEPDTO.CEPResponse resp3= SearchCEPService.getInstance().searchCEP('35500-a085');
        System.debug(resp1);
        // System.debug(resp2);
        // System.debug(resp3);

        System.assertEquals('35500-085', resp1.cep);
        System.assertEquals('Vila José Otaviano Elói', resp1.logradouro);
        System.assertEquals('', resp1.complemento);
        System.assertEquals('Santa Clara', resp1.bairro);
        System.assertEquals('Divinópolis', resp1.localidade);
        System.assertEquals('MG', resp1.uf);
        System.assertEquals('37', resp1.ddd);

    }
}
