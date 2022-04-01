public class Utility {

    // private static final Utility instance= new Utility();
    // public static Utility getInstance() {
    //     return instance;
    // }

    // public static Utility util= new Utility();

    public Utility() {}

    public static String phoneNumberFormat(SObject obj, String field) {

        String phone= (String)obj.get(field);
        // System.debug(phone);
        if (phone == null) {
            return null;
        }

        Pattern phonePattern= Pattern.compile('^(\\+55){0,1}(-)*([0-9]{2})(-)*(9)*(-)*([0-9]{4})(-)*([0-9]{4})$');

        String phoneTest= phone.replaceAll('\\s', '');
        Matcher verifyPhone= phonePattern.matcher(phoneTest);

        if (!verifyPhone.matches()) {
            obj.addError(field, 'Invalid Phone number: '+phone);
        }

        phone= phonePattern.matcher(phone).replaceAll('$3$5$7$9');
        return phone;
    }

    public static String CEPFormat(SObject obj, String field) {
        String cep= (String)obj.get(field);
        // System.debug(cep);
        if (cep == null) {
            return null;
        }
        cep= Utility.CEPFormat(cep);
        if (cep == null) {
            obj.addError(field, 'Invalid CEP: '+cep);
            return null;
        }

        return cep;
    }
    public static String CEPFormat(String cep) {
        if (cep == null) {
            return null;
        }
        Pattern CEPPattern= Pattern.compile('^([0-9]{5})(-){0,1}([0-9]{0,3})');

        Matcher verifyCEP= CEPPattern.matcher(cep);

        if (!verifyCEP.matches()) {
            return null;
        }

        cep= (verifyCEP.replaceAll('$3') == '')? 
                    verifyCEP.replaceAll('$1000'): 
                    verifyCEP.replaceAll('$1$3');
        return cep;
    }

    public static String CPFMask(SObject obj, String field) {
        String cpf= (String)obj.get(field);

        if (cpf == null) {
            return null;
        }
        Pattern CPFPattern= Pattern.compile('^([0-9]{3})(\\.{0,1})([0-9]{3})(\\.{0,1})([0-9]{3})(-{0,1})([0-9]{2})$');

        Matcher  verifyCPF= CPFPattern.matcher(cpf);

        if (!verifyCPF.matches()) {
            obj.addError(field, 'Invalid CPF: '+cpf);
        }

        cpf= verifyCPF.replaceAll('$1.$3.$5-$7'); 
        return cpf;
    }
}
